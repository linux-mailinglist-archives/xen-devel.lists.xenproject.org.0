Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A99EE8D1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 15:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856072.1268818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkCi-00082n-3W; Thu, 12 Dec 2024 14:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856072.1268818; Thu, 12 Dec 2024 14:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkCi-00080I-0R; Thu, 12 Dec 2024 14:30:12 +0000
Received: by outflank-mailman (input) for mailman id 856072;
 Thu, 12 Dec 2024 14:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLkCg-0007zb-Ba
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 14:30:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 964fd732-b895-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 15:30:08 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a2033562so4855485e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 06:30:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm4137362f8f.23.2024.12.12.06.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 06:30:07 -0800 (PST)
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
X-Inumbo-ID: 964fd732-b895-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734013808; x=1734618608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PxC+nt1AuYYNJgdbHbEjSDFpsMZk5KXvhCGek25nyj8=;
        b=R6ay6JCYXfpWNVpIrCIB/lWEx/vXkMpLPkHBBF3a9/nSY47AzPG6blZonbyeJGWv33
         m5v10/0bQ53J7p4RPRcpOEutdnorLOT/6YvcHKumTD4NnRDG3H3Buul7Gl/aWzyaiwrl
         gCQk0N7+tAzhDmGre3DUsAG3ejXH4FPjt4rs9Qb83sj/FViS4VezYK5tbMrgXzcaXlGK
         fiYW2cp3g9Gk1mYe0l1ejJGwX/bD+KCtJMZucR66QloeS5kvkyqKMD7IxsFOfy6JhiTB
         QIMYb1x7NJzwMKFmxZZdjYclWhi2mTGdEVK7O5dIQsAhbi8mne9R7SjKjKw+K5VjrO92
         Krvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734013808; x=1734618608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxC+nt1AuYYNJgdbHbEjSDFpsMZk5KXvhCGek25nyj8=;
        b=RIEoqoejdsZnXgHm6GXOQ6XxNNuo4GWY+wUDDTXgv+N3BqI17NUCdW35inN7TPUZJl
         fnlTnDGNQfOk3KERhscqX160cuBy3wmNKgKE8UbbtB61fgxSRu+/DohEp1Atr+9p+8dw
         +CrU+NXoY4xYpimiS4pvF2w6jlGDMPlFr8YVDW8Qt9qWt/A7Kq2/ugg+YsPMSEvCjlIH
         c8jNGtePUKTudEhS/ATtw0fdMsp30xo4P4XAkKhAkGGO28iiR8X/xOamK4nYIAzEKh2B
         Vd83iTSBxnJdgEvhZr92T63ndBvkyharCGJk9OwiDawnpEbeCw1/nBjBh4gIfPRjfSyX
         6XXw==
X-Forwarded-Encrypted: i=1; AJvYcCXtMEcZXw9V3N8apD9HId9Hct2o8XJhg6QJaaDPUW6fAuY3jZvrxOsenxCDlX7bzTjRYyMWRK0CPeE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysvM4EKwgYNtF+I9ZFEmLHPBt2YyAL6EdE19/dGaFv2Pkixwd+
	RFP4bDWxF2BYGr7NjbUrTvdn4SWO+Vdx6NoR0ypNtm4QmKZ5eEN+J25CaTzH4Q==
X-Gm-Gg: ASbGnctltxB4ovpQpPLaXHOG/TZF+Wr0w0kk537jaaDGi255dNv7Yg5nteCWFUR8TQ0
	8B6NvZrdApXErXDTyCR5zryFGU+uVb+uHTeMT83bHLybLJajc7vXqEX8sCqGAel4r3LE/ZtY56H
	X6ejGwDsRv4u6boIPhGIolz7k3pqd8fe9ku9m20DHdeamW0X/tEzVEpGaGpZYXkxlLzI1fIh36T
	n0mB53noK/4p+aYvtPUyiN/7ksrxT5NebMXyF0Lzu3YFdFqhZ/oVJUB/wxvQ9n5dh2lLIsjvvq4
	SpL3yGbqUVUiKUSljApv2Y8ceFe9swHeH95junZvOA==
X-Google-Smtp-Source: AGHT+IGgts9O2Nr/1A4I3lTNWlkzsPhHq8uT+HTgOFuMCl81bvYcinDvDev1NsF2Gca7awtl+pq3Mg==
X-Received: by 2002:adf:e18b:0:b0:385:e429:e591 with SMTP id ffacd0b85a97d-3878768f817mr2872328f8f.23.1734013807798;
        Thu, 12 Dec 2024 06:30:07 -0800 (PST)
Message-ID: <9056a92d-8e91-4f2d-a8f3-5cde378f6c6f@suse.com>
Date: Thu, 12 Dec 2024 15:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
 <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
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
In-Reply-To: <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2024 02:17, Andrew Cooper wrote:
> (With the knowledge that this is a disputed Kconfig pattern, and will
> need rebasing), the way I want this to work is simply:
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 0de0101fd0bf..5d0a88fb3c3f 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -434,6 +434,9 @@ endif
>  
>  ifeq ($(CONFIG_STACK_PROTECTOR),y)
>  CFLAGS += -fstack-protector
> +ifeq ($(CONFIG_X86),y)
> +CFLAGS += -mstack-protector-guard=global
> +endif
>  else
>  CFLAGS += -fno-stack-protector
>  endif
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 9cdd04721afa..7951ca908b36 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -28,6 +28,7 @@ config X86
>         select HAS_PCI_MSI
>         select HAS_PIRQ
>         select HAS_SCHED_GRANULARITY
> +       select HAS_STACK_PROTECTOR if
> $(cc-option,-mstack-protector-guard=global)
>         select HAS_UBSAN
>         select HAS_VMAP
>         select HAS_VPCI if HVM
> 
> 
> 
> Sadly, it doesn't build.  I get a handful of:
> 
> prelink.o: in function `cmdline_parse':
> /home/andrew/xen.git/xen/common/kernel.c:216:(.init.text+0x20f2): failed
> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
> --no-relax
> /home/andrew/xen.git/xen/common/kernel.c:230:(.init.text+0x246f): failed
> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
> --no-relax
> 
> which is more toolchain-whispering than I feel like doing tonight.

Imo the root of the problem is that the compiler doesn't itself mark
__stack_chk_guard hidden (it does so for __stack_chk_fail, albeit only for
32-bit code), and hence finds it necessary to use @gotpcrel to access the
variable. Even if the linker managed to relax all of these, it would then
still be less efficient compared to direct RIP-relative accesses.

I also can't see how we might be able to override the compiler's internal
declaration to mark it hidden (the same appears to be true for other items
the declares internally, like the retpoline thunks or even strcmp() et al).
Passing -fvisibility=hidden doesn't make a difference (just as another
data point).

Playing with -fstack-protector* flavors, I observe:
- -fstack-protector causing several failures, like you observed, oddly
  enough exclusively from __init functions,
- -fstack-protector-all and -fstack-protector-strong each causing a single
  (but respectively different) failure, for apparently random non-__init
  functions.
Taking this together it very much smells like a linker issue. I'll see
about checking there further.

Jan

