Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9C8B6A5C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 08:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714525.1115807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1gmG-0003Ow-GQ; Tue, 30 Apr 2024 06:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714525.1115807; Tue, 30 Apr 2024 06:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1gmG-0003Lk-DL; Tue, 30 Apr 2024 06:15:44 +0000
Received: by outflank-mailman (input) for mailman id 714525;
 Tue, 30 Apr 2024 06:15:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6P6E=MD=bounce.vates.tech=bounce-md_30504962.66308c8c.v1-cf4811e39cc04ea6811cd96a40a7a875@srs-se1.protection.inumbo.net>)
 id 1s1gmF-0003Le-1s
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 06:15:43 +0000
Received: from mail177-4.suw61.mandrillapp.com
 (mail177-4.suw61.mandrillapp.com [198.2.177.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11cef185-06b9-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 08:15:41 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-4.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4VT9182WqQzlfcGG
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 06:15:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cf4811e39cc04ea6811cd96a40a7a875; Tue, 30 Apr 2024 06:15:40 +0000
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
X-Inumbo-ID: 11cef185-06b9-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1714457740; x=1714718240;
	bh=42apf4I4lyfKwWo5zIz6aBDJRkNs9ARy7y6wHmC14ds=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EfIEcgJZqhDowICELvQL1CAGfqF2oFmWwpfO7cLu3k6/7unlTOavb17MCinuux9zW
	 oq8lf0GLtfie+B1e5BbwkiYJcsiUohPaIJus7Z+C15qyI+dXV7GzosfOZb4eNEKrVf
	 mDCc/oq1DKDk3oWIg7A3xrDYnRXM9NVH4Cnhn6UxOH2o3B1AmOlDxdQrKlZ69oZejW
	 9rOY6akkvBenE3IzLhejatYgRQFsf6d0FulddbtN7dq51JCDl8yuOx5Qyu+1mV9HtD
	 NffUw8ru+kgcAgE19YTZ/FeydWlxRAtxnLjSHUkaal9eflZPXBtyeYHp8E1Q+vV+gN
	 xeJRw+2PkHM3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1714457740; x=1714718240; i=vaishali.thakkar@vates.tech;
	bh=42apf4I4lyfKwWo5zIz6aBDJRkNs9ARy7y6wHmC14ds=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ibyY0rQ6HdDYM7WyeaJFFV2QdS5cnRpeoJRSCXODoGVkN1cU7pMLpPT0X9PUF05Ln
	 OxW8bWuw+EKi6Y3H3es2xLlBWz9C+q9KelzPEzgVw2tpdzJVi2KkTiivIUJ7RP7MrF
	 bFkpZYhxmwIbozRIzhX7WPSOhcCEGuj7gI/H3K4Rt2tSTEVxEExXrz1xNsrQiEcFoV
	 4PMF8DTTjGa/Z09e5/hVVM9xCXL0SxSQjDAYKE3bcIs1DAHMMzUDWwnCdVhu/Pqw0y
	 8DBtwZVubUeaeRun77aeLNilVT9YPVGpybnUnuTVSCZo6u1prS0FmCw85QaotSYHed
	 X+bsQhgKS5kCA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=205/5]=20x86/cpu-policy:=20Introduce=20some=20SEV=20features?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1714457737927
Message-Id: <66fa84f0-95bd-4a2c-80d7-7212784cee39@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, George Dunlap <george.dunlap@citrix.com>, Andrei Semenov <andrei.semenov@vates.fr>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com> <20240429151625.977884-6-andrew.cooper3@citrix.com>
In-Reply-To: <20240429151625.977884-6-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cf4811e39cc04ea6811cd96a40a7a875?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240430:md
Date: Tue, 30 Apr 2024 06:15:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/29/24 5:16 PM, Andrew Cooper wrote:
> For display purposes only right now.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Andrei Semenov <andrei.semenov@vates.fr>
> CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
> 
> This is only half the work to get SEV working nicely.  The other
> half (rearranging __start_xen() so we can move the host policy collection
> earlier) is still a work-in-progress.
> ---
>   tools/misc/xen-cpuid.c                      | 3 +++
>   xen/arch/x86/include/asm/cpufeature.h       | 3 +++
>   xen/include/public/arch-x86/cpufeatureset.h | 4 ++++
>   xen/tools/gen-cpuid.py                      | 6 +++++-
>   4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 0d01b0e797f1..1463e0429ba1 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -281,6 +281,9 @@ static const char *const str_eAd[32] =3D
>   
>   static const char *const str_e1Fa[32] =3D
>   {
> +    [ 0] =3D "sme",                 [ 1] =3D "sev",
> +    /* 2 */                       [ 3] =3D "sev-es",
> +    [ 4] =3D "sev-snp",
>   };
>   
>   static const struct {
> diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include=
/asm/cpufeature.h
> index b6fb8c24423c..732f0d2bf758 100644
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -230,6 +230,9 @@ static inline bool boot_cpu_has(unsigned int feat)
>   #define cpu_has_v_gif           boot_cpu_has(X86_FEATURE_V_GIF)
>   #define cpu_has_v_spec_ctrl     boot_cpu_has(X86_FEATURE_V_SPEC_CTRL)
>   
> +/* CPUID level 0x8000001f.eax */
> +#define cpu_has_sev             boot_cpu_has(X86_FEATURE_SEV)
> +
>   /* Synthesized. */
>   #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
>   #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING=
)
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/pu=
blic/arch-x86/cpufeatureset.h
> index 80d252a38c2d..7ee0f2329151 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -374,6 +374,10 @@ XEN_CPUFEATURE(NPT_SSS,            18*32+19) /*   NP=
T Supervisor Shadow Stacks *
>   XEN_CPUFEATURE(V_SPEC_CTRL,        18*32+20) /*   Virtualised MSR_SPEC_=
CTRL */
>   
>   /* AMD-defined CPU features, CPUID level 0x8000001f.eax, word 19 */
> +XEN_CPUFEATURE(SME,                19*32+ 0) /*   Secure Memory Encrypti=
on */
> +XEN_CPUFEATURE(SEV,                19*32+ 1) /*   Secure Encryped VM */
> +XEN_CPUFEATURE(SEV_ES,             19*32+ 3) /*   SEV Encrypted State */
> +XEN_CPUFEATURE(SEV_SNP,            19*32+ 4) /*   SEV Secure Nested Pagi=
ng */
>   
>   #endif /* XEN_CPUFEATURE */
>   
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index f07b1f4cf905..bff4d9389ff6 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -281,7 +281,7 @@ def crunch_numbers(state):
>           _3DNOW: [_3DNOWEXT],
>   
>           # The SVM bit enumerates the whole SVM leave.
> -        SVM: list(range(NPT, NPT + 32)),
> +        SVM: list(range(NPT, NPT + 32)) + [SEV],
>   
>           # This is just the dependency between AVX512 and AVX2 of XSTATE
>           # feature flags.  If want to use AVX512, AVX2 must be supported=
 and
> @@ -341,6 +341,10 @@ def crunch_numbers(state):
>   
>           # The behaviour described by RRSBA depend on eIBRS being active=
.
>           EIBRS: [RRSBA],
> +
> +        SEV: [SEV_ES],
> +
> +        SEV_ES: [SEV_SNP],
>       }
>   
>       deep_features =3D tuple(sorted(deps.keys()))


