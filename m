Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C9644A90
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 18:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455396.712851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2bzq-0006cp-RW; Tue, 06 Dec 2022 17:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455396.712851; Tue, 06 Dec 2022 17:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2bzq-0006aU-Oo; Tue, 06 Dec 2022 17:44:46 +0000
Received: by outflank-mailman (input) for mailman id 455396;
 Tue, 06 Dec 2022 17:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2bzp-0006aO-8M
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 17:44:45 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a95ddfa4-758d-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 18:44:43 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 39EB832000D7;
 Tue,  6 Dec 2022 12:44:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Dec 2022 12:44:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 12:44:37 -0500 (EST)
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
X-Inumbo-ID: a95ddfa4-758d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670348678; x=
	1670435078; bh=tUHwzAYdFynBoWNTayYlb2OFmj2e3mDaT11ayfBr6Ik=; b=I
	QoOxUycZ3mm5SV+54MrFUDqS95EnYR5kkUtay256horx5DvvVA3lQ3H8sWXxhzwG
	D48N7P7lnugjzkcV4+rYASq+aX12xh2QYrnWMx4M/AsgQNQNYhHqPK58Wy6M5ntc
	LralyMOKR9Zs/lTNsSP5rQq9gOUjj0VgOE5mOkyA0fUnhadjq09Yn3qt71QuVNNM
	hHlnoBSbcQGtsZnRL4ETbV4AD8DQehuv4eeLbjWFjbe7kV4pcwhuQqF5MBuzp0gg
	bxpg55+W70wHmgD6sFjcUVPa7s/3u96Z2HjKFF0MKMOtHug7ssZohw81gfqVb3CJ
	BvnRfOtZin0AT7Eb/TMJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670348678; x=1670435078; bh=tUHwzAYdFynBoWNTayYlb2OFmj2e
	3mDaT11ayfBr6Ik=; b=Qf+5Agjmn0tEOwWOlt8zdvegfl1DARw0/ymyHWso6u4t
	keunNBw4XWtvY5QXRkrb/4Sy28HKOSmWu/zLNhIP1xzx2NWgHi6OTfvwjHOY7SOQ
	yF5NbxrP02ZZC9DmnS6eMFT6EQUJMKBTdpcf4EXJF8l4+YDXBGTtMg3k7d3Ax2Il
	eENDXMIBhGjNVo2KtEfi/H11mhx0YLn1QwhLBN9v2JJj6j5JpV433JjvqiXApYgb
	Qum7dyzsYzFCMWG7oR/Ykq6wjshAkrhHSw/w+t4vaCk0Yod5of6Bu6HSYQpa2UtM
	BczlqgR1CwOQIBV3VwuPGpEa0DAcenDS+Tts0+ot9Q==
X-ME-Sender: <xms:hn-PYxQP2cv5I7WXhQMjdvsT8xBf-E2LaD11MzGqOr6ykqjmodkk4g>
    <xme:hn-PY6x_XVXEoAGHZm176IW7JGi2ybHI9QjUmoRdGV501mYJ-V9Wop5TOqVQS0LXF
    56aJlNrr4Qhahg>
X-ME-Received: <xmr:hn-PY208dCt6kLCDMlWVkIt4ugDMX1ywoLcbCUtbyASJuSAlxj4XfeGZY9Y4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:hn-PY5AUJ243jFtrgNE5QfgBkyIyjrwfar52_IK4cCg0Hh6acW_-Mw>
    <xmx:hn-PY6jlIBS71dGFVhOm01qgbcNN5BZC2kYR-z56IZxwUeOAX4HqhQ>
    <xmx:hn-PY9pUHQi1W4HCdeSUJQaSkliypjRi7-P6bNIJzMld4sjfraUAdw>
    <xmx:hn-PY8ZgR89ge_U2dupECXv-qOF5lbF-QkYKay3zSgjtcOvh-pvdDQ>
Feedback-ID: iac594737:Fastmail
Date: Tue, 6 Dec 2022 12:44:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries
Message-ID: <Y49/hCC2nrAhlJNo@itl-email>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
 <ac0605b2-5c1c-09f2-9526-1aa7e777e7dc@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sfmSyrCM+UV609es"
