Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Ay9MPGUIWpQJQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E886413D6
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cE6Bedm2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328024.1592707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gB-0005I1-MJ; Thu, 04 Jun 2026 15:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328024.1592707; Thu, 04 Jun 2026 15:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gB-0005C8-CH; Thu, 04 Jun 2026 15:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1328024;
 Thu, 04 Jun 2026 15:02:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9a9-00044l-Ki
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9a9-006uM5-17
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a219363-e002-0a2a0a5209dd-0a2a4506817e-36
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:04 +0200
Received: from [209.85.214.172] (helo=mail-pl1-f172.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21936b-7371-0a2a45060019-d155d6acf1c7-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:04 +0200
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2bf20f6be6bso6277965ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:04 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:55::])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f6e2adsm67111415ad.5.2026.06.04.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780585323; x=1781190123; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4avmxi/DteAkFA5/0YsT4Z/7bVnyoihvSIvhh9yQxIo=;
        b=cE6Bedm2o6seYAG5XfrBq3hH2snEQqxY5cfDfRjqIxyrPSLqLgmKjcEUy/x9sLUqAM
         LsWaXQ6cDb+TF9yyWzNPd/MI9S4seCHOAt+8T4z3g8PWoHTZekfFwGKT3W+wW9pQNbnu
         4ByelU2pisFovSvX22e/h1vkQJxE5aGhOCfBsrO+M3g/e7mHUYK0ywKNXBYQpzISZ489
         rCfXkSE7030eRHZrTXbvDe0lFrpv1whRtu81ycaO7nDsSWJhyFhW4vsNCW+VOjjnNGB7
         AzMCrr7mOXu2oP0xwvNuxPOdjMB614DpRrYBRgxFXsHX0etwy3zo9g7ZBFSB1gCtQDcF
         C7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585323; x=1781190123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4avmxi/DteAkFA5/0YsT4Z/7bVnyoihvSIvhh9yQxIo=;
        b=ZmteGknRbopsMuOFpF3wutaMh45HiZmk6wZqRHY0a34YlUjXELsrhIaaNI6dat1EcP
         sDiyfGsOeJdGejQQHvxId8hmRaeVPSjg9QtQ63wNP8ml25EsuFzNOKvzZp4MM5GqgGdR
         Ki0h38ghsjci4h4LJhgLwOcKNT28A0SUZGOi8tm1Ge0eVXPesl8MtP2HvpkEkkBstuEQ
         QKplUlYd05lkaTAAFS4eHfie8eoQb/LfqLmEvI9zDO+ZoKHR6mTvqMnuwpSg5HbSD7Bl
         vPPJGezvsRHkSqBuAeR84QD8f+6lmm2p08dVMrdX+FSy4lGh/o0TK2+mgbbm3Hsyy3ut
         lUWA==
X-Forwarded-Encrypted: i=1; AFNElJ++/Km0CEe6+nE0lwqFelz1ouRStaX0kB6Ax1V2sjsL2OS4xkzwVPNar4IXI9xjXJdEj7rO71qtzkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC+f/eyqC81qD5eg09dm22Cx4vZG+rEOMBcVlQ1tlvcnRxb5FF
	TH3kesfOtqNcnoFvAnNLDLnCbA1OVwzpDWm8oNCBOm/XhslJXqSfKU8g
X-Gm-Gg: Acq92OGDdrn0h1b1HTknda33Lf3crNvzaEOtTesplfIQzeXIRUGjhfPxO0i9hoWf3QP
	3RlrkT7eD1UPLnKU/tvy6fJw4PVK9S/TlynCmGl6VRZq8g00FWqot4VnTsVM7bOGHTWjY36FrtO
	YZzd+Ku0q4KrP6rXhs6Enzimso9CWDuQ9AXNESJX8YkiidAhS1vAjnqf2JInM5IhfyXf/Fv9Xyn
	z4wYqIrzDLdoU3IG8VIXteYpGQhRn4OfaCoCPGDenox6g7bOEM1uZ2NfEYzGoJ/D+dxG6C3zL42
	d9EgD0qwZxHpnPMJha4yF3B/+mq7zC8dpbBtGmtI3DmRLhWX9wvwOcYMtoej1GHGKqNzwd4h724
	i0TxPp+oJ3dth7s7cG+Wz3TrOkULolWHkVr9v6N0Z5cGJaCXZuOkk7W46Z7JqcEKaumtYT3gaUc
	RAT4x6zC2pkiwRIv0PbSvitN7ZdfOAj8JJElkWEo0=
