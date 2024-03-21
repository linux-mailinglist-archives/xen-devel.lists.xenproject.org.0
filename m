Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02B388564A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696272.1087046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEYF-0007n8-HJ; Thu, 21 Mar 2024 09:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696272.1087046; Thu, 21 Mar 2024 09:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEYF-0007l8-Eg; Thu, 21 Mar 2024 09:17:31 +0000
Received: by outflank-mailman (input) for mailman id 696272;
 Thu, 21 Mar 2024 09:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnEYD-0007l2-1y
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:17:29 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d64fe173-e763-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 10:17:27 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-568a53d2ce0so962530a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 02:17:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h25-20020a17090634d900b00a454438091fsm8196272ejb.70.2024.03.21.02.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 02:17:27 -0700 (PDT)
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
X-Inumbo-ID: d64fe173-e763-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711012647; x=1711617447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSw81XpMzgQnaXcph5BuhvuoYGgfAfZ0qiu9jixVhX4=;
        b=Aw+7EQsk7MBAd2zcKz29oS3Y+vVNabMJSZR/UbC2w59nnvR2DZNiEIls74ZT+SxtNc
         03FqSIPPfad2dleqL+4GB1IPjgs+RMs/ca0fizQ5MvLd1DTFXVJ8ZLVSzfvXqikhZLAj
         wlTfteF5DG4tJDrB6qSBA8BVo+vKS5ODQ5u0dWNCUsfvg7zChbCWXvgkUs57lWrBrE5n
         IIHnrknf8Kzv5+Mewbjs1fjXicvEf1KTwq3zHYQxYmy/E22WgA/8y0cqtR5piNNvz4mV
         vC+GH7elodsvyd9h/NomybRUOeI5jCWmLrgFssWKMSJZKbLL80HYgMvwMieZhV5hT6Tn
         AYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711012647; x=1711617447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSw81XpMzgQnaXcph5BuhvuoYGgfAfZ0qiu9jixVhX4=;
        b=YzWr4tBCJmUz0IhLwPfRznl6EpNcFxwKnBGeRbGv55dhOasB/auUPuITKdILD5E/Rl
         kagrenekZzIO4KjJpOshO+Kp22GJq/CL5BtsTG5RBtEZXbWXCvbe3Iev4oinmuqXh7z5
         6MLZZiieryBkVkn9M7065M7L0zn9J3jhl4DmusQkZhwRDDJW9g6iLsd3dAQBMJbsC0AG
         vjPI1Ck7YJK9X4aph173VERrd13njE0lhZMM4T+G9nW7QUvcPVP0cS754i4/CefFXtZy
         W9UI+N8kNuvqvdxbizoa12t3NptdanyYIUNreuXBkUU49iPEoATFkqGp8m/dzGvlM5Nc
         Z3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUJBn8xIatWZEjF/Nxk4mpHPrtdGBe8S/x//ET8Vr3dA3KiAzBdMWrZGKIcd/nErNrBcdqhD7ti7a8mqDePhQ5C7LWc6PtYqexkFvXEPUU=
X-Gm-Message-State: AOJu0YxRkXJmmQA5a0yTGJTUyu6WSDsQQ1IB4uD5ECcsVww+VJjq6jdY
	BbMqxFOZqcb79qdasblEqi1fMM52nro5nydiVxd7z9CB7c2Lcn57U/jBfghq4A==
X-Google-Smtp-Source: AGHT+IGQC/b0VKyY6omVLF1JeqX4/6++9r3C7HVzZNybYT7Xh7yUwjKZYWtKaCMLTg7JWJucX4aXlg==
X-Received: by 2002:a17:907:7f17:b0:a46:e3f4:4c0f with SMTP id qf23-20020a1709077f1700b00a46e3f44c0fmr1164038ejc.53.1711012647403;
        Thu, 21 Mar 2024 02:17:27 -0700 (PDT)
Message-ID: <c0aa957a-8a19-4fda-ae04-ce962fde6767@suse.com>
Date: Thu, 21 Mar 2024 10:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com> <ZfsPAj-ggY6unQef@macbook>
 <4cc5d746-a50c-4819-a56e-512abf797ef2@suse.com> <Zfv5k8jt0k7QHFxM@macbook>
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
In-Reply-To: <Zfv5k8jt0k7QHFxM@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 10:10, Roger Pau Monné wrote:
> On Thu, Mar 21, 2024 at 09:07:10AM +0100, Jan Beulich wrote:
>> On 20.03.2024 17:29, Roger Pau Monné wrote:
>>> On Wed, Mar 20, 2024 at 04:09:33PM +0100, Jan Beulich wrote:
>>>> On 20.03.2024 14:57, Roger Pau Monne wrote:
>>>>> There's no reason to force HVM guests to have a valid vcpu_info area when
>>>>> initializing a vCPU, as the vCPU can also be brought online using the local
>>>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>>>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>>>>> vcpu_info.
>>>>
>>>> While I'd agree if you started with "There's no real need to force ...", I
>>>> still think there is a reason: If one wants to use paravirt interfaces (i.e.
>>>> hypercalls), they would better do so consistently. After all there's also
>>>> no need to use VCPUOP_initialise, yet you're not disabling its use.
>>>>
>>>> As said in reply to Andrew's reply, besides acting as a sentinel that
>>>> structure instance also acts as a sink for Xen accesses to a vCPU's
>>>> vcpu_info. By removing the check, you switch that from being a safeguard to
>>>> being something that actually has to be expected to be accessed. Unless
>>>> you've audited all uses to prove that no such access exists.
>>>
>>> I'm kind of lost in this last paragraph, how is that different than
>>> what currently happens when an HVM vCPU >= 32 is brought up using the
>>> lapic and has no vpcu_info mapped?
>>
>> I think this aspect was simply missed back at the time. And I think it
>> wants mentioning explicitly to justify the change.
> 
> OK, I can add to the commit message:
> 
> "Note an HVM vCPU can operate normally without making use of
> vcpu_info, and in fact does so when brought up from the local APIC."

I'd be fine adding this (or having this added) while committing.

>> As said in reply to Andrew, I don't think the dummy structure can be got
>> rid of. Nor can the checks here be (easily) removed altogether, i.e. your
>> change cannot (easily) be extended to PV as well. Even conditional removal
>> of the structure in !PV builds would first require all vcpu_info accesses
>> to gain a suitable conditional. Which may be undesirable, as some of these
>> may be deemed fast paths.
> 
> I didn't intended to do this here, as replied to Andrew.  If we want
> to get rid of the check for PV also it needs to be done in a different
> patch, and with a different justification and analysis.
> 
>>> Also, from a quick look it seems like sites do check whether vcpu_info
>>> == dummy_vcpu_info, otherwise we would already be in trouble.
>>
>> Such checks exist in code managing vcpu_info, but not - afaics - in places
>> actually accessing it.
> 
> Quite possibly, I didn't look that close TBH, since my intention was
> not to remove dummy_vcpu_info.  I've noticed however that
> __update_vcpu_system_time() checks for v->vcpu_info_area.map == NULL,
> which is fine, but shouldn't it also check for v->vcpu_info_area.map
> == &dummy_vcpu_info, as it's pointless to update the vcpu system time
> if pointing to the dummy_vcpu_info?

The check is there to guard against NULL deref. As said, the aspect of a
vCPU being brought up the "native" way yet then still using its vCPU info
was, by mistake, neglected earlier on. So yes, such a check could be
added here, but it isn't strictly necessary as long as we don't avoid
accessing the dummy structure uniformly everywhere (which, as said, I'm
not sure we want to do).

Jan

