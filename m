Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D6C73A3E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166866.1493363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YA-0004Iv-OJ; Thu, 20 Nov 2025 11:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166866.1493363; Thu, 20 Nov 2025 11:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YA-0004EE-G9; Thu, 20 Nov 2025 11:10:06 +0000
Received: by outflank-mailman (input) for mailman id 1166866;
 Thu, 20 Nov 2025 11:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4I7H=54=bounce.vates.tech=bounce-md_30504962.691ef709.v1-9649909ca9c644af83ec3718ce3f354f@srs-se1.protection.inumbo.net>)
 id 1vM2Y8-0001PI-Gw
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:10:05 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a199dc-c601-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 12:10:02 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwc94n00zCf9RNh
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:10:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9649909ca9c644af83ec3718ce3f354f; Thu, 20 Nov 2025 11:10:01 +0000
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
X-Inumbo-ID: 75a199dc-c601-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763637001; x=1763907001;
	bh=7PY47YiBEAqJUtWCu8V5zgWutXDzUBRUXX0Mm4bYILU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LikyBE+XofQWyK4B/7P5SkOJdSc3CL5NR4qU+CApmLZQzOFIibAPe3yBI9ZZ7YIOg
	 tjar0VBWq8F2HvlQ6zk4rzt9bsluG+RMPcQFcPUM+/L74anmLxLy9ytPXfX8x++R39
	 7XtyfeUwoqYhyjnmVVB6v1xpNEbZuhlyk+CrS1femTugg6SaLGsf6fQi/ugPvePXY4
	 tc72y78TrD6aFWziIAQ//ZVbJnA/UxUQD0X6o5cUXIei+WryozZuqXVMxQRadCJ5er
	 SfyaWkjdZGSvIf/pl+g0gK4ZoKZnm1YgWf2D8QDepXADF2gPuWKsvZMVjX2WUjpXaf
	 D7CZ8E4sdhY2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763637001; x=1763897501; i=teddy.astie@vates.tech;
	bh=7PY47YiBEAqJUtWCu8V5zgWutXDzUBRUXX0Mm4bYILU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b/98XeGv2B1XQhW0+gWfHwXOQlZDQkgCZBRW+N+AZ6LHTjZqu+wMRf4VsbRPIediD
	 BDTxAwHXbxkI+dYix4psA2AIRNYMN5zEpQyOoOG8j3ojTfkWRkc+LBxB4kFnPD0PGh
	 6jAyL/UdVx662uD1u5IgnHZg8hEVCGXEujsq/rHpmYj4EPUk9VXCZxwOLEAQE31hbG
	 0HNVI+kJu5w36STZ6WnjDYIddK9G5/c2+71mN/97/pO8EqWhlHtU4Nh5Rb5KY/tA2b
	 WsHyLbsrgS7mDgfCMO9CyWnKRe9UPCtxZClKFZ/xq7PMBdvAc+OUtf8vHCMotmPDj9
	 w5Nf1gghXpx0Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2008/14]=20iommu:=20Introduce=20redesigned=20IOMMU=20subsystem?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763636998872
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <ebbeb1dffd74ca31285d1f6e07fc212d878a7089.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9649909ca9c644af83ec3718ce3f354f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:10:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce the changes proposed in docs/designs/iommu-context.md.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
This patch is still quite large but I am not sure how to split it further.
---
 xen/arch/x86/include/asm/iommu.h            |    8 +-
 xen/arch/x86/mm/p2m-ept.c                   |    2 +-
 xen/arch/x86/pv/dom0_build.c                |    6 +-
 xen/common/memory.c                         |    4 +-
 xen/drivers/passthrough/amd/iommu.h         |   13 +-
 xen/drivers/passthrough/amd/iommu_cmd.c     |   20 +-
 xen/drivers/passthrough/amd/iommu_init.c    |    2 +-
 xen/drivers/passthrough/amd/iommu_map.c     |   52 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  383 ++++---
 xen/drivers/passthrough/iommu.c             |  635 +++++++++++-
 xen/drivers/passthrough/pci.c               |  387 +++----
 xen/drivers/passthrough/vtd/extern.h        |   17 +-
 xen/drivers/passthrough/vtd/iommu.c         | 1030 +++++++------------
 xen/drivers/passthrough/vtd/quirks.c        |   22 +-
 xen/drivers/passthrough/x86/iommu.c         |  153 ++-
 xen/include/xen/iommu.h                     |   99 +-
 xen/include/xen/pci.h                       |    3 +
 17 files changed, 1530 insertions(+), 1306 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index d20c3cda59..654a07b9b2 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -2,10 +2,12 @@
 #ifndef __ARCH_X86_IOMMU_H__
 #define __ARCH_X86_IOMMU_H__
 
+#include <xen/bitmap.h>
 #include <xen/errno.h>
 #include <xen/list.h>
 #include <xen/mem_access.h>
 #include <xen/spinlock.h>
+#include <xen/stdbool.h>
 #include <asm/apicdef.h>
 #include <asm/cache.h>
 #include <asm/processor.h>
@@ -39,18 +41,16 @@ struct arch_iommu_context
     struct list_head identity_maps;
 
 
-    spinlock_t mapping_lock; /* io page table lock */
-
     union {
         /* Intel VT-d */
         struct {
             uint64_t pgd_maddr; /* io page directory machine address */
             domid_t *didmap; /* per-iommu DID (valid only if related iommu_dev_cnt > 0) */
             unsigned long *iommu_dev_cnt; /* counter of devices per iommu */
+            uint32_t superpage_progress; /* superpage progress during teardown */
         } vtd;
         /* AMD IOMMU */
         struct {
-            unsigned int paging_mode;
             struct page_info *root_table;
             domid_t *didmap; /* per-iommu DID (valid only if related iommu_dev_cnt > 0) */
             unsigned long *iommu_dev_cnt; /* counter of devices per iommu */
@@ -72,7 +72,7 @@ struct arch_iommu
         struct {
             unsigned int paging_mode;
             struct guest_iommu *g_iommu;
-        };
+        } amd;
     };
 };
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b854a08b4c..6cc97ec139 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -978,7 +978,7 @@ out:
             rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order,
                                    (iommu_flags ? IOMMU_FLUSHF_added : 0) |
                                    (vtd_pte_present ? IOMMU_FLUSHF_modified
-                                                    : 0));
+                                                    : 0), 0);
         else if ( need_iommu_pt_sync(d) )
             rc = iommu_flags ?
                 iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags) :
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21158ce181..1bae5f2ba9 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -77,7 +77,7 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
          * iommu_memory_setup() ended up mapping them.
          */
         if ( need_iommu_pt_sync(d) &&
-             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, 0, flush_flags) )
+             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, 0, flush_flags, 0) )
             BUG();
 
         /* Read-only mapping + PGC_allocated + page-table page. */
@@ -128,7 +128,7 @@ static void __init iommu_memory_setup(struct domain *d, const char *what,
 
     while ( (rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
                             IOMMUF_readable | IOMMUF_writable | IOMMUF_preempt,
-                            flush_flags)) > 0 )
+                            flush_flags, 0)) > 0 )
     {
         mfn = mfn_add(mfn, rc);
         nr -= rc;
@@ -962,7 +962,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
     }
 
     /* Use while() to avoid compiler warning. */
-    while ( iommu_iotlb_flush_all(d, flush_flags) )
+    while ( iommu_iotlb_flush_all(d, 0, flush_flags) )
         break;
 
     if ( initrd_len != 0 )
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd50..0c0526a160 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -928,7 +928,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
         this_cpu(iommu_dont_flush_iotlb) = 0;
 
         ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
-                                IOMMU_FLUSHF_modified);
+                                IOMMU_FLUSHF_modified, 0);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
 
@@ -942,7 +942,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
             put_page(pages[i]);
 
         ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), done,
-                                IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
+                                IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified, 0);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
     }
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index db6d7ace02..0bd0f15a72 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -198,11 +198,10 @@ void amd_iommu_quarantine_teardown(struct pci_dev *pdev);
 /* mapping functions */
 int __must_check cf_check amd_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
-    unsigned int *flush_flags);
+    unsigned int *flush_flags, struct iommu_context *ctx);
 int __must_check cf_check amd_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order,
-    unsigned int *flush_flags);
-int __must_check amd_iommu_alloc_root(struct domain *d);
+    unsigned int *flush_flags, struct iommu_context *ctx);
 int amd_iommu_reserve_domain_unity_map(struct domain *d, struct iommu_context *ctx,
                                        const struct ivrs_unity_map *map,
                                        unsigned int flag);
@@ -211,7 +210,7 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d, struct iommu_context
 int cf_check amd_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt);
 int __must_check cf_check amd_iommu_flush_iotlb_pages(
-    struct domain *d, dfn_t dfn, unsigned long page_count,
+    struct domain *d, struct iommu_context *ctx, dfn_t dfn, unsigned long page_count,
     unsigned int flush_flags);
 void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
                              dfn_t dfn);
@@ -233,9 +232,9 @@ void iommu_dte_add_device_entry(struct amd_iommu_dte *dte,
                                 const struct ivrs_mappings *ivrs_dev);
 
 /* send cmd to iommu */
-void amd_iommu_flush_all_pages(struct domain *d);
-void amd_iommu_flush_pages(struct domain *d, unsigned long dfn,
-                           unsigned int order);
+void amd_iommu_flush_all_pages(struct domain *d, struct iommu_context *ctx);
+void amd_iommu_flush_pages(struct domain *d, struct iommu_context *ctx,
+                           unsigned long dfn, unsigned int order);
 void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
                            daddr_t daddr, unsigned int order);
 void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf,
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 0c4dcf4ece..13c353b038 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -327,19 +327,21 @@ static void amd_iommu_flush_all_iotlbs(const struct domain *d, daddr_t daddr,
 }
 
 /* Flush iommu cache after p2m changes. */
