Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D5B2F7CB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 14:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088610.1446350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up4Ig-0007cL-MR; Thu, 21 Aug 2025 12:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088610.1446350; Thu, 21 Aug 2025 12:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up4Ig-0007Zh-JE; Thu, 21 Aug 2025 12:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1088610;
 Thu, 21 Aug 2025 12:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hypg=3B=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1up4If-0007YE-2S
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 12:21:49 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670395fd-7e89-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 14:21:46 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 7CB381D0016A;
 Thu, 21 Aug 2025 08:21:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 21 Aug 2025 08:21:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 08:21:42 -0400 (EDT)
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
X-Inumbo-ID: 670395fd-7e89-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755778904;
	 x=1755865304; bh=yxEn3rNxw7LrE+OCiTpE/k3D/n9WtnKN5plChM6WF/Y=; b=
	vbNXoy/5ozF7rlIqKNV8jpHEoFp+85rFke4SvMWzod6pMy3i5jX2DjI3LGeN0Xx+
	qKkh0/FxsW7mWSGl1B4IQMAVCOD8Fm5kNfne3pDtky6awWKJqaVDSQI4UDfMZpwZ
	t2iXh5/MwShAKqI6YonzPL2L7YP/QDBbW+roIXxTBPT9UGnvNJqEpKDYil1cw+ho
	WKeJYmrp41eBXA3p+32btqAjW7EhoO2HCqdML6hJCfz830YlzU8vC6fAbkvZpW33
	o9k4evsyrl4XxqCtV0IQCOAbQQ3vd3dMRkNJbP7Sv61v+IbDRgKBEhZJtsPPt5Rm
	EZJrv0WZ/V93rrtVMPa/3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755778904; x=1755865304; bh=yxEn3rNxw7LrE+OCiTpE/k3D/n9WtnKN5pl
	ChM6WF/Y=; b=dXqHc1qgJlYWcH4N2404kf6EDNxS9WTNnL8De6XZ0E8RU3Xwyy/
	fEiOcp8zpeer2AMCWQUMtV/AxYgDDXbX4Dta0r9wD0IFb42RjH+Dzoy4TdOE3SrI
	/jNGQNLUsscjavCmqBG/Xp07bp1j3ag7ooo8TS5wHmY/qinKpKNGA/eFoyC2GTMo
	kupFJ0faxt31+veraQRnT5A/GvkTtyOMbFBdVh9OUWJLaDf5PYzXaqG6uwNDOBKq
	4bNE9HAZqWyfYwh/0qDmx7n/6pPcUzYAmMDOA0/3rWPAnbsJF0g9U6KklUvOVmeG
	D+O4GxOGiC5B5Dg3CYsrFSvAa3cKPeBun+Q==
X-ME-Sender: <xms:WA-naHyBagGKPNkff44eMMA8X6qVlBoNy5NiMS-u3xaKF9b6LIGpeg>
    <xme:WA-naM1lQhwWaQK26oryuMB1FQj3LRUpiXKpSFFceKKgThLT1XLLnqAX4_P7ZNx6B
    H7vVZ6dF2uXkg>
X-ME-Received: <xmr:WA-naHz0Zt0M7A7OrEYm54plIT7mTmZiDLFJN8LLN6dg7djow874XuNFGCMfFWT5nP3CuYZraN21BezRpvVhd-mx7IY5pkI66Vo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieduvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghruges
    vhgrthgvshdrthgvtghhpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomh
    dprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthho
    pehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvg
    hllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WA-naDFVgvYeO6hXQ-2lPPPVKpzbu3InC3fEnK_Z0S5QU-h4UHhYNg>
    <xmx:WA-naKargWcrJqCqAaRW8PUs9efK3u-DwIuRHFvXr4uu5A3zlIIC1Q>
    <xmx:WA-naFCVTzegvMsMVGOCJ_a8fqvwWbplLkc4sEyc47ea9ArOazx3iQ>
    <xmx:WA-naCluMaEsboXnsTP59uqqTZ6tDjjOzhA-UcBQX09FQFE5DG0xrA>
    <xmx:WA-naCO15WYA-XQ5FR20lHj_4rXK8WD2wpSIc5h2c5rd1kvAol4BKtpC>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 21 Aug 2025 14:21:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: Use 'watchdog' for x86 hardware
