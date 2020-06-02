Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A71EB7DE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:06:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2rs-0003NQ-To; Tue, 02 Jun 2020 09:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Snlw=7P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jg2rr-0003NK-AT
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:05:55 +0000
X-Inumbo-ID: 43733ab4-a4b0-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43733ab4-a4b0-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:05:54 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kJuVVCqWaC1yKgF0MoFq3FN+IQNKhZXJa/N49pGfOOE/yUUZ4DCgg2cf5ie6lmdLvDW5SmXl+S
 ggcxJv+6eAPKZPrTRRWrHAj586Godgjp+LqQzKRw1EHueIin6j0i7JRjjpP5PllP653lyHJoPX
 JJPpefpzpElyLvM2r74A6mKV7ftrec8Xe6NgzzZfD2bCys5wCL8kMH2kKjgEz3LXMHV+v5y8hH
 9/VD+H/q56btrB9bIItjoBuTCQsZdKglxd9VoaCxytSQi7PaWrd0sciJiAHY5Vu33eohWWGjNg
 32U=
X-SBRS: 2.7
X-MesageID: 19253843
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,463,1583211600"; d="scan'208";a="19253843"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/cpu: fix build with clang 3.5
Date: Tue, 2 Jun 2020 11:05:36 +0200
Message-ID: <20200602090536.38064-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Clang 3.5 complains with:

common.c:794:24: error: statement expression not allowed at file scope
                      i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
                                     ^
/build/xen/include/asm/percpu.h:14:7: note: expanded from macro 'this_cpu'
    (*RELOC_HIDE(&per_cpu__##var, get_cpu_info()->per_cpu_offset))
      ^
/build/xen/include/xen/compiler.h:104:3: note: expanded from macro 'RELOC_HIDE'
  ({ unsigned long __ptr;                       \
  ^
/build/xen/include/xen/lib.h:68:69: note: expanded from macro 'ARRAY_SIZE'
#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
                                                                    ^
/build/xen/include/xen/compiler.h:85:57: note: expanded from macro '__must_be_array'
  BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
                                                        ^
/build/xen/include/xen/lib.h:39:57: note: expanded from macro 'BUILD_BUG_ON_ZERO'
#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
                                                        ^

Workaround this by defining the tss_page as a local variable. Adjust
other users of the per-cpu tss_page to also use the newly introduced
local variable.

No functional change expected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 58f0876180..da74172776 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -738,9 +738,14 @@ void load_system_tables(void)
 	unsigned int i, cpu = smp_processor_id();
 	unsigned long stack_bottom = get_stack_bottom(),
 		stack_top = stack_bottom & ~(STACK_SIZE - 1);
+	/*
+	 * NB: define tss_page as a local variable because clang 3.5 doesn't
+	 * support using ARRAY_SIZE against per-cpu variables.
+	 */
+	struct tss_page *tss_page = &this_cpu(tss_page);
 
 	/* The TSS may be live.	 Disuade any clever optimisations. */
-	volatile struct tss64 *tss = &this_cpu(tss_page).tss;
+	volatile struct tss64 *tss = &tss_page->tss;
 	seg_desc_t *gdt =
 		this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
 
@@ -783,15 +788,14 @@ void load_system_tables(void)
 	 * volatile qualifier.
 	 */
 	if (cpu_has_xen_shstk) {
-		volatile uint64_t *ist_ssp = this_cpu(tss_page).ist_ssp;
+		volatile uint64_t *ist_ssp = tss_page->ist_ssp;
 
 		ist_ssp[0] = 0x8600111111111111ul;
 		ist_ssp[IST_MCE] = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8;
 		ist_ssp[IST_NMI] = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8;
 		ist_ssp[IST_DB]	 = stack_top + (IST_DB	* IST_SHSTK_SIZE) - 8;
 		ist_ssp[IST_DF]	 = stack_top + (IST_DF	* IST_SHSTK_SIZE) - 8;
-		for ( i = IST_DF + 1;
-		      i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
+		for ( i = IST_DF + 1; i < ARRAY_SIZE(tss_page->ist_ssp); ++i )
 			ist_ssp[i] = 0x8600111111111111ul;
 
 		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
-- 
2.26.2


