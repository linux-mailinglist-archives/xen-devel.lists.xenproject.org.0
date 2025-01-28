Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E93A20E9B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878649.1288838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoVX-0006S8-1q; Tue, 28 Jan 2025 16:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878649.1288838; Tue, 28 Jan 2025 16:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoVW-0006Py-Ur; Tue, 28 Jan 2025 16:32:10 +0000
Received: by outflank-mailman (input) for mailman id 878649;
 Tue, 28 Jan 2025 16:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcoVV-0006Ps-Uw
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:32:10 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a9645a7-dd95-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 17:32:08 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso6639602f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:32:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab69179d7c7sm578711566b.112.2025.01.28.08.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 08:32:07 -0800 (PST)
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
X-Inumbo-ID: 6a9645a7-dd95-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738081927; x=1738686727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UkCd7FMoo0J6NkVeEHdu6xmJCSHgM3opraZr/s1fnRg=;
        b=E27BLiXWCHlcqMhUvIV+l4ICS9P0+OwmLaG1fTM4smBWDdQ1G7cEyaOdml9dP/zCsg
         clWmSWP3fjGRYf6CWjV3WRbtlXUxiPozFHdAoUgS9kP3dR76E7RNSGW68BA75dvyPGR2
         FkNeQKsG/3zTq59kRUf194CP6Sf6r0O9cCpVVkgXPs4EtIYtysaVH1/5SGxAP8nWYAZV
         QV/pl3ncqPBAl7K7CvQ1Gub3E2XhTbbvj9QtCn/Ew9v2XuSRsdGPqHbOYN2pfrk/cVAc
         dS05+kG8zACthkU//btpN8sx/69qIll2RYAxniosjC6O4i+splYwOZsusmgvR9d34k+n
         xjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738081927; x=1738686727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkCd7FMoo0J6NkVeEHdu6xmJCSHgM3opraZr/s1fnRg=;
        b=vCoL8xWvxwH6eaArSqCVOorBWCPw/8LSxrTB0HtAvG3ukiT/tGFegGWR34Dvc8Eu5I
         Wszu9Nt9MPVor50TC9vT0ylqmYI3pYdyh5+jz+7eoN7Ze1yjUXT2kv0gvjlcXUVWkD2E
         FZgBHMUQ63CfMiGTuWVcOjzG/25KpR1MuSiVYrt1sm76f6YhznZyDZog7vsJw8ap1Nd8
         On0fVZ5JiD7+FJLYtsCGLKBempoEYqLiHgt6wGjaVbZ/81BpOhpCOqU7MnePcn01jvMX
         SSRjgOgqAlFFDU1O9MsjnN1yhe2GnM7RNvlodcC8HiHvoqyARUBt5Cvu5RL1Mrd8I7zf
         Rx3A==
X-Forwarded-Encrypted: i=1; AJvYcCXeURU2EJ463IYRpMDMzs0Tqb8sgWvie/Cxd7dpTgCQxvkRnfeHq0faX5AZ53HFlEQkD3jTcfL67mg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqIDO1j0NOHFGMcagJ8nSbiV7N0z8KEFaSDwvadVwpq9TvkZ9q
	qw9K+BBw0KdXVit/FJQ2eP4YL+lw2VOSRerPFaOpLuUuaFrUzjqlMGBlEY6kQg==
X-Gm-Gg: ASbGncsD3EMLB8SQhtWf3BD1NQPz1vSUbIeVnOb8tJy8emCjkUBd2+FdJ6NXnnRlWnM
	UwtvCqAhn8noULwxL8jUkQEzC7kcx7hF22mcubJPoFDfz6dps99QyWwV7Wi2lR88r00zmuSbxeX
	gBcvPFVsayIJ1ULLp5+iT+rybftXSmdO5xyoa7kKj6MTxG+lQozuuh/LMP2JC6oU/Lsu87g8QD/
	oEA+3aTa8aaWfwJVed4ypP+76YiZsQCIP03Y9FcYB5/70emypbFm4rK6E68L9Upyx/s76T4r9vZ
	HY+rOyclJvD0MeiKsDMBxsnU6af1NKPVH6JQUBSwsszKLxVds0z3uwBZfGf9w9LN5DqWbscqLy5
	O
