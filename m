Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF974A9408
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265011.458350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBe-000231-Ju; Fri, 04 Feb 2022 06:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265011.458350; Fri, 04 Feb 2022 06:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBe-0001vu-8Z; Fri, 04 Feb 2022 06:35:14 +0000
Received: by outflank-mailman (input) for mailman id 265011;
 Fri, 04 Feb 2022 06:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBb-0008DX-OD
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:11 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ffe2d3-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:10 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id q22so7161844ljh.7
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:10 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:09 -0800 (PST)
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
X-Inumbo-ID: 99ffe2d3-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qtkK/j8pu6kupq3RbAcpqc3jfOmxqW4/nLCIHyxmPhw=;
        b=LcavmegIjsn1jtf8L7reZvcGqNqvIimlLW1FC6Ke96AWMS6A1lu/GmYLd/9I1A7eOw
         jPIME4KoFaZrtnuk6in1pPcQT5stbkymritBMZsl10FZgWzoZTCXcMxagp84DfsZihPO
         RGHQ6aJu9q5yYUUc8Qwq1qITZw9XC9KqwLeO0nqJU9/MdYb4p4qLnWVVbCeoOb9I/hII
         Vg3reIRVkq4BiSLDhBh/LZekJM9WKWvbbrreZwgvowYHpG5iDUpcB4hlJHFtciVWbF+k
         cSiUsa8gnlvcsBaOxRu//oTbG897/xj+hDT9fih5k9WgdSxNR6SZxcByWKamdK0yQ+MJ
         ZKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtkK/j8pu6kupq3RbAcpqc3jfOmxqW4/nLCIHyxmPhw=;
        b=krTo55hg/qcIHx41WTWoZt7hP9NsAKZMFtlrsVKMnuntoAJt/SBKh89r7BXIwGnspl
         ej1QcDRJWTZ4Ka7ySxPSMMJ7b7KcsTnOWu19Lz3mTgEDrRYV7alJyDFd7f0YDTEg/SdK
         IyyMdhX0McVPh2rCDvwwMcd6zGwRjjn52jo/DT4vDxz2m23xHwVm1dbw2iGoX4JqUijR
         oP3qF/FTnHncgFxpkSFm6CLPJhdP+dZCEYB02tvvckYTitkplsL1XLCBfdj6KjozDuVH
         aATIxqQK71FLpYs0v50KNtj0HRslrF7OtL7pZxeKyIHRABMz18f/yZdHzrokNzESG+Pj
         F/Rg==
X-Gm-Message-State: AOAM5315kovfUAmtwPGswe5OzrrnAydL11URkgEWGXeEBOCS0yH4Q3ED
	eafc/+FSPEZ4bfCHvN84WyzRN+XyiZ0=
X-Google-Smtp-Source: ABdhPJxTXPZEdj2jvQlmavhyN/FVUW2Ujue3KbH3gBqvpnm6iioAFpcnFab7qHHhSkjZUArvQ7YeEw==
X-Received: by 2002:a2e:a607:: with SMTP id v7mr936685ljp.248.1643956510257;
        Thu, 03 Feb 2022 22:35:10 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 08/13] vpci/header: program p2m with guest BAR view
Date: Fri,  4 Feb 2022 08:34:54 +0200
Message-Id: <20220204063459.680961-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
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
index 0c94504b87d8..88ca1ad8211d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -30,6 +30,7 @@
 
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
 
@@ -41,8 +42,21 @@ static int map_range(unsigned long s, unsigned long e, void *data,
 
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
@@ -52,8 +66,8 @@ static int map_range(unsigned long s, unsigned long e, void *data,
          * - {un}map_mmio_regions doesn't support preemption.
          */
 
-        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
+        rc = map->map ? map_mmio_regions(map->d, start_gfn, size, _mfn(s))
+                      : unmap_mmio_regions(map->d, start_gfn, size, _mfn(s));
         if ( rc == 0 )
         {
             *c += size;
@@ -62,8 +76,8 @@ static int map_range(unsigned long s, unsigned long e, void *data,
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
@@ -154,6 +168,7 @@ bool vpci_process_pending(struct vcpu *v)
             if ( rangeset_is_empty(bar->mem) )
                 continue;
 
+            data.bar = bar;
             rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
             if ( rc == -ERESTART )
@@ -206,6 +221,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         if ( rangeset_is_empty(bar->mem) )
             continue;
 
+        data.bar = bar;
         while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) == -ERESTART )
             process_pending_softirqs();
-- 
2.25.1


