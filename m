Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856464DE26
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 17:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463566.721777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qfO-0003NE-Lt; Thu, 15 Dec 2022 16:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463566.721777; Thu, 15 Dec 2022 16:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qfO-0003LP-J5; Thu, 15 Dec 2022 16:01:02 +0000
Received: by outflank-mailman (input) for mailman id 463566;
 Thu, 15 Dec 2022 16:01:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5qfM-0003LJ-0m
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 16:01:00 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8133c2f-7c91-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 17:00:58 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 99B7E5C0178;
 Thu, 15 Dec 2022 11:00:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 15 Dec 2022 11:00:54 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 11:00:52 -0500 (EST)
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
X-Inumbo-ID: a8133c2f-7c91-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671120054; x=
	1671206454; bh=awrZmvGiO2KkUVwWue86Sg88k66hu6jNS6XpevL9ZT4=; b=Q
	OY2Nhi9cWNqXVyEZTQHblyfgCbjYTWdAikPH9QjlGhWVDXThBA5hsHQ9eCqFedlZ
	c2IqU6MdtwRY+Wc4qZ6M64sUCNBashntNTqMalvxPc45fQJByhaOn+cue7PUXriJ
	B245+0O/tiHVrICze4+orgVG4Xvdr5Krf7iLuzt/i+IwUmy+lY5b4F23B9vwV0+q
	WWtkEqZeo6Yf9AmIA0/4iY0gzuAJIF1I32x7YF12vAsI6w1tNah1BPuXz5TAv23t
	47jcRzzwV+hqdxA2JYk2FCJSo15KN3U2gZmPcEFzv743mGkHfFn4LLYpFWlx33tv
	8cJmxEdbBwEmdxWyOUmTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671120054; x=1671206454; bh=awrZmvGiO2KkUVwWue86Sg88k66h
	u6jNS6XpevL9ZT4=; b=NjVpZnMgHskM+deQ1g6T0hJM8vgRx1gziCUtFn39O3lx
	uDrp7TfAVQb7GNyVsLltHky3nhHe2NY6OpZNrLzg22dE5L8EDnA3v7pxqa7R8ozq
	3H9eZGDzTWiWHj1Cp4LJiTMIlMMR9lP7MQ5j854o1Jgmn5oGHC1kn7bUTCrwXi3O
	M/OwzJoofVrYpAzsoOu9eveMvTrW67XeLaomaQ2SBygIfu4t1z3vslzE/IYZodxi
	9/SnjqRTNPZzEkpa5uaIKktymcKVVGqj51+0DCtaOfMyOmNnl79MySUUWV+QWnOL
	CA3U3Vjqo72lPZ/aEYTdStOW9YC7HSQX+hb+1cT2GA==
X-ME-Sender: <xms:tESbY3GSxb1X8gvvFX9NKy4H9Cd9T52PWqJ9pEZs92mPA_NyB4tL_Q>
    <xme:tESbY0X80pRJnOgdqUq8Lov04uyD3A4akXbDVg1t24Rjhs13wLntx_fErifYtgYCk
    6RMFJAyyeeV-wY>
X-ME-Received: <xmr:tESbY5K_d0kuDa_Fm-q0nqElOk7wR87K4GnAI8ILpvvWHq7WVE3kvbWY52FW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:tUSbY1EplVl0AO6EirSm6DTefwbN58aRU63qFfvPT1jMVutXKZev2w>
    <xmx:tUSbY9UhkbijCz1cZRpCv-MYwfnoTGjEBxeQU-4ZIU80C-QH0w-xtA>
    <xmx:tUSbYwNic2EOjL1KME6-cHsY_OS7u1ml8VfGcm2oWPa69wHk8TUClA>
    <xmx:tkSbY8EhOJES_7mXju5BxlrSkW13ihNJBzoBI5yEJV22IBve5NmbAg>
Feedback-ID: iac594737:Fastmail
Date: Thu, 15 Dec 2022 11:00:48 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/12] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Message-ID: <Y5tEsuvxE4j0I86T@itl-email>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <6a0d969d0aade0258e108009ef33ad5d2663e969.1671057808.git.demi@invisiblethingslab.com>
 <a44afad2-4b63-a830-1ed9-2bd87e8aecde@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4A7ZhUqlpk9A9BBA"
