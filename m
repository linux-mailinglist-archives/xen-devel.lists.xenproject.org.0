Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31596482B7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 14:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457891.715839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3dEc-0004y2-RE; Fri, 09 Dec 2022 13:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457891.715839; Fri, 09 Dec 2022 13:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3dEc-0004us-O9; Fri, 09 Dec 2022 13:16:14 +0000
Received: by outflank-mailman (input) for mailman id 457891;
 Fri, 09 Dec 2022 13:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKBv=4H=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p3dEb-0004um-8e
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 13:16:13 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a204b090-77c3-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 14:16:07 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3A1533200904;
 Fri,  9 Dec 2022 08:16:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 09 Dec 2022 08:16:02 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Dec 2022 08:16:00 -0500 (EST)
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
X-Inumbo-ID: a204b090-77c3-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670591761; x=
	1670678161; bh=PhnIp8wmGOYZkwEFgfVpgvNVhWVd57DXr2teMfgswQ8=; b=n
	4XkcQd+tQNF5QYxMBao3ldeQoRZYFYKBSijBpvILXXastBoClZPa5KnQqrv2Exwb
	VMs/UURpmhUDIau5J+AvPrsBvDG8tYmQVU9WMl+zDhgwfzIE0Wwo5WuRaU82N7PD
	G+FTzBKo0U3zYS9HikWI6BjqI4kZ3SwxAW9d/Ol7MxnclT6pVQRy2QXr2Ef25SMd
	+me/hKKbOIF/U59hQoU0rWa+mUtkT7VTelnVDc0UCVRGR44vZXpGVass+rpk8gUj
	f57a5o0k5mbwJYFZHN/ujUizMvDeOpNuy03VCPNaH2Og4GaUDxbzlycQyQDUjBUc
	Y8WjOyrUzfpuC7A3CeNNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670591761; x=1670678161; bh=PhnIp8wmGOYZkwEFgfVpgvNVhWVd
	57DXr2teMfgswQ8=; b=o791l6CAL5ItNg17QQ6+UEWsIhRF9HIr/FWZGrPycniO
	WVILoEt/4uC3AOc+6ED+Y97PkgwWbKTb04lZGucNkKVIFZLhJRRBZZ+7PEwO1TPA
	z3ktCP7PI9n/xy/vwk1XB7RsnsE1AH4bjsul5bazIcn0AqiBZYIkcvQpMLx90lUY
	xb94EBSHR70FUEGXZ3bfielNhkhYRcavJ7wWYe+i6ywrs84TN/go1qqM+/Cwl9aQ
	IOjEpx7TgD8QN1PjKdebomw9KnM9on3XyWS9KumrusjNftaGa2XAtglkn8yg1p08
	dwKEIKOVccDM/AkrjowtYH/Q2xWl6eeqFBuLnucNbw==
X-ME-Sender: <xms:ETWTYylsxiWMMHl0vh1JJhZPHiCSjFD6JP9uL6V377ulQ84Gr_y-sw>
    <xme:ETWTY53_auYyexk7nJPw1lvrEEuw6eM-Wurm_R0Jeu22ZsHAqds2MHTv-CwA0LQcZ
    qkV71qA4_VHowY>
X-ME-Received: <xmr:ETWTYwo8Uv-zU5VhU0VbhtClpaR_wqi1ofMOVJBczL5Fiymgd51g0IShNeZO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:ETWTY2n4D-Lfqcjljmfe8oPbLcAhjGXqVY5K6fviTiNogjrdKrJuzg>
    <xmx:ETWTYw3fCuVigBS-gd_A4U6AiKTNRTP_k8XOyQu4SW0fALC_dCsPsw>
    <xmx:ETWTY9tC6bDbHuy1JNmGNdl3YhKvbQ6k9E9oBbM61b4ZK186sLBbPA>
    <xmx:ETWTY9wI50IIZk99E3_h3L5YOpByESW95U4-sMLLi5Lk4M6Km-q6GQ>
Feedback-ID: iac594737:Fastmail
Date: Fri, 9 Dec 2022 08:15:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Message-ID: <Y5M1D4w44uIddxNn@itl-email>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
 <AS8PR08MB7991E4EE490EC8B028BB1D2F921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <5ce98ff4-6b7d-2254-d755-a68fc3ac67b4@xen.org>
 <AS8PR08MB7991A81EEEC33451800CAF97921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W4bAIgRAj/9KfQGT"
