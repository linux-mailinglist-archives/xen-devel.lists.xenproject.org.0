Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A57AF6B8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 01:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608572.947149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHQj-00008a-NS; Tue, 26 Sep 2023 23:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608572.947149; Tue, 26 Sep 2023 23:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHQj-00006k-KR; Tue, 26 Sep 2023 23:25:25 +0000
Received: by outflank-mailman (input) for mailman id 608572;
 Tue, 26 Sep 2023 23:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsZU=FK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qlHQi-00006e-9R
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 23:25:24 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3dd8436-5cc3-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 01:25:20 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D854F3200908;
 Tue, 26 Sep 2023 19:25:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 26 Sep 2023 19:25:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Sep 2023 19:25:13 -0400 (EDT)
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
X-Inumbo-ID: f3dd8436-5cc3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1695770715; x=1695857115; bh=z3SHp3HxuUJld5UuE86Yt0/XxvoKxu84Kdl
	wpthvxMI=; b=ZV6KkiNMv2TVRZPFkePl3YXSMKX7apDi+9K6irJa1QLkvg2mb59
	sfmzASOTM55axh28sG3B2tt4tSqXeGYsKzrZKw020qemybD40UWf2+wDFRnNXjex
	VK5LdxupFKzFTbkBQB1wfkv3mEjwGY2+BehqEE6290HlWkKKQiVtNVM+61UWey5X
	cWysV0Ji1WbabVQoJ/y6ACf9VzAI2ijG+3mFceTMZgFqx5f2pzMgFokHLt7lMU33
	/qq24G90eFezLKavi0uARGo50hgnFLgyeOpQHFGi8wz5zwnQpnFwiCxl/o6oLb84
	pMRDZWT1HJo6RrytOXmMhoNroRPYqEtN6Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695770715; x=1695857115; bh=z3SHp3HxuUJld
	5UuE86Yt0/XxvoKxu84KdlwpthvxMI=; b=EBr7mSBr5eBTy/QsXTovDkKgStDvx
	9oS8+t6mNtSIG4uJEZSuoDlaPrU8kykO4yDC6ZE0BmjoPrwkEBXwq0aAlQ+UjgcO
	UxYtdU6HbMIM7O6WjhSbQ8wArciFpdR0du3ueGbqOKzj9npyn2wm1zzaxE4LFl5I
	d6VnUEyvc38L/9WNdaGoP2JBSOm0ewdgPqP8xuNd0AZhagU0VjtdYaxkAyHUIRv1
	3VDNepwE28Q6tR51YJ2jRhWV/5n1b89bgW9LDCNMDEOsYmb/K4Eg2lMX3BSzwzhy
	p7aNpb1nUoHGaqBqWPD9KM5Bg2eosSbo6SG03aQ7D8ASqoS7vRd5r72zQ==
X-ME-Sender: <xms:WmgTZXBEdeAcMoHC3PMbyBrZpqRazj1abpzPIZSp1LjDbY_0G2QdkA>
    <xme:WmgTZdjfoGyqXodjSxugnedt-eoUNGyTVXK-RJRivQnGkVlJeCZien2NCNT2ox3ex
    UZkdMVjYkWQow>
X-ME-Received: <xmr:WmgTZSm3G2w38DRmfzDDIFA6psm74UoZkW5Mj1zPm7pcuVx2lW_NO5WRNkrCNmsCXGUTlmOpqxu6Uyyk17Lq6H-xMUqWArDDNFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddugddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:W2gTZZw-C5s8aq_0PZ0CcnGvQWCbk__U7CTAZ_oGoCA7pMXCL_GCaw>
    <xmx:W2gTZcSUHVqkLfJ-brlGxPoOuOaP0L80Wy4bLYwJZIVMyt-PD98INg>
    <xmx:W2gTZcYL14_e_M_dJ9whuQ0xpOdzOfq_uwVmwBHeSf4lBaKfzIo1og>
    <xmx:W2gTZXf2VPYZHKkZ2xtd2ppL32k8RfHMnDJfKJefBbW-uDiG4PRU_A>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 27 Sep 2023 01:25:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] hw/xen/xen_pt: Call default handler only if no
 custom one is set
Message-ID: <ZRNoV+dvbj5gtxVN@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <Y30DG96s9Ky1AUN0@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KAOaOS9jBIoMGKW2"
Content-Disposition: inline
In-Reply-To: <Y30DG96s9Ky1AUN0@perard.uk.xensource.com>


