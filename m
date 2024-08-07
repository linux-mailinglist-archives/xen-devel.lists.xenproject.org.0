Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D7E94A54B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 12:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773271.1183710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdp9-0002nF-NP; Wed, 07 Aug 2024 10:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773271.1183710; Wed, 07 Aug 2024 10:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdp9-0002kw-KH; Wed, 07 Aug 2024 10:23:19 +0000
Received: by outflank-mailman (input) for mailman id 773271;
 Wed, 07 Aug 2024 10:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSOH=PG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sbdp7-0002kq-FS
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 10:23:17 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df80900-54a7-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 12:23:15 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id C54FE138FCA0;
 Wed,  7 Aug 2024 06:23:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Aug 2024 06:23:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Aug 2024 06:23:12 -0400 (EDT)
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
X-Inumbo-ID: 0df80900-54a7-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1723026193;
	 x=1723112593; bh=80J6FeQYU8px2uFNfNGWbopbgbf7TT2mOrZHsdYDB7k=; b=
	XNTPs+vAcQ4LB8gFumm4T3FrFOmWMIsGk5zJs3sLhqiAArOiXJUq2ghUjBiO27AQ
	/xd56YZYeu1NyeugR9PBHb2zMnKRX7iJrWcZTEklEOYaxHNxK86/4hnzRFfM42dM
	kl54/Mnc8gUHmu+wmWblVARykUozRIyAXSHmmf9LrUynkDKIr6KFp1kxBiMn1CC2
	+9WmEV2Ychjtm+K50DX7we8q5szJOyucqSNwYwRiLjS5Eux3RVwTIrcccVmA/3Y7
	GEHqYb+Cy/nFp/VkpnvqU9zYe+p88u84TuDq7o2fJ7DcSLXp0dI/wwpZeflvx9/Z
	/K7aGckF/Kebm4OgYQNppg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723026193; x=1723112593; bh=80J6FeQYU8px2uFNfNGWbopbgbf7
	TT2mOrZHsdYDB7k=; b=Bm7kKK97UljXv5nV8EuczXBu5S9n0uSnGUpZRKZI9uGE
	GjJhfsia6Lvch3vOiZb8oM5oLHoJ2UlPQP+neCBwuOtvqom/D3yLcoJBSRyEKWwJ
	w02XY0EdkLt/7tmSpjoOX7i78DNR712/H9yXX9kX3/pZVRyGJdLaKZMzQnt5SJKo
	TdPjPvaTaenwtoR6K3sV3qjlfMKxfuypnlA2IiRbO8kYFJ/X+KOesWyltLa9Z0uh
	ktTcsFL2vSia6CxQxhnOliWao3Q7e2mrYhFp4/QBqO3LLapgxmyhmoz6LVZJ840R
	Tef8xntddqlEjP7GPjSi0JoO6KLh2HXL56RBSEgHlQ==
X-ME-Sender: <xms:EUuzZtZI4NoVn7QP7-Z7GxsXtcMY70t_4uMYJa2Wb8GU-ApPeNbtUw>
    <xme:EUuzZkZjLbT2igo5yeQx_38EXrJas0gXg-kvnKv2P1Til0yP7Orz5Mh0rqTzr_nop
    iIqqEMtZ9ixtw>
X-ME-Received: <xmr:EUuzZv-AbK4Izuw-KUp3W8_ncSHiRcInDbCep5bXy_4zRSZHYHsGGX5KYPzl2qloX5KmVNwqg6GWGGfU9YhOJ3N9GwgpON_CQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledtgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetueeg
    fefhffdvffetleeltdelkedvlefhkeehgfehhffhheehudeitdegheejleenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:EUuzZrpyDxJoGwxYGI3iynBQmqSZzNNtwgVCc86rEDgKI9ca5mZjuA>
    <xmx:EUuzZoq5Yt21W_zh_rsXbQYAQVDDtUanX6Fg2952kBfeNX2gW01bfQ>
    <xmx:EUuzZhSY2S0kjJ_2yAKau_tOcusWPAzzFPCGsrv5leLUq_WyoR5eCg>
    <xmx:EUuzZgpKVQH-9swHA8MlS_sEO95lh1NVd1SnKi4C-LBmELc6SXzVSQ>
    <xmx:EUuzZv2tsx5lNxgwvqRGET5IQB845l1TnC7X1wtzyLLVeqaG0ewRomBT>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 7 Aug 2024 12:23:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
