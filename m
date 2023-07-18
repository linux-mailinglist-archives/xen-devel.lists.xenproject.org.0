Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1730775890C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 01:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565531.883748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLu6T-0003ly-7m; Tue, 18 Jul 2023 23:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565531.883748; Tue, 18 Jul 2023 23:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLu6T-0003jW-4f; Tue, 18 Jul 2023 23:27:37 +0000
Received: by outflank-mailman (input) for mailman id 565531;
 Tue, 18 Jul 2023 23:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLu6R-0003jQ-M4
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 23:27:36 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaaa89a8-25c2-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 01:27:33 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D08BA5C00E2;
 Tue, 18 Jul 2023 19:27:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 Jul 2023 19:27:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 19:27:25 -0400 (EDT)
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
X-Inumbo-ID: aaaa89a8-25c2-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689722850; x=1689809250; bh=Z/Ia6kwxGkTyD0pywGMEPDu50cjjww1I9rj
	PR9g8alQ=; b=XoUtOx6SkP/eP/gUl7/AWGG2ILDwQ18Isk1V4TN4Y0roBxgDXpi
	qyUdXtDyPhSokVeUJqBbt0BFdjiNWZR6VuiGPZ2zdXFj8ippvef+aWfPIG4141kH
	r40b9opqP2P1TMmJFCI44rSBCFe73zaGC7D8SZdrtRa4r3vN9eVT+mlMMCZG1oj8
	TO0fHkLldkYMvaeoejxp4+2HH6AIpYAMML4j/U68y8EQTPIFYvRBMMdVBPo0Cdc7
	RdKfrPlpGv8SvfMTDDKyqzK3aRebqH4BCDcIiU/2QuGHyS7L+cA3pR4Ia+xKoyft
	Ba9h5TTlbNLAq99aKP+NpXMbvkhY2TTCwzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689722850; x=1689809250; bh=Z/Ia6kwxGkTyD
	0pywGMEPDu50cjjww1I9rjPR9g8alQ=; b=wErgwMtAjvu8NmnuSkA6VzFslAxNV
	k1WyTX5+PuF1Ur8NnsjRwOvLvIx02aLAhl+mOkZV/zVI89AJJLhU8jB4XHnkQreH
	5fjVjogLRF2w4s403TdlNNRbWEd1CyTaqsH/sx1y/Loc62CNA7SFZ/GYcRK/P85H
	I04lfWyQmBjaNgDksKc5tLp3M9SZdTv0i366B339i36HLoDRIXh9Y7urjfG7cQVc
	Nb9ZTMXK8WyGKX1Q4N69AtmRAq3xKxsj1chrNtIuKvmv3XbsVH87A8O9owo6Bi3L
	XbsmjE0ZfAe509/UTXaMt/GDlB6RAYCEVrm+DUSGx4LkZOUA8yH6GJM4g==
X-ME-Sender: <xms:4R-3ZMvHBmRElQTCuRCZMRQTIm0aiG9STi6jRALX4IbmxI7v4hUVeQ>
    <xme:4R-3ZJePfS9e9GqgPnWF6xQo3SswEyKIT2Zm9R5m6nA767jcvfm6ir1VYrISuZLuC
    pnUaCRK4oMzRkc>
X-ME-Received: <xmr:4R-3ZHwlDFAcJRA6Dfl_K9CoxamSzcht9YHPS7HnCufbWI86j0NwW8BhHQEPFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeehgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:4R-3ZPPJDFpyJlGRiNSUuh2oXnbWZKdI13z0TTcg7g6czPUetiNMXg>
    <xmx:4R-3ZM8SKvdp-tE19XNsEWv4OBahFS9WOR64cd_NcywHpmYhzAxwDg>
    <xmx:4R-3ZHWYimP3P4JphgLnfOhMEsnwmvpG9t9J76HKi07LiIsFvscnDA>
    <xmx:4h-3ZLa3H4MhE02GVwf3rX9X1HaD_Y2DRt6VDOXnGhAaLvkgIAoTYA>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <60befe01-ab21-4e22-b601-c22a1e8b4ca9@invisiblethingslab.com>
