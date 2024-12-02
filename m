Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8799E01D0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 13:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846662.1261813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5KH-0003vZ-46; Mon, 02 Dec 2024 12:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846662.1261813; Mon, 02 Dec 2024 12:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5KH-0003sy-1E; Mon, 02 Dec 2024 12:14:53 +0000
Received: by outflank-mailman (input) for mailman id 846662;
 Mon, 02 Dec 2024 12:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI5KF-0003ss-Jj
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 12:14:51 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06615874-b0a7-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 13:14:48 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ffbea0acc2so43736031fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 04:14:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996de56dsm504185666b.79.2024.12.02.04.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 04:14:47 -0800 (PST)
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
X-Inumbo-ID: 06615874-b0a7-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA2NjE1ODc0LWIwYTctMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTQxNjg4LjU2NTc4MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733141688; x=1733746488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TYRdDXV7qCaW6xzUCDhQhNzZqubZov0EV3e88I7YnC8=;
        b=DHA5or1Rk0iRhifljw1/mJx8IDO/WPiiH98zi0wA6ybEjDo3xM6c0dy8iP7qBmQgoX
         OtZzG5gsoV1OpSNYh0jQBYHY8oZAJbjHVd5ActEd3279/AkVIWOfusEk4pLqFtNBM/Vl
         ClUriak4OTZMqPzOM4vBBEcMWy2lT3pr2xc5dWAKWxrT7AgGM1V9o/1b1J1x4Ukkm1+R
         0f79laerY2Pci2VwpJXIqftCSd69cS6aMI2FeVIo7NRl6iPhiWsazW5wp06RMnxn6z9H
         hHACiWu8IbOUzj5ikEZALmFZ1rADgaQJzM0xxf1enOZ8qdsQvwGf1DmYL4uPNft89jrb
         9LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141688; x=1733746488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYRdDXV7qCaW6xzUCDhQhNzZqubZov0EV3e88I7YnC8=;
        b=jgfuukZsqhgdJUSBpLRkrW6ZZ6bIrVwaQcGT3OJKcMVDDQKSsMVRKteFnZ/aRT/Dcp
         Q4FrMztq8VyCOemHhxjau1Pr/9nqvP7QzyPs5YR5hw53vrzKWzooUieWzo2xGMhXdNFB
         r4XJpXeATU8+A4GhWIyMnq+tcxuvv/bLp/mBYWR3vTX1wr4ItrHk9gJtwkV577COsJIH
         cSAXWq0xVyuF8ielSOL31628omSa0kPEPtuz78MhXzUtAid70bkziz2B65eOfpnycbzG
         9yoBesTMvSstfDfuSXtqezkFKMVSr4JJxm/mcpR6cdsQNx6k+kp2a8vL6pMC4oVSiyNM
         7jgg==
X-Forwarded-Encrypted: i=1; AJvYcCUk7vDujlhY1JapzGFIDk2IbuPT70Kqa4eghGAW3o2NEjtOuq4ASuJ3SenOppIohUTEi75FgJ5PdVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmhWkB067dhYpZ9z6NnY0VMCC7+ubP7469BHOyCjW7nDwkMCu6
	EuMLdbhCVS2lHF9X3RfmE/JagIf2FXos6DX/i2F+OSSHJqZrR0MSj1SF+wHD6Q==
X-Gm-Gg: ASbGncs5y0YJLcIdDbLjz4uaTw87ibGP2w7NgirtINb7iQoSdpf7gWbMN0Djkpdyj8y
	6qxaOQNBmnGYn+B3D6bNlORAuVfrz/2xNZDiO8tjyhEteFvgP9QHChA79f3HjZ4N6C9WsAfK3Gf
	kowuiKCuD6zd4oup6poe0vk5TwYFmejhOAxxGps1/d9ymKBZC4zoSnx6GjimToq+5W0RW2SBK51
	ZciKVt5X3FMlBXYTAPWEbK8Iv8GUYyHOv8XE2FxNLKPA/aRxrmor7jjx9Ls5xya5LVQQzmjGd79
	AQtKSzQG3qCfrORvRtMEjqrAnp4hUGllpts=
X-Google-Smtp-Source: AGHT+IHM2wKF2NLv8qB5Oo2bVJWWDU5HhAbJMNoKxux67IOb0AWXjm+AQmEaapmR5GOII+kYFC7f9g==
X-Received: by 2002:a05:6512:3d26:b0:53d:ed26:344b with SMTP id 2adb3069b0e04-53df00a97b4mr12765197e87.7.1733141687983;
        Mon, 02 Dec 2024 04:14:47 -0800 (PST)
Message-ID: <e01af196-9f6d-4fde-a118-2875744d5865@suse.com>
Date: Mon, 2 Dec 2024 13:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] x86/hyperlaunch: add memory parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-14-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-14-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> @@ -160,6 +161,42 @@ static int __init process_domain_node(
>              else
>                  printk("PV\n");
>          }
> +        if ( match_fdt_property(fdt, prop, "memory" ) )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }
> +            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  memory: %ld\n", bd->mem_pages << PAGE_SHIFT);
> +        }
> +        if ( match_fdt_property(fdt, prop, "mem-min" ) )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }
> +            bd->min_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  min memory: %ld\n", bd->min_pages << PAGE_SHIFT);
> +        }
> +        if ( match_fdt_property(fdt, prop, "mem-max" ) )
> +        {
> +            uint64_t kb;
> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
> +            {
> +                printk("  failed processing memory for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }
> +            bd->max_pages = PFN_DOWN(kb * SZ_1K);
> +            printk("  max memory: %ld\n", bd->max_pages << PAGE_SHIFT);
> +        }

Since the values logged are all multiples of 1k, why make reading the logs
more complicated by logging byte-granular values? I instead wonder whether
converting to more coarse grained values (leaving, say, between 4 and 6
significant digits while using kb, Mb, Gb, etc) wouldn't be yet better.

Jan

