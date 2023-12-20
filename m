Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839C81A012
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657805.1026935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws5-00047A-M1; Wed, 20 Dec 2023 13:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657805.1026935; Wed, 20 Dec 2023 13:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws5-00043g-Fo; Wed, 20 Dec 2023 13:44:25 +0000
Received: by outflank-mailman (input) for mailman id 657805;
 Wed, 20 Dec 2023 13:44:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFws3-0003Gg-BD
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:44:23 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d27ec8-9f3d-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 14:44:22 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c1b5so61762575e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 05:44:22 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b0040b3867a297sm7383756wms.36.2023.12.20.05.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 05:44:20 -0800 (PST)
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
X-Inumbo-ID: e1d27ec8-9f3d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703079861; x=1703684661; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcflDR0c/PkDOoqkRYMUGNCU9Eem4zvQx0D8NuPEX+c=;
        b=AqR+YDNvx5ALTt95GNoLqdUanGate8CrmdrloXWjwtoGH8WcBVuG8/WZULNfjR2bWI
         aNHMjti4Wt39EjvEMFXljysD1LqcJ4QRZk6/ojMwEOetEL2gBdPOUrgXEezY9sNj1IWq
         Y38hkJMyZTkmwg1p/9lHuvewDHqXAjvtg3ub0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703079861; x=1703684661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcflDR0c/PkDOoqkRYMUGNCU9Eem4zvQx0D8NuPEX+c=;
        b=juPe0K1oe1SXSjAWTQsQEONdpunJXn5uQLCLShn8RUu+Ma+MaXkVm1o0txbcZNY5Kn
         eaexihce8TMeQp0u4u2FC5MLJz/WQ59ery4plE3uGVrCluNiueOMgSqsDezQNkf80rAO
         qpVyJhRTHbYKj/RCQHC/9zUkaJ+ez3aAK9I9xTmcdx9jKkfh9fYQqWm1VpzCAGbQhhAn
         WJW84lRQ2hKzsrXbG/18K7sNxbrO9Pk/slyJpOOIAwP4Tka+KjpnsOJeupSf0EryFg6e
         aloR4qQvliPUTERUO9fdTT/emNIX18K6PLCHCeSpXABFJkfM2fCEpgEtthTxpqeHSDZ7
         B0RA==
X-Gm-Message-State: AOJu0YzZIFvJOcEbNp2e3JPRPdVMY5AYXzt9us0sqQyQg8wUJsr77Iz3
	XfmyNEna6a0OsH1OZqCAP6CdtUSaFXRS6NB0sGw=
X-Google-Smtp-Source: AGHT+IGlYhIcislbaDTsllDLbIkpsrmeutmcKq++WkDEcQ/sFfAlRnNhMNzM+7URPTflZl6Hc4VmMQ==
X-Received: by 2002:a05:600c:204b:b0:40c:38dc:f6c8 with SMTP id p11-20020a05600c204b00b0040c38dcf6c8mr10116139wmg.172.1703079861392;
        Wed, 20 Dec 2023 05:44:21 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 3/6] x86/iommu: introduce a rangeset to perform hwdom IOMMU setup
Date: Wed, 20 Dec 2023 14:43:43 +0100
Message-ID: <20231220134346.22430-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134346.22430-1-roger.pau@citrix.com>
References: <20231220134346.22430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This change just introduces the boilerplate code in order to use a rangeset
when setting up the hardware domain IOMMU mappings.  The rangeset is never
populated in this patch, so it's a non-functional change as far as the mappings
the domain gets established.

Note there will be a change for HVM domains (ie: PVH dom0) when the code
introduced here gets used: the p2m mappings will be established using
map_mmio_regions() instead of p2m_add_identity_entry(), so that ranges can be
mapped with a single function call if possible.  Note that the interface of
map_mmio_regions() doesn't allow creating read-only mappings, but so far there
are no such mappings created for PVH dom0 in arch_iommu_hwdom_init().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Fix one style issue and one typo in a comment.
 - Use map_data.flush_flags in replacement of flush_flags.
 - Return -EOPNOTSUPP on failure to create RO mappings for HVM.
 - Do not panic if mapping of ranges fails, print an error message.

Changes since v2:
 - Better deal with read-only regions.
 - Destroy rangeset earlier.
 - Switch to using map_data.flush_flags.
 - Reword commit message to clarify the change in behaviour for HVM will only
   take effect after later changes.

