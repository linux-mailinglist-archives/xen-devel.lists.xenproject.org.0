Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D7A1B515
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 13:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876708.1287105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINO-0000YC-7j; Fri, 24 Jan 2025 12:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876708.1287105; Fri, 24 Jan 2025 12:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINO-0000UY-3E; Fri, 24 Jan 2025 12:01:30 +0000
Received: by outflank-mailman (input) for mailman id 876708;
 Fri, 24 Jan 2025 12:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbINN-0007hy-5l
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 12:01:29 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f14bc8ef-da4a-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 13:01:28 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab2e308a99bso380588366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 04:01:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab21esm119803566b.91.2025.01.24.04.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:01:27 -0800 (PST)
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
X-Inumbo-ID: f14bc8ef-da4a-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737720087; x=1738324887; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmWyXMHgHQ0P1pkeRIOSC5BWPtegTo9AV2b/sAitCDA=;
        b=Qi83Z7QgRg3Smm2WqWxfDEU/tHxOlKlav+sjDWXuyZmMorgcuBfXVglzujK/dUVFMO
         OajNmYMGiX2zcWDNtkMvrTNj46rDIhORR0V0xmbNxhmtwmH0ZaqDE8ZcZfOBF5qjKpfC
         4zeBNj87hl/YzPfcnGjRIhkMzoR6PHTUhbZes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720087; x=1738324887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmWyXMHgHQ0P1pkeRIOSC5BWPtegTo9AV2b/sAitCDA=;
        b=RmqJrKXXRjwbPpOulMYi+wozZkzSsH3q8Q3ZMhe1MBlFKONo1UppATIhsFmk0PVugF
         +7pktf1TFyw8x41GTaxDULnYWIOsh57aOlxT9CucqrEOslsX2+OdOOLYSO4Vj1swBIf1
         J6557kfCr8NJ/uC/3hDXSLlVjLKGay8wIu6hDtAo2t8Nfn+oh8N+bTuFUOXRP4dUUk2n
         3IUK2c9B0KTi5LxrG5wUna3+gW3ps7IyNxTqVXohzMBa0/v/3GclBXhuJeDxlqnGwAB7
         VONFcYmhG6wR1OfuELRWBYBhQnhMKhikGvboxzqs5Cz8Y+lt2rFGuxGOLci/fyAMOPns
         CHoA==
X-Gm-Message-State: AOJu0Yyp6T9AtcHCgXeImh7Cw/cLTjAexEgbCIam5FQc1AhBs11ZYm+h
	tUvdkpjA01LxbkvBDZoCyKbzf40FEMPg09XPI4Lrm+MapzluY1p0ihHEDDycvTMMqw+gzS+fUQY
	d
X-Gm-Gg: ASbGncvn1ekXpGRrmKtlcjC1Vbex/rtxuC97vtPJgiMP79skCk/AzYNt5dktVvYTzoI
	gVmTH7BAp99EL01KI0ZV0XYbv50s9NkEYqYHc/YVtNLQVHz4TMQlW+A9knaPLmEYdoJqlmg/6yy
	q7MN4tjaTJdEsFqR2gGYxoao6SajnOeYCN7oaZRU3Kss6nSP2sbv456UdVrcoq7M5gXy6RabKkf
	X5HgQAFMcKTyu4ARW3qCur2HbbuCsSmUU+oYt0yh9NZKnSvET4JCusMzA4KIw93I5s6MYChD99L
	GHQFZm+sLw5cy88=
X-Google-Smtp-Source: AGHT+IGBGKgfieeigYW9s9OK8DaGTcbZVqcEXPQFnIqnHZAlx3xjKRNljOF2ZKSB/sGXA6FfIZrH4Q==
X-Received: by 2002:a17:907:7e96:b0:aa4:cd1e:c91b with SMTP id a640c23a62f3a-ab6745b8c27mr272502266b.7.1737720087493;
        Fri, 24 Jan 2025 04:01:27 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 5/5] iommu/amd: atomically update IRTE
Date: Fri, 24 Jan 2025 13:01:11 +0100
Message-ID: <20250124120112.56678-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124120112.56678-1-roger.pau@citrix.com>
References: <20250124120112.56678-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Either when using a 32bit Interrupt Remapping Entry or a 128bit one update
the entry atomically, by using cmpxchg unconditionally as IOMMU depends on
it.  No longer disable the entry by setting RemapEn = 0 ahead of updating
it.  As a consequence of not toggling RemapEn ahead of the update the
Interrupt Remapping Table needs to be flushed after the entry update.

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
Changes since v1:
 - cmpxchg is now always available if the IOMMU is enabled.
