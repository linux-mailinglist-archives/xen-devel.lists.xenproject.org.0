Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40369E95E1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 14:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851256.1265409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdX3-0007Xz-Rw; Mon, 09 Dec 2024 13:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851256.1265409; Mon, 09 Dec 2024 13:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKdX3-0007UD-Oz; Mon, 09 Dec 2024 13:10:37 +0000
Received: by outflank-mailman (input) for mailman id 851256;
 Mon, 09 Dec 2024 13:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b20=TC=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tKdTs-0000ch-NU
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 13:07:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83007d97-b62e-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 14:07:16 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-73G_LgCWMNy0xbJQsLo6Tw-1; Mon, 09 Dec 2024 08:07:14 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434fff37885so888695e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 05:07:13 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190965asm13200127f8f.82.2024.12.09.05.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:07:09 -0800 (PST)
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
X-Inumbo-ID: 83007d97-b62e-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6HNQFFZFNBo2fKXDk5eFuu7P7NBI6b9tUTkzIaFtOWU=;
	b=NRatnZhGonb65bvfPmdPRDr8bgEh0s0peyHC9oGS/z5Fz29Hy7/yD/2afUNByoTvVFK9lj
	TTXzjvfQNmvuXdNPpaLrso5IsuEffdZzk4XidNJxf9+nS44/saPeWdruAP2tELxIw1Wivt
	pEWg18GUxAe+EaBdIzY1sPkKOyL9r+k=
X-MC-Unique: 73G_LgCWMNy0xbJQsLo6Tw-1
X-Mimecast-MFC-AGG-ID: 73G_LgCWMNy0xbJQsLo6Tw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749631; x=1734354431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HNQFFZFNBo2fKXDk5eFuu7P7NBI6b9tUTkzIaFtOWU=;
        b=UF7n6ToAGffhM3hDZZMnUd72FFV03BTVznosiQGqcL5X8rtRZjsojku26WTTnJVTSd
         ZUEBPoWVGH+fFnoMX99XZiYhskqRYJD8WhJQu6st+d4gP8Giu0azHOPII0QbPQ5qYlw8
         bx6IGXYixZCw3afLxGHmlNGT8JASusUXHb2eN02cmZt7gJ1as1EXG0ixF8H52nD7pJa1
         SKrtulA3cAst6wb50KEMNUWU6r2N9efko7wYg73UXmYphnG4a3KJjxsr4y+5EUsfnj1y
         YEeCWSPS1KK9Lav07HvUpcUkhLqJ8cc2zNod23U4tK77ZN5L0+n6FVmY9hhxldtrx3tw
         x2ig==
X-Forwarded-Encrypted: i=1; AJvYcCWPinTjmHlp6+roiVZfigB/wSZhPb3wWHi186D1+PjurkAMaD6eLChz8cP9Ny6yNOxPRORF66yWKJQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoxK4907iqcL7vEjKQvERSAV84RQCkbepHhZyvhBgNLRXuTuwJ
	7e/CD1+wdHBDrry6OugEBXoTpt6ND1+zmUuQI80U2bqqLCsw/h0j6OUXlaRCGeB8LYgzaNYAyeJ
	45j6YWsdaMFUf3z5I7UDONsIacXn2kZDAph3sbNkn4VicCflqduwIRADp10qZZOmJ
X-Gm-Gg: ASbGnctc0Joyp81BxpzLkjW366J00LJCvruqU+oi+W/4DJo5Xzz7bO041tN0qLYWF1V
	myVLf/q6pQ1fLtcNehzVmz7OY7j4tCXfVGEW+Pc1BQ697AUWeSObMcEJpE3W/2/2VuxFB+KAnay
	gRCHXHE8U90+Xd9jzI3jG/uRfGr8B1Ja+HA/Jhl2Ok5nCu/Z4O/UB8f3/OAMUWC81yXeJ00clYv
	fpJgUpt+EsRQHPbsLq0bLuTWLN9ZIU+UB1J5Lb12Lt7NHwi1ygHwMYO9FXtLanhY2caaVfjMbzS
	yp3koh5Y
