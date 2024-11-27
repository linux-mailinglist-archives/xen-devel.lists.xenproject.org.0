Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8739DA5D6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844630.1260116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFLS-0007kP-Lg; Wed, 27 Nov 2024 10:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844630.1260116; Wed, 27 Nov 2024 10:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFLS-0007hI-IS; Wed, 27 Nov 2024 10:32:30 +0000
Received: by outflank-mailman (input) for mailman id 844630;
 Wed, 27 Nov 2024 10:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGFLQ-0007hC-Qr
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:32:28 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3f89ba3-acaa-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 11:32:24 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434a2033562so21721135e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 02:32:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7cdd64sm16505895e9.26.2024.11.27.02.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 02:32:23 -0800 (PST)
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
X-Inumbo-ID: e3f89ba3-acaa-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUzZjg5YmEzLWFjYWEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzAzNTQ0LjM0NzQzNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732703543; x=1733308343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBkBqar7unopO8folyoovjZByPW3iT0Wg/av+QUdAA4=;
        b=Vkh7RNqZW8MNIwMQ7gfZzAtkdSAbdyVNjmax5uoLB0IF838bF0zitqig+nwRfqk6VZ
         WA8ygsZO7/IUMb7ER5ZDo/8fxGpbCclTZT+fGcOJT8sqD2xYV4Pl5T/9CeNYxvksX+br
         oRWub1cOo7uv4jtJ+LZGDdgh9A0dO01cde27rU8YXB5d4k6ugioLnu0MgokpuX8joFG+
         8wiEL1avANRiR93uaLFlc5ltw7fx8BsD2p3gNIz1Vbq5bh8HKPOlevSqOoSOD9PTcsER
         dSnYAo2wMuP287b1wtOqC80MNj8ilL3dqVGQUf7ZtOuJ1SQmXGf2/m2c2lRe5hhVqoFH
         akzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703543; x=1733308343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBkBqar7unopO8folyoovjZByPW3iT0Wg/av+QUdAA4=;
        b=Zz2w13CrHPYUgwzXIusYXi4WPR7RV56QT1dBibgiPx1nZP164ZF2HkWj+d2zfYnqhn
         DaJIyIwfo34A/XedQjdA9Ey8Ah8FHMg3DNrMAmK+m+OEYa2p50xiiduEIBHrWBRCjWPw
         yX3TArGn/TdZRVxDoBW7d6N1aUdWKu8MA0gTFbl/CiHVdamhO1qyRT+8tgB3TEcm43tb
         9Rz+YUc0N7aEt24JXijB4dBp6yUZMDfty8brCecP7GBA6car/9FtAe0uQWCMiOOWzrt7
         13saT6q1skJS5XMXgMYLV2WN14eWwY577AeUSsx65CabW8pirzrE/8DFunDnsm3PFiSQ
         03/g==
X-Forwarded-Encrypted: i=1; AJvYcCWa3+WFTs9an1M6pLg3yVSr0zZe55b1STx71RODNM6GD6bjIL0ep/fco5+g2832CbGZ8jRdgATZaAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbM6ffQ3HjhlDXfHnPwNmOSIu9YsjyrQwcPFKsDw7cSSIREIhs
	L+6tM6Vnhhnu9iRjFHZH2wjKTccLVs6hjIZyzQDQ9x9DkH80ikKfDtXsnGG8Gg==
X-Gm-Gg: ASbGncura9u1BpBDN74ejI4aD2epuaY1NL6nYaxlqaMEYYup8lFwMvEhDTt2Vgm8QYm
	m5uKPgfk4vppT8vQbvBHUhXfRJwKcRYUGmxTddN2nqGw61Y1OPZxxA0NJS3gkqO9x718lWAtPwu
	sZ4YYKvIo7cb4b33EyMQShpDkztHyH8a4bl0IlwyiktfVJaSXI1eIbS6+R2JukU1tt9ReHHcm/e
	xDWTJy+x8Y2eLDuiqAE2SAG4QLdsBkhr3wsHgrdECTcMReJRjnEBPaRBgx3asdwtz/I+3OeinXW
	vglrOTH7+qfDaW/ysKr+lkD8Ptg1tSe6zlk=
X-Google-Smtp-Source: AGHT+IGT/DuguTEWwIOXFXA23x9ynToqtqp1XWDuB1iZF7zA3+YDZ4GMF0nhZWKfwZAQ7Wy6uU4JoA==
X-Received: by 2002:a05:600c:4f08:b0:434:a39b:5e46 with SMTP id 5b1f17b1804b1-434a9dbbba1mr20577305e9.7.1732703543596;
        Wed, 27 Nov 2024 02:32:23 -0800 (PST)
Message-ID: <bfbd15eb-9888-4988-b9a1-8191a696a4c2@suse.com>
Date: Wed, 27 Nov 2024 11:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] x86/boot: introduce domid field to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-6-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241115131204.32135-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 14:12, Daniel P. Smith wrote:
> Add a domid field to struct boot_domain to hold the assigned domain id for the
> domain. During initialization, ensure all instances of struct boot_domain have
> the invalid domid to ensure that the domid must be set either by convention or
> configuration.

I'm missing the "why" part here - after all ...

> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -12,6 +12,8 @@ struct boot_module;
>  struct domain;
>  
>  struct boot_domain {
> +    domid_t domid;
> +
>      struct boot_module *kernel;
>      struct boot_module *ramdisk;
>  

... just out of context here there is struct domain *. I can only guess that
the domain ID is needed for the time until the domain pointer was actually
filled.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -339,6 +339,9 @@ static struct boot_info *__init multiboot_fill_boot_info(
>      /* Variable 'i' should be one entry past the last module. */
>      bi->mods[i].type = BOOTMOD_XEN;
>  
> +    for ( i = 0; i < MAX_NR_BOOTDOMS; i++ )
> +        bi->domains[i].domid = DOMID_INVALID;

Generally I think ARRAY_SIZE() is better to use for loop boundaries. Yet
then - why don't you statically initialize the array in xen_boot_info?

> @@ -977,7 +980,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      };
>      struct boot_domain *bd = &bi->domains[0];
>      struct domain *d;
> -    domid_t domid;
>  
>      if ( opt_dom0_pvh )
>      {
> @@ -993,15 +995,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
>      /* Create initial domain.  Not d0 for pvshim. */
> -    domid = get_initial_domain_id();
> -    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
> +    bd->domid = get_initial_domain_id();
> +    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>      if ( IS_ERR(d) )
> -        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
> +        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));

As to the comment at the top - this change alone certainly doesn't clarify
the "why".

>      init_dom0_cpuid_policy(d);
>  
>      if ( alloc_dom0_vcpu0(d) == NULL )
> -        panic("Error creating d%uv0\n", domid);
> +        panic("Error creating d%uv0\n", bd->domid);

Imo this would better use d->domain_id. And while touching it, %u would also
want swapping for %d.

Jan