Content-Disposition: inline
In-Reply-To: <AS8PR08MB7991A81EEEC33451800CAF97921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>


--W4bAIgRAj/9KfQGT
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 9 Dec 2022 08:15:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT

On Fri, Dec 09, 2022 at 07:37:53AM +0000, Henry Wang wrote:
> Hi Julien,
>=20
> > -----Original Message-----
> > From: Julien Grall <julien@xen.org>
> > Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
> >=20
> > Hi,
> >=20
> > >>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > >>
> > >> Acked-by: Jan Beulich <jbeulich@suse.com>
> > >>
> > >>> Should this be included in 4.17?  It is a bug fix for a feature new=
 to
> > >>> 4.17, so I suspect yes, but it is ultimately up to Henry Wang.  The=
 code
> > >>> is identical to v2, but I have improved the commit message.
> > >>
> > >> It may be too late now, looking at the state of the tree. Henry, Jul=
ien?
> > >
> > > Like I said in v2, I don't object the change if you would like to inc=
lude this
> > patch
> > > to 4.17, so if you are sure this patch is safe and want to commit it,=
 feel free
> > to add:
> > >
> > > Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> > >
> > > Since we also need to commit:
> > > "[PATCH for-4.17] SUPPORT.md: Define support lifetime" so from my side
> > > I am no problem. Julien might have different opinion though, if Julien
> > object
> > > the change I would like to respect his opinion and leave this patch
> > uncommitted.
> >=20
> > I have committed it after SUPPORT.md. So if for some reasons we are seen
> > any issues with Osstest, then I can tag the tree without this patch
>=20
> This is a great solution :)
>=20
> > (that said, I would rather prefer if we have staging-4.17 =3D=3D stable=
-4.17).
>=20
> Looks like now staging-4.17 =3D=3D stable-4.17 now, with this patch pushe=
d.
> So we are ready to tag.

And it turns out that I botched the initial patch, sorry.  (I forgot to
handle the multiboot2 case.)

I understand if it is too late for stable-4.17, but it ought to make
stable 4.17.1 as it was simply omitted from the initial patch series.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--W4bAIgRAj/9KfQGT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOTNQ8ACgkQsoi1X/+c
IsGrRQ//bj415rBPN9LoTW5VUGS448GgOtsCaGLBUnnz8wnU2rFD4oEF12TrNAwT
vPGi7Pavax9SlVLzSVqD41TtxaLlyMQRBiCknG638U5Bv1uFj04mOwoKvys+Q3xK
QIBvuX/cPoqwsATvjmr5HEZQ+0fZ8wi7p/VxaSBdqIbbw7MS8vW1+jDA702qwCoK
MCM51Dx0Wa++wrQdNK4sNsmCHnjHkCet0A96AbwIRnBBLcycPfdCqqBF3zzM8tMM
KxDjoYU0jVINLXwmI3pcym4gPl8m5Ro5mrVYlMickEtEmjQcuWdQ3ie1UlO33RFk
WW7UHJRw6RmSbeGtt+O3mCDJQlmbc0wBG8p9nVN25X60XIxaIeDVNoPKg2ZwbfPK
c22PM4BigGbjAAmksXqUe/SkGz2R0XTvlRl1ox1a8sy9Mnl4ysDTX8NXOmIz3Y6m
tsV4zcm3pzP9kgL0LC/8CoRxDL40mrkuHGMqB2ren+EHotrR9Dq49Q/cO/r695FZ
LJutxKJK6YrbUO4a8NXLv5JKZKSCPB024TJIvh4pdsw/yTAstYoO76JduehDrii2
ljKNtX/gLdM4KpOwlsW3UHlAYNTlt4xlKH9ofxHgxZSGo99Dj2QN8KoNRjDGtVaX
hmXxJxJzpwfDIhedxgAv9xL3fK2beXdfkaLNhTWpkgxTsSVg0Uw=
=olSy
-----END PGP SIGNATURE-----

--W4bAIgRAj/9KfQGT--

