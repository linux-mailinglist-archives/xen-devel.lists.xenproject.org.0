Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023F99F61C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 20:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819319.1232626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0me9-0006Vn-VP; Tue, 15 Oct 2024 18:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819319.1232626; Tue, 15 Oct 2024 18:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0me9-0006UH-Ry; Tue, 15 Oct 2024 18:51:53 +0000
Received: by outflank-mailman (input) for mailman id 819319;
 Tue, 15 Oct 2024 18:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOCu=RL=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t0me8-0006G4-9e
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 18:51:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 896c458b-8b26-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 20:51:51 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-dzAfU_2yNtaYtKWelRaoaA-1; Tue, 15 Oct 2024 14:51:48 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5c94ccfb210so3348180a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 11:51:48 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de.
 [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:51:46 -0700 (PDT)
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
X-Inumbo-ID: 896c458b-8b26-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3bl3QB30NLAEEM3JzJm3v9Fl/AaPLWrckmhbzUoxAcY=;
	b=alSa8kNcBnYuv6Zp6tWAIa9UGNtmWP4u7mcVrlEHVUP8BuSQszwN/J1QidI+L6Drep9DZR
	UPTRpMlo2VTu0L/OHY3KzxNILAu7xZ60YoB38oKdTM4KXnKGtl5swCw9cOVYB0Esk2l3up
	5xABHIKu4k6Wzsh3shX6qs3GLEdKq4w=
X-MC-Unique: dzAfU_2yNtaYtKWelRaoaA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018307; x=1729623107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bl3QB30NLAEEM3JzJm3v9Fl/AaPLWrckmhbzUoxAcY=;
        b=jx7bSgWqyFDmRqHlHbD1WYybMrVupY1MnBvCz4OYgdhgpMfqenfUNYWJhdEv3ti5gy
         iYXhK2yDG5FdW2A9htPo5KFkxhgY76sCXoY2ZRgUGFRpJAnyGGZpkeNpZj2TFRj1EogT
         4KEzbfOngU8S4SdGPbkhceQQ0TrtjXsIAV5SvlyPbI+TvNyZdOL2tvPbBiEInHTUjTEF
         t5ZNBHRVhPr0abF1Y2S2An4W9+jJ2nkY9MLJD9kgLpIUTlzjQYWAxNshdG4aKXP+/wQM
         /3u0fHwfYQAnBg4V+LZSfBJsLdd59Cu/OQFW0kaiwe9kViJKIt04gAbs3bT5eC1Em3sS
         oGvg==
X-Forwarded-Encrypted: i=1; AJvYcCUUlLy55XqxxIn7lOnzlk0PX1MSd+dSV/O+P5kxuGRZNpSTC2i21C3TSAgsK/l7DGxfB1KhHqHaVhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVfILdZxrfNEadZHz6lu+KhdkoRxK16V0+hUpEDMWtSmKxkZjC
	BKhvWyo1jFN67GMZs62Ew+t20YpP2/rVEccoZa8FyJ0r4SUVmcJvHHIwx8ylD/HQN6NrvFWKO01
	ioP2DLspXNdq4JcqcCqNdhLzRhw9L11KOscj/kCZC6YDcfuUJ6VaDR0VYhrlhAmT7
X-Received: by 2002:a05:6402:274b:b0:5c9:758c:307d with SMTP id 4fb4d7f45d1cf-5c995123e65mr1042694a12.34.1729018307271;
        Tue, 15 Oct 2024 11:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcpsVUn9n0QaeMUMW5c7DLX/r1R+cfZY7789CvnHFdFGuHG3lQrtgeZ9VzucvxMpAlT7QteA==
X-Received: by 2002:a05:6402:274b:b0:5c9:758c:307d with SMTP id 4fb4d7f45d1cf-5c995123e65mr1042656a12.34.1729018306780;
        Tue, 15 Oct 2024 11:51:46 -0700 (PDT)
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
Subject: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of pcim_intx()
Date: Tue, 15 Oct 2024 20:51:12 +0200
Message-ID: <20241015185124.64726-3-pstanner@redhat.com>
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

hda_intel enables its PCI-Device with pcim_enable_device(). Thus, it needs
the always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 sound/pci/hda/hda_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b4540c5cd2a6..b44ca7b6e54f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx *chip, int do_disconnect)
 	}
 	bus->irq = chip->pci->irq;
 	chip->card->sync_irq = bus->irq;
-	pci_intx(chip->pci, !chip->msi);
+	pcim_intx(chip->pci, !chip->msi);
 	return 0;
 }
 
-- 
2.47.0


