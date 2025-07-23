Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CDB0F6F4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054401.1423170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebMk-0002hU-JD; Wed, 23 Jul 2025 15:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054401.1423170; Wed, 23 Jul 2025 15:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebMk-0002g3-G4; Wed, 23 Jul 2025 15:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1054401;
 Wed, 23 Jul 2025 15:26:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uebMj-0002fx-27
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:26:45 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6afbc31f-67d9-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:26:35 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso4157799f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:26:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b49ecsm98594845ad.98.2025.07.23.08.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:26:33 -0700 (PDT)
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
X-Inumbo-ID: 6afbc31f-67d9-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753284394; x=1753889194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wpTppFqpPwq8wynI5L6XjfaMmkoTcmtAERtFzyuxha4=;
        b=Nv4MX01cPCDSbFC7TTIyw5DF6yJVNYkbLigXG4iUtJgabTvlxqS12nFmMemIoLOYXv
         NLMUM8sHEYVd2qpico+LIOxMfZCUSfErFJI5RnhPu89HEXyAPGdbsd30CBEaKxQcEk6Y
         JOpbNXOGKUxKMsRaNOqEZt66d8BzuyT6lCZY71cP+3J9RI96O7gHhsLpgZ9LUnbZyusS
         AanMiFgvhsmmsx9SUi1TbscB752Q8sngcom1ajpcSDsTpk1U3F4ABwJjDSWbDuWXQPQc
         5Bnf/ZTEz/1AxLPGUduIbNWE7yVjyuVO4Q6Jg/+TVpKfFWu8rbi+kAx9gdtDwmUXFkYu
         675A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753284394; x=1753889194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpTppFqpPwq8wynI5L6XjfaMmkoTcmtAERtFzyuxha4=;
        b=sj4KlPSNyWGQ79x6rss0KTaQsuxhd6k0ZOwKtX5y/Y3Ga7iJKzZ3LVn5M7Dfcsrm0f
         kjhYlDBO4HQifORasPxg2tT7yK3lBBJBRdoYHrNKbD90vx7EBcHSc6MvdNfcnb2Z1Fp8
         TI3dVlhsxyr3Bzl0wGSJc/y3ZiM8spNvd1lNlh75A6puDbsmRgFsH2DY5j9v7RTi7tyV
         R8y1CH50wVPEOBA+ZUpg28bcRFoJLSoPbq3aVbJEWpDjMnZFiXhj3U322NBLjgUxBTHE
         klPljz+oxmLWZ/Fgue3IwjFtRNDGgIi7vEU5LOX4UBHBeoUmDVeSsLbwxXqXkOHAuhWJ
         jaag==
X-Forwarded-Encrypted: i=1; AJvYcCU5knLJgmTaSR3v24I+8xoI5B61izq7DT2XMTjnCvlR0vCQswkXZU/YLdqTVdY0bAF4DuYTpBfi6/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yym66+uWQGSNoswkuhp5QF4K7BA++wr4FEWu6p0P5Ch6qMWqVGa
	YAei8mwZeLAv95iZLjN9tnNxhYbGaOk5kMtjHmBx0IAPLlBsJkz+L5bCOrLNgf0omQ==
X-Gm-Gg: ASbGnctt1xiYZs7iodVeMXhVOPAvW6MYybeJ68fRqvMRZHujPi22HSpMT2hWSfk299f
	w9Hwbpo7GrdjVSsQ+ZPkJD45tx/PxOYeNir3DSWMQau1Hc1+9qHIMfm1BBcrNH++7CtlhdgQVNv
	I9FH3F3oR17qB/2TPZfV52J1D+zuU02mmmS/HkVRqZf7YvWot4TWDxcBMl5RJPVK82u65dntxu1
	vi8Bq/eMuJvGS/6KvoHYRVf4x7DvPmNIp8pjEQB/nP1rpEqcGX5EK1loo2Z5dXlt4L0vS6jFByy
	ZSjqekmVus4vMHN5UJQvbcDGeQVci8FaPno4vV8Ac48qba4KLWf2fN/vpcTP/kxOmLfunCyyG0c
	Bvj1nyXL66SxlLreZJWMNBsE1q1lSSzJ/aJs3vl4Q40qv8lm4TyV/dqJtadU/vAbCv+kEojcxNq
	rQAlcmsTo=
X-Google-Smtp-Source: AGHT+IGVOxjYeIiuQRI4hoOUm6JsDk+3U//XBGs98oCRfmCqPfuz1yadX0Lg7BlK/1KUNAp+fbIFMQ==
X-Received: by 2002:a05:6000:400a:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3b768eb2c17mr2967545f8f.26.1753284394364;
        Wed, 23 Jul 2025 08:26:34 -0700 (PDT)
