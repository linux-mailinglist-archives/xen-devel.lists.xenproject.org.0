Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28B8CC403
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 17:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727771.1132434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9nnX-0006WI-Gk; Wed, 22 May 2024 15:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727771.1132434; Wed, 22 May 2024 15:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9nnX-0006TT-Dq; Wed, 22 May 2024 15:22:35 +0000
Received: by outflank-mailman (input) for mailman id 727771;
 Wed, 22 May 2024 15:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKXr=MZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9nnV-0006TN-KE
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 15:22:33 +0000
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a3a7317-184f-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 17:22:31 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id E16181800132;
 Wed, 22 May 2024 11:22:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 22 May 2024 11:22:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 11:22:26 -0400 (EDT)
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
X-Inumbo-ID: 1a3a7317-184f-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716391347;
	 x=1716477747; bh=cKcXdNX7CaZv/PzfX4FoVyVEW4o/dLnJS3xNLqLVInQ=; b=
	N/Yz3/HRkaaxjFQ8+83RXSS7Ue9U6kkL9TcsQ8Tqmqn6+m9X1JPx0HQ9IJEvKXX5
	qGKQX1+ns3kWeFwKZq4sYlaFvLzpdOSWNdHBzAmlm6PTLkj3iZWIs0LQn+dpqxu4
	r9jlSK9fPCOqXg9+HlSBUURxl30CFNhOunwP81JtHvnmsWTltR4jx3KnvgoXeT++
	PqrHmiV0gUjpuc9Nfnnx0LWybstyCpQm3DxtfMYGUahlo3ynkCtIw94zVfgCsqcz
	7QRTIaFo31XdhOxbsXbUHSnqBTWsnUFbYzq7v9He6w3ghK/3bbO3UNo7HANcylyw
	oBYdSUPIdUQ8hIDMsGcjIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716391347; x=1716477747; bh=cKcXdNX7CaZv/PzfX4FoVyVEW4o/
	dLnJS3xNLqLVInQ=; b=f3y6WehXNNtGPRG8+tvjSQgeNy8aDu42LkIJiI+2lvOa
	sWhvcSoOCg6cZuLAbvqC87Ix83fTTsCTSfxFYHc1QzkwSwYTwc8ml3Bwwy6OXG7q
	k6j8bsI+aKRRjEn2N0as8a6kIFqXaR/iPgdxsUcExCIfx8B+yQCV8CErGOjux3Yg
	CV1EqrZcm5YmF9wjXqCnpk0+KgQPu7Gb+AmneQmucTyX7ZIHxeytywG5ToTO/mzR
	CHk4nYovfOEDw3LdpOCfIqmt6Sjc3zs9yAwLMwPsrbxk6Vx0XP9bm91hQmISa5J2
	giLYV9c7GyaXkbHs31ukazW9uPb6vTjOuSN4ejf/QQ==
X-ME-Sender: <xms:sw1OZpxJk7SQ403wVFVHXahfJ8vpQRv9KYyOufKhzEqH6OFQDbj_Hg>
    <xme:sw1OZpSbnqLTPvNwrDLU3XPqfs890dihM3P35oxG0epBExLwLfqWpl1S98lOn27jF
    Tcdd1nFbBpowQ>
X-ME-Received: <xmr:sw1OZjWOH3mpWIOfW8TQ7-hJB1gDInLRMo7SerpQugUDUdqCaYgD24DxIp93_Nlr4yefdugA8HkT7Y5UPPiedNS5bW7OPpiR_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeigedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:sw1OZriW8j82jm6R5EjZU-viUeLv-cU8KOS2pAtxpE2RsmD-RciQMg>
    <xmx:sw1OZrBAl-sFy2txbIuMo8q5awSz6btRSBCZwqxfq2XSUdCoZP_-wA>
    <xmx:sw1OZkJHq_bpzdBIupdXSLwMlpw_JP30WrF6ixMioX810w7xEMjbcw>
    <xmx:sw1OZqA0aEgO16Xl1V5VFuUUkveXX8_MZGTmDmBZcsBlRcC2qYZ3HQ>
    <xmx:sw1OZiOTiF2mHV8XKxytQ0bgfsHW9jRbJYDmCBgTGWaAk4OYSjKKS6_V>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 22 May 2024 17:22:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zk4NsM_Df0futo-Z@mail-itl>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2708dbbb-f913-4920-a008-beef12cd1265@suse.com>
 <Zk3xtK0SaaqEadXY@mail-itl>
 <93c7230a-bd2a-4763-a90a-89e02a169b1d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uurQj1kwzf6TNO7b"
Content-Disposition: inline
In-Reply-To: <93c7230a-bd2a-4763-a90a-89e02a169b1d@suse.com>


--uurQj1kwzf6TNO7b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 May 2024 17:22:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Wed, May 22, 2024 at 03:29:51PM +0200, Jan Beulich wrote:
> On 22.05.2024 15:22, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, May 22, 2024 at 09:52:44AM +0200, Jan Beulich wrote:
> >> On 21.05.2024 04:54, Marek Marczykowski-G=C3=B3recki wrote:
> >>> +static void subpage_mmio_write_emulate(
> >>> +    mfn_t mfn,
> >>> +    unsigned int offset,
> >>> +    const void *data,
> >>> +    unsigned int len)
> >>> +{
> >>> +    struct subpage_ro_range *entry;
> >>> +    void __iomem *addr;
> >>
> >> Wouldn't this better be pointer-to-volatile, with ...
> >=20
> > Shouldn't then most other uses of __iomem in the code base be this way
> > too? I see volatile only in few places...
>=20
> Quite likely, yet being consistent at least in new code is going to be
> at least desirable.

I tried. Build fails because iounmap() doesn't declare its argument as
volatile, so it triggers -Werror=3Ddiscarded-qualifiers...

I'll change it just in subpage_mmio_write_emulate(), but leave
subpage_mmio_map_page() (was _get_page) without volatile.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uurQj1kwzf6TNO7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZODbAACgkQ24/THMrX
1yyN5Af+OMhdFfQA18mjMg7vv7WCWIURPTVXlCsHUvpCnnXxlrkrhT6NCUwMimgW
M1hS+jkbUHogu9rCxwad6hQ6Ex+OKat4qIVGep03NYoXFk+CyZJ0Ebv/QaLKTG27
8J4bqN3WHcaQxl6mTNB8S82iK1kpLdEaRWJJ4K8uhWdnL7Wg9FU6Rkce+wrqSH8m
QF6xaGGrGo2MEHBKSQfi2KFsnu/gfSZlV8u5jm/FeUQJLK1WacrnYpG2GU6AmxoL
x6J25dmVHG0Lr4z3v0KL0OrZX++pHcpW4ZQ14KQFv6zjA42IOSbAxSAi5zmrJOvj
f2sydZ0SiiisCaCt3GC38i8EN5oZfA==
=C0BQ
-----END PGP SIGNATURE-----

--uurQj1kwzf6TNO7b--