-static void _amd_iommu_flush_pages(struct domain *d,
+static void _amd_iommu_flush_pages(struct domain *d, struct iommu_context *ctx,
                                    daddr_t daddr, unsigned int order)
 {
     struct amd_iommu *iommu;
-    struct iommu_context *ctx = iommu_default_context(d);
 
     /* send INVALIDATE_IOMMU_PAGES command */
     for_each_amd_iommu ( iommu )
     {
-        domid_t dom_id = ctx->arch.amd.didmap[iommu->index];
+        if ( ctx->arch.amd.iommu_dev_cnt[iommu->index] )
+        {
+            domid_t dom_id = ctx->arch.amd.didmap[iommu->index];
 
-        invalidate_iommu_pages(iommu, daddr, dom_id, order);
-        flush_command_buffer(iommu, 0);
+            invalidate_iommu_pages(iommu, daddr, dom_id, order);
+            flush_command_buffer(iommu, 0);
+        }
     }
 
     if ( ats_enabled )
@@ -355,15 +357,15 @@ static void _amd_iommu_flush_pages(struct domain *d,
     }
 }
 
-void amd_iommu_flush_all_pages(struct domain *d)
+void amd_iommu_flush_all_pages(struct domain *d, struct iommu_context *ctx)
 {
-    _amd_iommu_flush_pages(d, INV_IOMMU_ALL_PAGES_ADDRESS, 0);
+    _amd_iommu_flush_pages(d, ctx, INV_IOMMU_ALL_PAGES_ADDRESS, 0);
 }
 
-void amd_iommu_flush_pages(struct domain *d,
+void amd_iommu_flush_pages(struct domain *d, struct iommu_context *ctx,
                            unsigned long dfn, unsigned int order)
 {
-    _amd_iommu_flush_pages(d, __dfn_to_daddr(dfn), order);
+    _amd_iommu_flush_pages(d, ctx, __dfn_to_daddr(dfn), order);
 }
 
 void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf,
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 5cbb3fdb05..bf32b6c718 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1538,7 +1538,7 @@ static void invalidate_all_domain_pages(void)
 
     for_each_domain( d )
         if ( is_iommu_enabled(d) )
-            amd_iommu_flush_all_pages(d);
+            amd_iommu_flush_all_pages(d, iommu_default_context(d));
 }
 
 static int cf_check _invalidate_all_devices(
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 42827c7dc7..01b36fdf4f 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -276,7 +276,7 @@ static int iommu_pde_from_dfn(struct domain *d, struct iommu_context *ctx,
     struct domain_iommu *hd = dom_iommu(d);
 
     table = ctx->arch.amd.root_table;
-    level = ctx->arch.amd.paging_mode;
+    level = hd->arch.amd.paging_mode;
 
     if ( !table || target < 1 || level < target || level > 6 )
     {
@@ -400,21 +400,17 @@ static void queue_free_pt(struct domain *d, struct iommu_context *ctx, mfn_t mfn
 
 int cf_check amd_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
-    unsigned int *flush_flags)
+    unsigned int *flush_flags, struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct iommu_context *ctx = iommu_default_context(d);
     unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     bool contig;
-    int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
 
     ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
            PAGE_SIZE_4K);
 
-    spin_lock(&ctx->arch.mapping_lock);
-
     /*
      * IOMMU mapping request can be safely ignored when the domain is dying.
      *
@@ -422,25 +418,11 @@ int cf_check amd_iommu_map_page(
      * before any page tables are freed (see iommu_free_pgtables()).
      */
     if ( d->is_dying )
-    {
-        spin_unlock(&ctx->arch.mapping_lock);
         return 0;
-    }
-
-    rc = amd_iommu_alloc_root(d);
-    if ( rc )
-    {
-        spin_unlock(&ctx->arch.mapping_lock);
-        AMD_IOMMU_ERROR("root table alloc failed, dfn = %"PRI_dfn"\n",
-                        dfn_x(dfn));
-        domain_crash(d);
-        return rc;
-    }
 
     if ( iommu_pde_from_dfn(d, ctx, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
-        spin_unlock(&ctx->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
@@ -452,7 +434,7 @@ int cf_check amd_iommu_map_page(
                                 flags & IOMMUF_writable,
                                 flags & IOMMUF_readable, &contig);
 
-    while ( unlikely(contig) && ++level < ctx->arch.amd.paging_mode )
+    while ( unlikely(contig) && ++level < hd->arch.amd.paging_mode )
     {
         struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
         unsigned long next_mfn;
@@ -471,8 +453,6 @@ int cf_check amd_iommu_map_page(
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&ctx->arch.mapping_lock);
-
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
     {
@@ -486,11 +466,11 @@ int cf_check amd_iommu_map_page(
 }
 
 int cf_check amd_iommu_unmap_page(
-    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
+    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags,
+    struct iommu_context *ctx)
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
-    struct iommu_context *ctx = iommu_default_context(d);
     unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
@@ -500,17 +480,11 @@ int cf_check amd_iommu_unmap_page(
      */
     ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
 
-    spin_lock(&ctx->arch.mapping_lock);
-
     if ( !ctx->arch.amd.root_table )
-    {
-        spin_unlock(&ctx->arch.mapping_lock);
         return 0;
-    }
 
     if ( iommu_pde_from_dfn(d, ctx, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
-        spin_unlock(&ctx->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
                         dfn_x(dfn));
         domain_crash(d);
@@ -524,7 +498,7 @@ int cf_check amd_iommu_unmap_page(
         /* Mark PTE as 'page not present'. */
         old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
 
-        while ( unlikely(free) && ++level < ctx->arch.amd.paging_mode )
+        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
         {
             struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
 
@@ -540,8 +514,6 @@ int cf_check amd_iommu_unmap_page(
         }
     }
 
-    spin_unlock(&ctx->arch.mapping_lock);
-
     if ( old.pr )
     {
         *flush_flags |= IOMMU_FLUSHF_modified;
@@ -608,7 +580,7 @@ static unsigned long flush_count(unsigned long dfn, unsigned long page_count,
 }
 
 int cf_check amd_iommu_flush_iotlb_pages(
-    struct domain *d, dfn_t dfn, unsigned long page_count,
+    struct domain *d, struct iommu_context *ctx, dfn_t dfn, unsigned long page_count,
     unsigned int flush_flags)
 {
     unsigned long dfn_l = dfn_x(dfn);
@@ -626,7 +598,7 @@ int cf_check amd_iommu_flush_iotlb_pages(
     /* If so requested or if the range wraps then just flush everything. */
     if ( (flush_flags & IOMMU_FLUSHF_all) || dfn_l + page_count < dfn_l )
     {
-        amd_iommu_flush_all_pages(d);
+        amd_iommu_flush_all_pages(d, ctx);
         return 0;
     }
 
@@ -639,13 +611,13 @@ int cf_check amd_iommu_flush_iotlb_pages(
      *       flush code.
      */
     if ( page_count == 1 ) /* order 0 flush count */
-        amd_iommu_flush_pages(d, dfn_l, 0);
+        amd_iommu_flush_pages(d, ctx, dfn_l, 0);
     else if ( flush_count(dfn_l, page_count, 9) == 1 )
-        amd_iommu_flush_pages(d, dfn_l, 9);
+        amd_iommu_flush_pages(d, ctx, dfn_l, 9);
     else if ( flush_count(dfn_l, page_count, 18) == 1 )
-        amd_iommu_flush_pages(d, dfn_l, 18);
+        amd_iommu_flush_pages(d, ctx, dfn_l, 18);
     else
-        amd_iommu_flush_all_pages(d);
+        amd_iommu_flush_all_pages(d, ctx);
 
     return 0;
 }
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index c871660661..3c17d78caf 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -20,8 +20,11 @@
 #include <xen/iocap.h>
 #include <xen/softirq.h>
 #include <xen/iommu.h>
+#include <xen/mm.h>
+#include <xen/pci.h>
 
 #include <asm/acpi.h>
+#include <asm/iommu.h>
 
 #include "iommu.h"
 #include "../ats.h"
@@ -85,18 +88,6 @@ int get_dma_requestor_id(uint16_t seg, uint16_t bdf)
     return req_id;
 }
 
-static int __must_check allocate_domain_resources(struct domain *d)
-{
-    struct iommu_context *ctx = iommu_default_context(d);
-    int rc;
-
-    spin_lock(&ctx->arch.mapping_lock);
-    rc = amd_iommu_alloc_root(d);
-    spin_unlock(&ctx->arch.mapping_lock);
-
-    return rc;
-}
-
 static bool any_pdev_behind_iommu(const struct domain *d,
                                   const struct pci_dev *exclude,
                                   const struct amd_iommu *iommu)
@@ -127,8 +118,9 @@ static bool use_ats(
 
 static int __must_check amd_iommu_setup_domain_device(
     struct domain *domain, struct iommu_context *ctx, struct amd_iommu *iommu,
-    uint8_t devfn, struct pci_dev *pdev)
+    uint8_t devfn, struct pci_dev *pdev, struct iommu_context *prev_ctx)
 {
+    struct domain_iommu *hd = dom_iommu(domain);
     struct amd_iommu_dte *table, *dte;
     unsigned long flags;
     unsigned int req_id, sr_flags;
@@ -138,11 +130,7 @@ static int __must_check amd_iommu_setup_domain_device(
     const struct page_info *root_pg;
     domid_t domid;
 
-    BUG_ON(!ctx->arch.amd.paging_mode || !iommu->dev_table.buffer);
-
-    rc = allocate_domain_resources(domain);
-    if ( rc )
-        return rc;
+    BUG_ON(!hd->arch.amd.paging_mode || !iommu->dev_table.buffer);
 
     req_id = get_dma_requestor_id(iommu->sbdf.seg, pdev->sbdf.bdf);
     ivrs_dev = &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
@@ -157,7 +145,7 @@ static int __must_check amd_iommu_setup_domain_device(
     ivrs_dev = &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
 
     root_pg = ctx->arch.amd.root_table;
-    domid = domain->domain_id;
+    domid = ctx->arch.amd.didmap[iommu->index];
 
     spin_lock_irqsave(&iommu->lock, flags);
 
@@ -166,7 +154,7 @@ static int __must_check amd_iommu_setup_domain_device(
         /* bind DTE to domain page-tables */
         rc = amd_iommu_set_root_page_table(
                  dte, page_to_maddr(root_pg), domid,
-                 ctx->arch.amd.paging_mode, sr_flags);
+                 hd->arch.amd.paging_mode, sr_flags);
         if ( rc )
         {
             ASSERT(rc < 0);
@@ -208,7 +196,7 @@ static int __must_check amd_iommu_setup_domain_device(
         else
             rc = amd_iommu_set_root_page_table(
                      dte, page_to_maddr(root_pg), domid,
-                     ctx->arch.amd.paging_mode, sr_flags);
+                     hd->arch.amd.paging_mode, sr_flags);
         if ( rc < 0 )
         {
             spin_unlock_irqrestore(&iommu->lock, flags);
@@ -251,6 +239,7 @@ static int __must_check amd_iommu_setup_domain_device(
         spin_unlock_irqrestore(&iommu->lock, flags);
 
         amd_iommu_flush_device(iommu, req_id, prev_domid);
+        amd_iommu_flush_device(iommu, req_id, domid);
     }
     else
         spin_unlock_irqrestore(&iommu->lock, flags);
@@ -259,7 +248,7 @@ static int __must_check amd_iommu_setup_domain_device(
                     "root table = %#"PRIx64", "
                     "domain = %d, paging mode = %d\n",
                     req_id, pdev->type, page_to_maddr(root_pg),
-                    domid, ctx->arch.amd.paging_mode);
+                    domid, hd->arch.amd.paging_mode);
 
     ASSERT(pcidevs_locked());
 
@@ -272,6 +261,15 @@ static int __must_check amd_iommu_setup_domain_device(
         amd_iommu_flush_iotlb(devfn, pdev, INV_IOMMU_ALL_PAGES_ADDRESS, 0);
     }
 
+    if ( prev_ctx )
+    {
+        /* Don't underflow the counter. */
+        BUG_ON(!prev_ctx->arch.amd.iommu_dev_cnt[iommu->index]);
+        prev_ctx->arch.amd.iommu_dev_cnt[iommu->index]--;
+    }
+
+    ctx->arch.amd.iommu_dev_cnt[iommu->index]++;
+
     return 0;
 }
 
@@ -338,27 +336,12 @@ static int cf_check iov_enable_xt(void)
     return 0;
 }
 
-int amd_iommu_alloc_root(struct domain *d)
-{
-    struct domain_iommu *hd = dom_iommu(d);
-    struct iommu_context *ctx = iommu_default_context(d);
-
-    if ( unlikely(!ctx->arch.amd.root_table) && d != dom_io )
-    {
-        ctx->arch.amd.root_table = iommu_alloc_pgtable(hd, ctx, 0);
-        if ( !ctx->arch.amd.root_table )
-            return -ENOMEM;
-    }
-
-    return 0;
-}
-
 unsigned int __read_mostly amd_iommu_max_paging_mode = IOMMU_MAX_PT_LEVELS;
 int __read_mostly amd_iommu_min_paging_mode = 1;
 
 static int cf_check amd_iommu_domain_init(struct domain *d)
 {
-    struct iommu_context *ctx = iommu_default_context(d);
+    struct domain_iommu *hd = dom_iommu(d);
     int pglvl = amd_iommu_get_paging_mode(
                     1UL << (domain_max_paddr_bits(d) - PAGE_SHIFT));
 
@@ -369,20 +352,20 @@ static int cf_check amd_iommu_domain_init(struct domain *d)
      * Choose the number of levels for the IOMMU page tables, taking into
      * account unity maps.
      */
-    ctx->arch.amd.paging_mode = max(pglvl, amd_iommu_min_paging_mode);
+    hd->arch.amd.paging_mode = max(pglvl, amd_iommu_min_paging_mode);
 
     return 0;
 }
 
-static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev);
+static int __hwdom_init cf_check setup_hwdom_device(u8 devfn, struct pci_dev *pdev)
+{
+    return iommu_attach_context(hardware_domain, pdev, 0);
+}
 
 static void __hwdom_init cf_check amd_iommu_hwdom_init(struct domain *d)
 {
     const struct amd_iommu *iommu;
 
-    if ( allocate_domain_resources(d) )
-        BUG();
-
     for_each_amd_iommu ( iommu )
         if ( iomem_deny_access(d, PFN_DOWN(iommu->mmio_base_phys),
                                PFN_DOWN(iommu->mmio_base_phys +
@@ -391,11 +374,12 @@ static void __hwdom_init cf_check amd_iommu_hwdom_init(struct domain *d)
 
     /* Make sure workarounds are applied (if needed) before adding devices. */
     arch_iommu_hwdom_init(d);
-    setup_hwdom_pci_devices(d, amd_iommu_add_device);
+    setup_hwdom_pci_devices(d, setup_hwdom_device);
 }
 
 static void amd_iommu_disable_domain_device(const struct domain *domain,
                                             struct amd_iommu *iommu,
+                                            struct iommu_context *prev_ctx,
                                             uint8_t devfn, struct pci_dev *pdev)
 {
     struct amd_iommu_dte *table, *dte;
@@ -442,155 +426,82 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
         AMD_IOMMU_DEBUG("Disable: device id = %#x, "
                         "domain = %d, paging mode = %d\n",
                         req_id, dte->domain_id,
-                        iommu_default_context(domain)->arch.amd.paging_mode);
+                        dom_iommu(domain)->arch.amd.paging_mode);
     }
     else
         spin_unlock_irqrestore(&iommu->lock, flags);
+
+    BUG_ON(!prev_ctx->arch.amd.iommu_dev_cnt[iommu->index]);
+    prev_ctx->arch.amd.iommu_dev_cnt[iommu->index]--;
 }
 
-static int cf_check reassign_device(
-    struct domain *source, struct domain *target, u8 devfn,
-    struct pci_dev *pdev)
+static int cf_check amd_iommu_context_init(struct domain *d, struct iommu_context *ctx,
+                                           u32 flags)
 {
     struct amd_iommu *iommu;
-    struct iommu_context *target_ctx = iommu_default_context(target);
-    struct iommu_context *source_ctx = iommu_default_context(source);
-    int rc;
+    struct domain_iommu *hd = dom_iommu(d);
 
-    iommu = find_iommu_for_device(pdev->sbdf);
-    if ( !iommu )
+    ctx->arch.amd.didmap = xzalloc_array(domid_t, nr_amd_iommus);
+    if ( !ctx->arch.amd.didmap )
+        return -ENOMEM;
+
+    ctx->arch.amd.iommu_dev_cnt = xzalloc_array(unsigned long, nr_amd_iommus);
+    if ( !ctx->arch.amd.iommu_dev_cnt )
     {
-        AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %pd\n",
-                       &PCI_SBDF(pdev->seg, pdev->bus, devfn), target);
-        return -ENODEV;
+        xfree(ctx->arch.amd.didmap);
+        return -ENOMEM;
     }
 
-    rc = amd_iommu_setup_domain_device(target, target_ctx, iommu, devfn, pdev);
-    if ( rc )
-        return rc;
-
-    if ( devfn == pdev->devfn && pdev->domain != target )
+    // TODO: Allocate IOMMU domid only when attaching devices ?
+    /* Populate context DID map using pseudo DIDs */
+    for_each_amd_iommu(iommu)
     {
-        write_lock(&source->pci_lock);
-        list_del(&pdev->domain_list);
-        write_unlock(&source->pci_lock);
-
-        pdev->domain = target;
-
-        write_lock(&target->pci_lock);
-        list_add(&pdev->domain_list, &target->pdev_list);
-        write_unlock(&target->pci_lock);
+        ctx->arch.amd.didmap[iommu->index] =
+            iommu_alloc_domid(iommu->domid_map);
     }
 
-    /*
-     * If the device belongs to the hardware domain, and it has a unity mapping,
-     * don't remove it from the hardware domain, because BIOS may reference that
-     * mapping.
-     */
-    if ( !is_hardware_domain(source) )
+    if ( !ctx->opaque )
     {
-        const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
-        unsigned int bdf = PCI_BDF(pdev->bus, devfn);
-
-        rc = amd_iommu_reserve_domain_unity_unmap(
-                 source, source_ctx,
-                 ivrs_mappings[get_dma_requestor_id(pdev->seg, bdf)].unity_map);
-        if ( rc )
-            return rc;
+        /* Create initial context page */
+        ctx->arch.amd.root_table = iommu_alloc_pgtable(hd, ctx, 0);
     }
 
-    AMD_IOMMU_DEBUG("Re-assign %pp from %pd to %pd\n",
-                    &PCI_SBDF(pdev->seg, pdev->bus, devfn), source, target);
+    return arch_iommu_context_init(d, ctx, flags);
 
-    return 0;
 }
 
-static int cf_check amd_iommu_assign_device(
-    struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
+static int cf_check amd_iommu_context_teardown(struct domain *d,
+                                        struct iommu_context *ctx, u32 flags)
 {
-    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
-    unsigned int bdf = PCI_BDF(pdev->bus, devfn);
-    int req_id = get_dma_requestor_id(pdev->seg, bdf);
-    int rc = amd_iommu_reserve_domain_unity_map(
-                 d, iommu_default_context(d),
-                 ivrs_mappings[req_id].unity_map, flag);
+    struct amd_iommu *iommu;
+    pcidevs_lock();
 
-    if ( !rc )
-        rc = reassign_device(pdev->domain, d, devfn, pdev);
+    // TODO: Cleanup mappings
+    ASSERT(ctx->arch.amd.didmap);
 
-    if ( rc && !is_hardware_domain(d) )
+    for_each_amd_iommu(iommu)
     {
-        int ret = amd_iommu_reserve_domain_unity_unmap(
-                      d, iommu_default_context(d),
-                      ivrs_mappings[req_id].unity_map);
-
-        if ( ret )
-        {
-            printk(XENLOG_ERR "AMD-Vi: "
-                   "unity-unmap for %pd/%04x:%02x:%02x.%u failed (%d)\n",
-                   d, pdev->seg, pdev->bus,
-                   PCI_SLOT(devfn), PCI_FUNC(devfn), ret);
-            domain_crash(d);
-        }
+        iommu_free_domid(ctx->arch.amd.didmap[iommu->index], iommu->domid_map);
     }
 
-    return rc;
-}
-
-static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)
-{
-    struct iommu_context *ctx = iommu_default_context(d);
-
-    spin_lock(&ctx->arch.mapping_lock);
-    ctx->arch.amd.root_table = NULL;
-    spin_unlock(&ctx->arch.mapping_lock);
-}
-
-static void cf_check amd_iommu_domain_destroy(struct domain *d)
-{
-    struct iommu_context *ctx = iommu_default_context(d);
+    xfree(ctx->arch.amd.didmap);
 
-    iommu_identity_map_teardown(d, ctx);
-    ASSERT(!ctx->arch.amd.root_table);
+    pcidevs_unlock();
+    return arch_iommu_context_teardown(d, ctx, flags);
 }
 
-static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
+static int cf_check amd_iommu_attach(
+    struct domain *d, struct pci_dev *pdev, struct iommu_context *ctx)
 {
-    struct amd_iommu *iommu;
-    struct iommu_context *ctx;
-    u16 bdf;
-    struct ivrs_mappings *ivrs_mappings;
-
-    if ( !pdev->domain )
-        return -EINVAL;
-
-    ctx = iommu_default_context(pdev->domain);
-
-    for_each_amd_iommu(iommu)
-        if ( pdev->sbdf.sbdf == iommu->sbdf.sbdf )
-            return is_hardware_domain(pdev->domain) ? 0 : -ENODEV;
-
-    iommu = find_iommu_for_device(pdev->sbdf);
-    if ( unlikely(!iommu) )
-    {
-        /* Filter bridge devices. */
-        if ( pdev->type == DEV_TYPE_PCI_HOST_BRIDGE &&
-             is_hardware_domain(pdev->domain) )
-        {
-            AMD_IOMMU_DEBUG("Skipping host bridge %pp\n", &pdev->sbdf);
-            return 0;
-        }
-
-        AMD_IOMMU_WARN("no IOMMU for %pp; cannot be handed to %pd\n",
-                        &PCI_SBDF(pdev->seg, pdev->bus, devfn), pdev->domain);
-        return -ENODEV;
-    }
+    int ret;
+    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
+    int req_id = get_dma_requestor_id(pdev->seg, pdev->sbdf.bdf);
+    struct ivrs_unity_map *map = ivrs_mappings[req_id].unity_map;
+    struct amd_iommu *iommu = find_iommu_for_device(pdev->sbdf);
+    uint16_t bdf = pdev->sbdf.bdf;
 
-    ivrs_mappings = get_ivrs_mappings(pdev->seg);
-    bdf = PCI_BDF(pdev->bus, devfn);
-    if ( !ivrs_mappings ||
-         !ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].valid )
-        return -EPERM;
+    if ( !iommu )
+        return 0;
 
     if ( iommu_intremap &&
          ivrs_mappings[bdf].dte_requestor_id == bdf &&
@@ -621,55 +532,98 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
         amd_iommu_flush_device(iommu, bdf, DOMID_INVALID);
     }
 
-    if ( amd_iommu_reserve_domain_unity_map(
-             pdev->domain, ctx,
-             ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map,
-             0) )
-        AMD_IOMMU_WARN("%pd: unity mapping failed for %pp\n",
-                       pdev->domain, &PCI_SBDF(pdev->seg, bdf));
+    ret = amd_iommu_reserve_domain_unity_map(d, ctx, map, 0);
+    if ( ret )
+        return ret;
 
-    return amd_iommu_setup_domain_device(pdev->domain, ctx, iommu, devfn, pdev);
+    return amd_iommu_setup_domain_device(d, ctx, iommu, pdev->devfn, pdev, NULL);
 }
 
-static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
+static int cf_check amd_iommu_detach(struct domain *d, struct pci_dev *pdev,
+                                     struct iommu_context *prev_ctx)
 {
-    struct amd_iommu *iommu;
-    struct iommu_context *ctx;
-    u16 bdf;
-    struct ivrs_mappings *ivrs_mappings;
+    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
+    int req_id = get_dma_requestor_id(pdev->seg, pdev->sbdf.bdf);
+    struct amd_iommu *iommu = find_iommu_for_device(pdev->sbdf);
 
-    if ( !pdev->domain )
-        return -EINVAL;
+    if ( !iommu )
+        return 0;
 
-    ctx = iommu_default_context(pdev->domain);
+    amd_iommu_disable_domain_device(d, iommu, prev_ctx, pdev->devfn, pdev);
+
+    return amd_iommu_reserve_domain_unity_unmap(d, prev_ctx, ivrs_mappings[req_id].unity_map);
+}
+
+static int cf_check amd_iommu_add_devfn(struct domain *d, struct pci_dev *pdev,
+                                        u16 devfn, struct iommu_context *ctx)
+{
+    struct amd_iommu *iommu = find_iommu_for_device(pdev->sbdf);
 
-    iommu = find_iommu_for_device(pdev->sbdf);
     if ( !iommu )
+        return 0;
+
+    return amd_iommu_setup_domain_device(d, ctx, iommu, pdev->devfn, pdev, NULL);
+}
+
+static int cf_check amd_iommu_remove_devfn(struct domain *d, struct pci_dev *pdev,
+                                           u16 devfn, struct iommu_context *prev_ctx)
+{
+    struct amd_iommu *iommu = find_iommu_for_device(pdev->sbdf);
+
+    if ( !iommu )
+        return 0;
+
+    amd_iommu_disable_domain_device(d, iommu, prev_ctx, pdev->devfn, pdev);
+
+    return 0;
+}
+
+static int cf_check amd_iommu_reattach(struct domain *d,
+                                       struct pci_dev *pdev,
+                                       struct iommu_context *prev_ctx,
+                                       struct iommu_context *ctx)
+{
+    int ret, rc, req_id = get_dma_requestor_id(pdev->seg, pdev->sbdf.bdf);
+    struct ivrs_mappings *ivrs_mapping = &get_ivrs_mappings(pdev->seg)[req_id];
+    struct ivrs_unity_map *map = ivrs_mapping ? ivrs_mapping->unity_map : NULL;
+    struct amd_iommu *iommu = find_iommu_for_device(pdev->sbdf);
+
+    if ( !iommu )
+        return 0;
+
+    ret = amd_iommu_reserve_domain_unity_map(d, ctx, map, 0);
+    if ( ret )
+        return ret;
+
+    ret = amd_iommu_setup_domain_device(d, ctx, ivrs_mapping->iommu, pdev->devfn,
+                                        pdev, prev_ctx);
+    if ( ret )
     {
-        AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from %pd\n",
-                        &PCI_SBDF(pdev->seg, pdev->bus, devfn), pdev->domain);
-        return -ENODEV;
-    }
+        if ( (rc = amd_iommu_reserve_domain_unity_unmap(d, ctx, map)) )
+            AMD_IOMMU_DEBUG(" Unable to unmap RMRR from d%dc%d for %pp (%d)\n",
+                            d->domain_id, prev_ctx->id, &pdev->sbdf, rc);
 
-    amd_iommu_disable_domain_device(pdev->domain, iommu, devfn, pdev);
+        return ret;
+    }
 
-    ivrs_mappings = get_ivrs_mappings(pdev->seg);
-    bdf = PCI_BDF(pdev->bus, devfn);
+    if ( (rc = amd_iommu_reserve_domain_unity_unmap(d, prev_ctx, map)) )
+        AMD_IOMMU_DEBUG(" Unable to unmap previous RMRR for %pp (%d)\n",
+                        &pdev->sbdf, rc);
 
-    if ( amd_iommu_reserve_domain_unity_unmap(
-             pdev->domain, ctx,
-             ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map) )
-        AMD_IOMMU_WARN("%pd: unity unmapping failed for %pp\n",
-                       pdev->domain, &PCI_SBDF(pdev->seg, bdf));
+    return ret;
+}
 
-    amd_iommu_quarantine_teardown(pdev);
+static void cf_check amd_iommu_clear_root_pgtable(struct domain *d, struct iommu_context *ctx)
+{
+    ctx->arch.amd.root_table = NULL;
+}
 
-    if ( amd_iommu_perdev_intremap &&
-         ivrs_mappings[bdf].dte_requestor_id == bdf &&
-         ivrs_mappings[bdf].intremap_table )
-        amd_iommu_free_intremap_table(iommu, &ivrs_mappings[bdf], bdf);
+static void cf_check amd_iommu_domain_destroy(struct domain *d)
+{
+    struct iommu_context *ctx = iommu_default_context(d);
 
-    return 0;
+    iommu_identity_map_teardown(d, ctx);
+    ASSERT(!ctx->arch.amd.root_table);
 }
 
 static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
@@ -729,30 +683,45 @@ static void amd_dump_page_table_level(struct page_info *pg, int level,
 
 static void cf_check amd_dump_page_tables(struct domain *d)
 {
-    struct iommu_context *ctx = iommu_default_context(d);
+    unsigned int i;
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
 
-    if ( !ctx->arch.amd.root_table )
-        return;
+    if (d == dom_io)
+        printk("d[IO] page tables\n");
+    else
+        printk("d%hu page tables\n", d->domain_id);
+
+    for (i = 0; i < (1 + hd->other_contexts.count); ++i)
+    {
+        if ( (ctx = iommu_get_context(d, i)) )
+        {
+            printk(" Context %d (%"PRI_mfn")\n", i,
+                   mfn_x(page_to_mfn(ctx->arch.amd.root_table)));
 
-    printk("AMD IOMMU %pd table has %u levels\n", d, ctx->arch.amd.paging_mode);
-    amd_dump_page_table_level(ctx->arch.amd.root_table,
-                              ctx->arch.amd.paging_mode, 0, 0);
+            amd_dump_page_table_level(ctx->arch.amd.root_table,
+                                      hd->arch.amd.paging_mode, 0, 0);
+            iommu_put_context(ctx);
+        }
+    }
 }
 
 static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
-    .quarantine_init = amd_iommu_quarantine_init,
-    .add_device = amd_iommu_add_device,
-    .remove_device = amd_iommu_remove_device,
-    .assign_device  = amd_iommu_assign_device,
+    .context_init = amd_iommu_context_init,
+    .context_teardown = amd_iommu_context_teardown,
+    .attach = amd_iommu_attach,
+    .detach = amd_iommu_detach,
+    .reattach = amd_iommu_reattach,
+    .add_devfn = amd_iommu_add_devfn,
+    .remove_devfn = amd_iommu_remove_devfn,
     .teardown = amd_iommu_domain_destroy,
     .clear_root_pgtable = amd_iommu_clear_root_pgtable,
     .map_page = amd_iommu_map_page,
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
-    .reassign_device = reassign_device,
     .get_device_group_id = amd_iommu_group_id,
     .enable_x2apic = iov_enable_xt,
     .update_ire_from_apic = amd_iommu_ioapic_update_ire,
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 32c5011820..feda2e390b 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -208,13 +208,15 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
     hd->node = NUMA_NO_NODE;
 #endif
 
+    rspin_lock_init(&hd->default_ctx.lock);
+
     ret = arch_iommu_domain_init(d);
     if ( ret )
         return ret;
 
     hd->platform_ops = iommu_get_ops();
     ret = iommu_call(hd->platform_ops, init, d);
-    if ( ret || is_system_domain(d) )
+    if ( ret || (is_system_domain(d) && d != dom_io) )
         return ret;
 
     /*
@@ -236,7 +238,17 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
 
     ASSERT(!(hd->need_sync && hd->hap_pt_share));
 
-    return 0;
+    rspin_lock(&hd->default_ctx.lock);
+    ret = iommu_context_init(d, &hd->default_ctx, 0, IOMMU_CONTEXT_INIT_default);
+    rspin_unlock(&hd->default_ctx.lock);
+
+    rwlock_init(&hd->other_contexts.lock);
+    hd->other_contexts.initialized = (atomic_t)ATOMIC_INIT(0);
+    hd->other_contexts.count = 0;
+    hd->other_contexts.bitmap = NULL;
+    hd->other_contexts.map = NULL;
+
+    return ret;
 }
 
 static void cf_check iommu_dump_page_tables(unsigned char key)
@@ -249,14 +261,11 @@ static void cf_check iommu_dump_page_tables(unsigned char key)
 
     for_each_domain(d)
     {
-        if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
+        if ( !is_iommu_enabled(d) )
             continue;
 
         if ( iommu_use_hap_pt(d) )
-        {
             printk("%pd sharing page tables\n", d);
-            continue;
-        }
 
         iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
     }
@@ -274,9 +283,13 @@ void __hwdom_init iommu_hwdom_init(struct domain *d)
     iommu_vcall(hd->platform_ops, hwdom_init, d);
 }
 
-static void iommu_teardown(struct domain *d)
+void cf_check iommu_domain_destroy(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct pci_dev *pdev;
+
+    if ( !is_iommu_enabled(d) )
+        return;
 
     /*
      * During early domain creation failure, we may reach here with the
@@ -285,17 +298,68 @@ static void iommu_teardown(struct domain *d)
     if ( !hd->platform_ops )
         return;
 
+    /* Move all devices back to quarantine */
+    /* TODO: Is it needed ? */
+    for_each_pdev(d, pdev)
+    {
+        int rc = iommu_reattach_context(d, dom_io, pdev, 0);
+
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "Unable to quarantine device %pp (%d)\n", &pdev->sbdf, rc);
+            pdev->broken = true;
+        }
+        else
+            pdev->domain = dom_io;
+    }
+
     iommu_vcall(hd->platform_ops, teardown, d);
+
+    arch_iommu_domain_destroy(d);
 }
 
-void iommu_domain_destroy(struct domain *d)
-{
-    if ( !is_iommu_enabled(d) )
-        return;
+bool cf_check iommu_check_context(struct domain *d, uint16_t ctx_id) {
+    struct domain_iommu *hd = dom_iommu(d);
 
-    iommu_teardown(d);
+    if ( ctx_id == 0 )
+        return true; /* Default context always exist. */
 
-    arch_iommu_domain_destroy(d);
+    if ( (ctx_id - 1) >= hd->other_contexts.count )
+        return false; /* out of bounds */
+
+    if ( ctx_id == IOMMU_INVALID_CONTEXT_ID )
+        return false; /* Invalid ID */
+
+    return test_bit(ctx_id - 1, hd->other_contexts.bitmap);
+}
+
+struct iommu_context * cf_check iommu_get_context(struct domain *d, uint16_t ctx_id) {
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+
+    if ( !iommu_check_context(d, ctx_id) )
+        return NULL;
+
+    if (ctx_id == 0)
+        ctx = &hd->default_ctx;
+    else
+        ctx = &hd->other_contexts.map[ctx_id - 1];
+
+    rspin_lock(&ctx->lock);
+    /* Check if the context is still valid at this point */
+    if ( unlikely(!iommu_check_context(d, ctx_id)) )
+    {
+        /* Context has been destroyed in between */
+        rspin_unlock(&ctx->lock);
+        return NULL;
+    }
+
+    return ctx;
+}
+
+void cf_check iommu_put_context(struct iommu_context *ctx)
+{
+    rspin_unlock(&ctx->lock);
 }
 
 static unsigned int mapping_order(const struct domain_iommu *hd,
@@ -323,11 +387,11 @@ static unsigned int mapping_order(const struct domain_iommu *hd,
     return order;
 }
 
-long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
-               unsigned long page_count, unsigned int flags,
-               unsigned int *flush_flags)
+static long _iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+                       unsigned long page_count, unsigned int flags,
+                       unsigned int *flush_flags, struct iommu_context *ctx)
 {
-    const struct domain_iommu *hd = dom_iommu(d);
+    struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
     unsigned int order, j = 0;
     int rc = 0;
@@ -350,7 +414,7 @@ long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
             return i;
 
         rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
-                        flags | IOMMUF_order(order), flush_flags);
+                        flags | IOMMUF_order(order), flush_flags, ctx);
 
         if ( likely(!rc) )
             continue;
@@ -361,10 +425,10 @@ long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
                    d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
 
         /* while statement to satisfy __must_check */
-        while ( iommu_unmap(d, dfn0, i, 0, flush_flags) )
+        while ( iommu_unmap(d, dfn0, i, 0, flush_flags, ctx->id) )
             break;
 
-        if ( !is_hardware_domain(d) )
+        if ( !ctx->id && !is_hardware_domain(d) )
             domain_crash(d);
 
         break;
@@ -375,43 +439,67 @@ long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
      * page, flush everything and clear flush flags.
      */
     if ( page_count > 1 && unlikely(rc) &&
-         !iommu_iotlb_flush_all(d, *flush_flags) )
+         !iommu_iotlb_flush_all(d, ctx->id, *flush_flags) )
         *flush_flags = 0;
 
     return rc;
 }
 
+long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
+               unsigned long page_count, unsigned int flags,
+               unsigned int *flush_flags, uint16_t ctx_id)
+{
+    struct iommu_context *ctx;
+    long ret;
+
+    if ( !(ctx = iommu_get_context(d, ctx_id)) )
+        return -ENOENT;
+
+    ret = _iommu_map(d, dfn0, mfn0, page_count, flags, flush_flags, ctx);
+
+    iommu_put_context(ctx);
+
+    return ret;
+}
+
 int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                      unsigned long page_count, unsigned int flags)
 {
+    struct iommu_context *ctx;
     unsigned int flush_flags = 0;
-    int rc;
+    int rc = 0;
 
     ASSERT(!(flags & IOMMUF_preempt));
-    rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
 
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
+    ctx = iommu_get_context(d, 0);
+
+    if ( !ctx->opaque )
+    {
+        rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags, 0);
+
+        if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+            rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags, 0);
+    }
+
+    iommu_put_context(ctx);
 
     return rc;
 }
 
-long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
-                 unsigned int flags, unsigned int *flush_flags)
+static long _iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
+                         unsigned int flags, unsigned int *flush_flags,
+                         struct iommu_context *ctx)
 {
-    const struct domain_iommu *hd = dom_iommu(d);
+    struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
     unsigned int order, j = 0;
     int rc = 0;
-    struct iommu_context *ctx;
 
     if ( !is_iommu_enabled(d) )
         return 0;
 
     ASSERT(!(flags & ~IOMMUF_preempt));
 
-    ctx = iommu_default_context(d);
-
     for ( i = 0; i < page_count; i += 1UL << order )
     {
         dfn_t dfn = dfn_add(dfn0, i);
@@ -425,7 +513,8 @@ long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
             return i;
 
         err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
-                         flags | IOMMUF_order(order), flush_flags);
+                         flags | IOMMUF_order(order), flush_flags,
+                         ctx);
 
         if ( likely(!err) )
             continue;
@@ -438,7 +527,7 @@ long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
         if ( !rc )
             rc = err;
 
-        if ( !is_hardware_domain(d) )
+        if ( !ctx->id && !is_hardware_domain(d) )
         {
             domain_crash(d);
             break;
@@ -450,41 +539,74 @@ long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
      * page, flush everything and clear flush flags.
      */
     if ( page_count > 1 && unlikely(rc) &&
-         !iommu_iotlb_flush_all(d, *flush_flags) )
+         !iommu_iotlb_flush_all(d, ctx->id, *flush_flags) )
         *flush_flags = 0;
 
     return rc;
 }
 