Message-ID: <0ae7fbe3-3d27-4bdf-ba02-a3c1d783d764@suse.com>
Date: Wed, 23 Jul 2025 17:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/9] xen: Make the maximum number of altp2m views
 configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1752691429.git.w1benny@gmail.com>
 <2c43671a77ebe71f58cd0815000d356f85df781d.1752691429.git.w1benny@gmail.com>
Content-Language: en-US
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
In-Reply-To: <2c43671a77ebe71f58cd0815000d356f85df781d.1752691429.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 22:15, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> This commit introduces the ability to configure the maximum number of altp2m
> views for the domain during its creation. Previously, the limits were hardcoded
> to a maximum of 10. This change allows for greater flexibility in environments
> that require more or fewer altp2m views.
> 
> The maximum configurable limit for nr_altp2m on x86 is now set to
> MAX_NR_ALTP2M (which currently holds the MAX_EPTP value - 512). This cap is
> linked to the architectural limit of the EPTP-switching VMFUNC, which supports
> up to 512 entries. Despite there being no inherent need for limiting nr_altp2m
> in scenarios not utilizing VMFUNC, decoupling these components would necessitate
> substantial code changes.
> 
> xen_domctl_createdomain::altp2m is extended for a new field `nr`, that will
> configure this limit for a domain. Additionally, previous altp2m.opts value
> has been reduced from uint32_t to uint16_t so that both of these fields occupy
> as little space as possible.
> 
> Accesses to the altp2m_p2m array are modified to respect the new nr_altp2m
> value. Accesses to the altp2m_(visible_)eptp arrays are unmodified, since
> these arrays always have fixed size of MAX_EPTP.
> 
> Additional sanitization is introduced in the x86/arch_sanitise_domain_config
> to fix the altp2m.nr value to 10 if it is previously set to 0. This behavior
> is only temporary and immediately removed in the upcoming commit (which will
> disallow creating a domain with enabled altp2m with zero nr_altp2m).
> 
> The reason for this temporary workaround is to retain the legacy behavior
> until the feature is fully activated in libxl.
> 
> Also, arm/arch_sanitise_domain_config is extended to not allow requesting
> non-zero altp2ms.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> ---
>  xen/arch/arm/domain.c             |  2 +-
>  xen/arch/x86/domain.c             | 40 ++++++++++++++---
>  xen/arch/x86/hvm/hvm.c            |  8 +++-
>  xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
>  xen/arch/x86/include/asm/altp2m.h | 28 ++++++++++--
>  xen/arch/x86/include/asm/domain.h |  9 ++--
>  xen/arch/x86/include/asm/p2m.h    |  4 +-
>  xen/arch/x86/mm/altp2m.c          | 72 ++++++++++++++++---------------
>  xen/arch/x86/mm/hap/hap.c         |  6 +--
>  xen/arch/x86/mm/mem_access.c      | 22 ++++------
>  xen/arch/x86/mm/mem_sharing.c     |  4 +-
>  xen/arch/x86/mm/p2m-ept.c         |  7 +--
>  xen/arch/x86/mm/p2m-pt.c          |  2 +
>  xen/arch/x86/mm/p2m.c             |  8 ++--
>  xen/common/domain.c               |  6 +++
>  xen/include/public/domctl.h       |  5 ++-
>  xen/include/xen/sched.h           |  4 ++
>  17 files changed, 151 insertions(+), 78 deletions(-)

I understand the cover letter has some revlog, but may I please ask to have
such (also) per-patch?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4675,6 +4675,12 @@ static int do_altp2m_op(
>          goto out;
>      }
>  
> +    if ( d->nr_altp2m == 0 )
> +    {
> +        rc = -EINVAL;
> +        goto out;
> +    }

Besides disliking EINVAL here, I also question this general rejection. For
e.g. HVMOP_altp2m_get_domain_state it may well make sense to still get back
"disabled". Yet I understand this affects a few of the pre-existing checks
as well.

With the error code changed to EOPNOTSUPP (as every other similar path uses,
with the sole exception of the "if ( XEN_ALTP2M_disabled == mode )" one):
Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/mm/mem_access.c
> +++ b/xen/arch/x86/mm/mem_access.c
> @@ -81,6 +81,7 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
>  
>      if ( altp2m_active(d) )
>          p2m = p2m_get_altp2m(v);
> +
>      if ( !p2m )
>          p2m = p2m_get_hostp2m(d);
>  
> @@ -145,6 +146,7 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>  
>      if ( altp2m_active(d) )
>          p2m = p2m_get_altp2m(v);
> +
>      if ( !p2m )
>          p2m = p2m_get_hostp2m(d);

I think such stray changes would better be omitted, especially from an already
large patch.

Jan

