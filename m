Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BAB827605
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 18:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663672.1033759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMt6l-0001Sr-PM; Mon, 08 Jan 2024 17:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663672.1033759; Mon, 08 Jan 2024 17:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMt6l-0001R1-Ma; Mon, 08 Jan 2024 17:08:15 +0000
Received: by outflank-mailman (input) for mailman id 663672;
 Mon, 08 Jan 2024 17:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMt6j-0001Qt-R0
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 17:08:13 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813b0eb3-ae48-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 18:08:12 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so23289071fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 09:08:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w8-20020a6b4a08000000b007baf1948186sm26180iob.42.2024.01.08.09.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:08:11 -0800 (PST)
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
X-Inumbo-ID: 813b0eb3-ae48-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704733692; x=1705338492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzwnLO2m8gTM/EdlibVHVvJN0tKvFfHSV+R/M+KPd3c=;
        b=fHa5B+FKR1kuf2PRtf0JmqVq6hJlJNbs7BYo56Gp+KCO7m2TvyCaU1YFVyEf7KcFB2
         pIdQOQr7p4QBkeJXHhlD+JIR2Oo2mN3y1CjutHmUWzn7KInEaVKQKwkNa5eH4gfCs+fS
         Q/omELaj+3WSQ9XEH4hYOuJS5I//piMWaiReoPsjcLefNzqpeED23CAYpA9vD5YWVjwX
         ffnxXlyjJtUNzxCCm1ctT8XFsBm92IQozyOPlLARQ/Go/PCZMBAx5viqAKo6lghuXWCS
         5F7f550BJJ0D5EAA8PgMKyiIH3oovLmYJP1LYkTxBHbV0fNTWRZJKAzV/VwIFr8x6mu9
         F9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704733692; x=1705338492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzwnLO2m8gTM/EdlibVHVvJN0tKvFfHSV+R/M+KPd3c=;
        b=pEKBoemuHKOnMh5YhTayx9v3VwwKVKpZBBAznEzuLmoO/oJMcQkRSU8mM53OTLAgRR
         OS4MWhLj8tp1LQdRVgm+ME+oCinOV5e2bLK2Uhw/yRieLE/PMLXdYYdRJXuVuRPc+zHq
         uN8QyfQQec4Ti026nKjy4UtUBfs1XERTlAQVlmC2xd6foQAA1fkheM17SzM3kBAKGRuz
         8NyV2ODUjjGnsINjDFQYSYIpPproG6BXYRKjbFQF2HM2IX0cEoskSHhs1sybHGKG/kJk
         35myJG2fyKO2bmzYp6wFeEVdVeNvBksJg8zPAvTmsOF1+G7Who/gH1Pp6Np07i3hJgqq
         1Gnw==
X-Gm-Message-State: AOJu0YyQAVH0sG0m9vCF6WBi2ViHWeWJXyF03XPUI3iCnfViutUiOG21
	CS6URw4ErNHHRp8PwxNzF2oJod2oAuUD
X-Google-Smtp-Source: AGHT+IHR8yZ24mAhD3h1j7k1or8/3ZK+cpqRSILs6G6qBGRkLCyxYx8AXVcc8Bvf915CKgk5FlBoAw==
X-Received: by 2002:a2e:be1f:0:b0:2cd:619b:7810 with SMTP id z31-20020a2ebe1f000000b002cd619b7810mr22536ljq.46.1704733691948;
        Mon, 08 Jan 2024 09:08:11 -0800 (PST)
Message-ID: <dea5c6bc-e217-4229-9298-74fced9b7439@suse.com>
Date: Mon, 8 Jan 2024 18:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-9-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240102095138.17933-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2024 10:51, Carlo Nonato wrote:
> PGC_static and PGC_extra are flags that needs to be preserved when assigning
> a page. Define a new macro that groups those flags and use it instead of
> or'ing every time.
> 
> The new macro is used also in free_heap_pages() allowing future commits to
> extended it with other flags that must stop merging, as it now works for
> PGC_static. PGC_extra is no harm here since it's only ever being set on
> allocated pages.

Is it? I can't see where free_domheap_pages() would clear it before calling
free_heap_pages(). Or wait, that may happen in mark_page_free(), but then
PGC_static would be cleared there, too. I must be missing something.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -158,6 +158,8 @@
>  #define PGC_static 0
>  #endif
>  
> +#define preserved_flags (PGC_extra | PGC_static)

I think this wants to (a) have a PGC_ prefix and (b) as a #define be all
capitals.

> @@ -1504,7 +1506,7 @@ static void free_heap_pages(
>              /* Merge with predecessor block? */
>              if ( !mfn_valid(page_to_mfn(predecessor)) ||
>                   !page_state_is(predecessor, free) ||
> -                 (predecessor->count_info & PGC_static) ||
> +                 (predecessor->count_info & preserved_flags) ||
>                   (PFN_ORDER(predecessor) != order) ||
>                   (page_to_nid(predecessor) != node) )
>                  break;
> @@ -1528,7 +1530,7 @@ static void free_heap_pages(
>              /* Merge with successor block? */
>              if ( !mfn_valid(page_to_mfn(successor)) ||
>                   !page_state_is(successor, free) ||
> -                 (successor->count_info & PGC_static) ||
> +                 (successor->count_info & preserved_flags) ||
>                   (PFN_ORDER(successor) != order) ||
>                   (page_to_nid(successor) != node) )
>                  break;

Irrespective of the comment at the top, this looks like an abuse of the
new constant: There's nothing inherently making preserved flags also
suppress merging (assuming it was properly checked that both sided have
the same flags set/clear).

Jan

