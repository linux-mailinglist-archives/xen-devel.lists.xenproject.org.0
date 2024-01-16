Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E682EB2C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 09:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667667.1039155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfES-0002PX-PO; Tue, 16 Jan 2024 08:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667667.1039155; Tue, 16 Jan 2024 08:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfES-0002Nx-MR; Tue, 16 Jan 2024 08:55:40 +0000
Received: by outflank-mailman (input) for mailman id 667667;
 Tue, 16 Jan 2024 08:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPfER-0002Nr-Pe
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 08:55:39 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05099d92-b44d-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 09:55:38 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e6275e9beso23985955e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 00:55:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c501200b0040e77ce8768sm6678643wmr.16.2024.01.16.00.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 00:55:37 -0800 (PST)
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
X-Inumbo-ID: 05099d92-b44d-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705395338; x=1706000138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6TAJ6zjWtLRXEZkSjTX+7HP+Qbx3hDt9G2TlnRtXvGU=;
        b=KukTinMemRFi2F5Gic3nkmcXprsKqTSuqR1gw7J5oGR4zd3jNS8hCGmzg6AF4UsSxF
         b+e0+25eC+OZXoMjL6e5LTrzQqwzUaRCeomL82AzfGAlspvvB/Z6XDQz3cTZoa1vw2s1
         w1y5g+Fm2/z1pP6pWl7BiXfCy01yH9iiin8JqwXezC80HC+5pJnmLW6kziyZHD76Cqsp
         UfL9YPZvj6o75hkB6d2LN3jbfVqXPvtkGdhzvN/Us307+/JrlDoGSYrs0yft8h9SBTDA
         OYG4CUGjXYL9mqXnZ3he4ARwm7/1OhWIqzJE+W9JVbJBfB+TOjyp52UPcvKMYmrkN//g
         jVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705395338; x=1706000138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TAJ6zjWtLRXEZkSjTX+7HP+Qbx3hDt9G2TlnRtXvGU=;
        b=bXKYnJWnh2DZJYPsRTmJhY82X0oddGw61wojqt3h5ByOu+7sQhGnZ1CdyUySe5CRom
         ibcdit+ZXARfxq+kv436e0LpYRUatMyyJ3+u4XQ78hH83AVlUFrXzHX5Ud2de3PdjZvf
         Pt3YqW9JHvVQGwRj5rYKlHOP6DArKwyuffwh8L/IFYRWjhoNwOjC48VwMNRDAa/5YtUz
         4tKNyBW6eE2aLG8HVpKk6GdjttcsyAZqaVo+KnXxpK38BFxippgHFbD3y6rEkamm4+ih
         7Auw1JfhfW2BR/GQyC/SbQz62W0RLRW4O5oFp3YdPzzTwJjoP6F9jkmP241/RNJWTZob
         W1wA==
X-Gm-Message-State: AOJu0YwuOYv8+sYoOTMjEEn1441ZmmvZXdAvYbv7yepLrgiPe2yNRg21
	+uvqArqKj7wtH3gNzbcoX6G8KS2+kxpZOyUtsDJ8bfRY1g==
X-Google-Smtp-Source: AGHT+IGQbJv5tKt80iP6Bbmne5HWOK5QYrp1GRTDHDIAhgIEgBTXYE+FM5Qkus9ggNELqgxa68cOkQ==
X-Received: by 2002:a7b:c856:0:b0:40e:56ea:d9c3 with SMTP id c22-20020a7bc856000000b0040e56ead9c3mr3369722wml.47.1705395338138;
        Tue, 16 Jan 2024 00:55:38 -0800 (PST)
Message-ID: <b4532c37-1caf-481a-9621-ca4754a72ee4@suse.com>
Date: Tue, 16 Jan 2024 09:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/CPU: convert vendor hook invocations to altcall
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ece45cf6-51c8-413e-9963-21144fe64f2a@suse.com>
Content-Language: en-US
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
In-Reply-To: <ece45cf6-51c8-413e-9963-21144fe64f2a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 09:41, Jan Beulich wrote:
> While not performance critical, these hook invocations still want
> converting: This way all pre-filled struct cpu_dev instances can become
> __initconst_cf_clobber, thus allowing to eliminate further 8 ENDBR
> during the 2nd phase of alternatives patching (besides moving previously
> resident data to .init.*).
> 
> Since all use sites need touching anyway, take the opportunity and also
> address a Misra C:2012 Rule 5.5 violation: Rename the this_cpu static
> variable.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> With LTO it might end up necessary to tag as __used more than just
> "default_cpu".

Yet then ...

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -113,10 +113,10 @@ static void cf_check default_init(struct
>  	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
>  }
>  
> -static const struct cpu_dev default_cpu = {
> +static const struct cpu_dev __initconst_cf_clobber default_cpu = {

... I sent a stale patch, where __used was still missing here.

Considering the intention behind __initconst_cf_clobber I wonder
whether we wouldn't better integrate __used into that macro, such
that we become independent of optimizations the tool chain may be
doing.

Jan

