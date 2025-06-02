Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED73ACB134
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003468.1383027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5y6-0007iF-Jd; Mon, 02 Jun 2025 14:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003468.1383027; Mon, 02 Jun 2025 14:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5y6-0007g8-GW; Mon, 02 Jun 2025 14:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1003468;
 Mon, 02 Jun 2025 14:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uM5y4-0007fx-7d
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:16:48 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36e84047-3fbc-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:16:46 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id EB68A1140186;
 Mon,  2 Jun 2025 10:16:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 02 Jun 2025 10:16:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jun 2025 10:16:43 -0400 (EDT)
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
X-Inumbo-ID: 36e84047-3fbc-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748873804;
	 x=1748960204; bh=U5vh15ldnIwmnsvpqOh3R+awUXBVNiNBWbzkpE2jouw=; b=
	Z3m30inwAaRtiE7NTo8ykJpb9b8CJpsErlPh+Faad0q0sJtkukEShpbfzno4foMG
	EBi962+JBItjGsVevQS5jHmDeG97QVHn5aFV+CqyY414OoJezFbUbqK1i3sv5r8r
	CGRFe3nVOOhPDh3jH7csFVSbDsYcxfJEvF/8ui548ok5VHHlhE0+HwnFpo0abFHC
	suwB6gHeuXnduNkXl/YqBO7yRb03RiDrBA3ufq9IaOwRZsg7Ur56oh+TQE+IJfs1
	KpEsitLU6G6e1UBtujJDOCCOaz4SsQV2dMIf+IDVuZs0KKCxMJoTCHehHzobaMuF
	tLtCFaOOGNryX3nSOLP6cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748873804; x=1748960204; bh=U5vh15ldnIwmnsvpqOh3R+awUXBVNiNBWbz
	kpE2jouw=; b=aiA+P9SSM+G/8iS0rHdQtMgoaOgWld1+ZfDGJk4M2ulKqqMxiRI
	msuI0J6zVkwAMOF1LRMulgPIcX+wt8QHgM+Ow4Ht2HHerixwxcVWtrslOf7//T1m
	clh0JdMFADjkHSKwvPvns9+wKktPeuGWV3lDG2YWediqLiKXqCqVCTdryOvaVGQ0
	3m+xng/K5yFyXT+f+fBkXphRPIaFgpqJK0h+bee8ck5wRdBaAhc0t31tyQ33XlCg
	5Fs4AEU+ti6jarru5POVZD9hq9ynOF+gp0DG5295MlUt9F0BbEVxGdnSwXgDxish
	RWwCGuv6wg3prWCP86tTYXJffn4juf+x10A==
X-ME-Sender: <xms:TLI9aGE3pK4HkBctMn0ZlJYiOZP2wn2X10bBB6hcBEa3GXw6XX6hIQ>
    <xme:TLI9aHXWDllyW4ZcEdrilZwxk8ULEhlxKEoTfOkq9nr3lycbfas2kyBOtqrS7nK_N
    F0vZWgUJVwuuQ>
X-ME-Received: <xmr:TLI9aALGOmHnt8ZOvBAbdw9Bg9samPia_hoD63899OWCWHNH7rXKdKUzoQLYdJycKaxnOjBrhJW2Kkc9nwmSc5jSgzD9oSomJFE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeekleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifsh
    hkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihf
    ejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehkvghvihhnrdhlrghmphhishestghlohhuugdrtghomhdprhgtph
    htthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdp
    rhgtphhtthhopehrohhsshdrlhgrghgvrhifrghllhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:TLI9aAGHp740DAQFWqxF3knf51MvJhBqSQFnREZ_sIY2QGzGiP_7HQ>
    <xmx:TLI9aMUlzz_JKWLQX8cEZk9Vd5Ksyk06TY-aVIRcAZRpMHsnWoJDRw>
    <xmx:TLI9aDOvpG8qDwwBDwPLV7NhcKfl8iK4IybyDWHi-3zzRwaIPHcuuw>
    <xmx:TLI9aD38J67Wg-6JZM-YW2W6b08ltNK8dqq9HYmlM_4GNJV2eSUQcA>
    <xmx:TLI9aHs-eN0DpsXrPAzKqUxu30tOtFqN2tSqGUBYB5Z74uOp3uJssF_V>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Jun 2025 16:16:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 3/3] Disallow most command-line options when lockdown
 mode is enabled
Message-ID: <aD2ySVoaV2RydE-L@mail-itl>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-4-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jkJSLdWIIrLJxY8S"
Content-Disposition: inline
In-Reply-To: <20250602134656.3836280-4-kevin.lampis@cloud.com>


--jkJSLdWIIrLJxY8S
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Jun 2025 16:16:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 3/3] Disallow most command-line options when lockdown
 mode is enabled

