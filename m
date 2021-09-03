Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337E3FFC17
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177848.323613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eV-0000xw-JR; Fri, 03 Sep 2021 08:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177848.323613; Fri, 03 Sep 2021 08:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eV-0000ue-Er; Fri, 03 Sep 2021 08:34:23 +0000
Received: by outflank-mailman (input) for mailman id 177848;
 Fri, 03 Sep 2021 08:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4eT-0006kQ-DN
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:21 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdf50016-d48a-46db-8d04-c3242be972e1;
 Fri, 03 Sep 2021 08:33:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id n11so6903634edv.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:57 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:55 -0700 (PDT)
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
X-Inumbo-ID: fdf50016-d48a-46db-8d04-c3242be972e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/iiGZOLolgjA2ZPldrvDxiQ5Z5+rXkMHlrxZBGQ1V6g=;
        b=Thp1SViWRIliiAx3L7i8dGQs8jHSK15JDP1ZAcNVhPgnWdIyDDHzN7LnytjXMbIJGT
         2aj1NBBC9Fu1xWxM0uHHq4g2BnsU8a/mnvbjF5ljWBOSqkyfveqsDXi0U8D5UwEzaL+c
         CEj7XN/MJOAGR2zNbfqHuzkpEq2avwghGsdsSVSbRe7N2V4EIwDJsbOWGfI6CSgqlxeb
         mcHWEL6UK8lF5q/wFWsS0s5Kq9z5yV8KKrpO5t0pufBbczyE4q+Gw2WE96KobfzMF2BS
         lSpWrUci/mFJPcibc3S1lKaxt7Y7SV2Q08CoJNTxpxXB2eDudckd2zo5dQ76y5qmNNa2
         YJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/iiGZOLolgjA2ZPldrvDxiQ5Z5+rXkMHlrxZBGQ1V6g=;
        b=aTKcGwa9+82WQZhK8PxotLTJGD5bJdp/YKJmn6ttLaDFvAPQ/W5PuhrCI5PrXDMD9c
         4MLYRzzcs6/2CtCYVWVtTeMNUq2pnVeTRVi01/tbXVAc6n+PITQR3H9fwvCDdq/pwqnU
         zRJ8q8FTFzxCVmOtKWN3k1GjYVOrOLW6g208FTYnkvjkv1yqaUyFASmtc92slpNrU3S6
         GU7DqzvchSdfAyNy3MyRIxHEj9gUPJ0DCpICkXlpNF75piWYIFbTR2G46ec+mZSIURMt
         zAyOd75zuNEiBDd+ph5429G34WkCIVVl9+/GnDIHUEKD6JAXkvIXbgIqY/W4hhpBGwTF
         kijA==
X-Gm-Message-State: AOAM533j4pWEUlFIHjIEKFwB35po1xJXQZA9VKe1K4XrNP96LOZI5fuN
	CGi8JjQjg0mRC9nYjKJr3bgCpCoxHag=
X-Google-Smtp-Source: ABdhPJy4fYHKLqSsXdIUKB/e5T2+22yYDBhCrp7iQB/x8B/pbhcNDDdtAnMUCrCtYVr2mtO64vRMIA==
X-Received: by 2002:aa7:c94c:: with SMTP id h12mr2776075edt.378.1630658036325;
        Fri, 03 Sep 2021 01:33:56 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [PATCH 06/11] xen/domain: Call pci_release_devices() when releasing domain resources
Date: Fri,  3 Sep 2021 11:33:42 +0300
Message-Id: <20210903083347.131786-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is the very same what we do for DT devices. What is more
that x86 already calls pci_release_devices().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/arm/domain.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index d99c653626e4..4e40c4098280 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -985,7 +985,8 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
  * function which may return -ERESTART.
  */
 enum {
-    PROG_tee = 1,
+    PROG_pci = 1,
+    PROG_tee,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1022,6 +1023,12 @@ int domain_relinquish_resources(struct domain *d)
 #ifdef CONFIG_IOREQ_SERVER
         ioreq_server_destroy_all(d);
 #endif
+#ifdef CONFIG_HAS_PCI
+    PROGRESS(pci):
+        ret = pci_release_devices(d);
+        if ( ret )
+            return ret;
+#endif
 
     PROGRESS(tee):
         ret = tee_relinquish_resources(d);
-- 
2.25.1


