Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C99DC038
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 09:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845743.1261084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGvzK-0002IH-Db; Fri, 29 Nov 2024 08:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845743.1261084; Fri, 29 Nov 2024 08:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGvzK-0002Fy-Ax; Fri, 29 Nov 2024 08:04:30 +0000
Received: by outflank-mailman (input) for mailman id 845743;
 Fri, 29 Nov 2024 08:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGvzI-0002Fs-Md
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 08:04:28 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c5756df-ae28-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 09:04:25 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so417991f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 00:04:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df69feaasm672021f8f.5.2024.11.29.00.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 00:04:24 -0800 (PST)
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
X-Inumbo-ID: 8c5756df-ae28-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MjkiLCJoZWxvIjoibWFpbC13cjEteDQyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhjNTc1NmRmLWFlMjgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODY3NDY1LjA3OTI5LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732867464; x=1733472264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QWjaF82ZtLmSToo0JDa/Cr4RjUnoJ84M74/NrDf/FU0=;
        b=Aaox5vAmiL0FjSzl8YFpZiQcGIACFam1t870/6CDlGz0AfRFTU1oEZNPT3/HIdPjMJ
         03aE/MiMNaBdOXFKzh+OMKxyewy7DK0LmaWjKwstkjlmqnAtLUW7/nyux8Sotw7o9ua3
         wuxJ5LDhy7r4nhxEGjV1i46MmCCb4kU5Xzcq8jlhLH9OYs/C0GF2GxmRJT68RrdcQdtI
         fm5hG6odsqu8en48Yitxi+xYSvdotYs5D9bOLDJ3ak7E9IAN2ZO9xhzHQA2OWqOqZDP+
         fJHk8r3IxFVGtVBeJTvtAOyGWVqvVnqedVOCV7s7Xt15pdkxodie6t+9KEMJ0E0r0H8x
         cyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732867464; x=1733472264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWjaF82ZtLmSToo0JDa/Cr4RjUnoJ84M74/NrDf/FU0=;
        b=KqtFQBNfsg44D+ul2golbPVWdCw1FQK5NN60YQVnn3G9K+bsDri6SH88hK8vLNpDqz
         sLR/a5cY5q7OPV2nwUsMHzNV0AOPI9mC8pVOlzyUNThy+lcH/f/2Q1gz1aLOLw8pDkUO
         k3nCFCm2KrTK9cqhB4H/SgwYUSZMAWxHCNwlr4UAdplUgKE/7KGL/ne0GNyNVrrwpzZG
         HMzsyl4YUfDymzC3MDtm27JjbKk6nVAMvCJuCGMiYuJ5yleiMOOe7yuyL20UCDNKZzXj
         guUP+pBJy9A94GI8UiOdQTnAbFLCfHjlLIruJt949WBuyppcszzOUivIuXgmPO7clca2
         JzfA==
X-Forwarded-Encrypted: i=1; AJvYcCUKnp3haAJgMNr3wDpVGxTi8Ua9afmB/6GU4m/KO4S3nBmB3Otumg+Y8JxkjuX//H3dkW76bBA1Gog=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye2Arpx4WZ2GuKQzGoUIEqjalVNWOmGmtKxyTeeIeH0geWROTQ
	q2K1TiDGIefSpeclmoI3b9CTAqUuz/c6hEVuc7vN/uKgFkHl/IY+wYaTklKgcA==
X-Gm-Gg: ASbGncssC5PzHYnvSWGiuzlNAxjDd8vlZfln/cDVYbsRIgj5wDVyAnqx4Ixe5K6bC9c
	Xqop6nAri4/Nj83gLyJBvl0yTnw+LlpMFdM9KnGnmMmqQIKR0PgBbPXd5WeWflHpNfV5YduQ2Wr
	vi0dpesHivOsRBFoOLI3ThnakHQac5zqml1kDGbtVHPtr2fAcPutvYJG6XFN007gPaz920Iv8CV
	wFbBq2GgL03n0CVoWpy+Gp1MvB34WPrMWm+cVPN9ACLgH3CrNlWzU1S5ewrLv8sE8fQD790qj2j
	wad8aNcQfPFpk9lgh/Kl4oyyUWs0fIJ2AtQ=
X-Google-Smtp-Source: AGHT+IFtDz9pIyuqbzpHg18zY1aErvP4728gqniT6CLubQyYXBg0LZ/qIkBr11FVTm6Vb63/YVed2A==
X-Received: by 2002:a5d:6f06:0:b0:382:383e:850e with SMTP id ffacd0b85a97d-385c6ebcb69mr9036631f8f.13.1732867464381;
        Fri, 29 Nov 2024 00:04:24 -0800 (PST)
Message-ID: <d8bdd084-3e0a-40aa-b829-534219b24df7@suse.com>
Date: Fri, 29 Nov 2024 09:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2024 02:49, Volodymyr Babchuk wrote:
> Provide -target and -march explicitly when building with clang. This
> makes cross-compilation much easier, because clang accept this
> parameters regardless of host platform. Basically,
> 
>   make XEN_TARGET_ARCH=arm64 clang=y llvm=y
> 
> will behave in the same way if building Xen on x86, or on arm64 or on
> any other platform.
> 
> -march is required because with default value, clang will not
> recognize EL2 registers.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  config/arm64.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/config/arm64.mk b/config/arm64.mk
> index c4662f67d0..97eb9a82e7 100644
> --- a/config/arm64.mk
> +++ b/config/arm64.mk
> @@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=
>  
>  CFLAGS += #-marm -march= -mcpu= etc
>  
> +ifeq ($(clang),y)
> +CFLAGS += -target aarch64 -march=armv8-a
> +endif

Why is this dependent on (just?) $(clang), not (also?) $(llvm)? Also
this affects both toolstack builds and hypervisor. Is applying -march
like this actually appropriate for the toolstack?

Jan

