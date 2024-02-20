Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6285BA1A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 12:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683418.1062920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcO4p-0004FI-AB; Tue, 20 Feb 2024 11:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683418.1062920; Tue, 20 Feb 2024 11:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcO4p-0004CV-74; Tue, 20 Feb 2024 11:14:19 +0000
Received: by outflank-mailman (input) for mailman id 683418;
 Tue, 20 Feb 2024 11:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcO4o-0004CP-6V
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 11:14:18 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2efa3004-cfe1-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 12:14:15 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-512b700c8ebso2377811e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 03:14:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b004126ec2f541sm1659435wmo.0.2024.02.20.03.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 03:14:14 -0800 (PST)
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
X-Inumbo-ID: 2efa3004-cfe1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708427655; x=1709032455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fu04UrW6KIZ54U/Q1q80D52Btmv1ea4nslaOFbkl/g=;
        b=FjG80fYBk7Buz2NLQYdy0skaD+HsPayoB845cnjqSYyI5RgRpVgpLMqqOJK5ZrfGi5
         KisHdm6zcUlv4VKnDuPXlVzk+UE+6WJLNJx9TY8JB5rHeZelcFput9hbwOs8NK6bgy3e
         iS5jAGdJVqx7E2TJ3T9rfC8S+CRT6WIAAO/q7wSSjz5NJIobRy7F6f8pZg/web+BshPK
         05UdQ0dEtvju/p/wk/XNzwd11hNfWMLdKKy1j5qwDMBmeuQVje5X+1tPsezP936DTfH2
         CnC1SoYzzY1p00OebG6OSZRb0LRmJ2KEXCEVhz+M/42dRqRXM7Z4MxzwWvbmu0FELcMe
         O/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708427655; x=1709032455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fu04UrW6KIZ54U/Q1q80D52Btmv1ea4nslaOFbkl/g=;
        b=ZC6i9qOZLyvNdtwxtsVo2y4M75RfmIcg+Wln6aC0tPA4iJCLQ9twECefPZLIuYg/sr
         Mtb4+u8eU31MoroNv84A12v6ZJiq1qixs+iycuT0dV7b39zb5MjqfzbT780cvIxYIymY
         xMg5kg0+bEY3Wqe/lqyW7H7Y+AH110JTySYbW7BP85uztISwHDTHeYCsMSjJeJ9p0M1Q
         ewwvwimuvnNj3BMeZg+X15zKXFXKUbJ2G1SZgH7E3nRxsrg56AoVjMMet1GD4jKEvGOm
         QI0TiWMl1gIBdnjd3d6D97C3MTzEUoKJEABDgpQHKSs5sNyM3r2xwsaReiHdZbgpb8LH
         c2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX6e6jrmJwl9ckUVqwOirzNmfRedGyMOzsY3mQQr6N5fx0+ZBcEC+AHoecyCtm+hmdIPP4LmnajOJzY9zur8jWInzI6bc5SmWoj38oyyX0=
X-Gm-Message-State: AOJu0YzKLoGpyVsHct0QoPahjPnGYYaKhWgxTm9zp2AXSwiWr1Ugx0zq
	+wvQpRY5kUNiGiyMPHVXU9hnq2Peo75ZZzVdFau+iIS448Z3WoOwCNPa0pq92w==
X-Google-Smtp-Source: AGHT+IHgC3z+xH5eaKqRnifHT+sdO2QvDpPieF5X5R2FmW1NPUuYd/oHQ7DpBTG6NilLo16OpEWxoA==
X-Received: by 2002:a19:f610:0:b0:512:b915:95d4 with SMTP id x16-20020a19f610000000b00512b91595d4mr2977384lfe.61.1708427655294;
        Tue, 20 Feb 2024 03:14:15 -0800 (PST)
Message-ID: <18795bde-bfd5-41ab-bef5-f74819bae956@suse.com>
Date: Tue, 20 Feb 2024 12:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 13/27] x86: Add a boot option to enable and
 disable the direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-14-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-14-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -799,6 +799,18 @@ that enabling this option cannot guarantee anything beyond what underlying
>  hardware guarantees (with, where available and known to Xen, respective
>  tweaks applied).
>  
> +### directmap (x86)
> +> `= <boolean>`
> +
> +> Default: `true`
> +
> +Enable or disable the direct map region in Xen.
> +
> +By default, Xen creates the direct map region which maps physical memory
> +in that region. Setting this to no will remove the direct map, blocking
> +exploits that leak secrets via speculative memory access in the direct
> +map.

I think this wants wording such that the full truth is conveyed: The directmap
doesn't disappear. It's merely only sparsely populated then.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -29,6 +29,7 @@ config X86
>  	select HAS_UBSAN
>  	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
> +	select HAS_SECRET_HIDING

Please respect alphabetic sorting. As to "secret hiding" - personally I
consider this too generic a term. This is about limiting the direct map. Why
not name the option then accordingly?

> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -620,10 +620,18 @@ void write_32bit_pse_identmap(uint32_t *l2);
>  /*
>   * x86 maps part of physical memory via the directmap region.
>   * Return whether the range of MFN falls in the directmap region.
> + *
> + * When boot command line sets directmap=no, we will not have a direct map at
> + * all so this will always return false.
>   */

As with the command line doc, please state the full truth.

>  static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  {
> -    unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
> +    unsigned long eva;
> +
> +    if ( !has_directmap() )
> +        return false;

Hmm. The sole user of this function is init_node_heap(). Would it perhaps make
sense to simply map the indicated number of pages then? init_node_heap() would
fall back to xmalloc(), so the data will be in what's left of the directmap
anyway.

> +    eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);

Irrespective I don't see a need to replace the initializer by an assignment.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -83,6 +83,23 @@ config HAS_UBSAN
>  config MEM_ACCESS_ALWAYS_ON
>  	bool
>  
> +config HAS_SECRET_HIDING
> +	bool

This again wants placing suitably among the other HAS_*.

> +config SECRET_HIDING
> +    bool "Secret hiding"
> +    depends on HAS_SECRET_HIDING
> +    ---help---
> +    The directmap contains mapping for most of the RAM which makes domain
> +    memory easily accessible. While making the performance better, it also makes
> +    the hypervisor more vulnerable to speculation attacks.
> +
> +    Enabling this feature will allow the user to decide whether the memory
> +    is always mapped at boot or mapped only on demand (see the command line
> +    option "directmap").
> +
> +    If unsure, say N.

Nit: Indentation and no ---help--- anymore (just help) please in new Kconfig
entries.

Also as an alternative did you consider making this new setting merely
control the default of opt_directmap? Otherwise the variable shouldn't exist
at all when the Kconfig option is off, but rather be #define-d to "true" in
that case.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -165,6 +165,13 @@ extern unsigned long max_page;
>  extern unsigned long total_pages;
>  extern paddr_t mem_hotplug;
>  
> +extern bool opt_directmap;
> +
> +static inline bool has_directmap(void)
> +{
> +    return opt_directmap;
> +}

If opt_directmap isn't static, I see little point in having such a wrapper.
If there are reasons, I think they want stating in the description.

On the whole: Is the placement of this patch in the series an indication
that as of here all directmap uses have gone away? If so, what's the rest of
the series about? Alternatively isn't use of this option still problematic
at this point of the series? Whichever way it is - this wants clarifying in
the description.

Jan

