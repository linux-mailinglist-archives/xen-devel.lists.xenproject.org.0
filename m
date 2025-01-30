Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D870FA23252
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 17:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879702.1289919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXpB-0001cj-VM; Thu, 30 Jan 2025 16:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879702.1289919; Thu, 30 Jan 2025 16:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXpB-0001bH-Rj; Thu, 30 Jan 2025 16:55:29 +0000
Received: by outflank-mailman (input) for mailman id 879702;
 Thu, 30 Jan 2025 16:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdXpA-0001bB-CB
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 16:55:28 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 016ae8df-df2b-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 17:55:27 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so1487997a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 08:55:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a31f86sm149876566b.145.2025.01.30.08.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 08:55:26 -0800 (PST)
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
X-Inumbo-ID: 016ae8df-df2b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738256127; x=1738860927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UL6m9jSOYiRqbqeYE4HaooWlMMzqsQ2C4luuKoEqRTg=;
        b=XXJObWqcQyHOZpRzTewsEz/Yg++sKLd0bi8K6lBp109pgj66pPZnqWyS2MuLOzBmxq
         3pDlqV8zteSACDa0cnYQtUSOCV66knbNV59r+iIwhE/Qzgkzixz6UAylIxTq4zu9AOeJ
         sF/IvMfpFei/xmSmELF4YqxRwvBFPSb73eG+9EMMXaEoWa1pATMxp+NNzvBfuPQW70cl
         91GmhCFkR+V6PQz3USKKX+KX8PIAyd4ESmeMq0dP98RVxe2EyQ9+akWsjvRJaDdTGR7K
         IMLUAVqH13y49Lz8mxWIKqIUwrldz8UzXN1tAM9b9dX0jPc7bcvzUwdw6MbGdcBirbDv
         u8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738256127; x=1738860927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL6m9jSOYiRqbqeYE4HaooWlMMzqsQ2C4luuKoEqRTg=;
        b=ZRdP+/CZJssxtzjHsTAQS9eA0xbgq+44VqfgO8ltOvyTVBGSMHGcb460kP0z3ZiN3+
         5qeKGgoC3qo3nmi3vnpkVkkcnDqKsBX6JJsO+DiJNtmDyazbdRzdgdLdmGypBcb1gXz6
         4c4Vn7arLF19+HTI/CAM+gPQuEqWt/Z140HgRpjUDuZIjkUwi6TF6N9CMswg/jDPCNBS
         EG+OYkl/XJaMdjqHdlHPLrpzVAJ/I+wO8IGX/30zdvjpceCHpNl00Xahbr/JK5nzNjpD
         61US0VM+rfyqHL2AudndOpK+QnEJ0aUgasFZB0tY/uD7vnT7GLBqh/dFCu2aPp3GLn62
         sgSg==
X-Forwarded-Encrypted: i=1; AJvYcCVGRchJuSfW9V/OrXrUoRLJeS7xG5+SaHB79OuIJrks9fQJ6EI+tAa0wckucBmY23YvrOAvPVPMshc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydems7fg1opqVEZn1BuL5kRYiQcoERrbDFX3H9niHbhXYb/qX4
	cfhx3I1YZMIXYpG28I2cl5NxxMjBeIJ3MEg/o2Qlm7x8o84hlsenMOjCpnXxZQ==
X-Gm-Gg: ASbGnctODDSwLebbokK/glP+X2Akh1bUE+xB/qZ1kcgs1VItIyv4J6cnOvOFU+RfsJ2
	yoSZGLMsG8i8ukXvm4xNrRm9rxmbJK7wr3Am74HdgNtOYsH9wYbWoS2qqpkokmUU6O27EaTjs/r
	yg/NSviWyycL1k9cJT7S2eD8Ex9A7RQZc+yfBCfZO6rqaMJ6Ml6CSDUk/sn831zifTmA1iPQmhu
	hDwrSCz3Kna+C2TpWN3ss/M9j5kudu7v6ZLKsGaVBHYbOseOoBGJQk3zLe2vWlpGjMEjD6glXGm
	DO9JD07D4wfqrk2ZzlqUSMNcB7blNxpACwOUrFSo9FHYT+HPROrTd0F+ejtyZgJBkWDEMVM7+aE
	F
X-Google-Smtp-Source: AGHT+IEgaT4ArUWMiuHdtsbLSX0cyvXhQ5kJIO27/SNuGu0IFB4hRQGWSSHONx2PFzWE6k62kWE+6Q==
X-Received: by 2002:a17:906:794f:b0:ab3:3eea:1ccc with SMTP id a640c23a62f3a-ab6cfd07ca4mr766463966b.27.1738256126790;
        Thu, 30 Jan 2025 08:55:26 -0800 (PST)
Message-ID: <0aadddb9-ee7f-41b5-b271-4716d66330f8@suse.com>
Date: Thu, 30 Jan 2025 17:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] x86/hyperlaunch: specify dom0 mode with device
 tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-13-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Enable selecting the mode in which the domain will be built and ran. This
> includes:
> 
> - whether it will be either a 32/64 bit domain

I can't spot anything like this in the code changes.

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -94,6 +94,25 @@ static int __init process_domain_node(
>              bd->domid = (domid_t)val;
>              printk("  domid: %d\n", bd->domid);
>          }
> +        else if ( strncmp(prop_name, "mode", name_len) == 0 )
> +        {
> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
> +            {
> +                printk("  failed processing mode for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +
> +            printk("  mode: ");
> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
> +            {
> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
> +                    printk("HVM\n");
> +                else
> +                    printk("PVH\n");
> +            }
> +            else
> +                printk("PV\n");

Shorter and less indentation as

            if ( bd->mode & BUILD_MODE_PARAVIRT )
                printk("PV\n");
            else if ( bd->mode & BUILD_MODE_ENABLE_DM )
                printk("HVM\n");
            else
                printk("PVH\n");

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1016,7 +1016,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      struct boot_domain *bd = &bi->domains[0];
>      struct domain *d;
>  
> -    if ( opt_dom0_pvh )
> +    if ( opt_dom0_pvh ||
> +         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )

And then dropping BUILD_MODE_ENABLE_DM on the floor?

Also shouldn't this be

    if ( bi->hyperlaunch_enabled
         ? bd->mode & BUILD_MODE_PARAVIRT
         : opt_dom0_pvh )

as it can't do any good to honor a conflicting command line option.
Command line doc then will want amending to clarify that the option
will be ignored in certain cases.

Jan

