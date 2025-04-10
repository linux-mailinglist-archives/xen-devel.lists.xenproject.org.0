Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B608A841CD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945309.1343523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qAi-0000gT-Bu; Thu, 10 Apr 2025 11:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945309.1343523; Thu, 10 Apr 2025 11:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qAi-0000du-8n; Thu, 10 Apr 2025 11:34:16 +0000
Received: by outflank-mailman (input) for mailman id 945309;
 Thu, 10 Apr 2025 11:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qAh-0000do-68
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:34:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba82cf6b-15ff-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 13:34:14 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso342819f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:34:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0cfdsm4532477f8f.76.2025.04.10.04.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 04:34:13 -0700 (PDT)
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
X-Inumbo-ID: ba82cf6b-15ff-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744284853; x=1744889653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8mtSKzI1eVCkaJ8jsv6S3EYIIKgVlqbJ4upesSKU8bo=;
        b=KIx/lcRhazWGFdfwIMREw4SuHUFbiBYaDUORRZ+OKVLvrmrW2LHuK4CQ3VK/RZB+7L
         kpZXMe+T8fxCxw46u54+xcj+JWrgwCX1tpN9sIM1EuiypFED1b+kpW/qRwURs3eSJF+0
         Uwp/DwGbh1vl7r5T5HwdQizX154OG/U88WCL4M1NXxvMARyfOC5Ks3HOOYw+nvkzHNkn
         GKA/GgfxJZVTp+aD3U4RGEaTO7fl2Jky9HzxG4QObs4CFUHMnslL3OCIjJOAA0PLyBBi
         wLVlUy5SxdosGUEdyfHYVZGAlUSQicJOzhXPsoziPVniZdaDPAf0Pwor00qW1YQp8Uej
         U6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284853; x=1744889653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mtSKzI1eVCkaJ8jsv6S3EYIIKgVlqbJ4upesSKU8bo=;
        b=Y2BvlqVCgd0gnHMOgwPgJbS9b71h+7qvDAUKt1JYJ7WWZWoqkvA3cI+IcpgEECWOsT
         ZBSY1T+BkKcHSMd8XhfUoU9jE7VvKLEbN3fGEesJ9n8vvvR5bfKD6/Q6ZXqvT73Fy/j9
         j2KouHzdloCuBbb+D5j86YxCc3FIRIqFkSuqq6omEID1PrvF7V8pS2hA7XfaBSSzfbIk
         plnyLuzahMcDdDOnpwu05ps980Tfi7MxXHBmfTQHJviNa9JuKknokpX4eCcwWPMxIwds
         wsJ4xLWsVt4wdAfR+AUd3XFHrGSE8KQ6H7q7LLpP71iAvb274qRT89FkXQm/2XAr4B4x
         51Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXTIpxaZJblD6AJu/1ZQEz2tAU6GgL2+gbacwxZkdyoNxIC5nVwsRhB4yDsZKIHxnb41vdhwAUkz2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoPbA8QehhP017L8eimwMcPIgmiZzHrywxVYRoibC7IN2TLrLO
	milztxST7K4sN6x+Rqr5tk1miQ27Ok0uqE5PE7bk5G44IHADMVf6PtoU/SlHoQ==
X-Gm-Gg: ASbGncua/eilbXIWKnbVzJofNhW7uI7VjROrfy+l6p0INF+QfzWy/uTxDzLHxf/2ZE+
	QQoHi/XvLBLwVu62iDrlsrSoWhp7MgZodnjDYm/FlIgiGN5/ucRMgdoYHwB7qbJRu/A2fw9hof5
	qVsFOCpH2AlioKm8tnG+g3tlaN9cB1nXFQuwMBGc8Hy6RfNNpd9xn0Wb4ZK2Sdbkq7M66DpcXRs
	WquBunf0h2z6ftV+HPZkd45TPouc5wG2Dd69Ap8B+eLHmUZZFZJmD0CrXdoetNygbfgS7W4wuxW
	eSM7pDL2Oj7RYq+x78jUhMJX9Z1E6HISBCUpt8IPAkLmvQ66udS2j9no3guL6npJjY99OYpQAfv
	/oCU7AmrRWoDtfQ77sjilJSkyohJNholU5Xbo
X-Google-Smtp-Source: AGHT+IELhU0OHZY2Qu9h0BPjpv8J779mQ9CAtKrupUKs/uzWJ6XqSwJWR0+id5BLNZHY87qKQbEbuw==
X-Received: by 2002:a5d:598d:0:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-39d8f22a482mr1897398f8f.0.1744284853429;
        Thu, 10 Apr 2025 04:34:13 -0700 (PDT)
Message-ID: <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
Date: Thu, 10 Apr 2025 13:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-12-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -195,6 +195,35 @@ static int __init process_domain_node(
>                   !((char *)__va(bd->kernel->cmdline_pa))[0] )
>                  bd->kernel->fdt_cmdline = fdt_get_prop_offset(
>                      fdt, node, "bootargs", &bd->kernel->cmdline_pa);
> +
> +            continue;

With this ...

> +        }
> +        else if ( fdt_node_check_compatible(fdt, node,

... no need for "else" here?

> +                                            "multiboot,ramdisk") == 0 )
> +        {
> +            int idx;
> +
> +            if ( bd->module )
> +            {
> +                printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",

Stray ')' in the string literal.

> +                       name);
> +                continue;
> +            }
> +
> +            idx = fdt_read_multiboot_module(fdt, node, address_cells,
> +                                            size_cells,bi);
> +            if ( idx < 0 )
> +            {
> +                printk("  failed processing ramdisk module for domain %s\n",
> +                       name);
> +                return -EINVAL;
> +            }

Along the lines of what Denis has said - please be consistent about log
messages: XENLOG_* or not, preferably no capital at the start, initial
blank padding. May apply elsewhere in the series as well.

> +            printk("  ramdisk: boot module %d\n", idx);
> +            bi->mods[idx].type = BOOTMOD_RAMDISK;
> +            bd->module = &bi->mods[idx];

The field's named "module" now, but that now ends up inconsistent with
naming used elsewhere, as is pretty noticeable here.

> +            continue;

This isn't strictly needed, is it, ...

>          }
>      }

... considering we're at the bottom of the loop?

Jan

