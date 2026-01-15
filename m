Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E7D24611
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 13:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204965.1519462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgM5P-00056T-E8; Thu, 15 Jan 2026 12:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204965.1519462; Thu, 15 Jan 2026 12:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgM5P-00053i-Ar; Thu, 15 Jan 2026 12:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1204965;
 Thu, 15 Jan 2026 12:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgM5N-00053c-VN
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 12:04:21 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52548c3d-f20a-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 13:04:19 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso568318f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 04:04:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a65bsm5589978f8f.7.2026.01.15.04.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 04:04:18 -0800 (PST)
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
X-Inumbo-ID: 52548c3d-f20a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768478659; x=1769083459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=es4pAXIiZJcaSHieisvPWWIhTRVmg+2omFF/nirmX0A=;
        b=EkNJqd+J8wUvWn859GfWndPkkTLS7goYYy6Up0CkVA3nSCzBsrrSfNqSkG7z6cYymA
         Ppufgp2bHI12DXZf0gPLydBJsUvlnea/cGV4c5YOec1ZdlLAMV8QDkBshe4ScFB7SXRN
         pGt5H5HMdi4xAU0xxeKKB9wvjK/Wj7ltrZeXyUZBLyKhBgStMxvpe3N0T6odR9kDH9zk
         uBq9bA+G4QMJ5wiUDJUWO234Rh8kKfvInw30Orm2cUB8jVhg4wy6nFd3rUCS9L+mfSZP
         IKmOLWYhNjfi1R+ZeXfu2pJUIjbnTQtQ7yiCxjmkLemjGs+g1cxW3LRlYU8kEZSVcHE3
         Xwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768478659; x=1769083459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=es4pAXIiZJcaSHieisvPWWIhTRVmg+2omFF/nirmX0A=;
        b=uT3CCzq5malZ03+bwHkEn33AVf0aJRiTGBu7TbLHKQYdtrnduHerZr8wPvL6uDZvMD
         PwC2dxw7nCQ/3V1y0DNgAHmy4Xt3gIBidRZNDL/5A0lz3EUP0iC9ZdeB+0FWpSuB1bcO
         ryFlW8bTN72ZpsOYstMyKhcOBerGPuXr2kOrMAqcOMs3xmoupHckMinkr0afNS85l9+q
         Ql00PBsqm4ykU7vk8Tqqq7IpFqphS6vjY0BEZ+LqYO3k1IWN5ro2BRlWeNiVT9XDE8U7
         5g/bzFpEMb6p39eWZ7xc7rQb0cSR4+i612+goSY+oq+R9pvwbeewjIadeEPBkwe20gvg
         exDA==
X-Gm-Message-State: AOJu0YwzRRHm9sUsxPjN3SlTATpSwLQoyT/IHTX1Y75jQHIwNjvTjsbA
	WfjHgcHXYiw8M/QsAfKtX4rG+EvVxciMSQxXh9F3npXD48ZKe6XorcpmoJ1dgExYcw==
X-Gm-Gg: AY/fxX5rU/avnlsWZE0ishTLp3ZvaiTzZZMtkC9cn94JBN4nW2WtTWaXaM5NmIgcZbs
	EiQ3IpcPLeSWgSLHizHzDUMU2KCfF6w3uzN/lVRAf+UnC0g67PNdSFCPyw+i+OeB+YDk/zUUdD8
	uTGkrOtzZy9EsphveulaTIJy0jHoHwF7OPCQSD5d48dC6aHieCFLftSfOhMiCJ3+EQGjoFpBTwQ
	S5xN5xfaQTPlLm7GKI/wMLvlV/JZnBWY2VW1rYol6yRM+z+cElJ78Wq2wlGuWp+t6zXEJrE2puD
	q/TkDuyNoH1Mg6/sfJ7AQNfmDW2AB+pYPFbH6bQMIhSP3bQpBbWBacHDEtJCRKbJO04QBx8UoQO
	lQrbC/hVqhDXCeEcOEBnZgjWI75DOpG6vfP+J1gAFLm2vCEVCkAPqtdadlMPU9ENgj+Wu0T9MSr
	sZ+0wBWoU0o/8r0RFKhn7p0A3J7wVocObc1Zbs49dGi1pFgolkGiZqdhfl1J7kCWKxg6ejlKgnc
	dU=
