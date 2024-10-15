Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980EF99F621
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 20:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819336.1232705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meX-00017p-Cx; Tue, 15 Oct 2024 18:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819336.1232705; Tue, 15 Oct 2024 18:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meX-00015I-9L; Tue, 15 Oct 2024 18:52:17 +0000
Received: by outflank-mailman (input) for mailman id 819336;
 Tue, 15 Oct 2024 18:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOCu=RL=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t0meW-0006G4-1i
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 18:52:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97d3cbb0-8b26-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 20:52:15 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-QsCyNvYIPm6a-UlLcWjZ0g-1; Tue, 15 Oct 2024 14:52:11 -0400
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5c930ca5d12so127179a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 11:52:11 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de.
 [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:52:08 -0700 (PDT)
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
X-Inumbo-ID: 97d3cbb0-8b26-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2Jr5AkqxaPFEKRGVmaRlM7QFZhouz0Sldtn5ZZjCmA=;
	b=hCOjnf86RoskrSMea6O/CrmMzMiVhilXhPCSn+dn4hx9sJrAeyyCmt9Ca42guwlvbj3YFh
	4/L4PHMQmuel3T0GU4X4gSpJLMuCgRc17qGBxlCp/2lP6ecqSmgH07b2BxmzGgNxl3PowA
	/t8vTa3w/OgpHYNnRdAH2nJWNmI8Cxc=
X-MC-Unique: QsCyNvYIPm6a-UlLcWjZ0g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018330; x=1729623130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2Jr5AkqxaPFEKRGVmaRlM7QFZhouz0Sldtn5ZZjCmA=;
        b=RVB+rV4Qjzvs0n5YN7t70qHcGRw0ayFRdOFHuxDu0HBfMzV0CKNq2+DiyDuuBvDT7p
         m6iWACPXGHLQZNoJehAIrQk2ZEsYdGUQcF+P/TgxekyPcCXNsgyAFSoDc3GkA4O0fsQd
         QkvGwpeKlHbH6mrsZ6Bq6nUHROQkNrOgmnsc4ah1ZE2IlaQR85dHIWi3V8kE8RjT4aCz
         g3G6qgHKsmTomUp9LVwVSwdonx6c81LkZKdnXW3KHNYfPwlryqG92j02wMiBSQIX+oEE
         CPKwcEqlUD/IKH/GtCjBuqzE4YH34lw0rlpcD+CpTrE198ymRBMbwzHc2y8yr5f1ZdGL
         J/rA==
X-Forwarded-Encrypted: i=1; AJvYcCVD7kIZCINBQHOBUNrbgaeDb2e6lZ84Cjyoqwjqs5wYLX+f3Dw+hBJpBThyKdJtj0OVfR3gCWcJgac=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz4NSpzbcbQroJ+skDKn1H0ZQBw13ATn8LqvAWNXGR5FwRB5uZ
	clrlrAvCE6VTL7bkipw/hb04fP32fkRLNIvsBJNpdqk/uAHhGMkWGOXUKUqdTogJ/OeN4R7+iGB
	G6SJMRnZ/WC2sPVV2K+5mCUMzkYFyc75KHyu81v+6qGDA9A0dunzqf3VCb5Di6ilE
X-Received: by 2002:a05:6402:27cf:b0:5c9:6981:9325 with SMTP id 4fb4d7f45d1cf-5c9698202e7mr8257651a12.8.1729018329916;
        Tue, 15 Oct 2024 11:52:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz3y1lDPzlFIAXe641ucDk32i7Rid6UZFyDapZOvfZWi7HgWp5FyR2ER9dH4XFZXo38YzXpg==
X-Received: by 2002:a05:6402:27cf:b0:5c9:6981:9325 with SMTP id 4fb4d7f45d1cf-5c9698202e7mr8257603a12.8.1729018329468;
        Tue, 15 Oct 2024 11:52:09 -0700 (PDT)
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
	Chen Ni <nichen@iscas.ac.cn>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Eric Auger <eric.auger@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 09/13] ata: Use always-managed version of pci_intx()
Date: Tue, 15 Oct 2024 20:51:19 +0200
Message-ID: <20241015185124.64726-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015185124.64726-1-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

