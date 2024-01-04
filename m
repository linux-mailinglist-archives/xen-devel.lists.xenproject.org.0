Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C78242CA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 14:41:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661811.1031535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNyR-0005YZ-FR; Thu, 04 Jan 2024 13:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661811.1031535; Thu, 04 Jan 2024 13:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNyR-0005Ve-CC; Thu, 04 Jan 2024 13:41:27 +0000
Received: by outflank-mailman (input) for mailman id 661811;
 Thu, 04 Jan 2024 13:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLNyP-0005VY-E5
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 13:41:25 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3b4b9ac-ab06-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 14:41:24 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cc9fa5e8e1so6205221fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 05:41:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gi8-20020a05663869c800b004664ecd1249sm8105076jab.106.2024.01.04.05.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:41:23 -0800 (PST)
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
X-Inumbo-ID: f3b4b9ac-ab06-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704375684; x=1704980484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SoyA/SIWvN+N7kSIfA7Um37JqWaP5lPBVq9e7hfC48g=;
        b=Djj4vqocMVNbGzeMzRGlpjmhJCxB/RDXL/YWPzh0xMDnQXFT83KMbb9UwljU6J/DwA
         CR8DikhYUNkzCNI00ztVAIIibQtHgdoik1e7a75kmBUQIOeohkiTFHqOeHWVOGOj9Z/g
         93RW5iUWbZxr6vn/hWWsfjCQ/vZrEDFASO1tbxGFUasuIkAt1lZnJKD+DdQaklr9ne8m
         h1NmEgx/NT5JhiXFQNRz/p/iGyUFHg8XlVB+82eNsICg/mTO3fZOr4kkfNdhg4eXLitr
         sE+0aQg+3PoTe2CRgtqT5ecYOCMhu8cLOuUgXD1z1d9C1CSnhl/Rzl4o3bIR+tCH98TU
         g6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704375684; x=1704980484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SoyA/SIWvN+N7kSIfA7Um37JqWaP5lPBVq9e7hfC48g=;
        b=wqQFCk3MoEjnDrNgHg3Eg/EHbxsNMVqCxaJLpjo3SIvd0MJqz+scMDdxC85/oieB25
         DwZdkyOXTXAYH83I0v5dgmR1lS+4vHM5kGBdQFYg6Ww/FL/B6ZtFyP5uPRhPmuDXuc4w
         fHtWAEYD20Hw/vRUYd7+B9ndn0NVQlSVU/62q3/io138HUhaBIDkkrn0IRUIXMm/0yhA
         aWLeFJ/501X/2z2rqm1rTD8boLm1PsTlEY8pnMbUNIyhZL/nq/dzn7OPMDCgMJ8ZcAVV
         PX7nNnu0r7ELFnrVp639fTLioIm9JSQrzhhxKQ9riqDcGkLx90lSAKopLFjwsnbYsura
         uMfw==
X-Gm-Message-State: AOJu0Yyo+NZVix5bBuGt/x6hzeRZ2HXSnpY9Bnf6JnkCDPLrmuEMOluU
	4BkYgOmyOVLWWUX0f7v612hsiZSyjuyL
X-Google-Smtp-Source: AGHT+IFuZSDAsIvIZZCRYlvM1rEVgD8nn5fho7z7vauHy5FoVqHH9kSsb+F4LLXbEC60xUIrtvbzXQ==
X-Received: by 2002:a2e:97d9:0:b0:2cc:6fe2:4ddc with SMTP id m25-20020a2e97d9000000b002cc6fe24ddcmr328734ljj.3.1704375683742;
        Thu, 04 Jan 2024 05:41:23 -0800 (PST)
Message-ID: <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com>
Date: Thu, 4 Jan 2024 14:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.12.2023 20:39, Andrew Cooper wrote:
> The use of uninitialised data is undefined behaviour.  At -O2 with trivial
> examples, both Clang and GCC delete the variable, and in the case of a
> function return, the caller gets whatever was stale in %rax prior to the call.
> 
> Clang includes -Wuninitialized within -Wall, but GCC only includes it in
> -Wextra, which is not used by Xen at this time.
> 
> Furthermore, the specific pattern of assigning a variable to itself in its
> declaration is only diagnosed by GCC with -Winit-self.  Clang does diagnoise
> simple forms of this pattern with a plain -Wuninitialized, but it fails to
> diagnose the instances in Xen that GCC manages to find.
> 
> GCC, with -Wuninitialized and -Winit-self notices:
> 
>   arch/x86/time.c: In function ‘read_pt_and_tsc’:
>   arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>     297 |     uint32_t best = best;
>         |              ^~~~
>   arch/x86/time.c: In function ‘read_pt_and_tmcct’:
>   arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>    1022 |     uint64_t best = best;
>         |              ^~~~
> 
> and both have logic paths where best can be returned while uninitalised.

I disagree. In both cases the variables are reliably set during the first
loop iteration. Therefore I also disagree that there want to be Fixes: tags
here. There's one case where initialization could be bypassed, but that's a
purely theoretical case afaict.

Furthermore this initialize-to-self is a well known pattern to suppress the
-Wuninitialized induced warnings, originally used by Linux'es
uninitialized_var(). If we really want to use -Winit-self (and hence disallow
use of this pattern even in cases like the ones here, where they're used to
suppress false positive warnings), this should imo be done separately from
adding -Wuninitialized, and only after proper weighing of the pros and cons
(a wider Cc list would be required anyway for the xen/Makefile change).

>  In
> both cases, initialise to ~0 like the associated *_min variable which also
> gates updating best.

Considering the affected functions are both __init, this change isn't a big
problem. But if you were truly concerned of the one theoretical case, you
can't get away with this either: If the variables really remained unwritten,
by returning ~0 you'd end up confusing the caller.

Jan