--KAOaOS9jBIoMGKW2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Sep 2023 01:25:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] hw/xen/xen_pt: Call default handler only if no
 custom one is set

On Tue, Nov 22, 2022 at 05:12:59PM +0000, Anthony PERARD wrote:
> On Mon, Nov 14, 2022 at 08:20:10PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> > index 0ec7e52183..269bd26109 100644
> > --- a/hw/xen/xen_pt.c
> > +++ b/hw/xen/xen_pt.c
> > @@ -255,6 +255,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, u=
int32_t addr,
> >      uint32_t find_addr =3D addr;
> >      XenPTRegInfo *reg =3D NULL;
> >      bool wp_flag =3D false;
> > +    uint32_t emul_mask =3D 0, write_val;
> > =20
> >      if (xen_pt_pci_config_access_check(d, addr, len)) {
> >          return;
> > @@ -310,7 +311,6 @@ static void xen_pt_pci_write_config(PCIDevice *d, u=
int32_t addr,
> >      }
> > =20
> >      memory_region_transaction_begin();
> > -    pci_default_write_config(d, addr, val, len);
> > =20
> >      /* adjust the read and write value to appropriate CFC-CFF window */
> >      read_val <<=3D (addr & 3) << 3;
> > @@ -370,6 +370,8 @@ static void xen_pt_pci_write_config(PCIDevice *d, u=
int32_t addr,
> >                  return;
> >              }
> > =20
> > +            emul_mask |=3D ( (1 << (reg->size * 8) ) - 1 ) << ((find_a=
ddr & 3) * 8);
> > +
> >              /* calculate next address to find */
> >              emul_len -=3D reg->size;
> >              if (emul_len > 0) {
> > @@ -396,6 +398,24 @@ static void xen_pt_pci_write_config(PCIDevice *d, =
uint32_t addr,
> >      /* need to shift back before passing them to xen_host_pci_set_bloc=
k. */
> >      val >>=3D (addr & 3) << 3;
> > =20
> > +    /* store emulated registers that didn't have specific hooks */
> > +    write_val =3D val;
> > +    for (index =3D 0; emul_mask; index +=3D emul_len) {
>=20
> `index` isn't used, was it meant to be use for something?

Yes, it should be used as addr + index below.

> > +        emul_len =3D 0;
> > +        while (emul_mask & 0xff) {
> > +            emul_len++;
>=20
> This seems to count the number of byte that have a hook
> (xen_pt_find_reg() found a `reg_entry`).
> This loop should count instead the number of bytes for which no
> `reg_entry` have been found, right? Shouldn't the loop count when a byte
> in emul_mask is unset?

No, see the patch description - only declared registers should be saved.
The patch title is misleading, I'll clarify it.

> > +            emul_mask >>=3D 8;
> > +        }
> > +        if (emul_len) {
> > +            uint32_t mask =3D ((1 << (emul_len * 8)) - 1);
> > +            pci_default_write_config(d, addr, write_val & mask, emul_l=
en);
>=20
> `addr` isn't updated in the loop, aren't we going to write bytes to the
> wrong place? If for example "emul_mask =3D=3D 0x00ff00ff" ?

Indeed, it should be addr + index.

> > +            write_val >>=3D emul_len * 8;
> > +        } else {
> > +            emul_mask >>=3D 8;
> > +            write_val >>=3D 8;
> > +        }
> > +    }
>=20
> Thanks,
>=20
> --=20
> Anthony PERARD

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--KAOaOS9jBIoMGKW2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmUTaFcACgkQ24/THMrX
1yxIMggAjmFai6SJm9RKNfxscWSdENDYpLum2YHLlNE26rRvV7CDdOW1ceW6QTxN
VT746C2zA6fL/pXkXQlCXP1a3s2qWx7fL6FX8g07DMwzawcySHuPbgmKB+41bcEM
mo7xpHAp/+Hd6+GOVY09mCXtJBZXKG68QIGHhyKtfQ4V9AOnFa9XEfYO1fbFywEf
DcVYWv2fJopi4ZR+mj47kvDl/HdT7VY+xHKU8KXIhyKtcnUO0kUI8AVvSgoZVKoP
KsqdpPRSOI/g0r29S8umIF3py+WtPG/GQ4NuwTpP0lgT0maUXXUm/759gqCcGT2y
UzeBUBbpVX4/dOupOf2Lw5fv9Y8x0w==
=KVPc
-----END PGP SIGNATURE-----

--KAOaOS9jBIoMGKW2--

