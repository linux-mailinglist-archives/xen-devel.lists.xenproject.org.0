Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D682A77494
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 08:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933500.1335439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVBu-0005z4-0c; Tue, 01 Apr 2025 06:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933500.1335439; Tue, 01 Apr 2025 06:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVBt-0005wf-Sr; Tue, 01 Apr 2025 06:33:41 +0000
Received: by outflank-mailman (input) for mailman id 933500;
 Tue, 01 Apr 2025 06:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzVBs-0005wZ-6p
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 06:33:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e4d29b8-0ec3-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 08:33:37 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so57603395e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 23:33:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fcd03adsm144934685e9.21.2025.03.31.23.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 23:33:36 -0700 (PDT)
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
X-Inumbo-ID: 3e4d29b8-0ec3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743489217; x=1744094017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OCYG6Leeggrm7qn2kkV8TUwqwR1mM5q8sW7fNVL5irE=;
        b=CBDIMS+aMrDKcB2wrEo9xEe/aBnH4y18nIJK6nVlUuxHqfmi1sXY3gdmrtvND1AQ8k
         U3qFpBbgyE+/9svpOmsE0H+3elYUGTaZJmN9XmSFYxdyx59+aTBe2snzpVoBKbJrrdmB
         leaZ+1l4oYM3z6+8FVP/MXUb5mpf3FSoEWh0DIcWfZARlfZ6vQEVMbd4t/lh8wByDN5H
         zzSFf6naDuaHLOpl3rD2aEt0kMVvOJX6C+M50AWDTFyWhS0z8Azxq82gX6gZg5nBtzD+
         +XPMpie95lRlVScuLyQOR5a7B/CY3mZ7keIAQK58gX9YjSz/IquQrdfkRfUWOciI54tE
         hPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489217; x=1744094017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCYG6Leeggrm7qn2kkV8TUwqwR1mM5q8sW7fNVL5irE=;
        b=WUFiZlnOWsksj/KEzlQu9H9RZBVhg8njzVVZ0OvYWWTAG8ApMFRGqh4XMsRQxpZfIc
         kH26Fqz/5f4Gj/0ml1TaHvcGHt9oNct6Tyj3YjeuRAM9MydBIkGdO9RRL//AJyzoBgRD
         f5hXetZx9R8mEtE/FsOkQDm+jKyyM1swL3ZlW/jaOzmuBjaZF1dKYABA/2TGi1a7AmSg
         Oj/ZRnwbBIfo8ouR0yKk/IrCZCqvarz2fAUPLj9nhDIPxWf8/1g6BQHpdWeVrCj8dUh+
         zCYpoarz+9dQk2a7V7O/a4rfQoQvqrCQEkpnDB8gdoy/0/xUZzMq4vZkSH5EDgnBh4o9
         EBig==
X-Forwarded-Encrypted: i=1; AJvYcCWa/hce3v9Zf7gcnDclz2S6q1fJIMWmGqgzuP7OWdTzrlbaQ3jM4ivW/QkInjfyKWtu05cClOFR/2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZsflgmnUn35qhZa0R5CpbEtNh2XmdH7f4dM5sPfTLrRyAuQOi
	3AdQLP6k38WThzfQ/+Tsfnm7Wopa+pXYAnC2nCrnyPWXc65XYB3fSfAjra9KqQ==
X-Gm-Gg: ASbGnctHH3LSQrRrvSjSOyrtSX8NcByOm018oaBhJLE2piw7A1+L3+WB0F0MuZuLW8/
	5PccNMunkWP+UTe+uIvAWuUWxgTE+f/VVrUTLlm6QFFA1XJoyxNHXiGqltGaaozn/CPTzZBe91v
	8l5x7iTvrLvi3UsumQLrP0OD5UjO8ZLZZ4+NPMmnE/U+/GPwoqZ4BJyym9b1XInLLPbvUA/JBAB
	+xLP6GHoJRK75XAV8NfwVKEKoXxYP1m7L25otQulm5+FFzh4UaApNbZPgpv+WXvkhcN4y60kQxK
	D5MP998tGFdvU0L+i5sbH13sqCUHBAeGclbdj1Zijbmxofcx3zVzLspRYbJkStt4tvAcea8GXQj
	nLjFvDONiSGeUg406+f7NLFN8kwrKnw==
X-Google-Smtp-Source: AGHT+IE7npL3UWEEepwtLWzIB4dqeI1tcoFmzTm9dCpwZ2/qPHlCTBHIhFQvQuYytNl0nbjrhcM8MA==
X-Received: by 2002:a05:600c:3584:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-43db62b7557mr90785945e9.21.1743489217289;
        Mon, 31 Mar 2025 23:33:37 -0700 (PDT)
Message-ID: <c925ec97-0011-4f1e-b055-ec5f40cb5d08@suse.com>
Date: Tue, 1 Apr 2025 08:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen: x86: irq: use do-while loop in create_irq()
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
 <20250401011744.2267367-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250401011744.2267367-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 03:17, Volodymyr Babchuk wrote:
> Changes in v3:
>  - Correct code style ("do {")
>  - Add comment describing why we need do { } while loop.
>    I prefer to leave do {} while because Nicola Vetrini
>    said that this approach might help with MISRA Rule 9.1
>    without needing an explicit initializer.

Just to mention it here as well - I still prefer the v1 form of the fix. Plus,
for my taste, ...

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -264,15 +264,24 @@ void __init clear_irq_vector(int irq)
>  
>  int create_irq(nodeid_t node, bool grant_access)
>  {
> -    int irq, ret;
> +    int ret;
> +    int irq = nr_irqs_gsi;
>      struct irq_desc *desc;
>  
> -    for (irq = nr_irqs_gsi; irq < nr_irqs; irq++)
> -    {
> +    if ( irq >= nr_irqs )
> +        return -ENOSPC;
> +
> +    /*
> +     * do { } while loop is used here to convince gcc14 that 'desc' is
> +     * really assigned. Otherwise with -Og or -fcondition-coverage it
> +     * may throw an false error stating that 'desc' may be used before
> +     * initialization.
> +     */
> +    do {
>          desc = irq_to_desc(irq);
>          if (cmpxchg(&desc->arch.used, IRQ_UNUSED, IRQ_RESERVED) == IRQ_UNUSED)
>             break;
> -    }
> +    } while ( ++irq < nr_irqs );

... the comment is now to verbose. See what I suggested as a comment for the
v1 change, as a very rough example.

Furthermore the question towards reporting the issue upstream still wasn't
answered. There really would want to be a reference to the bug report in the
description (or even the code comment) here.

Jan

