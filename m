Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B841836124
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669780.1042194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsNG-0003lp-I8; Mon, 22 Jan 2024 11:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669780.1042194; Mon, 22 Jan 2024 11:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsNG-0003jo-F1; Mon, 22 Jan 2024 11:21:54 +0000
Received: by outflank-mailman (input) for mailman id 669780;
 Mon, 22 Jan 2024 11:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRsNF-0003jg-IK
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:21:53 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 712cbdcf-b918-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 12:21:52 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cdb50d8982so32589751fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 03:21:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m1-20020a056e021c2100b00362772f67a1sm1044137ilh.20.2024.01.22.03.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 03:21:51 -0800 (PST)
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
X-Inumbo-ID: 712cbdcf-b918-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705922512; x=1706527312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHBGqnsb4oN+WzK3qGlJoxKuVtHXhfOeG4UuXN/xmGA=;
        b=cqLeImj12OI/ckjVJWAZohQFxJ6pH0tGhnmG2Ah+EagCXhml859qBB+YlbA4hOSUMz
         FgcAyclGDYJUPzxpQpYbyj9oSs3KRMdMj78hX20wGQzsSu0WLvuese7MIYv0GolyQfEK
         +dlVoYyrHFLL4Lk1/WrgtgAxIECG173ZK20s3FazTBvOTL/md9iiX3ho/tZmaec5foLk
         pYkXhYEWm/NGlE6IY9b3vPf8tGnS1VjKivw7vAO9vlCmwpB8SjgFiOh8bBothdN5dgTy
         /ge4mApP+9Hg2S6Wty/W6hOY1xqwtkMr5J9wELaHGFclDg4AlXVqurA8DznmZFtfE2Fs
         sBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922512; x=1706527312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHBGqnsb4oN+WzK3qGlJoxKuVtHXhfOeG4UuXN/xmGA=;
        b=jQSGY/RkDTQ6JlXHa6wck9eO35xEiduSY774BU4pbNlv9X6qtOPcOf2PsnQAY6jNzv
         a+EsDCUwjZTOyQNErhk3lpfvsNqvYo2JHEqKCkOeJjqJmZPuQ7QZKiNKbin1qIqQQAkD
         hLB2FfplrhZGZ2Ovfkm4iSte/2ZzKE878zYYqB+s45s7o/xtd4YbhGu4kXEDEJwU/1FH
         6qGPzAJ9u3j8vcxLb5cpJiISq87ZFDmROAFzln7qAbzsbjzYYQM3NDo8n0lYikuYgZBy
         UvcosIidRJ7NbPat1mEmw2s9V4FoBKAq5/1qSVES5RFAtIN9vNy8I919KYtafJTDqtkk
         eeBA==
X-Gm-Message-State: AOJu0YyjcJxMZxvgyRq3hoMsW183xtdwHP36SBij1BjqMn2I25lOS3ts
	KZIRRu9rn2Ic+eTXCZwW7WDEwCbBZ+eIGkGkrUdH3A/4C8Qrd96y+o/JLUf7og==
X-Google-Smtp-Source: AGHT+IHOPdIU/Y1MpiffzGMWgDWgAIy2JnWSHTyOiORPgyjGeXgHq3D2t4V1Gr1u35MP2QKX74EdpA==
X-Received: by 2002:a2e:b0f4:0:b0:2cc:603f:5cd7 with SMTP id h20-20020a2eb0f4000000b002cc603f5cd7mr1608848ljl.6.1705922511950;
        Mon, 22 Jan 2024 03:21:51 -0800 (PST)
Message-ID: <013210fd-6ea3-4719-afcd-1da97d9cd17f@suse.com>
Date: Mon, 22 Jan 2024 12:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240122110244.14091-1-roger.pau@citrix.com>
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
In-Reply-To: <20240122110244.14091-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 12:02, Roger Pau Monne wrote:
> The minimal function size requirements for an x86 livepatch are either 5 bytes
> (for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
> distance between functions entry points is always at least of the minimal
> required size for livepatch instruction replacement to be successful.
> 
> Add an additional align directive to the linker script, in order to ensure that
> the next section placed after the .text.* (per-function sections) is also
> aligned to the required boundary, so that the distance of the last function
> entry point with the next symbol is also of minimal size.
> 
> Note that it's possible for the compiler to end up using a higher function
> alignment regardless of the passed value, so this change just make sure that
> the minimum required for livepatch to work is present.  Different compilers
> handle the option differently, as clang will ignore -falign-functions value
> if it's smaller than the one that would be set by the optimization level, while
> gcc seems to always honor the function alignment passed in -falign-functions.
> In order to cope with this behavior and avoid that setting -falign-functions
> results in an alignment inferior to what the optimization level would have
> selected force x86 release builds to use a function alignment of 16 bytes.

Nit: A comma after "selected" may help readability.

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -37,6 +37,27 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
>  config CC_SPLIT_SECTIONS
>  	bool
>  
> +# Set function alignment.
> +#
> +# Allow setting on a boolean basis, and then convert such selection to an
> +# integer for the build system and code to consume more easily.
> +#
> +# Requires clang >= 7.0.0
> +config CC_HAS_FUNCTION_ALIGNMENT
> +	def_bool $(cc-option,-falign-functions)

Nit: Maybe better have a blank line here?

> +config FUNCTION_ALIGNMENT_4B
> +	bool
> +config FUNCTION_ALIGNMENT_8B
> +	bool
> +config FUNCTION_ALIGNMENT_16B
> +	bool
> +config FUNCTION_ALIGNMENT
> +	int
> +	depends on CC_HAS_FUNCTION_ALIGNMENT
> +	default 16 if FUNCTION_ALIGNMENT_16B
> +	default  8 if  FUNCTION_ALIGNMENT_8B
> +	default  4 if  FUNCTION_ALIGNMENT_4B
> +
>  source "arch/$(SRCARCH)/Kconfig"
>  
>  config DEFCONFIG_LIST
>[...]
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -99,6 +99,10 @@ SECTIONS
>         *(.text)
>  #ifdef CONFIG_CC_SPLIT_SECTIONS
>         *(.text.*)
> +#endif
> +#ifdef CONFIG_FUNCTION_ALIGNMENT
> +       /* Ensure enough distance with the next placed section. */
> +       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
>  #endif
>         *(.text.__x86_indirect_thunk_*)

I continue to fail to see how an alignment directive can guarantee minimum
distance. In the worst case such a directive inserts nothing at all. IOW
at the very least there's a non-spelled-out assumption here about the last
item in the earlier section having suitable alignment and thus, if small
in size, being suitably padded. Personally I don't think merely spelling
out such a requirement would help - it would end up being a trap for
someone to fall into.

I'm further curious why .text.__x86_indirect_thunk_* is left past the
inserted alignment. While pretty unlikely, isn't it in principle possible
for the thunks there to also need patching? Aren't we instead requiring
then that assembly functions (and thunks) all be suitably aligned as well?

Jan

