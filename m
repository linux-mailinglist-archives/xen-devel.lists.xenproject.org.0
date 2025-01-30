Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F5A23213
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 17:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879683.1289899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXa5-0006ht-L8; Thu, 30 Jan 2025 16:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879683.1289899; Thu, 30 Jan 2025 16:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXa5-0006fe-Hk; Thu, 30 Jan 2025 16:39:53 +0000
Received: by outflank-mailman (input) for mailman id 879683;
 Thu, 30 Jan 2025 16:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdXa4-0006fX-Ke
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 16:39:52 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ee3edc-df28-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 17:39:50 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28a4fccso1435376a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 08:39:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724a9ed8sm1281791a12.61.2025.01.30.08.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 08:39:49 -0800 (PST)
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
X-Inumbo-ID: d2ee3edc-df28-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738255190; x=1738859990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LfVdGnCKooI0r7ZU/Sgs4X0u3U37H50hq3ZAceHbRug=;
        b=MkhefnmCLMzirWTVhqZ9lBeW0pIgo7m7OpQgao2ih8ZLvOhm7otlvq/S5q31QAW8gw
         G5UWD7wwxOe+qHyY8H7NnufAFdyjJ0LhyZYMQtLFD4CuLDUzEftLFxAJU9JNLg4Yg9I3
         N4PMfbKWztvzuu+Tk161cdKuI1VboEIMHKYM4lF5ZhYKxJt+AQeLQz94eWXcYEYkFs9y
         HgPUMAZGGo/6sZFxHpDhE6R7Vjp+rP3GA17AImXZPvTH6kEcMAOtwwycRSWCmgq5mGbX
         8HIt0077Rfl47iMO8JMG/0Z/7ZQRIZkSeLzBsrA5C+I+3P6mf4506u/ymC+XjqKtyrCc
         eXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255190; x=1738859990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfVdGnCKooI0r7ZU/Sgs4X0u3U37H50hq3ZAceHbRug=;
        b=M12KZAwp1L+o0vc994jQy5rtWQHR83d6kiSmFeyyTHi0lfMcNbcKocosMee083NIGO
         ZpPEgVJ4gQWOLCca4y/+iYOJac6CeFzBihANC7ZPbAdD4LgKXwyH71hAfOhqKH8EZNJ3
         9zwheNZPoJTI/0FsgyHRrxsV3jeyX2BVqIs1rzRxOYRNfjKPxhDRpSwDeTaRQkCiWtXr
         ulCUQ9D4WfM7T40J72oRA4JNtA/hlN2Hc3a4lPBbUnkfwrl0Q46vAioMDDeWKmGNnCkh
         oY6djHAE8hmAAB57PiWOyR5+/dd6jIhRRD7bBQ/PS84AHIIhjWaDqbh/YW4xe5soYSXY
         bJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCVFXUxcCI0LgZbUpMQQKGhGP8jij+jJlyCkrndHOmm70QWqOWVPRvTm0BPcqO/hJeRMZiNP28fBoNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFjbtoi+3jeBvVkDDPAPlN0/VJeKh8k5hAuqrFf05DgMY3kwFk
	cuJf3BkmMckaq110NiG/xB8clbFkFgxhWF9gtacB6ArOh5i10FVwp6L3vkCdrg==
X-Gm-Gg: ASbGnctvxQkryXEs6Y6AJJ84hCYWGEfqThBzpbAjkFFsgwhDnc5uBiBTBwymmnR7jnn
	xDHJarxTZKoI4Mh68S8JpDr5kzT9QeayzQC3gO2N+Dgu15rFBmcO3qys5hfcFi8QZIIzEyD8kk5
	JUfwJYeWomWbE6OFsSO9Qv7ACtlvmpRv1N90940TZP+3/anMT68eSd/msza+u1Z+/LdeeoEWkez
	sonNA7/cRvWkuBbISxVqLi2VRoXRyGmdGc9ztqaLgkMS6S4MRSP+zgdoygI+iEJ/FAeXwcriXzy
	/q/KysRUSJSEZeY21wglTFgN8qknPFxc51GvjR89qYLg1N29RmHnhvJlKqdZ67+6QltAlXXyhzC
	l
