Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A049ACB9B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 15:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824683.1238847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3bkh-0000jR-43; Wed, 23 Oct 2024 13:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824683.1238847; Wed, 23 Oct 2024 13:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3bkh-0000gH-0w; Wed, 23 Oct 2024 13:50:19 +0000
Received: by outflank-mailman (input) for mailman id 824683;
 Wed, 23 Oct 2024 13:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uSz=RT=redhat.com=pstanner@srs-se1.protection.inumbo.net>)
 id 1t3bkf-0000gB-S3
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 13:50:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb51b244-9145-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 15:50:16 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-VWU3WUWKOciiiZ9qMlobJg-1; Wed, 23 Oct 2024 09:50:13 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4315e8e9b1cso5513165e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 06:50:13 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dac:2f00:8834:dd3a:39b8:e43b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186be7605sm16955265e9.19.2024.10.23.06.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 06:50:11 -0700 (PDT)
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
X-Inumbo-ID: bb51b244-9145-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729691415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/+dEQYx4WTT1/4z8YC1ihy31/3sJwq8UjrD+U04yBQ=;
	b=MkJqzqTMbLSoJbNMxJxMW6/vliEp7n689TifMbbNPh7UkEV98gGqZVqowSRRuP1eqKWFa6
	ddXuplVWxO+//lYZ2F4S4JjKACXxTBXBeUoBW7TLDawx20as2w5hY4aeoqhUHkxkuCPCaM
	WAeyWSXoeG65REeXmCg4XSjfvYRfXqU=
X-MC-Unique: VWU3WUWKOciiiZ9qMlobJg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729691412; x=1730296212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oO7/c3KxFQ4pCLrpHRIQyFFVX9SeNU/L27HBNV7OVps=;
        b=DTY4UJBJ+tf/evTFJ1YW6jHtd6lt3k3mTdOUV7BlZeePRww7wcrURS98Fu8LOjh4GJ
         PxJQJRjXKNSSHFVqtH5lXH88qQbQALgxJUSGLh3wC0K00AEa98ZUIrEKw6cCpPQrGkIr
         9n/oaPeQPC7OtndavPDtQN1LwmJCbxTVj8svimslA1CLqCubquG3Dy0QHUWlC4blN2FF
         vIUxPaEarOIjDRWabB63epWIVB/iPKFnRiubRlKh5KgzDxSFmQxdlpu32tRksayWRhL7
         mCONZl2RXCHBuPCq73CiRhyzgU9sctdrrADRE3bqjjZrUtW5L/p+JNJsekGgbdCOObv1
         gafQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHoerYp4HpBlihXzuvpcWk1hyB88vKRRi/BwyF8dE4Ujx1xjknyb/XM2cxSYOut9xxLHOrqikWzzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLy9Gh13BPJdDNLXGGMhhBEifYAggSbicZDAKSBEaB6UeWKA2L
	yqvFLhn7GANbWTXeywTkJPjmU0sseetk9RlmUuNq24/OKeaqooxR9izvDqbOPuWVkPvYg3Ur8z/
	VHzXXoPlrccCTASSFmxsYe91+cJZCQ42+xxgcly0xZAJxivyK6nxrnWDllvoIRCPu
X-Received: by 2002:a05:600c:4f43:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-4317bd88469mr48316755e9.9.1729691412237;
        Wed, 23 Oct 2024 06:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVbS2v+nb51IE57ofZXQEpzrUukFuey0NWkF8DOXs6/K2mGsAvF2UpvyCTTgP3Onw94z3R5g==
X-Received: by 2002:a05:600c:4f43:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-4317bd88469mr48316115e9.9.1729691411741;
        Wed, 23 Oct 2024 06:50:11 -0700 (PDT)
Message-ID: <6f3db65fe9a5dcd1a7a8d9bd5352ecb248ef57b1.camel@redhat.com>
Subject: Re: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of
 pcim_intx()
From: Philipp Stanner <pstanner@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
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
 Iwai <tiwai@suse.com>, Chen Ni <nichen@iscas.ac.cn>, Mario Limonciello
 <mario.limonciello@amd.com>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mostafa Saleh
 <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu
 <yi.l.liu@intel.com>,  Christian Brauner <brauner@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Eric Auger <eric.auger@redhat.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, Marek
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
Date: Wed, 23 Oct 2024 15:50:09 +0200
In-Reply-To: <87v7xk2ps5.wl-tiwai@suse.de>
References: <20241015185124.64726-1-pstanner@redhat.com>
	 <20241015185124.64726-3-pstanner@redhat.com> <87v7xk2ps5.wl-tiwai@suse.de>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-10-22 at 16:08 +0200, Takashi Iwai wrote:
> On Tue, 15 Oct 2024 20:51:12 +0200,
> Philipp Stanner wrote:
> >=20
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
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0sound/pci/hda/hda_intel.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index b4540c5cd2a6..b44ca7b6e54f 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx *chip,
> > int do_disconnect)
> > =C2=A0=09}
> > =C2=A0=09bus->irq =3D chip->pci->irq;
> > =C2=A0=09chip->card->sync_irq =3D bus->irq;
> > -=09pci_intx(chip->pci, !chip->msi);
> > +=09pcim_intx(chip->pci, !chip->msi);
> > =C2=A0=09return 0;
> > =C2=A0}
> > =C2=A0
>=20
> Hm, it's OK-ish to do this as it's practically same as what
> pci_intx()
> currently does.=C2=A0 But, the current code can be a bit inconsistent
> about
> the original intx value.=C2=A0 pcim_intx() always stores !enable to
> res->orig_intx unconditionally, and it means that the orig_intx value
> gets overridden at each time pcim_intx() gets called.

Yes.

>=20
> Meanwhile, HD-audio driver does release and re-acquire the interrupt
> after disabling MSI when something goes wrong, and pci_intx() call
> above is a part of that procedure.=C2=A0 So, it can rewrite the
> res->orig_intx to another value by retry without MSI.=C2=A0 And after the
> driver removal, it'll lead to another state.

I'm not sure that I understand this paragraph completely. Still, could
a solution for the driver on the long-term just be to use pci_intx()?

>=20
> In anyway, as it doesn't change the current behavior, feel free to
> take my ack for now:
>=20
> Acked-by: Takashi Iwai <tiwai@suse.de>

Thank you,
P.

>=20
>=20
> thanks,
>=20
> Takashi
>=20


