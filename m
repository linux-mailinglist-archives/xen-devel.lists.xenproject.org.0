Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034EFAA4303
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973330.1361472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA0kV-0004tE-7b; Wed, 30 Apr 2025 06:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973330.1361472; Wed, 30 Apr 2025 06:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA0kV-0004qd-4s; Wed, 30 Apr 2025 06:16:51 +0000
Received: by outflank-mailman (input) for mailman id 973330;
 Wed, 30 Apr 2025 06:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA0kS-0004qE-UL
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:16:48 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2568eec-258a-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 08:16:47 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1343211966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 23:16:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6eda4901sm874417266b.162.2025.04.29.23.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 23:16:46 -0700 (PDT)
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
X-Inumbo-ID: b2568eec-258a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745993807; x=1746598607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFUKgcgVn98RqqzvpGBxxw5VMYDUI/wcwkHYyHu4Vqk=;
        b=e8B43IHYlS5wwkIS5lYKxWXTUcTckn5IWojhZspn1LeY01WMxAzyluU89EEf7mAwNP
         g7+BmBTG7UKEdw46pn9QfC8pfcBFMeUFQA92j0QIz2tDll+9sjP4e5KIN4aJItqkPKmn
         J0rY5pL/2blqHGijTbXmupiOQOZkRFvaUEwUdX8nIFMa7vOft4bJM4N1UGlOnw9usvZ5
         ccD4FEr9q6vFdnytDwN8b2tBhTL0f37zgkaIn9YkdDKYSJiS79qDZWVy0RjcvPT0CKXt
         e3kD+AYYWywB3tZaTcpiNyW8z71SXgb7P7ZoTFbKy+rf/pSG58rSN88JR/2tvnxZaNiN
         dV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993807; x=1746598607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFUKgcgVn98RqqzvpGBxxw5VMYDUI/wcwkHYyHu4Vqk=;
        b=Awe2fSV9kJvk8pV27QaXykIe6TsK3FHAdtYwfpdwoIDPrsgvlSwxxhvDKJy42IXW4X
         Dz7d85r1Zr2Al3bd7VglJCF1ncdTmM+q3ZCzXkQkHXeEhEwFUfPj+QwuVx620iZVapfH
         Vq8teDWyvOW/iUY8RZqmzGbKtWnTtvqOMWigMB+HUG6aP/N++aKcukbPbKOfKuPmp1Ys
         83Wb0PXbJMhkC4XcApIJ1afGLlNOFtlaFSLgsPRkt4pOz+c2Zj10km3UXePHUwLo/Lwq
         EC8M6C8QVSkKC1AGUu2o8NdNJYiew8n8P/lzWladrpE+fJUHvEgxIiqUS/+To2Rcnm1V
         4Crg==
X-Forwarded-Encrypted: i=1; AJvYcCUGv1KyTLLQKufQ389e+0rDwmXJOVByTu2Qu9G7GM4xHyBzQRxdfmiymxJkavPZ+ccs2pDV3ZK5MPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQR9E4QMIJ7QcY6kdoKosfQLBI/mIHrdYS0SSM1DOdY6y1eV7J
	u/B7eYt4OqD8TtEc1laMhpmGvCmn5VbYYsEwttPlGz5h6GTP2QDEuWQ4fpKOtw==
X-Gm-Gg: ASbGncscOd0HHYCEYFuCc9mIC679yjuBDYdA1277vVGecWlMLF5qKkbFScmyW1yjTQ1
	Y4rDpfUaMlKrTQQKEkvAJqERKKCqktFSaTe0lCfwWE7jlispT90Xh5M8K2XVKl2og4FB/VurdwN
	Znro5imNxtydC4HcTgutEQG1oLzw6uGse0n7scranxA0qjC+UtJssjiIqAihLQ5T4APySAkpkLV
	1WFsY4o19Ifn3yIJSzMEt1nLjM1HiabjR4mtvNPsIfjyC2i3z79rreqGWlg6VdstdG2oA/N3cg0
	tMZrFaMDl538ZhaYU8qTSZhOC28542L0sZIleVBGIpe5TdN5sjfuLPCQcD2ph9oL2Z5P4pKXUfB
	2v8kQl7yipImo6SgrsN1/ZqVTgw==
X-Google-Smtp-Source: AGHT+IFU51h7orpp+QOj7+5RduH1Z3k8AAYTEswNsrISN5DjUlf381gOrUEaQHB2l2ZefxZfZtebPQ==
X-Received: by 2002:a17:907:948e:b0:acb:b08c:76ae with SMTP id a640c23a62f3a-acedc5da450mr207919266b.16.1745993807178;
        Tue, 29 Apr 2025 23:16:47 -0700 (PDT)
