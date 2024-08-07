Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF194A57A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 12:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773290.1183731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdvC-0004N3-Lv; Wed, 07 Aug 2024 10:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773290.1183731; Wed, 07 Aug 2024 10:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdvC-0004KX-II; Wed, 07 Aug 2024 10:29:34 +0000
Received: by outflank-mailman (input) for mailman id 773290;
 Wed, 07 Aug 2024 10:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSOH=PG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sbdvB-0004KR-DS
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 10:29:33 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaf11689-54a7-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 12:29:25 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id AE886138FCB7;
 Wed,  7 Aug 2024 06:29:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Aug 2024 06:29:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Aug 2024 06:29:28 -0400 (EDT)
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
X-Inumbo-ID: eaf11689-54a7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1723026569;
	 x=1723112969; bh=cTdfBIzfd5Ast37IVVf9UsEEPljcZyHaeZvmiHWtIE4=; b=
	OzyWNo0mr8O+BpG6I8Bev3Ew75a1uLGeVGMYn+TCt/CvrAN1HXkOx11OWVM3l3aG
	eujCLB/GRrIwr4p+tnfChrtWnrQW9H2WWQ+MWFvVEIXmilY6zsn1fTy8PbDB7IoU
	J1kpvDPiyrYJb3TUHO0rcAt2si5imXSUg6/XzXDz2Yf7RY1KrK1MXfMQGAnoAzG9
	0zDW4bu4nH9g1EP1hZfQIzkteLlTTsZvkWeJdkxgo5ZAMrJxM7pToIa8R7+S5r07
	VQpJdeWMRqWHToBe0yA+4sI0QhIhyRFQmPzmfdZFIcKbrxU/4xNoyzXkzLyy8o6f
	fwWXByp68fndsHpIretMIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723026569; x=1723112969; bh=cTdfBIzfd5Ast37IVVf9UsEEPljc
	ZyHaeZvmiHWtIE4=; b=TBm4kcp69Qzmm+7VM5GGKHMOvSByYLMHQi/HqJ0eADGq
	qlIxwItdGJlJCYjfD1HS69C6M1shx8naiGZN2z/OAFlGy1eqNvCTkRvrbOfOjY0/
	LDzoYEOl/IZOZire5JEXbgr6uT3NO5mT5CssbXXxmFl92WN5pxXFun2J6HviPTsq
	eZJO2uKx3wCEheugW+YciRUxmHOGh66fEkTKwzoAnee0/eUjDSW4Iih16W5nfzqI
	lf2UcXacsRwC21uZLYWd4Vvl1Ioqd/e3hYk2f2bS4RNrfL0vPacazBobbeUiSzFV
	NNdoAW1Ma93U3W2mAc+fKbZQPmEv7PTfm7CqFUrbFQ==
X-ME-Sender: <xms:iUyzZsz4K_w8x_HJXBLf78XedBxVOgDCCFZHSbkfVP72pmdo4m8ITw>
    <xme:iUyzZgRTRmxgoER6-SWaejyu_Aam7jHKB8wOjf4XZM25qVbiLQeG8uiv_oKF6uEdV
    qDTKn7ZAHlInQ>
X-ME-Received: <xmr:iUyzZuVIlz_Vyo4PpVFMMhgVpFv9srZ_nlqn7f7VqQcVKz1gCEtyBR5sY0SotjRSo8vj1viTvAgdj8eCK6aO0OqB3d6yIFbkKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledtgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetueeg
    fefhffdvffetleeltdelkedvlefhkeehgfehhffhheehudeitdegheejleenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:iUyzZqgz5ww-8QDCSXYOKmwkLtTHVSPtz9haBmLd80vKJPB6O2u9og>
    <xmx:iUyzZuCy_cFVGnf19T3lZZZwIfHRyFOvH5-p7k6FN4J2n37-WeNhhw>
    <xmx:iUyzZrIFIS8A4OgqgnY2Yc6e-NK4AwHuA6mywfwpMxV3gbsUzCQCQA>
    <xmx:iUyzZlDq4spQpofWChOjzoGNvllIchDEavt88c6a5ehxiLjd1rMvLQ>
    <xmx:iUyzZhM8-EoEF3tPdjhfUc5EYUQc11ZTmTlTX9nAx8V_eiOfAMvgzmko>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 7 Aug 2024 12:29:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
Message-ID: <ZrNMhZ9F2b1syvio@mail-itl>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl>
 <6a7508dd-9f81-4fce-9c83-8b4fae924d48@suse.com>
 <ZrI_YSBSiC7w5iP6@mail-itl>
 <1dc37ba4-c0ef-4be7-9699-31cf839c6deb@suse.com>
 <ZrNLDmRC_5DC_1K3@mail-itl>
 <73dd2dea-d3bc-490e-b5a4-3d426cf5660b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N7pNbbSHyZYMHRjm"
Content-Disposition: inline
In-Reply-To: <73dd2dea-d3bc-490e-b5a4-3d426cf5660b@suse.com>


--N7pNbbSHyZYMHRjm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Aug 2024 12:29:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)

On Wed, Aug 07, 2024 at 12:26:26PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 07.08.24 12:23, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 06, 2024 at 05:24:22PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 06.08.24 17:21, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Tue, Aug 06, 2024 at 04:12:32PM +0200, J=C3=BCrgen Gro=C3=9F wro=
te:
> > > > > Marek,
> > > > >=20
> > > > > On 17.06.24 16:03, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
> > > > > > > Hello,
> > > > > > >=20
> > > > > > > while it feels like we had a similar situation before, I can'=
t seem to be
> > > > > > > able to find traces thereof, or associated (Linux) commits.
> > > > > >=20
> > > > > > Is it some AMD Threadripper system by a chance? Previous thread=
 on this
