Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25555F48F4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 19:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415756.660401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofm76-0003G0-Ie; Tue, 04 Oct 2022 17:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415756.660401; Tue, 04 Oct 2022 17:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofm76-0003Cv-Fn; Tue, 04 Oct 2022 17:53:52 +0000
Received: by outflank-mailman (input) for mailman id 415756;
 Tue, 04 Oct 2022 17:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgJy=2F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ofm75-0003Cp-8E
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 17:53:51 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fccbb88-440d-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 19:53:50 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 77C7A5C0113;
 Tue,  4 Oct 2022 13:53:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 04 Oct 2022 13:53:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Oct 2022 13:53:47 -0400 (EDT)
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
X-Inumbo-ID: 7fccbb88-440d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664906028; x=
	1664992428; bh=crMLwkYrYFWOA1+VA0BUO688RPGUWzKTzdzfbu3JkkE=; b=2
	MMOhyZHbORWatMaYrJCtVSYg0r0XHyaW0eNJY0z8ZTzVricK2fwqD2PeAIh/Cdo5
	mP/c4bd/7fnTeRCN5GdvXpsugzgtKtIiUSamUPS3JZpKTMhVxq/XhFo6d38Udru1
	+UxjarFIUmASO+6IZSWuQgAPs5lhwUquKHksNP9lklxcDpGkSdrDad34m5ep1J7t
	zhi29mw3H1b2W0HtF2QVo50Dm9BYR62zqne0OHvaeEkycXfkvPLWcC0cx9r8YDwS
	wf9PIHYoubtVbD1g8X5YqfYedJGV6YL2tKrRh9Y3NpuyaSxlNP5wknxD1gKIKdlh
	fBahCbY24fY4tAGY60mSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664906028; x=1664992428; bh=crMLwkYrYFWOA1+VA0BUO688RPGU
	WzKTzdzfbu3JkkE=; b=AkTt3B8pmj7Ml2nZSgvgOsy/oWj/1LypjtTvL1IJhMwM
	WZVackhTEinZ3ojHW1IhRqczLN1gUakhP0GeWj1WjnGSG1bHVdBZ4MT9JxtD8U6P
	9+a/xvBpoJmF/4KGx/hJOkpoZECJOZjgpGlXAY5BOGlceJtcPyFfTz+dxRqLvlKV
	6mxnsnBba50ERm43a5oVj19YcbcQ6xg6TLVKEXjngEKu59wFrkkMWFMOu3vnZlOy
	yh+IERoWKg8OdGQ+Ko6EeHfzRosPvcCJPH8w4TJyKcg5/YHTWqKckz1HBqxdutht
	em4qSGDuBhDXGDLOMCgYCUhZCDbv+6sD9Y8IzOLtnQ==
X-ME-Sender: <xms:LHM8Y4GBfgG_KA7tDJUFRrGo8uH8hbrLXd-oE_10qTXae9gBBQW4QQ>
    <xme:LHM8YxUmGdTS-D4eX4ZoSG6b-t4YUt1Ts33jQjSXVXYW5JN1sgZxp2Ewbvpw_4qjT
    NMCJ_Z1w9hJ3yU>
X-ME-Received: <xmr:LHM8YyJtqC_Q3f45_myOFkQ7-KeoZOE4Z-sAeUqigATWrQH9p_1RWqocHFGX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiuddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:LHM8Y6Fv_vgu392bpTx3N2pvr4OUP49VNCFut6gXn9MfUTToEcjk8g>
    <xmx:LHM8Y-XxT18-IBZrtJOgfq5CYL2-CYGbFo2YLZVjvJP3qnMMAGM8rA>
    <xmx:LHM8Y9NYYH66k3QJzrwbhU1BHX98AE_rcHwMuiwb_fhxeaCcwtSNDw>
    <xmx:LHM8Y8zyWh_71Li2Tp9EYHRe5teOPFg3wn_ZCDucMMSjbTSPNtJ9kA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 4 Oct 2022 13:53:31 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] x86: Activate Data Operand Invariant Timing Mode by
 default
Message-ID: <YzxzKY01r12OPyiR@itl-email>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SHDQr5c8XtikZYTS"
Content-Disposition: inline
In-Reply-To: <20221004160810.25364-3-andrew.cooper3@citrix.com>


--SHDQr5c8XtikZYTS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 4 Oct 2022 13:53:31 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] x86: Activate Data Operand Invariant Timing Mode by
 default

On Tue, Oct 04, 2022 at 05:08:10PM +0100, Andrew Cooper wrote:
> Intel IceLake and later CPUs have microarchitectural behaviours which cau=
se
> data-dependent timing behaviour.  This is not an issue for 99% of softwar=
e,
> but it is a problem for cryptography routines.  On these CPUs, a new
> architectural feature, DOITM, was retrofitted in microcode.
>=20
> For now, Xen can't enumerate DOITM to guest kernels; getting this working=
 is
> still in progress.  The consequence is that guest kernels will incorrectly
> conclude that they are safe.
>=20
> To maintain the safety of current software, activate DOITM unilaterally. =
 This
