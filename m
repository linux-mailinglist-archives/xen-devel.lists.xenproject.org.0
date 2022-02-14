Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F554B48E7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271348.465755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYGu-0003B0-Dt; Mon, 14 Feb 2022 10:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271348.465755; Mon, 14 Feb 2022 10:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYGu-00039B-Aq; Mon, 14 Feb 2022 10:07:52 +0000
Received: by outflank-mailman (input) for mailman id 271348;
 Mon, 14 Feb 2022 10:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S9OP=S5=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1nJYGs-000395-AG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:07:50 +0000
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f454b0cb-8d7d-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 11:07:45 +0100 (CET)
Received: from [193.180.18.160] (port=46784 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1nJYGq-00FJ2L-Q4; Mon, 14 Feb 2022 11:07:48 +0100
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
X-Inumbo-ID: f454b0cb-8d7d-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
	; s=default; h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DBcZFOZFOzAo0487ORwdyo67faVNaoS7BuODPg0NpSc=; b=G2iBx9UAIY7r4NBbcXyTDLChbw
	Zgw1vyY89SDtdMDHqsdCOLiyD0ju+cpr2blUyln1I+Lq8jk+Pugfx0BpX9MHsjvZGwlvDOY8EdrcN
	jGT5YBha3W4hhznMoEJ4ehSglNSQ0Mbplhw5Ws2ylCjociLp6FRMi3kOkO3pHh8eBlAtoVvEMFKlT
	pNH6WgHV7uuMd1VUyrROPx8wiCaTbNyzotCCp5sYdwznYq0yp4Q6OceiB1Nb56b5Uk+DtayFC/NpD
	uSpOYKz3sPZBukIkgAMdmvd7rCyiCiXWueogd/tWwZjkfgr3VCdmLV1E7dsuX3F10b7HqVqhgSNZj
	uBVcE0Wg==;
Message-ID: <d818f9c9-a432-213e-4152-eaff3b7da52e@oderland.se>
Date: Mon, 14 Feb 2022 11:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
From: Josef Johansson <josef@oderland.se>
Subject: [PATCH v2] PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
To: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

From: Josef Johansson <josef@oderland.se>

PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
    
Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
the logic of checking msi_attrib.can_mask, without any reason.
    
This commits restores that logic.

Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
Signed-off-by: Josef Johansson <josef@oderland.se>

---
v2: Changing subject line to fit earlier commits.

Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
which ironically was what my last MSI patch resulted into.

I don't see any reason why this logic was change, and it did not break anything
correcting the logic.

CC xen-devel since it very much relates to Xen kernel (via pci_msi_ignore_mask).
---

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index c19c7ca58186..146e7b9a01cc 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -526,7 +526,7 @@ static int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
 		desc.pci.msi_attrib.can_mask = !pci_msi_ignore_mask &&
 					       !desc.pci.msi_attrib.is_virtual;
 
-		if (!desc.pci.msi_attrib.can_mask) {
+		if (desc.pci.msi_attrib.can_mask) {
 			addr = pci_msix_desc_addr(&desc);
 			desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 		}

--
2.31.1


