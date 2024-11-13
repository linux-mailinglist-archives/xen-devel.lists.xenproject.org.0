Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E790C9C785F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 17:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835883.1251746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFyF-0004kq-3C; Wed, 13 Nov 2024 16:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835883.1251746; Wed, 13 Nov 2024 16:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFyE-0004i7-W9; Wed, 13 Nov 2024 16:11:54 +0000
Received: by outflank-mailman (input) for mailman id 835883;
 Wed, 13 Nov 2024 16:11:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFXx=SI=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1tBFyD-0004i1-OJ
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 16:11:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f82996-a1d9-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 17:11:43 +0100 (CET)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-oQwWsjVIP4iL5qnFuOHiDw-1; Wed, 13 Nov 2024 11:11:41 -0500
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6cdeeb785c8so116375416d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 08:11:41 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d3966303e6sm86017386d6.99.2024.11.13.08.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 08:11:39 -0800 (PST)
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
X-Inumbo-ID: f8f82996-a1d9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE3MC4xMC4xMzMuMTI0IiwiaGVsbyI6InVzLXNtdHAtZGVsaXZlcnktMTI0Lm1pbWVjYXN0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImY4ZjgyOTk2LWExZDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTE0MzAzLjk3NjU1Nywic2VuZGVyIjoicHN0YW5uZXJAcmVkaGF0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731514302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JShsxBODe/ZYse/45GbByklsWCzNPukdA1ZXffLLLQ=;
	b=Ha4c389wJisbKWLdI0cfSAwezPF67AWSmaGWnVhMD0f5X/eiqjFEFbA6RyIDJ18neI+z71
	gpBUA2c2O8uhKvc0AyIGDwMMjNKWXCrhOKqvD83pTQ8I/e2me0OxlfvFwJTVppm7M8oJ0R
	AHQsGuRbRLStD/2Pt/+LiRZSFI1G9ms=
X-MC-Unique: oQwWsjVIP4iL5qnFuOHiDw-1
X-Mimecast-MFC-AGG-ID: oQwWsjVIP4iL5qnFuOHiDw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731514301; x=1732119101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JShsxBODe/ZYse/45GbByklsWCzNPukdA1ZXffLLLQ=;
        b=qAxdihr+FvIU9zj/D5MEeuhUowyyQIzChqS/eal6t7K+akUNbvHiaXYY992O4quY6N
         YqDG9DQ15PgU8/Ui4wBYMqe6+g1r7p/+otmmLelVm9n4vlHrhziHix8eIx5uwB3x6tnH
         JqanpqRHjnY+plSnp3UJKNVvSCSVpt7cm3bbHlgq4CFno32pw0WLweqafNnPuRfxtMfv
         VyLEou3hSxsHlKw8hA8dmqk8hwPYUiVUpZfXjeqbaLkHXBgKtww1Fu69S1n//a1BtYzK
         shtEtBf9zYOcw3ztfWnZS572uvSvdlzNH3v9O/s47KL21VpnCMxfEPyU9tx0WRzy4UIZ
         0XtA==
X-Forwarded-Encrypted: i=1; AJvYcCXzrb7VGAZ88vYbEfO84i4xLrqe4AdzYVhc0WECISqyquHAQd76j3EzdpiuzQyhNStFv2C6MMerrk0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQaikbcMPI7qgyxORiPorDNdT5//RhofwW0bagOcbfMy8mY341
	ebRqosf7RKNFyO+1xg7Tfa7/A33KBh2GwBWnnv3BTLMzAvczv1y9uXHqlFT+G0v1ve6VghzU7/n
	bkp5eHCDbpOJJmbK/iERPOS5p/FViOBarv/HLFluU5nZy7XvUcfPPW6mrDj8OKBuy
X-Received: by 2002:a05:6214:5987:b0:6d3:68df:f62d with SMTP id 6a1803df08f44-6d39e10946emr297208076d6.2.1731514300883;
        Wed, 13 Nov 2024 08:11:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnbeg7ogUgcEGRAzWAPJHQLp75DRK8IjefSxWG9p6JZ9o7VJOC4JF6vdJYqufewnJd395bRA==
X-Received: by 2002:a05:6214:5987:b0:6d3:68df:f62d with SMTP id 6a1803df08f44-6d39e10946emr297207096d6.2.1731514300322;
        Wed, 13 Nov 2024 08:11:40 -0800 (PST)
Message-ID: <2f94dd0f0bfef8d51f1ced78a9b5db8e2ce48429.camel@redhat.com>
Subject: Re: [PATCH v2 01/11] PCI: Prepare removing devres from pci_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>,  Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>,  Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>, Ricky Wu
 <ricky_wu@realtek.com>,  Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao
 <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kunwu Chan
 <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>, Christian Brauner
 <brauner@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, Eric
 Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org,  kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Wed, 13 Nov 2024 17:11:29 +0100
In-Reply-To: <87plmzktn3.ffs@tglx>
References: <20241113124158.22863-2-pstanner@redhat.com>
	 <20241113124158.22863-3-pstanner@redhat.com> <87plmzktn3.ffs@tglx>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sXtRbcH0YpcqHH_Rtc71nslTPoWWALj1CaAjeHwLnHA_1731514301
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-11-13 at 17:04 +0100, Thomas Gleixner wrote:
> On Wed, Nov 13 2024 at 13:41, Philipp Stanner wrote:
> > +/**
> > + * pci_intx_unmanaged - enables/disables PCI INTx for device dev,
> > + * unmanaged version
> > + * @pdev: the PCI device to operate on
> > + * @enable: boolean: whether to enable or disable PCI INTx
>=20
> Except that the argument is of type int, which really should be type
> bool.

True, but this is a *temporary* copy of pci_intx(), a ~16 year old
function. Older C programmers had the habit of for some reason using
32-bit integers for a true/false boolean all the time.

We _could_ think of changing pci_intx()'s parameter to a boolean, but I
think it wouldn't really improve things very much

see also below

>=20
> > + * Enables/disables PCI INTx for device @pdev
> > + *
> > + * This function behavios identically to pci_intx(), but is never
> > managed with
> > + * devres.
>=20
> behavios?

-> behaves. Will fix.

>=20
> > + */
> > +void pci_intx_unmanaged(struct pci_dev *pdev, int enable)
>=20
> I find this function name mildy confusing. This _unmanaged suffix is
> not
> really telling me anything. And the reference that this behaves
> identically to pci_intx() makes it even worse.
>=20
> This function is about controlling the PCI INTX_DISABLE bit in the
> PCI_COMMAND config word, right?
>=20
> So naming it pci_intx_control() would make it entirely clear what
> this
> is about, no?

We had this conversation last week. I answered on that already, maybe
you have overlooked it:

https://lore.kernel.org/all/a8d9f32f60f55c58d79943c4409b8b94535ff853.camel@=
redhat.com/


Please also take a look at patch 11, then you'll see the full picture

Danke,
Philipp

>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20


