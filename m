Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264899F620
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 20:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819323.1232666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meJ-0007cS-4E; Tue, 15 Oct 2024 18:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819323.1232666; Tue, 15 Oct 2024 18:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meJ-0007Z9-0Y; Tue, 15 Oct 2024 18:52:03 +0000
Received: by outflank-mailman (input) for mailman id 819323;
 Tue, 15 Oct 2024 18:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOCu=RL=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t0meI-0006Um-5a
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 18:52:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ee04ecc-8b26-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 20:52:00 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-f5_X4XZEMkmClp8pgNwoxw-1; Tue, 15 Oct 2024 14:51:57 -0400
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5c96e34ff52so2097837a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 11:51:57 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de.
 [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:51:55 -0700 (PDT)
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
X-Inumbo-ID: 8ee04ecc-8b26-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gh5xBESPiuO8YtWqrs+YzUNc8fkB81YlCR9KwN+kONI=;
	b=ASBqMOIWLUCiaeTIdtZxxR2bMbLI9MyGfd2H9JL07tQ2vTxIKfmO8RVt/PgDuue3mDIt1a
	SnyJqS5LffqO3n9RPsZyMbVK3PIPBlldLZmZebka7TDZ1xCPhET8Gmro2XWDBetP7qK4xn
	b463U0pOmWD6RQuXuAnCN9QkoyUo47U=
X-MC-Unique: f5_X4XZEMkmClp8pgNwoxw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018316; x=1729623116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gh5xBESPiuO8YtWqrs+YzUNc8fkB81YlCR9KwN+kONI=;
        b=TYh6Ny5VhRIakrmkOYVaods/3tkZsafmLieMZazowZbM9OdhPqCMv7zYqelatdGsg6
         UxYDY8bX5AvDY1UjMuTy+UV7dzWToDwhHoTFxBiMbFDMpmVALTzElmrhpn5CoLIJbU88
         kCVzKezVcNMNfOA4VBPH6Ln+JNCQ3Fzx5rf1K9Xb4V2RbKVgoAK2qeKxyAJI/qt/v+Zy
         MnIQEbKkVcPysAH3rtTzRdCdE9aTwTeQs4FzcSnNWulQgnOOK0iAg/6Yo/k5hzuOVfe5
         uDzLwePJwrAl4HSiQ5rUlXPLbjTLnirvPKhc6sYKQRHO4OxarNobkIuLbPF36QLIJJgF
         Xqtg==
X-Forwarded-Encrypted: i=1; AJvYcCUbENNAPm14oiVVZU9JWS8Q8NBAdWeEHwpl9ffHtYHxOnT4URW25Zl7IHKG+nZcmhdZzxQJESfpfaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVb0ATPhjXKoTdMoS7YNBCtMqVgsh6minCghXVPCOgnf6pm8U3
	fGzdVLRr+QwAfCQ1y80SvZeXfWEe16GHxBDwRVc2MMFGbDx87Xry0kyHb1YiNnZjklVQ3LZJZCs
	W09jeDuktp3D2DDZq0pdYv256GhnESOZvkWWquG7hzfvHQ/vo7rMbKlGYIk3QntBh
X-Received: by 2002:a05:6402:2749:b0:5c2:439d:90d4 with SMTP id 4fb4d7f45d1cf-5c948d76b4amr10733522a12.30.1729018316276;
        Tue, 15 Oct 2024 11:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF3RowDEBzBmFjomZKJb8aI1a+lparmQD2EhJzOsotZnZJFVQLosdt/QHX4IGQZaEh/cAmrg==
X-Received: by 2002:a05:6402:2749:b0:5c2:439d:90d4 with SMTP id 4fb4d7f45d1cf-5c948d76b4amr10733454a12.30.1729018315667;
        Tue, 15 Oct 2024 11:51:55 -0700 (PDT)
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
Subject: [PATCH 05/13] net/ntb: Use never-managed version of pci_intx()
Date: Tue, 15 Oct 2024 20:51:15 +0200
Message-ID: <20241015185124.64726-6-pstanner@redhat.com>
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

hw/amd and how/intel enable their PCI-Device with pci_enable_device().
Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com> #for ntb_hw_amd.c
---
 drivers/ntb/hw/amd/ntb_hw_amd.c    | 4 ++--
 drivers/ntb/hw/intel/ntb_hw_gen1.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
index d687e8c2cc78..b146f170e839 100644
--- a/drivers/ntb/hw/amd/ntb_hw_amd.c
+++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
@@ -791,7 +791,7 @@ static int ndev_init_isr(struct amd_ntb_dev *ndev,
 err_msi_enable:
 
 	/* Try to set up intx irq */
-	pci_intx(pdev, 1);
+	pci_intx_unmanaged(pdev, 1);
 
 	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
 			 "ndev_irq_isr", ndev);
@@ -831,7 +831,7 @@ static void ndev_deinit_isr(struct amd_ntb_dev *ndev)
 		if (pci_dev_msi_enabled(pdev))
 			pci_disable_msi(pdev);
 		else
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 	}
 }
 
diff --git a/drivers/ntb/hw/intel/ntb_hw_gen1.c b/drivers/ntb/hw/intel/ntb_hw_gen1.c
index 079b8cd79785..9ad9d7fe227e 100644
--- a/drivers/ntb/hw/intel/ntb_hw_gen1.c
+++ b/drivers/ntb/hw/intel/ntb_hw_gen1.c
@@ -445,7 +445,7 @@ int ndev_init_isr(struct intel_ntb_dev *ndev,
 
 	/* Try to set up intx irq */
 
-	pci_intx(pdev, 1);
+	pci_intx_unmanaged(pdev, 1);
 
 	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
 			 "ndev_irq_isr", ndev);
-- 
2.47.0


