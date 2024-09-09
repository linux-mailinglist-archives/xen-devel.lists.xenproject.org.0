Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F72971A89
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794460.1203409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneDx-0001jg-EH; Mon, 09 Sep 2024 13:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794460.1203409; Mon, 09 Sep 2024 13:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneDx-0001ht-BA; Mon, 09 Sep 2024 13:14:33 +0000
Received: by outflank-mailman (input) for mailman id 794460;
 Mon, 09 Sep 2024 13:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sneDv-0001hn-P9
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:14:31 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72acf200-6ead-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 15:14:30 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3c3b63135so4558591a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:14:30 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46733sm2980596a12.27.2024.09.09.06.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:14:28 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 72acf200-6ead-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725887669; x=1726492469; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8kRPoL5Gf6EUDP1QcXTZw3ILK8ueayA3HtRrbf3lwE=;
        b=VgVqtVbshO1Tt+3tnx6d7PVXbtZU/T7ZfPiIWb3xpkSzej6w7iFiDgmVMgm8DnfczC
         nH40e97UzRKKIDRvqBqZcUTB4hAxflKkqW3nYSuFH+gy/LyBue361bOUIoQixv4p4EBM
         aWTUTNz7xznov0TnCAIZ9V2aIMmDd3QCNzaaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887669; x=1726492469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8kRPoL5Gf6EUDP1QcXTZw3ILK8ueayA3HtRrbf3lwE=;
        b=dLkgCdSYbS88Cz5VP7L+NZrzBDjhLb7nk8R7b71FvliksoBmq4T8BvJIduZ9cPmKs5
         G7tDMlWnLcK63AW/FnAu278njBUWt5nVeavwe6M4tP4YFVhMFHxIV10HO07GH4e5tXq0
         zWZ9jmG62P0M8LylHd9P9cq1TkXWkMkxMQzH996et51s8YcxSS7IA/s5jF1ecpff0gCk
         gxIXTCZApCwuIc2Bg65O14OO7APopXc312uiyabc6phUgpC1NAN1mFan9jlNM8RFHGOd
         +5WTs3gdGc8mv328jlOwjybyxDVwgx6XjF0yJSUCHw0kGuzjo1wGxZCsKh2IqQPVRa0W
         JNjA==
X-Gm-Message-State: AOJu0Yw9nGMEG2gH8cUXiX7F4OMzOr1jTpW7RFwLojCE0VLEPB87x5W9
	lm5vZ6sgHuZdNYlBeLrQDzYyD7RzdIVZxDNnN4y0N2anqRo5jkIssJaDXrbalXE19rKlbYL+gOS
	p
X-Google-Smtp-Source: AGHT+IFoht/C561SL21GGCvYiKETLCDdEc3yBilJgZEcNydBT29qHRMd2yf18awTD76HzXj9P8XYyA==
X-Received: by 2002:a05:6402:50c9:b0:5c2:4cbe:ac33 with SMTP id 4fb4d7f45d1cf-5c3dc784a9fmr8077596a12.2.1725887669217;
        Mon, 09 Sep 2024 06:14:29 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2] mm: Unify PRI_gfn and PRI_mfn macros
Date: Mon,  9 Sep 2024 14:14:19 +0100
Message-Id: <20240909131419.127276-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always format with no padding and hex prefix, if needed.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/arm/mmu/p2m.c               |  4 ++--
 xen/arch/arm/mmu/pt.c                |  2 +-
 xen/arch/arm/p2m.c                   |  6 +++---
 xen/arch/arm/static-shmem.c          |  2 +-
 xen/arch/x86/hvm/viridian/viridian.c |  4 ++--
 xen/arch/x86/mm/p2m.c                |  2 +-
 xen/arch/x86/mm/shadow/common.c      |  2 +-
 xen/arch/x86/traps.c                 |  2 +-
 xen/common/grant_table.c             | 18 +++++++++---------
 xen/common/memory.c                  |  4 ++--
 xen/drivers/passthrough/x86/iommu.c  |  4 ++--
 xen/include/xen/mm-frame.h           |  4 ++--
 12 files changed, 27 insertions(+), 27 deletions(-)
