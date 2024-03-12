Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42B879862
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691931.1078543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4SZ-0004tA-9N; Tue, 12 Mar 2024 15:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691931.1078543; Tue, 12 Mar 2024 15:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4SZ-0004rI-6r; Tue, 12 Mar 2024 15:54:35 +0000
Received: by outflank-mailman (input) for mailman id 691931;
 Tue, 12 Mar 2024 15:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk4SX-0004rC-UU
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:54:33 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0c4a689-e088-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 16:54:31 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a45ba1f8e89so624837466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 08:54:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ld1-20020a170906f94100b00a461c74bbbfsm2699283ejb.91.2024.03.12.08.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 08:54:31 -0700 (PDT)
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
X-Inumbo-ID: d0c4a689-e088-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710258871; x=1710863671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jl6fEIgH2oglGYPVjMa6cx3/SPDIkeNV4c9GG1YmLTE=;
        b=bGOkx2pHDt13Gi9iSOWigKj+Whw4+jf3vWRPJQbf0ZG+kJ1VZOJ6MwGHfE+On0oj4O
         6Gtn2/xI7U3e0PBycztDZvb7nBSnnjFJecC4pjE0IHJrl3S6GVtrxoRTFDHwQKlZsk17
         aYkyBoOy52IxFsVz0ogtIezKMUYh2zCTR+aExgZkFSMPS7PVyhC8GxsMYnGylSTkPEEk
         eWcTEyGAeiF8ZzOwTOx9Fq1UzadVjLreldSTPsuGdJcmiKmp3qBPVFoFcOTLc1QJwdbD
         8nIS/12YCMpIW7px71w9i5MD8XARvnt6DVlkokpQT0JD2jHpdgpwgGwqaThgw2z0EyPO
         tJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710258871; x=1710863671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jl6fEIgH2oglGYPVjMa6cx3/SPDIkeNV4c9GG1YmLTE=;
        b=eO1CZ3vOELwTtCIMlBt7GdTBLcN0o0Ju7GNO7yQk55nPbylHNFp7vE3U5cnqqHlsLC
         8IVNFpE4QnDF90c/8NDjlP1vP26dQCfKER6bwXAwmIuV8ztbQQDAKYZkmP2XxHqiKmuO
         CuBE6He6wNqP+68Ikvr3gH7nbmYBAHVRWipdke3T1iqHh18zCSVV4ktx6TW9jT1oFesN
         LwvrCstXfd0VROlNLf/DU97/QJ+tuZVlDYSXOckibEweU057TA9Dppr7yDdQ9BMFfmD8
         Rueo4pX++z/ZxqpmGLcJ2d6h9poiAyj5XGlmw81Px31eQWUmqA2WODgle05GnCQnirX1
         MiXA==
X-Forwarded-Encrypted: i=1; AJvYcCWOI/HmqkkatyA+GBa90XhQZHNmDLZF3LI4y87MuTyTNciHqV7mJdwPPavkj9uRctndR2QWYRkiZ6zkpVK1x/KUwZnIVrZPvkblBlRQTcY=
X-Gm-Message-State: AOJu0YyxNBk2iH/a/4bBOWlTNpFcsgE7gX4Mt0uI1rfbld1c0ai0+vRK
	HfBgK20Iwrsd/fcz2N21/0ip5NHQRVAcilLnfG9JtxchmTN2LiHilhlBdibtTg==
X-Google-Smtp-Source: AGHT+IHi3LXKzx6fHhr5HA+tii4DsLRmvVNoPYeVL0CTnMFFDgCHCQUtBX6Oi9vizj18eu6FgoegjQ==
X-Received: by 2002:a17:906:af83:b0:a44:55e8:53b6 with SMTP id mj3-20020a170906af8300b00a4455e853b6mr6776137ejb.32.1710258871400;
        Tue, 12 Mar 2024 08:54:31 -0700 (PDT)
Message-ID: <7a9d46bb-e231-4b1a-a60c-62905e6cc1cc@suse.com>
Date: Tue, 12 Mar 2024 16:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 14/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <305d6474a84e16d44c193a93e2c2ca91d6dd0f7e.1710145041.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <305d6474a84e16d44c193a93e2c2ca91d6dd0f7e.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Edit inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
> prevent the contents of a header file being included more than once").
> Mechanical change.

The changes all follow a single pattern, yet I'm afraid I can't bring
this pattern in line with this description. To take ...

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -1,5 +1,5 @@
> -#ifndef __ASM_DOMAIN_H__
> -#define __ASM_DOMAIN_H__
> +#ifndef ASM_X86_DOMAIN_H
> +#define ASM_X86_DOMAIN_H
>  
>  #include <xen/mm.h>
>  #include <xen/radix-tree.h>
> @@ -780,7 +780,7 @@ struct arch_vcpu_io {
>  /* Maxphysaddr supportable by the paging infrastructure. */
>  unsigned int domain_max_paddr_bits(const struct domain *d);
>  
> -#endif /* __ASM_DOMAIN_H__ */
> +#endif /* ASM_X86_DOMAIN_H */

... this as example - what's the violation here? The existing symbol
provides the intended effect, doesn't it? What it does not is adhere
to the new naming scheme, but there's no mention of that in the
description.

Jan

