Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8CA55C0F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 01:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904408.1312287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLi3-0000fT-HK; Fri, 07 Mar 2025 00:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904408.1312287; Fri, 07 Mar 2025 00:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLi3-0000cl-Dw; Fri, 07 Mar 2025 00:37:03 +0000
Received: by outflank-mailman (input) for mailman id 904408;
 Fri, 07 Mar 2025 00:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SrOz=V2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tqLi1-0000cf-FW
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 00:37:01 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 468a24f8-faec-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 01:36:58 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.stl.internal (Postfix) with ESMTP id D3C641140186;
 Thu,  6 Mar 2025 19:36:56 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Thu, 06 Mar 2025 19:36:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Mar 2025 19:36:54 -0500 (EST)
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
X-Inumbo-ID: 468a24f8-faec-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1741307816;
	 x=1741394216; bh=YxzMWiy45tP0kAkYMQzwFntN5SCt/KQfRnCmjTi1gpo=; b=
	0mtEA7YDazPU+eVMd4xGYjjsLtlxFdpuuvW4QjiP3GK0s19ydDh8k/z93GL8dG+s
	pMBR779Svg9fzeLqUh1ejUWseCEt9jA9Y/iwoXVqGRoNx1qTzXAC7oTvKvSajExQ
	HeV97N9NxB+bObbSgswpnOOB4sbPwr1ar55/BbHRsAgDdu0ku9+HU5abmtzAjd7S
	dNvH6cFOZnMmDUmpzJxyJ2AdLZdtmBn6t/qJdChGt5l0LYxBrF5KSy7x2MuyD6SI
	Ai0r5GNiYDGVc+cvcZ8Qqt/aOnwxBDi/Pdd2CBrjiRa5SMUvD00Qe6tAuMGOxDkh
	/8Zb16g5dgrWniC1orIBEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741307816; x=1741394216; bh=YxzMWiy45tP0kAkYMQzwFntN5SCt/KQfRnC
	mjTi1gpo=; b=j+zR6mTkX8OrPzjcuEcxhgFoImKkkcJbI2cD7+G1w+Apn+YrG3I
	Oys3QhGd6aaDMItFzj9ZwUzpE6Qqczo0aAV/C6O7s6H4Lb08apBB6tGNR7i2YBAC
	Wt/Ssm/W4F0h54YZQAFK1SdNaD0j3RJATvuUPjBq7bsUAqs5n1FuXBwaV7afw7cr
	ovLmb7gU+D/c5Ya+DE5a0EYgIDiBf2sGzDNuGtBY3jMBwxvg7qGmKOKUdGcAqcGb
	iezrjBJs1lv7QJy+a0Hmvs7t/3oD1b+eXcMoQgsIvV8/hzvN6Lrp24SrWAHWclzQ
	g1Tzv1rfALy2T1E3vcrfmj9uYEBm50N14Cg==
X-ME-Sender: <xms:qD_KZzHRr6v3Cr2eqwDrhu5UAgwQ6nQdLr0HI4SA7cTQlGvHASlD-Q>
    <xme:qD_KZwU08K6MX9qKPHurGWvWMdCLCJ8Z6WE0hnBD3FYzi5H_k8hcptOC39erCPRH2
    y0Qj3pTM7G5Eg>
X-ME-Received: <xmr:qD_KZ1L8_ozOKVV9zHDI8Z-rIr2fO1wfW6dUkTgWHKW9XDU9Nfz5P_H9dso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdelvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepledvieeludetffduleeihedvteeivdfgveefveffvefhjeegke
    dvuddutdefudetnecuffhomhgrihhnpeguohgtkhgvrhdrtghomhdpghhithhlrggsrdgt
    ohhmpdhquhgsvghsqdhoshdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepmhgrrhgtohdruggvmhhisehrvghsihhlthgvtghh
    rdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtg
    homhdprhgtphhtthhopehvihgtthhorhhmrdhlihhrrgesrghmugdrtghomh
X-ME-Proxy: <xmx:qD_KZxGHvht1_dKbiFEPER-7CqVYfQ8XSkKcOEvhqKZ5tDKBLrGu7Q>
    <xmx:qD_KZ5WMaHtfr1fTbngc4dz_FcfDjb4sqGYf4lbcZx8S1VX4sT_1Lw>
    <xmx:qD_KZ8NVFMq6n-OEBoItXCrjzEQ87EvuXCRaJSdKEqh-4khjWmN9ng>
    <xmx:qD_KZ41HF-wCBHwCbZ00U6qJ-B0yhdMOdTl082dPrBde2qIi1_t7wQ>
    <xmx:qD_KZ3cbhVr9hidKJrooGMVO0U8i3m_wlf6E6o8weqB3sipKHqqcBL4p>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 7 Mar 2025 01:36:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, marco.demi@resiltech.com,
	andrew.cooper3@citrix.com, "Lira, Victor M" <VictorM.Lira@amd.com>
Subject: Re: [PATCH] docs: hardware runners setup
Message-ID: <Z8o_pVj8HVxQ6BuU@mail-itl>
References: <alpine.DEB.2.22.394.2503061354430.1303386@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yO53+Tz1lgUBNAV3"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2503061354430.1303386@ubuntu-linux-20-04-desktop>


