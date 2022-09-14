Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3755B818B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 08:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406774.649147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYM4R-0002G8-Mc; Wed, 14 Sep 2022 06:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406774.649147; Wed, 14 Sep 2022 06:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYM4R-0002EE-Jf; Wed, 14 Sep 2022 06:40:27 +0000
Received: by outflank-mailman (input) for mailman id 406774;
 Wed, 14 Sep 2022 06:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LQJu=ZR=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oYM4Q-0002E8-0h
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 06:40:26 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b720128-33f8-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 08:40:23 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3681C320093D;
 Wed, 14 Sep 2022 02:40:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Sep 2022 02:40:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 02:40:20 -0400 (EDT)
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
X-Inumbo-ID: 1b720128-33f8-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663137620; x=
	1663224020; bh=ORyS0cuyKu42z3iDxINAGfbaYo4Sq45Q6H4oW/9iDOc=; b=c
	wtMde9UL0ChNcQg74PwN7c+1YRr0cWPm7IVjBdsBuJmjKxb/u02nQkP8l+PpXHX2
	D6ZZ/GY58RR3WqVBEshDbg9d4M4GoEZFehlDO39YGTj6gTlDxmccZv65H50Z3qXn
	KxtOkSKt2DOyXxuYmXWuFAwz1uBnbiYXnQMZUX7zntOqcBVV5i7vbJNIYZVg+vqo
	aFf8/5vfuPOM3bMG2qdnvqWgARisuZK+riW3N3SidokYDVgERd3enqPU1fUFJl9V
	ZZE2Piulk0i39cmPA8M4AmY4HIUpaF2q2k8mG/pKWq3KMXNpY9OvzKfXmaZb0crG
	6Z+jWNozIwP1u6Rm6T3NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663137620; x=1663224020; bh=ORyS0cuyKu42z3iDxINAGfbaYo4S
	q45Q6H4oW/9iDOc=; b=OlNfE5j01CrILK18qVeKV3LGnC8qSdKXG2/2W+tXyTFW
	lSR+lvYOlnZLNl2ORmNRsPzODLAF6EbmTWSFBYmEN7gJNYSt85QTCI/jEa3K8ju7
	/F5cgupUX5uLmWsvBIl6txDwzTRdbpnO/i8FW+AoogppWZ/Pni0W8Hqs4HwfCChd
	WJuMhwx7yRUDdfuFne9rkEbVEiSlO2upXXbE9EqVepPR9dHsi3BVpH479lzrvROC
	2ZAhral6IL1Hj0ooCvqPLSoOsoUzRFUf7U7cOvPNJeN2FLyUuuoBP4atshn+GI30
	LD67etl5gxgPJZA+wT1828ljTmzaGdTSRVV0ShLgjg==
X-ME-Sender: <xms:VHchYxifavTISRCrBHfOXo6rVZeI0tTpJvqQ-2_I35GQr7MUF-BgQw>
    <xme:VHchY2Bpa54XYhg4Kvg2WvdL5qRfgeFWZJjzC9g9WdL4j11UZ-Jqgy765LjiAmc3v
    4eW6ck7XG0IgL8>
X-ME-Received: <xmr:VHchYxF2SFClVB9WJOREGBoFT1AfO9aGqpBMzcUjbe5lMKTY9DFBFZLYN0VT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduhedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeejueekheekgeeitdegkeek
    leetvdfhuddufefgffehffehueevvdeileefhfenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:VHchY2T3fCOrCdXHmy6wkmvGxWxnsPsdcfOq2bKxAQ30Mb00lkmmMQ>
    <xmx:VHchY-zx7Ga6qVQPC3AQ7R28NezVPClDy6YrUmwQxNruLntDnQaRPQ>
    <xmx:VHchY86ls-KmbAoG5OW1yYEnEB9T0pvlMQW9N5xFwQfUnX8iQiwX_A>
    <xmx:VHchY5_Qs7b2XeOqJmeI3PxBhFF7GLDkTAvxzm5W4BvS4D0OKt0I0Q>
Feedback-ID: iac594737:Fastmail
Date: Wed, 14 Sep 2022 02:40:15 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag
Message-ID: <YyF3UoneRmBGQSHo@itl-email>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email>
 <037151d0-0920-5d99-9932-df044729c00a@suse.com>
 <YyC8PMxsQyRp07vW@itl-email>
 <61f083c8-34c7-563b-b010-8d8d0286da6a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bgslkJ80w4A3ITBd"
Content-Disposition: inline
In-Reply-To: <61f083c8-34c7-563b-b010-8d8d0286da6a@suse.com>


--bgslkJ80w4A3ITBd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Sep 2022 02:40:15 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Setting constant-time mode CPU flag

On Wed, Sep 14, 2022 at 08:36:02AM +0200, Jan Beulich wrote:
> On 13.09.2022 19:22, Demi Marie Obenour wrote:
> > On Tue, Sep 13, 2022 at 04:47:24PM +0200, Jan Beulich wrote:
> >> On 13.09.2022 16:22, Demi Marie Obenour wrote:
> >>> On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
> >>>> On 06/09/2022 10:52, Jan Beulich wrote:
> >>>>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
> >>>>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be s=
et in
> >>>>>> a CPU register to enforce constant-time execution.  Linux plans to=
 set
