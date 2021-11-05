Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBBB445FE7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222092.384186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9Y-0001no-Ik; Fri, 05 Nov 2021 06:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222092.384186; Fri, 05 Nov 2021 06:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9Y-0001jh-3g; Fri, 05 Nov 2021 06:56:44 +0000
Received: by outflank-mailman (input) for mailman id 222092;
 Fri, 05 Nov 2021 06:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9W-0008NQ-0U
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:42 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87859bdc-3e05-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:56:41 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id f8so29948103edy.4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:41 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:40 -0700 (PDT)
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
X-Inumbo-ID: 87859bdc-3e05-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XyZSMZ7iKKLkWA3FJonAF/JNUpQ9LSX1yaRvNFIyvMA=;
        b=paJTQbNmX2422YdQxWAkilGdnCnfHcrX2/PzNL261GPmAbwsW/hW0kMVLU7BDmktI9
         +JANFVQP1BD65WstErEcXciOyRkV+R1+rIcSIldz9iiZz9R1NqpO/uDu7NI80dpdkYTW
         kQ4y8h1qZ5/OeU6Sf8vPNnkB+orjbVrz53tjMfsRJz2MJJ6SFSVYtyV3I56I7Su5ANvx
         j2UqBdk0N++TAeevhZHkrGmZ93CtMT4iINrgTFs4mdGojt4F7ZCvfJ9eFIq1i7Llo6xl
         ebr68ogUy0sBwWO7Om6TPtN/Nc1yl6KavKrpJBrEn4vwqZ6tpdqoCAoOxFPcv3NpziqY
         cXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XyZSMZ7iKKLkWA3FJonAF/JNUpQ9LSX1yaRvNFIyvMA=;
        b=N5OvLfxvUmZ/dspgu4KNY3YjfyEQ5HEpIEuw1WMneZLsH6aKWb2zkysaYlMl1gjMzN
         xpB3LRzeUchVAHBXfHZsvnt/Z/phr6GZ7W13MY/m8mCjVfGezItZkM6icH0t8OicW6Ie
         TFyUthVuh/sTk+TR+tsfUFPDIfUgsGafEJIZup6IsQIdaSQ4+MKZ9X83we4cISeb1Pyi
         flJtGuW7UQacgcNfqYAQahadkkO2ShzEMjtXIgwLgYindW5CvgMl8iZqZMIrkaMAM9pj
         e8hObMTym9gHXhJApZgeM7ee/divEWitMRP7j3ZCigd/tabRbp0DtWWktFlCEVH4g+sE
         A7Cg==
X-Gm-Message-State: AOAM532d6KOXxM1zl1RVPRfvMmcaNl+B8Iuo/P2iNDndU67bLRW18Wc4
	iuiMw/QeoKzYQ1wEeomg7Ea1w8kC92o7sQ==
X-Google-Smtp-Source: ABdhPJw6edY8YQ99u9eqfsvwlkGtZAjVgFNAwPaaqGlEbF+LcSDWS6OORU0obPFktGIYzCLWO6v6Bw==
X-Received: by 2002:a17:907:8a1b:: with SMTP id sc27mr35150537ejc.572.1636095400630;
        Thu, 04 Nov 2021 23:56:40 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 07/11] vpci/header: program p2m with guest BAR view
Date: Fri,  5 Nov 2021 08:56:25 +0200
Message-Id: <20211105065629.940943-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Take into account guest's BAR view and program its p2m accordingly:
gfn is guest's view of the BAR and mfn is the physical BAR value as set
up by the host bridge in the hardware domain.
This way hardware doamin sees physical BAR values and guest sees
emulated ones.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v3:
- updated comment (Roger)
- removed gfn_add(map->start_gfn, rc); which is wrong
- use v->domain instead of v->vpci.pdev->domain
- removed odd e.g. in comment
- s/d%d/%pd in altered code
- use gdprintk for map/unmap logs
Since v2:
- improve readability for data.start_gfn and restructure ?: construct
Since v1:
 - s/MSI/MSI-X in comments
---
 xen/drivers/vpci/header.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5fc2dfbbc864..34158da2d5f6 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -30,6 +30,10 @@
 
 struct map_data {
     struct domain *d;
+    /* Start address of the BAR as seen by the guest. */
+    gfn_t start_gfn;
+    /* Physical start address of the BAR. */
+    mfn_t start_mfn;
     bool map;
 };
 
@@ -37,12 +41,24 @@ static int map_range(unsigned long s, unsigned long e, void *data,
                      unsigned long *c)
 {
     const struct map_data *map = data;
+    gfn_t start_gfn;
     int rc;
 
     for ( ; ; )
     {
         unsigned long size = e - s + 1;
 
+        /*
+         * Ranges to be mapped don't always start at the BAR start address, as
+         * there can be holes or partially consumed ranges. Account for the
+         * offset of the current address from the BAR start.
+         */
+        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));
+
+        gdprintk(XENLOG_G_DEBUG,
+                 "%smap [%lx, %lx] -> %#"PRI_gfn" for %pd\n",
+                 map->map ? "" : "un", s, e, gfn_x(start_gfn),
+                 map->d);
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be passed
@@ -52,8 +68,10 @@ static int map_range(unsigned long s, unsigned long e, void *data,
          * - {un}map_mmio_regions doesn't support preemption.
          */
 
-        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
+        rc = map->map ? map_mmio_regions(map->d, start_gfn,
+                                         size, _mfn(s))
+                      : unmap_mmio_regions(map->d, start_gfn,
+                                           size, _mfn(s));
         if ( rc == 0 )
         {
             *c += size;
@@ -62,8 +80,8 @@ static int map_range(unsigned long s, unsigned long e, void *data,
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
-                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
-                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
+                   "Failed to identity %smap [%lx, %lx] for %pd: %d\n",
+                   map->map ? "" : "un", s, e, map->d, rc);
             break;
         }
         ASSERT(rc < size);
@@ -149,6 +167,10 @@ bool vpci_process_pending(struct vcpu *v)
             if ( rangeset_is_empty(bar->mem) )
                 continue;
 
+            data.start_gfn =
+                 _gfn(PFN_DOWN(is_hardware_domain(v->domain)
+                               ? bar->addr : bar->guest_addr));
+            data.start_mfn = _mfn(PFN_DOWN(bar->addr));
             rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
             if ( rc == -ERESTART )
@@ -223,6 +245,9 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         if ( rangeset_is_empty(bar->mem) )
             continue;
 
+        data.start_gfn = _gfn(PFN_DOWN(is_hardware_domain(d)
+                                       ? bar->addr : bar->guest_addr));
+        data.start_mfn = _mfn(PFN_DOWN(bar->addr));
         while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) == -ERESTART )
             process_pending_softirqs();
-- 
2.25.1