Changes since v1:
 - Split from bigger patch.
---
 xen/drivers/passthrough/x86/iommu.c | 103 +++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 857dccb6a465..59b0c7e980ca 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -370,10 +370,88 @@ static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
     return perms;
 }
 
+struct map_data {
+    struct domain *d;
+    unsigned int flush_flags;
+    bool mmio_ro;
+};
+
+static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
+                                              void *data)
+{
+    struct map_data *info = data;
+    struct domain *d = info->d;
+    long rc;
+
+    if ( iommu_verbose )
+        printk(XENLOG_INFO " [%010lx, %010lx] R%c\n",
+               s, e, info->mmio_ro ? 'O' : 'W');
+
+    if ( paging_mode_translate(d) )
+    {
+        if ( info->mmio_ro )
+        {
+            ASSERT_UNREACHABLE();
+            /* End the rangeset iteration, as other regions will also fail. */
+            return -EOPNOTSUPP;
+        }
+        while ( (rc = map_mmio_regions(d, _gfn(s), e - s + 1, _mfn(s))) > 0 )
+        {
+            s += rc;
+            process_pending_softirqs();
+        }
+    }
+    else
+    {
+        const unsigned int perms = IOMMUF_readable | IOMMUF_preempt |
+                                   (info->mmio_ro ? 0 : IOMMUF_writable);
+
+        /*
+         * Read-only ranges are strictly MMIO and need an additional iomem
+         * permissions check.
+         */
+        while ( info->mmio_ro && s <= e && !iomem_access_permitted(d, s, e) )
+        {
+            /*
+             * Consume a frame per iteration until the remainder is accessible
+             * or there's nothing left to map.
+             */
+            if ( iomem_access_permitted(d, s, s) )
+            {
+                rc = iommu_map(d, _dfn(s), _mfn(s), 1, perms,
+                               &info->flush_flags);
+                if ( rc < 0 )
+                    break;
+                /* Must map a frame at least, which is what we request for. */
+                ASSERT(rc == 1);
+                process_pending_softirqs();
+            }
+            s++;
+        }
+        while ( (rc = iommu_map(d, _dfn(s), _mfn(s), e - s + 1,
+                                perms, &info->flush_flags)) > 0 )
+        {
+            s += rc;
+            process_pending_softirqs();
+        }
+    }
+    ASSERT(rc <= 0);
+    if ( rc )
+        printk(XENLOG_WARNING
+               "IOMMU identity mapping of [%lx, %lx] failed: %ld\n",
+               s, e, rc);
+
+    /* Ignore errors and attempt to map the remaining regions. */
+    return 0;
+}
+
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
     unsigned long i, top, max_pfn, start, count;
-    unsigned int flush_flags = 0, start_perms = 0;
+    unsigned int start_perms = 0;
+    struct rangeset *map;
+    struct map_data map_data = { .d = d };
+    int rc;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -397,6 +475,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( iommu_hwdom_passthrough )
         return;
 
+    map = rangeset_new(NULL, NULL, 0);
+    if ( !map )
+        panic("IOMMU init: unable to allocate rangeset\n");
+
     max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
     top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
 
@@ -427,7 +509,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         commit:
             while ( (rc = iommu_map(d, _dfn(start), _mfn(start), count,
                                     start_perms | IOMMUF_preempt,
-                                    &flush_flags)) > 0 )
+                                    &map_data.flush_flags)) > 0 )
             {
                 start += rc;
                 count -= rc;
@@ -451,8 +533,23 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
             goto commit;
     }
 
+    if ( iommu_verbose )
+        printk(XENLOG_INFO "%pd: identity mappings for IOMMU:\n", d);
+
+    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
+    rangeset_destroy(map);
+    if ( !rc && is_pv_domain(d) )
+    {
+        map_data.mmio_ro = true;
+        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
+                                    &map_data);
+    }
+    if ( rc )
+        printk(XENLOG_WARNING "IOMMU unable to create %smappings: %d\n",
+               map_data.mmio_ro ? "read-only " : "", rc);
+
     /* Use if to avoid compiler warning */
-    if ( iommu_iotlb_flush_all(d, flush_flags) )
+    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
         return;
 }
 
-- 
2.43.0


