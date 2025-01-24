Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925A2A1B516
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 13:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876705.1287085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINL-0008PB-GU; Fri, 24 Jan 2025 12:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876705.1287085; Fri, 24 Jan 2025 12:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINL-0008NW-Ci; Fri, 24 Jan 2025 12:01:27 +0000
Received: by outflank-mailman (input) for mailman id 876705;
 Fri, 24 Jan 2025 12:01:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbINJ-0007bK-AC
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 12:01:25 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee63f287-da4a-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 13:01:23 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so621868266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 04:01:23 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e67814sm118167666b.74.2025.01.24.04.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:01:21 -0800 (PST)
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
X-Inumbo-ID: ee63f287-da4a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737720083; x=1738324883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVt6Rj0kKo02aeVOLnGhddbw+hEtfAmvfyBCodPtZ6g=;
        b=JjODsrszv1U9dsAa9ZtCSc+3fGm8uAtr9j//kzUgExAbu0YBHq76aHArgngrDpcPJY
         oioCuMphviKhZZTgQ/Q8a42j7EBwgpgmY3LD7NSPSKWFVTaXUUraXHoj1QQ6cUOcqkQP
         69G0skxDdJwgaeSN60eoPF7aZniL/+VDw8hsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720083; x=1738324883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVt6Rj0kKo02aeVOLnGhddbw+hEtfAmvfyBCodPtZ6g=;
        b=MurSlX3vyiLQv5si8Euj4ULVsE1AbTer5htVUIINxhgfH+VVpmqj+EBM5LE++Opqyr
         /LS9cFm1KaRrVnGkmAqPQe9a6HMZi5cvGjAwORXenHNV6gy4M8eRZc9lEwnETt6adHoo
         9oxvSP36Mn/pg+V6pqGheGTL9ONZ3iqdrZfJELiTW75uPm2ygwFIOOlAvECy2FtFWGZ/
         Z2rp5sVQZ1YZdsfkQdWm4HgHIciZUl3KpSUr6owKDepGdyWeiFZgcQGUgddrOGjefsb9
         fpSYUEFnZ6OUMlSY6YWNl1BcVYdrO5dA+5lI3DZj2CYgI+Rk3kkub7H0vTpNkflfa+Mo
         0Atg==
X-Gm-Message-State: AOJu0YyddWyrRp+7WvXOyJ2koWDdRsixLTpsoYjqxMJ9fyPLV7e1Yi5K
	02BPFp9ugSz/GORbdROQ0HqiTsMjCQ2vim8oWadhHduGwfgYthpxIm8rTQ2v/O6VlvwwGW3QC0g
	n
X-Gm-Gg: ASbGncvHqKIYM/ikYPd4FjdJQMCOq+sh+n6d+VNULrueC5wDRAXW/Tf0v8cM2+cczXW
	DCpdlzYta6AcQlaHE9ll3aVAKpZ7zu/r5GDw1F4C0SMzOsDY09RIW848nTHu6yJsnLQCtPRFbR4
	9/348KnsCB2YjzDv87o3RWvq62Y53NtUXgJAUm/3zm3c6VRmURBWmn/A4iR27gq6r/vf7JU5fcQ
	9zD+weAvBHQqbW0J+/F83EPoU5VRGGFTDmEA5EPKOADZMTh7DcZ9CRVQo5f8e/UnduXT83ouy7c
	Bdv1MDRf8I0hz7Q=
X-Google-Smtp-Source: AGHT+IGR5urwaiLF47OwHM87ZTumEm4WxfrMk8qLxpI+tZWW0hkbPvCEBF+0lO3eKM6AFRu5rh7bEA==
X-Received: by 2002:a17:907:3ea0:b0:aa6:88a2:cfbd with SMTP id a640c23a62f3a-ab662a001f0mr501155566b.22.1737720082614;
        Fri, 24 Jan 2025 04:01:22 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/5] x86/iommu: remove non-CX16 logic from DMA remapping
Date: Fri, 24 Jan 2025 13:01:09 +0100
Message-ID: <20250124120112.56678-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124120112.56678-1-roger.pau@citrix.com>
References: <20250124120112.56678-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Teddy Astie <teddy.astie@vates.tech>

