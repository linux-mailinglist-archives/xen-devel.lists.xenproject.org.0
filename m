Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB2C1C2108
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUecd-0007w6-7b; Fri, 01 May 2020 22:59:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecc-0007vF-31
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:06 +0000
X-Inumbo-ID: 57d17eb8-8bff-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57d17eb8-8bff-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 22:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rL/dG5kGKiStpqKmDj82L3vvn9kv06+Bf9qYwu7T+rE=;
 b=Kn9cZ2YJBdhJQbkjLexIclJ/3Dm+uFcV1T7SZRyiX/XxGRUW1T0CE2kJ
 qGXbDyvdkHwc9bEp+KTrQ2z2lJLmA+goxswBKWNgIiYa0Aq+4VMPX9WrB
 ISb3v7cQKDPMvqBBZY2rHigt8UD5kC3ioFYm0cMvwnub1cQjPrnWmzdhB 0=;
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
IronPort-SDR: zm/Rio6/a5ZOg6ZjO8FJSzE8qGDSpCwuHsz559zCVgwOpMbAVIWa+S+s+4hHf9z7aT2FUR1wds
 j8hzds/+dTrTjpEaIXPADLOAMqt3yRyHmm9A0LnVkHmhpXigbIKGdELb900ETMHcpI+qyFOeGA
 58gpwwWRCnlpY1OeCdntVjVcMg2aq4AC/6YmnP7hHHHxJ2IXmCoK/j4lBT7MWB0mM2EtG93O09
 DkbCoFQgm5gIq7A0Q4kz3bgf1EJRMWgsE5KCpUVrZsfjWyGjgLhB3oFrNAA/yQlvLBrqvQhX/0
 CVo=
X-SBRS: 2.7
X-MesageID: 16584676
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16584676"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 08/16] x86/shstk: Create shadow stacks
Date: Fri, 1 May 2020 23:58:30 +0100
Message-ID: <20200501225838.9866-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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
purposes).

Have load_system_tables() set up the shadow IST stack table when setting up
the regular IST in the TSS.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c         | 19 +++++++++++++++++++
 xen/arch/x86/mm.c                 | 22 +++++++++++++++++++---
 xen/include/asm-x86/page.h        |  1 +
 xen/include/asm-x86/processor.h   |  3 ++-
 xen/include/asm-x86/x86_64/page.h |  1 +
 5 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 290f9f1c30..3962717aa5 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -748,6 +748,25 @@ void load_system_tables(void)
 		.bitmap = IOBMP_INVALID_OFFSET,
 	};
 
+	/* Set up the shadow stack IST. */
+	if ( cpu_has_xen_shstk ) {
+		unsigned int i;
+		uint64_t *ist_ssp = this_cpu(tss_page).ist_ssp;
+
+		/* Must point at the supervisor stack token. */
+		ist_ssp[IST_MCE] = stack_top + (IST_MCE * 0x400) - 8;
+		ist_ssp[IST_NMI] = stack_top + (IST_NMI * 0x400) - 8;
+		ist_ssp[IST_DB]  = stack_top + (IST_DB  * 0x400) - 8;
+		ist_ssp[IST_DF]  = stack_top + (IST_DF  * 0x400) - 8;
+
+		/* Poision unused entries. */
+		for ( i = IST_MAX;
+		      i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
+			ist_ssp[i] = 0x8600111111111111ul;
+
+		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
+	}
+
 	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
 
 	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bc44d865ef..4e2c3c9735 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6000,12 +6000,28 @@ void memguard_unguard_range(void *p, unsigned long l)
 
 #endif
 
-void memguard_guard_stack(void *p)
+static void write_sss_token(unsigned long *ptr)
 {
-    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
+    /*
+     * A supervisor shadow stack token is its own linear address, with the
+     * busy bit (0) clear.
+     */
+    *ptr = (unsigned long)ptr;
+}
 
+void memguard_guard_stack(void *p)
+{
+    /* IST Shadow stacks.  4x 1k in stack page 0. */
+    write_sss_token(p + 0x3f8);
+    write_sss_token(p + 0x7f8);
+    write_sss_token(p + 0xbf8);
+    write_sss_token(p + 0xff8);
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
+
+    /* Primary Shadow Stack.  1x 4k in stack page 5. */
     p += 5 * PAGE_SIZE;
-    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
+    write_sss_token(p + 0xff8);
+    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
 }
 
 void memguard_unguard_stack(void *p)
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
index f7e80d12e4..54e1a8b605 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -434,7 +434,8 @@ struct __packed tss64 {
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


