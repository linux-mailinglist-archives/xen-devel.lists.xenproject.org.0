Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD408B795B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714933.1116321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oST-0006h9-HY; Tue, 30 Apr 2024 14:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714933.1116321; Tue, 30 Apr 2024 14:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oST-0006fA-Ep; Tue, 30 Apr 2024 14:27:49 +0000
Received: by outflank-mailman (input) for mailman id 714933;
 Tue, 30 Apr 2024 14:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1oSS-0006f4-L1
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:27:48 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d08f7d8e-06fd-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 16:27:46 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2def8e5ae60so66387041fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 07:27:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b0041c14061c71sm9698674wmq.15.2024.04.30.07.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:27:46 -0700 (PDT)
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
X-Inumbo-ID: d08f7d8e-06fd-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714487266; x=1715092066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLTV69ggXSEfUfuXmfv5de6wjWSUaN1sFmPPHo0vFHs=;
        b=e26auLcaVLJ4M8icLYlTFo9eJPsdnVEdVX+BJEmDAuI9NPXbD0A/ED665RA4PU8foX
         XiQWOjDVNBYEyF8XUy9c4WHB1Ui4CI4kisE0S+OQg4R95GQf77uQUdxgphiZtdSUJPaT
         19EbVydwYP28jsJ56cIqokqj+2Ef2BbX1MPIeqkBA88SYCZkD4yZTr4/B3ANLkS5SuE9
         ccomZj+A0rhMGdgqNcI/Vt1RWjO9rC7cF5R/I9RX5LwKBkhpCa/Bx3lRYQJZZ3CcgeGD
         pAHCuGGpD6QEkg2aG1WK4dGbPEAvu0qJcLVPqjZ7oOEpM58G/i0HXlRXn+3yDzL1+2ik
         n5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714487266; x=1715092066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLTV69ggXSEfUfuXmfv5de6wjWSUaN1sFmPPHo0vFHs=;
        b=kw9Jc03Zzog5hWWSMqVQrPW32htZeI3G4xP2DGZQaV+XSeG0LiyADieRjH7DBiUnCg
         Wq8dVoNBFShPmyEajD9nBBtEVsra9K0M1OnEaZifiVcJxAHvk3NBIPh988r6g+jebbJ1
         MSvfoBduUeqIgr6Cstpjl8+LeNz6xCTgKnhJ55r8E6zczLkUhziiU64jUUiwMeKCvZaZ
         ZWx0+/md0u2CCDo6Eu+eFevC+wlS1wCd8WAw430voQUkHKSuO7coVi/wKNP0xgROgjeP
         +OO9e73kkmzlF/0Td+M1b9n8fWwSjKPtkuvW4kN7hnz/7niUUaXx5Uopz010lON8Yjsg
         x8Og==
X-Forwarded-Encrypted: i=1; AJvYcCUiMdxer4HkFH8aj0fwOHqnF4bS4dDQF5Eq9B1ncJRn5KLyZrwcpGFVMlxUgUC0sSKg80FaDnj3DeZF0IrQNrm7R+ngXWfRVtTW3tZT70U=
X-Gm-Message-State: AOJu0YzjUZMEWeyGg1YDw55GttEUuduBHnAG8agBvsuNL0FSWsXJtEoW
	8MZQg0ejtqi+gu/xzOMyOT+793BRSKwdlkzXfHm1cnJePXjEvP8y8sMxkOxiiw==
X-Google-Smtp-Source: AGHT+IEWKm88H8p3f8wwDdEmAsokajYPUYL8KRtUDMOZmgLKeCtcsfIWnTU7lUqlBemhrvnjeh1I4g==
X-Received: by 2002:a05:651c:cb:b0:2dd:bd92:63a with SMTP id 11-20020a05651c00cb00b002ddbd92063amr8493257ljr.34.1714487266301;
        Tue, 30 Apr 2024 07:27:46 -0700 (PDT)
Message-ID: <5600e97e-5d44-4901-a867-b48192e9525f@suse.com>
Date: Tue, 30 Apr 2024 16:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] x86: Make the maximum number of altp2m views
 configurable
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1714322424.git.w1benny@gmail.com>
 <0041438ff7a5d5b2fad59b676f4ece80470bf3b3.1714322424.git.w1benny@gmail.com>
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
In-Reply-To: <0041438ff7a5d5b2fad59b676f4ece80470bf3b3.1714322424.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.04.2024 18:52, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> This commit introduces the ability to configure the maximum number of altp2m
> tables during domain creation. Previously, the limits were hardcoded to a
> maximum of 10. This change allows for greater flexibility in environments that
> require more or fewer altp2m views.
> 
> The maximum configurable limit for max_altp2m on x86 is now set to MAX_EPTP
> (512). This cap is linked to the architectural limit of the EPTP-switching
> VMFUNC, which supports up to 512 entries. Despite there being no inherent need
> for limiting max_altp2m in scenarios not utilizing VMFUNC, decoupling these
> components would necessitate substantial code changes.

While I don't mind this connection, ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -685,6 +685,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
> 
> +    if ( config->max_altp2m > MAX_EPTP )
> +    {
> +        dprintk(XENLOG_INFO, "max_altp2m must be <= %u\n", MAX_EPTP);
> +        return -EINVAL;
> +    }

... using MAX_EPTP here feels like a layering violation to me. Imo there want
to be separate constants, tied together with a suitably placed BUILD_BUG_ON().

Furthermore comparisons like this (there are further ones elsewhere) suggest
there is a (continued) naming issue: A max_ or MAX_ prefix ought to name a
"maximum valid value", not "number of permitted values". This is not a
request to alter MAX_EPTP, but one to make sure the new struct fields really
have matching names and purposes.

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -258,11 +258,10 @@ struct paging_vcpu {
>      struct shadow_vcpu shadow;
>  };
> 
> +#define INVALID_ALTP2M  0xffff
> +#define MAX_EPTP        ((unsigned int)(PAGE_SIZE / sizeof(uint64_t)))

Aiui you add this cast because of the various min() uses. However, besides
wanting to avoid such casts (or in fact any, whenever possible), I don't
see why you need to retain all those min(): You bound d->max_altp2m against
MAX_EPTP during domain creation anyway.

> --- a/xen/arch/x86/mm/altp2m.c
> +++ b/xen/arch/x86/mm/altp2m.c
> @@ -13,6 +13,12 @@
>  void
>  altp2m_vcpu_initialise(struct vcpu *v)
>  {
> +    struct domain *d = v->domain;
> +
> +    /* Skip initialisation if no altp2m will be used. */
> +    if ( d->max_altp2m == 0 )
> +        return;

While I'm fine with this comment, ...

> @@ -28,8 +34,13 @@ altp2m_vcpu_initialise(struct vcpu *v)
>  void
>  altp2m_vcpu_destroy(struct vcpu *v)
>  {
> +    struct domain *d = v->domain;
>      struct p2m_domain *p2m;
> 
> +    /* Skip destruction if no altp2m was used. */
> +    if ( d->max_altp2m == 0 )
> +        return;

... this one doesn't look quite right: Even if altp2m-s were initialized,
none may have been used (yet).

> @@ -120,7 +131,13 @@ int p2m_init_altp2m(struct domain *d)
>      struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
> 
>      mm_lock_init(&d->arch.altp2m_list_lock);
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> +
> +    if ( (d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, d->max_altp2m)) == NULL )
> +    {
> +        return -ENOMEM;
> +    }

Nit: Overlong line and no need for the braces.

> +    for ( i = 0; i < d->max_altp2m; i++ )
>      {
>          d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);

This loop, btw, also demonstrates that "maximum" isn't true here. The
domain gets all of them allocated in one go.

> @@ -141,7 +158,10 @@ void p2m_teardown_altp2m(struct domain *d)
>      unsigned int i;
>      struct p2m_domain *p2m;
> 
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    if ( !d->arch.altp2m_p2m )
> +        return;
> +
> +    for ( i = 0; i < d->max_altp2m; i++ )
>      {
>          if ( !d->arch.altp2m_p2m[i] )
>              continue;
> @@ -149,6 +169,9 @@ void p2m_teardown_altp2m(struct domain *d)
>          d->arch.altp2m_p2m[i] = NULL;
>          p2m_free_one(p2m);
>      }
> +
> +    xfree(d->arch.altp2m_p2m);
> +    d->arch.altp2m_p2m = NULL;
>  }

Please don't (wrongly) open-code XFREE().

> @@ -2090,13 +2090,13 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
>      mfn_t mfn;
>      int rc = -EINVAL;
> 
> -    if ( idx >=  min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +    if ( idx >=  min(d->max_altp2m, MAX_EPTP) ||

Nit: Please take the opportunity and remove the excess blank.

>           d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] ==

This use of MAX_EPTP also needs replacing, to avoid speculatively overrunning
the allocated array. At least one more instance elsewhere.

> @@ -2575,12 +2575,12 @@ int p2m_set_suppress_ve_multi(struct domain *d,
> 
>      if ( sve->view > 0 )
>      {
> -        if ( sve->view >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
> +        if ( sve->view >= min(d->max_altp2m, MAX_EPTP) ||
>               d->arch.altp2m_eptp[array_index_nospec(sve->view, MAX_EPTP)] ==
>               mfn_x(INVALID_MFN) )
>              return -EINVAL;
> 
> -        p2m = ap2m = array_access_nospec(d->arch.altp2m_p2m, sve->view);
> +        p2m = ap2m = d->arch.altp2m_p2m[array_index_nospec(sve->view, d->max_altp2m)];

Nit: Overlong line (more elsewhere).

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -568,6 +568,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>          }
>      }
> 
> +    if ( config->max_altp2m && !hvm_altp2m_supported() )

This looks like it'll break the build on non-x86.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -21,7 +21,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
> 
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
> 
>  /*
>   * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> @@ -77,6 +77,7 @@ struct xen_domctl_createdomain {
>       */
>      uint32_t max_vcpus;
>      uint32_t max_evtchn_port;
> +    uint32_t max_altp2m;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;

Both this and ...

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -602,6 +602,8 @@ struct domain
>          unsigned int guest_request_sync          : 1;
>      } monitor;
> 
> +    unsigned int max_altp2m; /* Maximum number of altp2m tables */
> +
>      unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */

... this suggest you're confident other architectures will also want
to support altp2m. Yet nothing like that is said in the description.
In the absence of that common code should not require touching (much).

Jan

