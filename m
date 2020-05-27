Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF221E4E0A
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aW-0004EE-D5; Wed, 27 May 2020 19:19:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aU-0004Cq-Pr
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:38 +0000
X-Inumbo-ID: f5699b3e-a04e-11ea-9947-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5699b3e-a04e-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 19:19:17 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3iRO9kwgKCNdvZIluTTdpAT/32WruaeuHu2KpnABpZyIvZ+Vr+VV4xpohS0xAvZrALgMKsTVd6
 tWXKr9ZjuXo8i8o3L8YyYuI0aquhbf2e7yM0Kw8dJUXJ7pt/sjFnQc0aH57p3BPAFYn/aHyq1G
 UPsZHVhzGAOR0+euvfSZAcCq7Or4hRjqb5HLesPc3oa/nqlHVoEtsOQU2lUYxXoZ4vGSdoAo4w
 //HwxzzZoOzhP67f1BplRf2QTfz9snO/vK1N00DpAP4VYboMCNwaeDFS7Y3yVNwxzNMo+nm0bi
 9d4=
X-SBRS: 2.7
X-MesageID: 18946803
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18946803"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 06/14] x86/shstk: Create shadow stacks
Date: Wed, 27 May 2020 20:18:39 +0100
Message-ID: <20200527191847.17207-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
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

Introduce HYPERVISOR_SHSTK pagetable constants, which are Read-Only + Dirty.
Use these in place of _PAGE_NONE for memguard_guard_stack().

Supervisor shadow stacks need a token written at the top, which is most easily
done before making the frame read only.

Allocate the shadow IST stack block in struct tss_page.  It doesn't strictly
need to live here, but it is a convenient location (and XPTI-safe, for testing
purposes), and placing it ahead of the TSS doesn't risk colliding with a bad
IO Bitmap offset and turning into some IO port permissions.

Have load_system_tables() set up the shadow IST stack table when setting up
the regular IST in the TSS.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Introduce IST_SHSTK_SIZE (Name subject to improvement).
 * Skip writing the shadow stack token for !XEN_SHSTK builds.
 * Tweak clobbering to be correct and safe.
---
 xen/arch/x86/cpu/common.c         | 24 ++++++++++++++++++++++++
 xen/arch/x86/mm.c                 | 25 +++++++++++++++++++++++--
 xen/include/asm-x86/config.h      |  2 ++
 xen/include/asm-x86/page.h        |  1 +
 xen/include/asm-x86/processor.h   |  3 ++-
 xen/include/asm-x86/x86_64/page.h |  1 +
 6 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 690fd8baa8..dcc9ee08de 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -769,6 +769,30 @@ void load_system_tables(void)
 	tss->rsp1 = 0x8600111111111111ul;
 	tss->rsp2 = 0x8600111111111111ul;
 
+	/* Set up the shadow stack IST. */
+	if (cpu_has_xen_shstk) {
+		volatile uint64_t *ist_ssp = this_cpu(tss_page).ist_ssp;
+
+		/*
+		 * Used entries must point at the supervisor stack token.
+		 * Unused entries are poisoned.
+		 *
+		 * This IST Table may be live, and the NMI/#MC entries must
+		 * remain valid on every instruction boundary, hence the
+		 * volatile qualifier.
+		 */
+		ist_ssp[0] = 0x8600111111111111ul;
+		ist_ssp[IST_MCE] = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8;
+		ist_ssp[IST_NMI] = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8;
+		ist_ssp[IST_DB]	 = stack_top + (IST_DB	* IST_SHSTK_SIZE) - 8;
+		ist_ssp[IST_DF]	 = stack_top + (IST_DF	* IST_SHSTK_SIZE) - 8;
+		for ( i = IST_DF + 1;
+		      i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
+			ist_ssp[i] = 0x8600111111111111ul;
+
+		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
+	}
+
 	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
 
 	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 2f1e716b6d..4d6d22cc41 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5994,12 +5994,33 @@ void memguard_unguard_range(void *p, unsigned long l)
 
 #endif
 
+static void write_sss_token(unsigned long *ptr)
+{
+    /*
+     * A supervisor shadow stack token is its own linear address, with the
+     * busy bit (0) clear.
+     */
+    *ptr = (unsigned long)ptr;
+}
+
 void memguard_guard_stack(void *p)
 {
-    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
+    /* IST Shadow stacks.  4x 1k in stack page 0. */
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+    {
+        write_sss_token(p + (IST_MCE * IST_SHSTK_SIZE) - 8);
+        write_sss_token(p + (IST_NMI * IST_SHSTK_SIZE) - 8);
+        write_sss_token(p + (IST_DB  * IST_SHSTK_SIZE) - 8);
+        write_sss_token(p + (IST_DF  * IST_SHSTK_SIZE) - 8);
+    }
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
 
+    /* Primary Shadow Stack.  1x 4k in stack page 5. */
     p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
-    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+        write_sss_token(p + PAGE_SIZE - 8);
+
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
 }
 
 void memguard_unguard_stack(void *p)
diff --git a/xen/include/asm-x86/config.h b/xen/include/asm-x86/config.h
index f3cf5df462..2ba234383d 100644
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -66,6 +66,8 @@
 #define STACK_ORDER 3
 #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
 
+#define IST_SHSTK_SIZE 1024
+
 #define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
 #define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
 #define WAKEUP_STACK_MIN        3072
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index 5acf3d3d5a..f632affaef 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -364,6 +364,7 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t);
                                    _PAGE_DIRTY | _PAGE_RW)
 #define __PAGE_HYPERVISOR_UCMINUS (__PAGE_HYPERVISOR | _PAGE_PCD)
 #define __PAGE_HYPERVISOR_UC      (__PAGE_HYPERVISOR | _PAGE_PCD | _PAGE_PWT)
+#define __PAGE_HYPERVISOR_SHSTK   (__PAGE_HYPERVISOR_RO | _PAGE_DIRTY)
 
 #define MAP_SMALL_PAGES _PAGE_AVAIL0 /* don't use superpages mappings */
 
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 8ab09cf7ed..859bd9e2ec 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -435,7 +435,8 @@ struct __packed tss64 {
     uint16_t :16, bitmap;
 };
 struct tss_page {
-    struct tss64 __aligned(PAGE_SIZE) tss;
+    uint64_t __aligned(PAGE_SIZE) ist_ssp[8];
+    struct tss64 tss;
 };
 DECLARE_PER_CPU(struct tss_page, tss_page);
 
diff --git a/xen/include/asm-x86/x86_64/page.h b/xen/include/asm-x86/x86_64/page.h
index 9876634881..26621f9519 100644
--- a/xen/include/asm-x86/x86_64/page.h
+++ b/xen/include/asm-x86/x86_64/page.h
@@ -171,6 +171,7 @@ static inline intpte_t put_pte_flags(unsigned int x)
 #define PAGE_HYPERVISOR_RW      (__PAGE_HYPERVISOR_RW      | _PAGE_GLOBAL)
 #define PAGE_HYPERVISOR_RX      (__PAGE_HYPERVISOR_RX      | _PAGE_GLOBAL)
 #define PAGE_HYPERVISOR_RWX     (__PAGE_HYPERVISOR         | _PAGE_GLOBAL)
+#define PAGE_HYPERVISOR_SHSTK   (__PAGE_HYPERVISOR_SHSTK   | _PAGE_GLOBAL)
 
 #define PAGE_HYPERVISOR         PAGE_HYPERVISOR_RW
 #define PAGE_HYPERVISOR_UCMINUS (__PAGE_HYPERVISOR_UCMINUS | \
-- 
2.11.0


