Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C235A82A923
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 09:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666003.1036386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqRJ-00038b-7i; Thu, 11 Jan 2024 08:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666003.1036386; Thu, 11 Jan 2024 08:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqRJ-00036y-4N; Thu, 11 Jan 2024 08:29:25 +0000
Received: by outflank-mailman (input) for mailman id 666003;
 Thu, 11 Jan 2024 08:29:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqRH-00035X-FA
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 08:29:23 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85656041-b05b-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 09:29:22 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e54b2e437so20814195e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 00:29:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay12-20020a05600c1e0c00b0040d802a7619sm4992813wmb.38.2024.01.11.00.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 00:29:21 -0800 (PST)
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
X-Inumbo-ID: 85656041-b05b-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704961762; x=1705566562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z0PjHh98gEH5wksriLm0NVgosyxNyT4FnoTbeXFZfGY=;
        b=P0zSYsmXYPWLCe9DmFgYC4lO9WLPOW5v6BarTJz4wRbm+Ye/tF0baa7aRfwSbSNoZU
         heqw86IWNBGUS5EZMUN+VW0a7QNs1+c5J+C8K98aPeRsZMPlgvo+nkj4qxsgOII8bPNX
         ta4plnvkRhIgqPAbYUI2EhIb0nsJ/FBb45Akzg+fTv2qoiSEj2p5yZ5H66T2iOA2LKhP
         G4EtlHWloKZMD4FVMwMWjKQ2IzadPZDxoIEN3O/2BvsoY7Fknwoa1HzvOCRp2uqaLnIt
         1wCVi6XGff+yQ5OkO2ITSvqjKRqYzGL9JfYE1XqkFBnJubTYZBVGLzPXgUHCuwq75OrM
         V4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704961762; x=1705566562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0PjHh98gEH5wksriLm0NVgosyxNyT4FnoTbeXFZfGY=;
        b=iNKSLnKSkZPLEQaD6Awl/mHSdARAeIcJYhnlSSNFGXPi+X85VXs77+/eCZZYK45zG0
         02ZpBU1BGM13OB0AbDEBhIJAHJTl5v/S8oJ52wMMLE2NNSgRPCauAQ35fo7Rl99JXM24
         KCYEibcgB+8GxU4BIT2Va/CW/GKiLgS2QiGBfuTLs4VcUjTwvgJMAPtoiL0+gAFXxkWN
         iTZ1Pt4Zsl/QDEhBcHdgGbX5L/Oob99B3b/8yte9BSDyd8xdTZqkPxA2q8zeTHoDD2R2
         6CT8QoEBBocDZqt1GKPTCgkC8yJZq64KU9DLrDbWhGxBQ5TW2MRDrxcf2ubLr/SukAJv
         aPpA==
X-Gm-Message-State: AOJu0Yz+ExWBpBaXkqmP3GFH7JAbOnkMVNq7OpecpbRkpKP2qcPDKJ/0
	50F+ir/hyIlFEe+rQcF53HNTkw78nKpn
X-Google-Smtp-Source: AGHT+IGBxRu3EXBgDwmnb2+jjgikni6JbE0nhxbrNY6YaVf0c8rpcKPbXAL4Ct5TWwPNEIQk2VrclQ==
X-Received: by 2002:a05:600c:601a:b0:40e:4b16:a00f with SMTP id az26-20020a05600c601a00b0040e4b16a00fmr177106wmb.150.1704961761721;
        Thu, 11 Jan 2024 00:29:21 -0800 (PST)
