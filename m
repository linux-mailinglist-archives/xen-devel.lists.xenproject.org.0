Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2A99F61F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 20:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819320.1232635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meC-0006l7-7L; Tue, 15 Oct 2024 18:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819320.1232635; Tue, 15 Oct 2024 18:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0meC-0006j0-3O; Tue, 15 Oct 2024 18:51:56 +0000
Received: by outflank-mailman (input) for mailman id 819320;
 Tue, 15 Oct 2024 18:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOCu=RL=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t0meA-0006Um-KE
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 18:51:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 855214b0-8b26-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 20:51:51 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-SFTSCarcNvmMwbbIAYTAwg-1; Tue, 15 Oct 2024 14:51:41 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5c9217064f6so4369814a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 11:51:41 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de.
 [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:51:38 -0700 (PDT)
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
X-Inumbo-ID: 855214b0-8b26-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N0GRF4pPtSOgd1WabJUy8wYxVfX9TEQxA2AbPtBzocc=;
	b=UGuvMOf9+oR9oe/MgJx/Yp+vmEfz5jHcqsuPuzMem1QPnaC7V9pldeRwIHvdFxMOfdaISV
	QJTzRzymKUE+kX8ff4klnwArZlSUltbvslN2cYK/vzV/kmHDPAZrd1IjDu6Wv2wrGmCRCM
	eWELW26N8fUP18HGvEnTAP8Wyn/XWyA=
X-MC-Unique: SFTSCarcNvmMwbbIAYTAwg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018300; x=1729623100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0GRF4pPtSOgd1WabJUy8wYxVfX9TEQxA2AbPtBzocc=;
        b=tMqFFfBW8T4LlImaO27s/0PZoSMnmgsIMbSEXBwx41oDMNtRM0wp3G+IjvRKPlKHLT
         pSF2so/79u/pJUtGFjGjggNhJ5YOPy9f+9ZOjtabSajbh0cFoGzUDzV41JYEb7AypO9A
         Cx/+5txCBk11a/5EaLKU221jDq9MS3dNbO4efRWvFY4SXJDUMj+NEjmFW/ZJ17IMB9pp
         3ew/EPbCsid7hb267vIC+ut34tfMQvazcdvS63EYynHrPs4jc2Z7hyKDy46Wg9dG0FrR
         iFqrIIftqFomkG7R+lj/R8JD0EuVZ+2JixKnNPBiJrfQStq1gnGJH+G4T4UYxwfDIkIY
         bqvw==
X-Forwarded-Encrypted: i=1; AJvYcCWkMf5Ki8f4SVEbK2IDAeLm4l29wdtz1VUyj4N3WXNBiGpCNgNs3Z39sg3ae+qtWH++91ghmHZSOjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwouqWN8wjS0HHLY1CsPlgx/2fvEGNOY1UZjr5OLC5iVUNNk89z
	WIxgpFN2H7fgVtD9udsDOaQmQIyDUjOXOWZC3OME/hIqmIetmZWZlYcr2T8naRGR6iowQPRP5kT
	6w82Z7oan9/ujR7qCTTLq7M3n/dRZXLFDFBlJCk/0wFkmNTSFRqq6rogG9oxk6KXi
X-Received: by 2002:a05:6402:5212:b0:5c9:547d:99 with SMTP id 4fb4d7f45d1cf-5c99501ced5mr1032527a12.2.1729018300214;
        Tue, 15 Oct 2024 11:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoUi+m94pA/sZ0UkPSNqunOeFPcNR+QjlgzRmDDQ7K7kAorm0A07Mz2aeKaa+48zMcVX+P9g==
X-Received: by 2002:a05:6402:5212:b0:5c9:547d:99 with SMTP id 4fb4d7f45d1cf-5c99501ced5mr1032505a12.2.1729018299657;
        Tue, 15 Oct 2024 11:51:39 -0700 (PDT)
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
Subject: [PATCH 00/13] Remove implicit devres from pci_intx()
Date: Tue, 15 Oct 2024 20:51:10 +0200
Message-ID: <20241015185124.64726-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

@Driver-Maintainers: Your driver might be touched by patch "Remove
devres from pci_intx()". You might want to take a look.

Changes since the RFC [1]:
  - Add a patch deprecating pci{m}_intx(). (Heiner, Andy, Me)
  - Add Acked-by's already given.
  - Export pcim_intx() as a GPL function. (Alex)
  - Drop patch for rts5280, since this driver will be removed quite
    soon. (Philipp Hortmann, Greg)
  - Use early-return in pci_intx_unmanaged() and pci_intx(). (Andy)

Hi all,

this series removes a problematic feature from pci_intx(). That function
sometimes implicitly uses devres for automatic cleanup. We should get
rid of this implicit behavior.

To do so, a pci_intx() version that is always-managed, and one that is
never-managed are provided. Then, all pci_intx() users are ported to the
version they need. Afterwards, pci_intx() can be cleaned up and the
users of the never-managed version be ported back to pci_intx().

This way we'd get this PCI API consistent again.

Patch "Remove devres from pci_intx()" obviously reverts the previous
patches that made drivers use pci_intx_unmanaged(). But this way it's
easier to review and approve. It also makes sure that each checked out
commit should provide correct behavior, not just the entire series as a
whole.

Merge plan for this is to enter through the PCI tree.

[1] https://lore.kernel.org/all/20241009083519.10088-1-pstanner@redhat.com/


Regards,
P.

Philipp Stanner (13):
  PCI: Prepare removing devres from pci_intx()
  ALSA: hda_intel: Use always-managed version of pcim_intx()
  drivers/xen: Use never-managed version of pci_intx()
  net/ethernet: Use never-managed version of pci_intx()
  net/ntb: Use never-managed version of pci_intx()
  misc: Use never-managed version of pci_intx()
  vfio/pci: Use never-managed version of pci_intx()
  PCI: MSI: Use never-managed version of pci_intx()
  ata: Use always-managed version of pci_intx()
  wifi: qtnfmac: use always-managed version of pcim_intx()
  HID: amd_sfh: Use always-managed version of pcim_intx()
  Remove devres from pci_intx()
  PCI: Deprecate pci_intx(), pcim_intx()

 drivers/ata/ahci.c                            |  2 +-
 drivers/ata/ata_piix.c                        |  2 +-
 drivers/ata/pata_rdc.c                        |  2 +-
 drivers/ata/sata_sil24.c                      |  2 +-
 drivers/ata/sata_sis.c                        |  2 +-
 drivers/ata/sata_uli.c                        |  2 +-
 drivers/ata/sata_vsc.c                        |  2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  2 +-
 .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  2 +-
 drivers/pci/devres.c                          | 29 +++++--------------
 drivers/pci/pci.c                             | 19 ++++--------
 include/linux/pci.h                           |  1 +
 sound/pci/hda/hda_intel.c                     |  2 +-
 14 files changed, 26 insertions(+), 47 deletions(-)

-- 
2.47.0


