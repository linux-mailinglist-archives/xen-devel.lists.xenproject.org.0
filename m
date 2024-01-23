Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E667D838A33
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 10:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670306.1042968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSCz4-0008FZ-7Q; Tue, 23 Jan 2024 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670306.1042968; Tue, 23 Jan 2024 09:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSCz4-0008DH-4k; Tue, 23 Jan 2024 09:22:18 +0000
Received: by outflank-mailman (input) for mailman id 670306;
 Tue, 23 Jan 2024 09:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSCz2-0008DB-DP
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 09:22:16 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55d579d-b9d0-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 10:22:15 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50ec948ad31so4572993e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 01:22:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g9-20020a056e021a2900b003627b32dcbdsm1479457ile.37.2024.01.23.01.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 01:22:13 -0800 (PST)
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
X-Inumbo-ID: e55d579d-b9d0-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706001734; x=1706606534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UAU2ewVq//0Fi9u+Ur8kwLvu3uT4csuFqOyzJKs4X/4=;
        b=YkKXMUG5Og6gSYD9k8euNvLvlNMVvGlYRG5Q5xlN/TEWjS9ZuSXp7Ioz93RMyGnhA0
         cyttTw31ivy2utgVAQnnJ9eumyla0iq+wDBMV0FTFj/IPOEr6GTBI8eZ22eRu734FBcF
         C7IWD4iQppZmzKADxl3EN8QW6jV+bNMAWfQfNotFggP6LB8PBCwdCxPefU8mUWgj2vp9
         phfVRf/XYp88azfMn7PkygUgP1oY2xyjJgdb12bBUr2hUGYdRItkhAM1ax/4JnbvVNlq
         vJ+GA0ZzZXxKCHc0utFow2gQ+H+lxaf6pK8T1/LtgxlsKJf6JjeNcwyptqvgs3kbO5H1
         hZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706001734; x=1706606534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAU2ewVq//0Fi9u+Ur8kwLvu3uT4csuFqOyzJKs4X/4=;
        b=uXU33+abQrBKnyCqUb1CFbXjIgk4nUTrb7u/GHXBr9g99VKtXuFidCLp4gb1+TDzHn
         hTVEH6wQpbxX0eWYCcv6xzWQDmH2mx4fSlrMR9dGJT4ZWXjIn2Fkb58BuRS56NktZZT7
         R2c/dJfeOfen2fmyytXSfp4ScjA37jpUt+rqqKT43/b+r/uWl4+kBv++B4FIexlLjuiU
         k85OCtuUIUOVkTRpEN1TiXkTsXQ2LC2fRClQ5af7ixgc6Da3k6XmwXh6M4FwI/7h3FJd
         7T6Z+a1aSNqhKmuv31aCKTb4mqUGX0BjVvAZKi3v/MgVWbZvfFzychLalMfq2j/5Rlk0
         R4pw==
X-Gm-Message-State: AOJu0YxWrBDncaDSejCzFLGUu28kZ8NZaFZTmvpc+OoUw5279/+JHBgJ
	Pu53AHcRuE6mpymde+4Ysai34bNLjwK1N0zi0GPCvAhAM8vO0CWEogaXn7bvbA==
X-Google-Smtp-Source: AGHT+IFNKpXNC2ytmUg0S1W+qxCWIxnTOX83L8CENbTI7G3LPBpbMlTJvTbu+sFmgfc9D33vYZCrig==
X-Received: by 2002:a19:9141:0:b0:50e:e1e8:6cb with SMTP id y1-20020a199141000000b0050ee1e806cbmr2125402lfj.3.1706001734285;
        Tue, 23 Jan 2024 01:22:14 -0800 (PST)
Message-ID: <0edeb969-6fef-46f4-b216-0858edbaefa6@suse.com>
Date: Tue, 23 Jan 2024 10:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/entry: Make #PF/NMI/INT0x82 more amenable to
 livepatching
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
 <20240122181714.1543738-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240122181714.1543738-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 19:17, Andrew Cooper wrote:
> It is bad form to have inter-function fallthrough.  It only functions right
> now because alignment padding bytes are NOPs.

But that's a requirement anyway in executable sections.

> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -29,6 +29,7 @@ FUNC(entry_int82)
>  
>          mov   %rsp, %rdi
>          call  do_entry_int82
> +        jmp   compat_test_all_events
>  END(entry_int82)
>  
>  /* %rbx: struct vcpu */
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index c3f6b667a72a..fc64ef1fd460 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -723,7 +723,9 @@ END(common_interrupt)
>  FUNC(entry_PF)
>          ENDBR64
>          movl  $X86_EXC_PF, 4(%rsp)
> +        jmp   handle_exception
>  END(entry_PF)
> +
>  /* No special register assumptions. */
>  FUNC(handle_exception, 0)
>          ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
> @@ -1023,6 +1025,7 @@ FUNC(entry_NMI)
>          ENDBR64
>          pushq $0
>          movl  $X86_EXC_NMI, 4(%rsp)
> +        jmp   handle_ist_exception
>  END(entry_NMI)
>  
>  FUNC(handle_ist_exception)

Hmm, so here you (partly) do what I was meaning to do in the one patch
left from the entry point annotations series, "common: honor
CONFIG_CC_SPLIT_SECTIONS also for assembly functions". However, I'm
wrapping the JMPs there in #ifdef CONFIG_CC_SPLIT_SECTIONS. Thoughts?
I view the JMPs as pretty useless otherwise, even if there is a
small risk of a future code change not respecting the ordering
requirements. Yet such would be noticed pretty quickly, I suppose.

Jan