Message-ID: <aKcPVSFVxKJJFHrF@mail-itl>
References: <20250821120652.3910926-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uLEFXAnlDfKbUiRr"
Content-Disposition: inline
In-Reply-To: <20250821120652.3910926-1-andrew.cooper3@citrix.com>


--uLEFXAnlDfKbUiRr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Aug 2025 14:21:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: Use 'watchdog' for x86 hardware

On Thu, Aug 21, 2025 at 01:06:52PM +0100, Andrew Cooper wrote:
> This detects various hangs and turns them into a crash with backtrace.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Should it also apply to in-QEMU tests?

Anyway:

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  automation/scripts/qubes-x86-64.sh             | 4 ++--
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 2750d24eba17..b49a44c5b1ab 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -260,14 +260,14 @@ TFTP=3D/scratch/gitlab-runner/tftp
>  CONTROLLER=3Dcontrol@thor.testnet
> =20
>  echo "
> -multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglvl=
=3Dall dom0_mem=3D4G console_timestamps=3Dboot $extra_xen_opts
> +multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglvl=
=3Dall dom0_mem=3D4G console_timestamps=3Dboot watchdog $extra_xen_opts
>  module2 (http)/gitlab-ci/vmlinuz console=3Dhvc0 root=3D/dev/ram0 earlypr=
intk=3Dxen
>  module2 --nounzip (http)/gitlab-ci/initrd-dom0
>  " > $TFTP/grub.cfg
> =20
>  echo "#!ipxe
> =20
> -kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglvl=3Dall dom0=
_mem=3D4G console_timestamps=3Dboot $extra_xen_opts || reboot
> +kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglvl=3Dall dom0=
_mem=3D4G console_timestamps=3Dboot watchdog $extra_xen_opts || reboot
>  module /gitlab-ci/vmlinuz console=3Dhvc0 root=3D/dev/ram0 earlyprintk=3D=
xen || reboot
>  module /gitlab-ci/initrd-dom0 || reboot
>  boot
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/=
scripts/xilinx-smoke-dom0-x86_64.sh
> index 6970a8658d5f..0ad8f658e396 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -15,7 +15,7 @@ WORKDIR=3D"${PWD}"
>  TEST=3D"$1"
>  PASS_MSG=3D"Test passed: ${TEST}"
>  XEN_CMD_DOM0=3D"dom0=3Dpvh dom0_max_vcpus=3D4 dom0_mem=3D4G"
> -XEN_CMD_XEN=3D"sched=3Dnull loglvl=3Dall guest_loglvl=3Dall console_time=
stamps=3Dboot"
> +XEN_CMD_XEN=3D"sched=3Dnull loglvl=3Dall guest_loglvl=3Dall console_time=
stamps=3Dboot watchdog"
>  XEN_CMD_EXTRA=3D""
>  DOM0_CMD=3D""
>  DOMU_CMD=3D""
>=20
> base-commit: 97f9db488a48d5f7c41681ac3bde7047dcfca899
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uLEFXAnlDfKbUiRr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAminD1UACgkQ24/THMrX
1ywoGAf9GMRQ16p1LrDlhcrg1Wps+y6xjsW8vrOSar9pCd627xyMl2TKNQaDtOI1
oIQiKdb25s1X5jdBJsOLUTpGPtyX4pLCz/lOKokHm6VWCQeKi2+OlM9TFs3EakUX
JiX6sctw8RhHOsn7F8jDiEPTs10tcbYvOHBODpKGo62PUQsY86zsb+AejzfZdjVj
VMri86D500tFgR1KHJwff9qLqLIhAU9z9k7Yv8u/QklAyOZwnR9/AY/xa+u8/HCS
6ovR/Hi7yP5uII2VpwwJtdf3pHZR7LmGQfdivlH4Mf+9YWhOI4WlSmP/Clx5bTXj
hW7M5NkUBCFK1on7xaIOmE0+JnU1hA==
=A5+s
-----END PGP SIGNATURE-----

--uLEFXAnlDfKbUiRr--

