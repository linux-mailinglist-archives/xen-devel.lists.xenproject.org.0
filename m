Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0A9967CE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 12:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814321.1227867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUME-0007L6-Sy; Wed, 09 Oct 2024 10:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814321.1227867; Wed, 09 Oct 2024 10:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUME-0007JZ-Pt; Wed, 09 Oct 2024 10:55:54 +0000
Received: by outflank-mailman (input) for mailman id 814321;
 Wed, 09 Oct 2024 10:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qj4E=RF=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1syUMD-0007JT-8D
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 10:55:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bec66c8-862d-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 12:55:51 +0200 (CEST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-KwvGB6x3M_mopTKOlZf9gA-1; Wed, 09 Oct 2024 06:55:49 -0400
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2e2a9577037so552382a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 03:55:48 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2a365cb84sm1341556a91.0.2024.10.09.03.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 03:55:46 -0700 (PDT)
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
X-Inumbo-ID: 0bec66c8-862d-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728471350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6wOEJFH1gN3pSkiGKb7z2pqnwnI+EOwPE66fTmRo9I=;
	b=UXGmAd/ueXQSn/ubVKycETMgPvnqcbMzwle74kYnWoMEhebollHM8MDV2txuKWVZCozMPX
	kNrEnoRrZH5x1zEXDvYl+dhxxPTmnL9HVZF1xaB+J3j7k03oa3WnDVxBIUtE0mqWvhmVTG
	blFopCum6ELHK9KO96pzznYvLq8XAg8=
X-MC-Unique: KwvGB6x3M_mopTKOlZf9gA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728471348; x=1729076148;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcZlzWYyN8UAcZA3DQr50bLqr6cMtcb31GCRb120JWk=;
        b=qEQ1/ihy5zsHNIObGohZAxVuV2vCHjRdg0bGFVrlccp2vk14VoNiHv2udRBCe5wCr5
         bf9TDKxZLgUlH/Hi959SfXfJSXQV3WRFH5PGC+LvHH27Tt5fI7Sag7gLFgv80PgEsGOQ
         1doSyxkMsfwlLKXSrRzSGxxvtodS49zvnQhQibivYz43wlctu5jTmp0Gh2/8gLa/Ab5m
         hD7Z6rRb9pUCVEhJY1NVzmnt8/gRd5mTXZjBs/FZnz/dyZQ2EYSuUVU4LsT+6FT9EXDl
         vKDuF7pYE+S5Dtu7rJIMhIw1DAnEwEP/YaqBTmRppEOS3oLaSA0UtFSsecAXV+2zLm/B
         U/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0lXYv4LzemT2OFCc/x45FPpFpIAtCqTL+FlSlzPd4IW7nvVRsGESCYKLSNzUTsgnmWW55k3vhP2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTQOUoVj72OQm6SOMEsxXSdrm9JqBAaKxrD2zxiOuk0uagJZkN
	3WtetSz400qRNha1qiblESJayKJN2oxNgg8Q75TcdHVvdCUla9+wnLmXaQUVRm8BdidJSZXzyzg
	I2OKWsxdBCG+Lf9wPmJfBRnTAQuOHCZj0pKLzAROshhfVJRg7iXUdC2TNRDIKa8gI
X-Received: by 2002:a17:90b:28c7:b0:2e2:b21b:2247 with SMTP id 98e67ed59e1d1-2e2b21b2322mr933567a91.27.1728471348023;
        Wed, 09 Oct 2024 03:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVV2txsjAP9qEDQxARdGlpHpBZTxsJXvis+5//ouL/mBT0m0DdnB1NIlYvykMWn/28LY/iUQ==
X-Received: by 2002:a17:90b:28c7:b0:2e2:b21b:2247 with SMTP id 98e67ed59e1d1-2e2b21b2322mr933536a91.27.1728471347607;
        Wed, 09 Oct 2024 03:55:47 -0700 (PDT)
Message-ID: <d6a78b6a3dec3e2371cced1382cd83d7dcf37426.camel@redhat.com>
Subject: Re: [RFC PATCH 09/13] ata: Use always-managed version of pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 Soumya Negi <soumya.negi97@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi
 Liu <yi.l.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Eric Auger
 <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  linux-staging@lists.linux.dev,
 kvm@vger.kernel.org,  xen-devel@lists.xenproject.org,
 linux-sound@vger.kernel.org
Date: Wed, 09 Oct 2024 12:55:07 +0200
In-Reply-To: <95b23ff9-eb17-4e1c-b7a3-2d3691ffc48f@kernel.org>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-10-pstanner@redhat.com>
	 <95b23ff9-eb17-4e1c-b7a3-2d3691ffc48f@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-10-09 at 17:51 +0900, Damien Le Moal wrote:
> On 10/9/24 17:35, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which can sometimes be managed
> > through
> > devres. To remove this hybrid nature from pci_intx(), it is
> > necessary to
> > port users to either an always-managed or a never-managed version.
> >=20
> > All users in ata enable their PCI-Device with pcim_enable_device().
> > Thus,
> > they need the always-managed version.
> >=20
> > Replace pci_intx() with pci_intx_unmanaged().
>=20
> This contradicts the sentence above and the patche replaces
> pci_intx() with
> pcim_intx()... So s/pci_intx_unmanaged/pcim_intx in the above
> sentence ?

Yes, absolutely correct, the commit message is broken. The code itself
is fine, I grepped through it for pci_enable / pcim_enable

P.

>=20
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0drivers/ata/ahci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/ata_piix.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/pata_rdc.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/sata_sil24.c | 2 +-
> > =C2=A0drivers/ata/sata_sis.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/sata_uli.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0drivers/ata/sata_vsc.c=C2=A0=C2=A0 | 2 +-
> > =C2=A07 files changed, 7 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
> > index 45f63b09828a..9273ff3d4732 100644
> > --- a/drivers/ata/ahci.c
> > +++ b/drivers/ata/ahci.c
> > @@ -1985,7 +1985,7 @@ static int ahci_init_one(struct pci_dev
> > *pdev, const struct pci_device_id *ent)
> > =C2=A0
> > =C2=A0=09if (ahci_init_msi(pdev, n_ports, hpriv) < 0) {
> > =C2=A0=09=09/* legacy intx interrupts */
> > -=09=09pci_intx(pdev, 1);
> > +=09=09pcim_intx(pdev, 1);
> > =C2=A0=09}
> > =C2=A0=09hpriv->irq =3D pci_irq_vector(pdev, 0);
> > =C2=A0
> > diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
> > index 093b940bc953..d441246fa357 100644
> > --- a/drivers/ata/ata_piix.c
> > +++ b/drivers/ata/ata_piix.c
> > @@ -1725,7 +1725,7 @@ static int piix_init_one(struct pci_dev
> > *pdev, const struct pci_device_id *ent)
> > =C2=A0=09 * message-signalled interrupts currently).
> > =C2=A0=09 */
> > =C2=A0=09if (port_flags & PIIX_FLAG_CHECKINTR)
> > -=09=09pci_intx(pdev, 1);
> > +=09=09pcim_intx(pdev, 1);
> > =C2=A0
> > =C2=A0=09if (piix_check_450nx_errata(pdev)) {
> > =C2=A0=09=09/* This writes into the master table but it does
> > not
> > diff --git a/drivers/ata/pata_rdc.c b/drivers/ata/pata_rdc.c
> > index 0a9689862f71..09792aac7f9d 100644
> > --- a/drivers/ata/pata_rdc.c
> > +++ b/drivers/ata/pata_rdc.c
> > @@ -340,7 +340,7 @@ static int rdc_init_one(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> > =C2=A0=09=09return rc;
> > =C2=A0=09host->private_data =3D hpriv;
> > =C2=A0
> > -=09pci_intx(pdev, 1);
> > +=09pcim_intx(pdev, 1);
> > =C2=A0
> > =C2=A0=09host->flags |=3D ATA_HOST_PARALLEL_SCAN;
> > =C2=A0
> > diff --git a/drivers/ata/sata_sil24.c b/drivers/ata/sata_sil24.c
> > index 72c03cbdaff4..b771ebd41252 100644
> > --- a/drivers/ata/sata_sil24.c
> > +++ b/drivers/ata/sata_sil24.c
> > @@ -1317,7 +1317,7 @@ static int sil24_init_one(struct pci_dev
> > *pdev, const struct pci_device_id *ent)
> > =C2=A0
> > =C2=A0=09if (sata_sil24_msi && !pci_enable_msi(pdev)) {
> > =C2=A0=09=09dev_info(&pdev->dev, "Using MSI\n");
> > -=09=09pci_intx(pdev, 0);
> > +=09=09pcim_intx(pdev, 0);
> > =C2=A0=09}
> > =C2=A0
> > =C2=A0=09pci_set_master(pdev);
> > diff --git a/drivers/ata/sata_sis.c b/drivers/ata/sata_sis.c
> > index ef8724986de3..b8b6d9eff3b8 100644
> > --- a/drivers/ata/sata_sis.c
> > +++ b/drivers/ata/sata_sis.c
> > @@ -290,7 +290,7 @@ static int sis_init_one(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> > =C2=A0=09}
> > =C2=A0
> > =C2=A0=09pci_set_master(pdev);
> > -=09pci_intx(pdev, 1);
> > +=09pcim_intx(pdev, 1);
> > =C2=A0=09return ata_host_activate(host, pdev->irq,
> > ata_bmdma_interrupt,
> > =C2=A0=09=09=09=09 IRQF_SHARED, &sis_sht);
> > =C2=A0}
> > diff --git a/drivers/ata/sata_uli.c b/drivers/ata/sata_uli.c
> > index 60ea45926cd1..52894ff49dcb 100644
> > --- a/drivers/ata/sata_uli.c
> > +++ b/drivers/ata/sata_uli.c
> > @@ -221,7 +221,7 @@ static int uli_init_one(struct pci_dev *pdev,
> > const struct pci_device_id *ent)
> > =C2=A0=09}
> > =C2=A0
> > =C2=A0=09pci_set_master(pdev);
> > -=09pci_intx(pdev, 1);
> > +=09pcim_intx(pdev, 1);
> > =C2=A0=09return ata_host_activate(host, pdev->irq,
> > ata_bmdma_interrupt,
> > =C2=A0=09=09=09=09 IRQF_SHARED, &uli_sht);
> > =C2=A0}
> > diff --git a/drivers/ata/sata_vsc.c b/drivers/ata/sata_vsc.c
> > index d39b87537168..a53a2dfc1e17 100644
> > --- a/drivers/ata/sata_vsc.c
> > +++ b/drivers/ata/sata_vsc.c
> > @@ -384,7 +384,7 @@ static int vsc_sata_init_one(struct pci_dev
> > *pdev,
> > =C2=A0=09=09pci_write_config_byte(pdev, PCI_CACHE_LINE_SIZE,
> > 0x80);
> > =C2=A0
> > =C2=A0=09if (pci_enable_msi(pdev) =3D=3D 0)
> > -=09=09pci_intx(pdev, 0);
> > +=09=09pcim_intx(pdev, 0);
> > =C2=A0
> > =C2=A0=09/*
> > =C2=A0=09 * Config offset 0x98 is "Extended Control and Status
> > Register 0"
>=20
>=20


