Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678FF99F677
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 20:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819390.1232733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0mif-0004fO-RI; Tue, 15 Oct 2024 18:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819390.1232733; Tue, 15 Oct 2024 18:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0mif-0004aJ-M5; Tue, 15 Oct 2024 18:56:33 +0000
Received: by outflank-mailman (input) for mailman id 819390;
 Tue, 15 Oct 2024 18:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOCu=RL=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t0meh-0006G4-Oq
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 18:52:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eece4b0-8b26-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 20:52:27 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-sgIoPhvSPXmUnYTmUI6xCA-1; Tue, 15 Oct 2024 14:52:23 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5c9166079c0so4114681a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 11:52:22 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de.
 [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:52:20 -0700 (PDT)
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
X-Inumbo-ID: 9eece4b0-8b26-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXTMrjROGaTcKBpC5zD8IzpbS8kTElR36tpy9F32tfY=;
	b=J8TfNqjM+wJxgjKiEZuJALORjwIJeobmEHx3TdWP9cDPYLWO1WmwQwCl94ENBxMWS4nLVr
	W5VjAxZjPFSpbL6qxJD0JH/4ApyjL4XmbZZMwUsLaosfvVPgO0n7xeRO+nHywQPmF3Fw5z
	ZPSs4xGEcfnPHBz9vYsp5gOdNR++r2c=
X-MC-Unique: sgIoPhvSPXmUnYTmUI6xCA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018341; x=1729623141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXTMrjROGaTcKBpC5zD8IzpbS8kTElR36tpy9F32tfY=;
        b=GyZSc4kKs6gnez/kAlOZdIyrLBb5PQockzOA2Kl1owsEVUFW9zItxIcPuC8+d+dvAi
         VYcsFq4/3Z4HyB1FlZxMFZ1ZZo4ed5l3ECKLG7zGccNG9ZdrHulmy8+I8K6gWvkDwpZr
         y+j8748HMN8MgdSFDLoaQKDrRTROLM+mZNeD07hKGC8MJGSgsYggCzEdAHjR+SxhDjrD
         LFshlEkcBnPb5YjzwaKW1cWxU6zPYrvikOzH1Yr2UiGHqg6Uu6SPy3RzhGbFNWGG3p05
         ghxfzKlVmBYOVBfayiba1g0tobXP0gAm1KgCxj0T2nZ7g96ZWFM8ZlhwM/WUz1dDt4Br
         E/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFiTq9YT8OLTEVwVigSoQ9bM1jTivVHtiYYt2kNP8Mak2Pdu97MsSmyAnOV9bB48pgfzmKaDT9JT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPm/8tIH3Nym8VCL8z02aZbMt0Dd6tu3rCttpoYcUJprVFVyd/
	OmEeILZJTqk27dq/9RRDefkgSntGb4SfnwTGhR/wFbsQTSw797uBTFY8HDrp66W2i/pJxNAi4W4
	2PmSwl/l48i1AZeXyCtIr3hA24Ztb3u3P1KWDjdm0B3ueF1pc/L36Ut0YkjphzTMX
X-Received: by 2002:a05:6402:520f:b0:5c5:ba82:c3b1 with SMTP id 4fb4d7f45d1cf-5c95ac4e471mr9746986a12.29.1729018341563;
        Tue, 15 Oct 2024 11:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4IRS8nhPSbHHMGAr1esFr/1sORzxV4dHhLUSla/ENaT5Qe2x1SJKm+qMzu8Ky2rtxd6imbQ==
X-Received: by 2002:a05:6402:520f:b0:5c5:ba82:c3b1 with SMTP id 4fb4d7f45d1cf-5c95ac4e471mr9746938a12.29.1729018341069;
        Tue, 15 Oct 2024 11:52:21 -0700 (PDT)
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
Subject: [PATCH 13/13] PCI: Deprecate pci_intx(), pcim_intx()
Date: Tue, 15 Oct 2024 20:51:23 +0200
Message-ID: <20241015185124.64726-14-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015185124.64726-1-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pci_intx() and its managed counterpart pcim_intx() only exist for older
drivers which have not been ported yet for various reasons. Future
drivers should preferably use pci_alloc_irq_vectors().

Mark pci_intx() and pcim_intx() as deprecated and encourage usage of
pci_alloc_irq_vectors() in its place.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 5 ++++-
 drivers/pci/pci.c    | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 6f8f712fe34e..4c76fc063104 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -435,7 +435,7 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
 }
 
 /**
- * pcim_intx - managed pci_intx()
+ * pcim_intx - managed pci_intx() (DEPRECATED)
  * @pdev: the PCI device to operate on
  * @enable: boolean: whether to enable or disable PCI INTx
  *
@@ -443,6 +443,9 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
  *
  * Enable/disable PCI INTx for device @pdev.
  * Restore the original state on driver detach.
+ *
+ * This function is DEPRECATED. Do not use it in new code.
+ * Use pci_alloc_irq_vectors() instead (there is no managed version, currently).
  */
 int pcim_intx(struct pci_dev *pdev, int enable)
 {
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7ce1d0e3a1d5..dc69e23b8982 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4477,11 +4477,14 @@ void pci_disable_parity(struct pci_dev *dev)
 }
 
 /**
- * pci_intx - enables/disables PCI INTx for device dev
+ * pci_intx - enables/disables PCI INTx for device dev (DEPRECATED)
  * @pdev: the PCI device to operate on
  * @enable: boolean: whether to enable or disable PCI INTx
  *
  * Enables/disables PCI INTx for device @pdev
+ *
+ * This function is DEPRECATED. Do not use it in new code.
+ * Use pci_alloc_irq_vectors() instead.
  */
 void pci_intx(struct pci_dev *pdev, int enable)
 {
-- 
2.47.0