> will be relaxed in the future when we can enumerate the feature properly =
to
> guests.
>=20
> As an emergency stopgap, this behaviour can be disabled by specifying
> `cpuid=3Dno-doitm` on Xen's command line, but is not guaranteed ABI moving
> forward.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Henry Wang <Henry.Wang@arm.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  xen/arch/x86/cpu/common.c            | 29 +++++++++++++++++++++++++++++
>  xen/arch/x86/cpuid.c                 |  5 +++++
>  xen/arch/x86/include/asm/processor.h |  2 ++
>  xen/tools/gen-cpuid.py               |  2 ++
>  4 files changed, 38 insertions(+)
>=20
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 0412dbc915e5..8c46a4db430a 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -209,6 +209,34 @@ void ctxt_switch_levelling(const struct vcpu *next)
>  		alternative_vcall(ctxt_switch_masking, next);
>  }
> =20
> +bool __ro_after_init opt_doitm =3D true;
> +
> +static void doitm_init(void)
> +{
> +    uint64_t val;
> +
> +    if ( !opt_doitm || !cpu_has_arch_caps )
> +        return;
> +
> +    rdmsrl(MSR_ARCH_CAPABILITIES, val);
> +    if ( !(val & ARCH_CAPS_DOITM) )
> +        return;
> +
> +    /*
> +     * We are currently unable to enumerate MSR_ARCH_CAPS to guest.  As a
> +     * consequence, guest kernels will believe they're safe even when th=
ey are
> +     * not.
> +     *
> +     * Until we can enumerate DOITM properly for guests, set it unilater=
ally.
> +     * This prevents otherwise-correct crypto from becoming vulnerable to
> +     * timing sidechannels.
> +     */
> +
> +    rdmsrl(MSR_UARCH_MISC_CTRL, val);
> +    val |=3D UARCH_CTRL_DOITM;
> +    wrmsrl(MSR_UARCH_MISC_CTRL, val);
> +}
> +
>  bool_t opt_cpu_info;
>  boolean_param("cpuinfo", opt_cpu_info);
> =20
> @@ -532,6 +560,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	/* Now the feature flags better reflect actual CPU features! */
> =20
>  	xstate_init(c);
> +	doitm_init();
> =20
>  #ifdef NOISY_CAPS
>  	printk(KERN_DEBUG "CPU: After all inits, caps:");
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 112ee63a9449..09c1ee18fd95 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -106,7 +106,12 @@ static void __init cf_check _parse_xen_cpuid(
>      const char *name, unsigned int feat, bool val)
>  {
>      if ( unlikely(feat =3D=3D ~0u) )
> +    {
> +        if ( strcmp(name, "doitm") =3D=3D 0 )
> +            opt_doitm =3D val;
> +
>          return;
> +    }
> =20
>      if ( !val )
>          setup_clear_cpu_cap(feat);
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
> index 8e2816fae9b9..2978416e6c5b 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -637,6 +637,8 @@ enum ap_boot_method {
>  };
>  extern enum ap_boot_method ap_boot_method;
> =20
> +extern bool opt_doitm;
> +
>  #endif /* !__ASSEMBLY__ */
> =20
>  #endif /* __ASM_X86_PROCESSOR_H */
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index f3045b3bfd36..78a3a5c1941f 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -303,6 +303,8 @@ def crunch_numbers(state):
>      # specially
>      #
>      pseduo_names =3D (
> +        # Data Operand Invariant Timing Mode.  Lives in MSR_ARCH_CAPS
> +        "doitm",
>      )
> =20
>      for n in pseduo_names:
> --=20
> 2.11.0

I can=E2=80=99t review the actual implementation, but the idea looks good t=
o me.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--SHDQr5c8XtikZYTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmM8cykACgkQsoi1X/+c
IsHbUhAAv4Rbj8vaccBO8kZW5hLFXlpTm3aY9wkKZsNV+CHHV6aXQCYWirYJfuSo
r3PZnVSu7qZI46b8PHG7oYIObtAy1HNXcF93qA4y4MazrRKdf8UyJD35sIvCZ4iz
Q0+BdZB+y+uvNeulfevKCss7bzn8YBFn8EW9g2AzouiEjG+mrtUzxMZ0UyQfDWdr
GeSMgy30bJmCwQljOQzQ3Zflv9m8oajwaOFYTyLHJujeowwfJG3KjCSOMBN6g5ga
hFtmYCdJ+0VVZ+6mNLB0hpvEJWsxN2nUW9HgZhLVgYSTT/2wZv2exKiE9vFsg1Bc
GUisQkG6Wxa40RZzfcOSNp3s08jjzPB4dNWkiqFk33wserlqIhGkppvaDEaLvuCA
9+bviE5QsrmkrVqkJ/+fI4H2vo4zmM7t9GKBTnuVlTEnc71CYtxTr+pCh3eXFRzn
FKpgvTAX/KZyJ0xy9/E9eXO2gYJO8jLu85crXHImInDTffMrLliRhysAyf1pVDV3
K//1+2GPu7fCoySer4dSSt/PDNb4uOUBIzXHNGzqq45CsNFsxJeogeCFU6BtxrvC
qFdVBiplmVGyqAn949iYnjVs6XElTu5HH61HAaHbYiudsd5T1OKVE7nSnqrt2vtU
y2mzJz6GNM/6g01rwMYItmCtNOOhw7dmL+nqmIRKyZP5daha8QQ=
=oJP8
-----END PGP SIGNATURE-----

--SHDQr5c8XtikZYTS--

