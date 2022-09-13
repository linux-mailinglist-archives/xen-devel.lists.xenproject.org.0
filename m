Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127355B77B0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 19:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406575.648970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY9bu-00072S-GR; Tue, 13 Sep 2022 17:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406575.648970; Tue, 13 Sep 2022 17:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY9bu-0006za-CF; Tue, 13 Sep 2022 17:22:10 +0000
Received: by outflank-mailman (input) for mailman id 406575;
 Tue, 13 Sep 2022 17:22:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iobZ=ZQ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oY9bt-0006zQ-HJ
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 17:22:09 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 979ab941-3388-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 19:22:07 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B039F5C00D8;
 Tue, 13 Sep 2022 13:22:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 13 Sep 2022 13:22:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 13:22:06 -0400 (EDT)
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
X-Inumbo-ID: 979ab941-3388-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663089726; x=
	1663176126; bh=DlmL/OSMUtEOYHeDmhrm4rZF3WDXziGijEEBzTnopZU=; b=c
	A5z9wG/FyBIeExzYRRJZrmYMZm1mWb5IJXpFfEmrDRagmfsH4qje+Uju3W08WgV/
	s+3VTkeY1QwCb3+naeB6DNffMx41wHsFitrRhDasSrdLg17eCtrdW789yatu02d9
	q+jBZ2pDrVKcqpz2wzjJjC7fu7lyM0gSOFMiL7n3/n/c/mgcRQKqPpZZp1nQXWz1
	t30R7PGxvj3Zb/whhjVI36tLM2GayOyrlfQzDGGwiI2WIr0nDtd+C9P3w71jr55p
	nk5/vf0Ec898GdJs1P/zjftL3uUm3Oo7ftLwwo6h+JI7Gcz414N782YUn4BS8L04
	lLfDwS6o4bBG3khPajhEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663089726; x=1663176126; bh=DlmL/OSMUtEOYHeDmhrm4rZF3WDX
	ziGijEEBzTnopZU=; b=ibsJYHcqBJGa+/J0ijL4OTa1QSTwpGRnhjlf8TmWIh1i
	+R0xwO+1j2gFcX6wHwUSczj1zLISn3azumcGXHCegNUGZdEIX9JIEFO81wUlXVzy
	ArGKOKuBU/OMIQeUyqCMLNEPGOwIhDdOjPirOTBUyGxyXgMo0DuymRlht2Bfugsv
	3p8sy6bEszaiZWjHvQdR5+gZJIhLBa9ZHllLJFgdQkkZBDX9YyDLUbP/nYSSlW5G
	i25m0qoTNFzcqgUQpzOX9uzjItIEc8gTuzwEwE5nbO/rFLDP8zz98Z/c9Ol5bmQg
	Mv1fnYuggop93+7gN8tiMXRbhBBVtCDHxYt1m+INcg==
X-ME-Sender: <xms:PrwgY79CuJ9JuF6mtt_VMXCYnxOm0_oW2XWci2_g6QtKZsPdyaWwEQ>
    <xme:PrwgY3shdv9Q53SF49GEjvULpVWhzf8AywBCnfsKasyy9dSx5bbZt_Hwd7GCNZKGK
    jTMyXsHlwKwIhE>
X-ME-Received: <xmr:PrwgY5AbJWYe-oAh_2TQqVZGNb27fe4jHe8GB7QzvCbYog5w1Pk5CpslzkVL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeejueekheekgeeitdegkeek
    leetvdfhuddufefgffehffehueevvdeileefhfenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:PrwgY3eIM2IryoVgWuOMeMq-pmIkR-2uHmezNGikAQKbINO2AilncA>
    <xmx:PrwgYwPJg1iBB-kMkFKNYbbWidX67CejVs9Q-WyOiP1ZNtWptewSzw>
    <xmx:PrwgY5nkX4DL8i5LsF7LBxd87hPBzIbG6Ntc92xVzAGAVZII53Pu8A>
    <xmx:PrwgY5bTD-qWQOCFZexmt1EByndD32sdapR-3wIZNOKXYYRrQx-NEA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 13 Sep 2022 13:22:01 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag
Message-ID: <YyC8PMxsQyRp07vW@itl-email>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email>
 <037151d0-0920-5d99-9932-df044729c00a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zBcvDbfW76gylCHE"
Content-Disposition: inline
In-Reply-To: <037151d0-0920-5d99-9932-df044729c00a@suse.com>