Content-Disposition: inline
In-Reply-To: <a44afad2-4b63-a830-1ed9-2bd87e8aecde@suse.com>


--4A7ZhUqlpk9A9BBA
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Dec 2022 11:00:48 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/12] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()

On Thu, Dec 15, 2022 at 09:46:41AM +0100, Jan Beulich wrote:
> On 15.12.2022 00:11, Demi Marie Obenour wrote:
> > get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
> > the face of future PAT changes.  Use the proper _PAGE_* constants
> > instead.  Also, treat the two unused cases as if they are cacheable, as
> > future changes may make them cacheable.
>=20
> This still does not cover ...
>=20
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -959,14 +959,19 @@ get_page_from_l1e(
> >              flip =3D _PAGE_RW;
> >          }
> > =20
> > +        /* Force cacheable memtypes to UC */
> >          switch ( l1f & PAGE_CACHE_ATTRS )
> >          {
> > -        case 0: /* WB */
> > -            flip |=3D _PAGE_PWT | _PAGE_PCD;
> > +        case _PAGE_UC:
> > +        case _PAGE_UCM:
> > +        case _PAGE_WC:
> > +            /* not cached */
> >              break;
> > -        case _PAGE_PWT: /* WT */
> > -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> > -            flip |=3D _PAGE_PCD | (l1f & _PAGE_PAT);
> > +        case _PAGE_WB:
> > +        case _PAGE_WT:
> > +        case _PAGE_WP:
> > +        default:
> > +            flip |=3D (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
> >              break;
>=20
> ... the three cases here assuming certain properties wrt the flipping of
> _PAGE_UC. As said before - going from one kind of assumption to another
> _may_ be a good thing to do, but needs justifying as actually being an
> improvement. Alternatively such assumptions could be checked by suitable
> BUILD_BUG_ON(), which then at the same serve as documentation thereof.
>=20
> Jan

I think I understand your point now: this still assumes that the two
unused types are not UCM or WC, but this is not documented anywhere.  I
will move this to after the patch that introduces the X86_MT_* flags,
which will allow me to switch on (XEN_MSR_PAT >> pte_flags_to_cacheattr(l1f=
))
instead without having to change the code again in a subsequent patch.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--4A7ZhUqlpk9A9BBA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmObRLIACgkQsoi1X/+c
IsEIERAAlIUdu37WHwu/d7aZnYe2mDgSm7CtWLKgFA/2OFDBPYnh/tiS8EzNLY/3
Ur2GPGVvkEjcNX/Qbtafa+wJrpq4sG+YpbYnGm+dkGzwVYWdMIQ1Wswi8h0zVdhj
yTEqRufJa0ATpsQQ3ZnixGTepTUwWti+3MbD0LiRAo5NBuZkJKet3kkOqlbjBVqy
MoO64RSz4OSBJ6byMiWsgAe5rI8V5/68oKghCzc4aAB5weLyzLgDJpJ2sRrmIvdq
sz3JEOliiz2v0FNYOU4BK+0zvSvZLMO/LNeF8jboTDxE4kfOYI5xlfLCQfER039c
m4CLs0AxW1S9q5KVg2pETy+k2QU81flURhB2QZI4iF2MnBmakgPWjsgQU5WI71Oh
m0t0UN5RpbY67SAdwuYvOxurJ7OD3CHZHxjbvE7DlzeSKMbNhED7YSkP4LeeyB4w
+du6jag2UxsZ/LN2+rDIkkWA7MK0zhwBHYzqBzCmZaQB83mrTzaKn0iqMKWCpxOD
Y6Ky35zXKLHUTO3jbsV6BqLEjZgXorDxMrKJTe5t4cdXxvPPklJGy5CCgrh9r3Pm
GaE5J9vsnlxDOKasPnquG+wVAWHHiSm24r0UgDtkxpCZyzAJ4Dn+kEpBAgKSjkTW
nwg3AGGtidy48vf6NLXIAl2+9TBExEB5bgepGbW4Wyic11fWkSY=
=/ZrJ
-----END PGP SIGNATURE-----

--4A7ZhUqlpk9A9BBA--

