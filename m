Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93588938F94
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761921.1171981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsfl-00034A-DZ; Mon, 22 Jul 2024 13:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761921.1171981; Mon, 22 Jul 2024 13:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsfl-00031n-Ad; Mon, 22 Jul 2024 13:01:49 +0000
Received: by outflank-mailman (input) for mailman id 761921;
 Mon, 22 Jul 2024 13:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVsfk-00031g-5g
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:01:48 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d6d693f-482a-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 15:01:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77bf336171so694964566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 06:01:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c9511ebsm418666266b.214.2024.07.22.06.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 06:01:46 -0700 (PDT)
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
X-Inumbo-ID: 8d6d693f-482a-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721653306; x=1722258106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fEHfB2GN9jBSq1Hnh4tH4ZEhStDEqhhNYdKyhZjri0k=;
        b=Lfs1b/8/2yjqs9fkxEsMT0PBUSbX8MydmG61nSq6mpnf+jPUrNtwlwkIxnNAmOYP8f
         aMD1Jnw43mnqr2UUm9s4CIed/PgH3xvnhmYb2bqGLp2lZWphxNxnzs6MpGcaBiOKHZ41
         kuojYY4tS+ucvv24G8YRUbMREICfLeGwUX5HqR8d72HXZGKN/kpBFJB+nE4AVV9XC1jX
         g6RnVKCq4I/mSLUtecp4ungALVjyv+RZQeZQEd/1+ImOhiJjzelKAdhJ3an3QsS00dMl
         MeCpemivxtHw60GNAd3+zVN+WZysdtg6ZBGKg+zHXXgxC8XKDV96pLctH5EkdnFPNEwt
         OiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721653306; x=1722258106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEHfB2GN9jBSq1Hnh4tH4ZEhStDEqhhNYdKyhZjri0k=;
        b=WdkGKxq470PuCgavQ7k4dF2Kj3iyTWxTCTFR/++E+vb5sVqwXAfcoM1GmxTS9CLy2f
         Hc849Qnt/FTJtcUw/oPWmtlqxD6pPWTHxHHeKM06F1Ap7OX570WPJy9TRZfPSbDm0e3p
         JFbpHNwaNTL0G+il+U1WfkqJYWWSYeIoOpr7tjOSbv0UB0dAOdIYdXl7ijQp+mhP5FWQ
         nER4x9QjKA+c3eoLnXVbCBUCfiqMvp96ST4AZu2Ve4jYyzfc3qwzOqgcNwUIkGd5vn0a
         Ztc2dHN5/Wg4wD8S6NDvZRk9mDgqsmuEGZKF5i1OlHFAFCtUTt/ulmXXD3h++4HdrDRq
         cIbw==
X-Forwarded-Encrypted: i=1; AJvYcCXVcDYVNtpue48gwsxiFhx+czT18WW4MJzXrRoz2GKFXajzgGn7Q60s4mJYBCmQAH515ZST/dQS0TLc5VwflDtWnzYbmeeDa2gcFYqRyDE=
X-Gm-Message-State: AOJu0Ywjja/EyUNO4A4k5X8R/y5kcsCJpO0e++PbTr6eN1FeFmJp7baJ
	efKMpgh8bonKjV/0Ac4P1PuQuP03nXX+dzPZ5n5Z5Z7jl5dWjZ8oPvSFEDz4zA==
X-Google-Smtp-Source: AGHT+IEIexEqhpnNNJMuRBtRyTtx3vB4sUQWcAzczsW0DfX9kwqVV1EKOrEJsS8aCTo6bQT8L6BiLg==
X-Received: by 2002:a17:906:7741:b0:a77:db39:cc04 with SMTP id a640c23a62f3a-a7a0f0ffe1fmr1288570466b.11.1721653306520;
        Mon, 22 Jul 2024 06:01:46 -0700 (PDT)
Message-ID: <767482e3-3132-4a7f-81ba-6ce0ebea675e@suse.com>
Date: Mon, 22 Jul 2024 15:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] x86/mm: add API for marking only part of a MMIO
 page read only
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
 <f0b36fb78b87d2f06c0d33da28ba16cd1d2fa8b9.1721356393.git-series.marmarek@invisiblethingslab.com>
 <dce600a3-4b1c-47e9-b336-42ca32e309c5@suse.com> <Zp5SQlB_QR47NmtY@mail-itl>
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
In-Reply-To: <Zp5SQlB_QR47NmtY@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 14:36, Marek Marczykowski-Górecki wrote:
> On Mon, Jul 22, 2024 at 02:09:15PM +0200, Jan Beulich wrote:
>> On 19.07.2024 04:33, Marek Marczykowski-Górecki wrote:
>>> +int __init subpage_mmio_ro_add(
>>> +    paddr_t start,
>>> +    size_t size)
>>> +{
>>> +    mfn_t mfn_start = maddr_to_mfn(start);
>>> +    paddr_t end = start + size - 1;
>>> +    mfn_t mfn_end = maddr_to_mfn(end);
>>> +    unsigned int offset_end = 0;
>>> +    int rc;
>>> +    bool subpage_start, subpage_end;
>>> +
>>> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
>>> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
>>> +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
>>> +        return -EINVAL;
>>
>> I think I had asked before: Why is misaligned size something that wants a
>> release build fallback to the assertion, but not misaligned start?
> 
> Misaligned start will lead to protecting larger area, not smaller, so it
> is not unsafe thing to do. But I can also make it return an error, it
> shouldn't happen after all.

Well, I wouldn't mind if you kept what you have, just with a (brief) comment
making clear why there is a difference in treatment. After all you could
treat mis-aligned size similarly, making the protected area larger, too.

Jan

