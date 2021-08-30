Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3663FB94A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 17:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175178.319208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjbI-0001xG-AP; Mon, 30 Aug 2021 15:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175178.319208; Mon, 30 Aug 2021 15:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjbI-0001uN-7H; Mon, 30 Aug 2021 15:53:32 +0000
Received: by outflank-mailman (input) for mailman id 175178;
 Mon, 30 Aug 2021 15:53:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ySg/=NV=gmail.com=lonyelon@srs-us1.protection.inumbo.net>)
 id 1mKjbH-0001uH-At
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 15:53:31 +0000
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25290de2-625f-49b0-af51-b935c6ac61d5;
 Mon, 30 Aug 2021 15:53:30 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mf2so32136849ejb.9
 for <xen-devel@lists.xenproject.org>; Mon, 30 Aug 2021 08:53:30 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-37-188-60.retail.telecomitalia.it. [79.37.188.60])
 by smtp.gmail.com with ESMTPSA id o26sm6982569eje.24.2021.08.30.08.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 08:53:29 -0700 (PDT)
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
X-Inumbo-ID: 25290de2-625f-49b0-af51-b935c6ac61d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZTTwFJF+zvGHdyibVGAvdJNHkDefebmF2ya6xkkbwE=;
        b=OrrCxmJej7+ig4i1srOE7VMVkeDpS9cakUwSxm2PgKW0SKIhtk9YTr8Kjvt8STi+mf
         x9o/QFBriMovGg3TMJpTwWYB9dEC9pDYyILpbrlSivt5HNxVeG0NihF+uux9vNUA6CcC
         QZ0S4+/ZA9UjECBx3ztjhnTbWnpaTEExsr2R0oqiKJ7lW77S5S6su5QEzC1c+cR0E3pW
         gQ5y8RGdXc+Sgzzk1AJPm/5exbEEXvqBYjTTowg74polMwbz22etysgrPnX06h8reEUu
         tKM4hC7j0jxHaa44aS/cOeeKczpkmIbyvN1+SWJRwRjihDnaRjnFaXs23sL2LonBsG4T
         8zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZTTwFJF+zvGHdyibVGAvdJNHkDefebmF2ya6xkkbwE=;
        b=P2C09/MNFP6uAq0mMnHelkzHaZBvmOCeXCl9hwrptdk0J0ijIU1r46HsYQETwTsDoP
         l6ejsE+SvTBfulwK2eTmf2yoLuxGXi4Xrb1IqwtQL/Q82C/WRJsydTsFQBAOlDtGWDW0
         epZZP9649G3QQjJDS6jxBAFhg2r5lKSDpD90moFiU15sZEAAkHmuVYDn7r77gOrEXtH8
         K6q9MVbPQLoO06UMrfZ08qRaNkjUKXaKVZ+/fKIl7HCfZkHXyljF/SI0JZbMjR2fAsIl
         KKkdJX24AOaKgx2iq2oecA4lCorRHQs3Ki2K0PKoxgqHliF+tbGZRRQiOrJci1B1wcwO
         kGWQ==
X-Gm-Message-State: AOAM530PAjVCib0pH4uH3QQQIGbhvLzc9Vswq01g7TdoOzAODjJZsWRM
	J8SJNcTfijm3V4foSHNpm/Q=
X-Google-Smtp-Source: ABdhPJybPVfFJ0VfPXkN/ghxef8t28WfmUnSzRrbQ4yuUnvBgvPKJyy8F7HZBA+jg9ihxbpVb2YQCw==
X-Received: by 2002:a17:906:a044:: with SMTP id bg4mr25947563ejb.312.1630338809554;
        Mon, 30 Aug 2021 08:53:29 -0700 (PDT)
From: "=?UTF-8?q?Sergio=20Migu=C3=A9ns=20Iglesias?=" <lonyelon@gmail.com>
X-Google-Original-From: =?UTF-8?q?Sergio=20Migu=C3=A9ns=20Iglesias?= <sergio@lony.xyz>
To: konrad.wilk@oracle.com
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	bhelgaas@google.com,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Sergio=20Migu=C3=A9ns=20Iglesias?= <sergio@lony.xyz>
Subject: [PATCH v2] xen/pcifront: Removed unnecessary __ref annotation
Date: Mon, 30 Aug 2021 19:53:05 +0200
Message-Id: <20210830175305.13370-1-sergio@lony.xyz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An unnecessary "__ref" annotation was removed from the
"drivers/pci/xen_pcifront.c" file. The function where the annotation
was used was "pcifront_backend_changed()", which does not call any
functions annotated as "__*init" nor "__*exit". This makes "__ref"
unnecessary since this annotation is used to make the compiler ignore
section miss-matches when they are not happening here in the first
place.

