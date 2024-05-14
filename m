Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A88C4D3E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721172.1124355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mof-000179-9m; Tue, 14 May 2024 07:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721172.1124355; Tue, 14 May 2024 07:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mof-00014e-6e; Tue, 14 May 2024 07:43:17 +0000
Received: by outflank-mailman (input) for mailman id 721172;
 Tue, 14 May 2024 07:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6mod-00014Y-HZ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:43:15 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d0806c2-11c5-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 09:43:11 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so1329662966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:43:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b0195dsm686296066b.184.2024.05.14.00.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 00:43:12 -0700 (PDT)
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
X-Inumbo-ID: 9d0806c2-11c5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715672593; x=1716277393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3T3F3wBgY2lowM3PHCpwiguoxntaMhIgnhnyvWn1vg=;
        b=W/AvKMm1UkURwdY99sPz/2MyIWkvZCREmyVMNziX/1KxGETxd1A+6s9AsUtLBJwQPD
         LkuIkA8MM39iQPw/DLFDR/B6LjNwA3alwMgkqCduFZubZrn57LOsOmZU9sqwMtl6YW5h
         QPJwV2iN20CTGVvXUE2ciYarzoNeP66nJZgLQ4Ku/b76yHcROVN2qaurHAQt49iAy/aQ
         LaLCHklJlNdAU3Md6lmtD+/65i4seVKyBhKzDsC2z4r94T+L9MtWucIWK3GY/qEszF49
         gC2Hfz/HW7y2WIirCRllWO+9VtqCQsMkw7TX2H00kwK/7EClw3e4fHV8iWokvbTJ9YAf
         NUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715672593; x=1716277393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3T3F3wBgY2lowM3PHCpwiguoxntaMhIgnhnyvWn1vg=;
        b=an/0xkXk8xC+D3gU1l38mq5Hkp3aADs6xm78jMXSKZKC1oSpEAvlRupULqkRLPAlhO
         q4gJBNOpgmpQuO53iFoatS3daD7WOwKfJ3xPJPysPOmfXuG1LDlz1IOu4963brWFYcs1
         OsPH2iGOQCsJ4AffJjToCsWowUBlgLjQbkavsDOCxFPOxcoLjCZZ33uA9y4LJVKQ2Y8w
         wzfDN11Kr/Y0OYre1Hs+Mt01+8sfLQeRYnCwMF0BxKfbQWyTureBcJQHGjjxL+GI1JTf
         DpRrHpWbGo1fljAvf4oEfPFyURaG/KMyxDU1+2Y80/qhf8YgKU58SCQoMxfl9BkkzKo+
         bVuA==
X-Forwarded-Encrypted: i=1; AJvYcCUsN1oaHSY7xCiaKVQXkCcapOaEthPvVvxRc9KqZp1WMry8Ya7yeiW9za1Qcvzk/03ga4T7li6tKfC5JsZwtLlgec6tKaDnNSQkJEm71G8=
X-Gm-Message-State: AOJu0Yzg/li6tsrUlGLzSKQCiBHeihpY8cRt0NqntXK6o3l7VV6kL09F
	pWiD6jQbXzIUcGM8yA5lQQ/9R8KZ/AzVKfczlv00EsKeeV+ZAimtqSOFy+CFe5zfKwpkKWVgp0o
	=
X-Google-Smtp-Source: AGHT+IGpzwXBf5dU5/rVk7zum2B2XClZ/K0f5UDayZ+j23o7xsQISy8R10sV2tSpxh3lXEB0mNhhiQ==
X-Received: by 2002:a17:907:d25:b0:a5a:2aed:ca2b with SMTP id a640c23a62f3a-a5a2d5c9fdcmr1041574366b.28.1715672592759;
        Tue, 14 May 2024 00:43:12 -0700 (PDT)
Message-ID: <ecb8814f-f9bf-4eb7-86ce-48bdd34f8bf9@suse.com>
Date: Tue, 14 May 2024 09:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86: detect PIT aliasing on ports other than
 0x4[0-3]
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
 <039b9ceb-4862-4e26-a344-e47fc04bd979@suse.com>
 <0cfaeb1f-947a-4e45-9f69-a0e3f8143e2a@amd.com>
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
In-Reply-To: <0cfaeb1f-947a-4e45-9f69-a0e3f8143e2a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.05.2024 19:40, Jason Andryuk wrote:
> On 2023-12-18 09:48, Jan Beulich wrote:
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -425,6 +425,72 @@ static struct platform_timesource __init
>>       .resume = resume_pit,
>>   };
>>   
>> +unsigned int __initdata pit_alias_mask;
>> +
>> +static void __init probe_pit_alias(void)
>> +{
>> +    unsigned int mask = 0x1c;
>> +    uint8_t val = 0;
>> +
>> +    if ( !opt_probe_port_aliases )
>> +        return;
>> +
>> +    /*
>> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
>> +     * count is loaded independent of counting being / becoming enabled.  Thus
>> +     * we have a 16-bit value fully under our control, to write and then check
>> +     * whether we can also read it back unaltered.
>> +     */
>> +
>> +    /* Turn off speaker output and disable channel 2 counting. */
>> +    outb(inb(0x61) & 0x0c, 0x61);
>> +
>> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
> 
> Channel 2, Lobyte/Hibyte, 0b000 Mode 0, (Binary)
> 
> #define PIT_MODE_CH2 (2 << 6)
> #define PIT_MODE0_16BIT ((3 << 4) | (0 << 1))
> 
> outb(PIT_MODE_CH2 | PIT_MODE0_16BIT, PIT_MODE);

Hmm. I can certainly see the value of introducing such #define-s, but then
while doing so one ought to also adjust other code using constants as done
here (for consistency).

>> +
>> +    do {
>> +        uint8_t val2;
>> +        unsigned int offs;
>> +
>> +        outb(val, PIT_CH2);
>> +        outb(val ^ 0xff, PIT_CH2);
>> +
>> +        /* Wait for the Null Count bit to clear. */
>> +        do {
>> +            /* Latch status. */
>> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
> 
> Read-back, Latch status,  read back timer channel 2

Was this meant as a request to extend the comment? If so, not quite,
as the line doesn't include any read-back. If not, I'm in trouble seeing
what you mean to tell me here (somewhat similar also for the first line
of your earlier comment still visible in context above).

>> +
>> +            /* Try to make sure we're actually having a PIT here. */
>> +            val2 = inb(PIT_CH2);
>> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
> 
> if ( (val2 & PIT_RB_MASK) != PIT_MODE0_16BIT )
> 
> I think particularly a define for PIT_MODE0_16BIT would be helpful to 
> show what is expected to be the same.
> 
>> +                return;
>> +        } while ( val2 & (1 << 6) );
> 
> I think Roger might have mentioned on an earlier version - would it make 
> sense to have a counter to prevent looping forever?

Well, as before: The issue with bounding such loops is that the bound is
going to be entirely arbitrary (and hence easily too large / too small).

> Also, FYI, I tested the series.  My test machine didn't show any aliasing.

That likely was an AMD one then? It's only Intel chipsets I've seen aliasing
on so far, but there it's (almost) all of them (with newer data sheets even
stating that behavior). We could, beyond shim, make the option default in
patch 1 be "false" for systems with AMD CPUs (on the assumption that those
wouldn't have Intel chipsets).

Jan