+long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
+                 unsigned int flags, unsigned int *flush_flags,
+                 uint16_t ctx_id)
+{
+    struct iommu_context *ctx;
+    long ret;
+
+    if ( !(ctx = iommu_get_context(d, ctx_id)) )
+        return -ENOENT;
+
+    ret = _iommu_unmap(d, dfn0, page_count, flags, flush_flags, ctx);
+
+    iommu_put_context(ctx);
+
+    return ret;
+}
+
 int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags);
+    struct iommu_context *ctx;
+    int rc = 0;
 
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
+    ctx = iommu_get_context(d, 0);
+
+    if ( !ctx->opaque )
+    {
+        rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags, 0);
+
+        if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+            rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags, 0);
+    }
+
+    iommu_put_context(ctx);
 
     return rc;
 }
 
 int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                      unsigned int *flags)
+                      unsigned int *flags, uint16_t ctx_id)
 {
-    const struct domain_iommu *hd = dom_iommu(d);
+    struct domain_iommu *hd = dom_iommu(d);
     struct iommu_context *ctx;
+    int ret;
 
     if ( !is_iommu_enabled(d) || !hd->platform_ops->lookup_page )
         return -EOPNOTSUPP;
 
-    ctx = iommu_default_context(d);
+    if ( !(ctx = iommu_get_context(d, ctx_id)) )
+        return -ENOENT;
 
-    return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
+    ret = iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags, ctx);
+
+    iommu_put_context(ctx);
+    return ret;
 }
 
 int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
-                      unsigned int flush_flags)
+                      unsigned int flush_flags, uint16_t ctx_id)
 {
-    const struct domain_iommu *hd = dom_iommu(d);
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
     int rc;
 
     if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
@@ -494,7 +616,10 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
     if ( dfn_eq(dfn, INVALID_DFN) )
         return -EINVAL;
 
-    rc = iommu_call(hd->platform_ops, iotlb_flush, d, dfn, page_count,
+    if ( !(ctx = iommu_get_context(d, ctx_id)) )
+        return -ENOENT;
+
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, ctx, dfn, page_count,
                     flush_flags);
     if ( unlikely(rc) )
     {
@@ -503,23 +628,29 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
                    "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %lu flags %x\n",
                    d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
 
-        if ( !is_hardware_domain(d) )
+        if ( !ctx->id && !is_hardware_domain(d) )
             domain_crash(d);
     }
 
+    iommu_put_context(ctx);
+
     return rc;
 }
 
-int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
+int iommu_iotlb_flush_all(struct domain *d, uint16_t ctx_id, unsigned int flush_flags)
 {
-    const struct domain_iommu *hd = dom_iommu(d);
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
     int rc;
 
     if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
          !flush_flags )
         return 0;
 
-    rc = iommu_call(hd->platform_ops, iotlb_flush, d, INVALID_DFN, 0,
+    if ( !(ctx = iommu_get_context(d, ctx_id)) )
+        return -ENOENT;
+
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, ctx, _dfn(0), 0,
                     flush_flags | IOMMU_FLUSHF_all);
     if ( unlikely(rc) )
     {
@@ -532,21 +663,419 @@ int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
             domain_crash(d);
     }
 
+    iommu_put_context(ctx);
     return rc;
 }
 