Message-ID: <eb623b71-f8f5-490c-a793-9185c1ffda9a@suse.com>
Date: Wed, 30 Apr 2025 08:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] compat: address violations of MISRA C Rule 19.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
 <74b0420ab20fc0204db14c0a1a4a68ed48b25a38.1745624090.git.victorm.lira@amd.com>
 <cb1f8a8f-8834-4610-baab-c53bf5928b0c@suse.com>
 <alpine.DEB.2.22.394.2504281614020.785180@ubuntu-linux-20-04-desktop>
 <dc55282f-f9a1-470b-8126-ca347d44efbc@suse.com>
 <alpine.DEB.2.22.394.2504291501490.3879245@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504291501490.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 00:02, Stefano Stabellini wrote:
> On Tue, 29 Apr 2025, Jan Beulich wrote:
>> On 29.04.2025 01:21, Stefano Stabellini wrote:
>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
>>>> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>
>>>>> Rule 19.1 states: "An object shall not be assigned or copied
>>>>> to an overlapping object". Since the "call" and "compat_call" are
>>>>> fields of the same union, reading from one member and writing to
>>>>> the other violates the rule, while not causing Undefined Behavior
>>>>> due to their relative sizes. However, a dummy variable is used to
>>>>> address the violation and prevent the future possibility of
>>>>> incurring in UB.
>>>>
>>>> If there is such a concern, ...
>>>>
>>>>> --- a/xen/common/compat/multicall.c
>>>>> +++ b/xen/common/compat/multicall.c
>>>>> @@ -15,8 +15,13 @@ typedef int ret_t;
>>>>>  static inline void xlat_multicall_entry(struct mc_state *mcs)
>>>>>  {
>>>>>      int i;
>>>>> +    xen_ulong_t arg;
>>>>> +
>>>>>      for (i=0; i<6; i++)
>>>>> -        mcs->compat_call.args[i] = mcs->call.args[i];
>>>>> +    {
>>>>> +        arg = mcs->call.args[i];
>>>>> +        mcs->compat_call.args[i] = arg;
>>>>> +    }
>>>>>  }
>>>>
>>>> ... wouldn't it be of concern as well that the alternating parts of
>>>> the union are still accessed in a flip-flop manner? IOW we continue to
>>>> rely on the relative placement properties of the individual array
>>>> elements. To eliminate such a concern, I think the resulting code would
>>>> also want to be correct if iteration was swapped to work downwards.
>>>>
>>>> Also the scope of the temporary could certainly be the loop body rather
>>>> than the entire function.
>>>
>>> Wouldn't be safer to do this then?
>>>
>>> static inline void xlat_multicall_entry(struct mc_state *mcs)
>>> {
>>>     int i;
>>>     xen_ulong_t args[6];
>>>
>>>     for ( i = 0; i < 6; i++ )
>>>     {
>>>         args[i] = mcs->call.args[i];
>>>     }
>>>     for ( i = 0; i < 6; i++ )
>>>     {
>>>         mcs->compat_call.args[i] = args[i];
>>>     }
>>> }
>>>
>>> If you have any specific suggestions I think C code would be easier to
>>> understand than English.
>>
>> Kind of the above, yes, with the further remark below also taken care of.
>> So ...
>>
>>>> I also don't think it needs to be xen_ulong_t,
>>>> but maybe using unsigned int instead wouldn't make a difference in
>>>> generated code.
>>>
>>> Keeping the same type as mcs->call.args[i] would seem more obviously
>>> correct? Not to mention that unsigned long is what we defined as
>>> register type? If we really want to avoid xen_ulong_t, then it should
>>> be uintptr_t?
>>>
>>> We should stick to one type to be used as register type. On ARM, we
>>> defined register_t.
>>
>> ... with both taken into account e.g.:
>>
>>     typeof(mcs->compat_call.args[0]) args[ARRAY_SIZE(mcs->call.args)];
>>
>>     for ( i = 0; i < ARRAY_SIZE(args); i++ )
>>         args[i] = mcs->call.args[i];
>>
>>     memcpy(mcs->compat_call.args, args, sizeof(args));
>>
>> Of course there are variations possible. There also may want to be a
>> BUILD_BUG_ON() to "document" both array sizes match, even if the compat
>> form is auto-generated from the native one.
>>
>> Tangential: As of 2f531c122e95 ("x86: limit number of hypercall parameters
>> to 5") it's kind of bogus that we process 6 array elements here. This even
>> extends to an assertion in hypercall_xlat_continuation() and to some of
>> the handling in hypercall_create_continuation(). I guess I will want to
>> make a patch there, which of course I could make cover the Misra aspect
>> here as well.
> 
> Please do, that would be much appreciated. Thank you!

I already did ["{hyper,multi}call: further limit arguments to just 5"]; all I
need there is an Arm side ack.

> Also thanks for 2f531c122e95.

I fear I don't understand this part. But it probably also doesn't matter much.

Jan

