Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0CD99DE9B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 08:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818983.1232276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bFX-0004YK-Bv; Tue, 15 Oct 2024 06:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818983.1232276; Tue, 15 Oct 2024 06:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bFX-0004V6-7y; Tue, 15 Oct 2024 06:41:43 +0000
Received: by outflank-mailman (input) for mailman id 818983;
 Tue, 15 Oct 2024 06:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0bFW-0004UV-15
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 06:41:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88094bc2-8ac0-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 08:41:39 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43057f4a16eso43509595e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 23:41:40 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c8b5:94fc:ce22:8335:8123?
 (p200300cab721c8b594fcce2283358123.dip0.t-ipconnect.de.
 [2003:ca:b721:c8b5:94fc:ce22:8335:8123])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f6b31e3sm8147895e9.31.2024.10.14.23.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 23:41:39 -0700 (PDT)
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
X-Inumbo-ID: 88094bc2-8ac0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728974500; x=1729579300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S89/5L62fOPmW5cP4ByJo1hQo+FxwEK/aPqMKRj2vo0=;
        b=adPxkEf1CWwkRN7EzNbnx4uvSjxBTCCL5xn0zF8DnRuTCpXO7KhdwsmoeB9/PLcAyB
         6ZiRQA4JNBa+7+N6InOJ0ZtkrL+FUZeC0sLSuVV+nCNs7gX31VWmfPndJuFDcW9warUC
         TvtlVjQN8NH25fkHY+dV2YE/4uznRDI5ucJDpzq5dBUuEqZLGK9nZwBVTzREspM85Pmw
         x/muMZ+Kn4hxeTdffI81d1+O1UVGyhYwJaUq6L1mfd1wcwVSRBq8G94W8Ac1UrxXIYK4
         V9k1P/8QCNiqZvjULou0TNFSZKCp5QHvv7cL5EkmMkxWCcv9V1dICXkL+ElkyxDRASyv
         kBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728974500; x=1729579300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S89/5L62fOPmW5cP4ByJo1hQo+FxwEK/aPqMKRj2vo0=;
        b=w67GDxyatldnpy0O60G1BjoMqSHeCwh6S8bpZF27I0e4h/V4fxTgvwMCU+rCJWG9oH
         yYn/OkBXtTnVsmO4LYITI9QGxTfb+UWnRNgNW9iFDQGaNIUjTupuP5NcV03vXl6eUkWx
         VpBpk0JYoXW7G3Jo+Imp2E6zVHuzEEo8eRlw5M8PhtjUPCXeRhDDv0I8jfrE25Q0/uJY
         kf3p30OmbbZy701p2nEXp/7766pdi4wRBpa2PQe5/owj5xHOesetos1IJnabNQS+b494
         niVObziNx6SOx9MPdD6Gb37Dc3g1qW2p8/4TUUBrRd/VOaULCTYntx/SgGYckB5MBg8i
         r4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwjs5JEEzrXhKUIorgo1l0tKAYUYZ7cCFpBJa73toXSsptTkfVqGbrWidOvgu4EEDIGuGPw9LfksA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuD2fCctILGkoOZIWD6W5s0kocaYwoCyc+ePHF1vbEh/UOL02T
	QTrmQyZ2p071BtCg0AiZ+pKsWFyhgC9lJ4+TcBAoR/Bh5A+tIeblw5y14VoJ3w==
X-Google-Smtp-Source: AGHT+IGylaXOAKKr1uXgXOWmdLhi4OZfATqrFoo1UryW2+caMZTsGVEuZhuLp4bAL52E96ffvttxVw==
X-Received: by 2002:a05:600c:4f08:b0:430:5403:50a6 with SMTP id 5b1f17b1804b1-4311df56c09mr121304255e9.29.1728974499847;
        Mon, 14 Oct 2024 23:41:39 -0700 (PDT)
Message-ID: <7d316e7f-4630-418b-8541-adf19b44048c@suse.com>
Date: Tue, 15 Oct 2024 08:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] x86/boot: Align mbi2.c stack to 16 bytes
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241010094524.1836495-1-frediano.ziglio@cloud.com>
 <20241010094524.1836495-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241010094524.1836495-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2024 11:45, Frediano Ziglio wrote:
> Doing previous testing with an Alder Lake Intel machine the with

Nit: flip "the" and "with"?

> "x86/boot: Improve MBI2 structure check" commit test started to fail.
> Removing the commit makes the tests succeed however there was not apparent
> reason (looking at the code) for the failure.
> So I instrumented code to output the structure and tested code with
> this extracted data with and without the mentioned commit and results
> were the same.
> Compiled assembly code from lab was also fine beside not keeping
> the 16-byte alignment for the stack.
> Turning on stack alignment solve the problem on Alder Lake machine.
> 
> Fixes: eb21ce14d709 ('x86/boot: Rewrite EFI/MBI2 code partly in C')
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



