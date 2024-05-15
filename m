Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFCB8C64C7
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 12:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722133.1126028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7BYB-0007Zg-Qt; Wed, 15 May 2024 10:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722133.1126028; Wed, 15 May 2024 10:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7BYB-0007Xq-O2; Wed, 15 May 2024 10:07:55 +0000
Received: by outflank-mailman (input) for mailman id 722133;
 Wed, 15 May 2024 10:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7BY9-0007Xg-RE
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 10:07:53 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd54a3bd-12a2-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 12:07:51 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e37503115so1031509a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 03:07:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed0af0sm8733503a12.49.2024.05.15.03.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 03:07:50 -0700 (PDT)
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
X-Inumbo-ID: fd54a3bd-12a2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715767671; x=1716372471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izkW4rYDfqThlgnBovCexIj5NbvN3Vagt0ihNNRBqB4=;
        b=NgWcn3/VyhAfCI4cRqFc0HfB0G1MzPNK2dFB30BMg5FD4dgkKDXawPglcD5Bd9uts2
         mjXRbwzdciCh5O6ilidcW/5yUqD1mOQls8oU/wgnncfiKNo2Lq9rrlXyKKVVO1YtLQg/
         rte5VvEOd1BVWzY0kvBL5iI78eltVePT5K7gLA5F6n2nKfgq5FoHvlZnBi+imP4IBgSM
         O7Q0kl1Mz9RNuDHLLTZxKMOjD5yQrDbTnG6q/MbHkVTyaARn7ee/8qXGGygpIqQQnNgc
         +dPMR+QjGYUE8ecMPkQWl/LpNm4vqNnugeAASLoKZKpmZulEcSqveTAGzLiOTZ5R7EkD
         FU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715767671; x=1716372471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izkW4rYDfqThlgnBovCexIj5NbvN3Vagt0ihNNRBqB4=;
        b=FJFKf72Yk/0VgRM29f0l6dbPhtOu2coLkMbZDxmQsoBk8oTgZr5NrHvqprYn0vqBsM
         VPj2JNpuaVdtTLupGjPkaEegA0k3VXmewBOH8Nnw1ftSL80By9P5O6vIebn9FjDgW4k5
         CSd4HlKzDykHvqdYl5Sc2DoL4/14kjLEqMGgGPEioOCZ06vtLQFqs+wutadla0xcXQQ9
         LXM2YBd/aqc5S4hA0fr169H/kcJ48s9ISOBttntwiRAtnLAkdY8HbLA8gUgU8xO2a1qG
         8I3PoCWv5VHWW9+ge7k2K4kKQ1uoxNyqWbw8f9BKd14V0ekNP8K//gKGaBMRPUg8SxDh
         gKtg==
X-Gm-Message-State: AOJu0YyyAmBNrt3VdfhJKbplDtToUqPti6b2YDBzjh8/f7Cwh0tLJZsk
	g0YtOg0DT4UifQMnwhtewZgwSluNa7t2Ko0O5Nvt2iQj2mTlbFMVW3yPwt333w==
X-Google-Smtp-Source: AGHT+IHD+YfedbYHHLJ3p5ggtpqgm3k5lbBegZoGP2RudgEJoB1Tw838SaxLSCjniRyjlIbUKKpZlw==
X-Received: by 2002:a05:6402:27cd:b0:573:555e:6d89 with SMTP id 4fb4d7f45d1cf-573555e6e72mr10905245a12.1.1715767671063;
        Wed, 15 May 2024 03:07:51 -0700 (PDT)
