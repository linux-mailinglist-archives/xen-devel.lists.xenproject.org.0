Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78765A79D00
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 09:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936271.1337561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0F1u-0004lq-5s; Thu, 03 Apr 2025 07:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936271.1337561; Thu, 03 Apr 2025 07:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0F1u-0004kB-3E; Thu, 03 Apr 2025 07:30:26 +0000
Received: by outflank-mailman (input) for mailman id 936271;
 Thu, 03 Apr 2025 07:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0F1t-0004k5-DO
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 07:30:25 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80eb6df0-105d-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 09:30:23 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so385882f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 00:30:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d66csm1016652f8f.63.2025.04.03.00.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 00:30:22 -0700 (PDT)
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
X-Inumbo-ID: 80eb6df0-105d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743665422; x=1744270222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WLWyeffkEI0DITwT1h1JvghkPyY+DnSQcGtm13OsIPY=;
        b=faODUXP9sAUolS+JqZE1ocuVgcCC5pa5X/EeC+uFVtdeS8RMF0fgRjE0LYePUl2ohJ
         0Ewe6+NMzBGWBu21tcPktJVkAamsJ+8JWRkTVfgwOylIUrF6OjKTmJbZBxsUqPZeSxOL
         Zl27QykuNIgZg/8eMmhh3XO7AdGMvsPQolY/ZmWlDzKvX3hMS4ds4dgWtIRxKXybhdEG
         i35Ft3Jp1LR6yFjQoxSibBTwTjqSODRbiuEsWgqUgf9wHmJ1lERd81e8+LtkesjQ/8un
         Ce5of/Q07qxqo3ZTEcfkqDkLHKN3acw6Q91d1N5FsqkiVtDs3U1xt8q4t0plj4acxe5T
         D4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665422; x=1744270222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLWyeffkEI0DITwT1h1JvghkPyY+DnSQcGtm13OsIPY=;
        b=wJ9yi8wd9QEdTj4V/T87rosLdxc2VvukgW3M2vCl+UlEaAwj8z5InYceb/ZXVE5jQb
         v7mLnPHPHjQzbOdjnxm2UfKXLw41gCkCdz3zb4E6IGm0vsbyhRj1Rfz+fV2ifAlgx1PE
         0u6oH4N3p5NcW17McYUlwT1/0AVdeVTNxsutFMeaIMVwdATUXBC1rN/mynVXXWQdv6lk
         +O1EhUB8wXDDPOGl40LouKlCRNZoMgujEJ2EYRxADYgA9ySGheudFipGrajNL4zknu3N
         mH7SRdYg4Ct5ctjnAAE5MTKaDvw8iwpORVROcyILb53PfxE+09oLbtHUyPoyRPQZSAUg
         pRqg==
X-Forwarded-Encrypted: i=1; AJvYcCUb8ZO6PVHcPj4c+QdO+E3ulV5V1G0OEv000kWXkAAFYu9g7haCJbn8FLcM/6l+5DWHD0Z0h9In9zI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7bzLgQbLLrB/Hu0RJ0n/RUKH9sW3tREabPs+XY0v/NUIjtS4V
	NMac9ex45UzL0bOdaMe/LkP01geFZUUgznrOO41AogHYTiR6J09vsTNjX8yVLg==
X-Gm-Gg: ASbGncsVlIT/Fe1PVCHMm6s4DiUnVfLu6hesKcOhK+HDY9qp9XFm5kom3MJOJ0M1Ank
	y8pnxESYeyHiPaDvKok9lSrxoLg/uUlCZmGOXdDGiHMwOqCH/P141ln6pZBqVGLXyFq1XiuJAr5
	Uo03Osme9Amip2hTAZmpZHTF0sCJNkoDrmpZ0T2RoX37avYFh8uQNpIltX0+4XqzUmrUQ+dTL0A
	dtZYYQNlKU4cNoXlJ9kbCpWRaZecZ6pvcuEL1OH3r7IqOK2Tfutb5qEmgTH/ihy+BJSZIElftrd
	faIl1aEVwxG4+9VV7TpN5Gb78Y6lhbllfYVsCOhcJMmJ1jqyKZjeaIQAfi8IjKWw11cKYZhFXIn
	Tv1ypuhJUEkDg515xvwmgawOtOXcrSQ==
X-Google-Smtp-Source: AGHT+IEe+nqWenyWmQiQLZXrNOOwcxZfDhlSn2kN/vQOMtNmTB7oh+JYwvT7gwwMeLxTFTsukuTqgQ==
X-Received: by 2002:a05:6000:1acf:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-39c29752f9cmr4542091f8f.15.1743665422542;
        Thu, 03 Apr 2025 00:30:22 -0700 (PDT)
Message-ID: <7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com>
Date: Thu, 3 Apr 2025 09:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
 <20250401011744.2267367-4-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250401011744.2267367-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 03:17, Volodymyr Babchuk wrote:
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -41,6 +41,11 @@ config CC_SPLIT_SECTIONS
>  config CC_HAS_UBSAN
>  	def_bool $(cc-option,-fsanitize=undefined)
>  
> +# Compiler supports -fcondition-coverage aka MC/DC
> +config CC_HAS_MCDC
> +	def_bool $(cc-option,-fcondition-coverage)
> +
> +

Nit: No double blank lines please.

Also, just to clarify - until the use of Kconfig (alone) for things like
this is properly resolved one way or another, I'm not going to approve
such changes (but I'm also not going to veto them). My proposal [1] is
still pending with no resolution, nor any counter-proposals.

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -138,6 +138,9 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
>      COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
>  else
>      COV_FLAGS := -fprofile-arcs -ftest-coverage
> +ifeq ($(CONFIG_CONDITION_COVERAGE),y)
> +    COV_FLAGS += -fcondition-coverage
> +endif
>  endif

Personally I find ifeq() uses like this unhelpful, and would prefer

COV_FLAGS-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
together with an eventual

COV_FLAGS += $(COV_FLAGS-y)

(if we don't already have one).

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2022-09/msg01793.html