All users in ata enable their PCI-Device with pcim_enable_device(). Thus,
they need the always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/ata/ahci.c       | 2 +-
 drivers/ata/ata_piix.c   | 2 +-
 drivers/ata/pata_rdc.c   | 2 +-
 drivers/ata/sata_sil24.c | 2 +-
 drivers/ata/sata_sis.c   | 2 +-
 drivers/ata/sata_uli.c   | 2 +-
 drivers/ata/sata_vsc.c   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 45f63b09828a..9273ff3d4732 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -1985,7 +1985,7 @@ static int ahci_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	if (ahci_init_msi(pdev, n_ports, hpriv) < 0) {
 		/* legacy intx interrupts */
-		pci_intx(pdev, 1);
+		pcim_intx(pdev, 1);
 	}
 	hpriv->irq = pci_irq_vector(pdev, 0);
 
diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
index 093b940bc953..d441246fa357 100644
--- a/drivers/ata/ata_piix.c
+++ b/drivers/ata/ata_piix.c
@@ -1725,7 +1725,7 @@ static int piix_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * message-signalled interrupts currently).
 	 */
 	if (port_flags & PIIX_FLAG_CHECKINTR)
-		pci_intx(pdev, 1);
+		pcim_intx(pdev, 1);
 
 	if (piix_check_450nx_errata(pdev)) {
 		/* This writes into the master table but it does not
diff --git a/drivers/ata/pata_rdc.c b/drivers/ata/pata_rdc.c
index 0a9689862f71..09792aac7f9d 100644
--- a/drivers/ata/pata_rdc.c
+++ b/drivers/ata/pata_rdc.c
@@ -340,7 +340,7 @@ static int rdc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return rc;
 	host->private_data = hpriv;
 
-	pci_intx(pdev, 1);
+	pcim_intx(pdev, 1);
 
 	host->flags |= ATA_HOST_PARALLEL_SCAN;
 
diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
index 72c03cbdaff4..b771ebd41252 100644
--- a/drivers/ata/sata_sil24.c
+++ b/drivers/ata/sata_sil24.c
@@ -1317,7 +1317,7 @@ static int sil24_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	if (sata_sil24_msi && !pci_enable_msi(pdev)) {
 		dev_info(&pdev->dev, "Using MSI\n");
-		pci_intx(pdev, 0);
+		pcim_intx(pdev, 0);
 	}
 
 	pci_set_master(pdev);
diff --git a/drivers/ata/sata_sis.c b/drivers/ata/sata_sis.c
index ef8724986de3..b8b6d9eff3b8 100644
--- a/drivers/ata/sata_sis.c
+++ b/drivers/ata/sata_sis.c
@@ -290,7 +290,7 @@ static int sis_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	pci_set_master(pdev);
-	pci_intx(pdev, 1);
+	pcim_intx(pdev, 1);
 	return ata_host_activate(host, pdev->irq, ata_bmdma_interrupt,
 				 IRQF_SHARED, &sis_sht);
 }
diff --git a/drivers/ata/sata_uli.c b/drivers/ata/sata_uli.c
index 60ea45926cd1..52894ff49dcb 100644
--- a/drivers/ata/sata_uli.c
+++ b/drivers/ata/sata_uli.c
@@ -221,7 +221,7 @@ static int uli_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	pci_set_master(pdev);
-	pci_intx(pdev, 1);
+	pcim_intx(pdev, 1);
 	return ata_host_activate(host, pdev->irq, ata_bmdma_interrupt,
 				 IRQF_SHARED, &uli_sht);
 }
diff --git a/drivers/ata/sata_vsc.c b/drivers/ata/sata_vsc.c
index d39b87537168..a53a2dfc1e17 100644
--- a/drivers/ata/sata_vsc.c
+++ b/drivers/ata/sata_vsc.c
@@ -384,7 +384,7 @@ static int vsc_sata_init_one(struct pci_dev *pdev,
 		pci_write_config_byte(pdev, PCI_CACHE_LINE_SIZE, 0x80);
 
 	if (pci_enable_msi(pdev) == 0)
-		pci_intx(pdev, 0);
+		pcim_intx(pdev, 0);
 
 	/*
 	 * Config offset 0x98 is "Extended Control and Status Register 0"
-- 
2.47.0


