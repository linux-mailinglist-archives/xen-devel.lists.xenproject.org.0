Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80349E020F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 13:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846681.1261833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5Sd-0006SJ-3v; Mon, 02 Dec 2024 12:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846681.1261833; Mon, 02 Dec 2024 12:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5Sd-0006Pw-0M; Mon, 02 Dec 2024 12:23:31 +0000
Received: by outflank-mailman (input) for mailman id 846681;
 Mon, 02 Dec 2024 12:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI5Sb-0006Pj-Om
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 12:23:29 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a35391b-b0a8-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 13:23:25 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385e2880606so2447707f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 04:23:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7d264dsm181325935e9.33.2024.12.02.04.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 04:23:24 -0800 (PST)
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
X-Inumbo-ID: 3a35391b-b0a8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzIiLCJoZWxvIjoibWFpbC13cjEteDQzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNhMzUzOTFiLWIwYTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTQyMjA1LjEzMzEwNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733142204; x=1733747004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UaZ+LuVNqAp3iogsGJTgclrSlHqSYqAZXBa2nsIVt+Q=;
        b=QnRRHbutJJJdoX0VE0YlOvw6jsSQXQ5QmlFKWJK9OtvQQAI/G88V20OrH0rcwZ8lov
         u2tEn0ImEjlKiJ3rcCrjv+yMAc/85MX1L8lSa7/w7HG2A170golhrsigMRPmQWRTnvPo
         jqQZ6lJ2iWzSBe7LEVkioIDwbMGOg6pCnCs9035u+5T6B/Q57e9BTNrLU/qe1K1iu6J3
         cl/OGroCLAsurrkQOlRRgGA44FmxEpbgC+2FsL26cI/oY0OChZFjorXlSjlmZUciap8h
         FPYEx6gCU5+NNgpVC0ZEINaX0KRkdS+xxNPs86j/UTwmdK/C6xCTvwPhHlAYhP+ZF+dO
         KoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733142204; x=1733747004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaZ+LuVNqAp3iogsGJTgclrSlHqSYqAZXBa2nsIVt+Q=;
        b=rzxTEbRriseJdajdbRb316uyh0UXCLJcJeNIS48Jnk9gf88QuOB3dwxFKDvW8J3M0x
         VEHao6EdItvmKCzRgQzhPXED7Z8F4yhJGAp687XB0y5+SxjW+l7jEvziq0UgWlyo5RiI
         jBqBTSMPzVvYIaDEyseSjeZU0jIktjLh80KfhQdzGUFlgrRDZMxw+Na9TwykyTsmQQlF
         Jk5+VlauLr83w9/3/5ZmsqI2WuZxT1lESPv7igZslz0l3AiFKjdWo8f6N7gmnRqkEd3G
         TH4FHrv3mbPa6mzM4ndhy3f/AiLb1wd5LTDIxyvHqttw4zLUzNjTEnjlOcjzjUkCz7H+
         ULXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzOL4c2BNAYVO4bCdq72FcxG9ANr7abORDHJnMr0U2E9VYAX/n/BZb5d3soiRfXIoFSJZTgMQC+D0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yws8c4tiBxcG2fXOpYA3NiDstzvFn9GY3nQOAlsIWo/vAOC9iJo
	Nhc5Gu7a5cCt69cam2SGnGX12QEnBZN+ULkGpXCLwAJEn9arSXF3sEroKNpbDQ==
X-Gm-Gg: ASbGncsgOpi087gpJhe2kDoW+JEQInIbsg4kYv2Gvr2vsBx4+B3Cpgq8WHAMKXh/amz
	VY0yT7voXMM0erJlh4b3OZAdahHZjJWH449snYoKEcGWWHGoOZ6I8YrnwEQT4FpxENQiow3qWyC
	oCp0CHBNqRSINhkB4/2F9LzA/620tZcoIzZRoofT7ZvAMSe2xCwid5PTL8/sjIKp5pHGlpT8YrE
	Fm3UXMIRtK7PB6GnQSDjfF+roHzD518+2ZaeuUqoWmez+K1beE5sIU3mGNCUCX1wovn2nvoVk0/
	C/USmGrUxhM1/0HOYZE+twzvTIeMKQ40VwI=
X-Google-Smtp-Source: AGHT+IHrWLTZDpGGOxOpjfv7ZzbWQvUDo5LstWAMdyx95iabh5Lh0p8Ntv8iE0jZaePAtv0+EHJCoQ==
X-Received: by 2002:a05:6000:1f8b:b0:385:e176:43e8 with SMTP id ffacd0b85a97d-385e17644c1mr13151066f8f.33.1733142204385;
        Mon, 02 Dec 2024 04:23:24 -0800 (PST)
Message-ID: <84bc7854-7935-4f36-b574-d19dde775673@suse.com>
Date: Mon, 2 Dec 2024 13:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] x86/hyperlaunch: add capabilities to boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-16-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-16-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -209,6 +209,19 @@ static int __init process_domain_node(
>              bd->max_vcpus = val;
>              printk("  max vcpus: %d\n", bd->max_vcpus);
>          }
> +        if ( match_fdt_property(fdt, prop, "capabilities" ) )
> +        {
> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
> +            {
> +                printk("  failed processing domain id for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }
> +            printk("  caps: ");
> +            if ( bd->capabilities & BUILD_CAPS_CONTROL )
> +                printk("c");
> +            printk("\n");
> +        }

What if any of the other bits is set?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -992,6 +992,7 @@ static size_t __init domain_cmdline_size(
>  static struct domain *__init create_dom0(struct boot_info *bi)
>  {
>      char *cmdline = NULL;
> +    int create_flags = 0;

Once again unsigned int please.

> @@ -1023,7 +1024,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      /* Create initial domain.  Not d0 for pvshim. */
>      if ( bd->domid == DOMID_INVALID )
>          bd->domid = get_initial_domain_id();
> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
> +            create_flags |= CDF_privileged;

Nit: Indentation.

Jan