---
Changes since v1:
- unify entirely the format, not just some minor fixes.

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1725cca649..dfc7c4bfa6 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -184,7 +184,7 @@ void dump_p2m_lookup(struct domain *d, paddr_t addr)
 
     printk("dom%d IPA 0x%"PRIpaddr"\n", d->domain_id, addr);
 
-    printk("P2M @ %p mfn:%#"PRI_mfn"\n",
+    printk("P2M @ %p mfn:%"PRI_mfn"\n",
            p2m->root, mfn_x(page_to_mfn(p2m->root)));
 
     dump_pt_walk(page_to_maddr(p2m->root), addr,
@@ -1621,7 +1621,7 @@ int relinquish_p2m_mapping(struct domain *d)
                                  p2m_invalid, p2m_access_rwx);
             if ( unlikely(rc) )
             {
-                printk(XENLOG_G_ERR "Unable to remove mapping gfn=%#"PRI_gfn" order=%u from the p2m of domain %d\n", gfn_x(start), order, d->domain_id);
+                printk(XENLOG_G_ERR "Unable to remove mapping gfn=%"PRI_gfn" order=%u from the p2m of domain %d\n", gfn_x(start), order, d->domain_id);
                 break;
             }
         }
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index da28d669e7..92d7848acb 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -362,7 +362,7 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
         if ( lpae_is_valid(entry) )
         {
             if ( lpae_is_mapping(entry, level) )
-                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
+                mm_printk("Changing MFN for a valid entry is not allowed (%"PRI_mfn" -> %"PRI_mfn").\n",
                           mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
             else
                 mm_printk("Trying to replace a table with a mapping.\n");
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 2465c266e9..add547fe3e 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -196,7 +196,7 @@ int map_dev_mmio_page(struct domain *d, gfn_t gfn, mfn_t mfn)
     res = p2m_insert_mapping(d, gfn, 1, mfn, p2m_mmio_direct_c);
     if ( res < 0 )
     {
-        printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" in %pd\n",
+        printk(XENLOG_G_ERR "Unable to map MFN %"PRI_mfn" in %pd\n",
                mfn_x(mfn), d);
         return res;
     }
@@ -566,7 +566,7 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
 
     if ( !mfn_valid(mfn) )
     {
-        dprintk(XENLOG_G_DEBUG, "%pv: Invalid MFN %#"PRI_mfn"\n",
+        dprintk(XENLOG_G_DEBUG, "%pv: Invalid MFN %"PRI_mfn"\n",
                 v, mfn_x(mfn));
         return NULL;
     }
@@ -576,7 +576,7 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
 
     if ( unlikely(!get_page(page, d)) )
     {
-        dprintk(XENLOG_G_DEBUG, "%pv: Failing to acquire the MFN %#"PRI_mfn"\n",
+        dprintk(XENLOG_G_DEBUG, "%pv: Failing to acquire the MFN %"PRI_mfn"\n",
                 v, mfn_x(maddr_to_mfn(maddr)));
         return NULL;
     }
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index aa80756c3c..6e6574b271 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -357,7 +357,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             for ( i = 0; i < PFN_DOWN(psize); i++ )
                 if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
                 {
-                    printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
+                    printk("%pd: invalid physical address %"PRI_mfn"\n",
                         d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
                     return -EINVAL;
                 }
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 21480d9ee7..5d6951e8dc 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -279,7 +279,7 @@ static void enable_hypercall_page(struct domain *d)
     {
         if ( page )
             put_page(page);
-        gdprintk(XENLOG_WARNING, "Bad GMFN %#"PRI_gfn" (MFN %#"PRI_mfn")\n",
+        gdprintk(XENLOG_WARNING, "Bad GMFN %"PRI_gfn" (MFN %"PRI_mfn")\n",
                  gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN));
         return;
     }
@@ -1090,7 +1090,7 @@ void viridian_map_guest_page(struct domain *d, struct viridian_page *vp)
     return;
 
  fail:
-    gdprintk(XENLOG_WARNING, "Bad GMFN %#"PRI_gfn" (MFN %#"PRI_mfn")\n",
+    gdprintk(XENLOG_WARNING, "Bad GMFN %"PRI_gfn" (MFN %"PRI_mfn")\n",
              gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN));
 }
 
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 1739133fc2..adee424c9c 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1066,7 +1066,7 @@ static int set_typed_p2m_entry(struct domain *d, unsigned long gfn_l,
     rc = p2m_set_entry(p2m, gfn, mfn, order, gfn_p2mt, access);
     if ( unlikely(rc) )
     {
-        gdprintk(XENLOG_ERR, "p2m_set_entry: %#lx:%u -> %d (0x%"PRI_mfn")\n",
+        gdprintk(XENLOG_ERR, "p2m_set_entry: %#lx:%u -> %d (%"PRI_mfn")\n",
                  gfn_l, order, rc, mfn_x(mfn));
 
         /*
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 0176e33bc9..b01539a782 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2585,7 +2585,7 @@ pagetable_t sh_set_toplevel_shadow(struct vcpu *v,
 
  install_new_entry:
     /* Done.  Install it */
-    SHADOW_PRINTK("%u [%u] gmfn %#"PRI_mfn" smfn %#"PRI_mfn"\n",
+    SHADOW_PRINTK("%u [%u] gmfn %"PRI_mfn" smfn %"PRI_mfn"\n",
                   v->arch.paging.mode->shadow.shadow_levels, slot,
                   mfn_x(gmfn), mfn_x(pagetable_get_mfn(new_entry)));
     v->arch.paging.shadow.shadow_table[slot] = new_entry;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 708136f625..7013fc6a7b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1034,7 +1034,7 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val)
             }
 
             gdprintk(XENLOG_WARNING,
-                     "Bad GMFN %lx (MFN %#"PRI_mfn") to MSR %08x\n",
+                     "Bad GMFN %lx (MFN %"PRI_mfn") to MSR %08x\n",
                      gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN), base);
             return X86EMUL_EXCEPTION;
         }
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ab36f45ded..2a5c3e2fe1 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1164,7 +1164,7 @@ map_grant_ref(
         if ( !iomem_access_permitted(rd, mfn_x(mfn), mfn_x(mfn)) )
         {
             gdprintk(XENLOG_WARNING,
-                     "Iomem mapping not permitted %#"PRI_mfn" (domain %d)\n",
+                     "Iomem mapping not permitted %"PRI_mfn" (domain %d)\n",
                      mfn_x(mfn), rd->domain_id);
             rc = GNTST_general_error;
             goto undo_out;
@@ -1223,7 +1223,7 @@ map_grant_ref(
     {
     could_not_pin:
         if ( !rd->is_dying )
-            gdprintk(XENLOG_WARNING, "Could not pin grant frame %#"PRI_mfn"\n",
+            gdprintk(XENLOG_WARNING, "Could not pin grant frame %"PRI_mfn"\n",
                      mfn_x(mfn));
         rc = GNTST_general_error;
         goto undo_out;
@@ -1848,7 +1848,7 @@ gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
             if ( rc )
             {
                 gprintk(XENLOG_ERR,
-                        "Could not remove status frame %u (GFN %#lx) from P2M\n",
+                        "Could not remove status frame %u (GFN %"PRI_gfn") from P2M\n",
                         i, gfn_x(gfn));
                 domain_crash(d);
                 return rc;
@@ -1863,7 +1863,7 @@ gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
             if ( paging_mode_translate(d) )
             {
                 gprintk(XENLOG_ERR,
-                        "Wrong page state %#lx of status frame %u (GFN %#lx)\n",
+                        "Wrong page state %#lx of status frame %u (GFN %"PRI_gfn")\n",
                         pg->count_info, i, gfn_x(gfn));
                 domain_crash(d);
             }
@@ -2325,7 +2325,7 @@ gnttab_transfer(
         if ( rc )
         {
             gdprintk(XENLOG_INFO,
-                     "can't remove GFN %"PRI_xen_pfn" (MFN %#"PRI_mfn")\n",
+                     "can't remove GFN %"PRI_xen_pfn" (MFN %"PRI_mfn")\n",
                      gop.mfn, mfn_x(mfn));
             gop.status = GNTST_general_error;
             goto put_gfn_and_copyback;
@@ -2992,7 +2992,7 @@ static int gnttab_copy_claim_buf(const struct gnttab_copy *op,
         {
             if ( !buf->domain->is_dying )
                 gdprintk(XENLOG_WARNING,
-                         "Could not get writable frame %#"PRI_mfn"\n",
+                         "Could not get writable frame %"PRI_mfn"\n",
                          mfn_x(buf->mfn));
             rc = GNTST_general_error;
             goto out;
@@ -3981,9 +3981,9 @@ void grant_table_warn_active_grants(struct domain *d)
         if ( nr_active <= WARN_GRANT_MAX )
             printk(XENLOG_G_DEBUG "d%d has active grant %x ("
 #ifndef NDEBUG
-                   "GFN %lx, "
+                   "GFN %"PRI_gfn", "
 #endif
-                   "MFN: %#"PRI_mfn")\n",
+                   "MFN: %"PRI_mfn")\n",
                    d->domain_id, ref,
 #ifndef NDEBUG
                    gfn_x(act->gfn),
@@ -4334,7 +4334,7 @@ static void gnttab_usage_print(struct domain *rd)
         first = 0;
 
         /*      [0xXXX]  ddddd 0xXXXXX 0xXXXXXXXX      ddddd 0xXXXXXX 0xXX */
-        printk("[0x%03x]  %5d 0x%"PRI_mfn" 0x%08x      %5d 0x%06"PRIx64" 0x%02x\n",
+        printk("[0x%03x]  %5d %"PRI_mfn" 0x%08x      %5d 0x%06"PRIx64" 0x%02x\n",
                ref, act->domid, mfn_x(act->mfn), act->pin,
                sha->domid, frame, status);
         active_entry_release(act);
diff --git a/xen/common/memory.c b/xen/common/memory.c
index a6f2f6d1b3..f552c0e894 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -229,7 +229,7 @@ static void populate_physmap(struct memop_args *a)
                 {
                     if ( !mfn_valid(mfn) )
                     {
-                        gdprintk(XENLOG_INFO, "Invalid mfn %#"PRI_mfn"\n",
+                        gdprintk(XENLOG_INFO, "Invalid mfn %"PRI_mfn"\n",
                                  mfn_x(mfn));
                         goto out;
                     }
@@ -238,7 +238,7 @@ static void populate_physmap(struct memop_args *a)
                     if ( !get_page(page, d) )
                     {
                         gdprintk(XENLOG_INFO,
-                                 "mfn %#"PRI_mfn" doesn't belong to d%d\n",
+                                 "mfn %"PRI_mfn" doesn't belong to d%d\n",
                                   mfn_x(mfn), d->domain_id);
                         goto out;
                     }
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b8..28f226e951 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -826,7 +826,7 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
                                 mfn_to_maddr(addr) + PAGE_SIZE, E820_RESERVED) )
                 continue;
             printk(XENLOG_ERR
-                   "%s: page at %#" PRI_mfn " couldn't be reserved\n",
+                   "%s: page at %" PRI_mfn " couldn't be reserved\n",
                    prefix, mfn_x(addr));
             return false;
         }
@@ -842,7 +842,7 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
             continue;
 
         printk(XENLOG_ERR
-               "%s: page at %#" PRI_mfn " can't be converted\n",
+               "%s: page at %" PRI_mfn " can't be converted\n",
                prefix, mfn_x(addr));
         return false;
     }
diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index d973aec901..37c960b5bd 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -5,7 +5,7 @@
 #include <xen/typesafe.h>
 
 TYPE_SAFE(unsigned long, mfn);
-#define PRI_mfn          "05lx"
+#define PRI_mfn          "#lx"
 #define INVALID_MFN_RAW  (~0UL)
 #define INVALID_MFN      _mfn(INVALID_MFN_RAW)
 /*
@@ -41,7 +41,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)
 }
 
 TYPE_SAFE(unsigned long, gfn);
-#define PRI_gfn          "05lx"
+#define PRI_gfn          "#lx"
 #define INVALID_GFN_RAW  (~0UL)
 #define INVALID_GFN      _gfn(INVALID_GFN_RAW)
 /*
-- 
2.34.1


