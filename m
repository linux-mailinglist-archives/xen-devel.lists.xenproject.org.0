Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB679A01F3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 08:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819560.1232937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0xz5-0002A5-Fn; Wed, 16 Oct 2024 06:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819560.1232937; Wed, 16 Oct 2024 06:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0xz5-00027y-Cw; Wed, 16 Oct 2024 06:58:15 +0000
Received: by outflank-mailman (input) for mailman id 819560;
 Wed, 16 Oct 2024 06:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4YY=RM=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t0xz3-00027s-Je
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 06:58:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018dce70-8b8c-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 08:58:12 +0200 (CEST)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-QTbjnE6aPvW1H0F5b4SexQ-1; Wed, 16 Oct 2024 02:58:08 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b111381632so1218010085a.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 23:58:08 -0700 (PDT)
Received: from dhcp-64-113.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b136164dfbsm149785985a.21.2024.10.15.23.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 23:58:06 -0700 (PDT)
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
X-Inumbo-ID: 018dce70-8b8c-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729061890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKJfP3LmeT/Qx7oKj5HM871IgPtYRSHVMsPL1c0DDh4=;
	b=SWPbKKIqFoYNjjorH0UKxHv0jCyI1GQkI45hBGuDys0NoTikS8kmva40Eh9tMiHnnvW24E
	tLabImLUtymRn7VXRahJDtg9yJlNp3rlNqpYkmn6VF4G1aRb8e9jhx32yCNblfR++3BoPR
	1a1Ag03LcaEb+SQZmvfgw5XOZ7ikqEU=
X-MC-Unique: QTbjnE6aPvW1H0F5b4SexQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729061887; x=1729666687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKJfP3LmeT/Qx7oKj5HM871IgPtYRSHVMsPL1c0DDh4=;
        b=lzzbL3f5TwOn0g9Xd2DyK6/ZyHW/V+mImeduabuDM9AqOKPgkmsM/Hi7SjS0+yi3jB
         XMNiTsyHO9O1KXhOZM5qeKseWrkxH1Qin+kaMhc7NaLkoPEm4y3adzwoJ/0nHpp4Bf8+
         JQUX0XW1NREtA0YKOF/lrJdLSI8hTldAIf+cNcQJckptXWPEImZxZznQ0sgWIvHtl172
         l+nSJeQj8k28TVHoOZ/FVnisRLetQzPy2xWo9u+bOaOtH2DhBbHHX38pjd4fow5sJ8lh
         vNz1GZcxNyeVAW7OwTCL3MhdZ1rvqSTn7k/Wtj3oo+TRZ6knWvqkFOMVUmNej/wsSshM
         gjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4N7WPSE/2+RnjuU/kFa5BXhkXxTsf2F3RQmFRKyILPzRbpSq3XEn9ZVUBOQ0fsMwS3OIawqHmup4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM2Rwb5I5BPmuFZtwHU47/2VZbkZ/NI4vRQ/83014Qolzz+UCg
	50tp+hWhd3Lh328tQhJaW85yDfSf2tG6MJJxWDJwNQaAHTCs9H8cxaHWrLoCADU74eSmfk6GDCQ
	BpyfYKasYLXNLyysVFxOVLqkA8LXZHduH48QWsmP+Ym5LN1J56tKjLphwo1FqEs55
X-Received: by 2002:a05:620a:400d:b0:7a1:62ad:9d89 with SMTP id af79cd13be357-7b14186f1c8mr461444285a.64.1729061887540;
        Tue, 15 Oct 2024 23:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcw8kz1/9R04Vwhhq2lqNVDk3gX6xFnXYOAV6a2cL/WNRAli0C59zaADhpNPO2+u1Q91URSw==
X-Received: by 2002:a05:620a:400d:b0:7a1:62ad:9d89 with SMTP id af79cd13be357-7b14186f1c8mr461441885a.64.1729061887092;
        Tue, 15 Oct 2024 23:58:07 -0700 (PDT)
