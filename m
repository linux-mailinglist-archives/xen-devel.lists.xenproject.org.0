Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94294A39ADA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891310.1300371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLn6-0003vX-De; Tue, 18 Feb 2025 11:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891310.1300371; Tue, 18 Feb 2025 11:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLn6-0003tk-Ap; Tue, 18 Feb 2025 11:29:28 +0000
Received: by outflank-mailman (input) for mailman id 891310;
 Tue, 18 Feb 2025 11:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkLn4-0003te-NS
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:29:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b59e4a0-edeb-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 12:29:25 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-abb7aecd39fso500887966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:29:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9b1871a6sm354614466b.74.2025.02.18.03.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 03:29:24 -0800 (PST)
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
X-Inumbo-ID: 9b59e4a0-edeb-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739878165; x=1740482965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hkVVvlmqown/dubGUQPDr9F8/yw8cSv7QnFRfkAbheo=;
        b=MmmDFFGDMztbM3B6DiueBgE/IDXaGRA9CKda4VqIPb6kde7dWfYKInP+JedaXKgR5M
         HErcrtuCq0dS8i3i5L2+PedvKkssdEGynQBiHDABKA4cLE7kbffq8GB5PaF2ignKMpBs
         60HhrMZwuj9PHBv7PJfAl9Xz2XfJRMlidJ4VZ2VEEy3bT7Qj5dnUQzbFuIg1dVrHs+Ei
         4fioL7nEQZnfcTNcRyOlavbIWk8gxOt6rYylJb75T1jk2Wkc9vr7IZW9sWHS0dcAihfR
         CGviWp0qo2x2pDnWOpOOJsRe+xi/delCUrBQBv7gHP1RARh/lKXcPg3gkCDlmDdFMTZS
         ETGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878165; x=1740482965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkVVvlmqown/dubGUQPDr9F8/yw8cSv7QnFRfkAbheo=;
        b=iKvV6cN7NzeJMu/hr/+lus1ER/jL90uTb5Gljc5dmvxgR+J/8OEzjMtbApw0OxgHru
         4THKht/qfIO4xu/lSR0xpEY2uT3J/VjKOqLZ2vxJL4+BljRwWh6V/sWD7/7dWjpTLzBd
         FORjSSR1KN08l9EWeas+YMRbNalmtXK8Uob1VslhunurBR7EYNF+zaaPl3y0NW0dU4vW
         lrpnvf95/Id0Y6vp9bspgeCSPz5nTALL+JmdhrFnlBUjwGF/cdz0CfhEJL+NEk3FS/TW
         cEsiDxR5qu852un0I3cj/lHidC0kqJrBhQoGXp1VawIW9XRm0KYIPUK6Jldfe70/R0lq
         DkvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDoPrjmZ4cWZACDNeT38plGHyvk0zNcZNYwhX831eqdBEEzbJoH27KYuYU6xomBedUBdEne9xDg/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSu8Yn3QtDmQfJrxhKhZPLfV/PYcdWGXFUU8KAzdIOx3Ewv8Hr
	mdUSuvg7LcuwSgKqiz5dYgoOjOodmByQUMcUAHlPvBsxGMrw0z7HPTuyL1GbRw==
X-Gm-Gg: ASbGnctxxfQL7LcUjLXukeaSNrH7qYuWEHiehFLvEM1WJviZcbiMvtgYwkALleism3q
	TIiuQhmor6ag9MUpJbexY9TWdH2i8LiQjray8897FskwhvbrHYlvtOdZB8WtRqzec5+2J9ocjQF
	gm1C12kOXK5ZCaJIr23723ilmRq53o4wFjrPt4XNPMf5dOPnpH3L+RAeD++aGcKtfyL13p2Jle5
	gAYs3p5MDqn8mUQRqSseFEOLeenheRhH2lcXm4TEFzU/0kDxLgG/btxTPu5vYWrVjTEg2Dhisys
	1SmcSL9KQM4UWKo9f8Oeubj62wh6o3GRtpY+yYnMEsFjnjDXqStcbLrObTSyJv3glKO+4SjalDV
	2
