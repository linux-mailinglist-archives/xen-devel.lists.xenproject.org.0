Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83258A17AAD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 10:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875232.1285674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taB0Y-0006VM-OL; Tue, 21 Jan 2025 09:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875232.1285674; Tue, 21 Jan 2025 09:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taB0Y-0006SL-LY; Tue, 21 Jan 2025 09:57:18 +0000
Received: by outflank-mailman (input) for mailman id 875232;
 Tue, 21 Jan 2025 09:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEc5=UN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taB0X-0006SF-Dw
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 09:57:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 178893a7-d7de-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 10:57:15 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d9f0a6ad83so1864995a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 01:57:15 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f22fdesm720781366b.89.2025.01.21.01.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 01:57:13 -0800 (PST)
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
X-Inumbo-ID: 178893a7-d7de-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737453434; x=1738058234; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLq/1/TKHChK/00HofyD4lzzmkRQv59j49Ig1IX6vnk=;
        b=YVFOIFuwVGaipQYwxCU/9Svap/edFFUqCrvJeOUe4XWd3GjqzT5yOwlxKg5lnpNZWA
         bGw54ElSIWCJNDuUWBfwL2cvJdLLtj99o7Y2TH8dVpIXTMrGooh21oGTHXu+lNH4bueU
         0SSrsaci13APlPdI80rSz7K9Ya81o40T18kX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453434; x=1738058234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLq/1/TKHChK/00HofyD4lzzmkRQv59j49Ig1IX6vnk=;
        b=fBh3d1dD0H9Z8owQVHTfLVvz3Gus4/tvIV7wB2+7TzjJ9c07EaNqdxNLeyEOBN9eyQ
         1UdPvHmteuEtF1WWrKgV4TzyqPyjzxe3U/sMYzxAhzrHQBViw/H1gYRinpczZ4Q8v5+C
         4O5wlgH7wbqbCJzqpOE7f7M+qlKLO6hdL3ORbn9RyQBXmbu7Ifo4Iy+EnbFeN/eRmLt2
         oqHx9xnWcwWyb+GY3a6C3I0VjtjurxrWnzxgE+HRnJ+mA/e2IT/sJacNFRWRm0gd/Oa7
         mJZuQEXONrXNEyZjIDNlsEzqbvguTfyncsbM/AXUw1VwsLdWZsssKUM9kQUpKb0uPn44
         2M0A==
X-Gm-Message-State: AOJu0YzTc7b5ulfEiVs80zZ674cSaP8atoT7lv1y4A+gFH78Mq/4JdX1
	D1kSiXhkSqwW5VqVr4wHL4dqZOtK+egY734stG2HN0c/Rdo7Ki90WYS6QpP3oGBQY441X4pQtvm
	s
X-Gm-Gg: ASbGncv2tBWsr4n+1WTWlJaQRnSFw/Tp0QIlYyfIVwlNldzhx49u0j1el0mAwiIjXo0
	33rarxpadBpaHdKxB0D/bNUhqbHetAVGArd3H7d3t6jf8wAj6soHQHDluWA/sE+sFfVWqkKjG6m
	TjI89dg3sJUDfP7VHY0e02BlImgSwuKSk1ugptBaVSpmCtYR1zNuVv4QizJJAMEeKXIOxTfqBmY
	+J+Ro3hdh8TIBSraAyIZNeu7VXRnnMcSlmzOjG1fbXkGMafjMq4bQ0cCuIGYyVnmPEu00GFTILD
	aEUJ
X-Google-Smtp-Source: AGHT+IHcgiXHgAMe1LbUuoPDB4nCxqK3qTBmqrJxS+RM4BGJBFhOGNBA4zgJ516v7Bn7w3Sa93pYxQ==
X-Received: by 2002:a17:906:dc8c:b0:ab2:f937:b3aa with SMTP id a640c23a62f3a-ab38b4cff42mr1545982566b.56.1737453434167;
        Tue, 21 Jan 2025 01:57:14 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] iommu/amd: atomically update IRTE if supported
Date: Tue, 21 Jan 2025 10:57:04 +0100
Message-ID: <20250121095704.18769-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If using a 32bit Interrupt Remapping Entry or a 128bit one and the CPU
supports 128bit cmpxchg don't disable the entry by setting RemapEn = 0
ahead of updating it.  As a consequence of not toggling RemapEn ahead of
the update the Interrupt Remapping Table needs to be flushed after the
entry update.

This avoids a window where the IRTE has RemapEn = 0, which can lead to
IO_PAGE_FAULT if the underlying interrupt source is not masked.

There's no guidance in AMD-Vi specification about how IRTE update should be
performed as opposed to DTE updating which has specific guidance.  However
DTE updating claims that reads will always be at least 128bits in size, and
hence for the purposes here assume that reads and caching of the IRTE
entries in either 32 or 128 bit format will be done atomically from
the IOMMU.

