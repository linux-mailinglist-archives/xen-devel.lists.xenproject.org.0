Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC18B9F2D8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 14:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130482.1470024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kvS-0003FZ-No; Thu, 25 Sep 2025 12:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130482.1470024; Thu, 25 Sep 2025 12:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kvS-0003DJ-L9; Thu, 25 Sep 2025 12:18:18 +0000
Received: by outflank-mailman (input) for mailman id 1130482;
 Thu, 25 Sep 2025 12:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNKh=4E=bounce.vates.tech=bounce-md_30504962.68d53302.v1-9ee169bf4786479b9503b6ed6a8e7e30@srs-se1.protection.inumbo.net>)
 id 1v1kvR-0003DD-PB
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 12:18:17 +0000
Received: from mail180-36.suw31.mandrillapp.com
 (mail180-36.suw31.mandrillapp.com [198.2.180.36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3d08c11-9a09-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 14:18:11 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-36.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cXXmf2sRwzlg1Zh
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 12:18:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9ee169bf4786479b9503b6ed6a8e7e30; Thu, 25 Sep 2025 12:18:10 +0000
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
X-Inumbo-ID: b3d08c11-9a09-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1758802690; x=1759072690;
	bh=JKilhYpTE5ep7HfJnAYoiJxWkDZWfvDEUgMJdk37F0U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ay5lyo8JHwF0oKSE3V04sLiW2G3DERtKoQEYGtRwn32NKPBjrR2iDjPfu7E1QcfZ1
	 7mElpSiIOaT+9bAWlGH4tAyJSi7zqSaIIEDM+yTktbBEz9UZsnHu30yXWaQj3iOmVi
	 J40h6mvEtfgTKaI6SwG2XcbYGfKr31V2yqUzj8ewM9kQ220B5ArjaHK398Bft/8hu5
	 FR+dcm55DiUPewEfRh9YpqOxAa70kOgoqxgWVPyWfi7ax8Cc3wSyzE0mP6flb3c7jU
	 trBYYQSwRw8+oXQwvl+Ld3EbOSOGRrtnqhrBxP+uz5OmrVbx3xWKMwR3PdMHFoOkq6
	 BSxyWwhkYdFGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1758802690; x=1759063190; i=teddy.astie@vates.tech;
	bh=JKilhYpTE5ep7HfJnAYoiJxWkDZWfvDEUgMJdk37F0U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=krcOr2oMw4I9/0YWttZXvT+JAGYjvUsQGpDDFLDJX/laOrjItJNIu/RCRjvwmYUyf
	 Y7rHuRWUIDfpkEpDfe0aPBN06RiFJd/P31xYvkpWBcO01lUA4iLB4ufn2ebZKyT6TU
	 4uhF3tCUqeCh6f+8WpStrhM1I8CjAMVj8KZpLE3EWXcPYedU+R/jaTK7MGuEGOMJZ1
	 ax5aW9/LoGQnX+aJGHb/zlwSrIWiAvRTAvlfhzFaM69UyXhXYe9NDY/UZGxgjSS+kO
	 /H9bGhVUslHuh1gF1Z3VqlgUNrMoZh5+PiDum/3So4n+N9Lae+CIiNzRdpTJLx65LO
	 aNMBqlS3O2HYA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.21=201/2]=20x86/AMD:=20avoid=20REP=20MOVSB=20for=20Zen3/4?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1758802689248
Message-Id: <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com> <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
In-Reply-To: <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9ee169bf4786479b9503b6ed6a8e7e30?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250925:md
Date: Thu, 25 Sep 2025 12:18:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25/09/2025 =C3=A0 12:48, Jan Beulich a =C3=A9crit=C2=A0:
> Along with Zen2 (which doesn't expose ERMS), both families reportedly
> suffer from sub-optimal aliasing detection when deciding whether REP MOVS=
B
> can actually be carried out the accelerated way. Therefore we want to
> avoid its use in the common case (memset(), copy_page_hot()).

s/memset/memcpy (memset probably uses rep stosb which is not affected IIUC)

> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Question is whether merely avoiding REP MOVSB (but not REP MOVSQ) is goin=
g
> to be good enough.
> 

This probably wants to be checked with benchmarks of rep movsb vs rep 
movsq+b (current non-ERMS algorithm). If the issue also occurs with rep 
movsq, it may be preferable to keep rep movsb even considering this issue.

> --- a/xen/arch/x86/copy_page.S
> +++ b/xen/arch/x86/copy_page.S
> @@ -57,6 +57,6 @@ END(copy_page_cold)
>           .endm
>   
>   FUNC(copy_page_hot)
> -        ALTERNATIVE copy_page_movsq, copy_page_movsb, X86_FEATURE_ERMS
> +        ALTERNATIVE copy_page_movsq, copy_page_movsb, X86_FEATURE_XEN_RE=
P_MOVSB
>           RET
>   END(copy_page_hot)
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1386,6 +1386,10 @@ static void cf_check init_amd(struct cpu
>   
>   =09check_syscfg_dram_mod_en();
>   
> +=09if (c =3D=3D &boot_cpu_data && cpu_has(c, X86_FEATURE_ERMS)
> +=09    && c->family !=3D 0x19 /* Zen3/4 */)
> +=09=09setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
> +

May it be fixed through a (future ?) microcode update, especially since 
rep movs is microcoded on these archs ?

>   =09amd_log_freq(c);
>   }
>   
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -684,6 +684,9 @@ static void cf_check init_intel(struct c
>   =09 */
>   =09if (c =3D=3D &boot_cpu_data && c->vfm =3D=3D INTEL_SKYLAKE_X)
>   =09=09setup_clear_cpu_cap(X86_FEATURE_CLWB);
> +
> +=09if (c =3D=3D &boot_cpu_data && cpu_has(c, X86_FEATURE_ERMS))
> +=09=09setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
>   }
>   
>   const struct cpu_dev __initconst_cf_clobber intel_cpu_dev =3D {
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -7,7 +7,7 @@
>   #define FSCAPINTS FEATURESET_NR_ENTRIES
>   
>   /* Synthetic words follow the featureset words. */
> -#define X86_NR_SYNTH 1
> +#define X86_NR_SYNTH 2
>   #define X86_SYNTH(x) (FSCAPINTS * 32 + (x))
>   
>   /* Synthetic features */
> @@ -43,6 +43,7 @@ XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SY
>   XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used b=
y Xen for HVM */
>   XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead =
of VMMCALL */
>   XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
> +XEN_CPUFEATURE(XEN_REP_MOVSB,     X86_SYNTH(32)) /* REP MOVSB used for m=
emcpy() and alike. */
>   
>   /* Bug words follow the synthetic words. */
>   #define X86_NR_BUG 1
> --- a/xen/arch/x86/memcpy.S
> +++ b/xen/arch/x86/memcpy.S
> @@ -10,7 +10,7 @@ FUNC(memcpy)
>            * precautions were taken).
>            */
>           ALTERNATIVE "and $7, %edx; shr $3, %rcx", \
> -                    STR(rep movsb; RET), X86_FEATURE_ERMS
> +                    STR(rep movsb; RET), X86_FEATURE_XEN_REP_MOVSB
>           rep movsq
>           or      %edx, %ecx
>           jz      1f
> 
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



