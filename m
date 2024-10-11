Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837199A3E1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 14:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817013.1231126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEkQ-0005ZH-UX; Fri, 11 Oct 2024 12:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817013.1231126; Fri, 11 Oct 2024 12:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szEkQ-0005Wr-Rn; Fri, 11 Oct 2024 12:27:58 +0000
Received: by outflank-mailman (input) for mailman id 817013;
 Fri, 11 Oct 2024 12:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAGb=RH=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1szEkP-0005WV-TF
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 12:27:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d9b656a-87cc-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 14:27:55 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-2RP47B15O3-6cNQJCgchMw-1; Fri, 11 Oct 2024 08:27:53 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4311407ae76so9783625e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 05:27:53 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d05:4700:3e59:7d70:cabd:144b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4311835d95bsm40843965e9.47.2024.10.11.05.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 05:27:51 -0700 (PDT)
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
X-Inumbo-ID: 3d9b656a-87cc-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728649674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxSLZfxQcQp5nvJu2lLsZnWBlpOwrXCfyPfNteYGXaQ=;
	b=E60s6Eir7Y59R5ECIPpCR387cwcQhZGD2BriEh7LbYMp1F6eaK+/w4mNLuqSmIHWP/wuzp
	KvuS4HY+S5+HsRevpAS42cHw3rURQ9phfYwmLvjHdhPnFeBAbunN2kNRmcA3RdS5jdpeEC
	400tGhpnTpYgrYc1KhqUplcs+seeyNQ=
X-MC-Unique: 2RP47B15O3-6cNQJCgchMw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649672; x=1729254472;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvgPP8URR3aRLLAeRhIGd9GfEadFvbPu0wTLuyU+TtY=;
        b=ioRRAUzXoKzmk25AHk9vCd37f5X9Vr8II6Y03AcXpHXrnw9h9sBQ5i+71K7TDCsIbw
         cWQ6w2P1NNUEZR+3uz835SLeVWXfwxhi0Ar62Upt8947BOuBxTAWP/RZBKwAhQOGGbqa
         MQiQnDkqLp0kDXf+SMig+m8cKKr8Y91dA+DILcmbloE47pBuDrScCn5JBj71xFj695xc
         MuwBnX4olujkjJMFqsmZEJaCLy2ELVCM9ZaPcpkikX7ETsg47B1owcacaOFosI8M1GZA
         n+aUgKehjsj3d1myV0om6VhvWEhKmaOdj/QmV54ImBf6XfWFCq/xLFH0EvLPq5Txpw3i
         V3sg==
X-Forwarded-Encrypted: i=1; AJvYcCXHvrn/8Yy6ns13nGTI/Rhpzhjmr0GqlNoISJT4e7F2kmEO3iD+JlQMxxmycCFZMFbvzFj6LaiL29E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLM1v8zGlEA6eEnhgYR7l5+G/1YUwaL2jNNZwVjvbTHh+LkyON
	wABIGh9jM/ZW3ENAPWDtgMK9F/mo83HEO54fw2s1rluPhsm881crq1s8b67jK2RsvxYjnkNepb6
	w8pLVMpKbuDLmtqodQnVT7Qpl+qef5eCKKA2paw8umZe16cdWJtLMDRlLyMfZDIrs
X-Received: by 2002:a05:600c:1f8c:b0:430:c3a5:652a with SMTP id 5b1f17b1804b1-4311ded53cbmr16268155e9.12.1728649672183;
        Fri, 11 Oct 2024 05:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgVv3RNAOR2FC6mKD8YlkQf/6eOtik4XN5FWpHDbbO6uoNEPOtTgURod1/yDncIWXirvGTnQ==
X-Received: by 2002:a05:600c:1f8c:b0:430:c3a5:652a with SMTP id 5b1f17b1804b1-4311ded53cbmr16267425e9.12.1728649671758;
        Fri, 11 Oct 2024 05:27:51 -0700 (PDT)
Message-ID: <b13b75ae16b5238ab8b6e6d6e7a0797ed8415e80.camel@redhat.com>
Subject: Re: [RFC PATCH 02/13] ALSA: hda: hda_intel: Use always-managed
 version of pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, Chen
 Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Hannes Reinecke <hare@suse.de>, John Garry
 <john.g.garry@oracle.com>, Soumya Negi <soumya.negi97@gmail.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Rui Salvaterra <rsalvaterra@gmail.com>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-input@vger.kernel.org,
 netdev@vger.kernel.org,  linux-wireless@vger.kernel.org,
 ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-staging@lists.linux.dev, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Date: Fri, 11 Oct 2024 14:27:48 +0200
In-Reply-To: <Zwfo4dr4bfqQGGyl@smile.fi.intel.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
	 <20241009083519.10088-3-pstanner@redhat.com>
	 <Zwfo4dr4bfqQGGyl@smile.fi.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-10-10 at 17:46 +0300, Andy Shevchenko wrote:
> On Wed, Oct 09, 2024 at 10:35:08AM +0200, Philipp Stanner wrote:
> > pci_intx() is a hybrid function which can sometimes be managed
> > through
> > devres. To remove this hybrid nature from pci_intx(), it is
> > necessary to
> > port users to either an always-managed or a never-managed version.
> >=20
> > hda_intel enables its PCI-Device with pcim_enable_device(). Thus,
> > it needs
> > the always-managed version.
> >=20
> > Replace pci_intx() with pcim_intx().
>=20
> ...
>=20
> > =C2=A0=09bus->irq =3D chip->pci->irq;
> > =C2=A0=09chip->card->sync_irq =3D bus->irq;
> > -=09pci_intx(chip->pci, !chip->msi);
> > +=09pcim_intx(chip->pci, !chip->msi);
> > =C2=A0=09return 0;
>=20
> I believe each driver needs an individual approach. Looking at the
> above
> I would first to understand why this one is being used and why we
> can't
> switch to pci{m}_alloc_irq_vectors(). (Yeah, managed
> pci_alloc_irq_vectors()
> is probably still missing, I don't remember if you introduced it or
> not.
>=20

Alright alright =E2=80=93 we touched it in the other mail briefly, but let =
me
point out another specific problem:

pci_alloc_irq_vectors() *uses* pci_intx(). And pci_intx() can be
managed sometimes.

See the problem? :(

So it's not just that I couldn't port the driver Alex is concerned
about, it's also that MSI itself is a user of pci_intx().

So a pcim_alloc_irq_vectors() might end up doing double-devres or God
knows what else. Only once pci_intx() is clean one can start thinking
about the code in pci/msi/

It's the biggest reason why I want to clean it up as suggested here,
and also why the only patch I'm really nervous about is number 8.


P.


