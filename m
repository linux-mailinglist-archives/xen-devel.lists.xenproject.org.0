Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A9938F23
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761880.1171925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsHI-000475-FF; Mon, 22 Jul 2024 12:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761880.1171925; Mon, 22 Jul 2024 12:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsHI-00044b-C1; Mon, 22 Jul 2024 12:36:32 +0000
Received: by outflank-mailman (input) for mailman id 761880;
 Mon, 22 Jul 2024 12:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIMA=OW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sVsHG-00044V-T9
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:36:31 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 022fa498-4827-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 14:36:27 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 17DC7114009E;
 Mon, 22 Jul 2024 08:36:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Jul 2024 08:36:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 08:36:21 -0400 (EDT)
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
X-Inumbo-ID: 022fa498-4827-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721651784;
	 x=1721738184; bh=ypN56BFl3s/Ve7LjwV+i/fBSIKNDeBuN4CBqgZWT0bU=; b=
	Fhel1vZjPWtWA4NMk4fDTP1EgloSpj0gcFa95paBtajCvjxvEGombqew1SZcLLGn
	r2HJHWQ7B1QzBQqo9EHQ43AYUp4LpCQ723S0NuTI/KNKHpo03ejjNjqow0OIe82X
	IoHha2SkgsgZ4zb5ymQSMdB3mcCarkC8vLvt3Hf9wXHrXhU/T57n/M5gvM+6O0be
	DuvEu1IZiX6bQLaza5RASyVOJYhwOJMfklGyHEG3J9qMwvK+vLnaS2hgq6lawoQg
	ktK/n1BsoKPLhkJRxxrG48hKUZcHBeoXo1AWYr+1TMNpv31l9AL6ST5LI3KhNYv8
	xY5IasuNSCv/wJ77xVm1CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721651784; x=1721738184; bh=ypN56BFl3s/Ve7LjwV+i/fBSIKND
	eBuN4CBqgZWT0bU=; b=USEtC55WWS9V9OZOGlEellQ+wR8VcWrRjMLDKYX+Un+s
	PKGR5Lizg3w+FD5ckW4jAsJ2ldxEVtn4ZvFk87yse2XJvjfLFGqzAHcX/DyoVxku
	2pDIbxnu31MC/Xh1smABJe+7tlq6ykI0+RX/Fg7rztCPxWByZYJINdFtDh0Flgz3
	z6NvhcwPx3MuYppASSXLYNb09qqrd9b0zryQln05XChqsFiIIGh3n+ZtZiUwROuY
	DEWCIFEXj8yVDidonHiQkC1LOk3xmghQU7eU/ObNI/ruaSeg4y1M0lbN82jztsQv
	mAc7tym3D6NdDCfRKhbs9QcSdEmFWk8qgbT75oT0OA==
X-ME-Sender: <xms:R1KeZg-0ioQz_hFhzgdAGYPRzun9ofR9NuasHVDIKOcQRuCCSF4_Rw>
    <xme:R1KeZotAnlTtxBSUdbCnolo758v5Dmt_9VpPQYgdos6CV2epGqVquyOaKcegHqItR
    Pfpxx4t4-BS5Q>
X-ME-Received: <xmr:R1KeZmC14jbktXl79LEHhH4AC8LqU8S7YTNCIJAk_R7CmBOo82EkITipHK5dhKm3KyZtZAUGxSghkU7j2TWms0_-AJWy3TcXYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:R1KeZgfm3sYAkjSnW74rhkYQNLqxi0Z-uBuVgkGsb5vOdCp5GJ1y7A>
    <xmx:R1KeZlP_SUxsyq80jjYfwQ02sTSKp0VRs06B15qLwhoDVK8ADNXazg>
    <xmx:R1KeZqnkUNJgYG5zyQfKUMt4bQRiexF_QUC_AcYV0DieqzwOwqV48A>
    <xmx:R1KeZnvDSgYS11LusPDJH3zYfPTGNoD83zJS2VKZPkA-7RkdoJKq6A>
    <xmx:SFKeZmrWh0Pa_ygwIx4T3-0F_pTFw9_7N8WBYmyrYhKi0aj5yjHifROQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Jul 2024 14:36:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zp5SQlB_QR47NmtY@mail-itl>
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
 <f0b36fb78b87d2f06c0d33da28ba16cd1d2fa8b9.1721356393.git-series.marmarek@invisiblethingslab.com>
 <dce600a3-4b1c-47e9-b336-42ca32e309c5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YYya+0V9dO8Q4qkD"
