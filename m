Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746E949464
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 17:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772919.1183360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbLzx-0002G1-3e; Tue, 06 Aug 2024 15:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772919.1183360; Tue, 06 Aug 2024 15:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbLzx-0002Dq-0p; Tue, 06 Aug 2024 15:21:17 +0000
Received: by outflank-mailman (input) for mailman id 772919;
 Tue, 06 Aug 2024 15:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9A+u=PF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sbLzv-0002Dk-Jf
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 15:21:15 +0000
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8246e722-5407-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 17:21:10 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 886391389716;
 Tue,  6 Aug 2024 11:21:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 06 Aug 2024 11:21:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Aug 2024 11:21:08 -0400 (EDT)
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
X-Inumbo-ID: 8246e722-5407-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1722957669;
	 x=1723044069; bh=rUeUpyM7lcuXXD37NZVfHe8cuZcDSbwZr4aitJQxSa8=; b=
	u38mMJibfdPMwqwbKxrVOA1bHAd41OT7PeBEW0+yWxs32miEhrXiUsiOg4+AZKF5
	CAapq7IH/i/6Q6HM/tSJSKsPgq5sXrNk5647FMF/0fjMOBnV1KS8ssdmPNQyrQnP
	/PvTuG4xAdz3ZUVVoc6lEs8nF/EvY5j7X9mVszi8igfCZejuribwKIaLUyQ/4iyt
	6TiZVHLjsqGqVcuC/zZHh3Y1N+1gnNOWTGwK88m0KPh+m4JGbWB5KfnZBAhm4xjp
	M0xvWONT4GWuZzLHqubxJ82B3+tmdTRE1YktOVvzvFqz8Eu/YMcwBWW8ngQNvj98
	QGJ/u6MNz8BAR82Alh/OmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722957669; x=1723044069; bh=rUeUpyM7lcuXXD37NZVfHe8cuZcD
	SbwZr4aitJQxSa8=; b=BFwyOZ7mG2sxmxsuOD3SoeuDoFBMmHqa9DcainY698Ha
	pJXcSQlNf3kdzO2JHNnTR8J/B1ZFQ3E1/VqDAGuxZ3D1EVWINngi4rK5D6aXKP3K
	OX656mN4N5kiyEqwWedGu2fA+EDlGEKr+YRyC8oSFSuURGNiVKE2FXvsz1U1yjy4
	iV+LRBrrHE3WyH/tXTTuKipLNF8n9mhOKmH6uL7Zb0cUUS5EZYUMpNTp0MTsvYGB
	W/PgBL7QVT4RnpmdCGoNJxbatw19TOhxpx+xMfTVozz3dmFoSMWAza03+HYaMNif
	9BFzMKk1U/LCOe/F69MZN2cg2TKYLR09egN8yIzsbA==
X-ME-Sender: <xms:ZT-yZhDhnX-J0OrLbX0cx4evNlv9PbuLqbBs0B5l1xHTRNgIOgGXMw>
    <xme:ZT-yZvhPI9EU5lH2jk-RMwCIYz7r8MKrMujEvmkuEYYtjvqO2QWTVQcEFkcUraJFU
    6eF1gMJ1HJNvA>
X-ME-Received: <xmr:ZT-yZsk04oXTUG3v6YT0t1RLAY01FXxQkxsHGli8P8J10V8stuhSaaETozwATsxICG-kjlM72xBrG7Z2Kj1yDm60PRkya4motw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeekgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetueeg
    fefhffdvffetleeltdelkedvlefhkeehgfehhffhheehudeitdegheejleenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:ZT-yZrx77HhOZkunAu8klgNJNnfcnwG5ezgmdx1HFGRjas95plJ1Ng>
    <xmx:ZT-yZmRbb0lQlbd8fPFm3GK8RyHTGOTZR5LpadW-p8FvBkz9ZO6WSA>
    <xmx:ZT-yZuZdnMnqphdUsWrbKeX0pqZruavHfngVMBC_JIAFnAowBs6_YA>
    <xmx:ZT-yZnQwlso1s_X5PKkClKxLOAOMRU9SuWPxPUJxwBVy87ZgKCxMrg>
    <xmx:ZT-yZhfxXK_z2qPVxpglmrgasOq9-XvK7y9V485kXV5XlI37iblupN3E>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 6 Aug 2024 17:21:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
