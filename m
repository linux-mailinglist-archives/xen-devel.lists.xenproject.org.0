Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A525F9A5AD7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 08:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823197.1237155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2mCu-0003nJ-5d; Mon, 21 Oct 2024 06:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823197.1237155; Mon, 21 Oct 2024 06:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2mCu-0003kZ-1w; Mon, 21 Oct 2024 06:48:00 +0000
Received: by outflank-mailman (input) for mailman id 823197;
 Mon, 21 Oct 2024 06:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JE5p=RR=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t2mCs-0003kT-3v
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 06:47:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6651b993-8f78-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 08:47:56 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-FSq77O53PxCTYm0ykJzBiw-1; Mon, 21 Oct 2024 02:47:50 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-431604a3b47so23449675e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Oct 2024 23:47:50 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d449800aee93296d73e68da.dip.versatel-1u1.de.
 [2001:16b8:2d44:9800:aee9:3296:d73e:68da])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f570f89sm45821675e9.7.2024.10.20.23.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 23:47:48 -0700 (PDT)
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
X-Inumbo-ID: 6651b993-8f78-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729493274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=teyMIfpNNQjSsb5MbXyVqzP1VIlH5kdTfogRdrP4p8U=;
	b=H6yyz7ZQHfOJWxDQybm0UBGe0/oNi9DhJrT6zT7tpjtTexTcwOt0JzQY8Amy4NLVvnVbjA
	Xi2DatgmBicfvR3VXskiKwJhoV3hy3sOnt5UHDm3IIVCiL+6grEtWOk5WBE54nubgIXcXi
	QBWW19Wvy8uPGrR8ZoWXTz7SD4722Ao=
X-MC-Unique: FSq77O53PxCTYm0ykJzBiw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729493269; x=1730098069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teyMIfpNNQjSsb5MbXyVqzP1VIlH5kdTfogRdrP4p8U=;
        b=DSm/LWnZTtuFpTdnPsoBBIQyF2B2O5wyJoU/Hn9CyYZPVQbOljyyRHBEH0uACp5JOC
         VK/SZYz7toL7Y9016kAHdQdqBwqVSmHFvm+hJOsKhXy/wsEUXekk44mssgyQcYCBSqeY
         rh3IaShBGA7t7fuyPr9duvDxQsG4QDNUDxcuccwCH9rn6UwbHubs+CiJwyaKRcrs4iys
         5sCXjbZnUlNNuAzBK0/lPxfck2ySKSiaWY3vdXVT7988RjPIKEek2aM5ISAHPKU4b/0B
         BEIt7kST9NVopY5DEFUEzbUKWQt57+QF2r3ktGAJF4MLqgwOYN9vNcQrBs69QCTkUe64
         wx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9bUvPh89TbDLrDeLWKneMhbNcrPgaXfmYoU4BCHDJp/Be2idmc7cpmbjTArRHBTTJoHjh2yW1gvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7psqHY2h+QSQH5Ad5ZRFTbDl1ptrJGHwx2lQlQj6bNVaxSy2K
	d0cOd50NaxiBA+l6+WC+fXbzDQRYUBYtQJgel6NJEEy31JZOyC+6Gr8TxdHiKIrJu6/h59ondYO
	ORPk05TfL75y24l7j3J0YNIIFhKQpjlEGeDEL0gv7/2OGN+TSelFKbTLtCdhIpUDT
X-Received: by 2002:a05:600c:3591:b0:431:4c14:abf4 with SMTP id 5b1f17b1804b1-4316163a1b2mr84025645e9.14.1729493269429;
        Sun, 20 Oct 2024 23:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVZgn1S+/IbVUHVqZogTbkz5rvgpgAowACslYYkYZ99T9pAyCEi5NExPZQP+nHcWcbmjh9Bw==
X-Received: by 2002:a05:600c:3591:b0:431:4c14:abf4 with SMTP id 5b1f17b1804b1-4316163a1b2mr84025225e9.14.1729493268971;
        Sun, 20 Oct 2024 23:47:48 -0700 (PDT)
Message-ID: <1f90d885f0e8dc2e8d9b2b7e88700b4cdb19d84c.camel@redhat.com>
Subject: Re: [PATCH 13/13] PCI: Deprecate pci_intx(), pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Alex Williamson
 <alex.williamson@redhat.com>, Damien Le Moal <dlemoal@kernel.org>, Niklas
 Cassel <cassel@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Basavaraj
 Natikar <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,  Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>,  Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>,  Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>,  Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>,  Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu
 <yi.l.liu@intel.com>, Christian Brauner <brauner@kernel.org>, Ankit Agrawal
 <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Rui Salvaterra <rsalvaterra@gmail.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Mon, 21 Oct 2024 08:47:46 +0200
