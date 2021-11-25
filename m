Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D648045D8B1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230882.399205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWz-0003xF-9f; Thu, 25 Nov 2021 11:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230882.399205; Thu, 25 Nov 2021 11:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWy-0003t2-SJ; Thu, 25 Nov 2021 11:03:08 +0000
Received: by outflank-mailman (input) for mailman id 230882;
 Thu, 25 Nov 2021 11:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWw-0001K8-9Z
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:06 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43a627ac-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:03:05 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id l22so15333068lfg.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:05 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:03 -0800 (PST)
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
X-Inumbo-ID: 43a627ac-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k/RGv6ybx7YyFsmgyX3yYGViHePRS8H6axFbMKtL+NM=;
        b=NH67NlrIH5Ybk480ToPEOvLqg5URZvwh/QGlPI8eMNf57TsY3odxpYlTb88dfC5rc1
         vtZGDVob6WzDb0yGJTMiQrB86sIkeC12pSc6OK9Gd9xzPhiVpvMFbbIqsJ7VyMQ8gYN3
         RtMpDxzQuLpy5AqSFpYcTG9dGF2a7Xh0kKnsG9e0CgtskzJ57voB431EW4ImqgJ+p3xF
         5ZxQNO9gEJV/hQpLwRYdfKDtsTcuyqxf4KnRxosTYQ+LG99subpv2MiB2w61JB+DCh7Z
         Tt4g8QTzy5AXgiYsTFuqRned8Q9sFtdiHhe4J0Wz9buf3/8htcNr27kif7q0o2uZoCNy
         RR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k/RGv6ybx7YyFsmgyX3yYGViHePRS8H6axFbMKtL+NM=;
        b=ickXIXci+3txfz1fCi7MIcVoCF51Ov1CQVUIPpn5KwwhIkOUJtsfsB9yZRgDS8isoQ
         Z09bNPZiwC93Wg+5hx/yT9rDNZP+3pzr20EnaPdLGyHUtjO3ZWmdVKCzHtn+Q5J5vElt
         RUpbCtiY7NUJvV6mY41w6xu53WIGOH/pjWDZD674V3rBy107XyZSLaT2PKPoCTCFVr4U
         Zr/xuIKfQZugNiCNrybGt/R6XP3xa42n88eWZmGSyl8lm7BNgF7/nO2jhxFfhbo2FMRs
         6IOKdRVKVr5vzoMQdS/UVz0V3hfWRJCwMIb30jnD6vn65cqZ/rNlLRC2QIRTEJ2lh67q
         9N4A==
X-Gm-Message-State: AOAM530z60LGIJEmRWhROXr26HB4n2kWrMxCzx89+JsCcQqRy0kA1GAr
	XylYuZ2IF8IH8HbV0+fMVLMTbCLDZ8d9dA==
X-Google-Smtp-Source: ABdhPJx/6zGeavqUGNS7ApB3Y8UGu0V+f7KGhetYpG+N9ZJazQ9xzusOsoLlz7Ch+XQYRoT1COfbFQ==
X-Received: by 2002:a05:6512:3212:: with SMTP id d18mr22988968lfe.285.1637838184244;
        Thu, 25 Nov 2021 03:03:04 -0800 (PST)
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
Subject: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Date: Thu, 25 Nov 2021 13:02:45 +0200
Message-Id: <20211125110251.2877218-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
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
---
 xen/drivers/vpci/header.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index cc49aa68886f..b0499d32c5d8 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -30,6 +30,7 @@
 
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
 
@@ -41,8 +42,25 @@ static int map_range(unsigned long s, unsigned long e, void *data,
 
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
+        gdprintk(XENLOG_G_DEBUG,
+                 "%smap [%lx, %lx] -> %#"PRI_gfn" for %pd\n",
+                 map->map ? "" : "un", s, e, gfn_x(start_gfn),
+                 map->d);
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be passed
@@ -52,8 +70,10 @@ static int map_range(unsigned long s, unsigned long e, void *data,
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
@@ -62,8 +82,8 @@ static int map_range(unsigned long s, unsigned long e, void *data,
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
@@ -160,6 +180,7 @@ bool vpci_process_pending(struct vcpu *v)
             if ( rangeset_is_empty(bar->mem) )
                 continue;
 
+            data.bar = bar;
             rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
             if ( rc == -ERESTART )
@@ -249,6 +270,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         if ( rangeset_is_empty(bar->mem) )
             continue;
 
+        data.bar = bar;
         while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) == -ERESTART )
             process_pending_softirqs();
-- 
2.25.1