+int cf_check iommu_context_init(struct domain *d, struct iommu_context *ctx,
+                                uint16_t ctx_id, unsigned int flags)
+{
+    if ( !dom_iommu(d)->platform_ops->context_init )
+        return -ENOSYS;
+
+    INIT_LIST_HEAD(&ctx->devices);
+    ctx->id = ctx_id;
+    ctx->dying = false;
+    ctx->opaque = false; /* assume non-opaque by default */
+
+    return iommu_call(dom_iommu(d)->platform_ops, context_init, d, ctx, flags);
+}
+
+int iommu_context_alloc(struct domain *d, uint16_t *ctx_id, unsigned int flags)
+{
+    unsigned int i;
+    int ret;
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+
+    do {
+        i = find_first_zero_bit(hd->other_contexts.bitmap, hd->other_contexts.count);
+
+        if ( i >= hd->other_contexts.count )
+            return -ENOSPC;
+
+        ctx = &hd->other_contexts.map[i];
+
+        /* Try to lock the mutex, can fail on concurrent accesses */
+        if ( !rspin_trylock(&ctx->lock) )
+            continue;
+
+        /* We can now set it as used, we keep the lock for initialization. */
+        set_bit(i, hd->other_contexts.bitmap);
+    } while (0);
+
+    *ctx_id = i + 1;
+
+    ret = iommu_context_init(d, ctx, *ctx_id, flags);
+
+    if ( ret )
+        clear_bit(*ctx_id, hd->other_contexts.bitmap);
+
+    iommu_put_context(ctx);
+    return ret;
+}
+
+/**
+ * Attach dev phantom functions to ctx, override any existing
+ * mapped context.
+ */
+static int cf_check iommu_reattach_phantom(struct domain *d, device_t *dev,
+                                           struct iommu_context *ctx)
+{
+    int ret = 0;
+    uint8_t devfn = dev->devfn;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    while ( dev->phantom_stride )
+    {
+        devfn += dev->phantom_stride;
+
+        if ( PCI_SLOT(devfn) != PCI_SLOT(dev->devfn) )
+            break;
+
+        ret = iommu_call(hd->platform_ops, add_devfn, d, dev, devfn, ctx);
+
+        if ( ret )
+            break;
+    }
+
+    return ret;
+}
+
+/**
+ * Detach all device phantom functions.
+ */
+static int cf_check iommu_detach_phantom(struct domain *d, device_t *dev,
+                                         struct iommu_context *prev_ctx)
+{
+    int ret = 0;
+    uint8_t devfn = dev->devfn;
+    struct domain_iommu *hd = dom_iommu(d);
+
+    while ( dev->phantom_stride )
+    {
+        devfn += dev->phantom_stride;
+
+        if ( PCI_SLOT(devfn) != PCI_SLOT(dev->devfn) )
+            break;
+
+        ret = iommu_call(hd->platform_ops, remove_devfn, d, dev, devfn, prev_ctx);
+
+        if ( ret )
+            break;
+    }
+
+    return ret;
+}
+
+int cf_check iommu_attach_context(struct domain *d, device_t *dev, uint16_t ctx_id)
+{
+    struct iommu_context *ctx = NULL;
+    int ret = 0, rc;
+
+    if ( dev->context == ctx_id )
+        return 0;
+
+    if ( !(ctx = iommu_get_context(d, ctx_id)) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    pcidevs_lock();
+
+    if ( ctx->dying )
+    {
+        ret = -EINVAL;
+        goto unlock;
+    }
+
+    /* ignore attach operations on PCIe bridges */
+    if ( dev->type != DEV_TYPE_PCIe_BRIDGE )
+        ret = iommu_call(dom_iommu(d)->platform_ops, attach, d, dev, ctx);
+
+    if ( ret )
+        goto unlock;
+
+    /* See iommu_reattach_context() */
+    rc = iommu_reattach_phantom(d, dev, ctx);
+
+    if ( rc )
+    {
+        printk(XENLOG_ERR "IOMMU: Unable to attach %pp phantom functions\n",
+               &dev->sbdf);
+
+        if( iommu_call(dom_iommu(d)->platform_ops, detach, d, dev, ctx)
+            || iommu_detach_phantom(d, dev, ctx) )
+        {
+            printk(XENLOG_ERR "IOMMU: Improperly detached %pp\n", &dev->sbdf);
+            WARN();
+        }
+
+        ret = -EIO;
+        goto unlock;
+    }
+
+    dev->context = ctx_id;
+    list_add(&dev->context_list, &ctx->devices);
+
+unlock:
+    pcidevs_unlock();
+
+    if ( ctx )
+        iommu_put_context(ctx);
+
+    return ret;
+}
+
+int cf_check iommu_detach_context(struct domain *d, device_t *dev)
+{
+    struct iommu_context *ctx;
+    int ret = 0, rc;
+
+    if ( !dev->domain || dev->context == IOMMU_INVALID_CONTEXT_ID )
+    {
+        printk(XENLOG_WARNING "IOMMU: Trying to detach a non-attached device\n");
+        WARN();
+        return 0;
+    }
+
+    /* Make sure device is actually in the domain. */
+    ASSERT(d == dev->domain);
+
+    pcidevs_lock();
+
+    ctx = iommu_get_context(d, dev->context);
+    ASSERT(ctx); /* device is using an invalid context ?
+                    dev->context invalid ? */
+
+    /* ignore detach operations on PCIe bridges */
+    if ( dev->type != DEV_TYPE_PCIe_BRIDGE )
+        ret = iommu_call(dom_iommu(d)->platform_ops, detach, d, dev, ctx);
+
+    if ( ret )
+        goto unlock;
+
+    rc = iommu_detach_phantom(d, dev, ctx);
+
+    if ( rc )
+        printk(XENLOG_WARNING "IOMMU: "
+               "Improperly detached device functions (%d)\n", rc);
+
+    list_del(&dev->context_list);
+
+unlock:
+    pcidevs_unlock();
+    iommu_put_context(ctx);
+    return ret;
+}
+
+int cf_check iommu_reattach_context(struct domain *prev_dom, struct domain *next_dom,
+                                    device_t *dev, uint16_t ctx_id)
+{
+    uint16_t prev_ctx_id;
+    device_t *ctx_dev;
+    struct domain_iommu *prev_hd, *next_hd;
+    struct iommu_context *prev_ctx = NULL, *next_ctx = NULL;
+    int ret = 0, rc;
+    bool same_domain;
+
+    /* Make sure we actually are doing something meaningful */
+    BUG_ON(!prev_dom && !next_dom);
+
+    /* Device domain must be coherent with prev_dom. */
+    ASSERT(!prev_dom || dev->domain == prev_dom);
+
+    /// TODO: Do such cases exists ?
+    // /* Platform ops must match */
+    // if (dom_iommu(prev_dom)->platform_ops != dom_iommu(next_dom)->platform_ops)
+    //     return -EINVAL;
+
+    if ( !prev_dom )
+        return iommu_attach_context(next_dom, dev, ctx_id);
+
+    if ( !next_dom )
+        return iommu_detach_context(prev_dom, dev);
+
+    prev_hd = dom_iommu(prev_dom);
+    next_hd = dom_iommu(next_dom);
+
+    pcidevs_lock();
+
+    same_domain = prev_dom == next_dom;
+
+    prev_ctx_id = dev->context;
+
+    if ( same_domain && (ctx_id == prev_ctx_id) )
+    {
+        printk(XENLOG_DEBUG
+               "IOMMU: Reattaching %pp to same IOMMU context c%hu\n",
+               &dev->sbdf, ctx_id);
+        ret = 0;
+        goto unlock;
+    }
+
+    if ( !(prev_ctx = iommu_get_context(prev_dom, prev_ctx_id)) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    if ( !(next_ctx = iommu_get_context(next_dom, ctx_id)) )
+    {
+        ret = -ENOENT;
+        goto unlock;
+    }
+
+    if ( next_ctx->dying )
+    {
+        ret = -EINVAL;
+        goto unlock;
+    }
+
+    /* ignore reattach operations on PCIe bridges */
+    if ( dev->type != DEV_TYPE_PCIe_BRIDGE )
+        ret = iommu_call(prev_hd->platform_ops, reattach, next_dom, dev,
+                         prev_ctx, next_ctx);
+
+    if ( ret )
+        goto unlock;
+
+    /*
+     * We need to do special handling for phantom devices as they
+     * also use some other PCI functions behind the scenes.
+     */
+    rc = iommu_reattach_phantom(next_dom, dev, next_ctx);
+
+    if ( rc )
+    {
+        /**
+         * Device is being partially reattached (we have primary function and
+         * maybe some phantom functions attached to next_ctx, some others to prev_ctx),
+         * some functions of the device will be attached to next_ctx.
+         */
+        printk(XENLOG_WARNING "IOMMU: "
+               "Device %pp improperly reattached due to phantom function"
+               " reattach failure between %dd%dc and %dd%dc (%d)\n", dev,
+               prev_dom->domain_id, prev_ctx->id, next_dom->domain_id,
+               next_dom->domain_id, rc);
+
+        /* Try reattaching to previous context, reverting into a consistent state. */
+        if ( iommu_call(prev_hd->platform_ops, reattach, prev_dom, dev, next_ctx,
+                        prev_ctx) || iommu_reattach_phantom(prev_dom, dev, prev_ctx) )
+        {
+            printk(XENLOG_ERR "Unable to reattach %pp back to %dd%dc\n",
+                   &dev->sbdf, prev_dom->domain_id, prev_ctx->id);
+
+            if ( !is_hardware_domain(prev_dom) )
+                domain_crash(prev_dom);
+
+            if ( prev_dom != next_dom && !is_hardware_domain(next_dom) )
+                domain_crash(next_dom);
+
+            rc = -EIO;
+        }
+
+        ret = rc;
+        goto unlock;
+    }
+
+    /* Remove device from previous context, and add it to new one. */
+    list_for_each_entry(ctx_dev, &prev_ctx->devices, context_list)
+    {
+        if ( ctx_dev == dev )
+        {
+            list_del(&ctx_dev->context_list);
+            list_add(&ctx_dev->context_list, &next_ctx->devices);
+            break;
+        }
+    }
+
+    if (!ret)
+        dev->context = ctx_id; /* update device context*/
+
+unlock:
+    pcidevs_unlock();
+
+    if ( prev_ctx )
+        iommu_put_context(prev_ctx);
+
+    if ( next_ctx )
+        iommu_put_context(next_ctx);
+
+    return ret;
+}
+
+int cf_check iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( !hd->platform_ops->context_teardown )
+        return -ENOSYS;
+
+    ctx->dying = true;
+
+    /* first reattach devices back to default context if needed */
+    if ( flags & IOMMU_TEARDOWN_REATTACH_DEFAULT )
+    {
+        struct pci_dev *device;
+        list_for_each_entry(device, &ctx->devices, context_list)
+            iommu_reattach_context(d, d, device, 0);
+    }
+    else if (!list_empty(&ctx->devices))
+        return -EBUSY; /* there is a device in context */
+
+    return iommu_call(hd->platform_ops, context_teardown, d, ctx, flags);
+}
+
+int cf_check iommu_context_free(struct domain *d, uint16_t ctx_id, u32 flags)
+{
+    int ret;
+    struct domain_iommu *hd = dom_iommu(d);
+    struct iommu_context *ctx;
+
+    if ( ctx_id == 0 )
+        return -EINVAL;
+
+    if ( !(ctx = iommu_get_context(d, ctx_id)) )
+        return -ENOENT;
+
+    ret = iommu_context_teardown(d, ctx, flags);
+
+    if ( !ret )
+        clear_bit(ctx_id - 1, hd->other_contexts.bitmap);
+
+    iommu_put_context(ctx);
+    return ret;
+}
+
 int iommu_quarantine_dev_init(device_t *dev)
 {
-    const struct domain_iommu *hd = dom_iommu(dom_io);
+    int ret;
+    uint16_t ctx_id;
 
-    if ( !iommu_quarantine || !hd->platform_ops->quarantine_init )
+    if ( !iommu_quarantine )
         return 0;
 
-    return iommu_call(hd->platform_ops, quarantine_init,
-                      dev, iommu_quarantine == IOMMU_quarantine_scratch_page);
+    ret = iommu_context_alloc(dom_io, &ctx_id, IOMMU_CONTEXT_INIT_quarantine);
+
+    if ( ret )
+        return ret;
+
+    /** TODO: Setup scratch page, mappings... */
+
+    ret = iommu_reattach_context(dev->domain, dom_io, dev, ctx_id);
+
+    if ( ret )
+    {
+        ASSERT(!iommu_context_free(dom_io, ctx_id, 0));
+        return ret;
+    }
+
+    return ret;
 }
 
-static int __init iommu_quarantine_init(void)
+int __init iommu_quarantine_init(void)
 {
     dom_io->options |= XEN_DOMCTL_CDF_iommu;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index ee73d55740..2d9db79787 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -330,6 +330,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->bus) = bus;
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
+    pdev->context = IOMMU_INVALID_CONTEXT_ID;
 
     INIT_LIST_HEAD(&pdev->vf_list);
 
@@ -604,7 +605,6 @@ static void pci_enable_acs(struct pci_dev *pdev)
 }
 
 static int iommu_add_device(struct pci_dev *pdev);
-static int iommu_enable_device(struct pci_dev *pdev);
 static int iommu_remove_device(struct pci_dev *pdev);
 
 unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
@@ -654,6 +654,101 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
     return is64bits ? 2 : 1;
 }
 
+static int device_assigned(struct pci_dev *pdev)
+{
+    int rc = 0;
+
+    /*
+     * If the device exists and it is not owned by either the hardware
+     * domain or dom_io then it must be assigned to a guest, or be
+     * hidden (owned by dom_xen).
+     */
+    if ( pdev->domain != hardware_domain && pdev->domain != dom_io )
+        rc = -EBUSY;
+
+    return rc;
+}
+
+/* Caller should hold the pcidevs_lock */
+static int pci_reassign_device(struct domain *prev_dom, struct domain *next_dom,
+                               struct pci_dev *pdev, u32 flag)
+{
+    int rc = 0;
+    ASSERT(prev_dom || next_dom);
+
+    if ( !is_iommu_enabled(next_dom) )
+        return -EINVAL;
+
+    if ( !arch_iommu_use_permitted(next_dom) )
+        return -EXDEV;
+
+    /* Do not allow broken devices to be assigned to guests. */
+    if ( pdev->broken && next_dom != hardware_domain && next_dom != dom_io )
+        return -EBADF;
+
+    if ( prev_dom )
+    {
+        write_lock(&prev_dom->pci_lock);
+        vpci_deassign_device(pdev);
+        write_unlock(&prev_dom->pci_lock);
+    }
+
+    rc = pdev_msix_assign(next_dom, pdev);
+    if ( rc )
+        goto done;
+
+    pdev->fault.count = 0;
+
+    if ( prev_dom && next_dom )
+    {
+        printk(XENLOG_INFO "PCI: Reassigning PCI device from %dd to %dd\n",
+               prev_dom->domain_id, next_dom->domain_id);
+    }
+    else if ( prev_dom )
+    {
+        printk(XENLOG_INFO "PCI: Assigning PCI device to %dd\n", prev_dom->domain_id);
+    }
+    else if ( next_dom )
+    {
+        printk(XENLOG_INFO "PCI: Remove PCI device of %dd\n", next_dom->domain_id);
+    }
+    else
+    {
+        ASSERT_UNREACHABLE();
+    }
+
+    rc = iommu_reattach_context(prev_dom, next_dom, pci_to_dev(pdev), 0);
+
+    if ( rc )
+        goto done;
+
+    if ( prev_dom )
+    {
+        write_lock(&prev_dom->pci_lock);
+        list_del(&pdev->domain_list);
+        write_unlock(&prev_dom->pci_lock);
+    }
+
+    pdev->domain = next_dom;
+
+    if ( next_dom )
+    {
+        write_lock(&next_dom->pci_lock);
+        list_add(&pdev->domain_list, &next_dom->pdev_list);
+
+        rc = vpci_assign_device(pdev);
+        write_unlock(&next_dom->pci_lock);
+    }
+
+ done:
+
+    /* The device is assigned to dom_io so mark it as quarantined */
+    if ( !rc && next_dom == dom_io )
+        pdev->quarantine = true;
+
+    return rc;
+}
+
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node)
 {
@@ -798,7 +893,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         }
     }
     else
-        iommu_enable_device(pdev);
+        ret = iommu_add_device(pdev);
 
     pci_enable_acs(pdev);
 
