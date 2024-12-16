Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E41D9F2F80
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857805.1270015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9NW-0004e2-Cz; Mon, 16 Dec 2024 11:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857805.1270015; Mon, 16 Dec 2024 11:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9NW-0004cH-9G; Mon, 16 Dec 2024 11:35:10 +0000
Received: by outflank-mailman (input) for mailman id 857805;
 Mon, 16 Dec 2024 11:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tN9NV-0004Oq-Cn
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:35:09 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc614700-bba1-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 12:35:07 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id D19A61383E9E;
 Mon, 16 Dec 2024 06:35:05 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 16 Dec 2024 06:35:05 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Dec 2024 06:35:04 -0500 (EST)
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
X-Inumbo-ID: cc614700-bba1-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734348905;
	 x=1734435305; bh=DKeD6oR0WFoQA/n3ucu51GQJu3RG4ED6fJOAjXzrlKY=; b=
	MAy3QnFrdOopvIKLpL1jtBC0hMBHPd3wToHcBT9v92VcQB/di8kAg0v8d+XsR3TO
	1FEHaaCJYSeMf2rLPxlI6dhAU5ylxYMVvf/+h/4LoSdMuo9FfzlJUIVgvSfVJeiR
	e+k9iEcLYBMlCMAdClz1IRiM43dp0rA/VPg3pm9yTV5vAUgN8ZzklNvUW5KUTXpD
	/Q+7D8/md6MC4weDSrxOid/+0alFzuaGTAMtdV/1ubLeNmVsCBKizjTZZbqa7PLQ
	OPfxsoP78dTjvCEthCWYbUQKiBSksEwvEHpKqRNSlStUpbojMv8bLRens1rTfYbH
	wAInis2NfBM5SicbyakYFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734348905; x=1734435305; bh=DKeD6oR0WFoQA/n3ucu51GQJu3RG4ED6fJO
	AjXzrlKY=; b=PmxH1gtsXGCovOlrK9WA0jRBb+JMK6vzAIuOYUaIp9opXJ4k1lZ
	OQHDh71sClW75PnwXnpwO+OXvUGvBqewhhuU3mf4NlnC4UYu0hM7bbGqmvhLLbgn
	FS7V2fSrO/RKe0dn0KL8DX0yvqLSWlHm4Oky8LAWIibJl/ogbBJLZy3J2zasMbXg
	qU2huHmsv1CSVZBmc7XZfaxRrdfVqiRGwS0qufQSDExc4Ld3A0QlR5zr4k16uSX1
	oPHTSbEznHmif7PTZjrKKKZTNBYreAD2Wx97uCITzLnhyJfPpgCdQT7Nxvi5ikiN
	o3JMVxfTOjUAIMY9e6Sq8l9j0IReaZAleLg==
X-ME-Sender: <xms:aRBgZzGy7TC2JAIBGDqTWQPxmd4lQkoQgB6ITnC6lpVL-zkKOfFsew>
    <xme:aRBgZwUBb25H4avVbixhx2QEOaKCUso7jG--h-eicbm6Gn6r3YCq5TSO1cmbehYp4
    y8pXaswPrOEyg>
X-ME-Received: <xmr:aRBgZ1JFKv6Z3CPBAygBv2mM9AsvLrIxLRpB1YXT80NSFdY4V6s_JSc0a0jBNq54tMdtiEcNGK_BCvivrVyDXPCjACHnWedVdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohhgvghr
    rdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopeholhgvkhhsihhirdhkuhhroh
    gthhhkohesghhmrghilhdrtghomhdprhgtphhtthhopehjghhrohhsshesshhushgvrdgt
    ohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhope
    grnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprghn
    thhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:aRBgZxGcwnrHyDnX2GEm63hpVtFgaCflzhAi4FCaSEQHmIPHqt33YQ>
    <xmx:aRBgZ5V9A_eQkM-exuoH0Cx7VoXE_g0pMZtc8SSzzG76CE5MpS6W2w>
    <xmx:aRBgZ8PykstO1FRrlBYNZAzDBRxL-VWMglvlvJ8vB1-xb1M3VhrCTQ>
    <xmx:aRBgZ40gDgxAN8pXBo9B_S6y2MdIMx0qrreIRDWkf2rjs3u23eG__A>
    <xmx:aRBgZ4HW3jDgXfodoYI1tRkHxTBo98ywrqk0eFJa2lv_EHQlZ60OBYsm>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 16 Dec 2024 12:35:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
Message-ID: <Z2AQZnRw6CwxQ4mo@mail-itl>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com>
 <ZwZScGr75xEolDnS@mail-itl>
 <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
 <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
 <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
 <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
 <e7ebec95-e6f0-491f-8fb4-afe7ee505b07@suse.com>
 <ZwZ_IoNFwDjTaFi1@mail-itl>
 <Z1_mWbWnwNOG64ji@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FyyhMwKxTCf/oLKa"
Content-Disposition: inline
In-Reply-To: <Z1_mWbWnwNOG64ji@macbook.local>


--FyyhMwKxTCf/oLKa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Dec 2024 12:35:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel

On Mon, Dec 16, 2024 at 09:35:37AM +0100, Roger Pau Monn=C3=A9 wrote:
> Adding Oleksii, as this IMO wants to be a blocker for 4.20.
>=20
> On Wed, Oct 09, 2024 at 03:03:28PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Oct 09, 2024 at 01:38:32PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 09.10.24 13:15, Jan Beulich wrote:
> > > > On 09.10.2024 13:08, Andrew Cooper wrote:
> > > > > On 09/10/2024 11:26 am, Juergen Gross wrote:
> > > > > > On 09.10.24 12:19, Jan Beulich wrote:
> > > > > > > On 09.10.2024 11:52, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > On Wed, Oct 09, 2024 at 09:19:57AM +0200, Jan Beulich wrote:
> > > > > > > > > On 08.10.2024 23:32, Marek Marczykowski-G=C3=B3recki wrot=
e:
> > > > > > > > > > --- a/tools/libs/guest/xg_dom_bzimageloader.c
> > > > > > > > > > +++ b/tools/libs/guest/xg_dom_bzimageloader.c
> > > > > > > > > > @@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
> > > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return retval;
> > > > > > > > > >  =C2=A0 }
> > > > > > > > > >  =C2=A0 -/* 128 Mb is the minimum size (half-way) docum=
ented to work for
> > > > > > > > > > all inputs. */
> > > > > > > > > > -#define LZMA_BLOCK_SIZE (128*1024*1024)
> > > > > > > > > > +#define LZMA_BLOCK_SIZE (256*1024*1024)
> > > > > > > > >=20
> > > > > > > > > That's as arbitrary as before, now just not even with a c=
omment at
> > > > > > > > > least
> > > > > > > > > hinting at it being arbitrary. Quoting from one of the LZ=
MA API
> > > > > > > > > headers:
> > > > > > > > >=20
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 * Decoder already supports dict=
ionaries up to 4 GiB - 1 B (i.e.
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 * UINT32_MAX), so increasing th=
e maximum dictionary size of the
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 * encoder won't cause problems =
for old decoders.
> > > > > > > > >=20
> > > > > > > > > IOW - what if the Linux folks decided to increase the dic=
tionary size
> > > > > > > > > further? I therefore wonder whether we don't need to make=
 this more
> > > > > > > > > dynamic, perhaps by peeking into the header to obtain the=
 dictionary
> > > > > > > > > size used. The one thing I'm not sure about is whether th=
ere can't be
> > > > > > > > > multiple such headers throughout the file, and hence (in =
principle)
> > > > > > > > > differing dictionary sizes.
> > > > > > > >=20
> > > > > > > > What is the purpose of this block size limit? From the error
> > > > > > > > message, it
> > > > > > > > seems to be avoiding excessive memory usage during decompre=
ssion (which
> > > > > > > > could be DoS via OOM). If that's the case, then taking the =
limit from
> > > > > > > > the kernel binary itself will miss this point (especially i=
n case of
> > > > > > > > pygrub or similar, but there may be other cases of not-full=
y-trusted
> > > > > > > > kernel binaries).
> > > > > > >=20
> > > > > > > Indeed. The question then simply is: Where do we want to draw=
 the line
> > > > > > > between what we permit and what we reject?
> > > > > >=20
> > > > > > IMHO the most natural solution would be to use guest memory for=
 this
> > > > > > purpose.
> > > > > > OTOH this probably would require a significant rework of libxen=
guest.
> > > > >=20
> > > > > That was XSA-25.=C2=A0 There are toolstack-provided limits on ker=
nel&initrd
> > > > > sizes.
> > > >=20
> > > > Which probably can't be directly applied to dictionary size used du=
ring
> > > > (de)compression.
> > >=20
> > > My point still stands: using GUEST memory for all the decompression w=
ork
> > > would avoid all these problems. If the guest memory isn't sufficient,=
 a
> > > decompression by e.g. grub wouldn't work either.
> >=20
> > Doing that would probably require mapping guest memory to dom0 for this
> > purpose. And probably quite severe changes to the decompressing code
> > (liblzma?) to actually use that memory instead of standard heap. I don't
> > think it's a feasible short term fix.
> > Theoretically this could be made configurable (if nothing else, then via
> > an env variable or even build-time setting...), but honestly it feels
> > like an overkill.
>=20
> As a compromise that could likely be done in time for the release,
> would it be feasible to fetch the dictionary size from the header and
> cap it at certain boundary using max(<header val>, <boundary>)?

Isn't the current constant more or less that already? It's named
LZMA_BLOCK_SIZE, but the lzma_stream_decoder() argument it's used for is
"memlimit", described as "Memory usage limit as bytes".

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FyyhMwKxTCf/oLKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdgEGYACgkQ24/THMrX
1ywUEAf8DnKhBMfk3WH01oo2e1rftTx1GdeB0Wo47vrVDpebEai9c1ZgND+qX5Kp
LEuM7wfZpYldv5ERezhprsP4mkHOJ/PLv5u5TuZl62j3mhEbJFXHIld9rIRckLrA
WED4YqwuSLygEE3jvMxNMyb+nra/FNEoudY3FCbi1wl4vOQpBei+Rmf15rbwC48N
tzufxFEC1idIdabUnSroBHuVDfTTpnLAzBqj4if2cD5Zu0HdHvh3PXqz9Bma2elw
efJZ9daR1zZuxulRAP8OSRaNVeo+H1Kpskgw59UUFnVDx6rdYr8XIhY0E03Ytd6u
WEMKWVlLfw+wVa3RPUNoi2mDpgevOg==
=xzL6
-----END PGP SIGNATURE-----

--FyyhMwKxTCf/oLKa--

