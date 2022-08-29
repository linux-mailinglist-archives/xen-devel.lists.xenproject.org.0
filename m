Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC65A4FFC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 17:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394622.634096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSgUY-0002Ol-Sq; Mon, 29 Aug 2022 15:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394622.634096; Mon, 29 Aug 2022 15:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSgUY-0002MD-QA; Mon, 29 Aug 2022 15:15:58 +0000
Received: by outflank-mailman (input) for mailman id 394622;
 Mon, 29 Aug 2022 15:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCJO=ZB=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oSgUX-0002M7-Gh
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 15:15:57 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a473f9c-27ad-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 17:15:56 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id y18so6348605qtv.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Aug 2022 08:15:55 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:595c:561f:be80:7773])
 by smtp.gmail.com with ESMTPSA id
 cj16-20020a05622a259000b0031eb5648b86sm5311538qtb.41.2022.08.29.08.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 08:15:54 -0700 (PDT)
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
X-Inumbo-ID: 7a473f9c-27ad-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=jJgRGDMh5QqrocPxkJGdQzX2cJb3bE82S/H7CAscWyE=;
        b=k7DtU3GaV0f7P+6hGWWYs3Z/qp9vFv2K7yaiwtBdLiIyz40bh2F3jUrfz2Px+pzlZm
         05zlDg073iABfahwL2FeExviGpDqwNyfUojWuMae/qG0JApCWmJWcQIxaVcS5a7Cd0HE
         YrU6qoEZwtFmEfrSPl4wknWqOM38BsdqshsxL8+/AD5i3OMqPlKltgWjvZmjz8/d9FHN
         F5kciKOhTs2lglrn8bmu48kC7O8yHu2T7Pgi/PYKllLnbnOddi4/FdnoYS/E7EgbnkRN
         9/zE/kU5HKGaCkLGtU4/Zg55EvdFki+s6xKRnW/aRE/T4Po65e3o9cvazKcTNCyExpCI
         C+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=jJgRGDMh5QqrocPxkJGdQzX2cJb3bE82S/H7CAscWyE=;
        b=TanwqCyh/z3gO4fLSZ1xaVRH+XxHGUaaMQz1R2ErBqqGocyF8mTWAe45K0wNeE0b3V
         mPKnn8kW+kp0zUeVYLEZKDVDF4+1yI01f/BD73dba5wQCQUgeYiSXHIWkbp4JG/VyuJw
         NTCbHVCSzN0XlXv65Tc01vqlmV/3ygvFIsab/5Yx8+gWO5cug6Q7OBt1qL9ZYKYQsBVD
         spJyon4sHMzAC8AglCuGNNeKB7c3jul1+LPbFKA5qEiU4gwaXiIn8Ems7xBcGLYayWbm
         AH/EOzkrLqeDTkTu8sThX9IeBZ9xcQ+e4B86uC5SkhsZOKyGGAhP3P8X6v6QbbKatmq/
         3WTQ==
X-Gm-Message-State: ACgBeo3mS47WLRuFm2LTtk09JqoXhGR3JNjg5vpLB+sGIGlEqBqbG8pS
	c92fiR+afknR3XnPaU9aZGc=
X-Google-Smtp-Source: AA6agR4uUb8CMyq5Bx/fpRKDFzFFMYkWQIA3n27IOCUea2JWTE8P4OR/N3IO21wCYyByrhhA2ma0XA==
X-Received: by 2002:a05:622a:589:b0:342:fd8c:9786 with SMTP id c9-20020a05622a058900b00342fd8c9786mr10644133qtb.150.1661786154759;
        Mon, 29 Aug 2022 08:15:54 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen-pcifront: Handle missed Connected state
Date: Mon, 29 Aug 2022 11:15:36 -0400
Message-Id: <20220829151536.8578-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An HVM guest with linux stubdom and 2 PCI devices failed to start as
libxl timed out waiting for the PCI devices to be added.  It happens
intermittently but with some regularity.  libxl wrote the two xenstore
entries for the devices, but then timed out waiting for backend state 4
(Connected) - the state stayed at 7 (Reconfiguring).  (PCI passthrough
to an HVM with stubdomain is PV passthrough to the stubdomain and then
HVM passthrough with the QEMU inside the stubdomain.)

The stubdom kernel never printed "pcifront pci-0: Installing PCI
frontend", so it seems to have missed state 4 which would have
called pcifront_try_connect -> pcifront_connect_and_init_dma

Have pcifront_detach_devices special-case state Initialised and call
pcifront_connect_and_init_dma.  Don't use pcifront_try_connect because
that sets the xenbus state which may throw off the backend.  After
connecting, skip the remainder of detach_devices since none have been
initialized yet.  When the backend switches to Reconfigured,
pcifront_attach_devices will pick them up again.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 drivers/pci/xen-pcifront.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -1012,13 +1012,26 @@ static int pcifront_detach_devices(struc
 {
 	int err = 0;
 	int i, num_devs;
+	enum xenbus_state state;
 	unsigned int domain, bus, slot, func;
 	struct pci_dev *pci_dev;
 	char str[64];
 
-	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
-	    XenbusStateConnected)
+	state = xenbus_read_driver_state(pdev->xdev->nodename);
+	if (state == XenbusStateInitialised) {
+		dev_dbg(&pdev->xdev->dev, "Handle skipped connect.\n");
+		/* We missed Connected and need to initialize. */
+		err = pcifront_connect_and_init_dma(pdev);
+		if (err && err != -EEXIST) {
+			xenbus_dev_fatal(pdev->xdev, err,
+					 "Error setting up PCI Frontend");
+			goto out;
+		}
+
+		goto out_switch_state;
+	} else if (state != XenbusStateConnected) {
 		goto out;
+	}
 
 	err = xenbus_scanf(XBT_NIL, pdev->xdev->otherend, "num_devs", "%d",
 			   &num_devs);
@@ -1079,6 +1092,7 @@ static int pcifront_detach_devices(struc
 			domain, bus, slot, func);
 	}
 
+ out_switch_state:
 	err = xenbus_switch_state(pdev->xdev, XenbusStateReconfiguring);
 
 out:

