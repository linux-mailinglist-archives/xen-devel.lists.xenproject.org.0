Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA56878F9A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 09:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691701.1077946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjxNk-0003or-U0; Tue, 12 Mar 2024 08:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691701.1077946; Tue, 12 Mar 2024 08:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjxNk-0003m5-Qv; Tue, 12 Mar 2024 08:21:08 +0000
Received: by outflank-mailman (input) for mailman id 691701;
 Tue, 12 Mar 2024 08:21:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjxNj-0003lz-70
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 08:21:07 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78d2918f-e049-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 09:21:06 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d40fe2181dso47340641fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 01:21:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cq15-20020a056402220f00b0056761c83bdesm3736461edb.93.2024.03.12.01.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 01:21:05 -0700 (PDT)
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
X-Inumbo-ID: 78d2918f-e049-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710231665; x=1710836465; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3ffPOtRcv9waHyVC3FI+fg9G66DrwjncSkxrL418Qc=;
        b=O7BiMrMdiLmJt6m179W2bn/Lycy7k2LvC5p94cLOaOh9OQ8JpnwENFKL1bG94uLGht
         Cz/k+PGBNShRTsb+SWH0ijUT6BoXXFZXaVm/2T6Ia0CPb5EHYH/qonbOlzgj3rLyUHXP
         Yc19q7O3EmR/XEyDtx5IWbl/FklPAFDBkGH+Qx7vmCvT0mlTjLSGP0Q7mDZyWNAJ3fwy
         I0sO6NnVMwrh7bMyCCqRR4cxr/TXxe23VT3TWbv0R1G3f+apfsBCpyeteT78hI5psdeO
         E1yRL1oV+8lNaRWXuL5zumwzXpvUpbimbh8NaOR62eY64wTifdOq8eB+IvG98E2GZ2gC
         ZxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710231665; x=1710836465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3ffPOtRcv9waHyVC3FI+fg9G66DrwjncSkxrL418Qc=;
        b=NewOHyPfkhTn3MqegbL2qBTp9/cjdUlHV+0l5bugZyvwjkD86zPCBj1gCCrymopVK0
         OxMiMKlNt5VHNLVCO/dPLbYUR8sHciCvZaxs2cqSlqflkXCSIaSqC89ltMTWsIFIYlVw
         sWzk9x4B6dzthSy2X3mp0Wm6yhU3lU1wwqDbiHDmHpC6u5Z4lnLGZOHg7x4nQfNu62RD
         VreCsatEb69vvA8ESHAkl1sDsdgntY609aCKuTd9MXPxUv12opBINIENBFqCR2vMIwHs
         61R94KKGWA+Hu92jo+i1foQUKCDKYq1fSIFO4wBJvvoS5NINQeVgtlWNHuq0LzbYWeqa
         GXOw==
X-Forwarded-Encrypted: i=1; AJvYcCWZWCVgChrKpBUCme/vGHRbnB9+/5PX9Nh19KKznnmih/m7DrzctNFt0paT+6aGahrS33Jkhm+3bzjuA18qvPo2HUFJVYUVCH62UFQzSas=
X-Gm-Message-State: AOJu0Ywlq6rR1XYQ9Z3gkxfX32kLfQYivTiZckQSKra37mcQjRBrvSZq
	vWGlIcn49xSc8vE7j3oI/1CtSUn3y2DQlKCUb+9c+jw0KJlNdxww1JNaSv6m2w==
X-Google-Smtp-Source: AGHT+IH+s2A/J2VJbPM0DeuU1dBvlJN/Jku50XJd+mV8QWZKU/HXMEWLtu2m12T8I8t4gvyaqXaIVw==
X-Received: by 2002:a2e:b8d4:0:b0:2d4:513d:7b34 with SMTP id s20-20020a2eb8d4000000b002d4513d7b34mr938448ljp.17.1710231665513;
        Tue, 12 Mar 2024 01:21:05 -0700 (PDT)
Message-ID: <f61bbdae-500a-4106-8f86-7adaad2ca1a5@suse.com>
Date: Tue, 12 Mar 2024 09:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 09/16] xen: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <504cdd2a0f27d28e0a87492f75476b123b68bbc0.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <504cdd2a0f27d28e0a87492f75476b123b68bbc0.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> Amend inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere) and the #if directive cannot
> be used for other checks.

This latter restriction, even if just slightly, hampers readability

> --- a/xen/include/xen/err.h
> +++ b/xen/include/xen/err.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
> -#define __XEN_ERR_H__
> +#ifndef XEN_INCLUDE_XEN_ERR_H
> +#define XEN_INCLUDE_XEN_ERR_H
> +#ifndef __ASSEMBLY__
>  
>  #include <xen/compiler.h>
>  #include <xen/errno.h>
> @@ -41,4 +42,5 @@ static inline int __must_check PTR_RET(const void *ptr)
>  	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
>  }
>  
> -#endif /* __XEN_ERR_H__ */
> +#endif /* __ASSEMBLY__ */
> +#endif /* XEN_INCLUDE_XEN_ERR_H */

... here, ...

> --- a/xen/include/xen/softirq.h
> +++ b/xen/include/xen/softirq.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
> -#define __XEN_SOFTIRQ_H__
> +#ifndef XEN_INCLUDE_XEN_SOFTIRQ_H
> +#define XEN_INCLUDE_XEN_SOFTIRQ_H
> +#ifndef __ASSEMBLY__
>  
>  /* Low-latency softirqs come first in the following list. */
>  enum {
> @@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
>   */
>  void process_pending_softirqs(void);
>  
> -#endif /* __XEN_SOFTIRQ_H__ */
> +#endif /* __ASSEMBLY__ */
> +#endif /* XEN_INCLUDE_XEN_SOFTIRQ_H */

... here, and ...

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> -#define __XEN_VMAP_H__
> +#ifndef XEN_INCLUDE_XEN_VMAP_H
> +#define XEN_INCLUDE_XEN_VMAP_H
> +#ifdef VMAP_VIRT_START
>  
>  #include <xen/mm-frame.h>
>  #include <xen/page-size.h>
> @@ -42,4 +43,5 @@ static inline void vm_init(void)
>      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>  }
>  
> -#endif /* __XEN_VMAP_H__ */
> +#endif /* VMAP_VIRT_START */
> +#endif /* XEN_INCLUDE_XEN_VMAP_H */

... here. Wasn't a goal of Misra to also not have negative effects on code
readability?

Jan

