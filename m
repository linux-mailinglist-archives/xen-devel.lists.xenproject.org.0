Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8673FAE5F
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 22:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174789.318623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKRCk-00035Y-6k; Sun, 29 Aug 2021 20:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174789.318623; Sun, 29 Aug 2021 20:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKRCk-00033l-33; Sun, 29 Aug 2021 20:14:58 +0000
Received: by outflank-mailman (input) for mailman id 174789;
 Sun, 29 Aug 2021 20:14:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nica=NU=gmail.com=lonyelon@srs-us1.protection.inumbo.net>)
 id 1mKRCi-00033f-Aq
 for xen-devel@lists.xenproject.org; Sun, 29 Aug 2021 20:14:56 +0000
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a17b566-ce02-429f-9a54-cea4abdf95f8;
 Sun, 29 Aug 2021 20:14:55 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g21so18458151edw.4
 for <xen-devel@lists.xenproject.org>; Sun, 29 Aug 2021 13:14:55 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-37-188-60.retail.telecomitalia.it. [79.37.188.60])
 by smtp.gmail.com with ESMTPSA id mf2sm5750149ejb.76.2021.08.29.13.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 13:14:53 -0700 (PDT)
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
X-Inumbo-ID: 6a17b566-ce02-429f-9a54-cea4abdf95f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gWowyDdx9hWadSykEaaEDUsjdIUvYH4g4UM8gIo6z+E=;
        b=WABp1Rr1vQTvX0gXWSrVXWB0xAQBJ4gU8rKE5eyabfT+C+dYM0u0W453BSE+DXwvq7
         gBNQBRWrb3QfO3JeY+fy0pt0+XpfD4fXDB4UkkGXA2Pg1bWuBrJCFeCKQbTEd826Ouky
         RVh9U0Ox1okrLiaWD4QM8qEPFz2qLFvFl4ef2MQX0TVd78GQlJK+8tlXJXthkWVXiJVa
         yF1EUBapi79W4zjhtYYo8H/aUKr59NCqTG9YajMIZwDhofMpGMZXkUnxwZenb0Bs5WQF
         V7//SLpWqspo/hc3+VLyOLN5jNqlJICzqx29rfS6KOuoB/KXwjCsSLSS4hSxMHdJYGqs
         jGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gWowyDdx9hWadSykEaaEDUsjdIUvYH4g4UM8gIo6z+E=;
        b=seiRNTXuyyyqIjFtGg7YM1BMOcd6530o0a3qg9DNpl7gAurO9T6YvE4AfhKkROOWRN
         PxVn2uhCSV31SikcAKO9v2zjwR0POIE7tBevWfUEq4sOYykvLerhB3xQ4EbIiq4pEGx/
         yDc4QlpgX6vDdCRaICC+0vjm9orHm67tHLeiuD/KPAOVg1FxaD/LrueN9G4I3Dn2oMU4
         5J9t1p55yXd33pS7F1cSdhiReOmeHc440Ax/oDEJMuLICmC0NxQBYfzgWL/Evlyrft7g
         7Y6NCUc4g5rEBprLEsXT/IaTPUUq/HMIVnD7Ln7gwefvK/gtr4u3Jb/YqK6qqolnyb0o
         C0pQ==
X-Gm-Message-State: AOAM531w+UfEiQ+KvJ7h4IB+H4vPdvBP0hT9FNkSRzKHo0hOYdnqKDND
	CVj3iDg4O8eRDRcsEPV/P5Q=
X-Google-Smtp-Source: ABdhPJz41yIvPb/YbMjwfkFtOsqUhztPX4oI1iWfCCpFeBdLPdblridSani8TW2bgMnV2wKFM5CAdA==
X-Received: by 2002:aa7:d613:: with SMTP id c19mr20499558edr.196.1630268094235;
        Sun, 29 Aug 2021 13:14:54 -0700 (PDT)
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
Subject: [PATCH] xen/pcifront: Removed unnecessary __ref annotation
Date: Mon, 30 Aug 2021 00:14:15 +0200
Message-Id: <20210829221415.647744-1-sergio@lony.xyz>
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
 drivers/pci/xen-pcifront.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index b7a8f3a1921f..f06661704f3a 100644
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
@@ -152,11 +152,10 @@ static int do_pci_op(struct pcifront_device *pdev, struct xen_pci_op *op)
 		}
 	}
 
-	/*
-	* We might lose backend service request since we
-	* reuse same evtchn with pci_conf backend response. So re-schedule
-	* aer pcifront service.
-	*/
+	/* We might lose backend service request since we
+	 * reuse same evtchn with pci_conf backend response. So re-schedule
+	 * aer pcifront service.
+	 */
 	if (test_bit(_XEN_PCIB_active,
 			(unsigned long *)&pdev->sh_info->flags)) {
 		dev_err(&pdev->xdev->dev,
@@ -493,7 +492,8 @@ static int pcifront_scan_root(struct pcifront_device *pdev,
 	list_add(&bus_entry->list, &pdev->root_buses);
 
 	/* pci_scan_root_bus skips devices which do not have a
-	* devfn==0. The pcifront_scan_bus enumerates all devfn. */
+	 * devfn==0. The pcifront_scan_bus enumerates all devfn.
+	 */
 	err = pcifront_scan_bus(pdev, domain, bus, b);
 
 	/* Claim resources before going "live" with our devices */
@@ -651,8 +651,9 @@ static void pcifront_do_aer(struct work_struct *data)
 	pci_channel_state_t state =
 		(pci_channel_state_t)pdev->sh_info->aer_op.err;
 
-	/*If a pci_conf op is in progress,
-		we have to wait until it is done before service aer op*/
+	/* If a pci_conf op is in progress, we have to wait until it is done
+	 * before service aer op
+	 */
 	dev_dbg(&pdev->xdev->dev,
 		"pcifront service aer bus %x devfn %x\n",
 		pdev->sh_info->aer_op.bus, pdev->sh_info->aer_op.devfn);
@@ -676,6 +677,7 @@ static void pcifront_do_aer(struct work_struct *data)
 static irqreturn_t pcifront_handler_aer(int irq, void *dev)
 {
 	struct pcifront_device *pdev = dev;
+
 	schedule_pcifront_aer_op(pdev);
 	return IRQ_HANDLED;
 }
@@ -1027,6 +1029,7 @@ static int pcifront_detach_devices(struct pcifront_device *pdev)
 	/* Find devices being detached and remove them. */
 	for (i = 0; i < num_devs; i++) {
 		int l, state;
+
 		l = snprintf(str, sizeof(str), "state-%d", i);
 		if (unlikely(l >= (sizeof(str) - 1))) {
 			err = -ENOMEM;
@@ -1078,7 +1081,7 @@ static int pcifront_detach_devices(struct pcifront_device *pdev)
 	return err;
 }
 
-static void __ref pcifront_backend_changed(struct xenbus_device *xdev,
+static void pcifront_backend_changed(struct xenbus_device *xdev,
 						  enum xenbus_state be_state)
 {
 	struct pcifront_device *pdev = dev_get_drvdata(&xdev->dev);
@@ -1137,6 +1140,7 @@ static int pcifront_xenbus_probe(struct xenbus_device *xdev,
 static int pcifront_xenbus_remove(struct xenbus_device *xdev)
 {
 	struct pcifront_device *pdev = dev_get_drvdata(&xdev->dev);
+
 	if (pdev)
 		free_pdev(pdev);
 
-- 
2.33.0


