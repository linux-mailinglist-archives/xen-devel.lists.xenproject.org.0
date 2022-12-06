Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC593644EC3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 23:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455667.713203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gn1-0006WA-Dl; Tue, 06 Dec 2022 22:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455667.713203; Tue, 06 Dec 2022 22:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gn1-0006TY-As; Tue, 06 Dec 2022 22:51:51 +0000
Received: by outflank-mailman (input) for mailman id 455667;
 Tue, 06 Dec 2022 22:51:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2gn0-0006TS-F5
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 22:51:50 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f15ac9f-75b8-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 23:51:47 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 60DB93200936;
 Tue,  6 Dec 2022 17:51:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Dec 2022 17:51:44 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 17:51:41 -0500 (EST)
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
X-Inumbo-ID: 8f15ac9f-75b8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670367102; x=
	1670453502; bh=GcGTpWsmbLN0msWZ5WctFoRPFFvXbua/V5/2oTrIoUg=; b=n
	snUBETS/RunnQyk8LMf7kordCf4blnOEb+lYJ1k02OIoaqqhAPRdEwicDgHW74zY
	sVZ7AR511HvA53Wk92fUvzKMLqasymFdqKgRHfVP5jTe/PmyW5MgYlxfn5jSEtzG
	zB/q7BZCuCzer6x5Zxrzo74qgCiDq+N9o67dJAvAs7ayGidX9wnzteS//C6uNTjR
	+FwVKXRkEuXZRRtfIb8neue2Bh8aHriMgNdqCcbnVo66yC88SUSe1fV/iKNs76zP
	3OUkIv6rKo+HVxX0kcb82P1rnvNwSmpP1Bawoate8AC5JrtYy4F9YpjsGedtZrFV
	TsilkcYSO5cVRcuEygBcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670367102; x=1670453502; bh=GcGTpWsmbLN0msWZ5WctFoRPFFvX
	bua/V5/2oTrIoUg=; b=VyNhc+JtrE4LT/n1oYRmiNGEHrGRm3z/s5DsAexduleZ
	bXlBMySPX5wBPEQS1Lxj4Exf1lfM5MzM2WIsxsZE0eO3Qzv0lPPYk+B1YKPlJs1J
	Mps63ScU4U8uRd6sujlg87/T836tlTJbqdFT80z5nP9LYcJ9RinS2c9i5GJPLE45
	DPGjK7j39VDw59QbkdjkLugo0tDbl1swj+CtBAKFd6Ter7DhaGvE+BbQxR8aiIDN
	PL5frGp5YLrLJeX1ycUxoIfHG8JqIH3CIVnbf/5ZB47PJd7krWRV2gAsY0+LzCEl
	sZ4jaEhqaGTLlVaRKptWk1eTn6dawcWejkFhfNG6oQ==
X-ME-Sender: <xms:fsePY2Lr1_y2aFTc_HbNEoFmEHKC6ofrOIN9Mv5VaBnPrK0eeFQtCg>
    <xme:fsePY-Jgt-fLGT6joUnAuQNNcNeuGTepTjpTaeyBPhDuzJOucaCWemBjg9D0HaHhw
    uC-ZtmCDQqM5p0>
X-ME-Received: <xmr:fsePY2uk161ZljY46Hf0lm6etRxoWkI9737tMh-c8sssqQBDzk7PnNtEwIXo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:fsePY7aPEGT7On0Wbt0AcUz1DD4u2iz_Lq_HPALYAexX4tZjAncyig>
    <xmx:fsePY9Z4NgjVEFJlv-mA9sHne_yAvJCXbA2Eu4bbLNj5W42wMG9-yw>
    <xmx:fsePY3BT8Onruupuaq4dUcxACVfvJa_c29Ybc7rjuyMNCZQm8p_YAA>
    <xmx:fsePYwzTVtV8tQddVt-kfTpwGP0AHL8rMshJOIaIa5ykSXv5vl-G-w>
Feedback-ID: iac594737:Fastmail
Date: Tue, 6 Dec 2022 17:51:20 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries
Message-ID: <Y4/HfLMVPLOmiphM@itl-email>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
 <ac0605b2-5c1c-09f2-9526-1aa7e777e7dc@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ycs0g1ZNwaql4PIb"
