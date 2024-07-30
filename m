Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B33A940AB3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 10:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767339.1177942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhpy-0000gg-5Y; Tue, 30 Jul 2024 08:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767339.1177942; Tue, 30 Jul 2024 08:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYhpy-0000fQ-2H; Tue, 30 Jul 2024 08:04:02 +0000
Received: by outflank-mailman (input) for mailman id 767339;
 Tue, 30 Jul 2024 08:04:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYhpx-0000du-7A
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 08:04:01 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4772dacd-4e4a-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 10:04:00 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa63so4034745a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 01:04:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab233aasm611223066b.8.2024.07.30.01.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 01:03:59 -0700 (PDT)
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
X-Inumbo-ID: 4772dacd-4e4a-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722326640; x=1722931440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yKvKgh0M2Q1xpxKFE4KbmHIwVWCai7Z03Un0lCACDJM=;
        b=Yo8AnCur/fiE1E2T3L6smAhcxeNO+BVl8F2hZk39ctIR232ggn7CzBfwJksUeM2Ujx
         urS1aSSEphgsyRe1zVt8ViaqTqq5sx5mwBpykF41h5Hhl4i9pr7I6mnTp/92f3rKGwkP
         CCe2c7YbbD33qSwUG6kzmCDrKcl3acPnrQwSxsRSHp72psMt5gSdDkVImI63ojQ2ozQV
         ZbyAEz/EEyD9O++HklHq1o96yy6fJf1ixkv4BDpidCyTLoCQGAa+GVPeY1y7JXkGy97W
         /XT7yhKqkC2vwFjq/PP+NcUpUaRHnj0Y5OyGjFvPDbvDjLXHb4bDoXWoB3o0UfxOaZuh
         KW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722326640; x=1722931440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKvKgh0M2Q1xpxKFE4KbmHIwVWCai7Z03Un0lCACDJM=;
        b=V2L+saSg2Tjg/+RUDutFQ3Kj708AaHp3wPTeKD15ElyITKE2fCVwJLrX1aThbcIJvM
         znUb/8XFiCzXGv9yzodSA6dqKRm135NLfjejsbICbZwHuu0cA/7okWvzR7zXFwur/JMU
         ONWWCkl/ek4vsJqN5BhLAk/ovUNoUmNXOuqkqKmp1eOFmRGOq4mZ553eT2TYXFV/xipN
         RnGzUGW+sozQXtAWh8yT0HgSiAUZKYVgYwVoImxJUU7seMTqTWgW2+33FN/2c62d18V1
         VbWnhTSVVfMXdQNQSxyWZe/vi5KPTBRvfKlRrDdGZms5mH8fulZvNyHxRApdUGRFoJED
         X+nA==
X-Forwarded-Encrypted: i=1; AJvYcCUVfuqe4nHtxC1MjhhKUWdBfrcm8YBxWTsWoT5miUM9KOTI6h1Rxni6D2UrPkukCZI70lfRL9jey+noxDJaN9/EifTzQCzWNtpr3Y7MIbw=
X-Gm-Message-State: AOJu0YwW/2V9aWn6QbqgD8JSA/Mj3q+EfuCHV3ykl3gr3l3U/rm1FDwH
	HggckreAOf4SwWEpTCDT0diMeiXwT8B/5kFHyR9SCmYYWIKhJD7vcyisjRBW8A==
X-Google-Smtp-Source: AGHT+IEthjftmP1pChPfB1IXcVYdAE8KM1tCBu3OHw72pPXQJVHnD2AsZj2r7jaMT549XOPd63Jvgw==
X-Received: by 2002:a17:906:7955:b0:a7a:84ec:8785 with SMTP id a640c23a62f3a-a7d40086e54mr760333366b.40.1722326639952;
        Tue, 30 Jul 2024 01:03:59 -0700 (PDT)
Message-ID: <0816a3b3-61b1-4382-b919-9d25f124ebbd@suse.com>
Date: Tue, 30 Jul 2024 10:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/riscv: introduce functionality to work with
 cpu info
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <4ea9005d4209e24df9b30a7b3c282276084a3cf1.1721834549.git.oleksii.kurochko@gmail.com>
 <113b9d4a-d31c-4491-bf8c-96ac97d98f45@suse.com>
 <370588e93fe59acb0ae1f26416541290004e593b.camel@gmail.com>
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
In-Reply-To: <370588e93fe59acb0ae1f26416541290004e593b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2024 18:32, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 17:28 +0200, Jan Beulich wrote:
>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>> +static inline unsigned int smp_processor_id(void)
>>> +{
>>> +    unsigned int id;
>>> +
>>> +    id = get_processor_id();
>>> +
>>> +    /*
>>> +     * Technically the hartid can be greater than what a uint can
>>> hold.
>>> +     * If such a system were to exist, we will need to change
>>> +     * the smp_processor_id() API to be unsigned long instead of
>>> +     * unsigned int.
>>> +     */
>>> +    BUG_ON(id > UINT_MAX);
>>
>> Compilers may complaing about this condition being always false. But:
>> Why
>> do you check against UINT_MAX, not against NR_CPUS? 
> Because HART id theoretically could be greater then what unsigned int
> can provide thereby NR_CPUS could be also greater then unsigned int (
> or it can't ? ).

Well, there are two aspects here. On a system with billions of harts,
we wouldn't be able to bring up all of them anyway. NR_CPUS is presently
limited at about 16k.

Yet than I have no idea whether hart IDs need to be all consecutive. On
other hardware (x86 for example), the analog APIC IDs don't need to be.
Hence I could see there being large hart IDs (unless excluded somewhere
in the spec), which then you map to consecutive Xen CPU IDs, all having
relatively small numbers (less than NR_CPUS).

If hart IDs can be sparse and wider than 32 bits, then I'd suggest to
use an appropriately typed array right away for the Xen -> hart
translation. For the hart -> Xen translation, if also needed, an array
may then not be appropriate to use.

Jan

