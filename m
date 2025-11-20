Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CC8C71B03
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 02:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166513.1493028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLtYh-0002UW-Pk; Thu, 20 Nov 2025 01:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166513.1493028; Thu, 20 Nov 2025 01:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLtYh-0002SN-N0; Thu, 20 Nov 2025 01:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1166513;
 Thu, 20 Nov 2025 01:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcKq=54=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vLtYg-0002SH-HI
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 01:34:02 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc70d2c9-c5b0-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 02:33:59 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 613107A01CA;
 Wed, 19 Nov 2025 20:33:58 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 19 Nov 2025 20:33:58 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Nov 2025 20:33:57 -0500 (EST)
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
X-Inumbo-ID: fc70d2c9-c5b0-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763602438;
	 x=1763688838; bh=wuJD3DSi8OYU3lUxQFLU0p35HJ4OYc6gCIDGnNAlOPM=; b=
	QDFrUVPP+LNUgAZmD50+3ugOYMpuL5Qgt8BZGi1Ue5B9EScrpVuWepB60btVWvyT
	jMq7h7v4W56nTq9s+Fw6nwPwNfo7k+scurhlpMgoAI5eE6YKw6QB8LOl3MyyVCKL
	5KydYlIqH0TkA/mTSUgtljQZi8ivcS3kN1O/SnIqOrQdslDIyOOZrrFFRS4tUzTx
	7b/ewHHeq2mBbV/JQPX4g+Y+xcBGmjGo921kC+RFrj2VF2ne7dXQS3RBRQaz1345
	RkuqbUMga1+mKuKrkBBu9s2bDmSI0aorErfZhldw4BSBU6FitamUZjZDjTLbn0LT
	HSnm5KdYLPo9KeDt+mbpDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763602438; x=1763688838; bh=wuJD3DSi8OYU3lUxQFLU0p35HJ4OYc6gCID
	GnNAlOPM=; b=Mq/pv3uHH7BNGu4214QS1wxbjcQpJ5GxD9hIbP675ubuq/XoKf9
	jTsODOYmyD/qS8aNjIYAOMkfHwzaiikJ762u4hsxu/MOWpygqpSjO1d4I4x3rxlB
	+8B+hOBpXzKixRgOW1G3uT6LQ0nLNI4N1iqv9Ic18iUJw7LlfZ6G13C1+VS494/4
	+88LsYUJNeXU706JMOyDmpBzTyD1ucGR6HR0pL1KyHAIQ06m5FByFsx6PT74xZx2
	ZKorrV4l43LX7ehDIF1NhRQtQilLKsB3qWmIIg3i4+nMP4RGmKMvGUOUI/m6t8mD
	KAGbnFT+tUgpLH0DzAF2gv8V6DPcHcRwfEA==
X-ME-Sender: <xms:BXAeaRXhuk30CgPimr9cYnVJO3YAm4cm61zL9m1Vghlbgu5yZe4c4w>
    <xme:BXAeaYl0VRfcrAVk_fsGFGIKH6jKOwIYTe85mkLnQKcbQsJYGF3QEbsrhwmJ2OtqS
    ZqxObh0eNiTMQzJ1TtRJLRPWZR5vi5kORufZkh7-CFSRQtUtX8>
X-ME-Received: <xmr:BXAeaSbCS2AYLozmRcRNvmTW90tpK9AKzi8_ldOxPzNq7h1_jWA1qUObLGQZt545514sOwGwxkJuZA6YPkEA-xcOgakiFrUCy6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdehjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepfffhgfeu
    ueffvdegudejgefhjeehvdekgfetgefgkeeguefgheejvefhfefhledunecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghdpthhrmhhmrdhnvghtpdhlughsrdhssgenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestg
    hithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:BXAeaTPc19jXjcyR8GZoSAHWYVc3ffz5iRmlbpjYKvIRHVQ9OWFfeQ>
    <xmx:BXAeaXbJAyp_dcCMzljKHTsXqUC2EDUKawKq7hQPF8ikp-Ai1oa5Mw>
    <xmx:BXAeaR0Z-6XcA6s_kDZ63GnOiNn_qzrfD0Tsh_OtFC9s7tqDKxZXgA>
    <xmx:BXAeadfSIBk6HNveGQ7N3GHfHhre1Qm8TYLmsU1yzsU4G_mdpVnoxg>
    <xmx:BnAeaQmfYjnfS6X7WT1HhEx2nM1lR0RiOAvN3bYF6t6eRmjpmyLrw2pH>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Nov 2025 02:33:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen: Fix EFI buildid alignment