X-Received: by 2002:a05:600c:3547:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-434fffd0490mr3116165e9.21.1733749630791;
        Mon, 09 Dec 2024 05:07:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELX86PBcQHpAJDUmCcFKSGck+5vkGUq7O4wFXOdXDUx7b79IoLlNFEza+cDwu9qun6lbiQKA==
X-Received: by 2002:a05:600c:3547:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-434fffd0490mr3115205e9.21.1733749630127;
        Mon, 09 Dec 2024 05:07:10 -0800 (PST)
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
Subject: [PATCH v3 11/11] Remove devres from pci_intx()
Date: Mon,  9 Dec 2024 14:06:33 +0100
Message-ID: <20241209130632.132074-13-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>
References: <20241209130632.132074-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xz6DGUNq0y1h8u6CeMDiaJ4kGfcKhmhrEydd4DKMdSg_1733749633
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. This hybrid nature is undesirable.

Since all users of pci_intx() have by now been ported either to
always-managed pcim_intx() or never-managed pci_intx_unmanaged(), the
devres functionality can be removed from pci_intx().

Consequently, pci_intx_unmanaged() is now redundant, because pci_intx()
itself is now unmanaged.

Remove the devres functionality from pci_intx(). Have all users of
pci_intx_unmanaged() call pci_intx(). Remove pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/misc/cardreader/rtsx_pcr.c            |  2 +-
 drivers/misc/tifm_7xx1.c                      |  6 +--
 .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  |  2 +-
 drivers/net/ethernet/brocade/bna/bnad.c       |  2 +-
 drivers/ntb/hw/amd/ntb_hw_amd.c               |  4 +-
 drivers/ntb/hw/intel/ntb_hw_gen1.c            |  2 +-
 drivers/pci/devres.c                          |  4 +-
 drivers/pci/msi/api.c                         |  2 +-
 drivers/pci/msi/msi.c                         |  2 +-
 drivers/pci/pci.c                             | 43 +------------------
 drivers/vfio/pci/vfio_pci_core.c              |  2 +-
 drivers/vfio/pci/vfio_pci_intrs.c             | 10 ++---
 drivers/xen/xen-pciback/conf_space_header.c   |  2 +-
 include/linux/pci.h                           |  1 -
 14 files changed, 22 insertions(+), 62 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index e25e6d560dd7..be3d4e0e50cc 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1057,7 +1057,7 @@ static int rtsx_pci_acquire_irq(struct rtsx_pcr *pcr)
 	}
 
 	pcr->irq = pcr->pci->irq;
-	pci_intx_unmanaged(pcr->pci, !pcr->msi_en);
+	pci_intx(pcr->pci, !pcr->msi_en);
 
 	return 0;
 }
diff --git a/drivers/misc/tifm_7xx1.c b/drivers/misc/tifm_7xx1.c
index 5f9c7ccae8d2..1d54680d6ed2 100644
--- a/drivers/misc/tifm_7xx1.c
+++ b/drivers/misc/tifm_7xx1.c
@@ -327,7 +327,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 		goto err_out;
 	}
 
-	pci_intx_unmanaged(dev, 1);
+	pci_intx(dev, 1);
 
 	fm = tifm_alloc_adapter(dev->device == PCI_DEVICE_ID_TI_XX21_XX11_FM
 				? 4 : 2, &dev->dev);
@@ -368,7 +368,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 err_out_free:
 	tifm_free_adapter(fm);
 err_out_int:
-	pci_intx_unmanaged(dev, 0);
+	pci_intx(dev, 0);
 	pci_release_regions(dev);
 err_out:
 	if (!pci_dev_busy)
@@ -392,7 +392,7 @@ static void tifm_7xx1_remove(struct pci_dev *dev)
 		tifm_7xx1_sock_power_off(tifm_7xx1_sock_addr(fm->addr, cnt));
 
 	iounmap(fm->addr);
-	pci_intx_unmanaged(dev, 0);
+	pci_intx(dev, 0);
 	pci_release_regions(dev);
 
 	pci_disable_device(dev);
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 2ae63d6e6792..678829646cec 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -1669,7 +1669,7 @@ static void bnx2x_igu_int_enable(struct bnx2x *bp)
 	REG_WR(bp, IGU_REG_PF_CONFIGURATION, val);
 
 	if (val & IGU_PF_CONF_INT_LINE_EN)
