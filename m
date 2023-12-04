Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCADB802EFB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646679.1009220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tx-00048a-A7; Mon, 04 Dec 2023 09:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646679.1009220; Mon, 04 Dec 2023 09:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tx-00042C-4p; Mon, 04 Dec 2023 09:43:17 +0000
Received: by outflank-mailman (input) for mailman id 646679;
 Mon, 04 Dec 2023 09:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA5Tu-0003MS-VC
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:43:14 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8abe08a9-9289-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:43:13 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c0e37cfafso1939595e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:43:13 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 jg23-20020a05600ca01700b0040b30be6244sm14376982wmb.24.2023.12.04.01.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:43:11 -0800 (PST)
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
X-Inumbo-ID: 8abe08a9-9289-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701682992; x=1702287792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhvbsGVggmpzL6VhFDTXJNRWZSL+PUA9PR1Ri8iXGLA=;
        b=CliS9MysGcFD0fTcqL/ZY5smT34J9ksrIrzqr5q94/gJXy2oU8Mzq7lVp0EogdMQGC
         eyIOI8NoY37snuQAYv/E/77IzGHiDKnsHkAfCnRhTA2oeqVB7C63OMyWwuFqcuB4Xumr
         BmrF1k9nUIx0Ixz8OztsnuBgIbHtb5Wpd8HjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682992; x=1702287792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhvbsGVggmpzL6VhFDTXJNRWZSL+PUA9PR1Ri8iXGLA=;
        b=arxf30jkxw+06ZkiByNjxbhcsp9658smc2WK2yV/1aQdB/Qr3S9GO4e10qR+x+Xfgt
         VYZwjer4FyVFGVMy72RDOxqg2Mm99VUL67TNcMb6EJoBnhj1FqdUTcmAl3VAIT2pZTBX
         OpwMX1wwqibEFX4jXfxx6RUwfcUUikpUyfi00CN/KuEgGqdrXObo0Sdkb7RTUOOiNf6B
         KnusvQWsnc+JMwG8YpliSQH6jkOGYOIRbVraf+XAWlveFH91sGRu6pJRQhJdg6/h+BfB
         Mm2WF1b1YzDOWugi4hkhQhK+Yr4GjXUKCuYlvtO9PV3qXzpGp/z48yLatrUud8HVgBD6
         Mktg==
X-Gm-Message-State: AOJu0YyEjpAW29EOB6nmRpcQPIPNV3/s/zbuWMSqv542wTk4Qm5YK30L
	YGajOpg9iDnXtzSVzXQStcd4582/loFrujFgDZE=
X-Google-Smtp-Source: AGHT+IHGbm6svOID28oBbJ+PecxwhKiaRzO5RQK1pDm0gQJ0G0iWUsdq17d4C0+yP1bsmBSFLCBdoA==
X-Received: by 2002:a05:600c:601a:b0:40b:5e59:c557 with SMTP id az26-20020a05600c601a00b0040b5e59c557mr2262756wmb.129.1701682991843;
        Mon, 04 Dec 2023 01:43:11 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 3/6] x86/iommu: introduce a rangeset to perform hwdom IOMMU setup
Date: Mon,  4 Dec 2023 10:43:02 +0100
Message-ID: <20231204094305.59267-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204094305.59267-1-roger.pau@citrix.com>
References: <20231204094305.59267-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This change just introduces the boilerplate code in order to use a rangeset
when setting up the hardware domain IOMMU mappings.  The rangeset is never
populated in this patch, so it's a non-functional change as far as the mappings
the domain gets established.

Note there's a change for HVM domains (ie: PVH dom0) that will get switched to
create the p2m mappings using map_mmio_regions() instead of
p2m_add_identity_entry(), so that ranges can be mapped with a single function
call if possible.  Note that the interface of map_mmio_regions() doesn't allow
creating read-only mappings, but so far there are no such mappings created for
PVH dom0 in arch_iommu_hwdom_init().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Split from bigger patch.
---
 xen/drivers/passthrough/x86/iommu.c | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 857dccb6a465..531a428f6496 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -370,10 +370,77 @@ static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
     return perms;
 }
 
+struct map_data {
+    struct domain *d;
+    unsigned int flush_flags;
+    bool ro;
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
+               s, e, info->ro ? 'O' : 'W');
+
+    if ( paging_mode_translate(d) )
+    {
+        if ( info->ro )
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
+                                   (info->ro ? 0 : IOMMUF_writable);
+
+        if ( info->ro && !iomem_access_permitted(d, s, e) )
+        {
+            /*
+             * Should be more fine grained in order to not map the forbidden
+             * frame instead of rejecting the region as a whole, but it's only
+             * for read-only MMIO regions, which are very limited.
+             */
+            printk(XENLOG_DEBUG
+                   "IOMMU read-only mapping of region [%lx, %lx] forbidden\n",
+                   s, e);
+            return 0;
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
 
@@ -397,6 +464,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( iommu_hwdom_passthrough )
         return;
 
+    map = rangeset_new(NULL, NULL, 0);
+    if ( !map )
+        panic("IOMMU init: unable to allocate rangeset\n");
+
     max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
     top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
 
@@ -451,6 +522,24 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
             goto commit;
     }
 
+    if ( iommu_verbose )
+        printk(XENLOG_INFO "d%u: identity mappings for IOMMU:\n",
+               d->domain_id);
+
+    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
+    if ( rc )
+        panic("IOMMU unable to create mappings: %d\n", rc);
+    if ( is_pv_domain(d) )
+    {
+        map_data.ro = true;
+        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
+                                    &map_data);
+        if ( rc )
+            panic("IOMMU unable to create read-only mappings: %d\n", rc);
+    }
+
+    rangeset_destroy(map);
+
     /* Use if to avoid compiler warning */
     if ( iommu_iotlb_flush_all(d, flush_flags) )
         return;
-- 
2.43.0


