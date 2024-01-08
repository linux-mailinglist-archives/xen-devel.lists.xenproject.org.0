Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0FF8269B2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 09:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663221.1033070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlE7-0006MX-TL; Mon, 08 Jan 2024 08:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663221.1033070; Mon, 08 Jan 2024 08:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlE7-0006K0-QR; Mon, 08 Jan 2024 08:43:19 +0000
Received: by outflank-mailman (input) for mailman id 663221;
 Mon, 08 Jan 2024 08:43:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMlE6-0006Jt-Ib
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 08:43:18 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f72ee75d-ae01-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 09:43:16 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a28ee72913aso442828266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 00:43:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m10-20020a0566380aca00b0046d18e358b3sm2109389jab.63.2024.01.08.00.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 00:43:15 -0800 (PST)
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
X-Inumbo-ID: f72ee75d-ae01-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704703395; x=1705308195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N51FgBg7cRleoKQP0GgmnzFDKeG70I1Y4ktdJPwFM6k=;
        b=M7zttbUw1dbWXhWf+6GbjTTSgc7J4/kCg4lBlWmaOjhrtyd/2qiqbyqb5nszCPuoaD
         Rx1jKhCeqoGChbfdcrwnApa6TvF3bhYhIf6iya3r+sz6ci8fx1RpQJcc3lxEYrCFbFIo
         6nJpKoF53tSjclsZ5gk+GrxCRs+gcmXTCl0JmB9ai78ID7mDtC04EEThgL7R6y/xL/t1
         UPnAP6Te5IxosZSgm7OVBItr7VJyqdgGcYmutDFazW+tIBy67HCJouhYyRyEuw6NTdKD
         rMFxglwWQhnRqv04+sCLEgTIGLzWEXJ927iORdYTUAd+seY8AjaXxhEezaIXOOLWQ217
         8UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704703395; x=1705308195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N51FgBg7cRleoKQP0GgmnzFDKeG70I1Y4ktdJPwFM6k=;
        b=u6TGbcjMLGy8W5Q1+ke5o6+A3b4nzcyKEZN+1IjkCa2+3XrRw2BmZw+pTC5kvBSuMy
         YnJFFC4mnOyhHYhXhh5ku72/dnqve0qD00QihDeDqdcG1nZbmVW0sX9ozVq1/Z62QkAB
         LI2M+H6tI2RnydkNXNHYBmKN08RmzGlQEXv2eaklhG6eEpT/10yHwM/gHY/wkPqRyE7r
         xT/9/CltdmT3HMirW5ZqVRpl2bN1JIqUvfjLnPrzr7PU+BdEMwX1e9iJiupCARR6nmB7
         k/SLuFRT5gVE4MSrsK3lY0hOuAtvplW5bZs6w5TCj/iV5jEFPIL/cNsuXDEnIgpf6RzP
         Gd9g==
X-Gm-Message-State: AOJu0YziOhKmzK+Mmb/Z8H+MsNtpz64XbjJY0BQwxrukqjAHXGjhlhb/
	RSnOX1V327/e/4teni5q2wfq5GDctAUI
X-Google-Smtp-Source: AGHT+IFmvOf3ha8DlMcu99ccDjiKo/uWJem5B4i6FhiGI6HTIbt7mJhOtSW9kbIGylHDbvUADaFnbQ==
X-Received: by 2002:a17:906:494b:b0:a27:d3ee:2ef5 with SMTP id f11-20020a170906494b00b00a27d3ee2ef5mr5528819ejt.24.1704703395651;
        Mon, 08 Jan 2024 00:43:15 -0800 (PST)
Message-ID: <55c87867-8d1a-4bcf-92cc-f64a9960d1d8@suse.com>
Date: Mon, 8 Jan 2024 09:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240102095138.17933-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2024 10:51, Carlo Nonato wrote:
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -9,6 +9,7 @@
>   *    Carlo Nonato <carlo.nonato@minervasys.tech>
>   */
>  #include <xen/errno.h>
> +#include <xen/guest_access.h>
>  #include <xen/keyhandler.h>
>  #include <xen/llc-coloring.h>
>  #include <xen/param.h>
> @@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
>      return domain_check_colors(d);
>  }
>  
> +int domain_set_llc_colors_domctl(struct domain *d,
> +                                 const struct xen_domctl_set_llc_colors *config)
> +{
> +    if ( d->num_llc_colors )
> +        return -EEXIST;
> +
> +    if ( domain_alloc_colors(d, config->num_llc_colors) )
> +        return -ENOMEM;
> +
> +    if ( copy_from_guest(d->llc_colors, config->llc_colors,
> +                         config->num_llc_colors) )
> +        return -EFAULT;
> +
> +    return domain_check_colors(d);
> +}

What part of this is Arm-specific? I ask in particular because while you
place this in an Arm-specific source file, ...

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -8,6 +8,7 @@
>  
>  #include <xen/types.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/err.h>
>  #include <xen/mm.h>
>  #include <xen/sched.h>
> @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>                  __HYPERVISOR_domctl, "h", u_domctl);
>          break;
>  
> +    case XEN_DOMCTL_set_llc_colors:
> +        if ( !llc_coloring_enabled )
> +            break;
> +
> +        ret = domain_set_llc_colors_domctl(d, &op->u.set_llc_colors);
> +        if ( ret == -EEXIST )
> +            printk(XENLOG_ERR
> +                   "Can't set LLC colors on an already created domain\n");
> +        break;
> +
>      default:
>          ret = arch_do_domctl(op, d, u_domctl);
>          break;

... you don't handle the new domctl in Arm's arch_do_domctl().

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -21,7 +21,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017

There's no need for such a bump when ...

> @@ -1190,6 +1190,12 @@ struct xen_domctl_vmtrace_op {
>  typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>  
> +struct xen_domctl_set_llc_colors {
> +    /* IN LLC coloring parameters */
> +    unsigned int num_llc_colors;
> +    XEN_GUEST_HANDLE_64(uint) llc_colors;
> +};
> +
>  struct xen_domctl {
>      uint32_t cmd;
>  #define XEN_DOMCTL_createdomain                   1
> @@ -1277,6 +1283,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_vmtrace_op                    84
>  #define XEN_DOMCTL_get_paging_mempool_size       85
>  #define XEN_DOMCTL_set_paging_mempool_size       86
> +#define XEN_DOMCTL_set_llc_colors                87
>  #define XEN_DOMCTL_gdbsx_guestmemio            1000
>  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1339,6 +1346,7 @@ struct xen_domctl {
>          struct xen_domctl_vuart_op          vuart_op;
>          struct xen_domctl_vmtrace_op        vmtrace_op;
>          struct xen_domctl_paging_mempool    paging_mempool;
> +        struct xen_domctl_set_llc_colors    set_llc_colors;
>          uint8_t                             pad[128];
>      } u;
>  };

... all you do is add a new domctl.

As to the new struct - you'll want to use uint<N>_t there, not
unsigned int.

Jan

