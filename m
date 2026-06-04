Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kvluFPeUIWpVJQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016FD6413E4
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="a/9weNht";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328018.1592692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gA-00053L-SM; Thu, 04 Jun 2026 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328018.1592692; Thu, 04 Jun 2026 15:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gA-0004z2-OK; Thu, 04 Jun 2026 15:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1328018;
 Thu, 04 Jun 2026 15:02:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9a4-000436-S0
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9a4-00ALZ2-8f
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219365-bab6-0a2a0a5309dd-0a2a4505a566-12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:00 +0200
Received: from [209.85.214.180] (helo=mail-pl1-f180.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219366-aaa8-0a2a45050019-d155d6b4dd9e-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:01:59 +0200
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2c0c2d792c8so6017765ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:01:59 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff::]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16629d40asm57714915ad.64.2026.06.04.08.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:01:57 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585318; x=1781190118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P+ek6ocV5HFyMB6++Nc5HRt5X7Za6z5O1aRcqqwv/w=;
        b=a/9weNhtqAutJYRA1AzyWuD1LJNdfYLP2LniIkAG8SOCBrEQPsEJ3+6ZF/jam3HN0y
         +/VYqVrSqPtEKxTm+xT31keqjgS5HpFpBx0H//lzo4yhX6oBmvg/5aKpjidUWNG6Rcs8
         F36gTp1YA3arOaCkbo+xpYfRO/5NfAxs++/y/2EYmULPkIyenbXefK0+o6mitjGrYMCA
         gBivLZcqnI8gIcSpqj/DAwkc6h5+Me+PkwdjpTzlTt5D5aK2Pndrj6oRrY5GYX0OhWR5
         TMTg+jPLNtTPaqYGVcFSlA0BLkJk4YkFRF2H7KWTGh/WTJpgQ76T69F+1Qnf7573IQ3O
         jojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585318; x=1781190118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7P+ek6ocV5HFyMB6++Nc5HRt5X7Za6z5O1aRcqqwv/w=;
        b=Swhbq6BHBMtnRS81z1PN7EmYzsu1gx3KrpAVXyZ0Y8D4w9SAKVy6NJcb8Rx4EcxmtJ
         M1gJhGoVPiEMq+V7nI4fDpXzQgYmVPFbKodEu/wPzT1YM/Jez0wOh3Ox35bqW2jziuT0
         9Wf8JVJCfMyRW0KEymRxKdGdZ0OPAhK7RobuWoMvXSVv+IFsUb5ESUopXofeB49gp7IF
         sd7VkFpcARUc8JoANl/Ah1G7AbxVKTbxhceC02/smGzahKAp27Jo4A5+/IJO3UyYOFvP
         T6OFUkWDPaLKDRwird9azHHFyDDAOkfTyBPndkJhqGsLv+x1nQFfg99EVB4qJDsaItYq
         BHBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2CNEwLjsmPgMCFkQ86yBB6jwu3hZPmaN7Ig+dfoM/HGJcaZZDaWsV+ymA/6JxFHzURExliLt+iMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxoh1b1WDwYrgBERrfIaGBn4MXMnkUz2QXgF245sUDv+Awrmexv
	2DlRNoGue2fnZXmzfCugL0mY/HrsQ84ja2l7+4pceMh2zMYJbprHua+Q
X-Gm-Gg: Acq92OHlxzbUjeYSWS5TLrmh2Z3WyL88HFrYyT2jpq3Rs/t6NGInxpK1VtQ6cN+YA4w
	BBwJw8NM2B1aLFScN98PDafqNMsFYpghuC7/+L+cJl/ENzLfIB+NDuIqhed1qfZJNH0vFyXb5ye
	yRD32/gmovzYk0n/OPayVoZZgm4U/a9eUnpGxtVXYK5j+vzUwhvOfygoQ/Hx1Hv9npnskgJJAcM
	XNKetOnXw+vL7i6ljRC5je4UL4mcraof+E7iivgpLX2wFRwPnWzAvoNo5PAWjQg4Cv/hQRvyRso
	wqubVeU0rWMv5yubqLzV3Ss3hOT/SEiH9RV7oUlYeIzViy/+w0oe46sn6s9Uw2cszCKTZ0yqci/
	2mlT7lexl1lUii2IM0jHaihnZn+j2BBDf/8U24IW8kW7A422zjA5ELpO5pyoiZG8BWSnw