As CX16 support is mandatory for IOMMU usage, the checks for CX16 in the
DMA remapping code are stale.  Remove them together with the associated
code introduced in case CX16 was not available.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_map.c | 42 +++++----------
 xen/drivers/passthrough/vtd/iommu.c     | 71 ++++++-------------------
 2 files changed, 31 insertions(+), 82 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 1f0e4167566b..dde393645a62 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -167,15 +167,14 @@ int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
 {
     bool valid = flags & SET_ROOT_VALID;
 
-    if ( dte->v && dte->tv &&
-         (cpu_has_cx16 || (flags & SET_ROOT_WITH_UNITY_MAP)) )
+    if ( dte->v && dte->tv )
     {
         union {
             struct amd_iommu_dte dte;
             uint64_t raw64[4];
             __uint128_t raw128[2];
         } ldte = { .dte = *dte };
-        __uint128_t old = ldte.raw128[0];
+        __uint128_t res, old = ldte.raw128[0];
         int ret = 0;
 
         ldte.dte.domain_id = domain_id;
@@ -185,33 +184,20 @@ int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
         ldte.dte.paging_mode = paging_mode;
         ldte.dte.v = valid;
 
-        if ( cpu_has_cx16 )
-        {
-            __uint128_t res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
+        res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
 
-            /*
-             * Hardware does not update the DTE behind our backs, so the
-             * return value should match "old".
-             */
-            if ( res != old )
-            {
-                printk(XENLOG_ERR
-                       "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
-                       domain_id,
-                       (uint64_t)(res >> 64), (uint64_t)res,
-                       (uint64_t)(old >> 64), (uint64_t)old);
-                ret = -EILSEQ;
-            }
-        }
-        else /* Best effort, updating domain_id last. */
+        /*
+         * Hardware does not update the DTE behind our backs, so the
+         * return value should match "old".
+         */
+        if ( res != old )
         {
-            uint64_t *ptr = (void *)dte;
-
-            write_atomic(ptr + 0, ldte.raw64[0]);
-            /* No barrier should be needed between these two. */
-            write_atomic(ptr + 1, ldte.raw64[1]);
-
-            ret = 1;
+            printk(XENLOG_ERR
+                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
+                   domain_id,
+                   (uint64_t)(res >> 64), (uint64_t)res,
+                   (uint64_t)(old >> 64), (uint64_t)old);
+            ret = -EILSEQ;
         }
 
         return ret;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 3daedc4f5593..b0963bfcf74e 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1485,7 +1485,7 @@ int domain_context_mapping_one(
 {
     struct domain_iommu *hd = dom_iommu(domain);
     struct context_entry *context, *context_entries, lctxt;
-    __uint128_t old;
+    __uint128_t res, old;
     uint64_t maddr;
     uint16_t seg = iommu->drhd->segment, prev_did = 0;
     struct domain *prev_dom = NULL;
@@ -1583,55 +1583,23 @@ int domain_context_mapping_one(
         ASSERT(!context_fault_disable(lctxt));
     }
 
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t res = cmpxchg16b(context, &old, &lctxt.full);
-
-        /*
-         * Hardware does not update the context entry behind our backs,
-         * so the return value should match "old".
-         */
-        if ( res != old )
-        {
-            if ( pdev )
-                check_cleanup_domid_map(domain, pdev, iommu);
-            printk(XENLOG_ERR
-                   "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF(seg, bus, devfn),
-                   (uint64_t)(res >> 64), (uint64_t)res,
-                   (uint64_t)(old >> 64), (uint64_t)old);
-            rc = -EILSEQ;
-            goto unlock;
-        }
-    }
-    else if ( !prev_dom || !(mode & MAP_WITH_RMRR) )
-    {
-        context_clear_present(*context);
-        iommu_sync_cache(context, sizeof(*context));
+    res = cmpxchg16b(context, &old, &lctxt.full);
 
-        write_atomic(&context->hi, lctxt.hi);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->lo, lctxt.lo);
-    }
-    else /* Best effort, updating DID last. */
+    /*
+     * Hardware does not update the context entry behind our backs,
+     * so the return value should match "old".
+     */
+    if ( res != old )
     {
-         /*
-          * By non-atomically updating the context entry's DID field last,
-          * during a short window in time TLB entries with the old domain ID
-          * but the new page tables may be inserted.  This could affect I/O
-          * of other devices using this same (old) domain ID.  Such updating
-          * therefore is not a problem if this was the only device associated
-          * with the old domain ID.  Diverting I/O of any of a dying domain's
-          * devices to the quarantine page tables is intended anyway.
-          */
-        if ( !(mode & (MAP_OWNER_DYING | MAP_SINGLE_DEVICE)) )
-            printk(XENLOG_WARNING VTDPREFIX
-                   " %pp: reassignment may cause %pd data corruption\n",
-                   &PCI_SBDF(seg, bus, devfn), prev_dom);
-
-        write_atomic(&context->lo, lctxt.lo);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->hi, lctxt.hi);
+        if ( pdev )
+            check_cleanup_domid_map(domain, pdev, iommu);
+        printk(XENLOG_ERR
+                "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
+                &PCI_SBDF(seg, bus, devfn),
+                (uint64_t)(res >> 64), (uint64_t)res,
+                (uint64_t)(old >> 64), (uint64_t)old);
+        rc = -EILSEQ;
+        goto unlock;
     }
 
     iommu_sync_cache(context, sizeof(struct context_entry));
@@ -2702,12 +2670,7 @@ static int __init cf_check vtd_setup(void)
             iommu_intremap = iommu_intremap_off;
 
 #ifndef iommu_intpost
-        /*
-         * We cannot use posted interrupt if X86_FEATURE_CX16 is
-         * not supported, since we count on this feature to
-         * atomically update 16-byte IRTE in posted format.
-         */
-        if ( !cap_intr_post(iommu->cap) || !iommu_intremap || !cpu_has_cx16 )
+        if ( !cap_intr_post(iommu->cap) || !iommu_intremap )
             iommu_intpost = false;
 #endif
 
-- 
2.46.0


