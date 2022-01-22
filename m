Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28943496919
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jan 2022 02:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259487.447891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB4us-0001fP-60; Sat, 22 Jan 2022 01:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259487.447891; Sat, 22 Jan 2022 01:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB4us-0001ab-1G; Sat, 22 Jan 2022 01:10:06 +0000
Received: by outflank-mailman (input) for mailman id 259487;
 Sat, 22 Jan 2022 01:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tm/g=SG=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1nB4uq-0001LJ-U9
 for xen-devel@lists.xenproject.org; Sat, 22 Jan 2022 01:10:04 +0000
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07347a58-7b20-11ec-8fa7-f31e035a9116;
 Sat, 22 Jan 2022 02:10:03 +0100 (CET)
Received: from [193.180.18.160] (port=33564 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1nB4up-009lZI-0z; Sat, 22 Jan 2022 02:10:03 +0100
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
X-Inumbo-ID: 07347a58-7b20-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
	; s=default; h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aX7TwSHLaIBX8pSVwqMdOwyurLFRdxdH5esrdDy9+OE=; b=DNiFe7PqQ/atv81CrsT5yFEAq7
	C4M77ErtITwAApqYy0eKo2HD8k+ar4WpSfInHoWHq7soJh9dtVAhxgb60tHVV25+Ax4C2nE7ArP0i
	0GxgyvsUnR5WzdzLa3GiTm4UIBjh9UTdErlKvnvV0ZM98A018e/aKgS6EQfV2/miC2BIlY00pOV4U
	nV2mRwu2wBtNveI2WYLZ2I4RpfKYWjE0nm28kmkmOrltMW9xPX2v0KqcfxOeGAE2WI7N+HnIwejHI
	qaSMaLT+c60qq31ehExpoHN88k/UMwHUN9zlFIrDu16B3JXoLjuoxf5uPMExfjL4XbCVBaUDH3VTS
	ltjTMrEA==;
Message-ID: <f5a224ee-b72f-7053-6030-b6c4d8a29be9@oderland.se>
Date: Sat, 22 Jan 2022 02:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
From: Josef Johansson <josef@oderland.se>
Subject: [PATCH] PCI/MSI: msix_setup_msi_descs: Restore logic for
 msi_attrib.can_mask
To: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-pci@vger.kernel.org
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

PCI/MSI: msix_setup_msi_descs: Restore logic for msi_attrib.can_mask
    
Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
the logic of checking msi_attrib.can_mask, without any reason.
    
This commits restores that logic.

Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
Signed-off-by: Josef Johansson <josef@oderland.se>

---
Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
which ironically was what my last MSI patch resulted into.

I don't see any reason why this logic was change, nor do I have the possibility
to see if anything works with my patch or without, since the kernel crashes
in other places.

As such this is still untested, but as far as I can tell it should restore
functionality.

Re-sending since it was rejected by linux-pci@vger.kernel.org due to HTML contents.
Sorry about that.

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