X-Google-Smtp-Source: AGHT+IEhHJnNgw3Kfo6p3KPXsn4zgmoil0ZrwEVPcYHdF0Y+P37d13EaPnt0nZqrum//feCdB7zOHg==
X-Received: by 2002:a05:6402:354a:b0:5d9:8877:895a with SMTP id 4fb4d7f45d1cf-5dc5efc7608mr7790671a12.17.1738255189771;
        Thu, 30 Jan 2025 08:39:49 -0800 (PST)
Message-ID: <0e36634f-3854-4e64-8514-5c7bdc78c43c@suse.com>
Date: Thu, 30 Jan 2025 17:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-11-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Look for a subnode of type `multiboot,ramdisk` within a domain node. If
> found, process the reg property for the MB1 module index.

Unlike for cmdline it doesn't look to be mix-and-match here.

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -119,6 +119,32 @@ static int __init process_domain_node(
>                  if ( ret > 0 )
>                      bd->kernel->fdt_cmdline = true;
>              }
> +
> +            continue;
> +        }
> +        else if (
> +            fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )

I'm sorry, but this isn't style we use. Perhaps

        else if ( fdt_node_check_compatible(
                      fdt, node, "multiboot,ramdisk") == 0 )

if you dislike

        else if ( fdt_node_check_compatible(fdt, node,
                                            "multiboot,ramdisk") == 0 )

> +        {
> +            int idx = dom0less_module_node(fdt, node, size_size, address_size);
> +            if ( idx < 0 )

Nit: Blank line between declaration(s) and statement(s) please. (Again
at least once elsewhere in this patch.)

> +            {
> +                printk("  failed processing ramdisk module for domain %s\n",
> +                       name);
> +                return -EINVAL;
> +            }
> +
> +            if ( idx > bi->nr_modules )
> +            {
> +                printk("  invalid ramdisk module index for domain node (%d)\n",
> +                       bi->nr_domains);
> +                return -EINVAL;
> +            }

See comments on similar printk()s in an earlier patch.

> @@ -2141,22 +2141,25 @@ void asmlinkage __init noreturn __start_xen(void)
>             cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
>             cpu_has_nx ? "" : "not ");
>  
> -    /*
> -     * At this point all capabilities that consume boot modules should have
> -     * claimed their boot modules. Find the first unclaimed boot module and
> -     * claim it as the initrd ramdisk. Do a second search to see if there are
> -     * any remaining unclaimed boot modules, and report them as unusued initrd
> -     * candidates.
> -     */
> -    initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> -    if ( initrdidx < MAX_NR_BOOTMODS )
> +    if ( !bi->hyperlaunch_enabled )

Can't this be "if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )"
and then all of the churn here can be avoided? An unnecessary call to
first_boot_module_index() is unlikely to be the end of the world. Otherwise ...

>      {
> -        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
> -        bi->domains[0].ramdisk = &bi->mods[initrdidx];
> -        if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
> -            printk(XENLOG_WARNING
> -                   "Multiple initrd candidates, picking module #%u\n",
> -                   initrdidx);
> +        /*
> +         * At this point all capabilities that consume boot modules should have
> +         * claimed their boot modules. Find the first unclaimed boot module and
> +         * claim it as the initrd ramdisk. Do a second search to see if there are
> +         * any remaining unclaimed boot modules, and report them as unusued initrd
> +         * candidates.
> +         */
> +        unsigned int initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +        if ( initrdidx < MAX_NR_BOOTMODS )
> +        {
> +            bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
> +            bi->domains[0].ramdisk = &bi->mods[initrdidx];
> +            if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
> +                printk(XENLOG_WARNING
> +                       "Multiple initrd candidates, picking module #%u\n",
> +                       initrdidx);
> +        }

... please pay attention to line length when re-indenting. (If you still need
to re-indent, perhaps also s/unusued/unused/ in the comment, while you touch
it.)

Jan