X-Received: by 2002:a17:903:37c4:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2c1644ca7bfmr89624145ad.25.1780585321320;
        Thu, 04 Jun 2026 08:02:01 -0700 (PDT)
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
Subject: [RFC 04/12] PCI: Convert arch/powerpc to pci_is_sriov_* helpers
Date: Thu,  4 Jun 2026 08:01:45 -0700
Message-ID: <20260604150153.3619662-5-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780585324-8D584D75-705C585F/0/0
X-purgate-type: clean
X-purgate-size: 7215
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
X-Rspamd-Queue-Id: 74E886413D6

From: Dimitri Daskalakis <daskald@meta.com>

Convert SR-IOV-specific is_physfn / is_virtfn reads in the PowerPC
PCI code to use pci_is_sriov_physfn() / pci_is_sriov_virtfn(). These
call sites are all SR-IOV-specific: they guard SR-IOV state
dereferences, VF PE management, or sit inside #ifdef CONFIG_PCI_IOV
blocks. Converting them keeps SR-IOV semantics intact once is_physfn
and is_virtfn widen to cover any virtualization type.

Files touched:
  arch/powerpc/kernel/pci_dn.c
  arch/powerpc/platforms/powernv/pci-ioda.c
  arch/powerpc/platforms/powernv/pci-sriov.c
  arch/powerpc/platforms/pseries/eeh_pseries.c
  arch/powerpc/platforms/pseries/setup.c

No functional changes.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 arch/powerpc/kernel/pci_dn.c                 |  4 ++--
 arch/powerpc/platforms/powernv/pci-ioda.c    |  6 +++---
 arch/powerpc/platforms/powernv/pci-sriov.c   | 10 +++++-----
 arch/powerpc/platforms/pseries/eeh_pseries.c |  8 ++++----
 arch/powerpc/platforms/pseries/setup.c       |  4 ++--
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index a7b664befed2..cf44ec368a36 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -176,7 +176,7 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
 	int i;
 
 	/* Only support IOV for now */
-	if (WARN_ON(!pdev->is_physfn))
+	if (WARN_ON(!pci_is_sriov_physfn(pdev)))
 		return NULL;
 
 	/* Check if VFs have been populated */
@@ -221,7 +221,7 @@ void remove_sriov_vf_pdns(struct pci_dev *pdev)
 	int i;
 
 	/* Only support IOV PF for now */