On Mon, Jun 02, 2025 at 02:46:56PM +0100, Kevin Lampis wrote:
> A subset of command-line parameters that are specifically safe to use when
> lockdown mode is enabled are annotated as such.
>=20
> These are commonly used parameters which have been audited to ensure they
> cannot be used to undermine the integrity of the system when booted in
> Secure Boot mode.
>=20
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> Changes in v2:
> - Add more information about the safe parameters
> - Add lockdown section to the command line doc
> ---
>  docs/misc/xen-command-line.pandoc     | 16 +++++++++
>  xen/arch/arm/domain_build.c           |  4 +--
>  xen/arch/x86/acpi/cpu_idle.c          |  2 +-
>  xen/arch/x86/cpu/amd.c                |  2 +-
>  xen/arch/x86/cpu/mcheck/mce.c         |  2 +-
>  xen/arch/x86/cpu/microcode/core.c     |  2 +-
>  xen/arch/x86/dom0_build.c             |  4 +--
>  xen/arch/x86/hvm/hvm.c                |  2 +-
>  xen/arch/x86/irq.c                    |  2 +-
>  xen/arch/x86/nmi.c                    |  2 +-
>  xen/arch/x86/setup.c                  |  2 +-
>  xen/arch/x86/traps.c                  |  2 +-
>  xen/arch/x86/x86_64/mmconfig-shared.c |  2 +-
>  xen/common/domain.c                   |  2 +-
>  xen/common/kernel.c                   | 10 +++++-
>  xen/common/kexec.c                    |  2 +-
>  xen/common/lockdown.c                 |  2 +-
>  xen/common/numa.c                     |  2 +-
>  xen/common/page_alloc.c               |  2 +-
>  xen/common/shutdown.c                 |  2 +-
>  xen/drivers/char/console.c            |  2 +-
>  xen/drivers/char/ns16550.c            |  4 +--
>  xen/drivers/video/vga.c               |  2 +-
>  xen/include/xen/param.h               | 49 +++++++++++++++++++++------
>  24 files changed, 87 insertions(+), 36 deletions(-)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index b0eadd2c5d..7916875f22 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1798,6 +1798,22 @@ immediately. Specifying `0` will disable all testi=
ng of illegal lock nesting.
> =20
>  This option is available for hypervisors built with CONFIG_DEBUG_LOCKS o=
nly.
> =20
> +### lockdown
> +> `=3D <boolean>`
> +
> +> Default: `false`

This belongs to the 2/3 patch, no?

> +
> +The intention of lockdown mode is to prevent attacks from a rogue dom0
> +userspace from compromising the system. It is also enabled automatically
> +when Secure Boot is enabled and it cannot be disabled in that case.
> +
> +After lockdown mode is enabled some unsafe command line options will be
> +ignored by Xen.
> +
> +If enabling lockdown mode via the command line then ensure it is positio=
ned as
> +the first option in the command line string otherwise Xen may process un=
safe
> +options before reaching the lockdown parameter.
> +
>  ### loglvl
>  > `=3D <level>[/<rate-limited level>]` where level is `none | error | wa=
rning | info | debug | all`
> =20
=2E..
> diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
> index 84eabe9c83..cd3deeb63e 100644
> --- a/xen/common/lockdown.c
> +++ b/xen/common/lockdown.c
> @@ -35,7 +35,7 @@ static int __init parse_lockdown_opt(const char *s)
> =20
>      return 0;
>  }
> -custom_param("lockdown", parse_lockdown_opt);
> +custom_secure_param("lockdown", parse_lockdown_opt);

Is that really a good idea? It means `lockdown=3Dyes lockdown=3Dno` would
still disable it in the end. This may matter more if for example the
`lockdown=3Dyes` part is in the built-in cmdline (possibly with other
integrity protection than UEFI SB).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jkJSLdWIIrLJxY8S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg9skkACgkQ24/THMrX
1yzj4Af9Fl+Of2IAPvZbhwIDPdPJj2CRxEnnmCCBCIUHyN+BiuOR6U9Xgg4cZL25
BVQdA9QYeJgAx/cXaluTiLca061kc4cu1kaNwvLHF6nKxwevJjLEgGcb2cCkh5H5
kanrhIyIFJoqayc6JlKkrf0IOv2J1YNWhOR72/OrjIfRkw05YEubxJ9HG2L4ZjPt
N8vQnoSRr4ICzcWzZXlK/GPoSPAJaMuJWq/814HGZYh8/VmyTSOohAstw+Z33+MO
v2vs2NoNeeYR4d1uKaVRiTJOJ2uMYD57htiA2gZ64Jd8PkaZ4cEVYq8G/8FggR1W
p7Q5Rbxx9h0Rq5EjRYwmklx2J2XJFA==
=OrsQ
-----END PGP SIGNATURE-----

--jkJSLdWIIrLJxY8S--