> > > > > > issue:
> > > > > > https://lore.kernel.org/xen-devel/CAOCpoWdOH=3DxGxiQSC1c5Ueb1TH=
xAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com/
> > > > > >=20
> > > > > > > With
> > > > > > >=20
> > > > > > > (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x40=
00000
> > > > > > > ...
> > > > > > > (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619=
175 pages to be allocated)
> > > > > > > ...
> > > > > > > (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
> > > > > > >=20
> > > > > > > the kernel occupies the space from 16Mb to 64Mb in the initia=
l allocation.
> > > > > > > Page tables come (almost) directly above:
> > > > > > >=20
> > > > > > > (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
> > > > > > >=20
> > > > > > > I.e. they're just above the 64Mb boundary. Yet sadly in the h=
ost E820 map
> > > > > > > there is
> > > > > > >=20
> > > > > > > (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
> > > > > > >=20
> > > > > > > i.e. a non-RAM range starting at 64Mb. The kernel (currently)=
 won't tolerate
> > > > > > > such an overlap (also if it was overlapping the kernel image,=
 e.g. if on the
> > > > > > > machine in question s sufficiently much larger kernel was use=
d). Yet with its
> > > > > > > fundamental goal of making its E820 match the host one I'm al=
so in trouble
> > > > > > > thinking of possible solutions / workarounds. I certainly do =
not see Xen
> > > > > > > trying to cover for this, as the E820 map re-arrangement is p=
urely a kernel
> > > > > > > side decision (forward ported kernels got away without, and w=
hat e.g. the
> > > > > > > BSDs do is entirely unknown to me).
> > > > > >=20
> > > > > > In Qubes we have worked around the issue by moving the kernel l=
ower
> > > > > > (CONFIG_PHYSICAL_START=3D0x200000):
> > > > > > https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac16=
82370977d4d0dc1d782c428d860282
> > > > > >=20
> > > > > > Far from ideal, but gets it bootable...
> > > > > >=20
> > > > >=20
> > > > > could you test the attached kernel patches? They should fix the i=
ssue without
> > > > > having to modify CONFIG_PHYSICAL_START.
> > > > >=20
> > > > > I have tested them to boot up without problem on my test system, =
but I don't
> > > > > have access to a system showing the E820 map conflict you are see=
ing.
> > > > >=20
> > > > > The patches have been developed against kernel 6.11-rc2, but I th=
ink they
> > > > > should apply to a 6.10 and maybe even an older kernel.
> > > >=20
> > > > Sure, but tomorrow-ish.
> > >=20
> > > Thanks.
> >=20
> > Seems to work :)
> >=20
> > Snippets from Xen log:
> >=20
> >      (XEN) EFI RAM map:
> >      (XEN)  [0000000000000000, 000000000009ffff] (usable)
> >      (XEN)  [00000000000a0000, 00000000000fffff] (reserved)
> >      (XEN)  [0000000000100000, 0000000003ffffff] (usable)
> >      (XEN)  [0000000004000000, 0000000004011fff] (ACPI NVS)
> >      (XEN)  [0000000004012000, 0000000009df1fff] (usable)
> >      (XEN)  [0000000009df2000, 0000000009ffffff] (reserved)
> >      (XEN)  [000000000a000000, 00000000a8840fff] (usable)
> >      (XEN)  [00000000a8841000, 00000000a9d9ffff] (reserved)
> >      (XEN)  [00000000a9da0000, 00000000a9dd4fff] (ACPI data)
> >      (XEN)  [00000000a9dd5000, 00000000a9dd5fff] (reserved)
> >      (XEN)  [00000000a9dd6000, 00000000a9f20fff] (ACPI data)
> >      (XEN)  [00000000a9f21000, 00000000aa099fff] (ACPI NVS)
> >      (XEN)  [00000000aa09a000, 00000000ab1fefff] (reserved)
> >      (XEN)  [00000000ab1ff000, 00000000abffffff] (usable)
> >      (XEN)  [00000000ac000000, 00000000afffffff] (reserved)
> >      (XEN)  [00000000b2500000, 00000000b2580fff] (reserved)
> >      (XEN)  [00000000b3580000, 00000000b3600fff] (reserved)
> >      (XEN)  [00000000e2100000, 00000000e2280fff] (reserved)
> >      (XEN)  [00000000fa180000, 00000000fa200fff] (reserved)
> >      (XEN)  [00000000fa300000, 00000000fa3fffff] (reserved)
> >      (XEN)  [00000000fea00000, 00000000feafffff] (reserved)
> >      (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
> >      (XEN)  [00000000fec10000, 00000000fec10fff] (reserved)
> >      (XEN)  [00000000fed00000, 00000000fed00fff] (reserved)
> >      (XEN)  [00000000fed40000, 00000000fed44fff] (reserved)
> >      (XEN)  [00000000fed80000, 00000000fed8ffff] (reserved)
> >      (XEN)  [00000000fedc2000, 00000000fedcffff] (reserved)
> >      (XEN)  [00000000fedd4000, 00000000fedd5fff] (reserved)
> >      (XEN)  [00000000fee00000, 00000000feefffff] (reserved)
> >      (XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
> >      (XEN)  [0000000100000000, 000000104f1fffff] (usable)
> >      (XEN)  [000000104f200000, 000000104fffffff] (reserved)
> >      (XEN)  [0000010000000000, 00000100103fffff] (reserved)
> >      (XEN)  [0000018030000000, 00000180403fffff] (reserved)
> >      (XEN)  [0000018060000000, 00000180703fffff] (reserved)
> >      (XEN)  [0000020090000000, 00000200a03fffff] (reserved)
> >      ...
> >      (XEN) Dom0 has maximum 1400 PIRQs
> >      (XEN)  Xen  kernel: 64-bit, lsb
> >      (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4800000
> >      (XEN) PHYSICAL MEMORY ARRANGEMENT:
> >      (XEN)  Dom0 alloc.:   0000001010000000->0000001018000000 (1000315 =
pages to be allocated)
> >      (XEN)  Init. ramdisk: 000000104b57b000->000000104f1ffe72
> >      (XEN) VIRTUAL MEMORY ARRANGEMENT:
> >      (XEN)  Loaded kernel: ffffffff81000000->ffffffff84800000
> >      (XEN)  Phys-Mach map: 0000008000000000->0000008000800000
> >      (XEN)  Start info:    ffffffff84800000->ffffffff848004b8
> >      (XEN)  Page tables:   ffffffff84801000->ffffffff8482a000
> >      (XEN)  Boot stack:    ffffffff8482a000->ffffffff8482b000
> >      (XEN)  TOTAL:         ffffffff80000000->ffffffff84c00000
> >      (XEN)  ENTRY ADDRESS: ffffffff838b7640
> >=20
> > So, it would indeed conflict with the ACPI NVS region, but the system
> > started, and later dom0 reports this region remapped:
> >=20
> >      [    0.000000] BIOS-provided physical RAM map:
> >      [    0.000000] Xen: [mem 0x0000000000000000-0x000000000007ffff] us=
able
> >      [    0.000000] Xen: [mem 0x0000000000080000-0x00000000000fffff] re=
served
> >      [    0.000000] Xen: [mem 0x0000000000100000-0x0000000009df1fff] us=
able
> >      [    0.000000] Xen: [mem 0x0000000009df2000-0x0000000009ffffff] re=
served
> >      [    0.000000] Xen: [mem 0x000000000a000000-0x00000000a8840fff] us=
able
> >      [    0.000000] Xen: [mem 0x00000000a8841000-0x00000000a9d9ffff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000a9da0000-0x00000000a9dd4fff] AC=
PI data
> >      [    0.000000] Xen: [mem 0x00000000a9dd5000-0x00000000a9dd5fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000a9dd6000-0x00000000a9f20fff] AC=
PI data
> >      [    0.000000] Xen: [mem 0x00000000a9f21000-0x00000000aa099fff] AC=
PI NVS
> >      [    0.000000] Xen: [mem 0x00000000aa09a000-0x00000000ab1fefff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000ab1ff000-0x00000000abffffff] us=
able
> >      [    0.000000] Xen: [mem 0x00000000ac000000-0x00000000afffffff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000b2500000-0x00000000b2580fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000b3580000-0x00000000b3600fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000e2100000-0x00000000e2280fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fa180000-0x00000000fa200fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fa300000-0x00000000fa3fffff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fea00000-0x00000000feafffff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec00fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fec10000-0x00000000fec10fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fed00000-0x00000000fed00fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fed40000-0x00000000fed44fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fed80000-0x00000000fed8ffff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fedc2000-0x00000000fedcffff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fedd4000-0x00000000fedd5fff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] re=
served
> >      [    0.000000] Xen: [mem 0x00000000ff000000-0x00000000ffffffff] re=
served
> >      [    0.000000] Xen: [mem 0x0000000100000000-0x0000000156c4bfff] us=
able
> >      [    0.000000] Xen: [mem 0x000000104f1ee000-0x000000104f1fffff] AC=
PI NVS
> >      [    0.000000] Xen: [mem 0x000000104f200000-0x000000104fffffff] re=
served
> >      [    0.000000] Xen: [mem 0x0000010000000000-0x00000100103fffff] re=
served
> >      [    0.000000] Xen: [mem 0x0000018030000000-0x00000180403fffff] re=
served
> >      [    0.000000] Xen: [mem 0x0000018060000000-0x00000180703fffff] re=
served
> >      [    0.000000] Xen: [mem 0x0000020090000000-0x00000200a03fffff] re=
served
>=20
> Thanks for the testing!
>=20
> Are you fine with me adding your "Tested-by:"?

Yes.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--N7pNbbSHyZYMHRjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmazTIUACgkQ24/THMrX
1yyPQwf+N873r4L+YrVWbzv//XPsToEKjYfrGW2KEBtqtvwcG9t+wFEmT6b/4g7s
qwwWmw5rQCwli+NfyahsedtWg6qhpG2gVhkgxWVP9zidOCX9cZ22ICJRaKfXAYgb
AVayH4ESMrV5h/sT5OpH7ty+1Uwbqf4nMFCwmmGJ9yVYiKwf0cyw5ROgU4O3fNDU
XCAYpwy5fYV/YD4+cEhfIhGsF058o4qyI8WLQaYvrdqltSldtlABiqP9t2im7Ag3
aS/J1nIYM+t5U5WXvxEXItpbLVOEt2gqOKSoAhLRNvIozAj+jFuWUmfgStli4CCa
vflwcLuc1ML3WkGmysnaseB7rsHHYg==
=2+xf
-----END PGP SIGNATURE-----

--N7pNbbSHyZYMHRjm--

