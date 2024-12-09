Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C49E95B6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851191.1265349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTe-0001kJ-4R; Mon, 09 Dec 2024 13:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851191.1265349; Mon, 09 Dec 2024 13:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdTd-0001iq-UH; Mon, 09 Dec 2024 13:07:05 +0000
Received: by outflank-mailman (input) for mailman id 851191;
 Mon, 09 Dec 2024 13:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b20=TC=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tKdTb-0000ch-Ue
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:07:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b3b88d6-b62e-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 14:07:03 +0100 (CET)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-VorUt1UHNKeLt_5llKv9cA-1; Mon, 09 Dec 2024 08:07:01 -0500
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385dcadffebso865060f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:07:00 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:06:58 -0800 (PST)
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
X-Inumbo-ID: 7b3b88d6-b62e-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6O49TnPkNeMtIPoWkV2XdJjg3ziNzZQ3FlPq3drZuU=;
	b=ZMPrH0El9WXhGOxw0fW4XhShln57ftb7xbRSlGkLqeF1GR8+JmtAdxyBg2d89usufnZ69H
	RGAFkpaKKt52ugrmLBsTA/QM58pCS5RLfQT1eaqLw7C0cdkfaVJcPkXqdiH+9kAecvgxho
	Zw2tFH2NuVNgYuGyHJFP0mr6U8JxUE8=
X-MC-Unique: VorUt1UHNKeLt_5llKv9cA-1
X-Mimecast-MFC-AGG-ID: VorUt1UHNKeLt_5llKv9cA
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749620; x=1734354420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6O49TnPkNeMtIPoWkV2XdJjg3ziNzZQ3FlPq3drZuU=;
        b=d20SdWIRx+5ScS531ktqOcaW9EaO9SF9uG0ipBtgzKtUBU2ACVm48H6SRnh+Tmd9oq
         Q0W+mPwNKAGeQbrwbF0+yhFkpnitExoLSdn1Qb+cD5/Q8OH7hPx6Ux6cCGisg34ZIiiF
         XmHtuvWymxiPoIwsQpbq///LufIlboToNkTeaRP7Quhva1z3aMG4t35vnXZ54+ZLUlpD
         Vn+EGtbmFdUQO43AIh1hTcEJD1p4sxN41RcfdJgLfU3VtdJVhkgWRN1dkgS542ahkWMp
         RpcW3yyFI6fxLHo4G+B0+WMFoy7Da4t57TFPlgi9GWosiEGm5dvOOEBeMw7MoHoIfspr
         ssYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYu7wjrRbFfhcI3aEdnLe0U+4K4gD+38WT63R38aDLYGj4KXYeVN04eOL8zeQqPder6ablloI7k8I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGFtq13XoBeE6OqhL7oBZTCb7gbBTEmFCr9OW2TA2H5S2FwkuJ
	z5p3fpyrVA6kjT+tiAwpGlDLlqgmOUEGKWtC5k1Lu/Y1qGaTYjIMHOv+P6ZNus54Ty19SdvUyu4
	2X5iMuyP5mQW019DyY8yV6UQngO6PoavuNOL4j28TkhrX4Jvtm6yUO20ptRwi3MWV
X-Gm-Gg: ASbGncsmc9hQlJq2Syk15CNsQnuTG7VRI4K5xbJ6QhsAnnmEBd/skGnGcHqvjeQkw9w
	RNaGJ/eTCS9soxobyTbvvThBp4+Fi+qGB35WL2Lkjm2m/kJJaE2YuwljfUIgTDDDJg1Iebm4LSE
	glj6xsfk6D8/XIRYh6otXnzNdeLSJsuhiu/X5sq3UoIsiuGrCmv9ak4Jbb2xTX05/NRE7dqK83s
	Je4k5gtlUlPcleScQ5eovVoZArEHuA8rHsv7LryfTXmG4rw9OgXXyUR2M1oK7UiLTF+KxHLzsd2
	1/b2zAOM
X-Received: by 2002:a05:6000:481d:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38645402350mr183799f8f.54.1733749619736;
        Mon, 09 Dec 2024 05:06:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtkNHnOC202GyBKEBPTwiG4UTLfJs2pkouVC4IktFgJYuC2xwE//LEhilVtJ79VvBlgBAiYw==
X-Received: by 2002:a05:6000:481d:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38645402350mr183738f8f.54.1733749619256;
        Mon, 09 Dec 2024 05:06:59 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: amien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 06/11] vfio/pci: Use never-managed version of pci_intx()
Date: Mon,  9 Dec 2024 14:06:28 +0100
Message-ID: <20241209130632.132074-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OejXA53lW106SfX-Ga5FPGYnABT84rBGhxPuyjq_VME_1733749620
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

vfio enables its PCI-Device with pci_enable_device(). Thus, it
needs the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vfio/pci/vfio_pci_core.c  |  2 +-
 drivers/vfio/pci/vfio_pci_intrs.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1ab58da9f38a..90240c8d51aa 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -498,7 +498,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
 		if (vfio_pci_nointx(pdev)) {
 			pci_info(pdev, "Masking broken INTx support\n");
 			vdev->nointx = true;
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		} else
 			vdev->pci_2_3 = pci_intx_mask_supported(pdev);
 	}
diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 8382c5834335..40abb0b937a2 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -118,7 +118,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		goto out_unlock;
 	}
 
@@ -132,7 +132,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 		 * mask, not just when something is pending.
 		 */
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 		else
 			disable_irq_nosync(pdev->irq);
 
@@ -178,7 +178,7 @@ static int vfio_pci_intx_unmask_handler(void *opaque, void *data)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx(pdev, 1);
+			pci_intx_unmanaged(pdev, 1);
 		goto out_unlock;
 	}
 
@@ -296,7 +296,7 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 	 */
 	ctx->masked = vdev->virq_disabled;
 	if (vdev->pci_2_3) {
-		pci_intx(pdev, !ctx->masked);
+		pci_intx_unmanaged(pdev, !ctx->masked);
 		irqflags = IRQF_SHARED;
 	} else {
 		irqflags = ctx->masked ? IRQF_NO_AUTOEN : 0;
@@ -569,7 +569,7 @@ static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
 	 * via their shutdown paths.  Restore for NoINTx devices.
 	 */
 	if (vdev->nointx)
-		pci_intx(pdev, 0);
+		pci_intx_unmanaged(pdev, 0);
 
 	vdev->irq_type = VFIO_PCI_NUM_IRQS;
 }
-- 
2.47.1


