Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC254968D7
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jan 2022 01:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259471.447869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB4Qt-0003X8-Ji; Sat, 22 Jan 2022 00:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259471.447869; Sat, 22 Jan 2022 00:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB4Qt-0003V4-Fh; Sat, 22 Jan 2022 00:39:07 +0000
Received: by outflank-mailman (input) for mailman id 259471;
 Sat, 22 Jan 2022 00:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tm/g=SG=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1nB4Qr-0003Uy-Cq
 for xen-devel@lists.xenproject.org; Sat, 22 Jan 2022 00:39:05 +0000
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2cd2833-7b1b-11ec-bc18-3156f6d857e4;
 Sat, 22 Jan 2022 01:39:03 +0100 (CET)
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:33562
 helo=[10.137.0.14]) by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1nB4Qp-0091pp-BJ; Sat, 22 Jan 2022 01:39:03 +0100
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
X-Inumbo-ID: b2cd2833-7b1b-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
	; s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iibyDsUpJ2A/789hzXswyi6AlXxKcU91Lj2za+EDKZo=; b=Rl+yUoKbLNTL29peCNyNz6ZQmQ
	3eGR4/Dpw326Din/VEE5T1YJ2WtHNFQQJ3Lqew3o5wwzKaHzUTrvbnKmwySNLIz7qYTbUHSY4+y2V
	nGqkVKVUfpJykUdUywl36OunOX8z2+zVS7jpxJFc/GqQ6qcHpH3mpIAr9yWls/Chgz2Q5se7gB0va
	1iOBAtwivyydh+BVnPCskIcame/lfnHb21V2AiRkdDReRcLKlGf0V3uuOnpNImtkwfKsyHm5r3z1o
	xJTK6VDZ0plM2v/Fx9x2a3tT6xziHWA2knoIfOAcoXBzBDnEmzBbkcqnDefYAaVyplLpxooABGHzB
	stvQ6mXw==;
Message-ID: <66afd4f8-ae3c-b51f-f956-80069ce75528@oderland.se>
Date: Sat, 22 Jan 2022 01:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Josef Johansson <josef@oderland.se>
Subject: [PATCH] PCI/MSI: msix_setup_msi_descs: Restore logic for
 msi_attrib.can_mask
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>From: Josef Johansson <a class="moz-txt-link-rfc2396E" href="mailto:josef@oderland.se">&lt;josef@oderland.se&gt;</a>

PCI/MSI: msix_setup_msi_descs: Restore logic for msi_attrib.can_mask
    
Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
the logic of checking msi_attrib.can_mask, without any reason.
    
This commits restores that logic.

Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
Signed-off-by: Josef Johansson <a class="moz-txt-link-rfc2396E" href="mailto:josef@oderland.se">&lt;josef@oderland.se&gt;</a>

---
Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
which ironically was what my last MSI patch resulted into.

I don't see any reason why this logic was change, nor do I have the possibility
to see if anything works with my patch or without, since the kernel crashes
in other places.

As such this is still untested, but as far as I can tell it should restore
functionality.

CC xen-devel since it very much relates to Xen kernel (via pci_msi_ignore_mask).
---

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index c19c7ca58186..146e7b9a01cc 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -526,7 +526,7 @@ static int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
 		desc.pci.msi_attrib.can_mask = !pci_msi_ignore_mask &amp;&amp;
 					       !desc.pci.msi_attrib.is_virtual;
 
-		if (!desc.pci.msi_attrib.can_mask) {
+		if (desc.pci.msi_attrib.can_mask) {
 			addr = pci_msix_desc_addr(&amp;desc);
 			desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 		}

--
2.31.1
</pre>
  </body>
</html>

