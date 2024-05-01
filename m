Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74378B8851
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 12:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715275.1116801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s26lE-0006dw-OB; Wed, 01 May 2024 10:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715275.1116801; Wed, 01 May 2024 10:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s26lE-0006bU-LI; Wed, 01 May 2024 10:00:24 +0000
Received: by outflank-mailman (input) for mailman id 715275;
 Wed, 01 May 2024 10:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ji+M=ME=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s26lD-0006bO-Ci
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 10:00:23 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e5df7cb-07a1-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 12:00:21 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-23d175cea45so793888fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 03:00:21 -0700 (PDT)
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
X-Inumbo-ID: 9e5df7cb-07a1-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714557619; x=1715162419; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PgxCtXauH5+qhWuqX0AP7gWWK9Xjwp6PUSSNEOSfwk=;
        b=avS10P+veaboJSpscb5CXByzSXdSPamfdCCqvXoYmLzPvUSPZQ9/itysERbAjhInBP
         FumwueqvGbkQVzUTa60mCS1Huke6YdScVGj6i0CvAiJPiTADwOOabECjIvFsBBl5TrWj
         K4oeAfQh7QGMaXXkbmWiloNmLjLV2+y/hJBiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714557619; x=1715162419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PgxCtXauH5+qhWuqX0AP7gWWK9Xjwp6PUSSNEOSfwk=;
        b=qn5dj2FUyRzWDjxMU/DTRqJhoxuLmmCCYJ4HxDTpjXb5K++gLKgUG7kOXZ9ezlOp+0
         kJBMviX6/QUxpOTfIjRIlu5AxUICd7EmLqLWlHhpPTqohfGImJOOg0XfDJkfrQE+6EXz
         tVeivHnNvjZ9Yx1Ck2GoXIqO2gtlGJwGfcIV4nRoI+5r87HxE6YQhXkcyjdBpgtMPH/c
         EpkOVsxQ30do9Kjp/AyxzpurkjY/8CbccYbRemMqARMnHMge8N0a83o3iXW+cvjb2l9B
         ZBVfRESipl9F1hVBrxt5qEFDy4ssaJm1+Yd27wRGaT9jNeTWbCoF/CCCLy+HhIJgiqsl
         zX7Q==
X-Gm-Message-State: AOJu0YyGbmwue5glaXVff+cHfllVPpbP+ooCBzl0FxR2jmPdkLuRVfuz
	l1K63Zmmq4r9dmt8Uj49T96XI+q0emIvSqApMgSD5TbfocMCEBogPZ6JJve6iiiyw66HrPjfkVl
	z/ENcVwLg5a/GxLXkQMMCfH6m0g/dnvT1bcqXXA==
X-Google-Smtp-Source: AGHT+IGRYQkhQmaNpChn5amcdOKu7dzGqhsYSIwudWBWFPpKMP0F3C6e6Xqf2UrTtikbXcUlsDTdopbpMwtf+Pa4F+E=
X-Received: by 2002:a05:6871:8783:b0:238:f6dc:6f7f with SMTP id
 td3-20020a056871878300b00238f6dc6f7fmr1949894oab.58.1714557619442; Wed, 01
 May 2024 03:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240429151625.977884-1-andrew.cooper3@citrix.com> <20240429151625.977884-3-andrew.cooper3@citrix.com>
In-Reply-To: <20240429151625.977884-3-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 1 May 2024 11:00:08 +0100
Message-ID: <CA+zSX=Y_fcDLonuRZZCaaKjK87tXEnnvJGjJHrKy5wzvaC2rzA@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86/cpu-policy: Add SVM features already used by Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrei Semenov <andrei.semenov@vates.fr>, 
	Vaishali Thakkar <vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 4:16=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> These will replace svm_feature_flags and the SVM_FEATURE_* constants over=
 the
> next few changes.  Take the opportunity to rationalise some names.
>
> Drop the opencoded "inherit from host" logic in calculate_hvm_max_policy(=
) and
> use 'h'/'!' annotations.  The logic needs to operate on fs, not the polic=
y
> object, given its position within the function.
>
> Drop some trailing whitespace introduced when this block of code was last
> moved.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Andrei Semenov <andrei.semenov@vates.fr>
> CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
> ---
>  tools/misc/xen-cpuid.c                      | 11 +++++++++++
>  xen/arch/x86/cpu-policy.c                   | 17 +++++------------
>  xen/include/public/arch-x86/cpufeatureset.h | 14 ++++++++++++++
>  xen/tools/gen-cpuid.py                      |  3 +++
>  4 files changed, 33 insertions(+), 12 deletions(-)
>
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index ab09410a05d6..0d01b0e797f1 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -266,6 +266,17 @@ static const char *const str_m10Ah[32] =3D
>
>  static const char *const str_eAd[32] =3D
>  {
> +    [ 0] =3D "npt",                 [ 1] =3D "v-lbr",
> +    [ 2] =3D "svm-lock",            [ 3] =3D "nrips",
> +    [ 4] =3D "v-tsc-rate",          [ 5] =3D "vmcb-cleanbits",
> +    [ 6] =3D "flush-by-asid",       [ 7] =3D "decode-assist",
> +
> +    [10] =3D "pause-filter",
> +    [12] =3D "pause-thresh",
> +    /* 14 */                      [15] =3D "v-loadsave",
> +    [16] =3D "v-gif",
> +    /* 18 */                      [19] =3D "npt-sss",
> +    [20] =3D "v-spec-ctrl",
>  };
>
>  static const char *const str_e1Fa[32] =3D
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index 4b6d96276399..da4401047e89 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -9,7 +9,6 @@
>  #include <asm/amd.h>
>  #include <asm/cpu-policy.h>
>  #include <asm/hvm/nestedhvm.h>
> -#include <asm/hvm/svm/svm.h>
>  #include <asm/intel-family.h>
>  #include <asm/msr-index.h>
>  #include <asm/paging.h>
> @@ -748,22 +747,16 @@ static void __init calculate_hvm_max_policy(void)
>      if ( !cpu_has_vmx )
>          __clear_bit(X86_FEATURE_PKS, fs);
>
> -    /*
> +    /*
>       * Make adjustments to possible (nested) virtualization features exp=
osed
>       * to the guest
>       */
> -    if ( p->extd.svm )
> +    if ( test_bit(X86_FEATURE_SVM, fs) )
>      {
> -        /* Clamp to implemented features which require hardware support.=
 */
> -        p->extd.raw[0xa].d &=3D ((1u << SVM_FEATURE_NPT) |
> -                               (1u << SVM_FEATURE_LBRV) |
> -                               (1u << SVM_FEATURE_NRIPS) |
> -                               (1u << SVM_FEATURE_PAUSEFILTER) |
> -                               (1u << SVM_FEATURE_DECODEASSISTS));
> -        /* Enable features which are always emulated. */
> -        p->extd.raw[0xa].d |=3D (1u << SVM_FEATURE_VMCBCLEAN);
> +        /* Xen always emulates cleanbits. */
> +        __set_bit(X86_FEATURE_VMCB_CLEANBITS, fs);
>      }

What about this line, at the end of recalculate_cpuid_policy()?

  if ( !p->extd.svm )
        p->extd.raw[0xa] =3D EMPTY_LEAF;

Is there a reason to continue to operate directly on the policy here,
or would it be better to do this up in the featureset section?

 -George

