Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87FA41B7E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 11:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895092.1303692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVwW-0004sp-Li; Mon, 24 Feb 2025 10:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895092.1303692; Mon, 24 Feb 2025 10:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVwW-0004q7-Ij; Mon, 24 Feb 2025 10:44:08 +0000
Received: by outflank-mailman (input) for mailman id 895092;
 Mon, 24 Feb 2025 10:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmVwV-0004q1-OE
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 10:44:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 448c2541-f29c-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 11:44:05 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaec111762bso37612266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 02:44:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb7e29be33sm1779185266b.94.2025.02.24.02.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 02:44:04 -0800 (PST)
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
X-Inumbo-ID: 448c2541-f29c-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740393844; x=1740998644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f7E+z5y8MfJG44dg0WkoSSYRd79I8Qu1Hiq4f0jeqnM=;
        b=XYWdfH6OrYBAzi46uvkvUOCgSiFVITqfz4dTC/qdU/YikMpJ1IexD6XF3Ua4Iw4TIN
         IljwNoADzMT3Cla4Ties4cLNXUMT41ejjaL5bwdBv2Ia0bPrXggQ3zopZoFuJ34No1n6
         SMhzyMzcn8zlXS0OexSZkG/9BKGv73FA8KDxrxACONLzQHHBkaMCG9p7tNkeNdDRxd8n
         jPDBzec97uYht40gPjBkYl8iaIwtwgWtv8pq6xOyrob5Cn1zpypRxIt5LdF/NENy9lq6
         /8IUFPfZW8dVWGBAvHzrq2uqogveWB/EKAOw1koSTERQG2LcqPWIo1onFAXAgU/V8qt/
         jaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740393844; x=1740998644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7E+z5y8MfJG44dg0WkoSSYRd79I8Qu1Hiq4f0jeqnM=;
        b=iOYPx3FWWV6KrW8FA1gXxRYV4vbRRgi/ca2FZdEidcuVPGVQC1UcWh/RD104FCVqt5
         ivAi3wcfl+BP9hL0cgPxsWteW1Yp3/9heH31wUUaMQnmGdUBE9RxSAWHfprx+ckhk5OY
         ZjfXJYPQw5tLMNb9bMEVZ/ChnrKxb/CjOJVkGK3Dn6Q5P0e6V/NOlD7FR063qGFvpfmr
         nCWUgDw0iUons6nZAOMe0AQMHk6i9/uyqIAftR9MG0bP0lKYG5HXFWN9iD90KucMn3et
         bChK9ZRcEe+fxz+NFeVRmT90nIjMzATAGjy2SQ2XWi7xGjr3rbwGB0X5BYj86LG9VlPt
         BTFg==
X-Forwarded-Encrypted: i=1; AJvYcCUgzYv4NqxCYpecKWRWa9M6x4O+pLV1YwDqi1u5lp2Uz4F3osrVraCv7r/H4CaYV0ApJbOLTI7BaZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSmp9JazV2j9xc5XYs+Q7V1Z7z11l8O6KNumHHnQgXyPdCWbcp
	DKtCNAOSUGR0VWc/CN3zO0jdEtYS5K5ObtnlwU5iZ3hWaTHZRc8sr/qYB4NeAw==
X-Gm-Gg: ASbGncum+Z9toMnVOO+hy3+oGouKkriYsPgoYmm3aawFuFr1NfDT6lRaaTn/lcWtutg
	fPlcqHRulGf5SaSMBzg/Zv55WcFp/fyc1MAFqI4Ac7M1gwAuANA6pW7jWp/FG10NN/VEExeuXkm
	Z5GrBoX+mfgzGrs0hbe1eoYCWtUL/pAXrT8w2I0MOH7pTsXdtPbJiLQn6ixNJQVjqkndLPPkjN8
	uVMRZ/POTxQXMBy3PNtl43D3MgC21FjoJJsAdoqzUioVgXDJZtBJ3jhiRBx3leB1eWMxcXEdtUF
	y9Uu96PwmyRK0t/kINIlbs4tkAh+t9LOs8/wfixFArO5PZxHy0JZpBJbGnGJqrACx94ruxlVSA0
	vanixhJITViU=
X-Google-Smtp-Source: AGHT+IGV/aPyyhva0NYbM5bpmwOi5G9BAaLN18fkcj0ManzBWbhntPh8zg045Fi9TfWEW6XIhY3U6w==
X-Received: by 2002:a17:907:7ea6:b0:ab2:d8e7:682c with SMTP id a640c23a62f3a-abc09d3566cmr1397022066b.38.1740393844426;
        Mon, 24 Feb 2025 02:44:04 -0800 (PST)
Message-ID: <3826b034-be99-4f43-ac55-d616e473ab40@suse.com>
Date: Mon, 24 Feb 2025 11:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: make console buffer size configurable
To: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250212222157.2974150-1-dmukhin@ford.com>
 <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com>
 <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me>
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
In-Reply-To: <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 21:52, Denis Mukhin wrote:
> On Tuesday, February 18th, 2025 at 8:05 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 12.02.2025 23:31, dmkhn@proton.me wrote:
>>> --- a/xen/drivers/char/Kconfig
>>> +++ b/xen/drivers/char/Kconfig
>>> @@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
>>>
>>> Default value is 32768 (32KiB).
>>>
>>> +config CONRING_SIZE
>>> + int "Console buffer size"
>>> + default 32768
>>> + range 16384 134217728
>>> + help
>>> + Select the boot console buffer size (in bytes).
>>
>>
>> Why in bytes when ...
>>
>>> + Note, the value provided will be rounded down to the nearest power of 2.
>>
>>
>> ... this rounding is done anyway? Why have people type in complicated numbers?
>> A granularity of 1k would already be an improvement; yet better would be if
>> this was a power-of-two value altogether.
> 
> My understanding that the semantics of new CONFIG_CONRING_SIZE build-time setting
> should be consistent with existing boot-time conring_size= behavior (string value
> converted to number of bytes).
> 
> I can update both to round up to 1k boundary.
> 
> I also agree that having power of 2s for both (e.g. similar to Linux'es CONFIG_LOG_BUF_SHIFT)
> will be the simplest (implementation) and non-ambigous.
> I had it done earlier:
>   https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-26-e9aa923127eb@ford.com/

I'd prefer the power-of-2 approach, yet I could live with the Kb-based one as
was suggested by Roger.

> Also, since there's a build-time configuration parameter along with the boot-time
> configuration, perhaps it makes sense to retire boot-time setting in favor of
> build-time setting?

Why would that be? Build-time settings can only ever be defaults. We don't
know what people need in their configurations.

Jan

