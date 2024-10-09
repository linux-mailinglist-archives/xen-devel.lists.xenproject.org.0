Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC81996B4B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814477.1228039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWLq-0007sH-TJ; Wed, 09 Oct 2024 13:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814477.1228039; Wed, 09 Oct 2024 13:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWLq-0007pu-Qh; Wed, 09 Oct 2024 13:03:38 +0000
Received: by outflank-mailman (input) for mailman id 814477;
 Wed, 09 Oct 2024 13:03:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FS1=RF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1syWLp-0007pn-IH
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:03:37 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3f2a4dd-863e-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 15:03:35 +0200 (CEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id BE7011140134;
 Wed,  9 Oct 2024 09:03:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Wed, 09 Oct 2024 09:03:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Oct 2024 09:03:32 -0400 (EDT)
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
X-Inumbo-ID: e3f2a4dd-863e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728479013;
	 x=1728565413; bh=squVh82A+17agJhu9kUlsgyrf2aSoEqr3LWa8V+7ZyI=; b=
	jbR9Jqht7lmfx03NyRwHGB5cG5E+C9TEW4O5WNJiNh4Ob3h4zNTf/n2dQN81WIge
	TlKrmG+aoMM8L8nLD3GEGqI36hMLXG6OqGhn70EHuY6XGpgU3o4xJhN2B18baSTT
	JRHvH0jPEqhhSIncmq1mbWhMWUiY3fcvvypwgAlg4WZQ3w6auG0h5Iy/zJezbQPG
	LE8OJ6FpCjJWa3cTx+0QI+EkIFphxju+7aL44ldWvk80k7zOHWDGLR78YvB/haci
	E9p+ICo3Sh8qjK6dGYwu8xafC6ld5JWYI+xY2ez2lCG6HSsCN3lpkpYzCRsRFYMU
	Ozkb5zUrpT8SquplauHKZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728479013; x=1728565413; bh=squVh82A+17agJhu9kUlsgyrf2aS
	oEqr3LWa8V+7ZyI=; b=Nupojcs2/Vm/Ys6ZA2VQggpwB5dRgTJsmJ8fvUYa5fbe
	5yh4jhQ55Y5uACHN7PlreUJeEdYBeulzD35+/vw1uQJCvgX32LYSoNEU/F4XpR0q
	a1+Am3E3wj0Bm/+vlIThLV8zJuQOVxL3saqXwVxhbx0U+tGgEUH2/2+IZrtO0qae
	Kn127d0x6hly45Qv39VYizl5waGz9Q1MiyxQ15uEsLWrxFxFJzxDA/UuFisDX6z3
	28TlAsIRSDDt1IrvUqYJ4vyzUXlDmImEHH12YQimTwsY1xMxlmFlZv5qmXt5cdxi
	WnYaBpIcvLsbOXBnUklAiT+s7QUlogK8NZ1XDSVPFg==
X-ME-Sender: <xms:JX8GZ4uk--R95ILBZBRA15ICY9aeIQ7GY-8GIvf1IgNr-xofC3E23Q>
    <xme:JX8GZ1cNFBeFyRITmxgaipOZ0JwbAypUMXOfcl8MNMMmZ4Y_w2riZ0xfvJhjslemY
    m0DcHoWds7S0Q>
X-ME-Received: <xmr:JX8GZzwwGo1T--5gMXkHAFztENb3C83wuS5rD6iOaNAGYu-SvcosFtog4TON-isbaTZi1c2z8-ixkY8M6ldfwx4HDEXwakA0OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeffedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhgrhho
    shhssehsuhhsvgdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtoh
    hmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdp
    rhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:JX8GZ7Pdr1-HdsFDA234QhhY3NbfnEEbXFlSbXXNOsZTVQ7-1vHayA>
    <xmx:JX8GZ4_7V5buv_wQ-3Qf7nEK1zW_hNJUA_LZrihqucMIsfQcO8WM9A>
    <xmx:JX8GZzUyM3pkavxbj-d4K4wxLuh8B1mpAt-18itRiEx8zTe9wt14fQ>
    <xmx:JX8GZxeQYbgDWKJY9TU0LMkUxbJPWjNNJvJISdC6iMM5svJRmIrTTw>
    <xmx:JX8GZ8ZqVs7LGxwOKeArdMzQs-895e9IeCF6HzrgBjQ6q7QfXCoYVS4O>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Oct 2024 15:03:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
Message-ID: <ZwZ_IoNFwDjTaFi1@mail-itl>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com>
 <ZwZScGr75xEolDnS@mail-itl>
 <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
 <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
 <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
 <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
 <e7ebec95-e6f0-491f-8fb4-afe7ee505b07@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RQ3gHDxdVH0J8CGD"
Content-Disposition: inline
In-Reply-To: <e7ebec95-e6f0-491f-8fb4-afe7ee505b07@suse.com>


--RQ3gHDxdVH0J8CGD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Oct 2024 15:03:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel

On Wed, Oct 09, 2024 at 01:38:32PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 09.10.24 13:15, Jan Beulich wrote:
> > On 09.10.2024 13:08, Andrew Cooper wrote:
> > > On 09/10/2024 11:26 am, Juergen Gross wrote:
> > > > On 09.10.24 12:19, Jan Beulich wrote:
> > > > > On 09.10.2024 11:52, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > On Wed, Oct 09, 2024 at 09:19:57AM +0200, Jan Beulich wrote:
> > > > > > > On 08.10.2024 23:32, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > --- a/tools/libs/guest/xg_dom_bzimageloader.c
> > > > > > > > +++ b/tools/libs/guest/xg_dom_bzimageloader.c
> > > > > > > > @@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
> > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return retval;
> > > > > > > >  =C2=A0 }
> > > > > > > >  =C2=A0 -/* 128 Mb is the minimum size (half-way) documente=
d to work for
> > > > > > > > all inputs. */
> > > > > > > > -#define LZMA_BLOCK_SIZE (128*1024*1024)
> > > > > > > > +#define LZMA_BLOCK_SIZE (256*1024*1024)
> > > > > > >=20
> > > > > > > That's as arbitrary as before, now just not even with a comme=
nt at
> > > > > > > least
> > > > > > > hinting at it being arbitrary. Quoting from one of the LZMA A=
PI
> > > > > > > headers:
> > > > > > >=20
> > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 * Decoder already supports dictiona=
ries up to 4 GiB - 1 B (i.e.
> > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 * UINT32_MAX), so increasing the ma=
ximum dictionary size of the
> > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 * encoder won't cause problems for =
old decoders.
> > > > > > >=20
> > > > > > > IOW - what if the Linux folks decided to increase the diction=
ary size
> > > > > > > further? I therefore wonder whether we don't need to make thi=
s more
> > > > > > > dynamic, perhaps by peeking into the header to obtain the dic=
tionary
> > > > > > > size used. The one thing I'm not sure about is whether there =
can't be
> > > > > > > multiple such headers throughout the file, and hence (in prin=
ciple)
> > > > > > > differing dictionary sizes.
> > > > > >=20
> > > > > > What is the purpose of this block size limit? From the error
> > > > > > message, it
> > > > > > seems to be avoiding excessive memory usage during decompressio=
n (which
> > > > > > could be DoS via OOM). If that's the case, then taking the limi=
t from
> > > > > > the kernel binary itself will miss this point (especially in ca=
se of
> > > > > > pygrub or similar, but there may be other cases of not-fully-tr=
usted
> > > > > > kernel binaries).
> > > > >=20
> > > > > Indeed. The question then simply is: Where do we want to draw the=
 line
