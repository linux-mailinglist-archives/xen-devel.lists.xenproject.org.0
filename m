Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192B18988D4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 15:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700891.1094664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNCK-00078t-SW; Thu, 04 Apr 2024 13:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700891.1094664; Thu, 04 Apr 2024 13:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNCK-00075v-PB; Thu, 04 Apr 2024 13:32:08 +0000
Received: by outflank-mailman (input) for mailman id 700891;
 Thu, 04 Apr 2024 13:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsNCJ-00075j-6O
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 13:32:07 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba86fc74-f287-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 15:32:06 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so314978f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 06:32:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bn24-20020a056000061800b0034353b9c26bsm10156859wrb.9.2024.04.04.06.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 06:32:05 -0700 (PDT)
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
X-Inumbo-ID: ba86fc74-f287-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712237525; x=1712842325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izZUR/QHQLPrkIQzsPXZ1lgEk01oBu44oP7OE9oqBBw=;
        b=I00g3g7kacq8e9vAFguzD3CFZl6g9qGBeO1ClR07VQR/PsANwxWMHvWDLDdlekXANt
         zSV65BJZkAxw8bkSCiDUE2jsZFPwZd64qpKA/X6zofzBjUwJTBDK9PwEMaCqDy525eKZ
         DPhQTzkEuvDUc2tnmVWk0RP+VhH7CrtinWFla6n+ce8wDy0FPTly6OMtd1H7hnWIr75g
         DBUn+yz5oPGJ43WmOKLMtj7q7T9QKSqt3MlJqyeRpUKNrqH1s3IY423zJNwtKkgYa2is
         Ds27RcwC0L5Xiid8V2JqtO/PujWuDPeTZbEih/r4D+lxTPJXXqEoITI5Rc+2AVYGLb8H
         wYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712237525; x=1712842325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izZUR/QHQLPrkIQzsPXZ1lgEk01oBu44oP7OE9oqBBw=;
        b=OylaMZ+IaevQL2opmpluv8sicC66Al2y54A8xk8Mi4XGe63+DUvljV2psJGvCXiZcf
         UKCidz4MnTskQ3b1dNz4PZ2L2/vjaMdPVRMMrPyUW6vVH5OK/YrXT8dsUEB98BCNKiE/
         pNZXB/r+ubS9vkZljSWU5vodLg3KvVu7eD+nMIA3Hu3yJzD/ISdgt6IHia5bAOwXMfMH
         oV6ZLhs4c+xSzFGfnZoNJTv3XYnjJiD4AS5Ea6rmErNVb2WEG3xEM52HU+0mn0sZepS1
         3jzd9a8pJk9WrHpi4/ksTZR7iCTqVdE9+eRRY1SCPKj5MhKYnN0+sXsBV63B6H+5dj1K
         GmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6v9IvEVNNM+sPwNaunAn/JUBpWbdMn65mWMGzbPnmEmNQRbOmjgWAr6FedlxTaAoTd4KzihF4JAAtkFQTX61BNxufsI1j3OSMWDJRYv0=
X-Gm-Message-State: AOJu0YxEU85eL/RUWSiBDZ/kLSMnQb+pYvrs3qlNQYLzE3Jahj42SBo3
	WW8KN1rD5zIfl3/47YIbVPPSoRwmecl5/idiP9gP4ngO/XIFnCdmmHkgjijQtg==
X-Google-Smtp-Source: AGHT+IHlc2eiff20eKTdxyBFXb87uCG0wGysdXCuISdRf1lqnI1D1y3GYYqWxaAuW1w4ijMw/Zpj3g==
X-Received: by 2002:adf:db46:0:b0:343:65a8:406d with SMTP id f6-20020adfdb46000000b0034365a8406dmr2117120wrj.64.1712237525491;
        Thu, 04 Apr 2024 06:32:05 -0700 (PDT)
