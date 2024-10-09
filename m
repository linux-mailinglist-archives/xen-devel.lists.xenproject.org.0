Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6FE996303
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813884.1226978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySCb-0007qF-OS; Wed, 09 Oct 2024 08:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813884.1226978; Wed, 09 Oct 2024 08:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySCb-0007mT-Kb; Wed, 09 Oct 2024 08:37:49 +0000
Received: by outflank-mailman (input) for mailman id 813884;
 Wed, 09 Oct 2024 08:37:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qj4E=RF=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1sySCa-00075z-BR
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:37:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1e4d3a3-8619-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 10:37:46 +0200 (CEST)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-dMBsRrwbPBut4nBUtaQ81g-1; Wed, 09 Oct 2024 04:37:44 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7acca6cbe87so1143038185a.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:37:44 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:37:42 -0700 (PDT)
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
X-Inumbo-ID: c1e4d3a3-8619-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsGvGJm9MmViCmQHy+rwDTsxwdGI+an22CjgwnYtt0I=;
	b=DlD8AC5FeAy12otSKJW3K7BOBbkihwJUfV25ldfUwtq+khE2Xao17JNFw31+swaMiPOeaj
	7Jpif5VM0PlipxjDSNty8+MfYpvEki8iGKUYLPfQfb7BNK8m2/G8eaCTB+/cTVn3y30XRN
	/C6COYsqe5HfH6By6kOGCpklm6h9WUk=
X-MC-Unique: dMBsRrwbPBut4nBUtaQ81g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463063; x=1729067863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsGvGJm9MmViCmQHy+rwDTsxwdGI+an22CjgwnYtt0I=;
        b=OPzNbDwYq4r/HHIokPbqYiTGpiI665s1OVGP8mvPnrEAisD5IfeVG0X0taJdXic9RQ
         a6pkjCty2TlhiGjDKTk1upD5IbbTmearZ06eqFeYuguSXo3awZH0pYMGEq6S7AiJ0rp0
         AkPyTQHsBiAZd5rJsEwEdE7MpkexWkH+kfmLiQU4qvIr7wBEaBVphya6TqqkXRadEzhE
         aLsOQSK/Nthvh+mME8FWUVP7bbP3NE+VQw0u7DaRFY/HQPYUzZNX6i+lo0dmArDrfj9F
         5pMAZ5mjR6sxENW/eaPza+4Zf0qlJs2ZWblNu2WDLdsTPsDSghcGo9QmGa2yC/HDJ7dA
         oC/g==
X-Forwarded-Encrypted: i=1; AJvYcCXll949hG15ugxeZ2T0V0aNTWKkWDHlzIY/D9gSGDwJQDWTGchIZujKnbydrnx4brX88e0lWa6HcTU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMeEnCgPAS2e2Ku09vIVgwBvpYnpgk/I0aD8Re6AKEXhUEVVnb
	4huDcJCdDSePhj8y/2ydKRn58Rs70h4CR53j8Cp+CvyBZzrj89/7/XCcdFg1Oh0X2LLgTvAb1qC
	0fLVKRKIgB4YgKUCPo6HXGtvW8VfErhVP2AWXf3uWpSwkBJ9RgBO65P/RUnbbQH1n
X-Received: by 2002:a05:620a:2a0e:b0:7ac:a6f9:2986 with SMTP id af79cd13be357-7b0874d79cdmr228240785a.56.1728463063335;
        Wed, 09 Oct 2024 01:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFImvB9Qv7o17NV9RNqrUwhslSwlEiuBLwjyyln/SL0KXDFR9AO0zKFsp8+HNe0WvD5hbb1TQ==
X-Received: by 2002:a05:620a:2a0e:b0:7ac:a6f9:2986 with SMTP id af79cd13be357-7b0874d79cdmr228232385a.56.1728463062845;
        Wed, 09 Oct 2024 01:37:42 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [RFC PATCH 07/13] vfio/pci: Use never-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:13 +0200
Message-ID: <20241009083519.10088-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241009083519.10088-1-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

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
2.46.1


