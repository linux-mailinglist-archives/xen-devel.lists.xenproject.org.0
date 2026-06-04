Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3QnmFvGUIWpNJQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E106413CA
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jkGzUa7y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328034.1592739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gD-00060C-Ls; Thu, 04 Jun 2026 15:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328034.1592739; Thu, 04 Jun 2026 15:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gD-0005ni-5H; Thu, 04 Jun 2026 15:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1328034;
 Thu, 04 Jun 2026 15:02:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aE-00047V-OO
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9aE-00B95r-4e
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219364-2eae-0a2a0a5409dd-0a2a4509e686-44
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:10 +0200
Received: from [209.85.214.174] (helo=mail-pl1-f174.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219370-2497-0a2a45090019-d155d6aea9d5-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:09 +0200
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2bf77d4a4e2so11468985ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:09 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:4d::])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16629d042sm63879855ad.60.2026.06.04.08.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585328; x=1781190128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoqDAswymnFuDctzAHclbYUv6AH/JbUjYrzVeObwiVA=;
        b=jkGzUa7ya6kz419ZUmzAcQIQT2qYhnJm39MSBBSVdNsrHhfrpm/6gX3HqwQ+oUKgLw
         NNvjJXjASYCZdR+AHlAyhQhQG8r448Lh/TKF/TFUa8Hg8kH2SjR6WH67iXrb+yHrY1Io
         leATirggYiDe0BQU05MdXCeIGOxtlVjvR1yaYOkp9MMauAPqxf00PeEpIA7nx2jhPxIR
         Md88EqqKVKkdzMmosWaJDW44b07gF8UkNaVkbnBmGzqx0g3tGdqoAn+HDsHCwEMIeD8U
         moRemDlkaeWPGHH/9E4bz0rTickyh7nM/qjoIo0efqn9m84t0T6H/4hh74bixP3GWIvU
         9bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585328; x=1781190128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WoqDAswymnFuDctzAHclbYUv6AH/JbUjYrzVeObwiVA=;
        b=ZQkiUBZ0/bN1+BXZbDPkURIoyGjrVqinAM6XpBeFywpceqgWSdkUHt2UufT5F6K6rP
         zdrBsuDZj4/3Dc6y0SDykdYw2zjEjhrRxlbnn1HCdGyFAn+FhYWv+zXp56aRZ2BQYNJq
         1+CRSHb5yOZSYcYri0eRFiQj7l5+Q2cAJaZnqHOjFLBwIbIIZZuVoGD/edPyixFS4fnt
         bahNfuust7Lx5ilfodHwW/6KzLJZdMBTAOwKYICVpU+mjQ0KtUPOQNcqtGZ/M/AIXnPF
         sW6lOHwNIFHE415TziSHtIHjiM6mNJcXRN4OwfgE4IFhdwTTePD5iSdeYVuX0PHXF9Yt
         oMJA==
X-Forwarded-Encrypted: i=1; AFNElJ9F2TGTk0Ob9G3f9d9AZbPKfA1qA+Q9FZvpcHx+jursVZtyCCj54Ppw+3W9NPOirL96dh6JBaY2/kY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNe8l4Kzc7drv5/PDgps0Z7dkBtPtJtdCbQuVnuzcT/jVQJei2
	pW0ZIatkBuXZQHznoKrWM40uxm0LlPFKFMaWeOxniAQOMLSAaX8kQz6m
X-Gm-Gg: Acq92OGjvF4lW960fGlhRq+nLBAp1Nj2J04KcTBl8IT//p2bRiURZJ2ANIPTh7tFi3u
	ivUuzM1JtNRePcJjUZQI+imSDrrl6QleTAwuz5D1j5Njtn49uaca6NIMaUirCy4G9grZ1K7XARD
	ddObmNd/LmNBkFk36JDhKSBRzHAg9jlKSnhkFsfL+ZWAwAidJyTMau3MeWjjfIxiHofXRSXCfeX
	VBKwSTwx+713rFq0SdabhTDFtUfQMkUVKOPPbg5T8A4WjG7CtByAiMrRae+7/adCsGl7LEyZpwJ
	hhOBTGaH2BjXNZYnStF18qr8+fRjJds1dQrQiiz6SHsQUVbV9CRW5WFhMnjwyl4mkpV/s/EZv3C
	ST8DeCBUyHAZEeL0LIg/x3mDbFLDM8rs+BZKsXkGjPIUMa3PbUb/OVOQffOcUb3Fu3MLUE5X6ej
	2bOk0Ir96TcUO7ytNhMRqVKIlYzk6aIZLlF7AbCJo=