Message-ID: <071e8a23-6a16-4a61-aa42-1f85a9c98203@suse.com>
Date: Thu, 4 Apr 2024 15:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <Zg1stUacaDBkyDOn@mail-itl>
 <20240404104122.2870129-1-andrew.cooper3@citrix.com>
 <6e99f73f-bf83-4c40-b97c-5cead300a781@suse.com>
 <7ebf879b-01d1-4a13-9464-199d08960213@citrix.com>
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
In-Reply-To: <7ebf879b-01d1-4a13-9464-199d08960213@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 15:22, Andrew Cooper wrote:
> On 04/04/2024 1:45 pm, Jan Beulich wrote:
>> On 04.04.2024 12:41, Andrew Cooper wrote:
>>> @@ -9,6 +10,7 @@
>>>   *  -1 => Default, altered to 0/1 (if unspecified) by:
>>>   *                 - TAA heuristics/settings for speculative safety
>>>   *                 - "TSX vs PCR3" select for TSX memory ordering safety
>>> + *  -2 => Implicit tsx=0 (from RTM_ALWAYS_ABORT vs RTM mismatch)
>>>   *  -3 => Implicit tsx=1 (feed-through from spec-ctrl=0)
>>>   *
>>>   * This is arranged such that the bottom bit encodes whether TSX is actually
>>> @@ -114,11 +116,50 @@ void tsx_init(void)
>>>  
>>>          if ( cpu_has_tsx_force_abort )
>>>          {
>>> +            uint64_t val;
>>> +
>>>              /*
>>> -             * On an early TSX-enable Skylake part subject to the memory
>>> +             * On an early TSX-enabled Skylake part subject to the memory
>>>               * ordering erratum, with at least the March 2019 microcode.
>>>               */
>>>  
>>> +            rdmsrl(MSR_TSX_FORCE_ABORT, val);
>>> +
>>> +            /*
>>> +             * At the time of writing (April 2024), it was discovered that
>>> +             * some parts (e.g. CoffeeLake 8th Gen, 06-9e-0a, ucode 0xf6)
>>> +             * advertise RTM_ALWAYS_ABORT, but XBEGIN instructions #UD.  Other
>>> +             * similar parts (e.g. KabyLake Xeon-E3, 06-9e-09, ucode 0xf8)
>>> +             * operate as expected.
>>> +             *
>>> +             * In this case:
>>> +             *  - RTM_ALWAYS_ABORT and MSR_TSX_FORCE_ABORT are enumerated.
>>> +             *  - XBEGIN instructions genuinely #UD.
>>> +             *  - MSR_TSX_FORCE_ABORT is write-discard and fails to hold its
>>> +             *    value.
>>> +             *  - HLE and RTM are not enumerated, despite
>>> +             *    MSR_TSX_FORCE_ABORT.TSX_CPUID_CLEAR being clear.
>> Of these 4 items you use the first and last here. It took me some time to
>> figure that the middle two are (aiui) only informational, and that you
>> assume that first and last together are sufficient to uniquely identify
>> the problematic parts. Separating the two groups a little might be helpful.
> 
> All 4 points are relevant to the if() expression.

In which way? You don't probe XBEGIN to see whether you get back #UD. And
you also don't probe the MSR to see whether written bits are discarded.

>> For the write-discard property, how was that determined? Does it affect all
>> writable bits?
> 
> Marek kindly ran a debugging patch for me last night to try and figure
> out what was going on.
> 
> Currently, Xen tries to set 0x2 (TSX_CPUID_CLEAR) and debugging showed
> it being read back as 0.
> 
> I didn't check anything else, but I have a strong suspicion that I know
> exactly what's going wrong here.

Hmm, at the risk of upsetting you: Is a suspicion really enough for a
firm statement in a comment?

> The property the if() condition is mainly looking for is !RTM &&
> !(MSR_TFA.CPUID_CLEAR) because that's an illegal state in a
> 
>>
>>> +             * Spot this case, and treat it as if no TSX is available at all.
>>> +             * This will prevent Xen from thinking it's safe to offer HLE/RTM
>>> +             * to VMs.
>>> +             */
>>> +            if ( val == 0 && cpu_has_rtm_always_abort && !cpu_has_rtm )
>>> +            {
>>> +                printk(XENLOG_ERR
>>> +                       "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",
>> This isn't really firmware, is it? At least I wouldn't call microcode
>> (assuming that's where the bad behavior is rooted) firmware.
> 
> Microcode is absolutely part of the system firmware.

The ucode ahead of being loaded into CPUs is, sure. But once in the CPU
(and there may not be any loading at least in theory), it's not anymore.
It becomes part of the CPU then, albeit I still wouldn't call it "hardware".

Plus saying "firmware" suggests that firmware vendors could do anything
about the situation, when I don't think they can.

Jan

