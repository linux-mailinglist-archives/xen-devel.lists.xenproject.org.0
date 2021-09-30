Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A641D4D3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199515.353683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsK-0004oJ-8B; Thu, 30 Sep 2021 07:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199515.353683; Thu, 30 Sep 2021 07:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsK-0004kB-1j; Thu, 30 Sep 2021 07:53:04 +0000
Received: by outflank-mailman (input) for mailman id 199515;
 Thu, 30 Sep 2021 07:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqsI-00017f-5o
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:53:02 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1af39ec-0bab-4c47-980f-847a81a9d1a4;
 Thu, 30 Sep 2021 07:52:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u18so21641295lfd.12
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:33 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:31 -0700 (PDT)
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
X-Inumbo-ID: e1af39ec-0bab-4c47-980f-847a81a9d1a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R0Ou982lM6u92fk8c4IDhUUqsj1bOg2PvsoDj71PTZg=;
        b=HsfB4Yy6HLz+R+wFcmkgwTUbBCHnW6SkBpWvFqaBK2rAHPBJrw+xeCSH9432+DJZo9
         5ve06kx9L3dX7UtDZKq9DA3nlIi+bE14CIY97SbUeqz6i03Z+ohPE3k/beNTmLdolK/A
         oPfJd7wVYViAm5aNhgGsL+P2IVLL4FnXl0D3CFUcwIdOU/c3OfZiSxwE4Qmq4Hw18HUC
         U1GbiFMFKmbGs5jrbj/BMKDR61jpPpfjdkPLZdwyU7R+bsxohUhkL+RQDuKKgMlhHzVz
         hY3NPrrGoFrgkWyUzztwtk2tTgCkuWp9zS/RmsNONtd1nRCdlfWBLfkk1sXdN3z2Ocjj
         AnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R0Ou982lM6u92fk8c4IDhUUqsj1bOg2PvsoDj71PTZg=;
        b=LHSMg9E1DeReWQlODAsw4mEQRzO7Fchdkl89r8vF45fbHB7q7xCFfl2yZW5EjyNbN/
         mUSOYdvK7tdqgT2VSY/T2OynokkR7/hFmItJUXWE/uFOq/hDL9kd82UkVtj0jE+tpDkQ
         EsHFaf5fuQaH70CjyWLyUeEwArhNQwgXfT+xxtn5VGmZ9pedIdyfulFa/gE+m+e8M4aS
         E3RWgqekfnkzpjtjaAy2s/GqvnhqgmCSjEpOLrx8JvF0qO3XUs1njEvh8/518hlpsDRA
         +ujBFrO80/76xcBSsfHAdlQrXzhOGDy5nPpqsBvz8B9MwnEfBtnBaIniSPmvjtROQDgJ
         alWg==
X-Gm-Message-State: AOAM531nOLfC8j/QX3xh8988aPlJc3GnU51fMVFqj8qutyyOUJyDmHJR
	5JOAfKKZmuycx4nqSbHmNi8y089ZvTs=
X-Google-Smtp-Source: ABdhPJwNTxH3rY7fVFK+T2n7C8LTqtOBuO5NPVO/Zedb0cpTLVSylMe3TUoK8Zrs6YggTeOiaDSe7Q==
X-Received: by 2002:ac2:4c81:: with SMTP id d1mr4566179lfl.340.1632988352180;
        Thu, 30 Sep 2021 00:52:32 -0700 (PDT)
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
Subject: [PATCH v3 07/11] vpci/header: program p2m with guest BAR view
Date: Thu, 30 Sep 2021 10:52:19 +0300
Message-Id: <20210930075223.860329-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
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
Since v2:
- improve readability for data.start_gfn and restructure ?: construct
Since v1:
 - s/MSI/MSI-X in comments
---
 xen/drivers/vpci/header.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 9c603d26d302..f23c956cde6c 100644
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
 
+            data.start_gfn =
+                 _gfn(PFN_DOWN(is_hardware_domain(v->vpci.pdev->domain)
+                               ? bar->addr : bar->guest_addr));
+            data.start_mfn = _mfn(PFN_DOWN(bar->addr));
             rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
             if ( rc == -ERESTART )
@@ -194,6 +221,9 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         if ( !bar->mem )
             continue;
 
+        data.start_gfn = _gfn(PFN_DOWN(is_hardware_domain(d)
+                                       ? bar->addr : bar->guest_addr));
+        data.start_mfn = _mfn(PFN_DOWN(bar->addr));
         while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) == -ERESTART )
             process_pending_softirqs();
-- 
2.25.1