X-Received: by 2002:a05:6000:1867:b0:430:f449:5f17 with SMTP id ffacd0b85a97d-4342c569a14mr7689406f8f.42.1768478658864;
        Thu, 15 Jan 2026 04:04:18 -0800 (PST)
Message-ID: <cedf6fab-90ea-4d04-8410-a816926d2673@suse.com>
Date: Thu, 15 Jan 2026 13:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <aWfXJk90Sh7B-qi7@Mac.lan>
 <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com> <aWikMGJKa3VPQQzi@Mac.lan>
 <49507100-faa9-4480-a534-e4bab6cecc5b@suse.com> <aWjUEsp0dHsbjhyn@Mac.lan>
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
In-Reply-To: <aWjUEsp0dHsbjhyn@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 12:48, Roger Pau Monné wrote:
> On Thu, Jan 15, 2026 at 11:38:10AM +0100, Jan Beulich wrote:
>> On 15.01.2026 09:24, Roger Pau Monné wrote:
>>> On Thu, Jan 15, 2026 at 09:00:07AM +0100, Jan Beulich wrote:
>>>> On 14.01.2026 18:49, Roger Pau Monné wrote:
>>>>> On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
>>>>>> amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
>>>>>> comment towards the TSC being "sane", but is that correct? Due to
>>>>>> TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
>>>>>> wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
>>>>>> calling tsc_ticks2ns()?
>>>>>
>>>>> amd_check_erratum_1474() runs after early_time_init(), which would
>>>>> have cleared any TSC_ADJUST offset AFAICT.  There's a note in the
>>>>> initcall to that regard:
>>>>>
>>>>> /*
>>>>>  * Must be executed after early_time_init() for tsc_ticks2ns() to have been
>>>>>  * calibrated.  That prevents us doing the check in init_amd().
>>>>>  */
>>>>> presmp_initcall(amd_check_erratum_1474);
>>>>
>>>> Hmm, I should have written "Due to e.g. TSC_ADJUST". Firmware may also
>>>> have played other games with MSR_TSC.
>>>
>>> For amd_check_erratum_1474() we don't want to subtract boot_tsc_stamp,
>>> otherwise when kexec'ed we won't be accounting properly for the time
>>> since host startup, as subtracting boot_tsc_stamp would remove any
>>> time consumed by a previously run OS.
>>
>> For both this and ...
>>
>>>>>> A similar issue looks to exist in tsc_get_info(), again when rdtsc()
>>>>>> possibly returns a huge value due to TSC_ADJUST. Once again I wonder
>>>>>> whether we shouldn't subtract boot_tsc_stamp.
>>>>>
>>>>> I would expect tsc_get_info() to also get called exclusively after
>>>>> early_time_init()?
>>>>
>>>> Same here then (obviously).
>>>
>>> For tsc_get_info() I think you are worried that the TSC might
>>> overflow, and hence the calculation in scale_delta() would then be
>>> skewed.  We must have other instances of this pattern however, what
>>> about get_s_time_fixed(), I think it would also be affected?
>>>
>>> Or maybe I'm not understanding the concern.  Given the proposed
>>> scale_delta() logic, it won't be possible to distinguish rdtsc
>>> overflowing from a value in the past.
>>
>> ... this, my main point really is that scale_delta() (as its name says),
>> and hence also tsc_ticks2ns(), shouldn't be used on absolute counts, but
>> only deltas. (Yes, an absolute count can be viewed as delta from 0, but
>> that's correct only if we know the TSC started counting from 0 and was
>> never adjusted by some bias.)
> 
> Well amd_check_erratum_1474() does want the delta from 0 to the
> current TSC, because that's the best? way to see when C6 needs to be
> disabled.  Otherwise we just straight disable C6 on boot on affected
> systems.

I think that may be necessary when we don't know what was done to the TSC
before we took control of the system.

Jan

