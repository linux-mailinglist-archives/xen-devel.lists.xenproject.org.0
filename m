Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627F66F24DC
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 15:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527640.820323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pskjB-0005lt-0o; Sat, 29 Apr 2023 13:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527640.820323; Sat, 29 Apr 2023 13:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pskjA-0005j9-Tx; Sat, 29 Apr 2023 13:35:04 +0000
Received: by outflank-mailman (input) for mailman id 527640;
 Sat, 29 Apr 2023 13:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Ech=AU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pskj9-0005j3-2K
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 13:35:03 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a20c844d-e692-11ed-b225-6b7b168915f2;
 Sat, 29 Apr 2023 15:35:00 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D8AC5C0176;
 Sat, 29 Apr 2023 09:34:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 29 Apr 2023 09:34:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Apr 2023 09:34:55 -0400 (EDT)
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
X-Inumbo-ID: a20c844d-e692-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682775297; x=1682861697; bh=f/hYQRnJOgnhGx13UV29iWjW/ZCGlPtK+TI
	sFDedytI=; b=D2DDCqtwAhN9/mPazwUU4k/Pg8dDPCBFEygSBB5aVGoiPtXQiyM
	6AFkK948/ZYcFea0B5ZZFn7plCjZdYLJqaRJ6zuNCuEp5Rp49ZnhalLnk077fNoU
	mQwZfsxJW+rqor3OwU00WHJVC2VxUQJgVQq0p6ty8gWK6F3JCZdT0oQTxFTByPyy
	OVIKoorpVhl3EaS3xEUAowFmp5J0+B2uXzKvTCHcALpWGsW3dWwBWRo8yJOHZpMy
	mH/4GIZrBr6cNtfNCv13Mvra1IaIrT4dH2vVEGZMCMWH/fntyF9QaRS3rLKi0lxs
	jX+W4tgRAok/Am3waNOvaN3dvGBxy1zKWQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682775297; x=1682861697; bh=f/hYQRnJOgnhG
	x13UV29iWjW/ZCGlPtK+TIsFDedytI=; b=SMr/73E4C6EDPsgl11xUalGpabatM
	Pf3lo/9iF+4KGyFA38SkhWkPcfb1ysVHHISTLPAtJ/oUCkn2hZHEakAkI8Adxyjf
	NbYMD+4ZEXOTAfnqr+wah9wSwz8IAdGCsOQCEAN0MabpSjfEZuHCHRMKc2UlB2Rh
	40ZgdlVDfsW45Qoxt/beeHtq+0UYtqqHohMf4sNuWl8Kmb8UbirjGShF5wjOsIvl
	9uPbEoXsTvOcBQwGJko5VC/hAAMh9aADuuWczlEcdI3f9yap/8olQFyz/pIxSH+e
	W2t5vYxivb+sUIg7JgOrvZScNYU92xL8HK2yI4sA96U61y4q/EDM1Up/A==
X-ME-Sender: <xms:AB1NZPYHmYj09dKZ9LPJDPJ2Zd7FyvTenC0SSHSzEw4PM_dNqfZn8w>
    <xme:AB1NZOaDDZkxkmjP9JMUEnvXtFq3sRN8JasY1061J4m9AffmQ-TwceeUsCD7uj3Bi
    Rw8S6YSU70roQ>
X-ME-Received: <xmr:AB1NZB8lqlJOk_-EtXcxArmyLeD5BA_vC7GLegxDe9DizVES_4xTg0NqvBpMSwr5CZQLjGJdLk778YetkoT3zmNLgR5B0Qpl_4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvtddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:AB1NZFoUQ2_0oEKt7b3PRFzRM-EyaruV4gLzesHabUYSefZWG7krPg>
    <xmx:AB1NZKpKFK80a4z9ACfAK7YNAIyRH32XAQFZVLPiLEZOb0-3IYOQrQ>
    <xmx:AB1NZLQiV4hB5sV7fZavbCObicSABx688fmwmFBq8BVK5UhYwke18w>
    <xmx:AR1NZNWqdWd1sMaXdpd0ZPuF5VhXxNAp8fhFAPWT9jsivJenqTvh6A>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 29 Apr 2023 15:34:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: andrew.cooper3@citrix.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	alejandro.vallejo@cloud.com, committers@xenproject.org,
	michal.orzel@amd.com, xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