Message-ID: <ZrI_YSBSiC7w5iP6@mail-itl>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl>
 <6a7508dd-9f81-4fce-9c83-8b4fae924d48@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+/Jd73saw8PY1hkU"
Content-Disposition: inline
In-Reply-To: <6a7508dd-9f81-4fce-9c83-8b4fae924d48@suse.com>


--+/Jd73saw8PY1hkU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Aug 2024 17:21:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)

On Tue, Aug 06, 2024 at 04:12:32PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> Marek,
>=20
> On 17.06.24 16:03, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
> > > Hello,
> > >=20
> > > while it feels like we had a similar situation before, I can't seem t=
o be
> > > able to find traces thereof, or associated (Linux) commits.
> >=20
> > Is it some AMD Threadripper system by a chance? Previous thread on this
> > issue:
> > https://lore.kernel.org/xen-devel/CAOCpoWdOH=3DxGxiQSC1c5Ueb1THxAjH4WiZ=
bCZq-QT+d_KAk3SA@mail.gmail.com/
> >=20
> > > With
> > >=20
> > > (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
> > > ...
> > > (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 page=
s to be allocated)
> > > ...
> > > (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
> > >=20
> > > the kernel occupies the space from 16Mb to 64Mb in the initial alloca=
tion.
> > > Page tables come (almost) directly above:
> > >=20
> > > (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
> > >=20
> > > I.e. they're just above the 64Mb boundary. Yet sadly in the host E820=
 map
> > > there is
> > >=20
> > > (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
> > >=20
> > > i.e. a non-RAM range starting at 64Mb. The kernel (currently) won't t=
olerate
> > > such an overlap (also if it was overlapping the kernel image, e.g. if=
 on the
> > > machine in question s sufficiently much larger kernel was used). Yet =
with its
> > > fundamental goal of making its E820 match the host one I'm also in tr=
ouble
> > > thinking of possible solutions / workarounds. I certainly do not see =
Xen
> > > trying to cover for this, as the E820 map re-arrangement is purely a =
kernel
> > > side decision (forward ported kernels got away without, and what e.g.=
 the
> > > BSDs do is entirely unknown to me).
> >=20
> > In Qubes we have worked around the issue by moving the kernel lower
> > (CONFIG_PHYSICAL_START=3D0x200000):
> > https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac1682370977=
d4d0dc1d782c428d860282
> >=20
> > Far from ideal, but gets it bootable...
> >=20
>=20
> could you test the attached kernel patches? They should fix the issue wit=
hout
> having to modify CONFIG_PHYSICAL_START.
>=20
> I have tested them to boot up without problem on my test system, but I do=
n't
> have access to a system showing the E820 map conflict you are seeing.
>=20
> The patches have been developed against kernel 6.11-rc2, but I think they
> should apply to a 6.10 and maybe even an older kernel.

Sure, but tomorrow-ish.

> If possible it would be nice to verify suspend to disk still working, as
> the kernel will need to access the ACPI NVS area in this case.

That might be harder, as Qubes OS doesn't support suspend to disk, but
I'll see if something can be done.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+/Jd73saw8PY1hkU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmayP2EACgkQ24/THMrX
1yw1rwf/dK/+E6YFeHh5RyUesBDO8XGSgWFN00iLaDoop3SZGuTYPBoQXia18raw
nWWbsYkUEKnuBOFZw8wt7eKAF9wL5iUOrd+7SPeWuIdvpmaqovEQr86yK7oXG9nq
OBBteiYXMpf4wtxsGh9gY3yINo7qGeSCSzjHyETuHI0mHpIAL1pso+vtLL40v67s
iA0RBg2vbGUBTSWGe0lQBKJ71sqjz//5x8v9SKlYidoME4KCZneCvHz6g2QdtKPX
fUeLdr/wZTbQZKg1StLQmISR8s4Hdjby9Ed7XYPgHfaQASSjLsXitT5HYc2fy+eF
XfXmghlrK49cOl//Z498UFj1klad2Q==
=OpvJ
-----END PGP SIGNATURE-----

--+/Jd73saw8PY1hkU--

