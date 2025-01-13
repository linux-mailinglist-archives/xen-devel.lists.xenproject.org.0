Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798CDA0BCE5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 17:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870669.1281783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXMz3-0004Qn-7T; Mon, 13 Jan 2025 16:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870669.1281783; Mon, 13 Jan 2025 16:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXMz3-0004P4-32; Mon, 13 Jan 2025 16:08:09 +0000
Received: by outflank-mailman (input) for mailman id 870669;
 Mon, 13 Jan 2025 16:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vF2z=UF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tXMz1-0004Oy-Fm
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 16:08:07 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9094ce00-d1c8-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 17:08:04 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8E84B11400CC;
 Mon, 13 Jan 2025 11:08:01 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 13 Jan 2025 11:08:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jan 2025 11:07:58 -0500 (EST)
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
X-Inumbo-ID: 9094ce00-d1c8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736784481;
	 x=1736870881; bh=leGU5R4gV8gmHI/4wSgtW8YanKa0HgkMUjwwU+SST84=; b=
	Ko1VnU71vwgWHckvtVrYxwju3aqxzbiD2Y0u8GgJr3e+S/lDQhowPc+z58/RsCFG
	qkMbvrdleN0yRgZApy83ht44OzJhCKEBXy1ILwkme8AxATJHktMWPYV/leRpz0He
	hjh6anovPG6Oih5u2HlgTF4RVZGUjH2n64AfrZtZRpM24V2UZ/fnv7kI/GUfsSC+
	UVL9tKxqRa2EbV9arU30TITPXCqhFxK+JpiXYOfmgEiGhtjbP+HsWNqZoAFE1dD5
	2gjOJPOaSA9UI5c3+bKooREQaa/GmbUU4qOch/x3H3+jHcF9ImMWLfSdxtuByIuA
	coyt1e18aS66qGPbyNSRPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736784481; x=1736870881; bh=leGU5R4gV8gmHI/4wSgtW8YanKa0HgkMUjw
	wU+SST84=; b=RxWF7v/+8vCvyzQ7MD6vk2Qid872NPOOoXa7cCYfYdgCooInJ4n
	HQNJpz4vijWGxG/BSWcXslvvfeeOeH+p1ak+BpM/HqKDK9AMFYnLsqWetUewc1wA
	+YG5C8nRN6yOxzkzWbgL6Ki4NGSueUBcHY1ik9dwyAzUjT5cB6m5tlJeEKd0juAQ
	FMqVvnMQZ6jFoGgxHwML8LkUzye63b8SvxBdaLJP90oJJZofgkNVz69D06tbCVGj
	6wwgj7CxdGE2oASzKmElfv6hYpzGMVvIo556pfKsI8hzO8du41AjzRH6lX46ETXP
	NG+3PZGMgt62fXDROuhAF2lzrw0DxDONolw==
X-ME-Sender: <xms:YTqFZ2tk9ZoR56qklvAJCXMkjIWr34sjXpxEf_s2fisdNRPJLKxfxQ>
    <xme:YTqFZ7f_TRez_u8rOigSHvK7waQj7Hz8QCKOg2LhN9Uj4toep3QcEDmgG0O3YkDJP
    meub3POdWsBKg>
X-ME-Received: <xmr:YTqFZxyjCGYpf8QBHLNvkkMLmpVety59dWxYZ0joIapqzKEk8pkaD6sfzGdqJnzJpjgBAc2aIxs-bP8poadpD-QQFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehgedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgv
    rhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhes
    rghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheprghnughrvgifrd
    gtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehjsggvuhhlihgthhes
    shhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpth
    htohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YTqFZxMH7B5EKxHl4N67eC4iNx144oaScqxmTqnqfqqkzi6UIiu5ew>
    <xmx:YTqFZ2_ZoXTbdmHtGd1xDXjQQjn4ZsxW7DL_iUJirgzB0Dx7YP7IDQ>
    <xmx:YTqFZ5XqfUfT-VPTGgofVcPIDr_Qk0UwRB5GmbNJdUzdBAIrHC7WVQ>
    <xmx:YTqFZ_dQWHseByAKhsF4rDRJKRmGCxntpaHebdkLE1ogNPT3VDblyQ>
    <xmx:YTqFZ7PlIviiItkiXcByjhBOzmG1PFTmF9TO4-OxYPLPRsu4Esst1j1_>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 13 Jan 2025 17:07:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <Z4U6WxtmaqGkqOqe@mail-itl>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TrHspJ3XmM5BXBRb"
Content-Disposition: inline
In-Reply-To: <20240913075907.34460-2-roger.pau@citrix.com>


--TrHspJ3XmM5BXBRb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jan 2025 17:07:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock

