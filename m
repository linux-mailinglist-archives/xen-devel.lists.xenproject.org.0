Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E086CA46
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687122.1070038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgU7-0007qa-HQ; Thu, 29 Feb 2024 13:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687122.1070038; Thu, 29 Feb 2024 13:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgU7-0007mh-EG; Thu, 29 Feb 2024 13:30:03 +0000
Received: by outflank-mailman (input) for mailman id 687122;
 Thu, 29 Feb 2024 13:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfgU5-0007Q0-CW
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:30:01 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2fe5cef-d706-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 14:30:00 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so144555666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:30:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ts6-20020a170907c5c600b00a443858cf78sm688122ejc.185.2024.02.29.05.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:29:59 -0800 (PST)
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
X-Inumbo-ID: a2fe5cef-d706-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709213400; x=1709818200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YvmJUgixnktpYQND47KyjYjCa+vl6iYdDcZMASTpmUc=;
        b=b5ATq1egUInjkFXydlHftmM/M88DXM+PsSuk4XPJl6HQVfxV4pW+adUyt5sV/Ptd7c
         hFzczgt4sQ7qEo8KOH0gLFSP7HFTTu+REqISuBeIOv80+GCaY2RKhBfmwmSKtiQBnXgv
         +ZOtuqtXLV1DRFd5wVICkLH6gprLlwHlHTzWa2w9ZBOCpAnb4SdBldylIb+8Yze2AFvn
         u3fen3jfoK+Z8Jl8LpgGSejZjzbVHYoxBShqwzOJIcBGxnMAMjxeQUx4YRRsa+ZflaW1
         10q7MP68P9ZR4sPaxlDpN5stH4eYMIkcXYd8LhH/ADIzazRsrJLgEzEeKPO+61Bf0BkQ
         3I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213400; x=1709818200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvmJUgixnktpYQND47KyjYjCa+vl6iYdDcZMASTpmUc=;
        b=c2jnPhV+ejYKd2OdiVDpvzVTPPDD34yNoca4vXwCUXhyU8rNBt7nLb3cGycpYQjsF3
         cfJ1f8iRzRLq+dH1GD8EwMDCaFVmxAeoFJTVyoMy77iVb0Ml7qHSopphED8rjdoMUHPU
         jb7r33bnHOG5cmNqbWh1o5JLeVjOdUSd2IkOODq5lG0WaFX/Y58DYLVd4rSCgPAE1qpp
         N/t3lRiDWKJv5/Za9O6pO+jbrdb7RUTtDdB+lFOXhPYd7uuVdASAWdar5OQwjmQHWDsF
         3+myVMY2TwYl7R2RzknWbiFste9NMroY01PqVlyRwWgs4BtXvOl548sZ4mgoz7HgsaAM
         QcQA==
X-Forwarded-Encrypted: i=1; AJvYcCULOqQ0VRmKmzr47vVajXgNKTqHiOsZnepopsruezSC3fae6n+l5fCyziLXZ4rj8P6SfyoHW2xSk1ksNBB6W7V1tAcYIrYO82kqPk8yIQA=
X-Gm-Message-State: AOJu0Yxd91ntD2YlJ1pqkqV7mbvKZSwUJ6h7+v36sc0OynzVaNeE42TL
	8tPEJRjt3BKWgsizWfiyYrS3697SjixjL8MJIEZmaP7o0CkluYFGdT41MmduhQ==
X-Google-Smtp-Source: AGHT+IFNpNMgIZSB5VcDdo6p03Y2wvWPnxLy46yfdLaHDyaL2fqYFY0VqMpeaPi8YrhuhQ+jBe22Lw==
X-Received: by 2002:a17:906:48b:b0:a43:1e2b:b069 with SMTP id f11-20020a170906048b00b00a431e2bb069mr1501461eja.4.1709213399705;
        Thu, 29 Feb 2024 05:29:59 -0800 (PST)
Message-ID: <e811b3b0-a3d6-488d-b93c-e24c416477bf@suse.com>
Date: Thu, 29 Feb 2024 14:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
 <707ff486-b448-4bc0-be7e-1c692b360734@suse.com>
 <623e9c0e-f05f-41e7-a800-0bba01cba7f4@citrix.com>
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
In-Reply-To: <623e9c0e-f05f-41e7-a800-0bba01cba7f4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 14:23, Andrew Cooper wrote:
> On 29/02/2024 12:47 pm, Jan Beulich wrote:
>> On 29.02.2024 11:43, Andrew Cooper wrote:
>>> Right now, the host x2APIC setting filters into the PV max and default
>>> policies, yet PV guests cannot set MSR_APIC_BASE.EXTD or access any of the
>>> x2APIC MSR range.  Therefore they absolutely shouldn't see the x2APIC bit.
>>>
>>> Linux has workarounds for the collateral damage caused by this leakage; it
>>> unconditionally filters out the x2APIC CPUID bit, and EXTD when reading
>>> MSR_APIC_BASE.
>>>
>>> Hide the x2APIC bit in the PV default policy, but for compatibility, tolerate
>>> incoming VMs which already saw the bit.  This is logic from before the
>>> default/max split in Xen 4.14 which wasn't correctly adjusted at the time.
>> What about guest_cpuid()'s handling of leaf 0xb then? The %edx value
>> will change once a guest is rebooted, aiui. The comment in
>> recalculate_cpuid_policy() that you update refers to that.
> 
> That comment is going in the next patch irrespective.
> 
> But yes - this will change leaf 0xb from being
> host-conditionally-visible to always hidden.

Imo this wants saying explicitly, including why that's okay to do,
especially since ...

> PV guests don't have any coherent idea of topology.  Linux (with the
> topo fixes) now explicitly ignores everything it can see and just fakes
> up a flat non-SMT topology in a single package.

... you validly use "now" here. Plus Linux isn't the only PV guest we
need to care about.

What's wrong (more wrong than the present putting of vCPU ID * 2 there)
with retaining the population of that leaf (by dropping the x2apic
dependency there)?

>>> This wants backporting as far as people can tollerate, but it's really not
>>> obvious which commit in 4.14 should be referenced in a Fixes: tag.
>> Why 4.14? In 4.7.0 I see ...
>>
>>> @@ -830,11 +846,10 @@ void recalculate_cpuid_policy(struct domain *d)
>>>      }
>>>  
>>>      /*
>>> -     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
>>> +     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
>>>       * affect how to interpret topology information in other cpuid leaves.
>>>       */
>>>      __set_bit(X86_FEATURE_HTT, max_fs);
>>> -    __set_bit(X86_FEATURE_X2APIC, max_fs);
>>>      __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
>>>  
>>>      /*
>> ... these adjustments, just still in calculate_pv_featureset(). I
>> haven't gone further backwards to check if/when this exposure has
>> really appeared. I wouldn't be surprised if it's been like that
>> for all the time since we gained x2APIC support in the hypervisor.
> 
> 4.14 was when we got the proper default vs max split.  Before then, this
> block of logic was an opencoded "max(ish) for tookstacks which know
> about it" kind of thing.

Except it was also affecting what guests get to see, afaict.

Jan