Message-ID: <055945ed-86c8-48c1-851d-e87c4988c7a4@suse.com>
Date: Thu, 11 Jan 2024 09:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nmi: ensure Global Performance Counter Control is
 setup correctly
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240110153400.64017-1-roger.pau@citrix.com>
 <4bd7324f-69fc-42e5-9155-02a7e1a8a6e8@citrix.com> <ZZ7Mz0HymYQGpTna@macbook>
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
In-Reply-To: <ZZ7Mz0HymYQGpTna@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.01.2024 17:58, Roger Pau Monné wrote:
> On Wed, Jan 10, 2024 at 03:52:49PM +0000, Andrew Cooper wrote:
>> On 10/01/2024 3:34 pm, Roger Pau Monne wrote:
>>> When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
>>> MSR contains per-counter enable bits that is ANDed with the enable bit in the
>>> counter EVNTSEL MSR in order for a PMC counter to be enabled.
>>>
>>> So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
>>> bits being set by default, but at least on some Intel Sapphire and Emerald
>>> Rapids this is no longer the case, and Xen reports:
>>>
>>> Testing NMI watchdog on all CPUs: 0 40 stuck
>>>
>>> The first CPU on each socket is started with PERF_GLOBAL_CTRL zeroed, so PMC0
>>> doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
>>> relevant enable bit in PERF_GLOBAL_CTRL not being set.
>>>
>>> Fix by detecting when Architectural Performance Monitoring is available and
>>> making sure the enable bit for PMC0 is set in PERF_GLOBAL_CTRL.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> The fact that it's only the first CPU on each socket that's started with
>>> PERF_GLOBAL_CTRL clear looks like a firmware bug to me, but in any case making
>>> sure PERF_GLOBAL_CTRL is properly setup should be done regardless.
>>
>> It's each package-BSP, and yes, this is clearly a firmware bug.  It's
>> probably worth saying that we're raising it with Intel, but this bug is
>> out in production firmware for SPR and EMR.
>>
>>> ---
>>>  xen/arch/x86/nmi.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
>>> index dc79c25e3ffd..7a6601c4fd31 100644
>>> --- a/xen/arch/x86/nmi.c
>>> +++ b/xen/arch/x86/nmi.c
>>> @@ -335,6 +335,19 @@ static void setup_p6_watchdog(unsigned counter)
>>>           nmi_p6_event_width > BITS_PER_LONG )
>>>          return;
>>>  
>>> +    if ( cpu_has_arch_perfmon )
>>> +    {
>>> +        uint64_t global_ctrl;
>>> +
>>> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
>>> +        /*
>>> +         * Make sure PMC0 is enabled in global control, as the enable bit in
>>> +         * PERF_GLOBAL_CTRL is AND'ed with the enable bit in EVNTSEL0.
>>> +         */
>>> +        if ( !(global_ctrl & 1) )
>>> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl | 1);
>>
>> My gut feeling is that we ought to reinstate all bits, not just bit 1. 
>> If nothing else because that will make debugging using other counters
>> more reliable too.
> 
> Hm, yes, I was borderline on enabling all possible counters in
> PERF_GLOBAL_CTRL, as reported by CPUID.0AH: EAX[15:8].
> 
> But then wondered if it was going too far, as for the purposes here we
> just care about PMC1.
> 
> My reasoning for not doing it would be that such wide setup of
> PERF_GLOBAL_CTRL would then be gated on the watchdog being enabled,
> usages of other counters apart from PMC0 will be gated on the watchdog
> being enabled.

Since Andrew didn't explicitly say so in his reply - imo this then means
the adjustment wants moving out of setup_p6_watchdog().

Jan

>  It seems more reliable to me to either do the setting
> of PERF_GLOBAL_CTRL as part of CPU initialization, or defer to each
> user of a PMC to take care of enabling it in PERF_GLOBAL_CTRL.
> 
>> vPMU (although mutually exclusive with watchdog) does context switch
>> this register as a whole.
>>
>> See how global_ctrl_mask gets set up, although I'm not sure how much of
>> that infrastructure we really want to reuse here.
> 
> Yes, if we want to enable all possible counters we would need to use
> something similar to what's done there, albeit without the fixed
> counter part.
> 
> Thanks, Roger.