Message-ID: <ZrNLDmRC_5DC_1K3@mail-itl>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl>
 <6a7508dd-9f81-4fce-9c83-8b4fae924d48@suse.com>
 <ZrI_YSBSiC7w5iP6@mail-itl>
 <1dc37ba4-c0ef-4be7-9699-31cf839c6deb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uerYtl9e1WjgzsRn"
Content-Disposition: inline
In-Reply-To: <1dc37ba4-c0ef-4be7-9699-31cf839c6deb@suse.com>


--uerYtl9e1WjgzsRn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Aug 2024 12:23:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)

On Tue, Aug 06, 2024 at 05:24:22PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 06.08.24 17:21, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 06, 2024 at 04:12:32PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > Marek,
> > >=20
> > > On 17.06.24 16:03, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
> > > > > Hello,
> > > > >=20
> > > > > while it feels like we had a similar situation before, I can't se=
em to be
> > > > > able to find traces thereof, or associated (Linux) commits.
> > > >=20
> > > > Is it some AMD Threadripper system by a chance? Previous thread on =
this
> > > > issue:
> > > > https://lore.kernel.org/xen-devel/CAOCpoWdOH=3DxGxiQSC1c5Ueb1THxAjH=
4WiZbCZq-QT+d_KAk3SA@mail.gmail.com/
> > > >=20
> > > > > With
> > > > >=20
> > > > > (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
> > > > > ...
> > > > > (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 =
pages to be allocated)
> > > > > ...
> > > > > (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
> > > > >=20
> > > > > the kernel occupies the space from 16Mb to 64Mb in the initial al=
location.
> > > > > Page tables come (almost) directly above:
> > > > >=20
> > > > > (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
> > > > >=20
> > > > > I.e. they're just above the 64Mb boundary. Yet sadly in the host =
E820 map
> > > > > there is
> > > > >=20
> > > > > (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
> > > > >=20
> > > > > i.e. a non-RAM range starting at 64Mb. The kernel (currently) won=
't tolerate
> > > > > such an overlap (also if it was overlapping the kernel image, e.g=
=2E if on the
> > > > > machine in question s sufficiently much larger kernel was used). =
Yet with its
> > > > > fundamental goal of making its E820 match the host one I'm also i=
n trouble
> > > > > thinking of possible solutions / workarounds. I certainly do not =
see Xen
> > > > > trying to cover for this, as the E820 map re-arrangement is purel=
y a kernel
> > > > > side decision (forward ported kernels got away without, and what =
e.g. the
> > > > > BSDs do is entirely unknown to me).
> > > >=20
> > > > In Qubes we have worked around the issue by moving the kernel lower
> > > > (CONFIG_PHYSICAL_START=3D0x200000):
> > > > https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac168237=
0977d4d0dc1d782c428d860282
> > > >=20
> > > > Far from ideal, but gets it bootable...
> > > >=20
> > >=20
> > > could you test the attached kernel patches? They should fix the issue=
 without
> > > having to modify CONFIG_PHYSICAL_START.
> > >=20
> > > I have tested them to boot up without problem on my test system, but =
I don't
> > > have access to a system showing the E820 map conflict you are seeing.
> > >=20
> > > The patches have been developed against kernel 6.11-rc2, but I think =
they
> > > should apply to a 6.10 and maybe even an older kernel.
> >=20
> > Sure, but tomorrow-ish.
>=20
> Thanks.

Seems to work :)

Snippets from Xen log:

    (XEN) EFI RAM map:
    (XEN)  [0000000000000000, 000000000009ffff] (usable)
    (XEN)  [00000000000a0000, 00000000000fffff] (reserved)
    (XEN)  [0000000000100000, 0000000003ffffff] (usable)
    (XEN)  [0000000004000000, 0000000004011fff] (ACPI NVS)
    (XEN)  [0000000004012000, 0000000009df1fff] (usable)
    (XEN)  [0000000009df2000, 0000000009ffffff] (reserved)
    (XEN)  [000000000a000000, 00000000a8840fff] (usable)
    (XEN)  [00000000a8841000, 00000000a9d9ffff] (reserved)
    (XEN)  [00000000a9da0000, 00000000a9dd4fff] (ACPI data)
    (XEN)  [00000000a9dd5000, 00000000a9dd5fff] (reserved)
    (XEN)  [00000000a9dd6000, 00000000a9f20fff] (ACPI data)
    (XEN)  [00000000a9f21000, 00000000aa099fff] (ACPI NVS)
    (XEN)  [00000000aa09a000, 00000000ab1fefff] (reserved)
    (XEN)  [00000000ab1ff000, 00000000abffffff] (usable)
    (XEN)  [00000000ac000000, 00000000afffffff] (reserved)
    (XEN)  [00000000b2500000, 00000000b2580fff] (reserved)
    (XEN)  [00000000b3580000, 00000000b3600fff] (reserved)
    (XEN)  [00000000e2100000, 00000000e2280fff] (reserved)
    (XEN)  [00000000fa180000, 00000000fa200fff] (reserved)
    (XEN)  [00000000fa300000, 00000000fa3fffff] (reserved)
    (XEN)  [00000000fea00000, 00000000feafffff] (reserved)
    (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
    (XEN)  [00000000fec10000, 00000000fec10fff] (reserved)
    (XEN)  [00000000fed00000, 00000000fed00fff] (reserved)
    (XEN)  [00000000fed40000, 00000000fed44fff] (reserved)
    (XEN)  [00000000fed80000, 00000000fed8ffff] (reserved)
    (XEN)  [00000000fedc2000, 00000000fedcffff] (reserved)
    (XEN)  [00000000fedd4000, 00000000fedd5fff] (reserved)
    (XEN)  [00000000fee00000, 00000000feefffff] (reserved)
    (XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
    (XEN)  [0000000100000000, 000000104f1fffff] (usable)
    (XEN)  [000000104f200000, 000000104fffffff] (reserved)
    (XEN)  [0000010000000000, 00000100103fffff] (reserved)
    (XEN)  [0000018030000000, 00000180403fffff] (reserved)
    (XEN)  [0000018060000000, 00000180703fffff] (reserved)
    (XEN)  [0000020090000000, 00000200a03fffff] (reserved)
    ...
    (XEN) Dom0 has maximum 1400 PIRQs
    (XEN)  Xen  kernel: 64-bit, lsb
    (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4800000
    (XEN) PHYSICAL MEMORY ARRANGEMENT:
    (XEN)  Dom0 alloc.:   0000001010000000->0000001018000000 (1000315 pages=
 to be allocated)
    (XEN)  Init. ramdisk: 000000104b57b000->000000104f1ffe72
    (XEN) VIRTUAL MEMORY ARRANGEMENT:
    (XEN)  Loaded kernel: ffffffff81000000->ffffffff84800000
    (XEN)  Phys-Mach map: 0000008000000000->0000008000800000
    (XEN)  Start info:    ffffffff84800000->ffffffff848004b8
    (XEN)  Page tables:   ffffffff84801000->ffffffff8482a000
    (XEN)  Boot stack:    ffffffff8482a000->ffffffff8482b000
    (XEN)  TOTAL:         ffffffff80000000->ffffffff84c00000
    (XEN)  ENTRY ADDRESS: ffffffff838b7640

So, it would indeed conflict with the ACPI NVS region, but the system
started, and later dom0 reports this region remapped:

    [    0.000000] BIOS-provided physical RAM map:
    [    0.000000] Xen: [mem 0x0000000000000000-0x000000000007ffff] usable
    [    0.000000] Xen: [mem 0x0000000000080000-0x00000000000fffff] reserved
    [    0.000000] Xen: [mem 0x0000000000100000-0x0000000009df1fff] usable
    [    0.000000] Xen: [mem 0x0000000009df2000-0x0000000009ffffff] reserved
    [    0.000000] Xen: [mem 0x000000000a000000-0x00000000a8840fff] usable
    [    0.000000] Xen: [mem 0x00000000a8841000-0x00000000a9d9ffff] reserved
    [    0.000000] Xen: [mem 0x00000000a9da0000-0x00000000a9dd4fff] ACPI da=
ta
    [    0.000000] Xen: [mem 0x00000000a9dd5000-0x00000000a9dd5fff] reserved
    [    0.000000] Xen: [mem 0x00000000a9dd6000-0x00000000a9f20fff] ACPI da=
ta
    [    0.000000] Xen: [mem 0x00000000a9f21000-0x00000000aa099fff] ACPI NVS
    [    0.000000] Xen: [mem 0x00000000aa09a000-0x00000000ab1fefff] reserved
    [    0.000000] Xen: [mem 0x00000000ab1ff000-0x00000000abffffff] usable
    [    0.000000] Xen: [mem 0x00000000ac000000-0x00000000afffffff] reserved
    [    0.000000] Xen: [mem 0x00000000b2500000-0x00000000b2580fff] reserved
    [    0.000000] Xen: [mem 0x00000000b3580000-0x00000000b3600fff] reserved
    [    0.000000] Xen: [mem 0x00000000e2100000-0x00000000e2280fff] reserved
    [    0.000000] Xen: [mem 0x00000000fa180000-0x00000000fa200fff] reserved
    [    0.000000] Xen: [mem 0x00000000fa300000-0x00000000fa3fffff] reserved
    [    0.000000] Xen: [mem 0x00000000fea00000-0x00000000feafffff] reserved
    [    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
    [    0.000000] Xen: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
    [    0.000000] Xen: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
    [    0.000000] Xen: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
    [    0.000000] Xen: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
    [    0.000000] Xen: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
    [    0.000000] Xen: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
    [    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
    [    0.000000] Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
    [    0.000000] Xen: [mem 0x0000000100000000-0x0000000156c4bfff] usable
    [    0.000000] Xen: [mem 0x000000104f1ee000-0x000000104f1fffff] ACPI NVS
    [    0.000000] Xen: [mem 0x000000104f200000-0x000000104fffffff] reserved
    [    0.000000] Xen: [mem 0x0000010000000000-0x00000100103fffff] reserved
    [    0.000000] Xen: [mem 0x0000018030000000-0x00000180403fffff] reserved
    [    0.000000] Xen: [mem 0x0000018060000000-0x00000180703fffff] reserved
    [    0.000000] Xen: [mem 0x0000020090000000-0x00000200a03fffff] reserved

> > > If possible it would be nice to verify suspend to disk still working,=
 as
> > > the kernel will need to access the ACPI NVS area in this case.
> >=20
> > That might be harder, as Qubes OS doesn't support suspend to disk, but
> > I'll see if something can be done.
>=20
> Thinking about it - can this ever work with Xen?

Indeed, this is not going to work.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uerYtl9e1WjgzsRn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmazSw4ACgkQ24/THMrX
1yyg8Af9GhBq2YLPw3mNXP+C2KTJD5nhqHIS6j+43PnwCq5eECfGytfRSIZBSfpH
QvrBeUCNDn48bwKmI+i00e0vnv58IaMmYXr/+d2xoQFNKaiIKuiqki9TBQIu1xlK
nFQ1SKzCfREe6XQIYHn9i5WIOQrvEP6af4kVeE49bdGuLmGqC7rOgcxdAJW2sdo3
UxMSEex5KNXDbuOYhoCkRfcywep7jaTdEQQvDARmudjxJ42VsVOnQoOcqHVNsi4Y
pL52DKKR8kU0DhlwiUf7Nv+8U6pdK0vw2/Dup6iJhzU0CB1UpnSZfLzD/c45JhdK
WRpOthDYjZoyrLcZe5PTMSZJClq20g==
=MaVz
-----END PGP SIGNATURE-----

--uerYtl9e1WjgzsRn--