X-Google-Smtp-Source: AGHT+IGIcqGaRM9VVFgDzAuOCiOAfUuSUNX/N0I1Y6kMoH+zdPmnuswxezqogavO6pZbBOcxTaC9/Q==
X-Received: by 2002:a17:907:7d8b:b0:ab3:3b92:8ca5 with SMTP id a640c23a62f3a-aba50fa0db1mr2029354766b.12.1739878164903;
        Tue, 18 Feb 2025 03:29:24 -0800 (PST)
Message-ID: <9d966b20-18c4-49ac-8007-95bac3a95b51@suse.com>
Date: Tue, 18 Feb 2025 12:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
 <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
 <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop>
 <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com>
 <cc9d0a73-f189-403e-9ea4-bcd961ce3c44@suse.com>
 <alpine.DEB.2.22.394.2502171837170.1085376@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502171837170.1085376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 03:45, Stefano Stabellini wrote:
> On Mon, 17 Feb 2025, Jan Beulich wrote:
>> On 15.02.2025 09:59, Nicola Vetrini wrote:
>>> On 2025-02-15 00:04, Stefano Stabellini wrote:
>>>> On Fri, 14 Feb 2025, Jan Beulich wrote:
>>>>>> Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
>>>>>
>>>>> If it did, COOKIE2ID and ID2COOKIE would likely need including as 
>>>>> well.
>>>>
>>>> I wrote this patch. Nicola, can you please check the changes to
>>>> deviations.ecl, this is the first time I try to write the deviation
>>>> myself :-)
>>>>
>>>> ---
>>>> misra: add 11.2 deviation for incomplete types
>>>>
>>>> struct mctelem_cookie* is used exactly because it is an incomplete type
>>>> so the pointer cannot be dereferenced. This is deliberate. So add a
>>>> deviation for it.
>>>>
>>>> In deviations.ecl, add the list of macros that do the conversions to 
>>>> and
>>>> from struct mctelem_cookie*.
>>>>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>
>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> index a28eb0ae76..87bfd2160c 100644
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -366,6 +366,14 @@ constant expressions are required.\""
>>>>  }
>>>>  -doc_end
>>>>
>>>> +-doc_begin="Certain pointers point to incomplete types purposely so 
>>>> that they are impossible to dereference."
>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>> "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>> "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>> "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>> "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
>>>> +}
>>>
>>> -config=MC3A2.R11.2,reports+={deliberate, 
>>> "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
>>>
>>> Note however that there is also this deviation in place
>>>
>>> -doc_begin="The conversion from a pointer to an incomplete type to 
>>> unsigned long does not lose any information, provided that the target 
>>> type has enough bits to store it."
>>> -config=MC3A2.R11.2,casts+={safe,
>>>    "from(type(any()))
>>>     &&to(type(canonical(builtin(unsigned long))))
>>>     &&relation(definitely_preserves_value)"
>>> }
>>> -doc_end
>>>
>>> I was a bit confused by Jan's remark, which seemed correct, but I 
>>> couldn't see any violations in the report, so I dug a bit deeper. 
>>> ID2COOKIE and COOKIE2ID, which operate to/from unsigned long are already 
>>> excluded due to being safe. If you envision those macros to be used with 
>>> other types, then your deviation should mention them, otherwise they are 
>>> already handled.
>>
>> Yet then can't we leverage that deviation to also make the other two
>> covered:
>>
>> #define	COOKIE2MCTE(c)		((struct mctelem_ent *)(unsigned long)(c))
>> #define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(unsigned long)(tep))
> 
> Jan is asking why ID2COOKIE and COOKIE2ID are considered safe, while
> COOKIE2MCTE and MCTE2COOKIE are not. I think the reason is that
> ID2COOKIE and COOKIE2ID convert to/from unsigned long and that falls
> under the other deviation we already have:
> 
> -doc_begin="The conversion from a pointer to an incomplete type to 
> unsigned long does not lose any information, provided that the target 
> type has enough bits to store it."
> -config=MC3A2.R11.2,casts+={safe,
>    "from(type(any()))
>     &&to(type(canonical(builtin(unsigned long))))
>     &&relation(definitely_preserves_value)"
> 
> On the other hand COOKIE2MCTE and MCTE2COOKIE convert to/from another
> pointer type, so they don't fall under the same deviation.

And then the adjusted forms suggested above ought to also be covered,
I would have thought.

Jan