Message-ID: <aR5wA-9cdEO6gG3x@mail-itl>
References: <20251119191235.863187-1-marmarek@invisiblethingslab.com>
 <ded843d3-465b-419a-9342-cb3a35a2d880@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DAa+bDPYJnjL4Miu"
Content-Disposition: inline
In-Reply-To: <ded843d3-465b-419a-9342-cb3a35a2d880@citrix.com>


--DAa+bDPYJnjL4Miu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Nov 2025 02:33:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen: Fix EFI buildid alignment

On Thu, Nov 20, 2025 at 12:43:57AM +0000, Andrew Cooper wrote:
> On 19/11/2025 7:12 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Old binutils get confused about .buildid overlapping (in VA space) with
> > earlier section. That confusion results in weird errors down the road,
> > like this one:
> >
> >     objcopy: xen.efi: Data Directory size (1c) exceeds space left in se=
ction (8)
> >
> > While the bug is fixed in later binutils version, force alignment of the
> > buildid to avoid overlapping and make it work with older versions too.
> > This can be reverted once toolchain base is raised at or above binutils
> > 2.36.
> >
> > Details at:
> > https://lore.kernel.org/all/3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9=
htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=3D@trmm.ne=
t/
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > Fixes: eee5909e9d1e ("x86/EFI: use less crude a way of generating the b=
uild ID")
>=20
> We typically put these tags in the other order.=C2=A0 I can fix on commit.
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>=20
> > ---
> > While the actual bug apparently is in binutils, the commit mentioned in
> > Fixes: tag introduced part that triggers that bug.
> > ---
> >  xen/arch/x86/xen.lds.S | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> > index 5d02f83a409c..967f9167f757 100644
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -171,6 +171,8 @@ SECTIONS
> >         __note_gnu_build_id_end =3D .;
> >    } PHDR(note) PHDR(text)
> >  #elif defined(BUILD_ID_EFI)
> > +  /* Workaround bug in binutils < 2.38 */
>=20
> ... this says 2.38, but the commit message says 2.36.=C2=A0 Which one is =
it?

2.36

> ~Andrew
>=20
> > +  . =3D ALIGN(32);
> >    DECL_SECTION(.buildid) {
> >         __note_gnu_build_id_start =3D .;
> >         *(.buildid)
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DAa+bDPYJnjL4Miu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkecAMACgkQ24/THMrX
1yw1DAf9HI/2dqAmbNUhlxCqHuwEmycePCPH1vhGDek6zhK9IKj1yJkyEPJt3OdX
04U0iu8zYxj0HEmKRL3F6deIoD5cwfVyTmeAmW7qwYHLIK6h7bw/zY98L7x/lMzT
6x4PTjFj/Z2CH0ExY7kHzXRnHOaVJ4gIC7MwrOOx7rV1Rg8uFvGVNaKY5yQH/EV/
jZ1/67K9cN9K+Wbf0jL/oc5yJMsDX4diH2NC/Hkg40FR33nhFnifPYoTuCl5Ok3/
0iQTNODCKX8gze2vuZrb+hBYBAcyJnc0zFTPQ/sX03kuckw0rjQQpqH1ORz4Nz0L
MH1uWSGsneRVOa/LnhBAxD7Kp+ywwg==
=hECE
-----END PGP SIGNATURE-----

--DAa+bDPYJnjL4Miu--