X-Google-Smtp-Source: AGHT+IHapNumHUc0+s5PUTlXuSriAJ3SYR0jIwhBcAr6R0GtwfMVnAiIsksKYBNOfHW3E39Il90NCQ==
X-Received: by 2002:a05:6000:186f:b0:385:fa26:f0ac with SMTP id ffacd0b85a97d-38bf564926cmr39788652f8f.7.1738081927522;
        Tue, 28 Jan 2025 08:32:07 -0800 (PST)
Message-ID: <d471f3b0-5638-47b3-927e-318b0575eaa3@suse.com>
Date: Tue, 28 Jan 2025 17:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/24] xen/console: make console buffer size
 configurable
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-15-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-15-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add new CONRING_SIZE Kconfig parameter to specify the boot console buffer size
> in bytes. The value is rounded to the nearest power of 2 to match existing
> conring_size= behavior.
> 
> The supported range is [16KiB..128MiB].
> 
> Bump default size to 32 KiB.
> 
> Link: https://gitlab.com/xen-project/xen/-/issues/185
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

As asked elsewhere already: How's this related to the goal of the series?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -423,12 +423,15 @@ The following are examples of correct specifications:
>      com1=baud=115200,parity=n,stop-bits=1,io-base=0x3f8,reg-width=4
>  
>  ### conring_size
> -> `= <size>`
> +> `= <size-in-bytes>`

May I direct you to the explanations near the top of the file? <size>
is a uniform term throughout this document, and wants to stay like this.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -96,6 +96,17 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_SIZE
> +	int "Console buffer size"
> +	default 32768
> +	help
> +	  Select the boot console buffer size (in bytes).
> +	  Note, the value provided will be rounded down to the nearest power of 2.
> +	  Run-time console buffer size is the same as the boot console size,
> +	  unless enforced via 'conring_size=' boot parameter.

Maybe s/enforced/overridden/ ?

> +	  Default value is 32768 (32KiB). The supported range is [16KiB..128MiB].

Yet then there's no "range" directive.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -100,12 +100,15 @@ static int cf_check parse_console_timestamps(const char *s);
>  custom_runtime_param("console_timestamps", parse_console_timestamps,
>                       con_timestamp_mode_upd);
>  
> -/* conring_size: allows a large console ring than default (16kB). */
> +/* conring_size: allows a large console ring than default (32 KiB). */

As you touch this, also s/large/larger/ ?

>  static uint32_t __initdata opt_conring_size;
>  size_param("conring_size", opt_conring_size);
>  
> -#define _CONRING_SIZE 16384
> -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> +#define _CONRING_SIZE       (1UL << (31 - __builtin_clz(CONFIG_CONRING_SIZE)))
> +_Static_assert(_CONRING_SIZE >= 4096 && _CONRING_SIZE <= MB(128),
> +    "CONFIG_CONRING_SIZE must be in [4K..128M] range");

Hmm, 4k here as the lower bound, when in description and Kconfig it's
said to be 16k?

Also I fear _Static_assert() can't be used here, for not being supported
by all gcc versions we continue to permit being used on x86. That'll be
unnecessary anyway once you put in place the missing range directive in
Kconfig. (If something like this needed keeping, it would be
BUILD_BUG_ON() that you want to use instead. Which, yes, can only be
used inside a function. Hence why we have a number of build_assertions()
functions throughout the codebase.)

> +#define CONRING_IDX_MASK(i) ( (i) & (conring_size - 1) )

Once again - no blanks immediately inside parentheses, _except_ as
written in ./CODING_STYLE (i.e. in control flow statements).

Jan

