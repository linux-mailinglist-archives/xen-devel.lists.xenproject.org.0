Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F0CB59D4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 12:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183894.1506482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTedT-00027S-Si; Thu, 11 Dec 2025 11:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183894.1506482; Thu, 11 Dec 2025 11:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTedT-00024k-Pq; Thu, 11 Dec 2025 11:15:03 +0000
Received: by outflank-mailman (input) for mailman id 1183894;
 Thu, 11 Dec 2025 11:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTedR-00024O-MC
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 11:15:01 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ed6326-d682-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 12:15:00 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so6798305e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 03:15:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d0e34fsm11969255e9.0.2025.12.11.03.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 03:14:59 -0800 (PST)
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
X-Inumbo-ID: a1ed6326-d682-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765451700; x=1766056500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ7CBsOyxvfGMpeVqKq+dXvv9lVQvXeRuBU8swUImrs=;
        b=JScMjsbr553BJOPoeUyMki+z663NhFFZPBD82GmyhZckmqxBI6ZA//Rb+s9Nzghk4u
         DJaneOnl4LP0coCW0mThxK9eZx6zWvi8FhO9EyXTc3z5FoxRDyMzUH/US//27X+S7gE3
         8VSFnfQsRCo5Yqxw3ouVeO6Gkpd7nFV/yEtituQ/t19zrlHrRgxNNrQ9NJ6f+KSr7v6Q
         Mw6n8JM2Ci7d9yfbCk9ZKU3Pp9Bficz2WNZiyCQFkK8jmetceeXU1GQvnji4umpktRWC
         cksTNYMcUrUKoc+U1hWe+8RO0lSIx63k9pdYdTeiKCmwjH3xQyUQ0fBTSlWGbqp1K2hY
         0AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765451700; x=1766056500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ7CBsOyxvfGMpeVqKq+dXvv9lVQvXeRuBU8swUImrs=;
        b=bgw21oK5OmpXTYU0+fAaU04UWUjhqXIZLx0uSAm6abXS2Bch1MWIhxdx7y2m0cjZv4
         4dDD8xRFhuutSEBZ59t0DtV+2gNhG7w9yRW2Y83EZOgdzsVSDio3QLeuiGu77cKqY6b0
         N7lNqVPZdQpWL2G/vEl7p4Iqj3LskuABnkqIwhG3oA35Ejl7B4SX5wN8aQK1bwVEZIJj
         1zYau5fQqZ/3bC1IrA2104GygEMhktfI9EQvK/9H0f5pw9XujyFK4XWKw536BpcK8knl
         DVtf3jfue/TtMTRpwJjka+KsqVar0ZTntY/b8KSEtRMDtlLpGfbtcKx6CSit9mhyxS2R
         LlyQ==
X-Gm-Message-State: AOJu0YzVzsMIyNw7kd/2GDGVEkLgVIVmX2O0APBxfq/7S2dD03ErWxAr
	yr8JRx3tpnBFROasbiwor/BRiBj3IDGJhjd8regY5EMJFbE4ZZlutzgRzhndHLH3aw==
X-Gm-Gg: AY/fxX4u9/02b/rosl6wRAGTs3h4hCBFz4KK4+JXhtkg68osqOFArYV7IH3m2xBNPmp
	fOVJeAfAp3Xk/ZQqYl9khPnHfOaSTYnvcc6TfECpJMBMI+hM+sjVhmPcKbOf2KOl9BQjl6BmQIQ
	PDpQTu3MFlC6ghoZaNdBVL3uCDbmEt61a8oZBDWFcG8as3UOIbF4J8AEKN9B8O+bYVikjbKqzE1
	QzrtdT26BcnsP2FFclbR2bDFRXrmuBnUMy0Ol6L7nJjDwBQP4kKkunPOySNjMolLqmn+/wVY9Ge
	+BIywfjDCF1pM4nr91ywHGtLHP5tW9wfENndOPiaof7cmr95fIRTVPtX0LiHRwvswgtltXEPob1
	0wFKDkAQDqkDFfDLGKBoxHXD526x2J5rQ6c3fWv9XWXNtWOksonNX8GoHFWTRUsSRk5ho2sDaRz
	X5ruebF0PjK2ydi6m/wpnYkMRWopQpBzQ4Bw6F42M+kgpGrUjk2AwPtu81PZ2f59R61Nhs77IxA
	+c=
X-Google-Smtp-Source: AGHT+IEOHzqPSer/rx4niglt5SXStyabJWh1CEjpno5Jvm9x1md36I6R4A0Z53p1p8X53VRxD48F/w==
X-Received: by 2002:a05:600c:4693:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-47a8378cd86mr57507255e9.21.1765451699549;
        Thu, 11 Dec 2025 03:14:59 -0800 (PST)
Message-ID: <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
Date: Thu, 11 Dec 2025 12:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Mykola Kvach <xakep.amatop@gmail.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
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
In-Reply-To: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2025 11:29, Mykola Kvach wrote:
> While working on an arm64 s2ram series for Xen I have hit what looks
> like very strange behaviour in symbols_lookup() as exercised by test-symbols.
> 
> The series is in the branch referenced at [1]. All patches there except
> the last one build and pass CI; adding only the last patch makes the CI
> job referenced at [2] start failing.
> 
> Note that the tests in that job are built without CONFIG_SYSTEM_SUSPEND
> enabled, so most of the code introduced by the s2ram branch is not
> compiled at all for that configuration. That is why I initially did not
> expect my series to affect this job.
> 
> To investigate, I tried to reproduce the issue locally. I downloaded the
> xen-config artifact from the failing job [3] and used it to build Xen
> with my local aarch64 cross compiler. With this local toolchain
> I could not reproduce the failure, and the resulting .config changed slightly
> compared to the job's config. The relevant part of the diff looks like this:
> 
>     diff --git a/xen/.config b/xen-config
>     index 057553f510..44dcf6bacc 100644
>     --- a/xen/.config
>     +++ b/xen-config
>     @@ -3,11 +3,11 @@
>      # Xen/arm 4.22-unstable Configuration
>      #
>      CONFIG_CC_IS_GCC=y
>     -CONFIG_GCC_VERSION=130300
>     +CONFIG_GCC_VERSION=120201
>      CONFIG_CLANG_VERSION=0
>      CONFIG_LD_IS_GNU=y
>      CONFIG_CC_HAS_ASM_INLINE=y
>     -CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
>     +CONFIG_GCC_ASM_GOTO_OUTPUT_BROKEN=y
>      CONFIG_FUNCTION_ALIGNMENT_4B=y
>      CONFIG_FUNCTION_ALIGNMENT=4
>      CONFIG_ARM_64=y
> 
> So there is at least a difference in GCC version and asm-goto related
> Kconfig options between the CI environment and my local one.
> 
> After that I tried rebuilding inside the same Docker image that GitLab
> CI uses:
> 
>     registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8
> 
> When I build Xen in that container, using the same branch, the problem
> reproduces in the same way as in the CI job.
> 
> Even more confusingly, adding extra prints in test_symbols just before
> the calls to test_lookup() makes the problem disappear. This made me
> suspect some undefined behaviour or logic issue that is very sensitive
> to optimisation or layout changes.

All symptoms described make me suspect you're hitting a problem we're
already in the process of hunting down. Can you please take [1], make
the small adjustment necessary to Arm's linking rule, and see whether
you get a build failure in the case where right now you get a boot time
crash? Of course no other changes to code or data layout should be done,
or else you may observe false negatives.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-12/msg00390.html

