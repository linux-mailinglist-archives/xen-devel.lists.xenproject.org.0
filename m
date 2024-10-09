Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD3996F2D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814764.1228435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYID-0003e2-KA; Wed, 09 Oct 2024 15:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814764.1228435; Wed, 09 Oct 2024 15:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYID-0003bD-Fo; Wed, 09 Oct 2024 15:08:01 +0000
Received: by outflank-mailman (input) for mailman id 814764;
 Wed, 09 Oct 2024 15:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syYIB-0003b7-TN
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:07:59 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4533d465-8650-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 17:07:59 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fadc95ccfcso78123641fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:07:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c92a32bb5dsm498217a12.28.2024.10.09.08.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:07:57 -0700 (PDT)
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
X-Inumbo-ID: 4533d465-8650-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728486478; x=1729091278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uQkoQK4F3b3nmkXoMoo3H36UcEr1eB+7dfYstLib3zI=;
        b=QY+EbD9Hs5n/3dQFGLqpkRinFQEXr4ZEgPR7FxjJKAMYRcoAB+ElKy14UHv7mEDqOS
         Nb4FcxASRGnCkPcdKzdc2LJ8FNohGYD98OhOJPJ81XhB1nPdrQkFrnka/8kHH5p0PUJM
         7uk6nXgzmwnS8wA4cNDIXmfPBxt5/bgNjuzOqM6VRwPZHUSWeuZUglm2FLsSdOk/MXIZ
         J2GqG6uvBLgl9XuqTK93lKR/9PKC6s11Zxm/hAu7r1jmVokWqr54gOYgNOSJgF4+ffxc
         HQtTXzoQAogTtleclI0T0Scv8rAfvgSghZtUD6GiiIp+0WmfvLoeUuzaFMMxzSiYl2C8
         5dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728486478; x=1729091278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQkoQK4F3b3nmkXoMoo3H36UcEr1eB+7dfYstLib3zI=;
        b=qm7Fb1ZlYCNJgLNqk6oujfTER3bS4CeAo+jgn5OoWUPYT6DfAwRFpNLQX4MaRWsPQd
         msw+ZGwraa9p2IMUvdtCSAulcjEIpkkmKXA51POx/ZWxX+1hvNpqcUF4nJtHR6f8Z9hk
         fQR2Ik1r99cc4RMg0/KQupgBtWI44J4/xVmm178Dk5WQD8+5unatdPxNK5FynT6Y7hJe
         UFadWblsaYnk6PvFmrI/8EMKM/YYTI+Fv3q7v+oHxJ0ZlnTWccbwLQfeplHc2obbXP7j
         Z33jdt/flSvH2eP3eLD9NJh3x2pu1rWh/DCaH1NFxDKNB8oN7hiCCufcsytSYhjrbJRl
         wfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbGUvUQqrmt1W2iTcQMZiwqBtkiHxk9aFJBPYWFt4nCojpsdat2nAWyhCIZMhmRjG/OlS7GjTaVKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6KRgeYAeY9OKDZxT9SuZ4HZ6NNxN7edVVhG4L8CdT3JB3DZ9b
	TzymogX7LpSH0c84Vk2IV3JQLtcJvL8kFouwImELiYaR0b8xY1ED93+TXLO2sg==
X-Google-Smtp-Source: AGHT+IGcbTGC3n7DyAFIETr3ZeA+1JgR4bdYEGCCADWy3WuCgWuLC6chmb2xcdrisBf3dPp0x0aYUA==
X-Received: by 2002:a05:651c:b0f:b0:2fa:d58d:dcf3 with SMTP id 38308e7fff4ca-2fb187cd62fmr20865261fa.33.1728486478222;
        Wed, 09 Oct 2024 08:07:58 -0700 (PDT)
Message-ID: <edaf2302-ae68-4c05-b8cf-1613ae9d4e7b@suse.com>
Date: Wed, 9 Oct 2024 17:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/44] x86/boot: move boot loader name to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-3-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241006214956.24339-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.10.2024 23:49, Daniel P. Smith wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -285,6 +285,9 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>  
>      bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
>  
> +    bi->loader = (mbi->flags & MBI_LOADERNAME) ?
> +                            __va(mbi->boot_loader_name) : "unknown";

Either (noting that generally we exempt ?: from the operator-on-earlier-line
rule)

    bi->loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
                                               : "unknown";

or 

    bi->loader = (mbi->flags & MBI_LOADERNAME)
                 ? __va(mbi->boot_loader_name) : "unknown";

or

    bi->loader = (mbi->flags & MBI_LOADERNAME)
        ? __va(mbi->boot_loader_name) : "unknown";

(in the order of my personal preference).

Jan