Message-ID: <ZE0c/dEaIUglww+g@mail-itl>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zRbvTpPLxZ4MpD3L"
Content-Disposition: inline
In-Reply-To: <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>


--zRbvTpPLxZ4MpD3L
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Apr 2023 15:34:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: andrew.cooper3@citrix.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	alejandro.vallejo@cloud.com, committers@xenproject.org,
	michal.orzel@amd.com, xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f

On Sat, Apr 29, 2023 at 12:41:26PM +0100, andrew.cooper3@citrix.com wrote:
> On 29/04/2023 4:05 am, Stefano Stabellini wrote:
> > On Fri, 28 Apr 2023, GitLab wrote:
> >> Pipeline #852233694 triggered by
> >> [568538936b4ac45a343cb3a4ab0c6cda?s=3D48&d=3Didenticon]
> >> Ganis
> >> had 3 failed jobs
> >> Failed jobs
> >> =E2=9C=96
> >> test
> >> qemu-smoke-dom0less-arm64-gcc
> > This is a real failure on staging. Unfortunately it is intermittent. It
> > usually happens once every 3-8 tests for me.
> >
> > The test script is:
> > automation/scripts/qemu-smoke-dom0less-arm64.sh
> >
> > and for this test it is invoked without arguments. It is starting 2
> > dom0less VMs in parallel, then dom0 does a xl network-attach and the
> > domU is supposed to setup eth0 and ping.
> >
> > The failure is that nothing happens after "xl network-attach". The domU
> > never hotplugs any interfaces. I have logs that show that eth0 never
> > shows up and the only interface is lo no matter how long we wait.
> >
> >
> > On a hunch, I removed Alejandro patches. Without them, I ran 20 tests
> > without any failures. I have not investigated further but it looks like
> > one of these 4 commits is the problem:
> >
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Make init-xenstore-domain =
use xc_domain_getinfolist()
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Refactor console/io.c to a=
void using xc_domain_getinfo()
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Create xc_domain_getinfo_s=
ingle()
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Make some callers of xc_do=
main_getinfo() use xc_domain_getinfol=20
>=20
> In commit order (reverse of above), these patches are:
>=20
> 1) Modify the python bindings and xenbaked
> 2) Introduce a new library function with a better API/ABI
> 3) Modify xenconsoled
> 4) Modify init-xenstore-domain
>=20
> The test isn't using anything from 4 or 1, and 2 definitely isn't
> breaking anything on its own.
>=20
> That just leaves 3.=C2=A0 This test does turn activate xenconsoled by vir=
tue
> of invoking xencommons, but that doesn't help explain why a change in
> xenconsoled interferes (and only intermittently on this one single test)
> with `xl network-attach`.
>=20
> The xenconsoled change does have correctness fix in it, requiring
> xenconsoled to ask for all domains info in one go.=C2=A0 This does mean i=
t's
> hypercall-buffering (i.e. bouncing) a 4M array now where previously it
> was racy figuring out which VMs had come and gone.

Can it be that xl network-attach fails and that failure is silently
ignored by the test?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zRbvTpPLxZ4MpD3L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRNHPwACgkQ24/THMrX
1yzpdwf/d0oZw1B7pzKxk5LdNmZPy/bwZEO5/VLG1PAFAD9vnRB4DTH9vOab5eC2
AlE5C8Omhxnf5yCE8HyGprDEC2ghnwIhowFvSjWMVrR9OEiPWsT5j3ClEprpHbyE
+XVAdNIrAExCXU/vEJR9frlydf3UD5nCN0/4QW+HffSL+VZ6rr69fFVdpKDPD943
jj7qfQmDb6xtMUp8cwH2DFXqMxk1pD/PPwZL2uPPD8OeQoN7LNNrOoKl1xpTQ/Gb
6B6RnQ5P9QLx/Quw8M94/eSOj5kogHMICv7V9ATifiUKuQjknTBj3kmtE1saoOpl
kgeSqvPfw3z4EmLxKmlm3boWOGSvjg==
=xGZo
-----END PGP SIGNATURE-----

--zRbvTpPLxZ4MpD3L--