Content-Disposition: inline
In-Reply-To: <ac0605b2-5c1c-09f2-9526-1aa7e777e7dc@citrix.com>


--sfmSyrCM+UV609es
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 12:44:32 -0500
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
> This isn't really correct.

Do you mean that this in and of itself is buggy, or that the code ought
to be structured differently?

> Constants for MSRs typically live in
> msr-index.h, but these are architectural x86 memory types.
>=20
> These ought be
>=20
> #define X86_MT_$X ...=C2=A0 (skipping the two reserved values)

I will use the reserved values in BUILD_BUG_ON()s, so I would prefer to
keep (possibly defined somewhere else) if that is okay.

> in x86-defns.h, and the PAT_TYPE_*, MTRR_TYPE_* and EPT_EMT_* constants
> want removing.

This seems like a larger refactor that might belong in a separate patch.

> There are two minor restrictions (EPT can't have UCM, MTRR can't have
> WC), but they are all operating in terms of architectural memory type
> values, and the code ought to reflect this.

That makes sense.

> > +
> >  /*
> >   * Host IA32_CR_PAT value to cover all memory types.  This is not the =
default
> >   * MSR_PAT value, and is an ABI with PV guests.
> >   */
> > -#define XEN_MSR_PAT _AC(0x050100070406, ULL)
> > +#define XEN_MSR_PAT (MSR_PAT_WB  << 0x00 | \
> > +                     MSR_PAT_WT  << 0x08 | \
> > +                     MSR_PAT_UCM << 0x10 | \
> > +                     MSR_PAT_UC  << 0x18 | \
> > +                     MSR_PAT_WC  << 0x20 | \
> > +                     MSR_PAT_WP  << 0x28 | \
> > +                     MSR_PAT_UC  << 0x30 | \
> > +                     MSR_PAT_UC  << 0x38 | \
> > +                     0)
> > =20
> >  #ifndef __ASSEMBLY__
> > +_Static_assert(XEN_MSR_PAT =3D=3D 0x050100070406ULL,
> > +               "wrong XEN_MSR_PAT breaks PV guests");
>=20
> This wants to be in the build_assertions() that you introduce in the
> next patch, and a BUILD_BUG_ON().=C2=A0 We still support compilers which
> don't know _Static_assert().

That=E2=80=99s fair
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--sfmSyrCM+UV609es
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOPf4QACgkQsoi1X/+c
IsF8XQ//cBj03+MCaFs6v1uijbgcgXtzZ9Esaum+KhCeognesnq7aHjCfm3o+7tK
bDjEdFGegRQz+3LvPc/nUzb2GVDKmg7dtqOT7cNtbS2ulnzpeQq3ghBLihudPop8
37QXXmLBd1FrR0z91JEDEpTex+VxVOuuVZDnWYNmxNhJbIkYye5ewtzNrjS77Sgg
eIONBNBWngbFrMlhdlTvRhHTedwztvZVrlFuV9CPx0N0sf30DGDD1BIUcJViep6G
bahiQCj5ALGNWX/0TL2U6ML0/p59EnfoJOi0LPyiFd5LZw/E8xbd92lONL5tFpwa
5X3Qt70fxMjzu2Q+B/EXpRuB2XA/bq0jMClKTLNFp15Wd/9mY0ra3bJMCnVb6wCk
ZDDuhEJdOnxDWlFp248vcwwlBluo4g/E/rJHdUYT5t5SeJqlzs25Y3GIJt2Jx2Bz
CJLiXx45v+OAEBtPwUkzGX4/6Gm/i6DYoxnmfAmdXVDujb6aiAQga+Lfbfk8SspK
PzFT3ONjd9QsWGjH64rsjGpB/rPuABH7tcVrvDcEHteIGRRTRymxSfCXMVD+ivUn
ejeu0zZ/uYwGF4FppRXXhhTyTzVpPZYPI2yZsN0T09p6FgJfFNzNqa/WWlR3LmjF
j9UXiV9JK+nml6OwZv+n+eYTVPAYMjbir6Lfh3UU1IvQSCheyN8=
=8QCt
-----END PGP SIGNATURE-----

--sfmSyrCM+UV609es--

