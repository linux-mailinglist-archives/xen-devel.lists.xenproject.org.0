Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF838899E3B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 15:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701299.1095660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjZF-0005Da-Dr; Fri, 05 Apr 2024 13:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701299.1095660; Fri, 05 Apr 2024 13:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjZF-0005C3-Az; Fri, 05 Apr 2024 13:25:17 +0000
Received: by outflank-mailman (input) for mailman id 701299;
 Fri, 05 Apr 2024 13:25:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsjZD-0005Bv-W9
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 13:25:15 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efe410cd-f34f-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 15:25:14 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4162e8210b6so5704745e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 06:25:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b004161df7c9dbsm3030278wmq.32.2024.04.05.06.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 06:25:14 -0700 (PDT)
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
X-Inumbo-ID: efe410cd-f34f-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712323514; x=1712928314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXcB1IQRzCoDtovDswAuIJfRsNfKHS05k9ajnD/zrWw=;
        b=GPnR7K/bGPttChVbAXt4QtvdFDMRGGHrEVzdxesx9koLrtfci3G5+cSODw1FZe+1ut
         nMoIhUGRR0lGGj4eH9AdDHFSKelqFZlxq8C6aRrC9ROUNttMwu8SORQfRVop5hQ3f5ck
         goPtFhFUUt6i5kpjN4tm248b/WDM9Nup7EceR80f4NiulMBBI7Sn68R+D5bb0rJ1+sNs
         SnUCP4Pebpb/CtFR5feeZPG6B2jX6JBNAD0T3z47K7tc7/evZ9CNC6BDNWwBWPiy9bCz
         3k9bHAEV/OEfSB6wFHn2gc6LUczzquE4SbuG6XjrUZns8UAHR6+VN67DFaYWrXwTlth7
         dQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712323514; x=1712928314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXcB1IQRzCoDtovDswAuIJfRsNfKHS05k9ajnD/zrWw=;
        b=FAf2YcO8gdfad6Dm4j/aGQrsgCQMcVwxGRul4nnSPgigkT8rTG5MJ5SDd79HQskBjz
         PD5wXZq5jo0nlkHjxmF6d8juIY+PUriUngus+UJ7QXKNvEN6fPsNzoYAsn+ENbJ+BmU7
         +oog5uOUiQ2FGgHGVUcibD83LEyJaxVe5Y8hsfnVFHJhYmr0xzBzxIDfaTnJLXstM90s
         5++ngdBbC4iTbb5r9YQgCcVJWznLgSJhd4N3V7TUGaHEjgYuSeAVPLTIk/mYuXKk2e0E
         8wULNTOE4gYrIN4EjX3+Ly+7U/VAQDF8RVJ61i+okw2ZIQXwF2gA13wfTzHiVO9eW+0o
         lO0A==
X-Forwarded-Encrypted: i=1; AJvYcCWljYVKRpE1XwIduMSaA+zEhI3Ym4bdj49wk4369o4R32qOgGGSInJlH6XGd38X7JPKlzKI0De8/t4w2sH7fOq+WSVEG6jlf5JGPyjmDk8=
X-Gm-Message-State: AOJu0YzoYYy1P5DbmyV4hb5ah2FFVwy6KmQcgaEiPg7Aa60t6S8lBBT7
	nE7a9FDfhKx0prwJ8sNelmFbdPENkXGgwLDN4ezvZJ7jBDI/WWN/xS4qXX1oBA==
X-Google-Smtp-Source: AGHT+IEEYeRqWxAXYj5/avTV++XjlTgFmJefU/nB0nm0y5qHH3NwqCfnK+fXv5VtyCrSax2I7FeFdA==
X-Received: by 2002:a05:600c:1c8d:b0:415:6cf0:b25b with SMTP id k13-20020a05600c1c8d00b004156cf0b25bmr1246686wms.6.1712323514406;
        Fri, 05 Apr 2024 06:25:14 -0700 (PDT)
Message-ID: <1be09216-7d6e-4667-a1ca-6fa401cd2631@suse.com>
Date: Fri, 5 Apr 2024 15:25:13 +0200
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
 <071e8a23-6a16-4a61-aa42-1f85a9c98203@suse.com>
 <ea554cd5-8578-49ae-adb6-e2dfab6cb946@citrix.com>
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
In-Reply-To: <ea554cd5-8578-49ae-adb6-e2dfab6cb946@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 15:01, Andrew Cooper wrote:
> On 04/04/2024 2:32 pm, Jan Beulich wrote:
>> On 04.04.2024 15:22, Andrew Cooper wrote:
>>> On 04/04/2024 1:45 pm, Jan Beulich wrote:
>>>>> +             * Spot this case, and treat it as if no TSX is available at all.
>>>>> +             * This will prevent Xen from thinking it's safe to offer HLE/RTM
>>>>> +             * to VMs.
>>>>> +             */
>>>>> +            if ( val == 0 && cpu_has_rtm_always_abort && !cpu_has_rtm )
>>>>> +            {
>>>>> +                printk(XENLOG_ERR
>>>>> +                       "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",
>>>> This isn't really firmware, is it? At least I wouldn't call microcode
>>>> (assuming that's where the bad behavior is rooted) firmware.
>>> Microcode is absolutely part of the system firmware.
>> The ucode ahead of being loaded into CPUs is, sure. But once in the CPU
>> (and there may not be any loading at least in theory), it's not anymore.
> 
> You appear to have a very singular impression of what does and does not
> constitute firmware.

Not so singular, I would say: https://en.wikipedia.org/wiki/Firmware
The only mention of microcode there is for historical context, afaics.

Jan

> If you can change Intel and AMD's mind on this matter, feel free to
> submit a patch changing the wording here.
> 
> ~Andrew