Content-Disposition: inline
In-Reply-To: <dce600a3-4b1c-47e9-b336-42ca32e309c5@suse.com>


--YYya+0V9dO8Q4qkD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jul 2024 14:36:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] x86/mm: add API for marking only part of a MMIO
 page read only

On Mon, Jul 22, 2024 at 02:09:15PM +0200, Jan Beulich wrote:
> On 19.07.2024 04:33, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -4910,6 +4921,254 @@ long arch_memory_op(unsigned long cmd, XEN_GUES=
T_HANDLE_PARAM(void) arg)
> >      return rc;
> >  }
> > =20
> > +static void __iomem *subpage_mmio_find_page(mfn_t mfn)
> > +{
> > +    struct subpage_ro_range *entry;
>=20
> With the function returning void*, my first reaction was to ask why this
> isn't pointer-to-const. Yet then ...
>=20
> > +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> > +        if ( mfn_eq(entry->mfn, mfn) )
> > +            return entry;
>=20
> ... you're actually returning entry here, just with its type zapped for
> no apparent reason. I also question the __iomem in the return type.

Right, a leftover from some earlier version.

> > +static int __init subpage_mmio_ro_add_page(
> > +    mfn_t mfn,
> > +    unsigned int offset_s,
> > +    unsigned int offset_e)
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    unsigned int i;
> > +
> > +    entry =3D subpage_mmio_find_page(mfn);
> > +    if ( !entry )
> > +    {
> > +        /* iter =3D=3D NULL marks it was a newly allocated entry */
> > +        iter =3D NULL;
>=20
> Yet you don't use "iter" for other purposes anymore. I think the variable
> wants renaming and shrinking to e.g. a simple bool.

+1

> > +        entry =3D xzalloc(struct subpage_ro_range);
> > +        if ( !entry )
> > +            return -ENOMEM;
> > +        entry->mfn =3D mfn;
> > +    }
> > +
> > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D MMIO_RO_SUBPAGE_GRAN=
 )
> > +    {
> > +        bool oldbit =3D __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
> > +                                        entry->ro_elems);
>=20
> Nit: Indentation looks to be off by 1 here.
>=20
> > +        ASSERT(!oldbit);
> > +    }
> > +
> > +    if ( !iter )
> > +        list_add(&entry->list, &subpage_ro_ranges);
>=20
> What's wrong with doing this right in the earlier conditional?
>=20
> > +int __init subpage_mmio_ro_add(
> > +    paddr_t start,
> > +    size_t size)
> > +{
> > +    mfn_t mfn_start =3D maddr_to_mfn(start);
> > +    paddr_t end =3D start + size - 1;
> > +    mfn_t mfn_end =3D maddr_to_mfn(end);
> > +    unsigned int offset_end =3D 0;
> > +    int rc;
> > +    bool subpage_start, subpage_end;
> > +
> > +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> > +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> > +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> > +        return -EINVAL;
>=20
> I think I had asked before: Why is misaligned size something that wants a
> release build fallback to the assertion, but not misaligned start?

Misaligned start will lead to protecting larger area, not smaller, so it
is not unsafe thing to do. But I can also make it return an error, it
shouldn't happen after all.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YYya+0V9dO8Q4qkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaeUkIACgkQ24/THMrX
1yxzWwf/XX6LeOUlrcfSwO7/Yn9gRodsIRsJlfaoqA8Ztd/IVkYdZuesfmH14RHD
5H/BeLoAaVfLiAVYm5EDq8Wz93Dfz/MqnalAVwJxEP0XRf31QQi5b/mzlAZ5idlB
IqU/vzzQ/am8NIyTcLJh6mCspDjRc/TomhI3hAYyU3b+Z+fR6mR5HvsoaebJ7sIO
WYgeYUP4cB84sgk491n2uRTV7m7Ixoo61FPbdlWVUVjS64GAwxAIz916naYRjYJR
Zetz06m4jXz9i6B845kjQMEaATfPjoIg8l210/v1SK77smiSIr4oFUhbd9HtfluS
wrlUrJNLPLaOjEZwrITO7xHU6TUu0g==
=rYLJ
-----END PGP SIGNATURE-----

--YYya+0V9dO8Q4qkD--

