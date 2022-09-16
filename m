Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C475BABCF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 12:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407938.650622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ908-0007Ni-9d; Fri, 16 Sep 2022 10:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407938.650622; Fri, 16 Sep 2022 10:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ908-0007LE-6y; Fri, 16 Sep 2022 10:55:16 +0000
Received: by outflank-mailman (input) for mailman id 407938;
 Fri, 16 Sep 2022 10:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEU6=ZT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZ906-0007L8-Fy
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 10:55:14 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08dd8902-35ae-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 12:55:12 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D0515C0215;
 Fri, 16 Sep 2022 06:55:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 16 Sep 2022 06:55:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 06:55:09 -0400 (EDT)
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
X-Inumbo-ID: 08dd8902-35ae-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663325710; x=
	1663412110; bh=ti6HR9BQlCCPHMLYEhtJ9VQX+0iCfL0mbkktC0+nmnw=; b=5
	jWB27rW34AF/c11BcCiSsHPVb3JOl9AN1zoIF29Wz7maPYksCG28K0Nq9OLegRb1
	v4I5etJEORKJyCureCd4wnnzUm/7BNHtaQ1YS5I7j0q4a7vLWQ1i4ZJkTZflMMH6
	Z2N9sz7jVXtbZro/viYPYFJYwxDo4pucs19m0c9htRGjXzpNLymjJxExp3pJuIZ2
	2BliVuRklS4YrgcNmjSUhcBNnREPFp3vWdbcsRGXVfwPwcYJnYPXbGGr3EJdd0e6
	VAkVgT2d+eZ3afvwaARU1RA8yxUGse+AediCIL/KTUWPhuTDQw3lIvTXXfg0p5sJ
	GIJ2TkKaA7Rc/iaCN5DPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663325710; x=1663412110; bh=ti6HR9BQlCCPHMLYEhtJ9VQX+0iC
	fL0mbkktC0+nmnw=; b=FLyUYNg+F+HcS6lBuk/gmnctRxrajnbkHj7deLLrHvlP
	+AuJMoZ88uypH461mAExx8v05HFUCWI6PzUD3ZN619XWm1V8tTgBRs8dASpVyYH7
	0ebt1m5d6yW9P+kHUaPaIKFvGSMQokSPgC1JDMT5mX1IQdNW74l1UQ3h04H3XX4a
	FTdBPFTz102+4wc6HzwLu5CuqisBgWPGVTAuuiy5lYerx6ApJnjJ9wuG6H+l5AhW
	DTt2nThIYP0k4H6rg4hNKiKZ6TihfhNXLf9CM2rjXJmXLR5cUq+youaccrRQTFZs
	0Day8U1hpzImXSWmp975Aig1/IphsFi/ZPVBIgAeNQ==
X-ME-Sender: <xms:DlYkY-ttwkbENl5Eaol2D6ERZue-wvji1XSNtvKB6e6d0DbOvnEkTQ>
    <xme:DlYkYzcLJDYyqr9ULElRuvFl-eKxWHxuDMb76qlP_DwqNJ-ntaudM2ANuz2wwNN1N
    YCWoNI2elWiYQ>
X-ME-Received: <xmr:DlYkY5yIgG9oIB-VAsbieB3wpG_WAuVEsuqEzhC7uPDuNFFmKyuw51o7FjUdnVxy7JVbzlUtXG4gGylrTCjoD8YXhPRWP9kTskQ6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvtddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:DlYkY5O-KXHZ6f2nG3Af6uxbN-inkPHlNhlnB79mbp0PIOjUtnM9XA>
    <xmx:DlYkY-_6xRXJtdAju3k-BpJfK2nv9_k3isWwjzDZVUEPKhxgH0m31g>
    <xmx:DlYkYxUu-Tt8fN5VLUuOFDuWy4rwDna3AqR4YGRhXR9In7jITXcpMA>
    <xmx:DlYkYzGdQ_9Ri-4z5XA9Z5JY_o9DMvN-11trRHmOI-98KT-9_4JGXQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 16 Sep 2022 12:55:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Default reboot method (was: Re: Console output stops on
 dbgp=xhci)
Message-ID: <YyRWCpM+s+JNNmbV@mail-itl>
References: <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
 <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
 <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
 <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
 <2697981f-8ae2-d3e7-1a6a-046927a66246@suse.com>
 <YyRHiV/HHisshYJl@mail-itl>
 <92a8ad2a-9b9c-b147-c175-0a9b4dab4821@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ocGg3IqZvWtAoCeT"
Content-Disposition: inline
In-Reply-To: <92a8ad2a-9b9c-b147-c175-0a9b4dab4821@suse.com>


--ocGg3IqZvWtAoCeT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Sep 2022 12:55:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Default reboot method (was: Re: Console output stops on
 dbgp=xhci)

On Fri, Sep 16, 2022 at 12:28:46PM +0200, Jan Beulich wrote:
> On 16.09.2022 11:53, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Sep 16, 2022 at 07:57:59AM +0200, Jan Beulich wrote:
> >> ... this leads to the crash, which effectively tells us that this is
> >> likely yet another system where one needs to override the reboot
> >> method (e.g. reboot=3Dacpi).
> >=20
> > At least Linux, but also XenServer uses reboot=3Dacpi by default (even =
on
> > EFI systems), can we make it default in upstream Xen? Issues with
> > reboot=3Defi are rather common, while reboot=3Dacpi just works.
>=20
> But rebooting by means other than the EFI runtime service has always been
> against the spirit of EFI.

I'm afraid firmware developers (apparently) haven't heard of it. Can we
have "works by default" behaviour?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ocGg3IqZvWtAoCeT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMkVgkACgkQ24/THMrX
1yz+4wf+PPxcXqHuuIkWDIX6ECN9Lxqi+chlYwcWZjF25JXCo6Sn4waVMjiQIsvH
GIAmmCcszLl5DYG8S1N/KYDs6sPLp54AQjE8S64ig9NvOG+RtHKHGaZWLNzfAN9F
QEJZ06L7wet6RjS1TMbKwqt0EkZvMSD6kUZCf7E/q2CZ3SK9YrWSQQG/rQwlSvyf
GNJt3JF2D78XBHCFawKNY2AOD3dbt02wYTcvFmdgzWUOgDg1LcfuEvUvAkhXGKsV
jjIRFZPp3OQJgVGgkAk34eYU7x4h9E0qYXnccwZFpG80V2GNN6jGwJJSI8TvNNJt
Kn+4iHzhywkV6U+yJDGCsOrOtU5FUA==
=u189
-----END PGP SIGNATURE-----

--ocGg3IqZvWtAoCeT--