In-Reply-To: <20241018234537.GA770692@bhelgaas>
References: <20241018234537.GA770692@bhelgaas>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-10-18 at 18:45 -0500, Bjorn Helgaas wrote:
> On Wed, Oct 16, 2024 at 10:53:16AM +0200, Philipp Stanner wrote:
> > On Wed, 2024-10-16 at 10:43 +0200, Heiner Kallweit wrote:
> > > On 16.10.2024 08:57, Philipp Stanner wrote:
> > > > On Tue, 2024-10-15 at 13:53 -0600, Alex Williamson wrote:
> > > > > On Tue, 15 Oct 2024 20:51:23 +0200
> > > > > Philipp Stanner <pstanner@redhat.com> wrote:
> > > > >=20
> > > > > > pci_intx() and its managed counterpart pcim_intx() only
> > > > > > exist
> > > > > > for
> > > > > > older
> > > > > > drivers which have not been ported yet for various reasons.
> > > > > > Future
> > > > > > drivers should preferably use pci_alloc_irq_vectors().
> > > > > >=20
> > > > > > Mark pci_intx() and pcim_intx() as deprecated and encourage
> > > > > > usage
> > > > > > of
> > > > > > pci_alloc_irq_vectors() in its place.
> > > > >=20
> > > > > I don't really understand this.=C2=A0 As we've discussed
> > > > > previously
> > > > > pci_alloc_irq_vectors() is, unsurprisingly, for allocating
> > > > > PCI
> > > > > IRQ
> > > > > vectors while pci_intx() is for manipulating the INTx disable
> > > > > bit
> > > > > on
> > > > > PCI devices.=C2=A0 The latter is a generic mechanism for
> > > > > preventing
> > > > > PCI
> > > > > devices from generating INTx, regardless of whether there's a
> > > > > vector
> > > > > allocated for it.=C2=A0 How does the former replace the latter an=
d
> > > > > why
> > > > > do
> > > > > we
> > > > > feel the need to deprecate the latter?
> > > > >=20
> > > > > It feels like this fits some narrow narrative and makes all
> > > > > users
> > > > > of
> > > > > these now deprecated functions second class citizens.=C2=A0 Why?=
=C2=A0
> > > > > At
> > > > > it's
> > > > > root these are simply providing mask and set or mask and
> > > > > clear
> > > > > register
> > > > > bit operations.=C2=A0 Thanks,
> > > >=20
> > > > I got the feeling from the RFC discussion that that was
> > > > basically
> > > > the
> > > > consensus: people should use pci_alloc_irq_vectors(). Or did I
> > > > misunderstand Andy and Heiner?
> > > >=20
> > > I think there are two different use cases for pci_intx().
> > > At first there are several drivers where the direct usage of
> > > pci_intx()
> > > can be eliminated by switching to the pci_alloc_irq_vectors()
> > > API.
> > >=20
> > > And then there's usage of pci_intx() in
> > > drivers/vfio/pci/vfio_pci_intrs.c
> > > drivers/xen/xen-pciback/conf_space_header.c
> > > There we have to keep the (AFAICS unmanaged) pci_intx() calls.
> >=20
> > There is also the usage within PCI itself, in MSI. Patch =E2=84=968 tou=
ches
> > that.
> >=20
> > It's why I think this series should land before anyone should port
> > direct pci_intx() users to the irq vectors function, because the
> > latter
> > also uses pci_intx() and its own devres, which sounds explosive to
> > me.
> >=20
> > > > I'm perfectly happy with dropping this patch and continue
> > > > offering
> > > > pci{m}_intx() to users, since after removing that hybrid
> > > > hazzard I
> > > > don't see any harm in them anymore.
>=20
> So is the bottom line that we should drop *this* patch and apply the
> rest of the series?

Yes Sir, that's the idea

Regards,
P.

>=20
> > > > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > > > ---
> > > > > > =C2=A0drivers/pci/devres.c | 5 ++++-
> > > > > > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0 | 5 ++++-
> > > > > > =C2=A02 files changed, 8 insertions(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> > > > > > index 6f8f712fe34e..4c76fc063104 100644
> > > > > > --- a/drivers/pci/devres.c
> > > > > > +++ b/drivers/pci/devres.c
> > > > > > @@ -435,7 +435,7 @@ static struct pcim_intx_devres
> > > > > > *get_or_create_intx_devres(struct device *dev)
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > > > =C2=A0/**
> > > > > > - * pcim_intx - managed pci_intx()
> > > > > > + * pcim_intx - managed pci_intx() (DEPRECATED)
> > > > > > =C2=A0 * @pdev: the PCI device to operate on
> > > > > > =C2=A0 * @enable: boolean: whether to enable or disable PCI INT=
x
> > > > > > =C2=A0 *
> > > > > > @@ -443,6 +443,9 @@ static struct pcim_intx_devres
> > > > > > *get_or_create_intx_devres(struct device *dev)
> > > > > > =C2=A0 *
> > > > > > =C2=A0 * Enable/disable PCI INTx for device @pdev.
> > > > > > =C2=A0 * Restore the original state on driver detach.
> > > > > > + *
> > > > > > + * This function is DEPRECATED. Do not use it in new code.
> > > > > > + * Use pci_alloc_irq_vectors() instead (there is no
> > > > > > managed
> > > > > > version, currently).
> > > > > > =C2=A0 */
> > > > > > =C2=A0int pcim_intx(struct pci_dev *pdev, int enable)
> > > > > > =C2=A0{
> > > > > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > > > > index 7ce1d0e3a1d5..dc69e23b8982 100644
> > > > > > --- a/drivers/pci/pci.c
> > > > > > +++ b/drivers/pci/pci.c
> > > > > > @@ -4477,11 +4477,14 @@ void pci_disable_parity(struct
> > > > > > pci_dev
> > > > > > *dev)
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > > > =C2=A0/**
> > > > > > - * pci_intx - enables/disables PCI INTx for device dev
> > > > > > + * pci_intx - enables/disables PCI INTx for device dev
> > > > > > (DEPRECATED)
> > > > > > =C2=A0 * @pdev: the PCI device to operate on
> > > > > > =C2=A0 * @enable: boolean: whether to enable or disable PCI INT=
x
> > > > > > =C2=A0 *
> > > > > > =C2=A0 * Enables/disables PCI INTx for device @pdev
> > > > > > + *
> > > > > > + * This function is DEPRECATED. Do not use it in new code.
> > > > > > + * Use pci_alloc_irq_vectors() instead.
> > > > > > =C2=A0 */
> > > > > > =C2=A0void pci_intx(struct pci_dev *pdev, int enable)
> > > > > > =C2=A0{
> > > > >=20
> > > >=20
> > > >=20
> > >=20
> >=20
>=20