Content-Disposition: inline
In-Reply-To: <ac0605b2-5c1c-09f2-9526-1aa7e777e7dc@citrix.com>


--ycs0g1ZNwaql4PIb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 17:51:20 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries

On Tue, Dec 06, 2022 at 11:32:16AM +0000, Andrew Cooper wrote:
> On 06/12/2022 04:33, Demi Marie Obenour wrote:
> > This avoids it being a magic constant that is difficult for humans to
> > decode.  Use a _Static_assert to check that the old and new values are
> > identical.
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> >  xen/arch/x86/include/asm/processor.h | 22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/includ=
e/asm/processor.h
> > index 8e2816fae9b97bd4e153a30cc3802971fe0355af..64b75e444947c64e2e5eba4=
57deec92a873d7a63 100644
> > --- a/xen/arch/x86/include/asm/processor.h
> > +++ b/xen/arch/x86/include/asm/processor.h
> > @@ -92,13 +92,33 @@
> >                            X86_EFLAGS_NT|X86_EFLAGS_DF|X86_EFLAGS_IF|  =
  \
> >                            X86_EFLAGS_TF)
> > =20
> > +/* Individual entries in IA32_CR_PAT */
> > +#define MSR_PAT_UC  _AC(0x00, ULL)
> > +#define MSR_PAT_WC  _AC(0x01, ULL)
> > +#define MSR_PAT_RESERVED_1  _AC(0x02, ULL)
> > +#define MSR_PAT_RESERVED_2  _AC(0x03, ULL)
> > +#define MSR_PAT_WT  _AC(0x04, ULL)
> > +#define MSR_PAT_WP  _AC(0x05, ULL)
> > +#define MSR_PAT_WB  _AC(0x06, ULL)
> > +#define MSR_PAT_UCM _AC(0x07, ULL)
>=20
> This isn't really correct.=C2=A0 Constants for MSRs typically live in
> msr-index.h, but these are architectural x86 memory types.
>=20
> These ought be
>=20
> #define X86_MT_$X ...=C2=A0 (skipping the two reserved values)
>=20
> in x86-defns.h, and the PAT_TYPE_*, MTRR_TYPE_* and EPT_EMT_* constants
> want removing.
>=20
> There are two minor restrictions (EPT can't have UCM, MTRR can't have
> WC),

The code seems to indicate otherwise: it behaves as if both EPT and MTRR
cannot have UCM.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--ycs0g1ZNwaql4PIb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOPx3wACgkQsoi1X/+c
IsFoIQ//QqHTAOvXjOL5lzEVGsGJqSeD0OorRSSIP86joTGEIusMzRzdKBbP4uv1
3aMnBXlWCBAkutG+KdM9DMNjGEpSEQOnZKuiOKpMetCYjOGZtxwOXHuxoZHYCPFg
AnAOzlM3cphYJ9eOJ4K/tL7fodbd/YtcQ4ji3u40t0gnJM3w8UAbj2Tn0AxarU3o
6e3nx4OHcSQj3Bd2kkmdRGDUHGZ+vL1hDE+8nf/WtLp179YGJkQeGuDdCg2j44Ui
IS1FgzL5kHA85GcrcH+901xi9BZdqW92BB6utWc7b8L/lSiEUj8nJmro2YLS0u31
wbXugO3OirXKafVGExkQGWvAnXsCtsm+8UlGczuykbud4nb7uYROZHddGzynU9ZX
oGmQFNkAtQiBAJRBpEmhtCr6FFSNh64gQDCmbri0NiZBgBy0kwGpJ3GW9jZyYox3
ty9wcbu+sTdvi39OezkhYBEkuw7x6M22MK7pY8LRDL1MKxsAPTrLpgJAc9QdgNwM
PmFDe31iR5EnWvODWPuWxbj3s2+4RMuSwavWG4+rmhzm/wBKdKAOSQ2S8q9FP2yT
h6IFdHEEtQzktdBV+jy2O6V+zHj1akLyW9CWSXmtheOX8bqvfMKc9pIyJDxF/Avo
agsgbtN5X/XW1DUTOjihgtUbEKQrRhWEm4WobWciUYnXWgxDHh4=
=rcLB
-----END PGP SIGNATURE-----

--ycs0g1ZNwaql4PIb--