On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
> Allow setting the used wallclock from the command line.  When the option =
is set
> to a value different than `auto` the probing is bypassed and the selected
> implementation is used (as long as it's available).
>=20
> The `xen` and `efi` options require being booted as a Xen guest (with Xen=
 guest
> supported built-in) or from UEFI firmware respectively.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> Changes since v6:
>  - Clarify documentation regarding repeated using of the wallclock comman=
d line
>    option.
>=20
> Changes since v5:
>  - Do EFI run-time services checking after command line parsing.
>=20
> Changes since v3:
>  - Note xen option is only available if Xen guest support it built.
>  - Fix typo.
> ---
>  docs/misc/xen-command-line.pandoc | 21 ++++++++++++++++
>  xen/arch/x86/time.c               | 41 ++++++++++++++++++++++++++++++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 959cf45b55d9..2a9b3b9b8975 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2816,6 +2816,27 @@ vwfi to `native` reduces irq latency significantly=
=2E It can also lead to
>  suboptimal scheduling decisions, but only when the system is
>  oversubscribed (i.e., in total there are more vCPUs than pCPUs).
> =20
> +### wallclock (x86)
> +> `=3D auto |=C2=A0xen | cmos | efi`
> +
> +> Default: `auto`
> +
> +Allow forcing the usage of a specific wallclock source.
> +
> + * `auto` let the hypervisor select the clocksource based on internal
> +   heuristics.
> +
> + * `xen` force usage of the Xen shared_info wallclock when booted as a X=
en
> +   guest.  This option is only available if the hypervisor was compiled =
with
> +   `CONFIG_XEN_GUEST` enabled.
> +
> + * `cmos` force usage of the CMOS RTC wallclock.
> +
> + * `efi` force usage of the EFI_GET_TIME run-time method when booted fro=
m EFI
> +   firmware.
> +
> +If the selected option is invalid or not available Xen will default to `=
auto`.
> +
>  ### watchdog (x86)
>  > `=3D force | <boolean>`
> =20
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 29b026735e5d..e4751684951e 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_string=
(void)
>      return "";
>  }
> =20
> +static int __init cf_check parse_wallclock(const char *arg)
> +{
> +    wallclock_source =3D WALLCLOCK_UNSET;
> +
> +    if ( !arg )
> +        return -EINVAL;
> +
> +    if ( !strcmp("auto", arg) )
> +        ASSERT(wallclock_source =3D=3D WALLCLOCK_UNSET);
> +    else if ( !strcmp("xen", arg) )
> +    {
> +        if ( !xen_guest )
> +            return -EINVAL;
> +
> +        wallclock_source =3D WALLCLOCK_XEN;
> +    }
> +    else if ( !strcmp("cmos", arg) )
> +        wallclock_source =3D WALLCLOCK_CMOS;
> +    else if ( !strcmp("efi", arg) )
> +        /*
> +         * Checking if run-time services are available must be done after
> +         * command line parsing.
> +         */
> +        wallclock_source =3D WALLCLOCK_EFI;
> +    else
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +custom_param("wallclock", parse_wallclock);
> +
>  static void __init probe_wallclock(void)
>  {
>      ASSERT(wallclock_source =3D=3D WALLCLOCK_UNSET);
> @@ -2527,7 +2558,15 @@ int __init init_xen_time(void)
> =20
>      open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
> =20
> -    probe_wallclock();
> +    /*
> +     * EFI run time services can be disabled from the command line, henc=
e the
> +     * check for them cannot be done as part of the wallclock option par=
sing.
> +     */
> +    if ( wallclock_source =3D=3D WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
> +        wallclock_source =3D WALLCLOCK_UNSET;
> +
> +    if ( wallclock_source =3D=3D WALLCLOCK_UNSET )
> +        probe_wallclock();
> =20
>      printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_strin=
g());
> =20
> --=20
> 2.46.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TrHspJ3XmM5BXBRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeFOlsACgkQ24/THMrX
1yy48Qf6AmkcKpsBDzt11yC7G41El4UIzy2LfyRIrowbj6052KMO6I/b8pZ8YWqO
xFBnofR/JxuBAWAZRSuww7QAdul7taKsofLPNWbEjg7rNeHss4i9Fs+J3Fc2tMy4
qob9ZRzMvOEkm35bo3fXu1EVcxbyfZZrJkn1ifXhnUBxntkbzEaBPs/LDURpyJxF
EdbKhSF/SJrmm1LsKhoIlExj/ejHYuUvHQf4uNQYnG1P6AvLEBORktV9fgo4Jlen
bF9VzOvsJXwHqaW+fVCwFyJTJ+2pSqGcnvEuF1mue71AksMlnSPFngu3D+72jZPO
tw/gTe4mUDCoTmGASkac9NZlFFzpSQ==
=+vNt
-----END PGP SIGNATURE-----

--TrHspJ3XmM5BXBRb--

