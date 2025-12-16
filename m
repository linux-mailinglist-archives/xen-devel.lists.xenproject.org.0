Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB45CC1E91
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 11:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187814.1509149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRyg-0005DJ-Vu; Tue, 16 Dec 2025 10:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187814.1509149; Tue, 16 Dec 2025 10:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRyg-0005BV-Sn; Tue, 16 Dec 2025 10:08:22 +0000
Received: by outflank-mailman (input) for mailman id 1187814;
 Tue, 16 Dec 2025 10:08:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jT/p=6W=bounce.vates.tech=bounce-md_30504962.69412f8d.v1-74f08a6edcc549c793f4b5dd515270bb@srs-se1.protection.inumbo.net>)
 id 1vVRyf-0005BP-6s
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 10:08:21 +0000
Received: from mail186-20.suw21.mandrillapp.com
 (mail186-20.suw21.mandrillapp.com [198.2.186.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22688576-da67-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 11:08:15 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-20.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4dVt0s4B7NzFCWtpf
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 10:08:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 74f08a6edcc549c793f4b5dd515270bb; Tue, 16 Dec 2025 10:08:13 +0000
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
X-Inumbo-ID: 22688576-da67-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765879693; x=1766149693;
	bh=F9FK6axYLMyEWWB4TkV/gZ+MceqbjwNwadiM4VDNDkU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zSBuNerVNUE9UmTKEa2o7Kn3B5RX6fbnqpyKoPWKxGa1/V+T9gfYM22ipWLDQQpJp
	 6HpVVVJJoLzHmU5W0hmoZcBIAWICcYvbmDoVwpGCgBATUiRTNalvHMaES5zMU2wH4e
	 nvy0tobQxmwraq7hAvJPYhwcQTSco+cSVz5cxO8Ey7gtq0uHtc1fjyOueXatFf6McJ
	 2kww/Uf4RFuOBIe8R72oLoS33r8WLr8Cehq4f6/9BoBofwa1/uYBNtYetY9/9aRFQX
	 u/P2ka9IeTMIng+Qb6TVhZ6PNGWpoNbreYg+orRt0LGz6U2vWE/jbXHD/zuojJynVo
	 xAP6BQpWBW1RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765879693; x=1766140193; i=teddy.astie@vates.tech;
	bh=F9FK6axYLMyEWWB4TkV/gZ+MceqbjwNwadiM4VDNDkU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jiMMyQjaneDlfTb6P9TZx2PuZ7XNL238+TRzL3TSUuG5F8rwVOUFteoIu6PyQPabJ
	 6bqAQrFASAM5hHIxFD96mg0cm1Tp8j+EcgTtZCIG+ki+JtTIIO2bl6ZcNqbBL1Kutm
	 NGUXmmzOz4G+76RtGfRIAR7zPlkEFone7qmSfFt8gs2/OaHekB3ZRadWJLh1zejAIV
	 d5iSmh3jBrg0SrDNB/fcfc04+lrqA9m2PyJA2qJuswOBB8/H16WIzwV/SxJd1oxanr
	 TkORmOPgWTojw+T1z0Auky06ldq/4hM0oWxjs0SZR1MLhfraPiXB1w65e3qIA41iv0
	 zLkQV4szMhy6Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/2]=20x86/AMD:=20disable=20RDSEED=20on=20problematic=20Zen5?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765879692590
Message-Id: <c4f7c28c-c5da-4c52-b243-a07dea8bf201@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <0b15a3fb-6ce4-4bf7-a235-073742fff35d@suse.com> <05012660-b93f-4439-a383-ff6e8e8d9566@suse.com>
In-Reply-To: <05012660-b93f-4439-a383-ff6e8e8d9566@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.74f08a6edcc549c793f4b5dd515270bb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251216:md
Date: Tue, 16 Dec 2025 10:08:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 16/12/2025 =C3=A0 10:03, Jan Beulich a =C3=A9crit=C2=A0:
> This particular variant has an error that causes 16- and 32-bit forms of
> RDSEED to frequently return 0 while still signaling success (CF=3D1). Ref=
er
> to AMD-SB-7055 / CVE-2025-62626.
> 
> Relevant data taken from Linux commits 607b9fb2ce24 ("x86/CPU/AMD: Add
> RDSEED fix for Zen5") and e1a97a627cd0 ("x86/CPU/AMD: Add additional fixe=
d
> RDSEED microcode revisions").
> 
> Like for the other RDSEED issue, the same command line override can be
> used to keep RDSEED enabled.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> See "x86/AMD: disable RDSEED on Fam17 model 47 stepping 0" for pending
> opens.
> 
> The choice of using AVX-IFMA to tell Zen6 from Zen5 is somewhat arbitrary=
;
> a few other features could equally(?) well be used.
> 
> I will admit that I was on the edge of switching to a table-based
> approach. (I'm also not happy with the case 0x44 layout, but keeping the
> "break" on the earlier line triggers [imo bogusly] gcc's "misleading
> indentation" warning. We could of course move yet farther away from the
> Linux originals and use switch(curr_rev >> 8), like we do in
> zenbleed_use_chickenbit() and amd_check_entrysign().)
> ---
> v3: Incorporate another Linux commit. Cover Zen6, assuming it is
>      universally unaffected.
> v2: New.
> 
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -863,6 +863,28 @@ static void cf_check fam17_disable_c6(vo
>   =09wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>   }
>   
> +static noinline bool __init zen5_rdseed_good(const struct cpuinfo_x86 *c=
)
> +{
> +    unsigned int curr_rev =3D this_cpu(cpu_sig).rev, fixed_rev =3D ~0;
> +
> +    switch ( c->model )
> +    {
> +    case 0x02: if ( c->stepping =3D=3D 1 ) fixed_rev =3D 0x0b00215a; bre=
ak;
> +    case 0x08: if ( c->stepping =3D=3D 1 ) fixed_rev =3D 0x0b008121; bre=
ak;
> +    case 0x11: if ( c->stepping =3D=3D 0 ) fixed_rev =3D 0x0b101054; bre=
ak;
> +    case 0x24: if ( c->stepping =3D=3D 0 ) fixed_rev =3D 0x0b204037; bre=
ak;
> +    case 0x44: if ( c->stepping =3D=3D 0 ) fixed_rev =3D 0x0b404035;
> +               if ( c->stepping =3D=3D 1 ) fixed_rev =3D 0x0b404108;
> +               break;
> +    case 0x60: if ( c->stepping =3D=3D 0 ) fixed_rev =3D 0x0b600037; bre=
ak;
> +    case 0x68: if ( c->stepping =3D=3D 0 ) fixed_rev =3D 0x0b608038; bre=
ak;
> +    case 0x70: if ( c->stepping =3D=3D 0 ) fixed_rev =3D 0x0b700037; bre=
ak;
> +    default:   if ( cpu_has_avx_ifma ) fixed_rev =3D 0 /* Zen6 */; break=
;
> +    }
> +
> +    return curr_rev >=3D fixed_rev;
> +}
> +
>   static bool zenbleed_use_chickenbit(void)
>   {
>       unsigned int curr_rev;
> @@ -1130,6 +1152,28 @@ static void cf_check init_amd(struct cpu
>   =09=09    !cpu_has(c, X86_FEATURE_BTC_NO))
>   =09=09=09setup_force_cpu_cap(X86_FEATURE_BTC_NO);
>   =09=09break;
> +
> +=09case 0x1a:
> +=09=09/*
> +=09=09 * Zen5 have an error that causes the 16- and 32-bit forms of
> +=09=09 * RDSEED to frequently return 0 while signaling success (CF=3D1).
> +=09=09 * Sadly at the time of writing the fixed microcode revision is
> +=09=09 * known for only two of the models.

Is it still two models ?

> +=09=09 */
> +=09=09if (c =3D=3D &boot_cpu_data &&
> +=09=09    cpu_has(c, X86_FEATURE_RDSEED) &&
> +=09=09    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
> +=09=09=09static const char __initconst text[] =3D
> +=09=09=09=09"RDSEED32 is unreliable on this hardware; disabling its expo=
sure\n";
> +
> +=09=09=09if (zen5_rdseed_good(c))
> +=09=09=09=09break;
> +
> +=09=09=09setup_clear_cpu_cap(X86_FEATURE_RDSEED);
> +=09=09=09cpuidmask_defaults._7ab0 &=3D ~cpufeat_mask(X86_FEATURE_RDSEED)=
;
> +=09=09=09warning_add(text);
> +=09=09}
> +=09=09break;

Do we still want to disable if we are running in a hypervisor; we can 
expect the host to emulate the instructions to workaround the issue ?

>   =09}
>   
>   =09display_cacheinfo(c);
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