-	if (WARN_ON(!pdev->is_physfn))
+	if (WARN_ON(!pci_is_sriov_physfn(pdev)))
 		return;
 
 	/* Check if VFs have been populated */
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 32ecbc46e74b..63eacc8001fe 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -987,7 +987,7 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 	pe = pnv_pci_bdfn_to_pe(phb, pci_dev_id(pdev));
 	if (!pe) {
 		/* VF PEs should be pre-configured in pnv_pci_sriov_enable() */
-		if (WARN_ON(pdev->is_virtfn))
+		if (WARN_ON(pci_is_sriov_virtfn(pdev)))
 			return;
 
 		pnv_pci_configure_bus(pdev->bus);
@@ -2379,7 +2379,7 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
 	struct pnv_ioda_pe *pe;
 
 	/* The VF PE state is torn down when sriov_disable() is called */
-	if (pdev->is_virtfn)
+	if (pci_is_sriov_virtfn(pdev))
 		return;
 
 	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
@@ -2391,7 +2391,7 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
 	 * the iov state at probe time since we need to fiddle with the IOV
 	 * resources.
 	 */
-	if (pdev->is_physfn)
+	if (pci_is_sriov_physfn(pdev))
 		kfree(pdev->dev.archdata.iov_data);
 #endif
 
diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 7105a573aec4..1113488f4372 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -225,7 +225,7 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 
 void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
 {
-	if (pdev->is_virtfn) {
+	if (pci_is_sriov_virtfn(pdev)) {
 		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
 
 		/*
@@ -235,7 +235,7 @@ void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
 		 */
 		pe->pdev = pdev;
 		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
-	} else if (pdev->is_physfn) {
+	} else if (pci_is_sriov_physfn(pdev)) {
 		/*
 		 * For PFs adjust their allocated IOV resources to match what
 		 * the PHB can support using its M64 BAR table.
@@ -479,7 +479,7 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
 
-	if (!pdev->is_physfn)
+	if (!pci_is_sriov_physfn(pdev))
 		return;
 
 	/* FIXME: Use pnv_ioda_release_pe()? */
@@ -508,7 +508,7 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 	u16 num_vfs;
 	int i;
 
-	if (!dev->is_physfn)
+	if (!pci_is_sriov_physfn(dev))
 		return -EINVAL;
 	iov = pnv_iov_get(dev);
 
@@ -620,7 +620,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 	struct pnv_iov_data   *iov;
 	struct pci_dn         *pdn;
 
-	if (!pdev->is_physfn)
+	if (!pci_is_sriov_physfn(pdev))
 		return;
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b12ef382fec7..32030ac9be51 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -54,7 +54,7 @@ static void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 #ifdef CONFIG_PCI_IOV
-	if (pdev->is_virtfn) {
+	if (pci_is_sriov_virtfn(pdev)) {
 		pdn->device_id  =  pdev->device;
 		pdn->vendor_id  =  pdev->vendor;
 		pdn->class_code =  pdev->class;
@@ -68,7 +68,7 @@ static void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 #endif
 	pseries_eeh_init_edev(pdn);
 #ifdef CONFIG_PCI_IOV
-	if (pdev->is_virtfn) {
+	if (pci_is_sriov_virtfn(pdev)) {
 		/*
 		 * FIXME: This really should be handled by choosing the right
 		 *        parent PE in pseries_eeh_init_edev().
@@ -731,7 +731,7 @@ static int pseries_call_allow_unfreeze(struct eeh_dev *edev)
 	if (!vf_pe_array)
 		return -ENOMEM;
 	if (pci_num_vf(edev->physfn ? edev->physfn : edev->pdev)) {
-		if (edev->pdev->is_physfn) {
+		if (pci_is_sriov_physfn(edev->pdev)) {
 			cur_vfs = pci_num_vf(edev->pdev);
 			pdn = eeh_dev_to_pdn(edev);
 			parent = pdn->parent;
@@ -779,7 +779,7 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 	if (rtas_function_token(RTAS_FN_IBM_OPEN_SRIOV_ALLOW_UNFREEZE) == RTAS_UNKNOWN_SERVICE)
 		return -EINVAL;
 
-	if (edev->pdev->is_physfn || edev->pdev->is_virtfn)
+	if (pci_is_sriov_physfn(edev->pdev) || pci_is_sriov_virtfn(edev->pdev))
 		return pseries_call_allow_unfreeze(edev);
 
 	return 0;
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 50b26ed8432d..8165ae9adbd6 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -778,7 +778,7 @@ static void pseries_pci_fixup_iov_resources(struct pci_dev *pdev)
 	const int *indexes;
 	struct device_node *dn = pci_device_to_OF_node(pdev);
 
-	if (!pdev->is_physfn)
+	if (!pci_is_sriov_physfn(pdev))
 		return;
 	/*Firmware must support open sriov otherwise don't configure*/
 	indexes = of_get_property(dn, "ibm,open-sriov-vf-bar-info", NULL);
@@ -799,7 +799,7 @@ static resource_size_t pseries_pci_iov_resource_alignment(struct pci_dev *pdev,
 	if (!reg)
 		return pci_iov_resource_size(pdev, resno);
 
-	if (!pdev->is_physfn)
+	if (!pci_is_sriov_physfn(pdev))
 		return 0;
 	return pseries_get_iov_fw_value(pdev,
 					resno - PCI_IOV_RESOURCES,
-- 
2.52.0