Message-ID: <44af358a-9510-4056-826c-3be99dc25830@suse.com>
Date: Wed, 15 May 2024 12:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] IOMMU: rename and re-type ats_enabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com> <ZjjQIaxEwS6b-swj@macbook>
 <24d52bbb-1329-4f8a-81be-505a35969875@suse.com> <Zjjg2ueqgjmn-MS3@macbook>
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
In-Reply-To: <Zjjg2ueqgjmn-MS3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 15:53, Roger Pau Monné wrote:
> On Mon, May 06, 2024 at 03:20:38PM +0200, Jan Beulich wrote:
>> On 06.05.2024 14:42, Roger Pau Monné wrote:
>>> On Thu, Feb 15, 2024 at 11:15:39AM +0100, Jan Beulich wrote:
>>>> Make the variable a tristate, with (as done elsewhere) a negative value
>>>> meaning "default". Since all use sites need looking at, also rename it
>>>> to match our usual "opt_*" pattern. While touching it, also move it to
>>>> .data.ro_after_init.
>>>
>>> I guess I need to look at further patches, as given the feedback on
>>> the past version I think we agreed we want to set ATS unconditionally
>>> disabled by default, and hence I'm not sure I see the point of the
>>> tri-state if enabling ATS will require an explicit opt-in on the
>>> command line (ats=1).
>>
>> With the present wording in the VT-d spec (which we've now had vague
>> indication that it may not be meant that way) there needs to be
>> tristate behavior:
>> - With "ats=0" ATS won't be used.
>> - With "ats=1" ATS will be used for all ATS-capable devices.
>> - Without either option ATS will be used for devices where firmware
>>   mandates its use.
> 
> I'm afraid I don't agree to this behavior.  Regardless of what the
> firmware requests ATS must only be enabled on user-request (iow: when
> the ats=1 command line option is passed).  Otherwise ATS must remain
> disabled for all devices.  It's not fine for firmware to trigger the
> enabling of a feature that's not supported on Xen.

Well. On one hand I can see your point. Otoh with the spec still being the
way it is, on systems mandating ATS use for at least one device we'd then
simply need to deem Xen unsupported there altogether. The goal of the
series, though, is to make things work as mandated by the spec on such
systems, which to me implies we need to consider use of ATS supported in
such cases (and only for those specific devices, i.e. still without
considering use of "ats" on the command line supported).

If and when the spec was changed to clarify the flag is a performance hint,
not a functional requirement, then we could do as you suggest. At which
point, as mentioned before, opt_ats may be possible to become a plain
boolean variable.

>>>> @@ -196,7 +196,7 @@ static int __must_check amd_iommu_setup_
>>>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>>>>  
>>>>          if ( use_ats(pdev, iommu, ivrs_dev) )
>>>> -            dte->i = ats_enabled;
>>>> +            dte->i = true;
>>>
>>> Might be easier to just use:
>>>
>>> dte->i = use_ats(pdev, iommu, ivrs_dev);
>>
>> I'm hesitant here, as in principle we might be overwriting a "true" by
>> "false" then.
> 
> Hm, but that would be fine, what's the point in enabling the IOMMU to
> reply to ATS requests if ATS is not enabled on the device?
> 
> IOW: overwriting a "true" with a "false" seem like the correct
> behavior if it's based on the output of use_ats().

I don't think so, unless there were flow guarantees excluding the possibility
of taking this path twice without intermediately disabling the device again.
Down from here the enabling of ATS is gated on use_ats(). Hence if, in an
earlier invocation, we enabled ATS (and set dte->i), we wouldn't turn off ATS
below (there's only code to turn it on), yet with what you suggest we'd clear
dte->i.

Thinking about it: Maybe your comment roots in you meaning to leverage here
that use_ats() is not supposed to return different values for the same device,
when invoked multiple times. If so, I'm afraid I'm hesitant to make use of
such a property when I can easily avoid it.

>>>> @@ -43,7 +43,7 @@ static inline int pci_ats_enabled(int se
>>>>  
>>>>  static inline int pci_ats_device(int seg, int bus, int devfn)
>>>>  {
>>>> -    if ( !ats_enabled )
>>>> +    if ( !opt_ats )
>>>>          return 0;
>>>
>>> Can't you remove that check altogether now, since you are adding an
>>> opt_ats check to use_ats()?
>>
>> Two reasons why not: For one this isn't AMD-specific code, and hence
>> shouldn't be tied to the AMD-specific use_ats(). In principle VT-d
>> code should be okay to call here, too. And then
>> amd_iommu_disable_domain_device() doesn't use use_ats(), but does call
>> here.
> 
> Oh, that's confusing, I didn't realize use_ats was AMD specific code.
> It should have some kind of prefix to avoid this kind of confusion.

Hmm, the function being static in an AMD-only file, I would have thought that
makes it clear enough that it's AMD-specific.

Jan

