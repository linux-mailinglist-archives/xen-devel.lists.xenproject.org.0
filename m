Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16571B0F16
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:59:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXtS-0000kB-Gd; Mon, 20 Apr 2020 14:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQXtQ-0000jn-Da
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:59:28 +0000
X-Inumbo-ID: 830acb48-8317-11ea-83d8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 830acb48-8317-11ea-83d8-bc764e2007e4;
 Mon, 20 Apr 2020 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587394760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iey7aibL2jSId8nqzu63DXwhMLLiDYRA4/Czvj4kpsU=;
 b=Tz2eeTLmy+8ziwN7Ijk6Gs9G5+fpGFOmK8aHg4VeKvlbQJ7PRD1iLlV3
 BW3IugEA6WBQus7IoyEX80Cn+n8zDromj15dV6WGv2hxBUsFYY654yyN4
 0LY0KkwKUyszXzbQmVF8N7oA7HIEFp32+yoPPJTYeFIZ1C2sJbGz/owl4 k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jXdlcSAfrcGp+tNv0XgzI+aOKK8aoY9xYgjNRJQHnFyinUhTe6OPol6afEd5ZXugydxkKShrUk
 Q+Ky74EnxbZt1muA2edI2lzxIGBrWzSJS2vSkIjHz50xYultnsXQ9r0XZP3wjNQIIZkqOEb/yz
 u4FYiBm4RZSO5P/Zvbul0qYUGBdHW53WLbgYffkqfc93uEmJRyHSKOihQfA8hDc3ngAS7jBSeR
 9HI5XPd4UiDBkx94FcmoIQwFbpVr/56hnQXGWvSZ0FRU9rweygq9gNlk+5cOM5VcHkhCKzClHb
 Tjc=
X-SBRS: 2.7
X-MesageID: 15928930
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="15928930"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/3] x86/pv: Don't use IST for NMI/#MC/#DB in !CONFIG_PV builds
Date: Mon, 20 Apr 2020 15:59:11 +0100
Message-ID: <20200420145911.5708-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200420145911.5708-1-andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

ISTs are used to force a stack switch on CPL0=>0 interrupts/exceptions.  They
however come with a nasty corner case in the case of reentrancy where the
outer exception frame gets clobbered.

When the SYSCALL/SYSRET instructions aren't used, there is no need to use IST
for anything other than #DF, which reduces the number of corner cases.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c       |  8 +++++---
 xen/include/asm-x86/processor.h | 12 +++++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 7b093cb421..d45495c701 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -732,15 +732,17 @@ void load_system_tables(void)
 		.rsp2 = 0x8600111111111111ul,
 
 		/*
-		 * MCE, NMI and Double Fault handlers get their own stacks.
+		 * #DF always uses a separate stack. NMI/#MC/#DB only need a
+		 * separate stacks when PV guests are used.
 		 * All others poisoned.
 		 */
 		.ist = {
-			[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE,
 			[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE,
+#ifdef CONFIG_PV
 			[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE,
+			[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE,
 			[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE,
-
+#endif
 			[IST_MAX ... ARRAY_SIZE(tss->ist) - 1] =
 				0x8600111111111111ul,
 		},
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index ea6e5497f4..33f2052c8e 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -441,12 +441,18 @@ struct tss_page {
 };
 DECLARE_PER_CPU(struct tss_page, tss_page);
 
+/*
+ * Interrupt Stack Tables.  Used to force a stack switch on a CPL0=>0
+ * interrupt/exception.  #DF uses IST all the time to detect stack overflows
+ * cleanly.  NMI/#MC/#DB only need IST to cover the SYSCALL gap, and therefore
+ * only necessary with PV guests.
+ */
 #define IST_NONE 0UL
 #define IST_DF   1UL
 #define IST_NMI  2UL
 #define IST_MCE  3UL
 #define IST_DB   4UL
-#define IST_MAX  4UL
+#define IST_MAX  (IS_ENABLED(CONFIG_PV) ? 4ul : 1ul)
 
 /* Set the Interrupt Stack Table used by a particular IDT entry. */
 static inline void set_ist(idt_entry_t *idt, unsigned int ist)
@@ -461,6 +467,8 @@ static inline void set_ist(idt_entry_t *idt, unsigned int ist)
 static inline void enable_each_ist(idt_entry_t *idt)
 {
     set_ist(&idt[TRAP_double_fault],  IST_DF);
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return;
     set_ist(&idt[TRAP_nmi],           IST_NMI);
     set_ist(&idt[TRAP_machine_check], IST_MCE);
     set_ist(&idt[TRAP_debug],         IST_DB);
@@ -469,6 +477,8 @@ static inline void enable_each_ist(idt_entry_t *idt)
 static inline void disable_each_ist(idt_entry_t *idt)
 {
     set_ist(&idt[TRAP_double_fault],  IST_NONE);
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return;
     set_ist(&idt[TRAP_nmi],           IST_NONE);
     set_ist(&idt[TRAP_machine_check], IST_NONE);
     set_ist(&idt[TRAP_debug],         IST_NONE);
-- 
2.11.0


