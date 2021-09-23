Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E5B415EFA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194122.345846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOHe-0001h8-0N; Thu, 23 Sep 2021 12:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194122.345846; Thu, 23 Sep 2021 12:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOHd-0001es-TB; Thu, 23 Sep 2021 12:57:01 +0000
Received: by outflank-mailman (input) for mailman id 194122;
 Thu, 23 Sep 2021 12:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOHV-0004it-6j
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:56:53 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5945c790-8869-4b99-afdc-a6c7733b4bcc;
 Thu, 23 Sep 2021 12:55:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z24so26712439lfu.13
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:13 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:11 -0700 (PDT)
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
X-Inumbo-ID: 5945c790-8869-4b99-afdc-a6c7733b4bcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/VZhQBHA/qWsZnQaFLYfN7XFH1H4UA39toP1GBs37TM=;
        b=P8Hj9IuBQQDngliolaPP7ZmvBgMYQvbZ3Apn/ouQ8J5yPra/sFgxauc0LD/tzbp8wo
         rQVHv5c8j9RWxG5p+ChF6f6tuID8Q5zvstZjZXEgtkX07RIVDTs+GA7+lz++OaiMcLhi
         IFjpzJZaoO3dkvtRJMTIhAmVdMP2OA+9A/SwKLgTT56y7vVw7+JpwsebBeCIWEfcb1hD
         M/puTGIUrPojnOjh1Pv8I8JEqW926nKjvKg3bpiEvoid8ZqJ+/nD/+SNZGC+xtHx2zhb
         PUk7NxVks2afQC+Z3eZ0AeqP4bhyZ5n3O66dDvY+S8vQsxsiz6I0/wUTjrG+70nJjuNw
         ZCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/VZhQBHA/qWsZnQaFLYfN7XFH1H4UA39toP1GBs37TM=;
        b=JmCcsFNyCR1+yeqn4tUT48yvyQ6/eojjMBv74n7WWxb2axj3GbIw8LTWCrqQT7rBz2
         kY3IUSr0IblsBKKuvSkkxs/bpdmr7WRNt7ii9X5dS9vn1pIidADsMTZxOFp+Yq+Jb2Ja
         sC/n7WSm0ucGzH/pvs4dNZ+X5SUfG8MSZYAaboGRED3lUdW8UdHyj9PxjBWfZuOzNBK2
         9duN9CI5AgiZoU9/ZBInGoM3EnusrmEYLKVhkU6Ob8NODqkFayMmIw/4/xF4bF7Px12f
         E6wcacS3lwvD3tBduD39I/sk8X8fp3XhBOofJFOPKQYxJQtWgXiY30/AHTtfV1RYBAcj
         +/og==
X-Gm-Message-State: AOAM533QoIhod2VbBZrkh0F8oAk/l1evunRrcJbxJTN7rjtqnVj1IhYv
	BXNJLWZea9MKEJDIEw2WWPaUhjvxW5snYw==
X-Google-Smtp-Source: ABdhPJxVZKYeKANBbtQt4yOeYPS1abKifRIc3+NhdRNVbgxW2Y/9Ry0MALLSfk/9SB4lbTL6En8Icg==
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr4093541lfg.550.1632401711887;
        Thu, 23 Sep 2021 05:55:11 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
Date: Thu, 23 Sep 2021 15:54:57 +0300
Message-Id: <20210923125501.234252-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
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
Since v1:
 - s/MSI/MSI-X in comments
---
 xen/drivers/vpci/header.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 9c603d26d302..bdd18599b205 100644
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
 
@@ -37,12 +41,28 @@ static int map_range(unsigned long s, unsigned long e, void *data,
                      unsigned long *c)
 {
     const struct map_data *map = data;
+    gfn_t start_gfn;
     int rc;
 
     for ( ; ; )
     {
         unsigned long size = e - s + 1;
 
+        /*
+         * Any BAR may have holes in its memory we want to map, e.g.
+         * we don't want to map MSI-X regions which may be a part of that BAR,
+         * e.g. when a single BAR is used for both MMIO and MSI-X.
+         * In this case MSI-X regions are subtracted from the mapping, but
+         * map->start_gfn still points to the very beginning of the BAR.
+         * So if there is a hole present then we need to adjust start_gfn
+         * to reflect the fact of that substraction.
+         */
+        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));
+
+        printk(XENLOG_G_DEBUG
+               "%smap [%lx, %lx] -> %#"PRI_gfn" for d%d\n",
+               map->map ? "" : "un", s, e, gfn_x(start_gfn),
+               map->d->domain_id);
         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be passed
@@ -52,8 +72,10 @@ static int map_range(unsigned long s, unsigned long e, void *data,
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
@@ -69,6 +91,7 @@ static int map_range(unsigned long s, unsigned long e, void *data,
         ASSERT(rc < size);
         *c += rc;
         s += rc;
+        gfn_add(map->start_gfn, rc);
         if ( general_preempt_check() )
                 return -ERESTART;
     }
@@ -149,6 +172,10 @@ bool vpci_process_pending(struct vcpu *v)
             if ( !bar->mem )
                 continue;
 
+            data.start_gfn = is_hardware_domain(v->vpci.pdev->domain) ?
+                _gfn(PFN_DOWN(bar->addr)) :
+                _gfn(PFN_DOWN(bar->guest_addr));
+            data.start_mfn = _mfn(PFN_DOWN(bar->addr));
             rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
             if ( rc == -ERESTART )
@@ -194,6 +221,10 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         if ( !bar->mem )
             continue;
 
+        data.start_gfn = is_hardware_domain(d) ?
+            _gfn(PFN_DOWN(bar->addr)) :
+            _gfn(PFN_DOWN(bar->guest_addr));
+        data.start_mfn = _mfn(PFN_DOWN(bar->addr));
         while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) == -ERESTART )
             process_pending_softirqs();
-- 
2.25.1


