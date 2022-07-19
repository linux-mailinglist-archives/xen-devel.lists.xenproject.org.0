Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE3057A59D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370803.602740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFg-0007lm-8r; Tue, 19 Jul 2022 17:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370803.602740; Tue, 19 Jul 2022 17:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFg-0007he-3b; Tue, 19 Jul 2022 17:43:20 +0000
Received: by outflank-mailman (input) for mailman id 370803;
 Tue, 19 Jul 2022 17:43:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFe-00065R-48
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4543bb89-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:16 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id l23so28588728ejr.5
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:16 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:15 -0700 (PDT)
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
X-Inumbo-ID: 4543bb89-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=shxNV9joemK5imu4wT4+Id91nCPY01JMn0lJabYidsY=;
        b=eVHUjDx8fQyS+XcgwN0giiiOlBNaG1kuJPLiM5qEXzokJ/H8xzEiCobcMgiP1TD4tt
         g7YfLq9ADCL1ix35Dnb3kvv+QacuObxCwfEke6l9P5BfQ0mDfZEh4CvOy/CEQJI8qrGX
         M7bILaJys4OtfsRv0P/ZeJxyTKaYtkJlNlF7dcX767gA/TvEQQqNa9n5aEOd+lXRvum7
         Yy7ktAlWEwWeaHCT02VSbtQEzIBZc58NMWMv388dOUBu5WHzs+REF6t65kW849DVZsWO
         xRudRUPW2uTys3nT4SHheP+DzE5NuwSQqSsogtNBT6t1THv0J9I5KVsZZLajiwprbck/
         dEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=shxNV9joemK5imu4wT4+Id91nCPY01JMn0lJabYidsY=;
        b=kIR2ldiTGTJesMPLh0onwX2pme+DEx/CVyY7m79r2ZTYPlXn4508GVE6KpDPhza4DD
         pPxwCTtXRcFN1UqCbJFIq8p3zxhWa3pLwDCDeN3X856zVtgzgHB9ns4aBKGkRC39FKvY
         MLL4+SxGutTJKORWvFoIKjSkUSruvDLjWyKQAkbp7jm5d4mi+dhewsDbKMo9heBFQ2Ob
         /FGby+yNE8+7XZtSP/TTrocgm5SoMNbSly21ccNiPfujko5jloxVS+m36p7/rBSUTxF3
         IA5Daxxhc98CKbKAqmm6hLmL5EJf1NtZpcLwOBuKOGfkHWI1CxtbWFbW7jTntt/S6k43
         03GQ==
X-Gm-Message-State: AJIora87Yny0IrU7wMcQW5t6rmR8oGdMu+kNp1DffkVeFMTX9w+SDeLs
	V6tZKxUolAib6qB0cNmpY7O+IeAQ6p4Cbg==
X-Google-Smtp-Source: AGRyM1tToApNxORVJ+5ePOsc4RwRSTArOU6bp+WD5v34DnOee+CQ52yyGCpFW054KCZ6s5dnBIPCjA==
X-Received: by 2002:a17:907:3fa8:b0:72b:5895:f54f with SMTP id hr40-20020a1709073fa800b0072b5895f54fmr31647848ejc.464.1658252596053;
        Tue, 19 Jul 2022 10:43:16 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V7 06/11] vpci/header: program p2m with guest BAR view
Date: Tue, 19 Jul 2022 20:42:48 +0300
Message-Id: <20220719174253.541965-7-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Take into account guest's BAR view and program its p2m accordingly:
gfn is guest's view of the BAR and mfn is the physical BAR value as set
up by the PCI bus driver in the hardware domain.
This way hardware domain sees physical BAR values and guest sees
emulated ones.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v5:
- remove debug print in map_range callback
- remove "identity" from the debug print
Since v4:
- moved start_{gfn|mfn} calculation into map_range
- pass vpci_bar in the map_data instead of start_{gfn|mfn}
- s/guest_addr/guest_reg
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
 xen/drivers/vpci/header.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f14ff11882..4e6547a54d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -30,6 +30,7 @@
 
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
 
@@ -41,8 +42,21 @@ static int cf_check map_range(
 
     for ( ; ; )
     {
+        /* Start address of the BAR as seen by the guest. */
+        gfn_t start_gfn = _gfn(PFN_DOWN(is_hardware_domain(map->d)
+                                        ? map->bar->addr
+                                        : map->bar->guest_reg));
+        /* Physical start address of the BAR. */
+        mfn_t start_mfn = _mfn(PFN_DOWN(map->bar->addr));
         unsigned long size = e - s + 1;
 
+        /*
+         * Ranges to be mapped don't always start at the BAR start address, as
+         * there can be holes or partially consumed ranges. Account for the
+         * offset of the current address from the BAR start.
+         */
+        start_gfn = gfn_add(start_gfn, s - mfn_x(start_mfn));
+
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be passed
@@ -52,8 +66,8 @@ static int cf_check map_range(
          * - {un}map_mmio_regions doesn't support preemption.
          */
 
-        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
+        rc = map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s))
+                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s));
         if ( rc == 0 )
         {
             *c += size;
@@ -62,8 +76,8 @@ static int cf_check map_range(
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
-                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
-                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
+                   "Failed to %smap [%lx, %lx] for %pd: %d\n",
+                   map->map ? "" : "un", s, e, map->d, rc);
             break;
         }
         ASSERT(rc < size);
@@ -155,6 +169,7 @@ bool vpci_process_pending(struct vcpu *v)
             if ( rangeset_is_empty(bar->mem) )
                 continue;
 
+            data.bar = bar;
             rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
             if ( rc == -ERESTART )
@@ -218,6 +233,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         if ( rangeset_is_empty(bar->mem) )
             continue;
 
+        data.bar = bar;
         while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) == -ERESTART )
         {
-- 
2.25.1


