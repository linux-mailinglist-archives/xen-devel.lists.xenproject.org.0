Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D7F1ADC3D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 13:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPPGT-0001BW-6J; Fri, 17 Apr 2020 11:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPPGR-0001BR-F0
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 11:34:31 +0000
X-Inumbo-ID: 6651cde6-809f-11ea-8cbb-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6651cde6-809f-11ea-8cbb-12813bfff9fa;
 Fri, 17 Apr 2020 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587123270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CJQ4tzDi8UqH0BYulrbZ/8izM1++NozR47DTHe8h3R8=;
 b=UPwGCNBWKiz0CKGRUrX6rsId3LPfUOLbr9Lbro3EYQCoI9WYqgn92ZpE
 9Z+Ee8pMBSRpD7RB4jbnjPZToDmsARqSgfcfNhH3+lJPpPsBjXLgoPzkE
 +2JDm+A3/3ccOwKCFh3FFGGpxsJ84f/QXseCztYoMWFzyxarf7lb+Yq+Y w=;
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
IronPort-SDR: jcB7hJmVDX7TvsIWbVMbGsHlJY3aoaZkCunwTnfWTRqvardxXYhOvvE0GosgBcsVIAjXTdWY4G
 13cNUTUAPM9v+POt4Sqp+zaP/tgifpwCP3yEEkf6vVa1Y/qp92au+yV68Z4/yaru8Rt77KCeF/
 IyId2t+sBoJM1Ohqd8ZKQQVxN2dJx5TvgUa4WbwTwp16H4wHb68S2SJT5msei2jPhZwUfaTeBz
 5Hc+4HL8BFdfs3/0LAuyuzpVqQ65NP2YC0M0zXUZfSwRlYYIj7lCX9VQ7+ZIFJy++jqLe2yUw/
 tDk=
X-SBRS: 2.7
X-MesageID: 15820357
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,394,1580792400"; d="scan'208";a="15820357"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/pv: Delete CONFIG_PV_LDT_PAGING
Date: Fri, 17 Apr 2020 12:34:23 +0100
Message-ID: <20200417113423.19057-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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

... in accordance with the timeline layed out in the Kconfig message.  There
has been no comment since it was disabled by default.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig                | 23 -----------------------
 xen/arch/x86/mm.c                   | 31 -------------------------------
 xen/arch/x86/pv/descriptor-tables.c | 15 ---------------
 xen/arch/x86/pv/domain.c            |  4 ----
 xen/arch/x86/pv/mm.c                |  9 ---------
 xen/include/asm-x86/domain.h        |  6 ------
 6 files changed, 88 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 8149362bde..a69be983d6 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -225,26 +225,3 @@ endmenu
 source "common/Kconfig"
 
 source "drivers/Kconfig"
-
-menu "Deprecated Functionality"
-
-config PV_LDT_PAGING
-	bool "PV LDT Paging-out support"
-	depends on PV
-	---help---
-	  For a very long time, the PV ABI has included the ability to page
-	  out the LDT by transitioning its mapping to not-present.  This
-	  functionality is believed to only exist for the PV Windows XP port
-	  which never came to anything.
-
-	  The implementation contains a vCPU scalability limitation in a
-	  position which is prohibitively complicated to resolve.  As the
-	  feature is believed to be unused in practice, removing the feature
-	  is the easiest remediation.
-
-	  If you discover a usecase which is broken by this option being off,
-	  please contact xen-devel@lists.xenproject.org urgently.  Baring
-	  something unexpected, the code and this option will be deleted 2
-	  releases after Xen 4.12.
-
-endmenu
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fb53d62abc..ee56e053e1 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1251,40 +1251,9 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
      */
     if ( (l1e_get_flags(l1e) & _PAGE_RW) &&
          ((l1e_owner == pg_owner) || !paging_mode_external(pg_owner)) )
-    {
         put_page_and_type(page);
-    }
     else
