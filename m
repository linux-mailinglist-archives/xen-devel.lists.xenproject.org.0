Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DEA93F313
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 12:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766585.1177082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNuJ-00072C-Vr; Mon, 29 Jul 2024 10:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766585.1177082; Mon, 29 Jul 2024 10:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNuJ-0006zk-TF; Mon, 29 Jul 2024 10:47:11 +0000
Received: by outflank-mailman (input) for mailman id 766585;
 Mon, 29 Jul 2024 10:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYNuI-0006ze-JI
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 10:47:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e793e1c8-4d97-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 12:47:09 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so449385766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 03:47:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad418f1sm486769066b.135.2024.07.29.03.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 03:47:08 -0700 (PDT)
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
X-Inumbo-ID: e793e1c8-4d97-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722250029; x=1722854829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=75tZsRRT0P/pYwpcBW5aVpn9TYPt/uXgIxOkkV6L/Lw=;
        b=AEnjZfWPzB7KQGjz7ZDYDIxUE14rKQgpYpGKHA0e6Pvo4tzXZduBhMHmN7uCnKZT6C
         3q+yBCK2AuANODW2JwnFsUvNoZrUcrqUEKjiqeRraS/pFebibaxA0LHyDRK+yoru8z1V
         ajAu1LMmcFwmA5g4GmVseidvlUclKHRnf9zMUm8nzSmA7h07ihSgk6/jMtOShOMJyl/B
         6srp5KhNlbKLt1AICZePaKAJRVtEFCpVEZjQtO6dCBfKA277hsYVFK+Ypn2YyIz9ztr8
         UKMntnNrndDTtEhRq1Ht6KS9mPpLUcYjQAWAaIHS8S1iIXEijz6EUPa6C7EB6j16uf3c
         qtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722250029; x=1722854829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75tZsRRT0P/pYwpcBW5aVpn9TYPt/uXgIxOkkV6L/Lw=;
        b=VbIfxk1Oy9HjsZHSF7MLtinaFKQjEYwvpXfi/5t1w/+HdhbXtKrhJYTMXspxzCZdZr
         FiQEWvOwYbf9voJZITYAU7ePHfMcfry67aZFh7nyBcKcOam+LSko8qGPGoM8QJkDN9vD
         hgj/rMFzR/n9JfSEBy+qy817u/d4bQOfjxkfTFhyjoBtTTU2ubwcuSZ6iRUQqYNFULYY
         4V59INmOoAbTLfszry8d8DarNR33Zm7epOTVdeMYA6ZHCXBT+C1EqgC9hNSksfalAlzt
         oZDI+aiSB+/my4aRh2hW21lkxySQYVHqmo4KmKyrmSL4NDMgCeIxcVIqEjMCV4xhdDr5
         d0HA==
X-Forwarded-Encrypted: i=1; AJvYcCUUyq/Dk36jkDWFVYcrSYQ0SscBmJQ0pnh+7d4Qi7lmV4Oskc1G9eAcZFguD0/u8N4iSBHgcMetQQN0/ET2aFb7FaVliZ/ip71ecsekQ0E=
X-Gm-Message-State: AOJu0YxFgI3wMVQvBxAOB5rtYbvkN4Fi5YMMFBsV8ClLksIeKTJk51r8
	iVI4GrnvWBXEVt08UobYVCg4+FiZ6oO7K43YoFCzbEEwC2//DownBzUOQ8mrFQ==
X-Google-Smtp-Source: AGHT+IESOR2+VoUyPOWTgXCHlXh7hOzOkJ5+F4Mc53h/J9Pl2NofVEx9kUZwfptkc8Xvl9pLBkKt7w==
X-Received: by 2002:a17:907:e8a:b0:a7a:af5d:f30b with SMTP id a640c23a62f3a-a7d401e02c2mr359882166b.66.1722250028743;
        Mon, 29 Jul 2024 03:47:08 -0700 (PDT)
Message-ID: <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com>
Date: Mon, 29 Jul 2024 12:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/altcall: further refine clang workaround
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240729103050.38401-1-roger.pau@citrix.com>
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
In-Reply-To: <20240729103050.38401-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 12:30, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -183,13 +183,13 @@ extern void alternative_branches(void);
>   * https://github.com/llvm/llvm-project/issues/12579
>   * https://github.com/llvm/llvm-project/issues/82598
>   */
> -#define ALT_CALL_ARG(arg, n)                                            \
> -    register union {                                                    \
> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> -        unsigned long r;                                                \
> -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> -        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> -    }
> +#define ALT_CALL_ARG(arg, n)                                             \
> +     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
> +         unsigned long tmp = 0;                                          \
> +         *(typeof(arg) *)&tmp = (arg);                                   \
> +         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \

With this, even more so than before, I think the type of tmp would better
be void * (or the BUILD_BUG_ON() be made use unsigned long, yet I consider
that less desirable). As a nit, I also don't think the backslashes need
moving out by one position. Finally I'm afraid you're leaving stale the
comment ahead of this construct.

Jan