> > > > > between what we permit and what we reject?
> > > >=20
> > > > IMHO the most natural solution would be to use guest memory for this
> > > > purpose.
> > > > OTOH this probably would require a significant rework of libxengues=
t.
> > >=20
> > > That was XSA-25.=C2=A0 There are toolstack-provided limits on kernel&=
initrd
> > > sizes.
> >=20
> > Which probably can't be directly applied to dictionary size used during
> > (de)compression.
>=20
> My point still stands: using GUEST memory for all the decompression work
> would avoid all these problems. If the guest memory isn't sufficient, a
> decompression by e.g. grub wouldn't work either.

Doing that would probably require mapping guest memory to dom0 for this
purpose. And probably quite severe changes to the decompressing code
(liblzma?) to actually use that memory instead of standard heap. I don't
think it's a feasible short term fix.
Theoretically this could be made configurable (if nothing else, then via
an env variable or even build-time setting...), but honestly it feels
like an overkill.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RQ3gHDxdVH0J8CGD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcGfyIACgkQ24/THMrX
1yyDvggAh2Pi0Dskb2/8UOse7aRnfwMAdrw0rOhHEpE8tmMpwwwcrPAj5RXr67Jl
7WY+iyJNs5/skr+lw7s+v2r80P9lWaUVntZdSZeAXKjpfIw563mIhwbirbLU4KXl
T/ox4dMwJjGh3qUqtHwIAsjFz50dQpBDmvRnmcBrt4aBpv8FwSr3YVvHhK5sjQC8
cDjVbvXlr4TFDq6TyF6PLP4Ua2sbSo322k1COwrRS/2KFqU8p/s7xwn60xWzTYMn
8HxhrR8ztWspMZtn+u0siWcuQzNuFVZIW4dwgXvzcCT5gWaMUR/Ak391u2k9oerb
z3B3zf0F3iSPQTlNBbBZetbHilpb6A==
=AtHa
-----END PGP SIGNATURE-----

--RQ3gHDxdVH0J8CGD--