X-Received: by 2002:a17:902:820e:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c197b1805fmr25629535ad.1.1780585327615;
        Thu, 04 Jun 2026 08:02:07 -0700 (PDT)
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
Subject: [RFC 08/12] PCI: Add is_sriov bit to struct pci_dev
Date: Thu,  4 Jun 2026 08:01:49 -0700
Message-ID: <20260604150153.3619662-9-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780585330-40F66A53-11CEE0FF/0/0
X-purgate-type: clean
X-purgate-size: 3084
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
X-Rspamd-Queue-Id: 07E106413CA

From: Dimitri Daskalakis <daskald@meta.com>

We need a way to disambiguate the virtualization type of a PF/VF.
PFs may support multiple types of virtualization, while a VF should
only support one.

Tighten pci_is_sriov_physfn() / pci_is_sriov_virtfn() to ensure the
is_sriov bit is set. This allows the existing is_physfn/is_virtfn
bits to be agnostic of virtualization type.

No functional changes for SR-IOV.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 arch/s390/pci/pci_iov.c | 1 +
 drivers/pci/iov.c       | 4 ++++
 include/linux/pci.h     | 5 +++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/s390/pci/pci_iov.c b/arch/s390/pci/pci_iov.c
index 13050ce5c3e9..82e9ef1f132f 100644
--- a/arch/s390/pci/pci_iov.c
+++ b/arch/s390/pci/pci_iov.c
@@ -53,6 +53,7 @@ static int zpci_iov_link_virtfn(struct pci_dev *pdev, struct pci_dev *virtfn, in
 		return rc;
 
 	virtfn->is_virtfn = 1;
+	virtfn->is_sriov = 1;
 	virtfn->multifunction = 0;
 	virtfn->physfn = pci_dev_get(pdev);
 
diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 5de26057b99a..4aed4f6a42c3 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -326,6 +326,7 @@ static struct pci_dev *pci_iov_scan_device(struct pci_dev *dev, int id,
 	virtfn->vendor = dev->vendor;
 	virtfn->device = iov->vf_device;
 	virtfn->is_virtfn = 1;
+	virtfn->is_sriov = 1;
 	virtfn->physfn = pci_dev_get(dev);
 	virtfn->no_command_memory = 1;
 
@@ -897,6 +898,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 		iov->dev = dev;
 
 	dev->sriov = iov;
+	dev->is_sriov = 1;
 	dev->is_physfn = 1;
 	rc = compute_max_vf_buses(dev);
 	if (rc)
@@ -906,6 +908,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 fail_max_buses:
 	dev->sriov = NULL;
+	dev->is_sriov = 0;
 	dev->is_physfn = 0;
 failed:
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
@@ -926,6 +929,7 @@ static void sriov_release(struct pci_dev *dev)
 
 	kfree(dev->sriov);
 	dev->sriov = NULL;
+	dev->is_sriov = 0;
 }
 
 static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 28892243f49f..ca84f66425b2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -479,6 +479,7 @@ struct pci_dev {
 	unsigned int	state_saved:1;
 	unsigned int	is_physfn:1;
 	unsigned int	is_virtfn:1;
+	unsigned int	is_sriov:1;		/* SR-IOV is enabled on this device (PF or VF) */
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	is_pciehp:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
@@ -606,12 +607,12 @@ static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
 
 static inline bool pci_is_sriov_physfn(const struct pci_dev *dev)
 {
-	return dev->is_physfn;
+	return dev->is_physfn && dev->is_sriov;
 }
 
 static inline bool pci_is_sriov_virtfn(const struct pci_dev *dev)
 {
-	return dev->is_virtfn;
+	return dev->is_virtfn && dev->is_sriov;
 }
 
 struct pci_dev *pci_alloc_dev(struct pci_bus *bus);
-- 
2.52.0