Date: Wed, 19 Jul 2023 01:27:14 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
 <bfbffbaf-01e9-3b6d-a57b-d1702ee6cf7b@citrix.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <bfbffbaf-01e9-3b6d-a57b-d1702ee6cf7b@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CzPEsDlGUcKv42Zraq7JTsEz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CzPEsDlGUcKv42Zraq7JTsEz
Content-Type: multipart/mixed; boundary="------------8IlCkXLLfAmDl0wCZWuXUbt2";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <60befe01-ab21-4e22-b601-c22a1e8b4ca9@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
 <bfbffbaf-01e9-3b6d-a57b-d1702ee6cf7b@citrix.com>
In-Reply-To: <bfbffbaf-01e9-3b6d-a57b-d1702ee6cf7b@citrix.com>

--------------8IlCkXLLfAmDl0wCZWuXUbt2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 18/07/2023 2:17 pm, Simon Gaiser wrote:
>> Since it's limited to the hardware domain it should be safe and it's
>> very useful to have access to this directly in dom0 when debugging pow=
er
>> related things for example S0ix.
>=20
> You need a SoB.

Yeah, sorry.

> But, this is an area there things are subtly broken.  For package-scope=

> MSRs on single socket systems (which does include client systems), then=

> this happens to function.
>=20
> It does not function for core-scoped MSRs, or at all in a multi-socket
> system.  In such scenarios, dom0 can be rescheduled to a CPU in a
> different scope while it thinks it is sampling a single scope.
>=20
> This is one of the areas where dom0 and Xen end up fighting over the sy=
stem.
>=20
> I agree that we want some way for dom0 to get this information, but I'm=

> afraid it's not as simple as just permitting access to the MSRs like th=
is.

I see. So a generic solution is not so easy. Also even if there would be
an interface for dom0, my main motivation was to be able to just use
existing code like /sys/kernel/debug/pmc_core/package_cstate_show and
turbostat. You can already read those PC-states via Xen's debug
interface, but that's less convenient.

For those package-scoped MSRs, how about limiting them to single-socket
systems?

Simon

--------------8IlCkXLLfAmDl0wCZWuXUbt2--

--------------CzPEsDlGUcKv42Zraq7JTsEz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmS3H9QACgkQkO9xfO/x
ly+z7Q//T80TA1z1cA6FNKHNBLsH7bvAysYdGjhd9Sk4ZRDYxl3rjdo6Xy7vlBsn
z0v0du1HRZWV9PwmMfPU3AEc183R2+gvE9oaC0wmjBV3vtIs/jeHFfxASckk3VUA
RlQEVP9VU/hSPuEOcPfAYbjYdYKyIC+dotsQiaIrLyS8saxh93nLHsBiExW7+Rcz
ruJ/9KjeE4vGNVAXVwickaAwJFK7XstoKe/WG0TGFBoHzilQqChJueqZqqtju7KX
K/GgFC2lpj1yQpXDzGR+Wvfad0m7TgUDHw8g2IGgV40QjhAflWKpBQZp21uK7uKv
OQZ8mKRo3Ff2pJkg5noRz5Ur6gJYXzYqi+fUx5knXplMKNlWdt1nibnV588tLEuD
/uogtG5wjOTGyAOiffGnhJXa1NRaFOUiacAgpAv+xXR9wAVT0rv5abCXC2KBAiYJ
gQx19fDZtVnhzwTPK9r31jP+BeXH5WqvKZ2cQRT+Kn2TZjzYRt7HTI6HyAu4vmOl
YnCkVzHaiZyeQskWHGK4Zxrds8S/948M0IGDujNRBpbVe19SHpabdvlm6KC2BsHP
7hU1hsLXrGuaxz3kxrvejHSz0621EGlz8QiaiTF0mgPqatXA/Ig0w6mJa/IdpgsM
SGZfhsB+8WlAOhGUJnnVHQvs3G2MV5pD8ZFP8Zy54akNPWv5RhI=
=Q+As
-----END PGP SIGNATURE-----

--------------CzPEsDlGUcKv42Zraq7JTsEz--