> >>>>>> this bit by default; Xen should do the same.  See
> >>>>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for det=
ails.
> >>>>>> I recommend setting the bit unconditionally and ignoring guest att=
empts
> >>>>>> to change it.
> >>>>> I don't think we ought to set it by default; I can see reasons why =
kernels
> >>>>> may want to set it by default (providing a way to turn it off). In =
Xen
> >>>>> what I think we need is exposure of the bit to be guest-controllabl=
e.
> >>>>
> >>>> We absolutely should not have it set by default.=C2=A0 It's a substa=
ntial
> >>>> overhead for something that is only applicable to code which otherwi=
se
> >>>> crafted to be constant-time.
> >>>
> >>> Either Xen needs to set the bit by default, or guests need to both kn=
ow
> >>> the bit needs to be set and be able set it.  Otherwise code that *is*
> >>> intended to be constant-time has no way to protect itself.
> >>>
> >>>> As for why Xen doesn't enumerate/virtualise it, that's because
> >>>> virtualising MSR_ARCH_CAPS for guests is still not working yet, so t=
he
> >>>> feature can't be enumerated yet even if we did support context switc=
hing it.
> >>>
> >>> Intel and ARM64 guarantee that CPUs that do not enumerate this flag
> >>> behave as if it is set unconditionally.
> >>
> >> I'm not qualified to talk about the Arm side, but may I ask what you've
> >> derived this statement from for Intel? The doc page referenced by the
> >> link you did provide (still in context above) specifically further lin=
ks
> >> to a page listing instruction with data operand independent timing. All
> >> other instructions, as I conclude, have variable timing unless the bit
> >> in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the same na=
me)
> >> is set.
> >=20
> > My understanding is that only instructions in the constant-time subset
> > are ever guaranteed to be constant time.
>=20
> Hmm, yes, I did overlook respective wording in the doc.
>=20
> >  On architectures where DOITM
> > is not enumerated, this guarantee is unconditional.
>=20
> I have to admit I'm suspicious of this "guarantee".

Do you mean that previous CPUs had a vulnerability that has no fix?

> >  On architectures
> > where DOITM is enumerated, this guarantee only holds when DOITM is set.
> > Therefore, it is critical that on CPUs that enumerate DOITM, Xen does
> > one of the following:
> >=20
> > - Ensure that all vCPUs enumerate DOITM, and virtualize the DOITM MSR
> >   bit for use by guests.
> >=20
> > - Set DOITM by default.
> >=20
> > Since Xen does not support virtualizing MSR_ARCH_CAPS, vCPUs cannot
> > enumerate DOITM.  Therefore, the only secure option is to set DOITM by
> > default, so that guests do not need to be aware of it.
>=20
> I can see where you're coming from, but I also agree with Andrew that
> the resulting loss of performance is a counter-indication to making
> this the (universal) default. What I could see us doing is make this
> both Kconfig and command line controllable.

How large is the loss of performance?  Linux seems to be setting the
flag unconditionally, so I think my point about guests needing to be
able to ensure the flag is set stands.  The default can be changed once
Xen gets support for virtualizing the bit properly, but until then
unconditionally setting DOITM seems to be the only safe option.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--bgslkJ80w4A3ITBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMhd1IACgkQsoi1X/+c
IsG/oQ/8DcA7imP7bfjLWFNg9k81RRhAotJU9/MQTs0AfHRB87UC0mkuMBt1FkX8
2Q2SH6x+YBKoCyW0+4UC9sDq77yoh9M0AWvNJA+maavqppvsL9bVa9K+iBbSYWsz
pYTOlE9JxKgxGJbIM6F1fvMnBnmEuafb+8HLj+S8JkkE8SMn7tiW4T4NSXw+djvc
861PrYtmRZonumLCYHAF6IXzRTgT5vA33zpUAJqYydTOT91IOu7SDM5P9epwENnO
hHKQTYQEB7ZCCi9pa+HwvWAysajDRfAe5yphQzoasxNmTsNSgfEMN995vhbfpMet
is1Vfj7hJBIOUO34tFviEt0dzvUXuJORuCPJ2PPkcahoeVG6fU/Wz8olKBH98iID
ylzzy6OTt/lZ9QX7/VZhDPDzugRHeji5hZOEro86JZqfky6pH1kMANal6Quqatpx
nKXPOhs9Mcmsk7OuC/u9H7/OgSz0UcKPCRjbLr48UlsO7aD/Z0Ap1YnUIYUkt0li
c4CygO0O8IzM2ydAmEm5YOU1jAn8fugcvB0uW2J6SzQbQvfpteXvlIOwlrw6oVy5
b7eJu+vFFIXo/Ckw50WcsjwDCnJGEMHnXbpmUJ4zn07WviigneASbEph3ptCTc2u
KHRRVcjrQWkK53etRk9EeGY/STYaFfdlLOSE2RnZWEa4CqJCBNw=
=XNCu
-----END PGP SIGNATURE-----

--bgslkJ80w4A3ITBd--