--zBcvDbfW76gylCHE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Sep 2022 13:22:01 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag

On Tue, Sep 13, 2022 at 04:47:24PM +0200, Jan Beulich wrote:
> On 13.09.2022 16:22, Demi Marie Obenour wrote:
> > On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
> >> On 06/09/2022 10:52, Jan Beulich wrote:
> >>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
> >>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set=
 in
> >>>> a CPU register to enforce constant-time execution.  Linux plans to s=
et
> >>>> this bit by default; Xen should do the same.  See
> >>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for detai=
ls.
> >>>> I recommend setting the bit unconditionally and ignoring guest attem=
pts
> >>>> to change it.
> >>> I don't think we ought to set it by default; I can see reasons why ke=
rnels
> >>> may want to set it by default (providing a way to turn it off). In Xen
> >>> what I think we need is exposure of the bit to be guest-controllable.
> >>
> >> We absolutely should not have it set by default.=C2=A0 It's a substant=
ial
> >> overhead for something that is only applicable to code which otherwise
> >> crafted to be constant-time.
> >=20
> > Either Xen needs to set the bit by default, or guests need to both know
> > the bit needs to be set and be able set it.  Otherwise code that *is*
> > intended to be constant-time has no way to protect itself.
> >=20
> >> As for why Xen doesn't enumerate/virtualise it, that's because
> >> virtualising MSR_ARCH_CAPS for guests is still not working yet, so the
> >> feature can't be enumerated yet even if we did support context switchi=
ng it.
> >=20
> > Intel and ARM64 guarantee that CPUs that do not enumerate this flag
> > behave as if it is set unconditionally.
>=20
> I'm not qualified to talk about the Arm side, but may I ask what you've
> derived this statement from for Intel? The doc page referenced by the
> link you did provide (still in context above) specifically further links
> to a page listing instruction with data operand independent timing. All
> other instructions, as I conclude, have variable timing unless the bit
> in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the same name)
> is set.

My understanding is that only instructions in the constant-time subset
are ever guaranteed to be constant time.  On architectures where DOITM
is not enumerated, this guarantee is unconditional.  On architectures
where DOITM is enumerated, this guarantee only holds when DOITM is set.
Therefore, it is critical that on CPUs that enumerate DOITM, Xen does
one of the following:

- Ensure that all vCPUs enumerate DOITM, and virtualize the DOITM MSR
  bit for use by guests.

- Set DOITM by default.

Since Xen does not support virtualizing MSR_ARCH_CAPS, vCPUs cannot
enumerate DOITM.  Therefore, the only secure option is to set DOITM by
default, so that guests do not need to be aware of it.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--zBcvDbfW76gylCHE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMgvDsACgkQsoi1X/+c
IsFeHA//aCAzL+FXK/IZ8CUyToJ5Kn7z8nhx1P0nYiCjUdZluGizysv4jcj+X199
PKry44GgneMsaKYpvjyXzsUquTjHffRPQlzTsOU1H/n2csDR6brczOk0zG/lWbnS
el+iRk+X7jyHgkx8cGmXyRKgO5rlDbVksgA9W6X1JaYTEDhAtt3PiURT7EZ+wj73
3MEU9lsJE4pq1GvudtscSb9ImS0hPkf3xtA6CDnW1+RDZoetv//NxaMyosfO9Dj3
BwGThUoDyqVYQtUJAWSen+nyHd9A5Q6gqmV70bFqG5MZ6CG0dedUl+QMqZXailUH
KNQpGmiTJwyuxpytdEVXJ+BA239c0Lafo/74+ZmKdRqEhfRrLTpg8jW2F1I+VYaB
w+S7dSoL5DCISeBAaH6xLi75h5eKugwzl0yyichhabPGHd847E6G/eLZF9DERNip
cZhedxzG3lzt9Pl2kGPwZicMsEYulOjXXjvnRTx8VFUFx7Sd8OdajaEdmJ0O0CAV
qAKsuG57cccqxi2iyWgz1tlO2kIK1a1j1SXQ3KpUtY6sm/19Oz8NXvk9HO/n1KhW
Ze2cM5pJCDcm7lgDuldAz27OKnMdwUXRDbzVEHuYT1GhxVqRSIG4Sg/UFcWHXxHe
ow7UZYujSOQCRCpJffjZyZn//0FF7/Tyl3edFmZhDqq07CPJqr8=
=U+YQ
-----END PGP SIGNATURE-----

--zBcvDbfW76gylCHE--