In addition to the aforementioned change, some code style issues were
fixed in the same file.

Signed-off-by: Sergio Miguéns Iglesias <sergio@lony.xyz>
---
 drivers/pci/xen-pcifront.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index b7a8f3a1921f..427041c1e408 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -115,7 +115,7 @@ static int do_pci_op(struct pcifront_device *pdev, struct xen_pci_op *op)
 	struct xen_pci_op *active_op = &pdev->sh_info->op;
 	unsigned long irq_flags;
 	evtchn_port_t port = pdev->evtchn;
-	unsigned irq = pdev->irq;
+	unsigned int irq = pdev->irq;
 	s64 ns, ns_timeout;
 
 	spin_lock_irqsave(&pdev->sh_info_lock, irq_flags);
@@ -153,10 +153,10 @@ static int do_pci_op(struct pcifront_device *pdev, struct xen_pci_op *op)
 	}
 
 	/*
-	* We might lose backend service request since we
-	* reuse same evtchn with pci_conf backend response. So re-schedule
-	* aer pcifront service.
-	*/
+	 * We might lose backend service request since we
+	 * reuse same evtchn with pci_conf backend response. So re-schedule
+	 * aer pcifront service.
+	 */
 	if (test_bit(_XEN_PCIB_active,
 			(unsigned long *)&pdev->sh_info->flags)) {
 		dev_err(&pdev->xdev->dev,
@@ -414,7 +414,8 @@ static int pcifront_scan_bus(struct pcifront_device *pdev,
 	struct pci_dev *d;
 	unsigned int devfn;
 
-	/* Scan the bus for functions and add.
+	/*
+	 * Scan the bus for functions and add.
 	 * We omit handling of PCI bridge attachment because pciback prevents
 	 * bridges from being exported.
 	 */
@@ -492,8 +493,10 @@ static int pcifront_scan_root(struct pcifront_device *pdev,
 
 	list_add(&bus_entry->list, &pdev->root_buses);
 
-	/* pci_scan_root_bus skips devices which do not have a
-	* devfn==0. The pcifront_scan_bus enumerates all devfn. */
+	/*
+	 * pci_scan_root_bus skips devices which do not have a
+	 * devfn==0. The pcifront_scan_bus enumerates all devfn.
+	 */
 	err = pcifront_scan_bus(pdev, domain, bus, b);
 
 	/* Claim resources before going "live" with our devices */
@@ -651,8 +654,10 @@ static void pcifront_do_aer(struct work_struct *data)
 	pci_channel_state_t state =
 		(pci_channel_state_t)pdev->sh_info->aer_op.err;
 
-	/*If a pci_conf op is in progress,
-		we have to wait until it is done before service aer op*/
+	/*
+	 * If a pci_conf op is in progress, we have to wait until it is done
+	 * before service aer op
+	 */
 	dev_dbg(&pdev->xdev->dev,
 		"pcifront service aer bus %x devfn %x\n",
 		pdev->sh_info->aer_op.bus, pdev->sh_info->aer_op.devfn);
@@ -676,6 +681,7 @@ static void pcifront_do_aer(struct work_struct *data)
 static irqreturn_t pcifront_handler_aer(int irq, void *dev)
 {
 	struct pcifront_device *pdev = dev;
+
 	schedule_pcifront_aer_op(pdev);
 	return IRQ_HANDLED;
 }
@@ -1027,6 +1033,7 @@ static int pcifront_detach_devices(struct pcifront_device *pdev)
 	/* Find devices being detached and remove them. */
 	for (i = 0; i < num_devs; i++) {
 		int l, state;
+
 		l = snprintf(str, sizeof(str), "state-%d", i);
 		if (unlikely(l >= (sizeof(str) - 1))) {
 			err = -ENOMEM;
@@ -1078,7 +1085,7 @@ static int pcifront_detach_devices(struct pcifront_device *pdev)
 	return err;
 }
 
-static void __ref pcifront_backend_changed(struct xenbus_device *xdev,
+static void pcifront_backend_changed(struct xenbus_device *xdev,
 						  enum xenbus_state be_state)
 {
 	struct pcifront_device *pdev = dev_get_drvdata(&xdev->dev);
@@ -1137,6 +1144,7 @@ static int pcifront_xenbus_probe(struct xenbus_device *xdev,
 static int pcifront_xenbus_remove(struct xenbus_device *xdev)
 {
 	struct pcifront_device *pdev = dev_get_drvdata(&xdev->dev);
+
 	if (pdev)
 		free_pdev(pdev);
 
-- 
2.33.0


