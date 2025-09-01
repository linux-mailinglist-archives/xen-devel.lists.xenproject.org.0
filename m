Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159EDB3DEB1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104297.1455382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0zy-0002Rg-PN; Mon, 01 Sep 2025 09:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104297.1455382; Mon, 01 Sep 2025 09:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0zy-0002PM-M3; Mon, 01 Sep 2025 09:38:50 +0000
Received: by outflank-mailman (input) for mailman id 1104297;
 Mon, 01 Sep 2025 09:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut0zx-0002PG-9T
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:38:49 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75f3a5f2-8717-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 11:38:48 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso6292835a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 02:38:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc9asm6800364a12.25.2025.09.01.02.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:38:42 -0700 (PDT)
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
X-Inumbo-ID: 75f3a5f2-8717-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756719528; x=1757324328; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X8LlKiSqE8EFYbpZWwoVUZhPsnuckq0t875M4ppmnB8=;
        b=KtSzmaixTF/LWDvjC223kAa6xGyPVDlUIZDjkI0fnnQBAQbXIqeE8sJRvOdBD6nPOR
         ZLWcBoPGukfK3FtQc16tLtav3wZ8onWPPrbHLuHu/PBu6b/NnGLeWLJo/XhgKV4V2Wth
         DStpBrtocs5FQMfvq8jwEzuJtbHvsGTObNPgxbTi4L4Lp7DyJW+LPOGCqvUa6d3ltv0p
         SmY1wIQmmWI3Ps1cXpo1WR3/77o8PwuIxdPXWrKESqf6gxT9Em6fgNs+bMRu0UvhU8z9
         d8FJnajgNG7v1alFFW1lZB7qiq2ltzFu3xWOxBDxC4hAHaPu9Hk98WLPb7Wkur9UNit6
         Zrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756719528; x=1757324328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8LlKiSqE8EFYbpZWwoVUZhPsnuckq0t875M4ppmnB8=;
        b=MGtGojR1ess5rCk7ZWJrZQmtwgDMejalLav8dHjcsvp/E9jyDQjRbA95Tk680XCwVo
         IWxlP71m+XEQgWczwiYW44bz13SJMLfeHvd9ZAo5gupD9hn0unwow1GokG/WgBf4z2bP
         IgK/LiWmOnNHmAbvYU0472eYfB85i8WDqTG4NN9tj3T0gmVwCCvf8BAmLVg60KX67LF0
         MpGNRvDbsoZMgOIoNEH/FTa1RYrVP/OqePEK3a9fZ3BhIRBvFMv+ilOTjIz++hONKz/G
         w6heLWSZbFkaOhdfoWk2ZI2Ptq/YRNAZOL4mkGDsbvArGQKLHac8A3Bywv6yOfsZMPtv
         +keA==
X-Forwarded-Encrypted: i=1; AJvYcCXxaqmCfw0UQQQAFh0eTtcDyJcpFwgHJICweZ8QTkZg7tQFTEDeR9owQW/2tnAJHFOTnom8n02YawA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIrZ8RRpb2ES63uDzrUeONLwbYCz2RFk3+feDct+0R48Qf/C08
	87c/bloe+8O6fktP6rxVRP6/sPLFNDlKSsG7im6hVpHDodtTWD5c+7Dx2MDms1Jjtg==
X-Gm-Gg: ASbGncspxVMZiHEq8329cweE9vbSRP04BJjIN9rjioxksmwE9TWcIExbdXgO2EkFmJX
	hFMzLmkYS7dkPhngWaEIbMzn+lRjJat0H4XR1Kp0osWk8bPCO/9xR6zAsm9yuFwvK/ozfOBBvuP
	gW16dAxIulwPoeEaYZfST3Z9W2UgSWZlAQPb8Th2pNzbmvoEZT5EpDR5PiU6G0Y4mg9Wt1aw01i
	iucH/EBIkjMaORKfMfK2jTlx5v8oNS9rvbju0ZKhyUigjmtcr6c5v6W3wJzZjYfWrvMzu9NvfBs
	5ihBSMY1dUA3GrCYHXmdLcZjr8oaZ2IhyTlL3jMTpQoH4z7pShomqoVCOMqAsugpS2BuxAuqJOK
	cXhACVSnLIV5+rxS48ySxBfNyWiv6QYFcZ5GE05xu9oiktaA/nmq7TfVxkv0nVuY3tc6LNJ8y6p
	QSxdZQ4iw=
X-Google-Smtp-Source: AGHT+IFmOz5s08wc9COxAKyznPeHwoEn51QwTGvYprLxJ/D2/8c9EMEeVxC3+7T5PfrmM7xMz3XEoQ==
X-Received: by 2002:a05:6402:1e8f:b0:61c:931a:6cc1 with SMTP id 4fb4d7f45d1cf-61d2689312bmr7288086a12.13.1756719522533;
        Mon, 01 Sep 2025 02:38:42 -0700 (PDT)
Message-ID: <77fd4eae-042f-40be-80d2-952b0f532dd9@suse.com>
Date: Mon, 1 Sep 2025 11:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/23] x86/traps: Skip Supervisor Shadow Stack tokens
 in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> FRED doesn't use Supervisor Shadow Stack tokens.  Skip setting them up.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1920,10 +1920,6 @@ void asmlinkage __init noreturn __start_xen(void)
>  
>      system_state = SYS_STATE_boot;
>  
> -    bsp_stack = cpu_alloc_stack(0);
> -    if ( !bsp_stack )
> -        panic("No memory for BSP stack\n");
> -
>      console_init_ring();
>      vesa_init();
>  
> @@ -2077,6 +2073,10 @@ void asmlinkage __init noreturn __start_xen(void)
>  
>      traps_init(); /* Needs stubs allocated. */
>  
> +    bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
> +    if ( !bsp_stack )
> +        panic("No memory for BSP stack\n");

... while this is the earliest possible point now, can we please consider
moving it yet further down? E.g. next to the setting of system_state to
SYS_STATE_smp_boot, i.e. in particular past IRQ and spin-debug enabling?

Jan

