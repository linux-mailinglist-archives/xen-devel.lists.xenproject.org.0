Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE38796AC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 15:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691889.1078424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3NA-0004wo-Qn; Tue, 12 Mar 2024 14:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691889.1078424; Tue, 12 Mar 2024 14:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3NA-0004uZ-O0; Tue, 12 Mar 2024 14:44:56 +0000
Received: by outflank-mailman (input) for mailman id 691889;
 Tue, 12 Mar 2024 14:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk3N9-0004uR-F5
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 14:44:55 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1622185a-e07f-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 15:44:53 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so5694566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 07:44:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wk8-20020a170907054800b00a46021ef90csm3646751ejb.107.2024.03.12.07.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 07:44:52 -0700 (PDT)
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
X-Inumbo-ID: 1622185a-e07f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710254693; x=1710859493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xz85V7dr+KazXifa+zWdglCjBgOJ02wy4vGnNj+JMG4=;
        b=dnZaz3eyMgXpyKJTZJbyAmX0O7e7iNiwh57ct3IVLCtfz6besni9NAsJR6UzqW8Dcb
         KN0RsCwuZlaa3LZsQX5GHjlEnnZ5OfWgwznD2NxYIcn8xblHdgmCyeFbQVEDcxVfNBw+
         GSs+IuRld6mE31XWU+gc9QS6LylV6hsbqwO/CvQKSr5CjYnyZZ/hUhgzN0VOnNW6XuSe
         z+p7zSnl36N4lD5cljN5c3YgTJWbWuk58ogcJmi5Wh0Pq4N1fdB47nD8I1LtoSu5hVbv
         g60Z8Sh33H2muIAN0awsei6w5iLpp5lJ8wANosUfCWeuBxIkR9F5uLrizGcZm6lAxNJg
         pCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710254693; x=1710859493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xz85V7dr+KazXifa+zWdglCjBgOJ02wy4vGnNj+JMG4=;
        b=UH8W5DtkYYAu9Ztu2yUQ96bz/BnJdOtc66E0gDgZWxzOz3CLVcpYee1NDFGePef9DQ
         oBYWkmmPcoNiGhgkKwQV70Y+O6iBedmw1wI/A6GkEYIRmkM6aT1KuK50HLWnrfgcKmLl
         3U8hJxl403XcXyXiVxwbYNfOROL6VjCAH7Tc2rZHZ+JLxnWTxTVit/4mWiFqU3j5ZIGt
         /p2L8FiPSHj2NTKnW1GFWF3mk5Ba8qvq+nBETcWevr2Pf5RVuEvcN3SDUfrM/i8pighR
         CV0UzJr7uGr9G/s2klZvuqHDZ2wYW0CZo+bAWqROIj9Qg1+pncDrkfrHZ6b76OqK8OsB
         zbDw==
X-Forwarded-Encrypted: i=1; AJvYcCU6sRyVe7/8GdFHgX5aOcBL1ytU6HksMyUldd12PevYZjmWsVixXdGBaeQKcqRNSYloJ6J63p0VwOmW6q8NeSvWwoqZ3DqucMnnp9CQVqQ=
X-Gm-Message-State: AOJu0Yzgy8yeezWyl5TwV134pOeAdiRgiOorq46Lm0QnQoTSs/z1/WmL
	QxHRm4kbdugV1dV9DImOSeE3OgozhBPrT9Ft3MN8TCWZHeH6/iaJ0lUzIOsoIg==
X-Google-Smtp-Source: AGHT+IEgx3RM07WB6h6B+eW+MMazojnoti3kW1+aojuxETf9wEGGKR8O9CYRmQe+bZdeIcalsJ43lg==
X-Received: by 2002:a17:906:5a8c:b0:a43:3b2:bcf6 with SMTP id l12-20020a1709065a8c00b00a4303b2bcf6mr379447ejq.14.1710254692726;
        Tue, 12 Mar 2024 07:44:52 -0700 (PDT)
Message-ID: <ac05feee-1090-4002-b6fc-17189bc7fccd@suse.com>
Date: Tue, 12 Mar 2024 15:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 12/16] xen: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <ab967347ae22d662c82962b1fdd6e6449bdd8c5e.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <ab967347ae22d662c82962b1fdd6e6449bdd8c5e.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> --- a/xen/build.mk
> +++ b/xen/build.mk
> @@ -45,6 +45,8 @@ asm-offsets.s: arch/$(SRCARCH)/$(ARCH)/asm-offsets.c
>  	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
>  	$(call move-if-changed,$@.new,$@)
>  
> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)

Yet another instance?

> --- a/xen/scripts/Makefile.asm-generic
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -31,8 +31,22 @@ generated-y := $(addprefix $(obj)/, $(generated-y))
>  old-headers := $(wildcard $(obj)/*.h)
>  unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>  
> +define header_stub
> +#ifndef ASM_GENERIC_$(3)_$(2)_H
> +#define ASM_GENERIC_$(3)_$(2)_H
> +
> +#include <asm-generic/$(1).h>
> +
> +#endif /* ASM_GENERIC_$(3)_$(2)_H */
> +endef
> +
> +arch = $(shell echo $(SRCARCH) | tr a-z A-Z)

And one more, in disguise - why not ARCHDIR here?

> +header_body = $(call header_stub,$*,$(shell echo "$*" | tr a-z A-Z),$(arch))
> +export header_body

This ought to be doable without involving a shell variable, I'd hope.
But - this is a lot of effort just to ...

>  quiet_cmd_wrap = WRAP    $@
> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
> +      cmd_wrap = echo "$$header_body" > $@

... deal with an innocent header consisting of just a single #include.

Jan

