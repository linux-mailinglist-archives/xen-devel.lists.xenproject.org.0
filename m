Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D2B14A96
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 11:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062289.1427947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggC5-000285-7a; Tue, 29 Jul 2025 09:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062289.1427947; Tue, 29 Jul 2025 09:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggC5-00025q-4Y; Tue, 29 Jul 2025 09:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1062289;
 Tue, 29 Jul 2025 09:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uggC4-00025j-3Y
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 09:00:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7356c519-6c5a-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 11:00:18 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b782cca9a0so1831665f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 02:00:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fe9b67485sm59279235ad.47.2025.07.29.02.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 02:00:17 -0700 (PDT)
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
X-Inumbo-ID: 7356c519-6c5a-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753779618; x=1754384418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OL15pQhNMrtMlVmuQ4Ufj0iOHkoPPIE+QCSwH2PgeVs=;
        b=UtiFfgUiC2lKmOpXC0XISqCaC7Hr4c2sistjoCO3w+n2/HO6kyvtPbLUuLrbQUt+dJ
         PN1Fc3KzlRPlygpWstSx/k2aCSjilOUir3wgvGZsB4tE0wJDnAV+8LAB9fUFse0Wykkf
         Dy3X8RMxDCmpqDXjdYXPd6uH6z2Q1D4bp1gynJKRmmRJEdcxJHHjcQt6PSae5CmiILQ2
         pqdtzLl7UP0SxTb3qAxth04yJh2Oh9klR7nH4fibqbq5su5rp+fx8VlFMfGYiKQ9oBWs
         pNTK4Qpy88K8RJXUSk3hhulsO6JJWDpqb0JfvntkiKxd8eEt7gFfzaK8R+k0UOK6f3bf
         XcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779618; x=1754384418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL15pQhNMrtMlVmuQ4Ufj0iOHkoPPIE+QCSwH2PgeVs=;
        b=ocUjX7qVA7hF5Hxg6jdcpB4P4czdygXtX3nrFcWwpWm+ExoMKjJLj3L//StWTGEDT+
         0wNp8bmtsyhtF/EpIFvlzoOSHdxOmIBajDq5R8z9QzmwDopo5lr3w7haErLwrIS3T+8u
         IgUDGjarZ/iOqr+PlPka7FPMPs24FC2hMViKcCYIUwjualXSkvecYWxuK3U47gFASpYv
         LTK86N3zb8MKkE2YWw5wCayuFnfJZjeBy4Uc8kijEXgJhfUgJpeuxjsCYfdUDBURai5X
         o9Fd1pqDgjnEa51L6ebMARDmhIvRkXdcCzf94pFUsio8Nhcn2VQvsgMpun5IrT54PVFz
         99IA==
X-Forwarded-Encrypted: i=1; AJvYcCUhLH/Uy8U4DLniC3fbvL2SfhjvTOGOf9Ctd/rlLcSFrBox3uSqnYCw9GA2aQPxCIWaQclKdowtqEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqygSjQc11XeSUbJkIpcixgRRIOqEkSUkG35avW6sL/jmtPeJV
	8SH1xR9hoP8dlh7weXGchWvQbcGR039UlnME5823sGt/MQiy8EkPK1kze8DYcBlVbw==
X-Gm-Gg: ASbGncsY9cRcKVs3vN8ivPV97KFd3dMgEj4fDiNpTi6JinO/6iUZaeftSurBAKzHVKD
	ReIfrC15P/1zXGRGhZt11KeVKsglDLdACyGlkqQAtB/agC3izZnGM/jUqsOaZF0TgzQZvKAuX00
	mYhZAJjmLUaF+AYWezyYwiGZIB12u0WKVEV3561oFNEao4dFUu79CVHentza18hUury2tH4jErY
	11hWMBQi+sV3vhwRnWu7RT86LUg/4hJErKsC+oNQ7efIFQUreMZFAfKDd9Jka0zd5eq8x+DAiW5
	b7Buec3hp47JnadZ+bMJ8+XjrYrvODIjxY1DdAp07M0HZOVSLmxvPtP6AMJF+S4owgpNHdWU3JH
	/b9MPbeQVI48fweiRQVGSe8MsbEPpjEgiPUXYAMAdZtFnJqcdh7+H7X+YfKzWU/t3xhmID13NRH
	11aCXqNRA=
