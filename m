Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEA01E42EB
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 15:06:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdvla-000317-Dj; Wed, 27 May 2020 13:06:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jdvlY-000312-RR
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 13:06:40 +0000
X-Inumbo-ID: e6be261a-a01a-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6be261a-a01a-11ea-8993-bc764e2007e4;
 Wed, 27 May 2020 13:06:39 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3bVAu9sXs27VQ/uE6l96fuNeL8FVmemCrw9I2Aj1uF3PqkLV095CwOOqqTkG7fDUWnvb0ACZEM
 XuGJaPOGspcFB/dmf4dUAG4qkJXSLICYTbVf+mByAjlE8X/qz9541EoyhQcRLJAne8869trGqu
 oh8pr4varGcZFxKoTmcREJ6jrleEKxQHSaBXcLcXQWIzf32alfAofYDUx8ofNh3sHXrF077hh3
 LITD8ha08ElXDQRg1admQv4F5A2edbUN9/5Kj8YKnsDgwM8u+Wo1JKwYNEBIXWggZkvobX5qPX
 ZAk=
X-SBRS: 2.7
X-MesageID: 19289677
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,441,1583211600"; d="scan'208";a="19289677"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/boot: Fix load_system_tables() to be NMI/#MC-safe
Date: Wed, 27 May 2020 14:06:07 +0100
Message-ID: <20200527130607.32069-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

During boot, load_system_tables() is used in reinit_bsp_stack() to switch the
virtual addresses used from their .data/.bss alias, to their directmap alias.

The structure assignment is implemented as a memset() to zero first, then a
copy-in of the new data.  This causes the NMI/#MC stack pointers to
transiently become 0, at a point where we may have an NMI watchdog running.

Rewrite the logic using a volatile tss pointer (equivalent to, but more
readable than, using ACCESS_ONCE() for all writes).

This does drop the zeroing side effect for holes in the structure, but the
backing memory for the TSS is fully zeroed anyway, and architecturally, they
are all reserved.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

This wants backporting a fairly long way, technically to Xen 4.6.
---
 xen/arch/x86/cpu/common.c | 49 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 3e0d9cbe98..a78b796fe5 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -703,11 +703,12 @@ static cpumask_t cpu_initialized;
  */
 void load_system_tables(void)
 {
-	unsigned int cpu = smp_processor_id();
+	unsigned int i, cpu = smp_processor_id();
 	unsigned long stack_bottom = get_stack_bottom(),
 		stack_top = stack_bottom & ~(STACK_SIZE - 1);
 
-	struct tss64 *tss = &this_cpu(tss_page).tss;
+	/* The TSS may be live.	 Disuade any clever optimisations. */
+	volatile struct tss64 *tss = &this_cpu(tss_page).tss;
 	seg_desc_t *gdt =
 		this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
 
@@ -720,30 +721,26 @@ void load_system_tables(void)
 		.limit = (IDT_ENTRIES * sizeof(idt_entry_t)) - 1,
 	};
 
-	*tss = (struct tss64){
-		/* Main stack for interrupts/exceptions. */
-		.rsp0 = stack_bottom,
-
-		/* Ring 1 and 2 stacks poisoned. */
-		.rsp1 = 0x8600111111111111ul,
-		.rsp2 = 0x8600111111111111ul,
-
-		/*
-		 * MCE, NMI and Double Fault handlers get their own stacks.
-		 * All others poisoned.
-		 */
-		.ist = {
-			[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE,
-			[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE,
-			[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE,
-			[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE,
-
-			[IST_MAX ... ARRAY_SIZE(tss->ist) - 1] =
-				0x8600111111111111ul,
-		},
-
-		.bitmap = IOBMP_INVALID_OFFSET,
-	};
+	/*
+	 * Set up the TSS.  Warning - may be live, and the NMI/#MC must remain
+	 * valid on every instruction boundary.  (Note: these are all
+	 * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
+	 *
+	 * rsp0 refers to the primary stack.  #MC, #DF, NMI and #DB handlers
+	 * each get their own stacks.  No IO Bitmap.
+	 */
+	tss->rsp0 = stack_bottom;
+	tss->ist[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE;
+	tss->ist[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE;
+	tss->ist[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE;
+	tss->ist[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE;
+	tss->bitmap = IOBMP_INVALID_OFFSET;
+
+	/* All other stack pointers poisioned. */
+	for ( i = IST_MAX; i < ARRAY_SIZE(tss->ist); ++i )
+		tss->ist[i] = 0x8600111111111111ul;
+	tss->rsp1 = 0x8600111111111111ul;
+	tss->rsp2 = 0x8600111111111111ul;
 
 	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
 
-- 
2.11.0