@@ -878,74 +973,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
-/* Caller should hold the pcidevs_lock */
-static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
-                           uint8_t devfn)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    struct pci_dev *pdev;
-    struct domain *target;
-    int ret = 0;
-
-    if ( !is_iommu_enabled(d) )
-        return -EINVAL;
-
-    ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
-    if ( !pdev )
-        return -ENODEV;
-
-    /* De-assignment from dom_io should de-quarantine the device */
-    if ( (pdev->quarantine || iommu_quarantine) && pdev->domain != dom_io )
-    {
-        ret = iommu_quarantine_dev_init(pci_to_dev(pdev));
-        if ( ret )
-           return ret;
-
-        target = dom_io;
-    }
-    else
-        target = hardware_domain;
-
-    while ( pdev->phantom_stride )
-    {
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            break;
-        ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
-                         pci_to_dev(pdev));
-        if ( ret )
-            goto out;
-    }
-
-    write_lock(&d->pci_lock);
-    vpci_deassign_device(pdev);
-    write_unlock(&d->pci_lock);
-
-    devfn = pdev->devfn;
-    ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
-                     pci_to_dev(pdev));
-    if ( ret )
-        goto out;
-
-    if ( pdev->domain == hardware_domain  )
-        pdev->quarantine = false;
-
-    pdev->fault.count = 0;
-
-    write_lock(&target->pci_lock);
-    /* Re-assign back to hardware_domain */
-    ret = vpci_assign_device(pdev);
-    write_unlock(&target->pci_lock);
-
- out:
-    if ( ret )
-        printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
-               d, &PCI_SBDF(seg, bus, devfn), ret);
-
-    return ret;
-}
-
 int pci_release_devices(struct domain *d)
 {
     int combined_ret;
@@ -967,13 +994,10 @@ int pci_release_devices(struct domain *d)
         struct pci_dev *pdev = list_first_entry(&d->pdev_list,
                                                 struct pci_dev,
                                                 domain_list);
-        uint16_t seg = pdev->seg;
-        uint8_t bus = pdev->bus;
-        uint8_t devfn = pdev->devfn;
         int ret;
 
         write_unlock(&d->pci_lock);
-        ret = deassign_device(d, seg, bus, devfn);
+        ret = pci_reassign_device(d, dom_io, pdev, 0);
         write_lock(&d->pci_lock);
         if ( ret )
         {
@@ -1181,25 +1205,18 @@ struct setup_hwdom {
 static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
                                                 struct pci_dev *pdev)
 {
-    u8 devfn = pdev->devfn;
     int err;
 
-    do {
-        err = ctxt->handler(devfn, pdev);
-        if ( err )
-        {
-            printk(XENLOG_ERR "setup %pp for d%d failed (%d)\n",
-                   &pdev->sbdf, ctxt->d->domain_id, err);
-            if ( devfn == pdev->devfn )
-                return;
-        }
-        devfn += pdev->phantom_stride;
-    } while ( devfn != pdev->devfn &&
-              PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
+    err = ctxt->handler(pdev->devfn, pdev);
+
+    if ( err )
+        goto done;
 
     write_lock(&ctxt->d->pci_lock);
     err = vpci_assign_device(pdev);
     write_unlock(&ctxt->d->pci_lock);
+
+done:
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
                ctxt->d->domain_id, err);
@@ -1398,8 +1415,6 @@ __initcall(setup_dump_pcidevs);
 static int iommu_add_device(struct pci_dev *pdev)
 {
     const struct domain_iommu *hd;
-    int rc;
-    unsigned int devfn = pdev->devfn;
 
     if ( !pdev->domain )
         return -EINVAL;
@@ -1410,180 +1425,18 @@ static int iommu_add_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
-    rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
-    if ( rc || !pdev->phantom_stride )
-        return rc;
-
-    for ( ; ; )
-    {
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            return 0;
-        rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
-        if ( rc )
-            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
-                   &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
-    }
-}
-
-static int iommu_enable_device(struct pci_dev *pdev)
-{
-    const struct domain_iommu *hd;
-
-    if ( !pdev->domain )
-        return -EINVAL;
-
-    ASSERT(pcidevs_locked());
-
-    hd = dom_iommu(pdev->domain);
-    if ( !is_iommu_enabled(pdev->domain) ||
-         !hd->platform_ops->enable_device )
-        return 0;
-
-    return iommu_call(hd->platform_ops, enable_device, pci_to_dev(pdev));
+    return iommu_attach_context(pdev->domain, pci_to_dev(pdev), 0);
 }
 
 static int iommu_remove_device(struct pci_dev *pdev)
 {
-    const struct domain_iommu *hd;
-    u8 devfn;
-
     if ( !pdev->domain )
         return -EINVAL;
 
-    hd = dom_iommu(pdev->domain);
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
-    for ( devfn = pdev->devfn ; pdev->phantom_stride; )
-    {
-        int rc;
-
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            break;
-        rc = iommu_call(hd->platform_ops, remove_device, devfn,
-                        pci_to_dev(pdev));
-        if ( !rc )
-            continue;
-
-        printk(XENLOG_ERR "IOMMU: remove %pp failed (%d)\n",
-               &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
-        return rc;
-    }
-
-    devfn = pdev->devfn;
-
-    return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
-}
-
-static int device_assigned(u16 seg, u8 bus, u8 devfn)
-{
-    struct pci_dev *pdev;
-    int rc = 0;
-
-    ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
-
-    if ( !pdev )
-        rc = -ENODEV;
-    /*
-     * If the device exists and it is not owned by either the hardware
-     * domain or dom_io then it must be assigned to a guest, or be
-     * hidden (owned by dom_xen).
-     */
-    else if ( pdev->domain != hardware_domain &&
-              pdev->domain != dom_io )
-        rc = -EBUSY;
-
-    return rc;
-}
-
-/* Caller should hold the pcidevs_lock */
-static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-    struct pci_dev *pdev;
-    int rc = 0;
-
-    if ( !is_iommu_enabled(d) )
-        return 0;
-
-    if ( !arch_iommu_use_permitted(d) )
-        return -EXDEV;
-
-    /* device_assigned() should already have cleared the device for assignment */
-    ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
-    ASSERT(pdev && (pdev->domain == hardware_domain ||
-                    pdev->domain == dom_io));
-
-    /* Do not allow broken devices to be assigned to guests. */
-    rc = -EBADF;
-    if ( pdev->broken && d != hardware_domain && d != dom_io )
-        goto done;
-
-    write_lock(&pdev->domain->pci_lock);
-    vpci_deassign_device(pdev);
-    write_unlock(&pdev->domain->pci_lock);
-
-    rc = pdev_msix_assign(d, pdev);
-    if ( rc )
-        goto done;
-
-    if ( pdev->domain != dom_io )
-    {
-        rc = iommu_quarantine_dev_init(pci_to_dev(pdev));
-        if ( rc )
-            goto done;
-    }
-
-    pdev->fault.count = 0;
-
-    rc = iommu_call(hd->platform_ops, assign_device, d, devfn, pci_to_dev(pdev),
-                    flag);
-
-    while ( pdev->phantom_stride && !rc )
-    {
-        devfn += pdev->phantom_stride;
-        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
-            break;
-        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
-                        pci_to_dev(pdev), flag);
-    }
-
-    if ( rc )
-        goto done;
-
-    write_lock(&d->pci_lock);
-    rc = vpci_assign_device(pdev);
-    write_unlock(&d->pci_lock);
-
- done:
-    if ( rc )
-    {
-        printk(XENLOG_G_WARNING "%pd: assign %s(%pp) failed (%d)\n",
-               d, devfn != pdev->devfn ? "phantom function " : "",
-               &PCI_SBDF(seg, bus, devfn), rc);
-
-        if ( devfn != pdev->devfn && deassign_device(d, seg, bus, pdev->devfn) )
-        {
-            /*
-             * Device with phantom functions that failed to both assign and
-             * rollback.  Mark the device as broken and crash the target domain,
-             * as the state of the functions at this point is unknown and Xen
-             * has no way to assert consistent context assignment among them.
-             */
-            pdev->broken = true;
-            if ( !is_hardware_domain(d) && d != dom_io )
-                domain_crash(d);
-        }
-    }
-    /* The device is assigned to dom_io so mark it as quarantined */
-    else if ( d == dom_io )
-        pdev->quarantine = true;
-
-    return rc;
+    return iommu_detach_context(pdev->domain, pdev);
 }
 
 static int iommu_get_device_group(
@@ -1673,6 +1526,7 @@ int iommu_do_pci_domctl(
     u8 bus, devfn;
     int ret = 0;
     uint32_t machine_sbdf;
+    struct pci_dev *pdev;
 
     switch ( domctl->cmd )
     {
@@ -1742,7 +1596,15 @@ int iommu_do_pci_domctl(
         devfn = PCI_DEVFN(machine_sbdf);
 
         pcidevs_lock();
-        ret = device_assigned(seg, bus, devfn);
+        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
+
+        if ( !pdev )
+        {
+            printk(XENLOG_G_INFO "%pp doesn't exist", &PCI_SBDF(seg, bus, devfn));
+            break;
+        }
+
+        ret = device_assigned(pdev);
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
         {
             if ( ret )
@@ -1753,7 +1615,7 @@ int iommu_do_pci_domctl(
             }
         }
         else if ( !ret )
-            ret = assign_device(d, seg, bus, devfn, flags);
+            ret = pci_reassign_device(pdev->domain, d, pdev, flags);
         pcidevs_unlock();
         if ( ret == -ERESTART )
             ret = hypercall_create_continuation(__HYPERVISOR_domctl,
@@ -1787,7 +1649,20 @@ int iommu_do_pci_domctl(
         devfn = PCI_DEVFN(machine_sbdf);
 
         pcidevs_lock();
-        ret = deassign_device(d, seg, bus, devfn);
+        pdev = pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
+
+        if ( pdev )
+        {
+            struct domain *target = hardware_domain;
+
+            if ( (pdev->quarantine || iommu_quarantine) && pdev->domain != dom_io )
+                target = dom_io;
+
+            ret = pci_reassign_device(d, target, pdev, 0);
+        }
+        else
+            ret = -ENODEV;
+
         pcidevs_unlock();
         break;
 
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 82db8f9435..a980be3646 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -78,12 +78,12 @@ uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
 void *map_vtd_domain_page(u64 maddr);
 void unmap_vtd_domain_page(const void *va);
-int domain_context_mapping_one(struct domain *domain, struct iommu_context *ctx,
-                               struct vtd_iommu *iommu, uint8_t bus, uint8_t devfn,
-                               const struct pci_dev *pdev, domid_t domid,
-                               paddr_t pgd_maddr, unsigned int mode);
-int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
-                             uint8_t bus, uint8_t devfn);
+int apply_context_single(struct domain *domain, struct iommu_context *ctx,
+                         struct vtd_iommu *iommu, uint8_t bus, uint8_t devfn,
+                         struct iommu_context *prev_ctx);
+int unapply_context_single(struct domain *domain, struct vtd_iommu *iommu,
+                           struct iommu_context *prev_ctx, uint8_t bus,
+                           uint8_t devfn);
 int cf_check intel_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt);
 
@@ -104,8 +104,9 @@ void platform_quirks_init(void);
 void vtd_ops_preamble_quirk(struct vtd_iommu *iommu);
 void vtd_ops_postamble_quirk(struct vtd_iommu *iommu);
 int __must_check me_wifi_quirk(struct domain *domain, uint8_t bus,
-                               uint8_t devfn, domid_t domid, paddr_t pgd_maddr,
-                               unsigned int mode);
+                               uint8_t devfn, domid_t domid,
+                               unsigned int mode, struct iommu_context *ctx,
+                               struct iommu_context *prev_ctx);
 void pci_vtd_quirk(const struct pci_dev *);
 void quirk_iommu_caps(struct vtd_iommu *iommu);
 
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 3668185ebc..3319903297 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -27,6 +27,7 @@
 #include <xen/iommu.h>
 #include <xen/numa.h>
 #include <xen/softirq.h>
+#include <xen/event.h>
 #include <xen/time.h>
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
@@ -61,7 +62,6 @@ static unsigned int __ro_after_init min_pt_levels = UINT_MAX;
 static struct tasklet vtd_fault_tasklet;
 
 static int cf_check setup_hwdom_device(u8 devfn, struct pci_dev *);
-static void setup_hwdom_rmrr(struct domain *d);
 
 #define DID_FIELD_WIDTH 16
 #define DID_HIGH_OFFSET 8
@@ -165,7 +165,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain,
     u64 pte_maddr = 0;
 
     addr &= (((u64)1) << addr_width) - 1;
-    ASSERT(spin_is_locked(&ctx->arch.mapping_lock));
+    ASSERT(rspin_is_locked(&ctx->lock));
     ASSERT(target || !alloc);
 
     if ( !ctx->arch.vtd.pgd_maddr )
@@ -270,36 +270,22 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain,
     return pte_maddr;
 }
 
-static paddr_t domain_pgd_maddr(struct domain *d, struct iommu_context *ctx,
-                                paddr_t pgd_maddr, unsigned int nr_pt_levels)
+static paddr_t get_context_pgd(struct domain *d, struct iommu_context *ctx,
+                               unsigned int nr_pt_levels)
 {
     unsigned int agaw;
+    paddr_t pgd_maddr = ctx->arch.vtd.pgd_maddr;
 
-    ASSERT(spin_is_locked(&ctx->arch.mapping_lock));
-
-    if ( pgd_maddr )
-        /* nothing */;
-    else if ( iommu_use_hap_pt(d) )
+    if ( !ctx->arch.vtd.pgd_maddr )
     {
-        pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
+        /*
+         * Ensure we have pagetables allocated down to the smallest
+         * level the loop below may need to run to.
+         */
+        addr_to_dma_page_maddr(d, ctx, 0, min_pt_levels, NULL, true);
 
-        pgd_maddr = pagetable_get_paddr(pgt);
-    }
-    else
-    {
         if ( !ctx->arch.vtd.pgd_maddr )
-        {
-            /*
-             * Ensure we have pagetables allocated down to the smallest
-             * level the loop below may need to run to.
-             */
-            addr_to_dma_page_maddr(d, ctx, 0, min_pt_levels, NULL, true);
-
-            if ( !ctx->arch.vtd.pgd_maddr )
-                return 0;
-        }
-
-        pgd_maddr = ctx->arch.vtd.pgd_maddr;
+            return 0;
     }
 
     /* Skip top level(s) of page tables for less-than-maximum level DRHDs. */
@@ -569,17 +555,20 @@ static int __must_check iommu_flush_all(void)
     return rc;
 }
 
-static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
+static int __must_check cf_check iommu_flush_iotlb(struct domain *d,
+                                                   struct iommu_context *ctx,
+                                                   dfn_t dfn,
                                                    unsigned long page_count,
                                                    unsigned int flush_flags)
 {
-    struct iommu_context *ctx = iommu_default_context(d);
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
     bool flush_dev_iotlb;
     int iommu_domid;
     int ret = 0;
 
+    ASSERT(ctx);
+
     if ( flush_flags & IOMMU_FLUSHF_all )
     {
         dfn = INVALID_DFN;
@@ -1240,7 +1229,8 @@ void __init iommu_free(struct acpi_drhd_unit *drhd)
         agaw = 64;                              \
     agaw; })
 
-static int cf_check intel_iommu_context_init(struct domain *d, struct iommu_context *ctx)
+static int cf_check intel_iommu_context_init(struct domain *d, struct iommu_context *ctx,
+                                             u32 flags)
 {
     struct acpi_drhd_unit *drhd;
 
@@ -1255,6 +1245,27 @@ static int cf_check intel_iommu_context_init(struct domain *d, struct iommu_cont
         return -ENOMEM;
     }
 
+    ctx->arch.vtd.superpage_progress = 0;
+
+    if ( flags & IOMMU_CONTEXT_INIT_default )
+    {
+        ctx->arch.vtd.pgd_maddr = 0;
+
+        /*
+         * Context is considered "opaque" (non-managed) in these cases :
+         *  - HAP is enabled, in this case, the pagetable is not managed by the
+         *    IOMMU code, thus opaque
+         *  - IOMMU is in passthrough which means that there is no actual pagetable
+         */
+        if ( iommu_use_hap_pt(d) )
+        {
+            pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
+            ctx->arch.vtd.pgd_maddr = pagetable_get_paddr(pgt);
+
+            ctx->opaque = true;
+        }
+    }
+
     // TODO: Allocate IOMMU domid only when attaching devices ?
     /* Populate context DID map using pseudo DIDs */
     for_each_drhd_unit(drhd)
@@ -1263,7 +1274,11 @@ static int cf_check intel_iommu_context_init(struct domain *d, struct iommu_cont
             iommu_alloc_domid(drhd->iommu->domid_bitmap);
     }
 
-    return arch_iommu_context_init(d, ctx, 0);
+    if ( !ctx->opaque )
+        /* Create initial context page */
+        addr_to_dma_page_maddr(d, ctx, 0, min_pt_levels, NULL, true);
+
+    return arch_iommu_context_init(d, ctx, flags);
 }
 
 static int cf_check intel_iommu_domain_init(struct domain *d)
@@ -1272,7 +1287,7 @@ static int cf_check intel_iommu_domain_init(struct domain *d)
 
     hd->arch.vtd.agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
 
-    return intel_iommu_context_init(d, iommu_default_context(d));
+    return 0;
 }
 
 static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
@@ -1280,7 +1295,7 @@ static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
     struct acpi_drhd_unit *drhd;
 
     setup_hwdom_pci_devices(d, setup_hwdom_device);
-    setup_hwdom_rmrr(d);
+
     /* Make sure workarounds are applied before enabling the IOMMU(s). */
     arch_iommu_hwdom_init(d);
 
@@ -1297,21 +1312,17 @@ static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
     }
 }
 
-/*
- * This function returns
- * - a negative errno value upon error,
- * - zero upon success when previously the entry was non-present, or this isn't
- *   the "main" request for a device (pdev == NULL), or for no-op quarantining
- *   assignments,
- * - positive (one) upon success when previously the entry was present and this
- *   is the "main" request for a device (pdev != NULL).
+/**
+ * Apply a context on a device.
+ * @param domain Domain of the context
+ * @param ctx IOMMU context to apply
+ * @param iommu IOMMU hardware to use (must match device iommu)
+ * @param bus PCI device bus
+ * @param devfn PCI device function
  */
-int domain_context_mapping_one(
-    struct domain *domain,
-    struct iommu_context *ctx,
-    struct vtd_iommu *iommu,
-    uint8_t bus, uint8_t devfn, const struct pci_dev *pdev,
-    domid_t domid, paddr_t pgd_maddr, unsigned int mode)
+int apply_context_single(struct domain *domain, struct iommu_context *ctx,
+                         struct vtd_iommu *iommu, uint8_t bus, uint8_t devfn,
+                         struct iommu_context *prev_ctx)
 {
     struct context_entry *context, *context_entries, lctxt;
     __uint128_t res, old;
@@ -1320,8 +1331,6 @@ int domain_context_mapping_one(
     int rc, ret;
     bool flush_dev_iotlb, overwrite_entry = false;
 
-    struct iommu_context *prev_ctx = pdev->domain ? iommu_default_context(pdev->domain) : NULL;
-
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
     maddr = bus_to_context_maddr(iommu, bus);
@@ -1342,7 +1351,7 @@ int domain_context_mapping_one(
         overwrite_entry = true;
     }
 
-    if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
+    if ( iommu_hwdom_passthrough && is_hardware_domain(domain) && !ctx->id )
     {
         context_set_translation_type(lctxt, CONTEXT_TT_PASS_THRU);
     }
@@ -1350,9 +1359,7 @@ int domain_context_mapping_one(
     {
         paddr_t root;
 
-        spin_lock(&ctx->arch.mapping_lock);
-
-        root = domain_pgd_maddr(domain, ctx, pgd_maddr, iommu->nr_pt_levels);
+        root = get_context_pgd(domain, ctx, iommu->nr_pt_levels);
         if ( !root )
         {
             unmap_vtd_domain_page(context_entries);
@@ -1364,8 +1371,6 @@ int domain_context_mapping_one(
             context_set_translation_type(lctxt, CONTEXT_TT_DEV_IOTLB);
         else
             context_set_translation_type(lctxt, CONTEXT_TT_MULTI_LEVEL);
-
-        spin_unlock(&ctx->arch.mapping_lock);
     }
 
     rc = context_set_domain_id(&lctxt, did, iommu);
@@ -1394,7 +1399,6 @@ int domain_context_mapping_one(
     }
 
     iommu_sync_cache(context, sizeof(struct context_entry));
-    spin_unlock(&iommu->lock);
 
     rc = iommu_flush_context_device(iommu, prev_did, PCI_BDF(bus, devfn),
                                     DMA_CCMD_MASK_NOBIT, !overwrite_entry);
@@ -1428,7 +1432,7 @@ int domain_context_mapping_one(
     spin_unlock(&iommu->lock);
 
     if ( !seg && !rc )
-        rc = me_wifi_quirk(domain, bus, devfn, domid, pgd_maddr, mode);
+        WARN_ON(me_wifi_quirk(domain, bus, devfn, did, 0, ctx, prev_ctx));
 
     return rc;
 
@@ -1438,152 +1442,23 @@ int domain_context_mapping_one(
         return rc;
 }
 
-static const struct acpi_drhd_unit *domain_context_unmap(
-    struct domain *d, uint8_t devfn, struct pci_dev *pdev);
-
-static int domain_context_mapping(struct domain *domain, struct iommu_context *ctx,
-                                  u8 devfn, struct pci_dev *pdev)
+int apply_context(struct domain *d, struct iommu_context *ctx,
+                  struct pci_dev *pdev, u8 devfn,
+                  struct iommu_context *prev_ctx)
 {
-    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
-    const struct acpi_rmrr_unit *rmrr;
-    paddr_t pgd_maddr = ctx->arch.vtd.pgd_maddr;
-    domid_t did = ctx->arch.vtd.didmap[drhd->iommu->index];
+    struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+    struct vtd_iommu *iommu = drhd->iommu;
     int ret = 0;
-    unsigned int i, mode = 0;
-    uint16_t seg = pdev->seg, bdf;
-    uint8_t bus = pdev->bus, secbus;
 
-    /*
-     * Generally we assume only devices from one node to get assigned to a
-     * given guest.  But even if not, by replacing the prior value here we
-     * guarantee that at least some basic allocations for the device being
-     * added will get done against its node.  Any further allocations for
-     * this or other devices may be penalized then, but some would also be
-     * if we left other than NUMA_NO_NODE untouched here.
-     */
-    if ( drhd && drhd->iommu->node != NUMA_NO_NODE )
-        dom_iommu(domain)->node = drhd->iommu->node;
+    if ( !drhd )
+        return -EINVAL;
 
     ASSERT(pcidevs_locked());
 
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment != pdev->seg || bdf != pdev->sbdf.bdf )
-            continue;
-
-        mode |= MAP_WITH_RMRR;
-        break;
-    }
-
-    if ( domain != pdev->domain && pdev->domain != dom_io &&
-         pdev->domain->is_dying )
-        mode |= MAP_OWNER_DYING;
-
-    switch ( pdev->type )
-    {
-        bool prev_present;
-
-    case DEV_TYPE_PCI_HOST_BRIDGE:
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:Hostbridge: skip %pp map\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        if ( !is_hardware_domain(domain) )
-            return -EPERM;
-        break;
-
-    case DEV_TYPE_PCIe_BRIDGE:
-    case DEV_TYPE_PCIe2PCI_BRIDGE:
-    case DEV_TYPE_LEGACY_PCI_BRIDGE:
-        break;
-
-    case DEV_TYPE_PCIe_ENDPOINT:
-        if ( !drhd )
-            return -ENODEV;
+    ret = apply_context_single(d, ctx, iommu, pdev->bus, pdev->devfn, prev_ctx);
 
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCIe: map %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn, pdev,
-                                         did, pgd_maddr, mode);
-        if ( ret > 0 )
-            ret = 0;
-        if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
-            enable_ats_device(pdev, &drhd->iommu->ats_devices);
-
-        break;
-
-    case DEV_TYPE_PCI:
-        if ( !drhd )
-            return -ENODEV;
-
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCI: map %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-
-        ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn,
-                                         pdev, did, pgd_maddr, mode);
-        if ( ret < 0 )
-            break;
-        prev_present = ret;
-
-        if ( (ret = find_upstream_bridge(seg, &bus, &devfn, &secbus)) < 1 )
-        {
-            if ( !ret )
-                break;
-            ret = -ENXIO;
-        }
-        /*
-         * Strictly speaking if the device is the only one behind this bridge
-         * and the only one with this (secbus,0,0) tuple, it could be allowed
-         * to be re-assigned regardless of RMRR presence.  But let's deal with
-         * that case only if it is actually found in the wild.  Note that
-         * dealing with this just here would still not render the operation
-         * secure.
-         */
-        else if ( prev_present && (mode & MAP_WITH_RMRR) &&
-                  domain != pdev->domain )
-            ret = -EOPNOTSUPP;
-
-        /*
-         * Mapping a bridge should, if anything, pass the struct pci_dev of
-         * that bridge. Since bridges don't normally get assigned to guests,
-         * their owner would be the wrong one. Pass NULL instead.
-         */
-        if ( ret >= 0 )
-            ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn,
-                                             NULL, did, pgd_maddr, mode);
-
-        /*
-         * Devices behind PCIe-to-PCI/PCIx bridge may generate different
-         * requester-id. It may originate from devfn=0 on the secondary bus
-         * behind the bridge. Map that id as well if we didn't already.
-         *
-         * Somewhat similar as for bridges, we don't want to pass a struct
-         * pci_dev here - there may not even exist one for this (secbus,0,0)
-         * tuple. If there is one, without properly working device groups it
-         * may again not have the correct owner.
-         */
-        if ( !ret && pdev_type(seg, bus, devfn) == DEV_TYPE_PCIe2PCI_BRIDGE &&
-             (secbus != pdev->bus || pdev->devfn != 0) )
-            ret = domain_context_mapping_one(domain, ctx, drhd->iommu, secbus, 0,
-                                             NULL, did, pgd_maddr, mode);
-
-        if ( ret )
-        {
-            if ( !prev_present )
-                domain_context_unmap(domain, devfn, pdev);
-            else if ( pdev->domain != domain ) /* Avoid infinite recursion. */
-                domain_context_mapping(pdev->domain, ctx, devfn, pdev);
-        }
-
-        break;
-
-    default:
-        dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
-        ret = -EINVAL;
-        break;
-    }
+    if ( !ret && ats_device(pdev, drhd) > 0 )
+        enable_ats_device(pdev, &iommu->ats_devices);
 
     if ( !ret && devfn == pdev->devfn )
         pci_vtd_quirk(pdev);
@@ -1591,10 +1466,8 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
     return ret;
 }
 
-int domain_context_unmap_one(
-    struct domain *domain,
-    struct vtd_iommu *iommu,
-    uint8_t bus, uint8_t devfn)
+int unapply_context_single(struct domain *domain, struct vtd_iommu *iommu,
+                           struct iommu_context *prev_ctx, uint8_t bus, uint8_t devfn)
 {
     struct context_entry *context, *context_entries;
     u64 maddr;
@@ -1648,12 +1521,18 @@ int domain_context_unmap_one(
     if ( rc > 0 )
         rc = 0;
 
+    if ( !rc )
+    {
+        BUG_ON(!prev_ctx->arch.vtd.iommu_dev_cnt[iommu->index]);
+        prev_ctx->arch.vtd.iommu_dev_cnt[iommu->index]--;
+    }
+
     spin_unlock(&iommu->lock);
     unmap_vtd_domain_page(context_entries);
 
     if ( !iommu->drhd->segment && !rc )
-        rc = me_wifi_quirk(domain, bus, devfn, DOMID_INVALID, 0,
-                           UNMAP_ME_PHANTOM_FUNC);
+        WARN_ON(me_wifi_quirk(domain, bus, devfn, DOMID_INVALID, UNMAP_ME_PHANTOM_FUNC,
+                           NULL, prev_ctx));
 
     if ( rc && !is_hardware_domain(domain) && domain != dom_io )
     {
@@ -1671,128 +1550,27 @@ int domain_context_unmap_one(
     return rc;
 }
 
-static const struct acpi_drhd_unit *domain_context_unmap(
-    struct domain *domain,
-    uint8_t devfn,
-    struct pci_dev *pdev)
-{
-    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
-    struct vtd_iommu *iommu = drhd ? drhd->iommu : NULL;
-    int ret;
-    uint16_t seg = pdev->seg;
-    uint8_t bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
-
-    switch ( pdev->type )
-    {
-    case DEV_TYPE_PCI_HOST_BRIDGE:
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:Hostbridge: skip %pp unmap\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        return ERR_PTR(is_hardware_domain(domain) ? 0 : -EPERM);
-
-    case DEV_TYPE_PCIe_BRIDGE:
-    case DEV_TYPE_PCIe2PCI_BRIDGE:
-    case DEV_TYPE_LEGACY_PCI_BRIDGE:
-        return ERR_PTR(0);
-
-    case DEV_TYPE_PCIe_ENDPOINT:
-        if ( !iommu )
-            return ERR_PTR(-ENODEV);
-
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
-            disable_ats_device(pdev);
-
-        break;
-
-    case DEV_TYPE_PCI:
-        if ( !iommu )
-            return ERR_PTR(-ENODEV);
-
-        if ( iommu_debug )
-            printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
-                   domain, &PCI_SBDF(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        if ( ret )
-            break;
-
-        tmp_bus = bus;
-        tmp_devfn = devfn;
-        if ( (ret = find_upstream_bridge(seg, &tmp_bus, &tmp_devfn,
-                                         &secbus)) < 1 )
-        {
-            if ( ret )
-            {
-                ret = -ENXIO;
-                if ( !domain->is_dying &&
-                     !is_hardware_domain(domain) && domain != dom_io )
-                {
-                    domain_crash(domain);
-                    /* Make upper layers continue in a best effort manner. */
-                    ret = 0;
-                }
-            }
-            break;
-        }
-
-        ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn);
-        /* PCIe to PCI/PCIx bridge */
-        if ( !ret && pdev_type(seg, tmp_bus, tmp_devfn) == DEV_TYPE_PCIe2PCI_BRIDGE )
-            ret = domain_context_unmap_one(domain, iommu, secbus, 0);
-
-        break;
-
-    default:
-        dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
-        return ERR_PTR(-EINVAL);
-    }
-
-    return drhd;
-}
-
-static void cf_check iommu_clear_root_pgtable(struct domain *d)
+static void cf_check iommu_clear_root_pgtable(struct domain *d,
+                                              struct iommu_context *ctx)
 {
-    struct iommu_context *ctx = iommu_default_context(d);
-
-    spin_lock(&ctx->arch.mapping_lock);
     ctx->arch.vtd.pgd_maddr = 0;
-    spin_unlock(&ctx->arch.mapping_lock);
 }
 
 static void cf_check iommu_domain_teardown(struct domain *d)
 {
     struct iommu_context *ctx = iommu_default_context(d);
-    const struct acpi_drhd_unit *drhd;
 
     if ( list_empty(&acpi_drhd_units) )
         return;
 
-    iommu_identity_map_teardown(d, ctx);
-
     ASSERT(!ctx->arch.vtd.pgd_maddr);
-
-    for_each_drhd_unit ( drhd )
-        iommu_free_domid(d->domain_id, drhd->iommu->domid_bitmap);
-
-    XFREE(ctx->arch.vtd.iommu_dev_cnt);
-    XFREE(ctx->arch.vtd.didmap);
-}
-
-static void quarantine_teardown(struct pci_dev *pdev,
-                                const struct acpi_drhd_unit *drhd)
-{
 }
 
 static int __must_check cf_check intel_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
-    unsigned int *flush_flags)
+    unsigned int *flush_flags, struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct iommu_context *ctx = iommu_default_context(d);
     struct dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
     unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
@@ -1801,35 +1579,22 @@ static int __must_check cf_check intel_iommu_map_page(
     ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
            PAGE_SIZE_4K);
 
-    /* Do nothing if VT-d shares EPT page table */
-    if ( iommu_use_hap_pt(d) )
+    if ( ctx->opaque )
         return 0;
 
-    /* Do nothing if hardware domain and iommu supports pass thru. */
-    if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
-        return 0;
-
-    spin_lock(&ctx->arch.mapping_lock);
-
     /*
      * IOMMU mapping request can be safely ignored when the domain is dying.
      *
-     * hd->arch.mapping_lock guarantees that d->is_dying will be observed
+     * hd->lock guarantees that d->is_dying will be observed
      * before any page tables are freed (see iommu_free_pgtables())
      */
     if ( d->is_dying )
-    {
-        spin_unlock(&ctx->arch.mapping_lock);
         return 0;
-    }
 
     pg_maddr = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
-    {
-        spin_unlock(&ctx->arch.mapping_lock);
         return -ENOMEM;
-    }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
     pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
@@ -1848,7 +1613,6 @@ static int __must_check cf_check intel_iommu_map_page(
 
     if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
-        spin_unlock(&ctx->arch.mapping_lock);
         unmap_vtd_domain_page(page);
         return 0;
     }
@@ -1891,7 +1655,6 @@ static int __must_check cf_check intel_iommu_map_page(
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&ctx->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_added;
@@ -1908,10 +1671,10 @@ static int __must_check cf_check intel_iommu_map_page(
 }
 
 static int __must_check cf_check intel_iommu_unmap_page(
-    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
+    struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags,
+    struct iommu_context *ctx)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct iommu_context *ctx = iommu_default_context(d);
     daddr_t addr = dfn_to_daddr(dfn);
     struct dma_pte *page = NULL, *pte = NULL, old;
     uint64_t pg_maddr;
@@ -1923,20 +1686,13 @@ static int __must_check cf_check intel_iommu_unmap_page(
      */
     ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
 
-    /* Do nothing if VT-d shares EPT page table */
-    if ( iommu_use_hap_pt(d) )
-        return 0;
-
-    /* Do nothing if hardware domain and iommu supports pass thru. */
-    if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
+    if ( ctx->opaque )
         return 0;
 
-    spin_lock(&ctx->arch.mapping_lock);
     /* get target level pte */
     pg_maddr = addr_to_dma_page_maddr(d, ctx, addr, level, flush_flags, false);
     if ( pg_maddr < PAGE_SIZE )
     {
-        spin_unlock(&ctx->arch.mapping_lock);
         return pg_maddr ? -ENOMEM : 0;
     }
 
@@ -1945,7 +1701,6 @@ static int __must_check cf_check intel_iommu_unmap_page(
 
     if ( !dma_pte_present(*pte) )
     {
-        spin_unlock(&ctx->arch.mapping_lock);
         unmap_vtd_domain_page(page);
         return 0;
     }
@@ -1976,8 +1731,6 @@ static int __must_check cf_check intel_iommu_unmap_page(
         perfc_incr(iommu_pt_coalesces);
     }
 
-    spin_unlock(&ctx->arch.mapping_lock);
-
     unmap_vtd_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_modified;
@@ -1990,25 +1743,16 @@ static int __must_check cf_check intel_iommu_unmap_page(
 }
 
 static int cf_check intel_iommu_lookup_page(
-    struct domain *d, dfn_t dfn, mfn_t *mfn, unsigned int *flags)
+    struct domain *d, dfn_t dfn, mfn_t *mfn, unsigned int *flags,
+    struct iommu_context *ctx)
 {
-    struct iommu_context *ctx = iommu_default_context(d);
     uint64_t val;
 
-    /*
-     * If VT-d shares EPT page table or if the domain is the hardware
-     * domain and iommu_passthrough is set then pass back the dfn.
-     */
-    if ( iommu_use_hap_pt(d) ||
-         (iommu_hwdom_passthrough && is_hardware_domain(d)) )
+    if ( ctx->opaque )
         return -EOPNOTSUPP;
 
-    spin_lock(&ctx->arch.mapping_lock);
-
     val = addr_to_dma_page_maddr(d, ctx, dfn_to_daddr(dfn), 0, NULL, false);
 
-    spin_unlock(&ctx->arch.mapping_lock);
-
     if ( val < PAGE_SIZE )
         return -ENOENT;
 
@@ -2037,103 +1781,10 @@ static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
             (cap_sps_1gb(vtd_cap) && iommu_superpages);
 }
 
-static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
-{
-    struct acpi_rmrr_unit *rmrr;
-    struct iommu_context *ctx;
-    u16 bdf;
-    int ret, i;
-
-    ASSERT(pcidevs_locked());
-
-    if ( !pdev->domain )
-        return -EINVAL;
-
-    ctx = iommu_default_context(pdev->domain);
-
-    for_each_rmrr_device ( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == pdev->seg && bdf == PCI_BDF(pdev->bus, devfn) )
-        {
-            /*
-             * iommu_add_device() is only called for the hardware
-             * domain (see xen/drivers/passthrough/pci.c:pci_add_device()).
-             * Since RMRRs are always reserved in the e820 map for the hardware
-             * domain, there shouldn't be a conflict.
-             */
-            ret = iommu_identity_mapping(pdev->domain, ctx, p2m_access_rw,
-                                         rmrr->base_address, rmrr->end_address,
-                                         0);
-            if ( ret )
-                dprintk(XENLOG_ERR VTDPREFIX, "%pd: RMRR mapping failed\n",
-                        pdev->domain);
-        }
-    }
-
-    ret = domain_context_mapping(pdev->domain, ctx, devfn, pdev);
-    if ( ret )
-        dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
-                pdev->domain);
-
-    return ret;
-}
-
-static int cf_check intel_iommu_enable_device(struct pci_dev *pdev)
-{
-    struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
-    int ret = drhd ? ats_device(pdev, drhd) : -ENODEV;
-
-    pci_vtd_quirk(pdev);
-
-    if ( ret <= 0 )
-        return ret;
-
-    ret = enable_ats_device(pdev, &drhd->iommu->ats_devices);
-
-    return ret >= 0 ? 0 : ret;
-}
-
-static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
-{
-    const struct acpi_drhd_unit *drhd;
-    struct acpi_rmrr_unit *rmrr;
-    u16 bdf;
-    unsigned int i;
-    struct iommu_context *ctx;
-
-    if ( !pdev->domain )
-        return -EINVAL;
-
-    ctx = iommu_default_context(pdev->domain);
-
-    drhd = domain_context_unmap(pdev->domain, devfn, pdev);
-    if ( IS_ERR(drhd) )
-        return PTR_ERR(drhd);
-
-    for_each_rmrr_device ( rmrr, bdf, i )
-    {
-        if ( rmrr->segment != pdev->seg || bdf != PCI_BDF(pdev->bus, devfn) )
-            continue;
-
-        /*
-         * Any flag is nothing to clear these mappings but here
-         * its always safe and strict to set 0.
-         */
-        iommu_identity_mapping(pdev->domain, ctx, p2m_access_x, rmrr->base_address,
-                               rmrr->end_address, 0);
-    }
-
-    quarantine_teardown(pdev, drhd);
-
-    return 0;
-}
-
 static int __hwdom_init cf_check setup_hwdom_device(
     u8 devfn, struct pci_dev *pdev)
 {
-    struct iommu_context *ctx = iommu_default_context(pdev->domain);
-
-    return domain_context_mapping(pdev->domain, ctx, devfn, pdev);
+    return iommu_attach_context(hardware_domain, pdev, 0);
 }
 
 void clear_fault_bits(struct vtd_iommu *iommu)
@@ -2303,30 +1954,6 @@ static int __must_check init_vtd_hw(bool resume)
     return iommu_flush_all();
 }
 
-static void __hwdom_init setup_hwdom_rmrr(struct domain *d)
-{
-    struct iommu_context *ctx = iommu_default_context(d);
-    struct acpi_rmrr_unit *rmrr;
-    u16 bdf;
-    int ret, i;
-
-    pcidevs_lock();
-    for_each_rmrr_device ( rmrr, bdf, i )
-    {
-        /*
-         * Here means we're add a device to the hardware domain.
-         * Since RMRRs are always reserved in the e820 map for the hardware
-         * domain, there shouldn't be a conflict. So its always safe and
-         * strict to set 0.
-         */
-        ret = iommu_identity_mapping(d, ctx, p2m_access_rw, rmrr->base_address,
-                                     rmrr->end_address, 0);
-        if ( ret )
-            dprintk(XENLOG_ERR VTDPREFIX,
-                     "IOMMU: mapping reserved region failed\n");
-    }
-    pcidevs_unlock();
-}
 
 static struct iommu_state {
     uint32_t fectl;
@@ -2475,173 +2102,6 @@ static int __init cf_check vtd_setup(void)
     return ret;
 }
 
-static int cf_check reassign_device_ownership(
-    struct domain *source,
-    struct domain *target,
-    u8 devfn, struct pci_dev *pdev)
-{
-    int ret;
-
-    if ( !has_arch_pdevs(target) )
-        vmx_pi_hooks_assign(target);
-
-#ifdef CONFIG_PV
-    /*
-        * Devices assigned to untrusted domains (here assumed to be any domU)
-        * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
-        * by the root complex unless interrupt remapping is enabled.
-        */
-    if ( !iommu_intremap && !is_hardware_domain(target) &&
-            !is_system_domain(target) )
-        untrusted_msi = true;
-#endif
-
-    ret = domain_context_mapping(target, iommu_default_context(target), devfn, pdev);
-
-    if ( ret )
-    {
-        if ( !has_arch_pdevs(target) )
-            vmx_pi_hooks_deassign(target);
-        return ret;
-    }
-
-    if ( devfn == pdev->devfn && pdev->domain != target )
-    {
-        write_lock(&source->pci_lock);
-        list_del(&pdev->domain_list);
-        write_unlock(&source->pci_lock);
-
-        pdev->domain = target;
-
-        write_lock(&target->pci_lock);
-        list_add(&pdev->domain_list, &target->pdev_list);
-        write_unlock(&target->pci_lock);
-    }
-
-    if ( !has_arch_pdevs(source) )
-        vmx_pi_hooks_deassign(source);
-
-    /*
-     * If the device belongs to the hardware domain, and it has RMRR, don't
-     * remove it from the hardware domain, because BIOS may use RMRR at
-     * booting time.
-     */
-    if ( !is_hardware_domain(source) )
-    {
-        const struct acpi_rmrr_unit *rmrr;
-        struct iommu_context *ctx = iommu_default_context(source);
-        u16 bdf;
-        unsigned int i;
-
-        for_each_rmrr_device( rmrr, bdf, i )
-            if ( rmrr->segment == pdev->seg &&
-                 bdf == PCI_BDF(pdev->bus, devfn) )
-            {
-                /*
-                 * Any RMRR flag is always ignored when remove a device,
-                 * but its always safe and strict to set 0.
-                 */
-                ret = iommu_identity_mapping(source, ctx, p2m_access_x,
-                                             rmrr->base_address,
-                                             rmrr->end_address, 0);
-                if ( ret && ret != -ENOENT )
-                    return ret;
-            }
-    }
-
-    return 0;
-}
-
-static int cf_check intel_iommu_assign_device(
-    struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
-{
-    struct domain *s = pdev->domain;
-    struct iommu_context *ctx = iommu_default_context(d);
-    struct acpi_rmrr_unit *rmrr;
-    int ret = 0, i;
-    u16 bdf, seg;
-    u8 bus;
-
-    if ( list_empty(&acpi_drhd_units) )
-        return -ENODEV;
-
-    seg = pdev->seg;
-    bus = pdev->bus;
-    /*
-     * In rare cases one given rmrr is shared by multiple devices but
-     * obviously this would put the security of a system at risk. So
-     * we would prevent from this sort of device assignment. But this
-     * can be permitted if user set
-     *      "pci = [ 'sbdf, rdm_policy=relaxed' ]"
-     *
-     * TODO: in the future we can introduce group device assignment
-     * interface to make sure devices sharing RMRR are assigned to the
-     * same domain together.
-     */
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) &&
-             rmrr->scope.devices_cnt > 1 )
-        {
-            bool relaxed = flag & XEN_DOMCTL_DEV_RDM_RELAXED;
-
-            printk(XENLOG_GUEST "%s" VTDPREFIX
-                   " It's %s to assign %pp"
-                   " with shared RMRR at %"PRIx64" for %pd.\n",
-                   relaxed ? XENLOG_WARNING : XENLOG_ERR,
-                   relaxed ? "risky" : "disallowed",
-                   &PCI_SBDF(seg, bus, devfn), rmrr->base_address, d);
-            if ( !relaxed )
-                return -EPERM;
-        }
-    }
-
-    /* Setup rmrr identity mapping */
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
-        {
-            ret = iommu_identity_mapping(d, ctx, p2m_access_rw, rmrr->base_address,
-                                         rmrr->end_address, flag);
-            if ( ret )
-            {
-                printk(XENLOG_G_ERR VTDPREFIX
-                       "%pd: cannot map reserved region [%"PRIx64",%"PRIx64"]: %d\n",
-                       d, rmrr->base_address, rmrr->end_address, ret);
-                break;
-            }
-        }
-    }
-
-    if ( !ret )
-        ret = reassign_device_ownership(s, d, devfn, pdev);
-
-    /* See reassign_device_ownership() for the hwdom aspect. */
-    if ( !ret || is_hardware_domain(d) )
-        return ret;
-
-    for_each_rmrr_device( rmrr, bdf, i )
-    {
-        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
-        {
-            int rc = iommu_identity_mapping(d, ctx, p2m_access_x,
-                                            rmrr->base_address,
-                                            rmrr->end_address, 0);
-
-            if ( rc && rc != -ENOENT )
-            {
-                printk(XENLOG_ERR VTDPREFIX
-                       "%pd: cannot unmap reserved region [%"PRIx64",%"PRIx64"]: %d\n",
-                       d, rmrr->base_address, rmrr->end_address, rc);
-                domain_crash(d);
-                break;
-            }
-        }
-    }
-
-    return ret;
-}
-
 static int cf_check intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
     u8 secbus;
