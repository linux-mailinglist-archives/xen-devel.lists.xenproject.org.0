Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DB7995F5C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 08:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813713.1226715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syPof-0008QC-J4; Wed, 09 Oct 2024 06:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813713.1226715; Wed, 09 Oct 2024 06:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syPof-0008O8-GZ; Wed, 09 Oct 2024 06:04:57 +0000
Received: by outflank-mailman (input) for mailman id 813713;
 Wed, 09 Oct 2024 06:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syPoe-0008O0-CK
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 06:04:56 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67ab57c2-8604-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 08:04:54 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53991d05416so7927455e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 23:04:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9932bf8a90sm586454666b.50.2024.10.08.23.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 23:04:54 -0700 (PDT)
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
X-Inumbo-ID: 67ab57c2-8604-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728453894; x=1729058694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PrO/QgbrZZYKdSjC4/lueqd1/9gc7/MRu11WEWB1DTw=;
        b=VZwEXSg8h6PDqIL0PBV7ealfYPr51/ArJ59r80e2RU/N2egIstwL4cRUzHT+Qgm00P
         FNfZcEwKcW4SbuP2JDgFIhSanjz3cVJ6SakJLASTFaMXAA56pSqXpZozabysqxLyheHY
         PfnlN9sVx4pn7ZZRxf2AsGNntXqmvB9hQ85N3GzikqUbU2DvRtvWXRpAVVJP9m5mqHrB
         irA8TsoTnd2RfNNC8ULC40iBq4N9qGg3BnVkg8hVYs9a7JbzXtwl1Wi4bp7jK7Fud4nu
         1SioexvygLcSvO9CMgrZAv0qrE82UHHUUC006jtkU2ZTBfbGasFIZVy6tw64py/mqotT
         VDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728453894; x=1729058694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrO/QgbrZZYKdSjC4/lueqd1/9gc7/MRu11WEWB1DTw=;
        b=lrrt4oHJioEKgx0YsPBLJa1EoyfA+2iUWc3HhJh8G4pM9EKgVJazXrt60xMUYXa1j9
         5q/b02IKSkNKbKgKJq/jYi3NfmFL2twow9zkeLfmuBldAozaKxjoDkJ2Vq2OquC/hDoO
         +FKLg74EdY36ZTi9rSIT5jH29DFSgICXDjUCj6O5bEjrwQqJNhw+XgNMju74XEvBJ6MD
         iycNrkA3jgw8xC8GORfHOpilIL4wf+mW5VyjQ/FMR6oURjtAERf/SuhX3XFwA46/pSoW
         yRU6t8sCrfJBQR8YORvMSASjWvf3aIoFDxJaKt1mubPfWzBHS58Aieiw7qAZPBb3l6H2
         wb5A==
X-Forwarded-Encrypted: i=1; AJvYcCUzE1f/9/f51IHs2hjGv0ZZifNWik1SGBXWFh07Y8Z8ijtm6ryI2tjcbqJsDMfsGNRo4nEXWQAi6es=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywb+F8thrflMubE2zu0L4ytacBHElX9sqQKDpNauFWSFH1Q/mDe
	taeqoCXD4YimX1rr/W34CdmXmQmyWKMKu3Wlgx9SO6fPpdnZs9y6OU91Xo1X9Q==
X-Google-Smtp-Source: AGHT+IGo2RHvI3LJo2FFXF+fBcMSGmiFZhqnROqYAfNPulvDcLeXnKLcCLf0qbrcUBWzFpTDLZ3d3Q==
X-Received: by 2002:a05:6512:1155:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-539c48e455emr888966e87.33.1728453894375;
        Tue, 08 Oct 2024 23:04:54 -0700 (PDT)
Message-ID: <7f3229e9-43c1-48f7-9921-ce826c7c19c0@suse.com>
Date: Wed, 9 Oct 2024 08:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: restore semicolon after explicit DS prefix
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cdf93d64-dcc0-4e01-88fe-71145ffff1ff@suse.com>
 <8f85c4d2-805b-43ed-926e-732382b7e6b9@citrix.com>
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
In-Reply-To: <8f85c4d2-805b-43ed-926e-732382b7e6b9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2024 18:37, Andrew Cooper wrote:
> On 08/10/2024 5:00 pm, Jan Beulich wrote:
>> It's not unnecessary (as the earlier commit claimed): The integrated
>> assembler of Clang up to 11 complains about an "invalid operand for
>> instruction".
>>
>> Fixes: b42cf31d1165 ("x86: use alternative_input() in cache_flush()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -286,7 +286,7 @@ void cache_flush(const void *addr, unsig
>>           * + prefix than a clflush + nop, and hence the prefix is added instead
>>           * of letting the alternative framework fill the gap by appending nops.
>>           */
>> -        alternative_input("ds clflush %[p]",
>> +        alternative_input("ds; clflush %[p]",
> 
> /* Clang-IAS < 12 needs the semicolon */  which can probably fit on the
> end of the line.

I've made it "Semicolon for Clang-IAS < 12" to actually fit on the line.

I wonder whether I can take the reply as "ack with that change"?

> Or we stop supporting such old versions of Clang/LLVM.

As indicated in reply to Roger's proposal, that would leave me without
any way to test with at least some Clang versions (unless I got into the
business of also building my own Clang binaries). IOW - I could live
with such a move, but I'd prefer us not to be overly aggressive there.

Jan