Message-ID: <fc7244823a5665d3db40c94aea099a2973032a0b.camel@redhat.com>
Subject: Re: [PATCH 13/13] PCI: Deprecate pci_intx(), pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
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
Date: Wed, 16 Oct 2024 08:57:58 +0200
In-Reply-To: <20241015135336.0de9795e.alex.williamson@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-14-pstanner@redhat.com>
	 <20241015135336.0de9795e.alex.williamson@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-10-15 at 13:53 -0600, Alex Williamson wrote:
> On Tue, 15 Oct 2024 20:51:23 +0200
> Philipp Stanner <pstanner@redhat.com> wrote:
>=20
> > pci_intx() and its managed counterpart pcim_intx() only exist for
> > older
> > drivers which have not been ported yet for various reasons. Future
> > drivers should preferably use pci_alloc_irq_vectors().
> >=20
> > Mark pci_intx() and pcim_intx() as deprecated and encourage usage
> > of
> > pci_alloc_irq_vectors() in its place.
>=20
> I don't really understand this.=C2=A0 As we've discussed previously
> pci_alloc_irq_vectors() is, unsurprisingly, for allocating PCI IRQ
> vectors while pci_intx() is for manipulating the INTx disable bit on
> PCI devices.=C2=A0 The latter is a generic mechanism for preventing PCI
> devices from generating INTx, regardless of whether there's a vector
> allocated for it.=C2=A0 How does the former replace the latter and why do
> we
> feel the need to deprecate the latter?
>=20
> It feels like this fits some narrow narrative and makes all users of
> these now deprecated functions second class citizens.=C2=A0 Why?=C2=A0 At=
 it's
> root these are simply providing mask and set or mask and clear
> register
> bit operations.=C2=A0 Thanks,

I got the feeling from the RFC discussion that that was basically the
consensus: people should use pci_alloc_irq_vectors(). Or did I
misunderstand Andy and Heiner?

I'm perfectly happy with dropping this patch and continue offering
pci{m}_intx() to users, since after removing that hybrid hazzard I
don't see any harm in them anymore.


P.

>=20
> Alex
> =C2=A0
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0drivers/pci/devres.c | 5 ++++-
> > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0 | 5 ++++-
> > =C2=A02 files changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> > index 6f8f712fe34e..4c76fc063104 100644
> > --- a/drivers/pci/devres.c
> > +++ b/drivers/pci/devres.c
> > @@ -435,7 +435,7 @@ static struct pcim_intx_devres
> > *get_or_create_intx_devres(struct device *dev)
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > - * pcim_intx - managed pci_intx()
> > + * pcim_intx - managed pci_intx() (DEPRECATED)
> > =C2=A0 * @pdev: the PCI device to operate on
> > =C2=A0 * @enable: boolean: whether to enable or disable PCI INTx
> > =C2=A0 *
> > @@ -443,6 +443,9 @@ static struct pcim_intx_devres
> > *get_or_create_intx_devres(struct device *dev)
> > =C2=A0 *
> > =C2=A0 * Enable/disable PCI INTx for device @pdev.
> > =C2=A0 * Restore the original state on driver detach.
> > + *
> > + * This function is DEPRECATED. Do not use it in new code.
> > + * Use pci_alloc_irq_vectors() instead (there is no managed
> > version, currently).
> > =C2=A0 */
> > =C2=A0int pcim_intx(struct pci_dev *pdev, int enable)
> > =C2=A0{
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 7ce1d0e3a1d5..dc69e23b8982 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -4477,11 +4477,14 @@ void pci_disable_parity(struct pci_dev
> > *dev)
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > - * pci_intx - enables/disables PCI INTx for device dev
> > + * pci_intx - enables/disables PCI INTx for device dev
> > (DEPRECATED)
> > =C2=A0 * @pdev: the PCI device to operate on
> > =C2=A0 * @enable: boolean: whether to enable or disable PCI INTx
> > =C2=A0 *
> > =C2=A0 * Enables/disables PCI INTx for device @pdev
> > + *
> > + * This function is DEPRECATED. Do not use it in new code.
> > + * Use pci_alloc_irq_vectors() instead.
> > =C2=A0 */
> > =C2=A0void pci_intx(struct pci_dev *pdev, int enable)
> > =C2=A0{
>=20