X-Google-Smtp-Source: AGHT+IFoq3od2tK7d9E3HRhaJWm/KnW+VXxS1Fz+D2PAzZ15IYjdap8eENWUYN/QpX9zulixoylN1Q==
X-Received: by 2002:a05:6000:2908:b0:3b7:8c83:db19 with SMTP id ffacd0b85a97d-3b78c83e062mr2860435f8f.57.1753779618206;
        Tue, 29 Jul 2025 02:00:18 -0700 (PDT)
Message-ID: <0b6b3a4a-03df-4bc9-996d-ba2efb3f5b73@suse.com>
Date: Tue, 29 Jul 2025 11:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 2/2] x86: don't use a memory page for mapping
 the shared info page
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250729083829.11038-1-jgross@suse.com>
 <20250729083829.11038-3-jgross@suse.com>
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
In-Reply-To: <20250729083829.11038-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 10:38, Juergen Gross wrote:
> --- a/arch/x86/x86_64.S
> +++ b/arch/x86/x86_64.S
> @@ -33,13 +33,8 @@ _start:
>  stack_start:
>          .quad stack+(2*__STACK_SIZE)
>  
> -.globl shared_info, hypercall_page
> -        /* Unpleasant -- the PTE that maps this page is actually overwritten */
> -        /* to map the real shared-info page! :-)                             */
>          .align __PAGE_SIZE
> -shared_info:
> -        .fill __PAGE_SIZE,1,0
> -
> +.globl hypercall_page

While touching this line, may I suggest to indent this directive to match all
other directives in context? Even if assemblers accept them for most targets,
directives starting in the first column strictly speaking are misplaced.

> --- a/hypervisor.c
> +++ b/hypervisor.c
> @@ -27,8 +27,10 @@
>  
>  #include <mini-os/os.h>
>  #include <mini-os/lib.h>
> +#include <mini-os/e820.h>
>  #include <mini-os/hypervisor.h>
>  #include <mini-os/events.h>
> +#include <mini-os/mm.h>
>  #include <xen/memory.h>
>  
>  EXPORT_SYMBOL(hypercall_page);
> @@ -37,7 +39,8 @@ EXPORT_SYMBOL(hypercall_page);
>      ((sh)->evtchn_pending[idx] & ~(sh)->evtchn_mask[idx])
>  
>  #ifndef CONFIG_PARAVIRT
> -extern shared_info_t shared_info;
> +static unsigned long shinfo_pfn;
> +static unsigned long shinfo_va;
>  
>  int hvm_get_parameter(int idx, uint64_t *value)
>  {
> @@ -69,24 +72,31 @@ shared_info_t *map_shared_info(void)
>  {
>      struct xen_add_to_physmap xatp;
>  
> +    shinfo_pfn = e820_get_reserved_pfns(1);
>      xatp.domid = DOMID_SELF;
>      xatp.idx = 0;
>      xatp.space = XENMAPSPACE_shared_info;
> -    xatp.gpfn = virt_to_pfn(&shared_info);
> +    xatp.gpfn = shinfo_pfn;
>      if ( HYPERVISOR_memory_op(XENMEM_add_to_physmap, &xatp) != 0 )
>          BUG();
> +    if ( !shinfo_va )
> +        shinfo_va = alloc_virt_kernel(1);
> +    if ( !shinfo_va || map_frame_rw(shinfo_va, shinfo_pfn) )
> +        BUG();

Now there's a new asymmetry: Here you check whether alloc_virt_kernel()
(appears to have) failed, whereas in the PV variant you don't. And it's
really only "appears to", as the function won't return 0 in the failure
case, afaics. I therefore think that extra condition simply wants
dropping here. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

As for the other patch, happy to make both adjustments while committing.
As long as you agree, of course.

Jan