X-Received: by 2002:a17:903:948:b0:2bf:305a:310b with SMTP id d9443c01a7336-2c1639edf93mr84099595ad.1.1780585318015;
        Thu, 04 Jun 2026 08:01:58 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Keith Busch <kbusch@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [RFC 02/12] PCI: Convert iov.c to pci_is_sriov_* helpers
Date: Thu,  4 Jun 2026 08:01:43 -0700
Message-ID: <20260604150153.3619662-3-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780585320-D937C443-51D6EFCE/0/0
X-purgate-type: clean
X-purgate-size: 6430
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,shazbot.org,ziepe.ca,intel.com,nvidia.com,suse.com,epam.com,fb.com,meta.com,lists.ozlabs.org,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:schnelle@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:alex@shazbot.org,m:jgg@ziepe.ca,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:leon@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:kbusch@kernel.org,m:alexanderduyck@fb.com,m:kuba@kernel.org,m:daskald@meta.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dimitridaskalakis1@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dimitridaskalakis1@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 016FD6413E4

From: Dimitri Daskalakis <daskald@meta.com>

No functional changes.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/pci/iov.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 91ac4e37ecb9..5de26057b99a 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -23,7 +23,7 @@
 
 int pci_iov_virtfn_bus(struct pci_dev *dev, int vf_id)
 {
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return -EINVAL;
 	return dev->bus->number + ((dev->devfn + dev->sriov->offset +
 				    dev->sriov->stride * vf_id) >> 8);
@@ -31,7 +31,7 @@ int pci_iov_virtfn_bus(struct pci_dev *dev, int vf_id)
 
 int pci_iov_virtfn_devfn(struct pci_dev *dev, int vf_id)
 {
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return -EINVAL;
 	return (dev->devfn + dev->sriov->offset +
 		dev->sriov->stride * vf_id) & 0xff;
@@ -42,7 +42,7 @@ int pci_iov_vf_id(struct pci_dev *dev)
 {
 	struct pci_dev *pf;
 
-	if (!dev->is_virtfn)
+	if (!pci_is_sriov_virtfn(dev))
 		return -EINVAL;
 
 	pf = pci_physfn(dev);
@@ -71,7 +71,7 @@ void *pci_iov_get_pf_drvdata(struct pci_dev *dev, struct pci_driver *pf_driver)
 {
 	struct pci_dev *pf_dev;
 
-	if (!dev->is_virtfn)
+	if (!pci_is_sriov_virtfn(dev))
 		return ERR_PTR(-EINVAL);
 	pf_dev = dev->physfn;
 	if (pf_dev->driver != pf_driver)
@@ -152,7 +152,7 @@ static void virtfn_remove_bus(struct pci_bus *physbus, struct pci_bus *virtbus)
 
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 {
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return 0;
 
 	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
@@ -300,7 +300,7 @@ static umode_t sriov_vf_attrs_are_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (!pdev->is_virtfn)
+	if (!pci_is_sriov_virtfn(pdev))
 		return 0;
 
 	return a->mode;
@@ -604,7 +604,7 @@ static umode_t sriov_pf_attrs_are_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 
-	if (!dev_is_pf(dev))
+	if (!dev_is_sriov_pf(dev))
 		return 0;
 
 	return a->mode;
@@ -707,7 +707,7 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 		if (!pdev)
 			return -ENODEV;
 
-		if (!pdev->is_physfn) {
+		if (!pci_is_sriov_physfn(pdev)) {
 			pci_dev_put(pdev);
 			return -ENOSYS;
 		}
@@ -814,7 +814,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 	ctrl = 0;
 	list_for_each_entry(pdev, &dev->bus->devices, bus_list)
-		if (pdev->is_physfn)
+		if (pci_is_sriov_physfn(pdev))
 			goto found;
 
 	pdev = NULL;
@@ -1006,7 +1006,7 @@ int pci_iov_init(struct pci_dev *dev)
  */
 void pci_iov_release(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (pci_is_sriov_physfn(dev))
 		sriov_release(dev);
 }
 
@@ -1018,7 +1018,7 @@ void pci_iov_remove(struct pci_dev *dev)
 {
 	struct pci_sriov *iov = dev->sriov;
 
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return;
 
 	iov->driver_max_VFs = iov->total_VFs;
@@ -1035,7 +1035,7 @@ void pci_iov_remove(struct pci_dev *dev)
  */
 void pci_iov_update_resource(struct pci_dev *dev, int resno)
 {
-	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
+	struct pci_sriov *iov = pci_is_sriov_physfn(dev) ? dev->sriov : NULL;
 	struct resource *res = pci_resource_n(dev, resno);
 	int vf_bar = pci_resource_num_to_vf_bar(resno);
 	struct pci_bus_region region;
@@ -1111,7 +1111,7 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn) {
+	if (pci_is_sriov_physfn(dev)) {
 		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
 	}
@@ -1124,7 +1124,7 @@ void pci_restore_iov_state(struct pci_dev *dev)
  */
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool auto_probe)
 {
-	if (dev->is_physfn)
+	if (pci_is_sriov_physfn(dev))
 		dev->sriov->drivers_autoprobe = auto_probe;
 }
 
@@ -1141,7 +1141,7 @@ int pci_iov_bus_range(struct pci_bus *bus)
 	struct pci_dev *dev;
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
-		if (!dev->is_physfn)
+		if (!pci_is_sriov_physfn(dev))
 			continue;
 		if (dev->sriov->max_VF_buses > max)
 			max = dev->sriov->max_VF_buses;
@@ -1161,7 +1161,7 @@ int pci_enable_sriov(struct pci_dev *dev, int nr_virtfn)
 {
 	might_sleep();
 
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return -ENOSYS;
 
 	return sriov_enable(dev, nr_virtfn);
@@ -1176,7 +1176,7 @@ void pci_disable_sriov(struct pci_dev *dev)
 {
 	might_sleep();
 
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return;
 
 	sriov_disable(dev);
@@ -1191,7 +1191,7 @@ EXPORT_SYMBOL_GPL(pci_disable_sriov);
  */
 int pci_num_vf(struct pci_dev *dev)
 {
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return 0;
 
 	return dev->sriov->num_VFs;
@@ -1212,7 +1212,7 @@ int pci_vfs_assigned(struct pci_dev *dev)
 	unsigned short dev_id;
 
 	/* only search if we are a PF */
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return 0;
 
 	/*
@@ -1228,7 +1228,7 @@ int pci_vfs_assigned(struct pci_dev *dev)
 		 * It is considered assigned if it is a virtual function with
 		 * our dev as the physical function and the assigned bit is set
 		 */
-		if (vfdev->is_virtfn && (vfdev->physfn == dev) &&
+		if (pci_is_sriov_virtfn(vfdev) && (vfdev->physfn == dev) &&
 			pci_is_dev_assigned(vfdev))
 			vfs_assigned++;
 
@@ -1254,7 +1254,7 @@ EXPORT_SYMBOL_GPL(pci_vfs_assigned);
  */
 int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs)
 {
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return -ENOSYS;
 
 	if (numvfs > dev->sriov->total_VFs)
@@ -1279,7 +1279,7 @@ EXPORT_SYMBOL_GPL(pci_sriov_set_totalvfs);
  */
 int pci_sriov_get_totalvfs(struct pci_dev *dev)
 {
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return 0;
 
 	return dev->sriov->driver_max_VFs;
@@ -1301,7 +1301,7 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
 
 	might_sleep();
 
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return -ENODEV;
 
 	if (pci_vfs_assigned(dev)) {
-- 
2.52.0


