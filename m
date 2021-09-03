Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C43FFDFB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177986.323856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM68G-0007OB-CP; Fri, 03 Sep 2021 10:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177986.323856; Fri, 03 Sep 2021 10:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM68G-0007K7-6l; Fri, 03 Sep 2021 10:09:12 +0000
Received: by outflank-mailman (input) for mailman id 177986;
 Fri, 03 Sep 2021 10:09:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM68F-0004Cr-Ae
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:09:11 +0000
Received: from mail-ej1-x635.google.com (unknown [2a00:1450:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 574bafea-333f-4458-a85f-9d85f3dc68ab;
 Fri, 03 Sep 2021 10:08:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id a25so11014222ejv.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:43 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:41 -0700 (PDT)
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
X-Inumbo-ID: 574bafea-333f-4458-a85f-9d85f3dc68ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EsmmWshqcRWEmqQF2VjxxyMLQRhse2D1gTlLi8+uzDk=;
        b=kYdmRslCs8NTALbXGc7+QzrWmSxEXO8+BDs+NVl9JKDEti73SNG8Bxa30Qe1HIM2o/
         XlN/YA1k2fkV4slRcmp6oFpn1xBHxhY1jlkZ1Y/5EYq9OhYgZ58xAhwDlgV61QuuCjyy
         UZii3Li6tECiunnl+jSszF+5X1YlnUZ9HhEU5Y2gyKLjYGcWaXw8AL7xRlLjh8K9LC+M
         +4maoZpwsGzHA2FVcxyn/f9WCz+4CdQ3r6f4kt8mNoAuN+GCdEjFEkFTERnznC8Yl17X
         LuJl09dTX5S6Z5iWPREoG5DbkdNx09ZLnW0hEfhE+vSTnWXUawIhyV5Rq8wX2xSQGD2o
         HtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EsmmWshqcRWEmqQF2VjxxyMLQRhse2D1gTlLi8+uzDk=;
        b=co2MPdxS2NYgbewPN0EUl+L5yydIua2nKlB3+oeYgTGZ0zPlgzdo1D56PN5tcyFvKJ
         4vQHsr+e07uCJbEdCSGdtklVDouMTgTQdtdaYKPMBm3Zs+ScDOdognLMaFA+ASCCXylm
         TDll1E0DA0d4uH/K2f2ukCOmRNuR3TqlWHvowtNnngrGDANJ08NgjB1HOtpianM6R7XH
         xC2TrdoRkqloWnkxhmZl/ZTkaOY4WBWv40FlvE856y14PP0EDn1EyRNJI89itn6xiasQ
         pu+nMJUwSicPHDF0/5sHMtnmX3CQAVlJGz7/dVbGjBF/F6xPGUbelDowCcNNgTXRByq6
         vXmg==
X-Gm-Message-State: AOAM532pMRFyhTXXnLPAfz6ZVLbUkWDOV8kD/yEfGcqduJjOczZzFvcV
	3kseNt3Fkh0dv4TZJ+euQ82rhIJlYDA=
X-Google-Smtp-Source: ABdhPJx8SGIw/Qab2uy5z2TUM5bpuiWzlOzdu1ih68KEF3FIN3G+q7L3S9fsjy63kr+jyeFlOUjLhQ==
X-Received: by 2002:a17:907:96a2:: with SMTP id hd34mr3270175ejc.113.1630663721926;
        Fri, 03 Sep 2021 03:08:41 -0700 (PDT)
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
Subject: [PATCH 7/9] vpci/header: program p2m with guest BAR view
Date: Fri,  3 Sep 2021 13:08:29 +0300
Message-Id: <20210903100831.177748-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903100831.177748-1-andr2000@gmail.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
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
 xen/drivers/vpci/header.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 7f54199a3894..7416ef1e1e06 100644
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
+         * we don't want to map MSI regions which may be a part of that BAR,
+         * e.g. when a single BAR is used for both MMIO and MSI.
+         * In this case MSI regions are subtracted from the mapping, but
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


