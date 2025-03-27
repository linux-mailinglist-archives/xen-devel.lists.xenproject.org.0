Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D65A72D2C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928888.1331532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txk1r-0003DF-DV; Thu, 27 Mar 2025 10:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928888.1331532; Thu, 27 Mar 2025 10:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txk1r-0003AJ-AK; Thu, 27 Mar 2025 10:00:03 +0000
Received: by outflank-mailman (input) for mailman id 928888;
 Thu, 27 Mar 2025 10:00:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txk1p-0002m6-NJ
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:00:01 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f26c9d6-0af2-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 11:00:00 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso5314055e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 03:00:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314e110sm32948565e9.39.2025.03.27.02.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:59:59 -0700 (PDT)
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
X-Inumbo-ID: 3f26c9d6-0af2-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743069600; x=1743674400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mByp0QV7TbmpctPpR6AJlDh8Sj40UN247eMOEWwZ2Tw=;
        b=CyUTP7WZ3jSYwRbJj533l95tPLRAF2YMj7PnQYG02RfHm5WFnXGg9tNwwhWs/sp3dx
         DElmVHECg1b52ac9090A7I56yMefU7wvZIKUEacb1HECS3u+JcxP1zX5JTlVBHJZKLH2
         i3WzUkxsAWP2GsOePCPJ3C95ioedNk1WhwFN4dc1t8/Qkfzsufg0w/vnaJ3A23I2mC5X
         10qzEjZcIxWVNp2tHohqxvdlqkkYtQLZ3+P20ZzXe7pztU0k2D+pZZRij/2OU1KxkAHB
         A+MTg6E1ljDLYepOi/M4QvNga7gYOGGok+DtMqbpssDsptfzHQ69042dQgQJzsK4RnjY
         Bm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069600; x=1743674400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mByp0QV7TbmpctPpR6AJlDh8Sj40UN247eMOEWwZ2Tw=;
        b=IE6n9dmCo1EylNkboEPZ83vaRqQPOFw9ewn5eZLzkG8c5QIFBH7CY+zWd3sDWfdVMh
         GQuB0RFTg4GE3K30tUue1n0Cddi8lItuTbbs/h8PnkPnuv3sPkYxiFzhA2ByONMORXwv
         CYW79AYobLtWqTHB6j/capMSFE8VrwtNAzoAgAOgx4KN4WLxr0Y3amnCLhlrleGId94G
         9yvlQtwrKL8fPzNlcSuEf8r8BNU3ocjXKiypSBgSwRaJCG9u7K4SzdmU17XE5sqqZdiV
         9z6o0PUqqGOsGabptZrhpr4MJE1oydOcAxtNTHsyDN1DFzHs9n7Z/5gULYL/oOLgxF7L
         vMVg==
X-Gm-Message-State: AOJu0YwIfGGeTre/tOsjsFlprSASz6/AphInXZbi3NhOtjuK2uAA2Bl1
	CXUwMD7xomL5biZB4XLpYN19hMmrbyRgrUK43QdWANEWdcTRwTCz4j4rUhx8+w==
X-Gm-Gg: ASbGncsWgSIM5pZPmVHiVm8Zsqwbv45MkSh64MzMLrzHfQBe9yslTDFWK8afAntQVkm
	Ar16MwiYhDjkZu6oMEK+g8WxiplY2bhmqR0f70vIDmwYg+3/nFnygvGwdqkKsSQC5QSU81tCgTW
	dwxXWpr8Knk6qYBtvuhFtQTX83OcwKXidNsT6xuT39G+zRu0G2uLr303vAZL2SBrOxZWmbJs7Om
	Kv/KL2JL2y2u7UpEU0r5uSXIsfwqu5SZFM4+j0VOs5ctp0df9ZCFApqJLJ3J7Kh9kTKxPwgbMF6
	g3ZwBbfKhpdTsW50y5jr+IJjwriWTo9RCZ0JZ4A5gveMR6MKYf7mMOc20PRyYS9h0UI9hfBxqbo
	CxF2ZEyReGxikOppmMT2KY9ZLwldOAw==
X-Google-Smtp-Source: AGHT+IEuGp2V4qOYk0GvIRS7Z1xnCZJJ6Ml+PVVzX0GHmCFTl2et5VU9RMunGAFlqzoYFQ2v3Nk2xQ==
X-Received: by 2002:a05:600c:1e08:b0:43d:16a0:d82c with SMTP id 5b1f17b1804b1-43d8d5b0111mr909535e9.2.1743069600072;
        Thu, 27 Mar 2025 03:00:00 -0700 (PDT)
Message-ID: <90c81e5a-97d8-47b7-9cdf-aa07a59ed4f7@suse.com>
Date: Thu, 27 Mar 2025 10:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/CPU: don't hard-code MTRR availability
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
 <Z-UKm6D9pmAEaE_9@macbook.local>
 <eb44921a-f6af-4aa9-9395-18e4e47d440a@suse.com>
 <Z-UfcHfHys6c0HZb@macbook.local>
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
In-Reply-To: <Z-UfcHfHys6c0HZb@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 10:50, Roger Pau Monné wrote:
> On Thu, Mar 27, 2025 at 10:15:03AM +0100, Jan Beulich wrote:
>> On 27.03.2025 09:21, Roger Pau Monné wrote:
>>> On Tue, Mar 25, 2025 at 08:18:11AM +0100, Jan Beulich wrote:
>>>> In particular if we're running virtualized, the underlying hypervisor
>>>> (which may be another Xen) may not surface MTRRs, and offer PAT only.
>>>
>>> At least for Xen, I think we offer MTRR uniformly, even on PVH
>>> guests?
>>
>> By default we do, but we discussed the option of offering PAT-only environments
>> beyond leaving it open whether people disabling MTRR support in their guest
>> config are outside of supported terrain.
>>
>>>> Fixes: 5a281883cdc3 ("Hardcode many cpu features for x86/64 -- we know 64-bit")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> My main concern is whether the !mtrr path is still functional.  Have
>>> you tried booting the resulting hypervisor with MTRR masked on CPUID?
>>>
>>> (or alternatively short-circuiting cpu_has_mtrr == 0?)
>>
>> I didn't think this would be a prereq here. If we boot in an environment truly
>> lacking MTRR, we'll crash on the first MTRR MSR access - none of those accesses
>> use the safe accessors.
> 
> Right, hopefully we don't have unprotected MTRR MSR accesses, so
> cpu_has_mtrr == 0 should prevent those.

Actually we do, see my other patch just posted.

>> Since you asked, I tried booting with "cpuid=no-mtrr".
>> As I'm doing this on a system with console, all I can say is that it takes
>> minutes to reach the point where we'd start setting up Dom0 (which itself then
>> takes so long that I timed out waiting for it to make progress), due to all
>> screen output becoming unbelievably slow after AP bringup. Surely something's
>> screwed somewhere, as VRAM accesses being slow (or fast) shouldn't depend on AP
>> bringup having completed. I actually suspect it's not just VRAM accesses which
>> are slow, but that we're left running in uncachable mode altogether for whatever
>> reason.
>>
>> What this maybe useful for is to figure out the reason of "Platform timer
>> appears to have unexpectedly wrapped <N> times", which I saw appear once.
>>
>> Given this, I'm actually uncertain whether it is legitimate then to take your
>> ack.
> 
> I think it might be best if we can figure out what causes those issues
> (and possibly fix them) before taking this patch?
> 
> Albeit you could argue that running excruciatingly slow is better than
> just crashing of an unhandled #GP from a rdmsr.

Indeed that's my thinking. But if you prefer, I can wait with this patch until
after the other one has gone in.

Jan