-		pci_intx_unmanaged(bp->pdev, true);
+		pci_intx(bp->pdev, true);
 
 	barrier();
 
diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index 2b37462d406e..ece6f3b48327 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -2669,7 +2669,7 @@ bnad_enable_msix(struct bnad *bnad)
 		}
 	}
 
-	pci_intx_unmanaged(bnad->pcidev, 0);
+	pci_intx(bnad->pcidev, 0);
 
 	return;
 
diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
index b146f170e839..d687e8c2cc78 100644
--- a/drivers/ntb/hw/amd/ntb_hw_amd.c
+++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
@@ -791,7 +791,7 @@ static int ndev_init_isr(struct amd_ntb_dev *ndev,
 err_msi_enable:
 
 	/* Try to set up intx irq */
-	pci_intx_unmanaged(pdev, 1);
+	pci_intx(pdev, 1);
 
 	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
 			 "ndev_irq_isr", ndev);
@@ -831,7 +831,7 @@ static void ndev_deinit_isr(struct amd_ntb_dev *ndev)
 		if (pci_dev_msi_enabled(pdev))
 			pci_disable_msi(pdev);
 		else
-			pci_intx_unmanaged(pdev, 0);
+			pci_intx(pdev, 0);
 	}
 }
 
diff --git a/drivers/ntb/hw/intel/ntb_hw_gen1.c b/drivers/ntb/hw/intel/ntb_hw_gen1.c
index 9ad9d7fe227e..079b8cd79785 100644
--- a/drivers/ntb/hw/intel/ntb_hw_gen1.c
+++ b/drivers/ntb/hw/intel/ntb_hw_gen1.c
@@ -445,7 +445,7 @@ int ndev_init_isr(struct intel_ntb_dev *ndev,
 
 	/* Try to set up intx irq */
 
-	pci_intx_unmanaged(pdev, 1);
+	pci_intx(pdev, 1);
 
 	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
 			 "ndev_irq_isr", ndev);
diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 3594eea37993..cc3195134721 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -416,7 +416,7 @@ static void pcim_intx_restore(struct device *dev, void *data)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pcim_intx_devres *res = data;
 
-	pci_intx_unmanaged(pdev, res->orig_intx);
+	pci_intx(pdev, res->orig_intx);
 }
 
 static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
@@ -453,7 +453,7 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 		return -ENOMEM;
 
 	res->orig_intx = !enable;
-	pci_intx_unmanaged(pdev, enable);
+	pci_intx(pdev, enable);
 
 	return 0;
 }
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index c95e2e7dc9ab..b956ce591f96 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -289,7 +289,7 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 			 */
 			if (affd)
 				irq_create_affinity_masks(1, affd);
-			pci_intx_unmanaged(dev, 1);
+			pci_intx(dev, 1);
 			return 1;
 		}
 	}
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 53f13b09db50..3a45879d85db 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -268,7 +268,7 @@ EXPORT_SYMBOL_GPL(pci_write_msi_msg);
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
 {
 	if (!(dev->dev_flags & PCI_DEV_FLAGS_MSI_INTX_DISABLE_BUG))
-		pci_intx_unmanaged(dev, enable);
+		pci_intx(dev, enable);
 }
 
 static void pci_msi_set_enable(struct pci_dev *dev, int enable)
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 30d17ec771fc..121eb7b0b1b7 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4483,17 +4483,13 @@ void pci_disable_parity(struct pci_dev *dev)
 }
 
 /**
- * pci_intx_unmanaged - enables/disables PCI INTx for device dev,
- * unmanaged version
+ * pci_intx - enables/disables PCI INTx for device dev
  * @pdev: the PCI device to operate on
  * @enable: boolean: whether to enable or disable PCI INTx
  *
  * Enables/disables PCI INTx for device @pdev
- *
- * This function behavios identically to pci_intx(), but is never managed with
- * devres.
  */
-void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
+void pci_intx(struct pci_dev *pdev, int enable)
 {
 	u16 pci_command, new;
 
@@ -4509,41 +4505,6 @@ void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
 
 	pci_write_config_word(pdev, PCI_COMMAND, new);
 }
