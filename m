Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3FA8CAC10
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 12:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726805.1131180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MeF-0001yF-Fq; Tue, 21 May 2024 10:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726805.1131180; Tue, 21 May 2024 10:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MeF-0001wE-CS; Tue, 21 May 2024 10:23:11 +0000
Received: by outflank-mailman (input) for mailman id 726805;
 Tue, 21 May 2024 10:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9MeD-0001w8-Lj
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 10:23:09 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e328073-175c-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 12:23:08 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-574b3d6c0f3so9337062a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 03:23:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfde7sm16390746a12.48.2024.05.21.03.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 03:23:07 -0700 (PDT)
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
X-Inumbo-ID: 1e328073-175c-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716286988; x=1716891788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9O6uATdDQLsSAHSsAZ+wK+aVoX+VXl4XXz85O4tGkbA=;
        b=coRY/HRPJmOhkTX23+5bHKwGAvG3RYddyQ1D60Au5UfpCYWkk1O0b7/o/TWW/VLY0k
         1UrxIR6kyvzWSzoGvktAG2rmx3/Oal6WSuTgZrZNNwrWYK883JJwBcLd1t0zUhnb1PpN
         dfNgXsNaB/sS1OoUXyhuBRcW51LqoRIljafCmoH5FNBWSYadtARYWxBQtsbcKAzEvNGL
         ex5+//pDLXsxiCGTQd/tBXS068luZTrpTsP1j4SEe+sGlZzALSC4Nz7S4ESPraAZfMbs
         yZyJcAzvDBr+CM8DgtR+iCvLhBZPkJtg6ctOa8r55caY8LAqnb3mF0ky+i2hvojFrz1k
         Wr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716286988; x=1716891788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9O6uATdDQLsSAHSsAZ+wK+aVoX+VXl4XXz85O4tGkbA=;
        b=enDrGMRe2qzqDnlWny4j4cvPPk5zYpjzfkpjSpfWSmih3IooazCqtDn6rNysOKNcmJ
         VkN4wMKRJsezQ1RhFVyUxEYr2XiSRsa7wkzGuC90B+Gmu7vndV2UOrA68yUjb40Adqqb
         BQGzwrUCN6mzAVVK72HtFI5esMNfSmRbjTJJaBqkqucx0TfYtlcydhkdDWcn2jUtPLNM
         AbG4CifVT1/0yPkJFn3Smnk7Uk8kSPIrLDd+2Vo/eWEZuV6Gg2tfC5c69TsgDjwNce0r
         67GAakBhuHvuDGIWM2ysWvZaPr1oc1mI1djND3WbcaMlcqSJkE3CiTL4DzxIBEFV92PW
         q+8A==
X-Gm-Message-State: AOJu0YxaKwnxFT9fPEmmpC5v8bTQT1R4V8/Nfd4J89SatssmIQbYlCGd
	AEDcb/LAvyMQ7eQLty9knWDyeolZv48+qedhHDOavKmNcn5mgoU6TTVBf3Gy8VI/WfbGtSBfjOc
	=
X-Google-Smtp-Source: AGHT+IHcoIl3Jyd3o0SkfB2YTSpNGcIiUNyPR4E0ZKUE7rjo2YKrfbLp3mnWwMFjxhXUumdUDKWaiw==
X-Received: by 2002:aa7:d450:0:b0:572:72ff:da34 with SMTP id 4fb4d7f45d1cf-5735a1c68e9mr20716392a12.14.1716286987920;
        Tue, 21 May 2024 03:23:07 -0700 (PDT)
Message-ID: <b2cc7bd7-d1a8-45eb-8fd2-cdb95824d1f2@suse.com>
Date: Tue, 21 May 2024 12:23:07 +0200
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
 <44af358a-9510-4056-826c-3be99dc25830@suse.com> <ZksmJp5JnQoBYZ6U@macbook>
 <d1267c40-e2d6-4919-81ac-54ad217e4702@suse.com> <ZkxxXNbOJ48Bl_Sk@macbook>
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
In-Reply-To: <ZkxxXNbOJ48Bl_Sk@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2024 12:03, Roger Pau Monné wrote:
> On Tue, May 21, 2024 at 08:21:35AM +0200, Jan Beulich wrote:
>> On 20.05.2024 12:29, Roger Pau Monné wrote:
>>> On Wed, May 15, 2024 at 12:07:50PM +0200, Jan Beulich wrote:
>>>> On 06.05.2024 15:53, Roger Pau Monné wrote:
>>>>> On Mon, May 06, 2024 at 03:20:38PM +0200, Jan Beulich wrote:
>>>>>> On 06.05.2024 14:42, Roger Pau Monné wrote:
>>>>>>> On Thu, Feb 15, 2024 at 11:15:39AM +0100, Jan Beulich wrote:
>>>>>>>> @@ -196,7 +196,7 @@ static int __must_check amd_iommu_setup_
>>>>>>>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>>>>>>>>  
>>>>>>>>          if ( use_ats(pdev, iommu, ivrs_dev) )
>>>>>>>> -            dte->i = ats_enabled;
>>>>>>>> +            dte->i = true;
>>>>>>>
>>>>>>> Might be easier to just use:
>>>>>>>
>>>>>>> dte->i = use_ats(pdev, iommu, ivrs_dev);
>>>>>>
>>>>>> I'm hesitant here, as in principle we might be overwriting a "true" by
>>>>>> "false" then.
>>>>>
>>>>> Hm, but that would be fine, what's the point in enabling the IOMMU to
>>>>> reply to ATS requests if ATS is not enabled on the device?
>>>>>
>>>>> IOW: overwriting a "true" with a "false" seem like the correct
>>>>> behavior if it's based on the output of use_ats().
>>>>
>>>> I don't think so, unless there were flow guarantees excluding the possibility
>>>> of taking this path twice without intermediately disabling the device again.
>>>> Down from here the enabling of ATS is gated on use_ats(). Hence if, in an
>>>> earlier invocation, we enabled ATS (and set dte->i), we wouldn't turn off ATS
>>>> below (there's only code to turn it on), yet with what you suggest we'd clear
>>>> dte->i.
>>>
>>> Please bear with me, I think I'm confused, why would use_ats(), and if
>>> that's the case, don't we want to update dte->i so that it matches the
>>> ATS state?
>>
>> I'm afraid I can't parse this. Maybe a result of incomplete editing? The
>> topic is complex enough that I don't want to even try to guess what you
>> may have meant to ask ...
> 
> Oh, indeed, sorry, the full sentences should have been:
> 
> Please bear with me, I think I'm confused, why would use_ats() return
> different values for the same device?

Right now it can't, yet in principle opt_ats could change value when
wired up accordingly via hypfs.

> And if that's the case, don't we want to update dte->i so that it
> matches the ATS state signaled by use_ats()?

That depends on what adjustment would be done besides changing the
variable value, if that was to become runtime changeable.

>>> Otherwise we would fail to disable IOMMU device address translation
>>> support if ATS was disabled?
>>
>> I think the answer here is "no", but with the above I'm not really sure
>> here, either.
> 
> Given the current logic in use_ats() AFAICT the return value of that
> function should not change for a given device?

Right now it shouldn't, yes. I'm still a little hesitant to have callers
make implications from that.

Jan

