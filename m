Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC09EC5AE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853939.1267266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHIT-00006a-Hg; Wed, 11 Dec 2024 07:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853939.1267266; Wed, 11 Dec 2024 07:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHIT-0008WP-Ej; Wed, 11 Dec 2024 07:38:13 +0000
Received: by outflank-mailman (input) for mailman id 853939;
 Wed, 11 Dec 2024 07:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHIR-0008WJ-6l
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:38:11 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de84ea60-b792-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 08:38:10 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso4857170f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:38:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd4757691dsm5229682a12.18.2024.12.10.23.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:38:08 -0800 (PST)
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
X-Inumbo-ID: de84ea60-b792-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733902689; x=1734507489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w8Hkm5oEcWa2S6aIY72eEl0XhJPFVlHxv7JbIStkNP4=;
        b=AiDZX/eOA+0GBjDwMIFuVditf5For4k0OnD6hmSc/qONJGkYz5p1BUx+4uuC5DZsJs
         9Mo8mqIBmpSoQ2GZMZrx5/XrC3CpfgPU2w0Bwif3XgkWvpm6l1iJoP65UJINpqegWNFw
         qJ4+o1EmgWakGMBGBgG6rM3uNLSLVM8gSuzbID3NyTJz3U28e0Vlpu3/HpVR2MiWbLwT
         9yP0A2lqdSLI0XnS25jdq+Sp7XxensVnSlVohm8CwRapdEiDb/O1ysATA0CD4STPA7wC
         tddcjFUYEufxQeMH1DAJxSuRfsCSN8F+fEE1CitvFf8TPWyuNpr0iosc+HsuGLQxZ4T+
         DMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733902689; x=1734507489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8Hkm5oEcWa2S6aIY72eEl0XhJPFVlHxv7JbIStkNP4=;
        b=vVw654vbioGVJyXRoI4Vi+HkSDIcm04MaLAfpR7f1gFI8Td7ijJDlBvMCYd2XX1l0l
         yoea0TF3qCqC6WPYcmEYW18W1WipKsTFzWFBxuCZTlaYlcoScDIkkgVcOHxnV8BG3PkB
         /g0l51WY5JHLvHifdJyBsJKuM0NlpbJPYe4BjTLkyCme7E2FN/yvtPflSdP4sM6neb2p
         am8Rd5MluqdmeSrq/lNxWOSv2Qt1fMs21R6IhihkOrZRYqf5vfSBMYmQwHtb1yXIkuj0
         JV2N1cAbhF9DaBUVgKfJ+n0uC3C/wu4nTCbJqPJbU0gxJdAVdCCH8fx6XweZczbiNvqt
         XDRA==
X-Forwarded-Encrypted: i=1; AJvYcCWnGZ/3T0HOThaN5GTVt9edU/SSeKIWuFAAujmvOUqY1fs6CRwtv7gkVWcSyfKDsln7emsk3u+GD+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylHXy5TKhEshP3WOcvGWFqMTyXlfpP3zUBChZxR885v8tBwe7k
	5Ip2OY7C5mBj9YIod5QbItkmRtBdRjXLRbtZKMRtd++1BzhUXoNiS8ancK3ALQ==
X-Gm-Gg: ASbGnctT13U6tdiTEIV0Z+GRhJNc6UzDpqebWHeg7h1nwjYXGCC5WeVngK/A7LQO7JK
	gmjoeX+XKoGuNJP+EKsMDwyMe8EeKFpleTbaBU8vA56CQZUYAoamCCKoyOAepTZsN6KKH+oBPZB
	JuC6r5t+JI5EQcdEYw2Z2EWHohTwbE7y0dbmiVj04xxOimhX1U2g1cilCLuU1DHq5eOXfkyQ3+z
	YZT6eq/Z+m7S408LsYWLoFxQS492w+MT+InjW2xtagmqskMzewhbYZi+xiTBM9cPU7oAAFo65Dn
	V6Xw7c4KFJ5a0YrOYsOyk+h8ERUM8MwkvElbCC4=
X-Google-Smtp-Source: AGHT+IGSeIg3dtIAR19TTb84TzLuFh9cJKbVrXrKNsucUCpcBVGpL2CpFxl2NeBDSoKs8rtNEoFcXg==
X-Received: by 2002:a05:6000:1a86:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-3864cec5761mr1294399f8f.38.1733902689429;
        Tue, 10 Dec 2024 23:38:09 -0800 (PST)
Message-ID: <9fbe795c-f580-4084-9ab4-dede708cd777@suse.com>
Date: Wed, 11 Dec 2024 08:38:01 +0100
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
> 
> x86 would need to change its arguments, but that should be straight forward.

Actually, I don't even see a need for the stub:

    {
#ifdef vuart_putchar
        rc = vuart_putchar(d, c);
#endif
     }

This way behavior won't change from what there is now, when vuart_putchar()
isn't defined.

Jan

