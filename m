Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D589DB647
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845320.1260769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcOm-00077R-3r; Thu, 28 Nov 2024 11:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845320.1260769; Thu, 28 Nov 2024 11:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcOm-00074c-0X; Thu, 28 Nov 2024 11:09:28 +0000
Received: by outflank-mailman (input) for mailman id 845320;
 Thu, 28 Nov 2024 11:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGcOj-00074W-PJ
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:09:25 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38d06dbe-ad79-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 12:09:22 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-382378f359dso537367f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 03:09:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f70ea8sm18966035e9.40.2024.11.28.03.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:09:22 -0800 (PST)
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
X-Inumbo-ID: 38d06dbe-ad79-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzMiLCJoZWxvIjoibWFpbC13cjEteDQzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM4ZDA2ZGJlLWFkNzktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzkyMTYyLjk1NTEzNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732792162; x=1733396962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0BupGNm/apGpJAAzh6cqG4V9lRTsiOxQb2A9JGVFQs=;
        b=fRGlKSOfCra8H7/HzJzCNWELadi9URjKBtDX9dnKjzVDaV/UvM4rnLsQ3BYOpD/EXy
         u9ZVgpBDIItN+f8F/i3oCKN+LfUQVp63BODFFKVCexIlDWcQeD/7EUQTP2qPDyBJItR9
         FyuD+BFopoUgriNA1ANGbEtaBVTsxFnG57hEPq4V9xh+Qc0aD0D0X2POiETajCRyp7Fg
         YDptgf5sosCe1dn8yAbwHKV2VWA7Hj3OzIHdgQZWajSGTXOt7mwa9WWahpDSSMijqIf8
         B6qyr7yUSPNJOoUQ/Pj5BwdhMPvP9E2VqjCac1C955U7D4IL3q3MV0V4IL/qsa9HqsZ8
         +Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732792162; x=1733396962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0BupGNm/apGpJAAzh6cqG4V9lRTsiOxQb2A9JGVFQs=;
        b=cVwR540JSp/v7jrkmOPBMwVHqeBcocLR1YQDdzAzwsjXVL5u5b4eo/F3+TbOqbnwRm
         4XOOtJ2vCWl3g2jHBBv/bLFR8zGRy8tVKcg5MEEXpujM0bof4uMIDMte+ltsXiHyb8mi
         oOjgXtqGELQT5MyExad8/KOCX8stdnZbalCdAW7cU7+iGGvO2jrx1a7mryLG1aNBk+tU
         N1eEoO/2lnT8FscQ62ZIIGDeEkNXd20qE5leG9H6PjfF8ItKnYdYRHIx6PPzJZ/Mxib1
         38n166LCYJUPmB0GrCY1fAEY6nIexVOXEGlYRod44TT22GnYo21ao8Fh3w9S0aHvcIse
         FMzA==
X-Gm-Message-State: AOJu0YxUYRteTbVQE3vJ8U1YGA94ra8lYMECVeY0ujHxIWkzrRsAO9wH
	l/4ogEuhywIuGxwCwp3p/F5/RDNlsj72o3wMbw8/or3J6SihYuegu2kIZp6vHg==
X-Gm-Gg: ASbGnctyIc1JKp9c2fpLsGNCtXEQI6M/skVUbGfZknGRf+94cIlv6ULmqN+u2l7mOkh
	DYUbmnW+r8ad/fsDgVpNf4oW3XCoMM8tM3z6mHdVVOioEPQZ8ywfVgrAxJVsJdSHiks6xnaRSUs
	VPiqlQxA6NbAsKPg5Dzg3UXD1DL1LiSuEPicr7znqR8cXM3WCsVFsZeR8fmlOGxopovPYHdvrh4
	2y8X+oeB67nlRiFknizO8QCelvQ+OjULcVCUUoVnbrwyeBvCj/vPbU86WZJcYHFGGkyDjFHg7rt
	5KtUHPROQJnXUBKP0/TZ48joOc0Mw2sY+Bc=
X-Google-Smtp-Source: AGHT+IGiK/GCRcs0f80xByGgpzPExg4Fu0pwSoq39nPCFnEc5tIuQhrj1//cnMXsrTd4XIoOBGajCQ==
X-Received: by 2002:a05:6000:2804:b0:382:4aeb:91ac with SMTP id ffacd0b85a97d-385c6ebaa04mr3892691f8f.31.1732792162310;
        Thu, 28 Nov 2024 03:09:22 -0800 (PST)
Message-ID: <9799e1e3-b3bb-48e2-8d9a-7deb4ef0d694@suse.com>
Date: Thu, 28 Nov 2024 12:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-2-andrew.cooper3@citrix.com>
 <Z0gx5EdqcPiEUt3z@macbook> <4b8656ad-5a52-4c62-a7b4-bbc16226653d@citrix.com>
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
In-Reply-To: <4b8656ad-5a52-4c62-a7b4-bbc16226653d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2024 12:01, Andrew Cooper wrote:
> On 28/11/2024 9:03 am, Roger Pau Monné wrote:
>> On Thu, Nov 28, 2024 at 12:47:36AM +0000, Andrew Cooper wrote:
>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>> index 3363926b487b..98394ed26a52 100644
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -108,7 +108,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>>>      uint32_t esr;
>>>  
>>>      spin_lock_irqsave(&vlapic->esr_lock, flags);
>>> -    esr = vlapic_get_reg(vlapic, APIC_ESR);
>>> +    esr = vlapic->hw.pending_esr;
>>>      if ( (esr & errmask) != errmask )
>>>      {
>>>          uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
>>> @@ -127,7 +127,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>>>                   errmask |= APIC_ESR_RECVILL;
>>>          }
>>>  
>>> -        vlapic_set_reg(vlapic, APIC_ESR, esr | errmask);
>>> +        vlapic->hw.pending_esr |= errmask;
>>>  
>>>          if ( inj )
>>>              vlapic_set_irq(vlapic, lvterr & APIC_VECTOR_MASK, 0);
>> The SDM also contains:
>>
>> "This write also rearms the APIC error interrupt triggering
>> mechanism."
>>
>> Where "this write" is a write to the ESR register.
> 
> Correct.
> 
>> My understanding
>> is that the error vector will only be injected for the first reported
>> error. I think the logic regarding whether to inject the lvterr vector
>> needs to additionally be gated on whether vlapic->hw.pending_esr ==
>> 0.
> 
> I think it's clumsy wording.
> 
> Bits being set mask subsequent LVTERR's of the same type.  That's what
> the "if ( (esr & errmask) != errmask )" guard is doing above.

That's what we do, yes, but is that correct? I agree with Roger's reading
of that sentence.

> What I think it's referring to is that writing APIC_ESR will zero
> pending_esr and thus any subsequent error will cause LVTERR to deliver.

..., while at the same time preventing LVTERR delivery when there was
another error already pending.

Jan