--yO53+Tz1lgUBNAV3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Mar 2025 01:36:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, marco.demi@resiltech.com,
	andrew.cooper3@citrix.com, "Lira, Victor M" <VictorM.Lira@amd.com>
Subject: Re: [PATCH] docs: hardware runners setup

On Thu, Mar 06, 2025 at 01:54:48PM -0800, Stefano Stabellini wrote:
> Document how to setup a new hardware runner
>=20
> Signed-off-by: Victor Lira <VictorM.Lira@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I have some minor minor hints about pointing at more examples, but
regardless:
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

>=20
> diff --git a/docs/misc/ci.rst b/docs/misc/ci.rst
> index 7aee55c5d2..ef3f183153 100644
> --- a/docs/misc/ci.rst
> +++ b/docs/misc/ci.rst
> @@ -19,6 +19,49 @@ After getting access to relevant runners, few extra ch=
anges are necessary in set
>  2. Expand "Variables" section and add ``QUBES_JOBS=3Dtrue`` variable for=
 Qubes runners.
>  3. Go to Settings -> Repository, expand "Branch rules" section and add a=
 rule for protected branches - only those branches will get tests on the ha=
rdware runners. It's okay to use a pattern for branch name, and it's okay t=
o allow force push.
> =20
> +How to Set Up a New Hardware Runner
> +***********************************
> +
> +A hardware runner is a GitLab runner designed to execute Xen tests on re=
al hardware, such as an embedded board or a laptop. The GitLab runner runs =
on a controller PC, which is connected to the target board used for Xen tes=
ting. The controller PC can be any system, from a workstation to a Raspberr=
y Pi.
> +
> +Steps to Set Up the Controller PC:
> +
> +1. Install the Docker service
> +   - Follow the instructions at: [Docker Installation Guide](https://doc=
s.docker.com/engine/install/ubuntu/#install-using-the-repository)
> +
> +2. Install the GitLab Runner service
> +   - Follow the instructions at: [GitLab Runner Installation Guide](http=
s://docs.gitlab.com/runner/install/linux-repository/#install-gitlab-runner)
> +
> +3. Register the runner with GitLab
> +   - Generate a runner token with a specific tag to identify it.
> +   - Run `gitlab-runner register` and enter the token. Accepting the def=
ault settings is sufficient.
> +
> +These steps are common for setting up any GitLab runner. However, for ha=
rdware runners, additional configurations are required to enable the contro=
ller PC to:
> +
> +- Power on and off the target board.
> +- Connect to the serial interface of the target board.
> +- Establish an Ethernet connection with the target board.
> +- Run a TFTP server with a TFTP root directory accessible by GitLab cont=
ainer tests.
> +  - This allows the test script to place binaries, such as Xen, in the T=
FTP root before powering on the target board.

Maybe hint also to look at scripts in automation/scripts for some of the
above? Especially, it isn't clear how power on/off control relates to
the other settings below.
I have also an article with details of some of the above, especially
power control and network boot: https://www.qubes-os.org/news/2022/05/05/au=
tomated-os-testing-on-physical-laptops/

> +
> +To enable the required capabilities, edit the GitLab Runner configuratio=
n file located at `/etc/gitlab-runner/config.toml`:
> +
> +- Map the TFTP boot directory.
> +- Map the serial device of the target board.
> +
> +Example Configuration:
> +
> +    volumes =3D ["/scratch/gitlab-runner:/scratch/gitlab-runner"]
> +    devices =3D ["/dev/ttyUSB0:/dev/ttyUSB0"]

FWIW qubes configs are public:
https://github.com/QubesOS/tests-hw-setup/blob/28aa8b86208a54fc2ac986f06c66=
c92230bf771e/states/gitlab-runner-conf.toml
(this is template to be filled with the values by salt)

> +
> +After making these changes, restart the GitLab Runner service:
> +
> +    gitlab-runner restart
> +
> +This completes the setup of the hardware runner. The system is now ready=
 for executing Xen tests on real hardware. As an example, to execute tests =
on an AMD x86 embedded board, we currently use the following script:
> +
> +    automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +
>  Selecting individual tests
>  **************************
> =20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yO53+Tz1lgUBNAV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfKP6QACgkQ24/THMrX
1ywL1Af+Jp15e7oUKwQUNx4y45Tzs81DwoLDEx8GRT+e5wMRdGBEV6zhIi1JKBVF
UngxTFVF90WYGoXgb5lCQ/9uCH6ZwbiQIuHxOhOIv9/V/gayU9+IpQAUegf5P0fy
RcS5ZxmVcGwNEzNOqdRA4P2fVlpXkSxYyuwHcJpZ2wH7Geck0jsbPIXU+jJm418N
2brd1NTcizMRNQtvNjh4YqZA1rLCHfvYuymH4GFM+DLnwAvPMUWQjWwgCFt7PUPQ
rgcErPCe3pj1EE2pVr5CldM1acxvcj4wGlqbt11mRYCyvVjmkI47jmXiUyXvMgmt
3h9mmZ48po950A68qNlaAkjUBB+/KQ==
=ZUvN
-----END PGP SIGNATURE-----

--yO53+Tz1lgUBNAV3--