Note that as part of introducing a new raw128 field in the IRTE struct, the
current raw field is renamed to raw64 to explicitly contain the size in the
field name.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_intr.c | 68 ++++++++++++++++++------
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 7fc796dec25b..efa9ddc62458 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -39,7 +39,8 @@ union irte32 {
 };
 
 union irte128 {
-    uint64_t raw[2];
+    uint64_t raw64[2];
+    __uint128_t raw128;
     struct {
         bool remap_en:1;
         bool sup_io_pf:1;
@@ -187,7 +188,7 @@ static void free_intremap_entry(const struct amd_iommu *iommu,
 
     if ( iommu->ctrl.ga_en )
     {
-        ACCESS_ONCE(entry.ptr128->raw[0]) = 0;
+        ACCESS_ONCE(entry.ptr128->raw64[0]) = 0;
         /*
          * Low half (containing RemapEn) needs to be cleared first.  Note that
          * strictly speaking smp_wmb() isn't enough, as conceptually it expands
@@ -197,7 +198,7 @@ static void free_intremap_entry(const struct amd_iommu *iommu,
          * variant will do.
          */
         smp_wmb();
-        entry.ptr128->raw[1] = 0;
+        entry.ptr128->raw64[1] = 0;
     }
     else
         ACCESS_ONCE(entry.ptr32->raw) = 0;
@@ -223,14 +224,36 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
             },
         };
 
-        ASSERT(!entry.ptr128->full.remap_en);
-        entry.ptr128->raw[1] = irte.raw[1];
-        /*
-         * High half needs to be set before low one (containing RemapEn).  See
-         * comment in free_intremap_entry() regarding the choice of barrier.
-         */
-        smp_wmb();
-        ACCESS_ONCE(entry.ptr128->raw[0]) = irte.raw[0];
+        if ( cpu_has_cx16 )
+        {
+            __uint128_t old = entry.ptr128->raw128;
+            __uint128_t res = cmpxchg16b(&entry.ptr128->raw128, &old,
+                                         &irte.raw128);
+
+            /*
+             * Hardware does not update the IRTE behind our backs, so the
+             * return value should match "old".
+             */
+            if ( res != old )
+            {
+                printk(XENLOG_ERR
+                       "unexpected IRTE %016lx_%016lx (expected %016lx_%016lx)\n",
+                       (uint64_t)(res >> 64), (uint64_t)res,
+                       (uint64_t)(old >> 64), (uint64_t)old);
+                BUG();
+            }
+        }
+        else
+        {
+            ASSERT(!entry.ptr128->full.remap_en);
+            entry.ptr128->raw64[1] = irte.raw64[1];
+            /*
+             * High half needs to be set before low one (containing RemapEn).  See
+             * comment in free_intremap_entry() regarding the choice of barrier.
+             */
+            smp_wmb();
+            ACCESS_ONCE(entry.ptr128->raw64[0]) = irte.raw64[0];
+        }
     }
     else
     {
@@ -300,7 +323,8 @@ static int update_intremap_entry_from_ioapic(
     entry = get_intremap_entry(iommu, req_id, offset);
 
     /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->flds.remap_en )
+    while ( iommu->enabled && entry.ptr32->flds.remap_en &&
+            iommu->ctrl.ga_en && !cpu_has_cx16 )
     {
         entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
@@ -314,6 +338,9 @@ static int update_intremap_entry_from_ioapic(
 
     spin_unlock_irqrestore(lock, flags);
 
+    if ( iommu->enabled && !fresh && (!iommu->ctrl.ga_en || cpu_has_cx16) )
+        amd_iommu_flush_intremap(iommu, req_id);
+
     set_rte_index(rte, offset);
 
     return 0;
@@ -425,6 +452,7 @@ static int update_intremap_entry_from_msi_msg(
     uint8_t delivery_mode, vector, dest_mode;
     spinlock_t *lock;
     unsigned int dest, offset, i;
+    bool fresh = false;
 
     req_id = get_dma_requestor_id(iommu->seg, bdf);
     alias_id = get_intremap_requestor_id(iommu->seg, bdf);
@@ -468,12 +496,14 @@ static int update_intremap_entry_from_msi_msg(
             return -ENOSPC;
         }
         *remap_index = offset;
+        fresh = true;
     }
 
     entry = get_intremap_entry(iommu, req_id, offset);
 
     /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->flds.remap_en )
+    while ( iommu->enabled && entry.ptr32->flds.remap_en &&
+            iommu->ctrl.ga_en && !cpu_has_cx16 )
     {
         entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
@@ -488,6 +518,13 @@ static int update_intremap_entry_from_msi_msg(
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
     spin_unlock_irqrestore(lock, flags);
 
+    if ( iommu->enabled && !fresh && (!iommu->ctrl.ga_en || cpu_has_cx16) )
+    {
+        amd_iommu_flush_intremap(iommu, req_id);
+        if ( alias_id != req_id )
+            amd_iommu_flush_intremap(iommu, alias_id);
+    }
+
     *data = (msg->data & ~(INTREMAP_MAX_ENTRIES - 1)) | offset;
 
     /*
@@ -722,7 +759,7 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
     for ( count = 0; count < nr; count++ )
     {
         if ( iommu->ctrl.ga_en
-             ? !tbl.ptr128[count].raw[0] && !tbl.ptr128[count].raw[1]
+             ? !tbl.ptr128[count].raw64[0] && !tbl.ptr128[count].raw64[1]
              : !tbl.ptr32[count].raw )
                 continue;
 
@@ -735,7 +772,8 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
 
         if ( iommu->ctrl.ga_en )
             printk("    IRTE[%03x] %016lx_%016lx\n",
-                   count, tbl.ptr128[count].raw[1], tbl.ptr128[count].raw[0]);
+                   count, tbl.ptr128[count].raw64[1],
+                   tbl.ptr128[count].raw64[0]);
         else
             printk("    IRTE[%03x] %08x\n", count, tbl.ptr32[count].raw);
     }
-- 
2.46.0


