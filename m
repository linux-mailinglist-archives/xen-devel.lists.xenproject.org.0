Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4486B1BD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686663.1068937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKv9-0002j5-L7; Wed, 28 Feb 2024 14:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686663.1068937; Wed, 28 Feb 2024 14:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKv9-0002gz-IL; Wed, 28 Feb 2024 14:28:31 +0000
Received: by outflank-mailman (input) for mailman id 686663;
 Wed, 28 Feb 2024 14:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfKv7-0002gt-Qs
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:28:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a333572b-d645-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 15:28:27 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-564fc495d83so6579228a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 06:28:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a6-20020a1709063e8600b00a4138c3f054sm1892286ejj.32.2024.02.28.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 06:28:26 -0800 (PST)
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
X-Inumbo-ID: a333572b-d645-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709130507; x=1709735307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldZhWo/Cuxns8dCwcA1Jo6eZxJbm0ahkIXNWTlT4PtU=;
        b=KVc0Vl5TnOgMJHQOckRLmZk67BaIi0r2gxRQda7nNGIa0oEHMvsqy1B73h0ZC1t2Wh
         5i0yJEAle+lb0Ud0/V8Wf3ZEEq8Lxap/UylIDyIpIYIsirs1cHzurxL/NpA4refx+tLW
         PB/SHSnRuwNyvkng2lGXfLUkrEF2jA7X/I/OjfNmBwlgdhK/JHVQZqCBdl1cVpV4v2pG
         jwzqlJqdA72/dKjUtXW888aCOXDKiZobLqgjos0rHJEcM7uMa966c8oELiqtvjZ+Nu2W
         Fk+kshGFq5MYLlCXGRJCZMIYkpP8vrhJV3ziYAWeBDlzqy3HgEKSMvxWKpKR6aNjf9sb
         kxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709130507; x=1709735307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldZhWo/Cuxns8dCwcA1Jo6eZxJbm0ahkIXNWTlT4PtU=;
        b=P2Jq+rvl4Ln/U/mzewyDVDBJ/tkkvsZsjEhkGMBMPBFII+lVhEOBr8bw9VR0Uchdcl
         IznSvHhu2g4aqdwjVvMv2JHozPqJjN1EWjMdFemUDtzj2cNQfrKPRt6WF9YiT1DzOfSp
         l+JOJXL20ybvRTCp994zZr3yWU90IqR6wA6MK/Be5sE3gMoMXUOqvNgnuQ9ZzpYmDgJv
         egTLx3wQ1hujOolneMFds9k8O/V0B/QWxpZW/51HbyPzXNlSpB9IH/5ooGeoYNdGMSiU
         9jCAm2HnjtDHZoytkxH3MFRcjqmgAUFRT5fE0xeh4x4x6e2ozvUyzswvmvNmQLyS7BJ9
         kpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTm1PjNANMXDlF2hIfNDouvrRYsNd/afdmx3mEVyqcf0h2NhoLgsyFgxQbcIIR3PrwCvRGHGZ/f5GHfbjQhYkWiWdjqvYoAsUF2L/RhkQ=
X-Gm-Message-State: AOJu0YyJjLC5/HD9/hIWr0/j2eQycKVj+Re7mrYNqRD29PzEUEAANTr/
	74zIqUSw4rJW01GgnVke5dFauB0GwvimpIcAvs3IBOiBTSpHDy7hk5bUkvksAA==
X-Google-Smtp-Source: AGHT+IHBUm/jGZFOfR7MgLSGeBCXN5WpKcQilJuwQ9wl8rslvwMPiGJwu59f/D2oCPxdXwOBlh/uyw==
X-Received: by 2002:a17:906:8313:b0:a44:1103:ede3 with SMTP id j19-20020a170906831300b00a441103ede3mr925691ejx.31.1709130506976;
        Wed, 28 Feb 2024 06:28:26 -0800 (PST)
Message-ID: <11f0e1dd-01b4-4d13-8137-e86b0975ad80@suse.com>
Date: Wed, 28 Feb 2024 15:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: always use a temporary parameter stashing
 variable
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240228135908.13319-1-roger.pau@citrix.com>
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
In-Reply-To: <20240228135908.13319-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2024 14:59, Roger Pau Monne wrote:
> The usage in ALT_CALL_ARG() on clang of:
> 
> register union {
>     typeof(arg) e;
>     const unsigned long r;
> } ...
> 
> When `arg` is the first argument to alternative_{,v}call() and
> const_vlapic_vcpu() is used results in clang 3.5.0 complaining with:
> 
> arch/x86/hvm/vlapic.c:141:47: error: non-const static data member must be initialized out of line
>          alternative_call(hvm_funcs.test_pir, const_vlapic_vcpu(vlapic), vec) )
> 
> Workaround this by pulling `arg1` into a local variable, like it's done for
> further arguments (arg2, arg3...)
> 
> Originally arg1 wasn't pulled into a variable because for the a1_ register
> local variable the possible clobbering as a result of operators on other
> variables don't matter:
> 
> https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Local-Register-Variables
> 
> Note clang version 3.8.1 seems to already be fixed and don't require the
> workaround, but since it's harmless do it uniformly everywhere.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for function parameters on clang')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm okay with this change, but since you don't mention anything in this
regard: Did you look at whether / how generated code (with gcc) changes?

Jan