@@ -2766,6 +2226,11 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
     if ( level < 1 )
         return;
 
+    if (pt_maddr == 0) {
+        printk(" (empty)\n");
+        return;
+    }
+
     pt_vaddr = map_vtd_domain_page(pt_maddr);
 
     next_level = level - 1;
@@ -2797,20 +2262,296 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
 static void cf_check vtd_dump_page_tables(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
-    struct iommu_context *ctx = iommu_default_context(d);
+    unsigned int i;
 
-    printk(VTDPREFIX" %pd table has %d levels\n", d,
+    printk(VTDPREFIX " %pd table has %d levels\n", d,
            agaw_to_level(hd->arch.vtd.agaw));
-    vtd_dump_page_table_level(ctx->arch.vtd.pgd_maddr,
-                              agaw_to_level(hd->arch.vtd.agaw), 0, 0);
+
+    for (i = 1; i < (1 + hd->other_contexts.count); ++i)
+    {
+        struct iommu_context *ctx = iommu_get_context(d, i);
+
+        printk(VTDPREFIX " %pd context %d: %s\n", d, i,
+               ctx ? "allocated" : "non-allocated");
+
+        if (ctx)
+        {
+            vtd_dump_page_table_level(ctx->arch.vtd.pgd_maddr,
+                                      agaw_to_level(hd->arch.vtd.agaw), 0, 0);
+            iommu_put_context(ctx);
+        }
+    }
+}
+
+static int intel_iommu_cleanup_pte(uint64_t pte_maddr, bool preempt)
+{
+    size_t i;
+    struct dma_pte *pte = map_vtd_domain_page(pte_maddr);
+
+    for (i = 0; i < (1 << PAGETABLE_ORDER); ++i)
+        if ( dma_pte_present(pte[i]) )
+        {
+            /* Remove the reference of the target mapping (if needed) */
+            mfn_t mfn = maddr_to_mfn(dma_pte_addr(pte[i]));
+
+            if ( mfn_valid(mfn) )
+                put_page(mfn_to_page(mfn));
+
+            if ( preempt )
+                dma_clear_pte(pte[i]);
+        }
+
+    unmap_vtd_domain_page(pte);
+
+    return 0;
+}
+
+/**
+ * Cleanup logic :
+ * Walk through the entire page table, progressively removing mappings if preempt.
+ *
+ * Return values :
+ *  - Report preemption with -ERESTART.
+ *  - Report empty pte/pgd with 0.
+ *
+ * When preempted during superpage operation, store state in vtd.superpage_progress.
+ */
+
+static int intel_iommu_cleanup_superpage(struct iommu_context *ctx,
+                                          unsigned int page_order, uint64_t pte_maddr,
+                                          bool preempt)
+{
+    size_t i = 0, page_count = 1 << page_order;
+    struct page_info *page = maddr_to_page(pte_maddr);
+
+    if ( preempt )
+        i = ctx->arch.vtd.superpage_progress;
+
+    for (; i < page_count; page++)
+    {
+        put_page(page);
+
+        if ( preempt && (i & 0xff) && general_preempt_check() )
+        {
+            ctx->arch.vtd.superpage_progress = i + 1;
+            return -ERESTART;
+        }
+    }
+
+    if ( preempt )
+        ctx->arch.vtd.superpage_progress = 0;
+
+    return 0;
+}
+
+static int intel_iommu_cleanup_mappings(struct iommu_context *ctx,
+                                         unsigned int nr_pt_levels, uint64_t pgd_maddr,
+                                         bool preempt)
+{
+    size_t i;
+    int rc;
+    struct dma_pte *pgd;
+
+    if ( ctx->opaque )
+        /* don't touch opaque contexts */
+        return 0;
+
+    pgd = map_vtd_domain_page(pgd_maddr);
+
+    for (i = 0; i < (1 << PAGETABLE_ORDER); ++i)
+    {
+        if ( dma_pte_present(pgd[i]) )
+        {
+            uint64_t pte_maddr = dma_pte_addr(pgd[i]);
+
+            if ( dma_pte_superpage(pgd[i]) )
+                rc = intel_iommu_cleanup_superpage(ctx, nr_pt_levels * SUPERPAGE_ORDER,
+                                                   pte_maddr, preempt);
+            else if ( nr_pt_levels > 2 )
+                /* Next level is not PTE */
+                rc = intel_iommu_cleanup_mappings(ctx, nr_pt_levels - 1,
+                                                  pte_maddr, preempt);
+            else
+                rc = intel_iommu_cleanup_pte(pte_maddr, preempt);
+
+            if ( preempt && !rc )
+                /* Fold pgd (no more mappings in it) */
+                dma_clear_pte(pgd[i]);
+            else if ( preempt && (rc == -ERESTART || general_preempt_check()) )
+            {
+                unmap_vtd_domain_page(pgd);
+                return -ERESTART;
+            }
+        }
+    }
+
+    unmap_vtd_domain_page(pgd);
+
+    return 0;
+}
+
+static int cf_check intel_iommu_context_teardown(struct domain *d,
+                                        struct iommu_context *ctx, u32 flags)
+{
+    struct acpi_drhd_unit *drhd;
+    pcidevs_lock();
+
+    // Cleanup mappings
+    if ( intel_iommu_cleanup_mappings(ctx, agaw_to_level(d->iommu.arch.vtd.agaw),
+                                      ctx->arch.vtd.pgd_maddr,
+                                      flags & IOMMUF_preempt) < 0 )
+    {
+        pcidevs_unlock();
+        return -ERESTART;
+    }
+
+    ASSERT(ctx->arch.vtd.didmap);
+
+    for_each_drhd_unit(drhd)
+    {
+        unsigned long index = drhd->iommu->index;
+
+        iommu_free_domid(ctx->arch.vtd.didmap[index], drhd->iommu->domid_bitmap);
+    }
+
+    xfree(ctx->arch.vtd.didmap);
+
+    pcidevs_unlock();
+    return arch_iommu_context_teardown(d, ctx, flags);
 }
 
-static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
-                                                bool scratch_page)
+static int intel_iommu_dev_rmrr(struct domain *d, struct pci_dev *pdev,
+                                struct iommu_context *ctx, bool unmap)
 {
+    struct acpi_rmrr_unit *rmrr;
+    u16 bdf;
+    int ret, i;
+
+    for_each_rmrr_device(rmrr, bdf, i)
+    {
+        if ( PCI_SBDF(rmrr->segment, bdf).sbdf == pdev->sbdf.sbdf )
+        {
+            ret = iommu_identity_mapping(d, ctx,
+                                         unmap ? p2m_access_x : p2m_access_rw,
+                                         rmrr->base_address, rmrr->end_address,
+                                         0);
+
+            if ( ret < 0 )
+                return ret;
+        }
+    }
+
     return 0;
 }
 
