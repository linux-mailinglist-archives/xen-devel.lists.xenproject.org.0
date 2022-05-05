Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074151BD55
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 12:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321940.543120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYqJ-00035s-4J; Thu, 05 May 2022 10:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321940.543120; Thu, 05 May 2022 10:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYqJ-00032S-1L; Thu, 05 May 2022 10:36:19 +0000
Received: by outflank-mailman (input) for mailman id 321940;
 Thu, 05 May 2022 10:36:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu9C=VN=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmYqH-0002XD-TD
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 10:36:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 317a602c-cc5f-11ec-a406-831a346695d4;
 Thu, 05 May 2022 12:36:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3214D1516;
 Thu,  5 May 2022 03:36:16 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5A93FA27;
 Thu,  5 May 2022 03:36:14 -0700 (PDT)
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
X-Inumbo-ID: 317a602c-cc5f-11ec-a406-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: gnttab: modify macros to evaluate all arguments and only once
Date: Thu,  5 May 2022 12:36:01 +0200
Message-Id: <20220505103601.322110-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505103601.322110-1-michal.orzel@arm.com>
References: <20220505103601.322110-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify macros to evaluate all the arguments and make sure the arguments
are evaluated only once. While doing so, use typeof for basic types
and use const qualifier when applicable.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/include/asm/grant_table.h | 67 ++++++++++++++++++--------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index 779f6fbdbb..b161d4baf1 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -57,38 +57,44 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
 
 #define gnttab_init_arch(gt)                                             \
 ({                                                                       \
-    unsigned int ngf_ = (gt)->max_grant_frames;                          \
+    struct grant_table *gt_ = (gt);                                      \
+    unsigned int ngf_ = gt_->max_grant_frames;                           \
     unsigned int nsf_ = grant_to_status_frames(ngf_);                    \
                                                                          \
-    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
-    (gt)->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \
-    if ( (gt)->arch.shared_gfn && (gt)->arch.status_gfn )                \
+    gt_->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                   \
+    gt_->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                   \
+    if ( gt_->arch.shared_gfn && gt_->arch.status_gfn )                  \
     {                                                                    \
         while ( ngf_-- )                                                 \
-            (gt)->arch.shared_gfn[ngf_] = INVALID_GFN;                   \
+            gt_->arch.shared_gfn[ngf_] = INVALID_GFN;                    \
         while ( nsf_-- )                                                 \
-            (gt)->arch.status_gfn[nsf_] = INVALID_GFN;                   \
+            gt_->arch.status_gfn[nsf_] = INVALID_GFN;                    \
     }                                                                    \
     else                                                                 \
-        gnttab_destroy_arch(gt);                                         \
-    (gt)->arch.shared_gfn ? 0 : -ENOMEM;                                 \
+        gnttab_destroy_arch(gt_);                                        \
+    gt_->arch.shared_gfn ? 0 : -ENOMEM;                                  \
 })
 
 #define gnttab_destroy_arch(gt)                                          \
     do {                                                                 \
-        XFREE((gt)->arch.shared_gfn);                                    \
-        XFREE((gt)->arch.status_gfn);                                    \
+        struct grant_table *gt_ = (gt);                                  \
+        XFREE(gt_->arch.shared_gfn);                                     \
+        XFREE(gt_->arch.status_gfn);                                     \
     } while ( 0 )
 
 #define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
     ({                                                                   \
         int rc_ = 0;                                                     \
-        gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
-        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
-             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
+        const struct grant_table *gt_ = (gt);                            \
+        const typeof(st) st_ = (st);                                     \
+        const typeof(idx) idx_ = (idx);                                  \
+        const gfn_t gfn_ = (gfn);                                        \
+        const gfn_t ogfn_ = gnttab_get_frame_gfn(gt_, st_, idx_);        \
+        if ( gfn_eq(ogfn_, INVALID_GFN) || gfn_eq(ogfn_, gfn_) ||        \
+             (rc_ = guest_physmap_remove_page(gt_->domain, ogfn_, mfn,   \
                                               0)) == 0 )                 \
-            ((st) ? (gt)->arch.status_gfn                                \
-                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
+            (st_ ? gt_->arch.status_gfn                                  \
+                 : gt_->arch.shared_gfn)[idx_] = gfn_;                   \
         rc_;                                                             \
     })
 
@@ -98,13 +104,36 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
 })
 
 #define gnttab_shared_gfn(d, t, i)                                       \
-    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
+    ({                                                                   \
+        const struct domain *d_ = (d);                                   \
+        const struct grant_table *t_ = (t);                              \
+        const typeof(i) i_ = (i);                                        \
+                                                                         \
+        if ( d_ != NULL )                                                \
+            ASSERT(d_->grant_table == t_);                               \
+                                                                         \
+        (i_ >= nr_grant_frames(t_)) ? INVALID_GFN                        \
+                                    : t_->arch.shared_gfn[i_];           \
+    })
 
 #define gnttab_status_gfn(d, t, i)                                       \
-    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
+    ({                                                                   \
+        const struct domain *d_ = (d);                                   \
+        const struct grant_table *t_ = (t);                              \
+        const typeof(i) i_ = (i);                                        \
+                                                                         \
+        if ( d_ != NULL )                                                \
+            ASSERT(d_->grant_table == t_);                               \
+                                                                         \
+        (i_ >= nr_status_frames(t_)) ? INVALID_GFN                       \
+                                     : t_->arch.status_gfn[i_];          \
+    })
 
-#define gnttab_need_iommu_mapping(d)                    \
-    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
+#define gnttab_need_iommu_mapping(d)                                     \
+    ({                                                                   \
+        const struct domain *d_ = (d);                                   \
+        is_domain_direct_mapped(d_) && is_iommu_enabled(d_);             \
+    })
 
 #endif /* __ASM_GRANT_TABLE_H__ */
 /*
-- 
2.25.1