---
 xen/drivers/passthrough/amd/iommu_intr.c | 75 ++++++++++--------------
 1 file changed, 32 insertions(+), 43 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index f07fd9e3d970..c0273059cb1d 100644
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
@@ -212,7 +213,7 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
 {
     if ( iommu->ctrl.ga_en )
     {
-        union irte128 irte = {
+        const union irte128 irte = {
             .full = {
                 .remap_en = true,
                 .int_type = int_type,
@@ -222,19 +223,26 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
                 .vector = vector,
             },
         };
+        __uint128_t old = entry.ptr128->raw128;
+        __uint128_t res = cmpxchg16b(&entry.ptr128->raw128, &old,
+                                     &irte.raw128);
 
-        ASSERT(!entry.ptr128->full.remap_en);
-        entry.ptr128->raw[1] = irte.raw[1];
         /*
-         * High half needs to be set before low one (containing RemapEn).  See
-         * comment in free_intremap_entry() regarding the choice of barrier.
+         * Hardware does not update the IRTE behind our backs, so the return
+         * value should match "old".
          */
-        smp_wmb();
-        ACCESS_ONCE(entry.ptr128->raw[0]) = irte.raw[0];
+        if ( res != old )
+        {
+            printk(XENLOG_ERR
+                   "unexpected IRTE %016lx_%016lx (expected %016lx_%016lx)\n",
+                   (uint64_t)(res >> 64), (uint64_t)res,
+                   (uint64_t)(old >> 64), (uint64_t)old);
+            ASSERT_UNREACHABLE();
+        }
     }
     else
     {
-        union irte32 irte = {
+        const union irte32 irte = {
             .flds = {
                 .remap_en = true,
                 .int_type = int_type,
@@ -299,21 +307,13 @@ static int update_intremap_entry_from_ioapic(
 
     entry = get_intremap_entry(iommu, req_id, offset);
 
-    /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->flds.remap_en )
-    {
-        entry.ptr32->flds.remap_en = false;
-        spin_unlock(lock);
-
-        amd_iommu_flush_intremap(iommu, req_id);
-
-        spin_lock(lock);
-    }
-
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
 
     spin_unlock_irqrestore(lock, flags);
 
+    if ( !fresh )
+        amd_iommu_flush_intremap(iommu, req_id);
+
     set_rte_index(rte, offset);
 
     return 0;
@@ -322,7 +322,7 @@ static int update_intremap_entry_from_ioapic(
 void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    struct IO_APIC_route_entry old_rte, new_rte;
+    struct IO_APIC_route_entry new_rte;
     int seg, bdf, rc;
     struct amd_iommu *iommu;
     unsigned int idx;
@@ -346,14 +346,6 @@ void cf_check amd_iommu_ioapic_update_ire(
         return;
     }
 
-    old_rte = __ioapic_read_entry(apic, pin, true);
-    /* mask the interrupt while we change the intremap table */
-    if ( !old_rte.mask )
-    {
-        old_rte.mask = 1;
-        __ioapic_write_entry(apic, pin, true, old_rte);
-    }
-
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
              bdf, iommu, &new_rte,
@@ -425,6 +417,7 @@ static int update_intremap_entry_from_msi_msg(
     uint8_t delivery_mode, vector, dest_mode;
     spinlock_t *lock;
     unsigned int dest, offset, i;
+    bool fresh = false;
 
     req_id = get_dma_requestor_id(iommu->seg, bdf);
     alias_id = get_intremap_requestor_id(iommu->seg, bdf);
@@ -468,26 +461,21 @@ static int update_intremap_entry_from_msi_msg(
             return -ENOSPC;
         }
         *remap_index = offset;
+        fresh = true;
     }
 
     entry = get_intremap_entry(iommu, req_id, offset);
 
-    /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->flds.remap_en )
-    {
-        entry.ptr32->flds.remap_en = false;
-        spin_unlock(lock);
+    update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
+    spin_unlock_irqrestore(lock, flags);
 
+    if ( !fresh )
+    {
         amd_iommu_flush_intremap(iommu, req_id);
         if ( alias_id != req_id )
             amd_iommu_flush_intremap(iommu, alias_id);
-
-        spin_lock(lock);
     }
 
-    update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
-    spin_unlock_irqrestore(lock, flags);
-
     *data = (msg->data & ~(INTREMAP_MAX_ENTRIES - 1)) | offset;
 
     /*
@@ -735,7 +723,7 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
     for ( count = 0; count < nr; count++ )
     {
         if ( iommu->ctrl.ga_en
-             ? !tbl.ptr128[count].raw[0] && !tbl.ptr128[count].raw[1]
+             ? !tbl.ptr128[count].raw64[0] && !tbl.ptr128[count].raw64[1]
              : !tbl.ptr32[count].raw )
                 continue;
 
@@ -748,7 +736,8 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
 
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


