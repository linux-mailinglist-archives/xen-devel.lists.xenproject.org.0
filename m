Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B1A7F50D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 08:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941432.1340920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22Xp-0006km-0R; Tue, 08 Apr 2025 06:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941432.1340920; Tue, 08 Apr 2025 06:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22Xo-0006iU-TY; Tue, 08 Apr 2025 06:34:48 +0000
Received: by outflank-mailman (input) for mailman id 941432;
 Tue, 08 Apr 2025 06:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u22Xo-0006iO-B5
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 06:34:48 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9001a545-1443-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 08:34:46 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso56249725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 23:34:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364cb9asm150060515e9.31.2025.04.07.23.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 23:34:45 -0700 (PDT)
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
X-Inumbo-ID: 9001a545-1443-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744094085; x=1744698885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5suODX7RlXxL1uSO92FQFSVYUA5Y5L4ZI857o/bKh3g=;
        b=XodaYE2YL4xNmFwQvm52ZQTo+rUlvkTv5HZBPsth38kscQ34auEnioL5NHQ3cKXBJj
         nvoEkLUu9h4Uwa19YwZdGSx83ypepf3uWCKi+M4LCisXQmFynfQ9MHnCbgxQMmqMQ6Nv
         mmEtw+qUzJutP+yJfX8QwvZ44eL6HdJQjRg5c4UTVRIW/pK5HzHvV71HFaSi1dM3I511
         JtqXZszxDKYYtKrq62Zp/fxHOW+p6RCpiE6p6ENSkTlYfH7hMUoptxF8jBg/SuKjm1L2
         bKmjyoSILsHle2u4Ouptg0iewE718drhVEDWCMNtNesgvvvk+1DMBU4p9Jzx/KBYeYZA
         /Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094085; x=1744698885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5suODX7RlXxL1uSO92FQFSVYUA5Y5L4ZI857o/bKh3g=;
        b=PrdBKA53OzR3yYv4tGenyVyddFF681BGnt1ezOD4cBC6oFnmw7vFTlsMppzQOj2sMu
         GEu2A6JdtQCsfdUtMH28JkucEbUIIHqD4INnccKhtsnHcqGs9HGx3shvXrdTD1RNm1Ne
         9SlAhfRFL5aj605BsZBdd57fiVnnL2Avgo5dli1K9UMvbSRUydVkn5Li9BgVwZSY4P0d
         AEjMQMVvBln+G2STCOo5kH7yNrCr3fx2mUIuYM5cyzq8TBspxMm3c69/vSqcgcB0zlQf
         BqnpLzZX7omy+FmJoc8nzYFIrfF4JxfI5a2Uz57VNWPu+OwMQDVzpvWuy38EH8l0K1oH
         koAw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Zi5YJwoDNQv3NAPbMnZYrdGTWmqFSDrUPMHNu3GAGyxW8NqiyBZwlkN/5vsNfBmKbRn6Wqh/8j0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVzcYQhweKA4cEHyEWG+VVuxqiR/mxuuLQLPET4mA7yozGVyyV
	xb4tqxdUsB++6wOpF9jxka+MFlsafug6/UmHn0ubQqU5J3MCEV2ow3OASneUCw==
X-Gm-Gg: ASbGncv8u6zJHGR1yrYNfkAKXOXnz0Q/vtHNVixCPtFISlEhx5i3iQDEgYcHdsMhdRb
	6G7qy1bTCOZr2MoeMwE8jm8JW2JJ7V3Q5J0WGTVTS1aY6I5ePPJmYzLvpBP8bb8bd83gB+nEeyQ
	DYgUN8YB5c0fZ2hLpd4O0rrizyIdRQfjV6jidDEdGC/ACNbLixNkSaOiKWAvbKQarSrqehr9oK2
	nFxBRPVIL0lWul8hNuBkV59isdIyo2paxr+yYpUovepmRkXYSmZ4jmEA4qhujJmYOoNlHYylEsO
	iH7ZTP64pUnbRwdzHu53qzDdqVYu+Jj47gpusZFrmCRU8y7HiR90I/Oy+RSfAwaMOcZ3qyO0kXe
	wAFLW8ikCD+TTxDBYWUvL9U2QgxP98w==
X-Google-Smtp-Source: AGHT+IEyRL7sLG+jvJpNUCP50AZlfcrJP22EvnuWGX8n+FShen3EZOw+XNUOPmXRx2/yW1jTAtyTOA==
X-Received: by 2002:a05:600c:34ca:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43edaef7167mr107095415e9.27.1744094085620;
        Mon, 07 Apr 2025 23:34:45 -0700 (PDT)
Message-ID: <abf11b31-0bf0-4add-a49a-17d7723c74f2@suse.com>
Date: Tue, 8 Apr 2025 08:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen: debug: gcov: add condition coverage support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
 <20250407164608.2558071-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250407164608.2558071-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 18:46, Volodymyr Babchuk wrote:
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -31,6 +31,7 @@ CFLAGS-y :=
>  AFLAGS-y :=
>  nocov-y :=
>  noubsan-y :=
> +cov-flags-y :=

Personally I would have put this slightly higher up, at least ahead of the two
no*-y. Thinking of it only now (sorry), also maybe cov-cflags-y might be
slightly better a name?

> @@ -133,19 +134,18 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS
>  
>  non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>  
> -ifeq ($(CONFIG_COVERAGE),y)
>  ifeq ($(CONFIG_CC_IS_CLANG),y)
> -    COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
>  else
> -    COV_FLAGS := -fprofile-arcs -ftest-coverage
> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-arcs -ftest-coverage
> +    cov-flags-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage

Why's this inside the remaining ifeq(,)? Surely there's at least a chance for
Clang to also support the option at some point?

Jan