-    {
-#ifdef CONFIG_PV_LDT_PAGING
-        /* We expect this is rare so we blow the entire shadow LDT. */
-        if ( unlikely(((page->u.inuse.type_info & PGT_type_mask) ==
-                       PGT_seg_desc_page)) &&
-             unlikely(((page->u.inuse.type_info & PGT_count_mask) != 0)) &&
-             (l1e_owner == pg_owner) )
-        {
-            struct vcpu *v;
-            cpumask_t *mask = this_cpu(scratch_cpumask);
-
-            cpumask_clear(mask);
-
-            for_each_vcpu ( pg_owner, v )
-            {
-                unsigned int cpu;
-
-                if ( !pv_destroy_ldt(v) )
-                    continue;
-                cpu = read_atomic(&v->dirty_cpu);
-                if ( is_vcpu_dirty_cpu(cpu) )
-                    __cpumask_set_cpu(cpu, mask);
-            }
-
-            if ( !cpumask_empty(mask) )
-                flush_tlb_mask(mask);
-        }
-#endif /* CONFIG_PV_LDT_PAGING */
         put_page(page);
-    }
 }
 
 #ifdef CONFIG_PV
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 940804b18a..090f901b5b 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -37,14 +37,7 @@ bool pv_destroy_ldt(struct vcpu *v)
 
     ASSERT(!in_irq());
 
-#ifdef CONFIG_PV_LDT_PAGING
-    spin_lock(&v->arch.pv.shadow_ldt_lock);
-
-    if ( v->arch.pv.shadow_ldt_mapcnt == 0 )
-        goto out;
-#else
     ASSERT(v == current || !vcpu_cpu_dirty(v));
-#endif
 
     pl1e = pv_ldt_ptes(v);
 
@@ -62,14 +55,6 @@ bool pv_destroy_ldt(struct vcpu *v)
         put_page_and_type(page);
     }
 
-#ifdef CONFIG_PV_LDT_PAGING
-    ASSERT(v->arch.pv.shadow_ldt_mapcnt == mappings_dropped);
-    v->arch.pv.shadow_ldt_mapcnt = 0;
-
- out:
-    spin_unlock(&v->arch.pv.shadow_ldt_lock);
-#endif
-
     return mappings_dropped;
 }
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 70fae43965..43da5c179f 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -243,10 +243,6 @@ int pv_vcpu_initialise(struct vcpu *v)
 
     ASSERT(!is_idle_domain(d));
 
-#ifdef CONFIG_PV_LDT_PAGING
-    spin_lock_init(&v->arch.pv.shadow_ldt_lock);
-#endif
-
     rc = pv_create_gdt_ldt_l1tab(v);
     if ( rc )
         return rc;
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 2b0dadc8da..5d4cd00941 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -123,17 +123,8 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
     pl1e = &pv_ldt_ptes(curr)[offset >> PAGE_SHIFT];
     l1e_add_flags(gl1e, _PAGE_RW);
 
-#ifdef CONFIG_PV_LDT_PAGING
-    spin_lock(&curr->arch.pv.shadow_ldt_lock);
-#endif
-
     l1e_write(pl1e, gl1e);
 
-#ifdef CONFIG_PV_LDT_PAGING
-    curr->arch.pv.shadow_ldt_mapcnt++;
-    spin_unlock(&curr->arch.pv.shadow_ldt_lock);
-#endif
-
     return true;
 }
 
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 4192c636b1..554b8dddcc 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -520,12 +520,6 @@ struct pv_vcpu
     unsigned int iopl;        /* Current IOPL for this VCPU, shifted left by
                                * 12 to match the eflags register. */
 
-#ifdef CONFIG_PV_LDT_PAGING
-    /* Current LDT details. */
-    unsigned long shadow_ldt_mapcnt;
-    spinlock_t shadow_ldt_lock;
-#endif
-
     /*
      * %dr7 bits the guest has set, but aren't loaded into hardware, and are
      * completely emulated.
-- 
2.11.0