-EXPORT_SYMBOL_GPL(pci_intx_unmanaged);
-
-/**
- * pci_intx - enables/disables PCI INTx for device dev
- * @pdev: the PCI device to operate on
- * @enable: boolean: whether to enable or disable PCI INTx
- *
- * Enables/disables PCI INTx for device @pdev
- *
- * NOTE:
- * This is a "hybrid" function: It's normally unmanaged, but becomes managed
- * when pcim_enable_device() has been called in advance. This hybrid feature is
- * DEPRECATED! If you want managed cleanup, use pcim_intx() instead.
- */
-void pci_intx(struct pci_dev *pdev, int enable)
-{
-	u16 pci_command, new;
-
-	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
-
-	if (enable)
-		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
-	else
-		new = pci_command | PCI_COMMAND_INTX_DISABLE;
-
-	if (new != pci_command) {
-		/* Preserve the "hybrid" behavior for backwards compatibility */
-		if (pci_is_managed(pdev)) {
-			WARN_ON_ONCE(pcim_intx(pdev, enable) != 0);
-			return;
-		}
-
-		pci_write_config_word(pdev, PCI_COMMAND, new);
-	}
-}
 EXPORT_SYMBOL_GPL(pci_intx);
 
 /**
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 90240c8d51aa..1ab58da9f38a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -498,7 +498,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
 		if (vfio_pci_nointx(pdev)) {
 			pci_info(pdev, "Masking broken INTx support\n");
 			vdev->nointx = true;
-			pci_intx_unmanaged(pdev, 0);
+			pci_intx(pdev, 0);
 		} else
 			vdev->pci_2_3 = pci_intx_mask_supported(pdev);
 	}
diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 40abb0b937a2..8382c5834335 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -118,7 +118,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx_unmanaged(pdev, 0);
+			pci_intx(pdev, 0);
 		goto out_unlock;
 	}
 
@@ -132,7 +132,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
 		 * mask, not just when something is pending.
 		 */
 		if (vdev->pci_2_3)
-			pci_intx_unmanaged(pdev, 0);
+			pci_intx(pdev, 0);
 		else
 			disable_irq_nosync(pdev->irq);
 
@@ -178,7 +178,7 @@ static int vfio_pci_intx_unmask_handler(void *opaque, void *data)
 	 */
 	if (unlikely(!is_intx(vdev))) {
 		if (vdev->pci_2_3)
-			pci_intx_unmanaged(pdev, 1);
+			pci_intx(pdev, 1);
 		goto out_unlock;
 	}
 
@@ -296,7 +296,7 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
 	 */
 	ctx->masked = vdev->virq_disabled;
 	if (vdev->pci_2_3) {
-		pci_intx_unmanaged(pdev, !ctx->masked);
+		pci_intx(pdev, !ctx->masked);
 		irqflags = IRQF_SHARED;
 	} else {
 		irqflags = ctx->masked ? IRQF_NO_AUTOEN : 0;
@@ -569,7 +569,7 @@ static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
 	 * via their shutdown paths.  Restore for NoINTx devices.
 	 */
 	if (vdev->nointx)
-		pci_intx_unmanaged(pdev, 0);
+		pci_intx(pdev, 0);
 
 	vdev->irq_type = VFIO_PCI_NUM_IRQS;
 }
diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index 8d26d64232e8..fc0332645966 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -106,7 +106,7 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 
 	if (dev_data && dev_data->allow_interrupt_control &&
 	    ((cmd->val ^ value) & PCI_COMMAND_INTX_DISABLE))
-		pci_intx_unmanaged(dev, !(value & PCI_COMMAND_INTX_DISABLE));
+		pci_intx(dev, !(value & PCI_COMMAND_INTX_DISABLE));
 
 	cmd->val = value;
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index b5eb8bda655d..f05903dd7695 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1350,7 +1350,6 @@ int __must_check pcim_set_mwi(struct pci_dev *dev);
 int pci_try_set_mwi(struct pci_dev *dev);
 void pci_clear_mwi(struct pci_dev *dev);
 void pci_disable_parity(struct pci_dev *dev);
-void pci_intx_unmanaged(struct pci_dev *pdev, int enable);
 void pci_intx(struct pci_dev *dev, int enable);
 bool pci_check_and_mask_intx(struct pci_dev *dev);
 bool pci_check_and_unmask_intx(struct pci_dev *dev);
-- 
2.47.1


