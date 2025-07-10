Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FE1AFFC1B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 10:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039204.1411150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmaA-00046K-EB; Thu, 10 Jul 2025 08:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039204.1411150; Thu, 10 Jul 2025 08:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmaA-00043G-Ba; Thu, 10 Jul 2025 08:24:42 +0000
Received: by outflank-mailman (input) for mailman id 1039204;
 Thu, 10 Jul 2025 08:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZma8-000437-Kh
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 08:24:40 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 512cf1ed-5d67-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 10:24:37 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so613258f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 01:24:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3eb4c35asm1500256a91.31.2025.07.10.01.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 01:24:36 -0700 (PDT)
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
X-Inumbo-ID: 512cf1ed-5d67-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752135877; x=1752740677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rxc5gpo5k7kaiqtNet2+UNMZsJ4FozBxO3c8TKnftr4=;
        b=esyET4DimQri8xjbOhGPE4gyjnlAIvxPPTG+4gRBD45c0s/jRA5b8Z9hQGYcu3vTQy
         Xq63utYr0Ow+ZRrl/dgJjLRGjEZJZGL66HTxQni9NLunxxq+7sINMacOOz/Lyft8dTHf
         +wW1rliqx81+38jk2gcVgM6wx/6UA3MgQVmbfFBinvyRZGE5GYdB1oW0kkAS6B/eTNYz
         j0X1mI63jo8yjzRsT0kkl4gnYr/Y/fWSvRmdxh3whNLYq1IyvNePXpovM0COroofUbcV
         6xhPMCCZFPmBqSs2fK/X1+JbJl2TQ9HpCXhGSKG9Irf2Dz0N7rmFdEpnC3uATNuh34Rf
         8hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752135877; x=1752740677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rxc5gpo5k7kaiqtNet2+UNMZsJ4FozBxO3c8TKnftr4=;
        b=u4N9FGqJtYXA3ZB17cm7s/0by7uOHiC74CGGGh737V9RQTU2ScRN5H6Vfx7jaJyJSd
         MU3+DeJ8on293i/tZeYbyegqgNz4S60mpIg6CpYJwGspY11c4MunpB2HIOBK1ukrNLdx
         xIBwNUDqn59g3GzZNCxnBasPnllqrlpnMwYt6IQzcT17gFUhlqDCELbXCdm4bQn5TBR5
         OhfVK8rotlkqZaKAhC6HfiZ7p7vJqRSl6bhyVWV59rKOtulLB/beoO2uFuUI/fwQRzq/
         rZ9Oy86l5N85N+aNBMWfS6PCWKysId78VG/RW7pCKyfZ3mjUTgw6DunKJ2PRIXBBy0hJ
         8CNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvwMXfiXPbSwO9Z1ZIHmtqzkWc+eF7eULRnSUoy2roUqubGu7XMaN2J95Mq4V8yMd1SXJocVvaXkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/zsdMczlB088McHn4FOG85YNiSAtdTXOBTkt65DDz8SaUEXrr
	A4t44jw/is2JvYvPdPKMjZkJXlmK/S7kOrLksR8ST8JAOcy/IMouYh2Fi+ew4iI/kg==
X-Gm-Gg: ASbGncvTs/fAWhWLCLaJGl+ogpvz0bRrObLn09UDl3cA9S+jPMfFly8Ve0S4HMNG/Tm
	XryDxFzbuQBZl7zHR3GNr1s+Dxb1df9pAmJVgg9Aeo6zz3ifFjbR7MCqCkOSTcotee4uGsHxvye
	n6+RI9WLF0pEHoh2njYgUsUWPa/iAtQa4cXMzhAKK5EmuHDKdWiOw06xGe3eLEWF8xyegA1lH+4
	ein4PSLRjdpusIgMsG6fbGP/1B/fVWEJVgSFQ8ey3SgJ+Rh5HafWeQufMdJcqUC5C/v74T+9qRN
	t72eJuBwESkV+qPYDxqKxc7yXV17blGVX8PvnyXJxYPkqRcZRYTLl5w0l3/MDpKUsnaQi6dvrOJ
	K6N+hbvf/8R4TZB+ba/8zYcZjC1e/SWigqCcLzX7dNjbdEZg=
X-Google-Smtp-Source: AGHT+IEuDaoMdTQpdwOn3TI8rIdsXzpSUOjGC/Qn36K2yIRsWjye/KNYqPqf+rC7evtLQOGbDssVvA==
X-Received: by 2002:a05:6000:2511:b0:3a4:fe9d:1b10 with SMTP id ffacd0b85a97d-3b5e452ed07mr4833441f8f.45.1752135877149;
        Thu, 10 Jul 2025 01:24:37 -0700 (PDT)
Message-ID: <ca2c4441-2ae5-4569-aa86-9c51d1bf864f@suse.com>
Date: Thu, 10 Jul 2025 10:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: force compiler to use atomics when coverage is
 enabled
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250709201154.235166-1-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250709201154.235166-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2025 22:12, Volodymyr Babchuk wrote:
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -55,6 +55,10 @@ config CC_HAS_ASM_GOTO_OUTPUT
>  config CC_HAS_MCDC
>  	def_bool $(cc-option,-fcondition-coverage)
>  
> +# Compiler supports -fprofile-update=atomic for correct SMP handling
> +config CC_HAS_ATOMIC_PROFILE
> +	def_bool $(cc-option,-fprofile-update=atomic)

I don't think this is needed, you can simply ...

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -141,6 +141,10 @@ else
>      cov-cflags-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
>  endif
>  
> +ifeq ($(CONFIG_CC_HAS_ATOMIC_PROFILE),y)
> +    cov-cflags-$(CONFIG_COVERAGE) += -fprofile-update=atomic

... use cc-option-add here, I expect.

Jan