+static int cf_check intel_iommu_attach(struct domain *d, struct pci_dev *pdev,
+                                       struct iommu_context *ctx)
+{
+    int ret;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if ( !pdev || !drhd )
+        return -EINVAL;
+
+    ret = intel_iommu_dev_rmrr(d, pdev, ctx, false);
+
+    if ( ret )
+        return ret;
+
+    ret = apply_context(d, ctx, pdev, pdev->devfn, NULL);
+
+    if ( ret )
+        return ret;
+
+    pci_vtd_quirk(pdev);
+
+    return ret;
+}
+
+static int cf_check intel_iommu_detach(struct domain *d, struct pci_dev *pdev,
+                                       struct iommu_context *prev_ctx)
+{
+    int ret, rc;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if ( !pdev || !drhd )
+        return -EINVAL;
+
+    ret = unapply_context_single(d, drhd->iommu, prev_ctx, pdev->bus, pdev->devfn);
+
+    if ( ret )
+        return ret;
+
+    if ( (rc = intel_iommu_dev_rmrr(d, pdev, prev_ctx, true)) )
+        printk(XENLOG_WARNING VTDPREFIX
+               " Unable to unmap RMRR from d%dc%d for %pp (%d)\n",
+               d->domain_id, prev_ctx->id, &pdev->sbdf, rc);
+
+    return ret;
+}
+
+static int cf_check intel_iommu_reattach(struct domain *d,
+                                         struct pci_dev *pdev,
+                                         struct iommu_context *prev_ctx,
+                                         struct iommu_context *ctx)
+{
+    int ret, rc;
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if ( !pdev || !drhd )
+        return -EINVAL;
+
+    ret = intel_iommu_dev_rmrr(d, pdev, ctx, false);
+
+    if ( ret )
+        return ret;
+
+    ret = apply_context(d, ctx, pdev, pdev->devfn, prev_ctx);
+
+    if ( ret )
+    {
+        /* Remove the RMRR we just added */
+        if ( (rc = intel_iommu_dev_rmrr(d, pdev, ctx, true)) )
+            printk(XENLOG_WARNING VTDPREFIX
+                   " Unable to unmap RMRR from d%dc%d for %pp (%d)\n",
+                   d->domain_id, prev_ctx->id, &pdev->sbdf, rc);
+
+        return ret;
+    }
+
+    /* Remove previous context RMRR  */
+    if ( (rc = intel_iommu_dev_rmrr(d, pdev, prev_ctx, true)) )
+        printk(XENLOG_WARNING VTDPREFIX
+               " Unable to unmap previous RMRR for %pp (%d)\n", &pdev->sbdf, rc);
+
+    pci_vtd_quirk(pdev);
+
+    return ret;
+}
+
+static int cf_check intel_iommu_add_devfn(struct domain *d,
+                                          struct pci_dev *pdev, u16 devfn,
+                                          struct iommu_context *ctx)
+{
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if ( !pdev || !drhd )
+        return -EINVAL;
+
+    return apply_context(d, ctx, pdev, devfn, NULL);
+}
+
+static int cf_check intel_iommu_remove_devfn(struct domain *d, struct pci_dev *pdev,
+                                             u16 devfn, struct iommu_context *prev_ctx)
+{
+    const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+
+    if ( !pdev || !drhd )
+        return -EINVAL;
+
+    return unapply_context_single(d, drhd->iommu, prev_ctx, pdev->bus, devfn);
+}
+
 static void cf_check vtd_quiesce(void)
 {
     const struct acpi_drhd_unit *drhd;
@@ -2833,17 +2574,18 @@ static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .page_sizes = PAGE_SIZE_4K,
     .init = intel_iommu_domain_init,
     .hwdom_init = intel_iommu_hwdom_init,
-    .quarantine_init = intel_iommu_quarantine_init,
-    .add_device = intel_iommu_add_device,
-    .enable_device = intel_iommu_enable_device,
-    .remove_device = intel_iommu_remove_device,
-    .assign_device  = intel_iommu_assign_device,
+    .context_init = intel_iommu_context_init,
+    .context_teardown = intel_iommu_context_teardown,
+    .attach = intel_iommu_attach,
+    .detach = intel_iommu_detach,
+    .reattach = intel_iommu_reattach,
+    .add_devfn = intel_iommu_add_devfn,
+    .remove_devfn = intel_iommu_remove_devfn,
     .teardown = iommu_domain_teardown,
     .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
-    .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
     .enable_x2apic = intel_iommu_enable_eim,
     .disable_x2apic = intel_iommu_disable_eim,
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 195fc5c08f..517d0e7a13 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -409,9 +409,9 @@ void __init platform_quirks_init(void)
 
 static int __must_check map_me_phantom_function(struct domain *domain,
                                                 unsigned int dev,
-                                                domid_t domid,
-                                                paddr_t pgd_maddr,
-                                                unsigned int mode)
+                                                unsigned int mode,
+                                                struct iommu_context *ctx,
+                                                struct iommu_context *prev_ctx)
 {
     struct acpi_drhd_unit *drhd;
     struct pci_dev *pdev;
@@ -423,19 +423,17 @@ static int __must_check map_me_phantom_function(struct domain *domain,
 
     /* map or unmap ME phantom function */
     if ( !(mode & UNMAP_ME_PHANTOM_FUNC) )
-        rc = domain_context_mapping_one(domain, iommu_default_context(domain),
-                                        drhd->iommu, 0,
-                                        PCI_DEVFN(dev, 7), NULL,
-                                        domid, pgd_maddr, mode);
+        rc = apply_context_single(domain, ctx, drhd->iommu, 0,
+                                  PCI_DEVFN(dev, 7), prev_ctx);
     else
-        rc = domain_context_unmap_one(domain, drhd->iommu, 0,
-                                      PCI_DEVFN(dev, 7));
+        rc = unapply_context_single(domain, drhd->iommu, prev_ctx, 0, PCI_DEVFN(dev, 7));
 
     return rc;
 }
 
 int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
-                  domid_t domid, paddr_t pgd_maddr, unsigned int mode)
+                  domid_t domid, unsigned int mode,
+                  struct iommu_context *ctx, struct iommu_context *prev_ctx)
 {
     u32 id;
     int rc = 0;
@@ -459,7 +457,7 @@ int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
             case 0x423b8086:
             case 0x423c8086:
             case 0x423d8086:
-                rc = map_me_phantom_function(domain, 3, domid, pgd_maddr, mode);
+                rc = map_me_phantom_function(domain, 3, mode, ctx, prev_ctx);
                 break;
             default:
                 break;
@@ -485,7 +483,7 @@ int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
             case 0x42388086:        /* Puma Peak */
             case 0x422b8086:
             case 0x422c8086:
-                rc = map_me_phantom_function(domain, 22, domid, pgd_maddr, mode);
+                rc = map_me_phantom_function(domain, 22, mode, ctx, prev_ctx);
                 break;
             default:
                 break;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 98cca92dc3..d8becfa869 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -12,6 +12,12 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/keyhandler.h>
+#include <xen/lib.h>
+#include <xen/pci.h>
+#include <xen/bitmap.h>
+#include <xen/list.h>
+#include <xen/mm.h>
 #include <xen/cpu.h>
 #include <xen/sched.h>
 #include <xen/iocap.h>
@@ -19,7 +25,6 @@
 #include <xen/paging.h>
 #include <xen/guest_access.h>
 #include <xen/event.h>
-#include <xen/spinlock.h>
 #include <xen/softirq.h>
 #include <xen/vm_event.h>
 #include <xsm/xsm.h>
@@ -29,6 +34,9 @@
 #include <asm/mem_paging.h>
 #include <asm/pt-contig-markers.h>
 #include <asm/setup.h>
+#include <asm/iommu.h>
+#include <asm/page.h>
+#include <asm/p2m.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __ro_after_init iommu_ops;
@@ -192,8 +200,6 @@ int arch_iommu_domain_init(struct domain *d)
 
 int arch_iommu_context_init(struct domain *d, struct iommu_context *ctx, u32 flags)
 {
-    spin_lock_init(&ctx->arch.mapping_lock);
-
     INIT_PAGE_LIST_HEAD(&ctx->arch.pgtables);
     INIT_LIST_HEAD(&ctx->arch.identity_maps);
 
@@ -220,6 +226,95 @@ struct identity_map {
     unsigned int count;
 };
 
+static int unmap_identity_region(struct domain *d, struct iommu_context *ctx,
+                                 unsigned int base_pfn, unsigned int end_pfn)
+{
+    int ret = 0;
+
+    if ( ctx->opaque && !ctx->id )
+    {
+        #ifdef CONFIG_HVM
+        this_cpu(iommu_dont_flush_iotlb) = true;
+        while ( base_pfn < end_pfn )
+        {
+            if ( p2m_remove_identity_entry(d, base_pfn) )
+                ret = -ENXIO;
+
+            base_pfn++;
+        }
+        this_cpu(iommu_dont_flush_iotlb) = false;
+        #else
+        ASSERT_UNREACHABLE();
+        #endif
+    }
+    else
+    {
+        size_t page_count = end_pfn - base_pfn + 1;
+        unsigned int flush_flags;
+
+        ret = iommu_unmap(d, _dfn(base_pfn), page_count, 0, &flush_flags,
+                          ctx->id);
+
+        if ( ret )
+            return ret;
+
+        ret = iommu_iotlb_flush(d, _dfn(base_pfn), page_count,
+                                flush_flags, ctx->id);
+    }
+
+    return ret;
+}
+
+static int map_identity_region(struct domain *d, struct iommu_context *ctx,
+                               unsigned int base_pfn, unsigned int end_pfn,
+                               p2m_access_t p2ma, unsigned int flag)
+{
+    int ret = 0;
+    unsigned int flush_flags = 0;
+    size_t page_count = end_pfn - base_pfn + 1;
+
+    if ( ctx->opaque && !ctx->id )
+    {
+        #ifdef CONFIG_HVM
+        int i;
+        this_cpu(iommu_dont_flush_iotlb) = true;
+
+        for (i = 0; i < page_count; i++)
+        {
+            ret = p2m_add_identity_entry(d, base_pfn + i, p2ma, flag);
+
+            if ( ret )
+                break;
+
+            base_pfn++;
+        }
+        this_cpu(iommu_dont_flush_iotlb) = false;
+        #else
+        ASSERT_UNREACHABLE();
+        #endif
+    }
+    else
+    {
+        int i;
+
+        for (i = 0; i < page_count; i++)
+        {
+            ret = iommu_map(d, _dfn(base_pfn + i), _mfn(base_pfn + i), 1,
+                            p2m_access_to_iommu_flags(p2ma), &flush_flags,
+                            ctx->id);
+
+            if ( ret )
+                break;
+        }
+    }
+
+    ret = iommu_iotlb_flush(d, _dfn(base_pfn), page_count, flush_flags,
+                            ctx->id);
+
+    return ret;
+}
+
+/* p2m_access_x removes the mapping */
 int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
                            p2m_access_t p2ma, paddr_t base, paddr_t end,
                            unsigned int flag)
@@ -227,24 +322,20 @@ int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
     unsigned long base_pfn = base >> PAGE_SHIFT_4K;
     unsigned long end_pfn = PAGE_ALIGN_4K(end) >> PAGE_SHIFT_4K;
     struct identity_map *map;
+    int ret = 0;
 
     ASSERT(pcidevs_locked());
     ASSERT(base < end);
 
-    /*
-     * No need to acquire hd->arch.mapping_lock: Both insertion and removal
-     * get done while holding pcidevs_lock.
-     */
     list_for_each_entry( map, &ctx->arch.identity_maps, list )
     {
         if ( map->base == base && map->end == end )
         {
-            int ret = 0;
-
             if ( p2ma != p2m_access_x )
             {
                 if ( map->access != p2ma )
                     return -EADDRINUSE;
+
                 ++map->count;
                 return 0;
             }
@@ -252,12 +343,9 @@ int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
             if ( --map->count )
                 return 0;
 
-            while ( base_pfn < end_pfn )
-            {
-                if ( clear_identity_p2m_entry(d, base_pfn) )
-                    ret = -ENXIO;
-                base_pfn++;
-            }
+            printk("Unmapping [%"PRI_mfn"x:%"PRI_mfn"] for d%dc%d\n", base_pfn, end_pfn,
+                   d->domain_id, ctx->id);
+            ret = unmap_identity_region(d, ctx, base_pfn, end_pfn);
 
             list_del(&map->list);
             xfree(map);
@@ -281,27 +369,17 @@ int iommu_identity_mapping(struct domain *d, struct iommu_context *ctx,
     map->access = p2ma;
     map->count = 1;
 
-    /*
-     * Insert into list ahead of mapping, so the range can be found when
-     * trying to clean up.
-     */
-    list_add_tail(&map->list, &ctx->arch.identity_maps);
+    printk("Mapping [%"PRI_mfn"x:%"PRI_mfn"] for d%dc%d\n", base_pfn, end_pfn,
+           d->domain_id, ctx->id);
+    ret = map_identity_region(d, ctx, base_pfn, end_pfn, p2ma, flag);
 
-    for ( ; base_pfn < end_pfn; ++base_pfn )
+    if ( ret )
     {
-        int err = set_identity_p2m_entry(d, base_pfn, p2ma, flag);
-
-        if ( !err )
-            continue;
-
-        if ( (map->base >> PAGE_SHIFT_4K) == base_pfn )
-        {
-            list_del(&map->list);
-            xfree(map);
-        }
-        return err;
+        xfree(map);
+        return ret;
     }
 
+    list_add(&map->list, &ctx->arch.identity_maps);
     return 0;
 }
 
@@ -385,7 +463,7 @@ static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
             if ( iomem_access_permitted(d, s, s) )
             {
                 rc = iommu_map(d, _dfn(s), _mfn(s), 1, perms,
-                               &info->flush_flags);
+                               &info->flush_flags, 0);
                 if ( rc < 0 )
                     break;
                 /* Must map a frame at least, which is what we request for. */
@@ -395,7 +473,7 @@ static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
             s++;
         }
         while ( (rc = iommu_map(d, _dfn(s), _mfn(s), e - s + 1,
-                                perms, &info->flush_flags)) > 0 )
+                                perms, &info->flush_flags, 0)) > 0 )
         {
             s += rc;
             process_pending_softirqs();
@@ -522,7 +600,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
                map_data.mmio_ro ? "read-only " : "", rc);
 
     /* Use if to avoid compiler warning */
