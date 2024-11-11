Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB89C3AC9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:24:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833424.1248575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQeE-0000iX-0k; Mon, 11 Nov 2024 09:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833424.1248575; Mon, 11 Nov 2024 09:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQeD-0000gV-Tf; Mon, 11 Nov 2024 09:23:49 +0000
Received: by outflank-mailman (input) for mailman id 833424;
 Mon, 11 Nov 2024 09:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQeD-0000gN-3t
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:23:49 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7011321-a00e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 10:23:46 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4314c452180so29292185e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:23:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432bc46751asm73966975e9.0.2024.11.11.01.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:23:45 -0800 (PST)
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
X-Inumbo-ID: a7011321-a00e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE3MDExMzIxLWEwMGUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzE3MDI2LjY2NDYzNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731317026; x=1731921826; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ACj/1Pu2/PsGc3CX0qOv6kfqJbb3XZcHeus/JDIAbpI=;
        b=Xa18Ng0vXwRVC9P+yUGV5AcZsVXnQyJJRnGao4u5uPrQYdXGtEnEK2/ulF4rj3GUZE
         IRMxCfVETR4ZEqMe+s4MIk5ZdrgjdKi6KWEBREf6aI4ovtauEhL62TcGenSZ+NUp26ZS
         uFqcxQgk80o4mQTFO/ZJXOWhBdN+njgbA0mLRjFL4d4pZQH+PqjRyMfwEbA7abhVYsUM
         3Z7c3NY2tn8meAYgMJueoBZWb9+rUqOgFRWrx2qFGwS7ltKpE/mayVqdy9o8oUSjDT1l
         Wocj996p9Y8GtjWCapjuBmsNmy1KDzGYX9EWSqpAw+VtYVG6/s4K4svHXyAQwDQpxVTv
         JNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317026; x=1731921826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACj/1Pu2/PsGc3CX0qOv6kfqJbb3XZcHeus/JDIAbpI=;
        b=QxUyCl+gYoZp+X9jJt70LbYCLfELMt6tY0luRDobhY959O+7d63LjJzegIidFxfg1m
         DlT9s/UjOL7mcynFHijSWOGnhwEUM0wmX3dqbGBRRp61PDRb6cIAJwi+TUw4e0/6NRay
         wIj5FbGFfqgDgEMQSusR4Pp4AkNBp8Klg91DnvM+ZvcT6INbOzH4v+lZDwFiFvgpQwCe
         /XLUVY29tO6p+/VnZobpgC9S6WZwq/DR6m2GT9jbq12xHdazjSiXXwJxXaLY5lQdqamk
         gVwX9L9lfhHBHdymja0D39sc7XwT8o/jJD5ZYDapUqIj5+VDJYihq2OuOwYvVV1Mf0yX
         FGUg==
X-Gm-Message-State: AOJu0Yz9GabMcBZDKjinS7ghn4FKzE8cieJ0xIWKnDjNfez5p3tt3cha
	Tb2Lm1FqFErcf+DoDM35MMwWm+oB9W7JhbLpr/RIg7Y0ns2E2AN+m8zNTncE/g==
X-Google-Smtp-Source: AGHT+IEL9Yzju05JtZbLyWW2f1nRY7fS4mywRrf74eiGnwEZvymBn0t845I6ZJRzCLSjd2aD67p71w==
X-Received: by 2002:a05:600c:4ecf:b0:431:405a:f93b with SMTP id 5b1f17b1804b1-432b686ec50mr99380455e9.10.1731317026043;
        Mon, 11 Nov 2024 01:23:46 -0800 (PST)
Message-ID: <f6a17f61-6248-435f-8d08-b4d6c80c9382@suse.com>
Date: Mon, 11 Nov 2024 10:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Untangle mach-default/
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241108201147.812036-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <20241108201147.812036-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 21:11, Andrew Cooper wrote:
> There are only a few trivial header files left here.  Shuffle or drop them, so
> we can remove another compiler include path.
> 
> Andrew Cooper (4):
>   x86: Move mach-default/irq_vectors.h to asm/irq-vectors.h
>   x86: Move mach-default/io_ports.h to asm/io-ports.h
>   x86: Drop mach-default/bios_ebda.h
>   x86: Drop mach_mpspec.h

Preferably with the minor adjustments to the latter two patch:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

