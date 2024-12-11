Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD539EC5A5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853923.1267256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHFc-0007zc-4o; Wed, 11 Dec 2024 07:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853923.1267256; Wed, 11 Dec 2024 07:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHFc-0007wx-1x; Wed, 11 Dec 2024 07:35:16 +0000
Received: by outflank-mailman (input) for mailman id 853923;
 Wed, 11 Dec 2024 07:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHFa-0007wp-8u
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:35:14 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 748a0781-b792-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 08:35:12 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38634c35129so2970831f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:35:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef45ff77b9sm10951345a91.36.2024.12.10.23.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:35:11 -0800 (PST)
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
X-Inumbo-ID: 748a0781-b792-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733902511; x=1734507311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0te3i6s3e3e9P1sHuBoAmyFLAx8P4clDSX5l8m/TTUU=;
        b=MmNce2K7lV3XnQ6WPNkfYCnAsY8S8sqdbJpzHoX5AFZCt83tAwrHSeN1cOl8ebfVoa
         ztI0/kbrkzttj8ads/jrIvRLzg1SftP3d6CL+L3Ku7GOnZzfZeYf6utzGZJcPaQBR4BE
         L6BL7USTn4KEj6I0vackD50ScL2hk9YMebw3FDCawlLLmGobmIoJOwXO1+iYYnFLnYny
         tyw744JRDO+PIZHETE+gJay89OwblkDaV7h3jN/wx0lHmIHHpCpmkEp5QPEOpGqRzzql
         r7STNsXnlUNeuGHKvL1lPYoaqXTnQoF+DTluAoTKzRH5BPDhSTQDLI6OvK1S5PEqt+t7
         Dcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733902511; x=1734507311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0te3i6s3e3e9P1sHuBoAmyFLAx8P4clDSX5l8m/TTUU=;
        b=l0s+7/3N06ogazMkM4N0Zpd1UbJ0DTcLD1XKyaa2DuEqqf6yJnqPXUG0gNqH/Y7O0Y
         ZaoARvWZ3pVe1z2QUH6eQ/iZdGVJRXJIVQxejNE6nNJ6pITKZjWWA8xvwWT71bxTBWJB
         FduDyB19pYtMraY+m9EI6DAuXJXvbASZ7Yi8LsCFSNnw7FM2SgJ5kGDz3Gjuaw7b0L8e
         WvVzqzleWCDS2c7HQJBa4d19pt3WIe5WAA/Hk+ZxMUnwkox62BOFsJME+vxEv/pBSL2D
         EUybL4OjXSBH2tcMEOeJj469XHD8u0jiVHpwXHeo/xqN47uDzhfcUP2Z0AZkerhJjPRT
         X1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUf5ok7PsWkcVf/hVv/5Z/DxMCekwZ2vsX1k7yqNJCmHLiwXa1x3dJ9z4Nb/iTsLf/fjIbn5oYeNPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhledQa+54BauW9bbPgxfcHqCeMHS+67K/ymJLm+Dq+xeL9aMY
	IXaOHUjhzs8M4ni+ni0csM+nuOi4e2GBVO6Ch3bvD/y4n4XpZu4KU49fadZ4XA==
X-Gm-Gg: ASbGncugZnthcYHJp2kPIypyaOXDosNHxdUPjRkL2Hfp8JtYZxvr1Opj3UPVMUtxFhV
	gpWYgUN/JifgGBfSevtabCCaK7G8QXVrMrgUk2VlzHk0e6WrCN/uBReaL+CwJK5bypEt/Ibzf9j
	YEEiX/cojD/CIENJJ7uUAbRNjvYaIPvkhGDn/fmM6Q2wjwF/2ra4kJUYRkewyvPKmWmlCJb9YM5
	h+f9q7/zuqZieeMsI+Q/y4yesS81oDtOmGxmKd6E8VikqllgYB/eAPcxEpfOSy9HAcKTzHp4HK8
	poJtfxbuRb/R6KJCCF4ep9U/quP+KjdPTcgdPnk=
X-Google-Smtp-Source: AGHT+IFeMeerjoDELT58pwYtFBTLaoTzYHv5JumaFPflPpwERj0FG3o4rGMDm4mkXuy8eMrO8VGs9Q==
X-Received: by 2002:a05:6000:440c:b0:386:1cf9:b96e with SMTP id ffacd0b85a97d-3864ced8b04mr916435f8f.55.1733902511574;
        Tue, 10 Dec 2024 23:35:11 -0800 (PST)
Message-ID: <3f9d8b51-4542-4ac4-af60-d1afcf6281b5@suse.com>
Date: Wed, 11 Dec 2024 08:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/35] xen/console: enable console owners w/ emulated
 NS8250
To: Jason Andryuk <jason.andryuk@amd.com>, dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-34-e9aa923127eb@ford.com>
 <1b55c7eb-3e39-43d1-80d2-2d4caf6a0c76@amd.com>
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
In-Reply-To: <1b55c7eb-3e39-43d1-80d2-2d4caf6a0c76@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 23:46, Jason Andryuk wrote:
> On 2024-12-05 23:42, Denis Mukhin via B4 Relay wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Enable console focus for domains w/ virtual NS8250.
>>
>> Code change allows to capture the output from the guest OS now and send it to
>> the physical console device.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>>   xen/drivers/char/console.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>> index a26daee9c4c4b1134d0ae3d105ffdb656340b6df..798dfdf3412a2feef35e72946d6c59bee59a9251 100644
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -41,6 +41,9 @@
>>   #ifdef CONFIG_SBSA_VUART_CONSOLE
>>   #include <asm/vpl011.h>
>>   #endif
>> +#if defined(CONFIG_HAS_VUART_NS8250)
>> +#include <asm/hvm/vuart_ns8250.h>
>> +#endif
>>   
>>   /* console: comma-separated list of console outputs. */
>>   static char __initdata opt_console[30] = OPT_CONSOLE_STR;
>> @@ -627,6 +630,8 @@ static void handle_keypress_in_domain(struct domain *d, char c)
>>       {
>>   #if defined(CONFIG_SBSA_VUART_CONSOLE)
>>           rc = vpl011_rx_char_xen(d, c);
>> +#elif defined(CONFIG_HAS_VUART_NS8250)
>> +        rc = vuart_putchar(&d->arch.hvm.vuart, c);
>>   #endif
> 
> I think it would be nicer to just use a single name and avoid ifdef-ery. 
>   vuart_putchar() is generic and matches domain_has_vuart(), so that 
> seems good.
> 
> You can then have a default stub that returns -ENODEV for when an 
> implementation is not built.  (This goes along with Jan's suggestion of 
> a common, default domain_has_vuart().)  Something like:
> 
> #ifndef vuart_putchar
> static inline int vuart_putchar(struct domain *d, char c) {
>      return -ENODEV;
> }
> #define vuart_putchar vuart_putchar
> #endif
> 
> and ARM can do:
> #define vuart_putchar vpl011_rx_char_xen

+1

Jan