-    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
+    if ( iommu_iotlb_flush_all(d, 0, map_data.flush_flags) )
         return;
 }
 
@@ -579,14 +657,11 @@ int iommu_free_pgtables(struct domain *d, struct iommu_context *ctx)
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    /* After this barrier, no new IOMMU mappings can be inserted. */
-    spin_barrier(&ctx->arch.mapping_lock);
-
     /*
      * Pages will be moved to the free list below. So we want to
      * clear the root page-table to avoid any potential use after-free.
      */
-    iommu_vcall(hd->platform_ops, clear_root_pgtable, d);
+    iommu_vcall(hd->platform_ops, clear_root_pgtable, d, ctx);
 
     while ( (pg = page_list_remove_head(&ctx->arch.pgtables)) )
     {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 91f106968e..8c20f575ee 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -187,11 +187,10 @@ enum
  */
 long __must_check iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
                             unsigned long page_count, unsigned int flags,
-                            unsigned int *flush_flags);
+                            unsigned int *flush_flags, u16 ctx_id);
 long __must_check iommu_unmap(struct domain *d, dfn_t dfn0,
                               unsigned long page_count, unsigned int flags,
-                              unsigned int *flush_flags);
-
+                              unsigned int *flush_flags, u16 ctx_id);
 int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                                   unsigned long page_count,
                                   unsigned int flags);
@@ -199,12 +198,13 @@ int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
                                     unsigned long page_count);
 
 int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                   unsigned int *flags);
+                                   unsigned int *flags, u16 ctx_id);
 
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
                                    unsigned long page_count,
-                                   unsigned int flush_flags);
-int __must_check iommu_iotlb_flush_all(struct domain *d,
+                                   unsigned int flush_flags,
+                                   u16 ctx_id);
+int __must_check iommu_iotlb_flush_all(struct domain *d, u16 ctx_id,
                                        unsigned int flush_flags);
 
 enum iommu_feature
@@ -321,20 +321,32 @@ struct page_info;
  */
 typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt);
 
+#define IOMMU_INVALID_CONTEXT_ID 0xFFFF
+
+struct iommu_context;
+
 struct iommu_ops {
     unsigned long page_sizes;
     int (*init)(struct domain *d);
     void (*hwdom_init)(struct domain *d);
-    int (*quarantine_init)(device_t *dev, bool scratch_page);
-    int (*add_device)(uint8_t devfn, device_t *dev);
-    int (*enable_device)(device_t *dev);
-    int (*remove_device)(uint8_t devfn, device_t *dev);
-    int (*assign_device)(struct domain *d, uint8_t devfn, device_t *dev,
-                         uint32_t flag);
-    int (*reassign_device)(struct domain *s, struct domain *t,
-                           uint8_t devfn, device_t *dev);
+    int (*context_init)(struct domain *d, struct iommu_context *ctx,
+                        u32 flags);
+    int (*context_teardown)(struct domain *d, struct iommu_context *ctx,
+                            u32 flags);
+    int (*attach)(struct domain *d, device_t *dev,
+                  struct iommu_context *ctx);
+    int (*detach)(struct domain *d, device_t *dev,
+                   struct iommu_context *prev_ctx);
+    int (*reattach)(struct domain *d, device_t *dev,
+                    struct iommu_context *prev_ctx,
+                    struct iommu_context *ctx);
+
 #ifdef CONFIG_HAS_PCI
     int (*get_device_group_id)(uint16_t seg, uint8_t bus, uint8_t devfn);
+    int (*add_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                     struct iommu_context *ctx);
+    int (*remove_devfn)(struct domain *d, struct pci_dev *pdev, u16 devfn,
+                        struct iommu_context *prev_ctx);
 #endif /* HAS_PCI */
 
     void (*teardown)(struct domain *d);
@@ -345,12 +357,15 @@ struct iommu_ops {
      */
     int __must_check (*map_page)(struct domain *d, dfn_t dfn, mfn_t mfn,
                                  unsigned int flags,
-                                 unsigned int *flush_flags);
+                                 unsigned int *flush_flags,
+                                 struct iommu_context *ctx);
     int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
                                    unsigned int order,
-                                   unsigned int *flush_flags);
+                                   unsigned int *flush_flags,
+                                   struct iommu_context *ctx);
     int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                    unsigned int *flags);
+                                    unsigned int *flags,
+                                    struct iommu_context *ctx);
 
 #ifdef CONFIG_X86
     int (*enable_x2apic)(void);
@@ -363,14 +378,15 @@ struct iommu_ops {
     int (*setup_hpet_msi)(struct msi_desc *msi_desc);
 
     void (*adjust_irq_affinities)(void);
-    void (*clear_root_pgtable)(struct domain *d);
+    void (*clear_root_pgtable)(struct domain *d, struct iommu_context *ctx);
     int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* CONFIG_X86 */
 
     int __must_check (*suspend)(void);
     void (*resume)(void);
     void (*crash_shutdown)(void);
-    int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
+    int __must_check (*iotlb_flush)(struct domain *d,
+                                    struct iommu_context *ctx, dfn_t dfn,
                                     unsigned long page_count,
                                     unsigned int flush_flags);
     int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
@@ -418,16 +434,37 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 
 struct iommu_context {
     #ifdef CONFIG_HAS_PASSTHROUGH
-    u16 id; /* Context id (0 means default context) */
+    uint16_t id; /* Context id (0 means default context) */
+    rspinlock_t lock; /* context lock */
+
+    struct list_head devices;
 
     struct arch_iommu_context arch;
+
+    bool opaque; /* context can't be modified nor accessed (e.g HAP) */
+    bool dying; /* the context is tearing down */
     #endif
 };
 
+struct iommu_context_list {
+    atomic_t initialized; /* has/is context list being initialized ? */
+    rwlock_t lock; /* prevent concurrent destruction and access of contexts */
+    uint16_t count; /* Context count excluding default context */
+
+    /* if count > 0 */
+
+    unsigned long *bitmap; /* bitmap of context allocation */
+    struct iommu_context *map; /* Map of contexts */
+};
+
+
 struct domain_iommu {
+
 #ifdef CONFIG_HAS_PASSTHROUGH
     struct arch_iommu arch;
+
     struct iommu_context default_ctx;
+    struct iommu_context_list other_contexts;
 #endif
 
     /* iommu_ops */
@@ -491,6 +528,8 @@ void iommu_resume(void);
 void iommu_crash_shutdown(void);
 void iommu_quiesce(void);
 int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
+
+int __init iommu_quarantine_init(void);
 int iommu_quarantine_dev_init(device_t *dev);
 
 #ifdef CONFIG_HAS_PCI
@@ -500,6 +539,26 @@ int iommu_do_pci_domctl(struct xen_domctl *domctl, struct domain *d,
 
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
 
+
+struct iommu_context *iommu_get_context(struct domain *d, u16 ctx_id);
+void iommu_put_context(struct iommu_context *ctx);
+
+#define IOMMU_CONTEXT_INIT_default (1 << 0)
+#define IOMMU_CONTEXT_INIT_quarantine (1 << 1)
+int iommu_context_init(struct domain *d, struct iommu_context *ctx, u16 ctx_id, u32 flags);
+
+#define IOMMU_TEARDOWN_REATTACH_DEFAULT (1 << 0)
+#define IOMMU_TEARDOWN_PREEMPT (1 << 1)
+int iommu_context_teardown(struct domain *d, struct iommu_context *ctx, u32 flags);
+
+int iommu_context_alloc(struct domain *d, u16 *ctx_id, u32 flags);
+int iommu_context_free(struct domain *d, u16 ctx_id, u32 flags);
+
+int iommu_reattach_context(struct domain *prev_dom, struct domain *next_dom,
+                           device_t *dev, u16 ctx_id);
+int iommu_attach_context(struct domain *d, device_t *dev, u16 ctx_id);
+int iommu_detach_context(struct domain *d, device_t *dev);
+
 /*
  * The purpose of the iommu_dont_flush_iotlb optional cpu flag is to
  * avoid unecessary iotlb_flush in the low level IOMMU code.
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 130c2a8c1a..acc2229ccf 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -102,6 +102,7 @@ struct pci_dev_info {
 struct pci_dev {
     struct list_head alldevs_list;
     struct list_head domain_list;
+    struct list_head context_list;
 
     struct list_head msi_list;
 
@@ -109,6 +110,8 @@ struct pci_dev {
 
     struct domain *domain;
 
+    uint16_t context; /* IOMMU context number of domain */
+
     const union {
         struct {
             uint8_t devfn;
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


