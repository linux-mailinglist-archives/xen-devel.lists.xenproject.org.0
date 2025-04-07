Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133AA7E522
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940487.1340247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oiI-0003xA-A6; Mon, 07 Apr 2025 15:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940487.1340247; Mon, 07 Apr 2025 15:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oiI-0003ue-6o; Mon, 07 Apr 2025 15:48:42 +0000
Received: by outflank-mailman (input) for mailman id 940487;
 Mon, 07 Apr 2025 15:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1oiG-0003uY-Ps
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:48:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c59d5ec8-13c7-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 17:48:38 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso2001939f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 08:48:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d661sm12761157f8f.66.2025.04.07.08.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 08:48:37 -0700 (PDT)
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
X-Inumbo-ID: c59d5ec8-13c7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744040918; x=1744645718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zsRr1iR4ytUVxJpuPVq0LR3WKz2iMqjK0nue+ka7+vw=;
        b=I9m9IGuei3BqnwdbFndp0gs0VWpi+cUP5XaCoD23EzLr/kl49tiYdHxuBDKK11tzAU
         rq8ci/Yw39u5S8v6H0RB5n5AIOxs+Z9iUbZSUdCq/yOMe+f9NcG13rHrluABfF/7/Qdi
         dj9lOBEc4fpjAB5K2V8eW6pSC5kvvLo+kxmY3PhOYeGQT68sLLbcLhxbQj4WzVVIck4K
         6Hl+kIWNvasbcCAh0jbgZs/5mN8uuLYMgRG1QhcQNctw8sHzBQXZewgcA4wfSXvfVO9D
         M+0bhb4uI7tY3Pf0Nyz1EGi4woSMaVXoi4fyPrVwJUyNI49nE3fQoJp7Tf78xiUIB3LF
         DpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040918; x=1744645718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsRr1iR4ytUVxJpuPVq0LR3WKz2iMqjK0nue+ka7+vw=;
        b=H5yG9JBZmbtwGgfmyBxsf1XAFzBS+TYedLH04h1que99rV/3Kx+2q4iIE6M53jEMoe
         0uB/uSzki43ViiKkiP+FJKFAvkOmKktFoWHTO7y6uqYIVkcG96tp3sgYm9WaqjvQNlUa
         u1mox3/1NpJ1MPgtLXxdH3+xsuHBIN1H5zMVl+MGF/8mXvO6gaoCQkxmPkygEgPFAndk
         wJXQuQ08t68wzP3ohs8bOPiq3jiOcJlAc9OvUx1VLmqdmpbk2lamWYIz60erFG3PXyb9
         v4WqoHTntv2Li/19lUlu2/WEBuoylRGh8AjdXo2mNzH3oLV7B6+bzAOQ+WZErhp1JOrB
         Kb8g==
X-Forwarded-Encrypted: i=1; AJvYcCUlNocF5VZTil5hN8yV8swQJcq7Ip877/jQzx6yHi1YKcrULfV/ik9uIKfOxIUCaTyyOPDjweM9K6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA1evZa0Y+UOomJM4zsFoViLneY8DtpTEMvQrH2jYYXlPqx8S9
	QvAf4YBc+lyE6HF9fDCKM3t3y2HNVbr9SMPkc2BtTqkcn6bl+0QsdXQqel4UgA==
X-Gm-Gg: ASbGncth483sy0c51jqgJ2c1GSvApY8wqxvnX0kijb3SW72iESJ+msw9cpHmFxE8pQj
	JXwbhCB2+7b8Omf0uRVLQa5iBNShNzX1V8xOqMXn/ZWcjCuAm2/TdUJ+OC3fgbhThawYeckhSMj
	L40j2wvPZHZoO1nBEgEaVoUe7oFvOeAgV0tUFfnzmm/xhq//bD6vlP/U2eEAYCwJX6c5Fe3yihM
	WsDhZr53iVwRf7AAUwucdgKxFbVWd5APkgP5OGGN3dnuSO2w7jVbqNfaVT4MP4Q07jDaJPTYNXF
	U8NgAU0tgfcVOBnjj7TnjOWzZMjS9/F3HN4O1421/biwzlgf5wsAWGWW2lUB5S4uuzchoyxlvVk
	nFe6osOqbwsbVDjLVHua6uhCcegBzBA==
X-Google-Smtp-Source: AGHT+IEGtcTLWVP4Iao6YWKrnI76TY3HuMWTFh6dR0dPho52qqcsdckTeslmiiXXdfO5c7pLXsUpMA==
X-Received: by 2002:a5d:5f43:0:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39d6fce11f5mr7584718f8f.36.1744040917870;
        Mon, 07 Apr 2025 08:48:37 -0700 (PDT)
Message-ID: <1df6b4c9-7309-49cd-8046-019d94139c57@suse.com>
Date: Mon, 7 Apr 2025 17:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/AMD: Convert rdmsr_amd_safe() to use asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250407153510.1863243-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250407153510.1863243-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 17:35, Andrew Cooper wrote:
> Unlike the WRMSR side, we can't use asm goto() unconditionally, because our
> toolchain baseline doesn't support asm goto with outputs.

Is there actually a benefit we gain from now needing to maintain two different
pieces of logic fulfilling the same purpose?

> Also, there's a different errata workaround we'll need if we want to use asm
> goto() with "+" constraints:
> 
> config CC_HAS_ASM_GOTO_TIED_OUTPUT
> 	depends on CC_HAS_ASM_GOTO_OUTPUT
> 	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
> 	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
> 
> I'm tempted to put it in straight away, lest we forget about it.

Perhaps best if we really want to go this route. Yet then - why "TIED"? Isn't
"tied" the term they use when referring to an earlier operand by using a
digit (or the operand's name in square brackets)?

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -41,6 +41,20 @@ config CC_SPLIT_SECTIONS
>  config CC_HAS_UBSAN
>  	def_bool $(cc-option,-fsanitize=undefined)
>  
> +# Fixed in GCC 14, 13.3, 12.4 and 11.5
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
> +config GCC_ASM_GOTO_OUTPUT_BROKEN
> +	bool
> +	depends on CC_IS_GCC
> +	default y if GCC_VERSION < 110500
> +	default y if GCC_VERSION >= 120000 && GCC_VERSION < 120400
> +	default y if GCC_VERSION >= 130000 && GCC_VERSION < 130300

Unlike for pre-release versions (x.0.y) I view this as problematic. Distros
are likely to have backported the fix before the minor releases took place.
Or they may have backported without ever meaning to follow later minor
releases. We'd needlessly exclude them here. Imo ...

> +config CC_HAS_ASM_GOTO_OUTPUT
> +	def_bool y
> +	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
> +	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)

... the only option is to actually probe for support as well as the (non-)
buggy-ness.

Jan

