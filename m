Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92888814A50
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655133.1022847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92Z-0007cY-13; Fri, 15 Dec 2023 14:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655133.1022847; Fri, 15 Dec 2023 14:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92Y-0007Sz-On; Fri, 15 Dec 2023 14:19:46 +0000
Received: by outflank-mailman (input) for mailman id 655133;
 Fri, 15 Dec 2023 14:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE92X-0007Jp-7E
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:19:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0f36918-9b54-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:18:55 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336447100e9so660666f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:18:55 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 m11-20020a056000008b00b0033332524235sm18838237wrx.82.2023.12.15.06.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:18:53 -0800 (PST)
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
X-Inumbo-ID: e0f36918-9b54-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702649934; x=1703254734; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi/OU1B+BD1EA3x0F7BUpdNkno4zp2sbqcsBzG1DxYU=;
        b=nFDC5G/l+7sldOARFp40VwKOHEcm0cFiA8bzoJMJzjEc6+OKCr2eVtuV9PwX1aN6rk
         v8gH8FpR4QzpchbWj1/5dtZQqGawAbGFLStCZdZyV9uxijH3WDtZVxLtrcHGGO2I57tP
         09rDhNeut/SPPXNtKR1lBdw9sEikmozXgUVnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649934; x=1703254734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi/OU1B+BD1EA3x0F7BUpdNkno4zp2sbqcsBzG1DxYU=;
        b=Qi0RjgvS2HwwS9bZJCjSaIOR4fgXU5ZVHrS2Q3FbmoQIR3X0ZPabZjaaxIpvKVxePu
         l1VPDEJNlhjEIA8oUTl5yUMO4O9F2AgVBD/LarT42qG4OLUGDJkKG+R3guO3OwQFnxNk
         deyhgcu4rUpZyF9+EmW+C4bDya/Z/SDkRqBkTCwPysyfFe8jhNjRH4HRbzAGsUnxtXmV
         jXHIzDNRAmbzspuBKe7yv2PGwrXSGm0bXNxVCKsmheZuqiLuc11L2bvN+vNlgx9Zmem6
         8rs0FEbKrZcgFaEo6KLL7DU5EYDghGkh9L1t9fH0o8r7tCQmdfjoYa4xiuq2PqMKY4l+
         ig9A==
X-Gm-Message-State: AOJu0Yz8OB22eR5zUXfYazHoyLxoQzBpWLNWmexxQRgoe7jNSYa7bP0n
	+S6PUi0fwRi6P/5+BePx9x2Bbv+3IYEs22ySZOc=
X-Google-Smtp-Source: AGHT+IGNAKxLrG4i+x0ulksZxzM5IxMcvmrPVWewI4viXKQy/+N3xsRzrOj4Cn+xThFRixmYztTIsA==
X-Received: by 2002:adf:f94a:0:b0:336:2548:2e21 with SMTP id q10-20020adff94a000000b0033625482e21mr3922947wrr.38.1702649934301;
        Fri, 15 Dec 2023 06:18:54 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 4/7] x86/iommu: introduce a rangeset to perform hwdom IOMMU setup
Date: Fri, 15 Dec 2023 15:18:29 +0100
Message-ID: <20231215141832.9492-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215141832.9492-1-roger.pau@citrix.com>
References: <20231215141832.9492-1-roger.pau@citrix.com>
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
Changes since v2:
 - Better deal with read-only regions.
 - Destroy rangeset earlier.
 - Switch to using map_data.flush_flags.
 - Reword commit message to clarify the change in behaviour for HVM will only
   take effect after later changes.

Changes since v1:
 - Split from bigger patch.
---
 xen/drivers/passthrough/x86/iommu.c | 102 +++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 857dccb6a465..ca5e0bca810f 100644
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
+            return 0;
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
+         * Read-only ranges are only created based on the contents of mmio
+         * read-only rangeset, and hence need the additional iomem permissions
+         * check.
+         */
+        while( info->mmio_ro && s <= e && !iomem_access_permitted(d, s, e) )
+        {
+            /*
+             * Consume a frame per iteration until the reminder is accessible
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
     unsigned int flush_flags = 0, start_perms = 0;
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
 
@@ -451,8 +533,26 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
             goto commit;
     }
 
+    if ( iommu_verbose )
+        printk(XENLOG_INFO "%pd: identity mappings for IOMMU:\n", d);
+
+    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
+    if ( rc )
+        panic("IOMMU unable to create mappings: %d\n", rc);
+    rangeset_destroy(map);
+
+    if ( is_pv_domain(d) )
+    {
+        map_data.mmio_ro = true;
+        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
+                                    &map_data);
+        if ( rc )
+            panic("IOMMU unable to create read-only mappings: %d\n", rc);
+    }
+
+    map_data.flush_flags |= flush_flags;
     /* Use if to avoid compiler warning */
-    if ( iommu_iotlb_flush_all(d, flush_flags) )
+    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
         return;
 }
 
-- 
2.43.0


