Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F26AA040A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 09:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971579.1359960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9f3A-0001rb-MR; Tue, 29 Apr 2025 07:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971579.1359960; Tue, 29 Apr 2025 07:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9f3A-0001oe-Jd; Tue, 29 Apr 2025 07:06:40 +0000
Received: by outflank-mailman (input) for mailman id 971579;
 Tue, 29 Apr 2025 07:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9f39-0001oY-3C
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 07:06:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d379de3-24c8-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 09:06:36 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so1079853266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 00:06:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e699esm736062266b.39.2025.04.29.00.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 00:06:35 -0700 (PDT)
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
X-Inumbo-ID: 7d379de3-24c8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745910396; x=1746515196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mYNYtrCkK+42NGLSjpl4eAsXP2XrUSMuSGxOV8Aylpc=;
        b=NikVEVvmb7PAizYnr5s36vyY8Fpb8zFzfykP9zjLQGp4tKXW2vPDetlO/b0/m3S8f4
         fkVIGKQQawIocPwC3ErihAOQ5cErfuvhexQVYO1GHvx6FSh26FFqZlgUPFB9EfI6KDWO
         I8/HB9kQGhm9g6ZwDWk7c2ivZpCqxXGfgEfgNrTvSezdrROLUpb55U3r2oa2qsncmho7
         fbjYs4oNtiYAajvkWFLbx8Tr9o095Jnxc8i3G7x1FuT/plyaMFeym9+it0ED+taizudW
         Z4CAzIGEFbWI9YNNNF5FJmU3d27mjuSe7xhlJX3dqPj78XQRkvMK07YMectZiq2eNOMg
         hhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745910396; x=1746515196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYNYtrCkK+42NGLSjpl4eAsXP2XrUSMuSGxOV8Aylpc=;
        b=pv5169PqjA0kOnHyo18dsUB5Wy41tzml7AhI+K2dgY+7CWIQCTNoVPZUqD04LRlHMM
         znBdJG9yzmDfrgySxyQOjNks4PjnkTU+Omjtp/5nIfewm4zW/cviOA1cG3C+36iLuNbI
         8gATMExfhC+RGUjASzBh7uuZey7O0bXhuK2FDR3f4NDT0WpAjSZYq1gQPNlMho0mMpOe
         uUVMFXW7udQW3oHvVhA3lrYa7nGXbUQ9FyseMmCv+37bbGkCw4I4KJuJ+uCWPqw9P/wc
         NRZp0qiy5hLjjx0EXroMW8Spj7KA6x7UbAKlhDwL6kNkS5w1DILCfvs7IIoORwaqZuql
         +PAA==
X-Forwarded-Encrypted: i=1; AJvYcCUShLHM++yETk/ioa3/NcE/uaGIAoRWmnJX2zAfMdfoi0qVK/aaX1rqw8Z1GIz0mIlnLe7YqZhoSoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzYNaD8JkS8LsfDCUhsDwD9ThtzA2y0QicpEk5tZCzi95i424M
	BNs12v+/LlFXIitejK9Edu9bHCeA5GkxIfWJATyX9zIF9F6IEpLe2IJB79cX/elbkrXwObKnzvU
	=
X-Gm-Gg: ASbGnctE67f5Mb7hGjcfLwUy49EnCzziOnNFTfumVFXJ1mufA9d+MJqCJdR71FnU/Gv
	+F+rA6aaIO/obKQ1PmY4KpeOrUhWk/v59PApTdIqK9f9ymKuP/h5q/gPZU10C9OOp3QXW/VEauG
	40REgziJV8ITNijvgKQHxsT5IzNjMPfc0qo0oi/Fgq/51i9XCkedTQki7nLUbcYCoME+TkChDh1
	tbPghecl06Nvuz/PHIcE5G0IEv66S11vPONDDICdPCN4xZH2EIi19/rZnYCY4ltmMZJhQxnNu8k
	r5KU0nzshQNosNxAtwOr5+ZKd+zexGCyEaOi1et3DN7lLnaCjkKs/KhK4WIWQQrK6dMmnxTt/Xf
	8Yr3uMMovn4AOW1uKZN5G4Y3wwg==
X-Google-Smtp-Source: AGHT+IFctKkKZDsWsIiOn2YRf5v+ET3OgJLStKEj705bdBdCe/xIBh5Gyaj2HCAUi+lwwTQ3X94uJw==
X-Received: by 2002:a17:907:72ca:b0:ac8:197f:3ff6 with SMTP id a640c23a62f3a-ace8493ad90mr1131587366b.28.1745910396326;
        Tue, 29 Apr 2025 00:06:36 -0700 (PDT)
Message-ID: <dc55282f-f9a1-470b-8126-ca347d44efbc@suse.com>
Date: Tue, 29 Apr 2025 09:06:34 +0200
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
In-Reply-To: <alpine.DEB.2.22.394.2504281614020.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 01:21, Stefano Stabellini wrote:
> On Mon, 28 Apr 2025, Jan Beulich wrote:
>> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> Rule 19.1 states: "An object shall not be assigned or copied
>>> to an overlapping object". Since the "call" and "compat_call" are
>>> fields of the same union, reading from one member and writing to
>>> the other violates the rule, while not causing Undefined Behavior
>>> due to their relative sizes. However, a dummy variable is used to
>>> address the violation and prevent the future possibility of
>>> incurring in UB.
>>
>> If there is such a concern, ...
>>
>>> --- a/xen/common/compat/multicall.c
>>> +++ b/xen/common/compat/multicall.c
>>> @@ -15,8 +15,13 @@ typedef int ret_t;
>>>  static inline void xlat_multicall_entry(struct mc_state *mcs)
>>>  {
>>>      int i;
>>> +    xen_ulong_t arg;
>>> +
>>>      for (i=0; i<6; i++)
>>> -        mcs->compat_call.args[i] = mcs->call.args[i];
>>> +    {
>>> +        arg = mcs->call.args[i];
>>> +        mcs->compat_call.args[i] = arg;
>>> +    }
>>>  }
>>
>> ... wouldn't it be of concern as well that the alternating parts of
>> the union are still accessed in a flip-flop manner? IOW we continue to
>> rely on the relative placement properties of the individual array
>> elements. To eliminate such a concern, I think the resulting code would
>> also want to be correct if iteration was swapped to work downwards.
>>
>> Also the scope of the temporary could certainly be the loop body rather
>> than the entire function.
> 
> Wouldn't be safer to do this then?
> 
> static inline void xlat_multicall_entry(struct mc_state *mcs)
> {
>     int i;
>     xen_ulong_t args[6];
> 
>     for ( i = 0; i < 6; i++ )
>     {
>         args[i] = mcs->call.args[i];
>     }
>     for ( i = 0; i < 6; i++ )
>     {
>         mcs->compat_call.args[i] = args[i];
>     }
> }
> 
> If you have any specific suggestions I think C code would be easier to
> understand than English.

Kind of the above, yes, with the further remark below also taken care of.
So ...

>> I also don't think it needs to be xen_ulong_t,
>> but maybe using unsigned int instead wouldn't make a difference in
>> generated code.
> 
> Keeping the same type as mcs->call.args[i] would seem more obviously
> correct? Not to mention that unsigned long is what we defined as
> register type? If we really want to avoid xen_ulong_t, then it should
> be uintptr_t?
> 
> We should stick to one type to be used as register type. On ARM, we
> defined register_t.

... with both taken into account e.g.:

    typeof(mcs->compat_call.args[0]) args[ARRAY_SIZE(mcs->call.args)];

    for ( i = 0; i < ARRAY_SIZE(args); i++ )
        args[i] = mcs->call.args[i];

    memcpy(mcs->compat_call.args, args, sizeof(args));

Of course there are variations possible. There also may want to be a
BUILD_BUG_ON() to "document" both array sizes match, even if the compat
form is auto-generated from the native one.

Tangential: As of 2f531c122e95 ("x86: limit number of hypercall parameters
to 5") it's kind of bogus that we process 6 array elements here. This even
extends to an assertion in hypercall_xlat_continuation() and to some of
the handling in hypercall_create_continuation(). I guess I will want to
make a patch there, which of course I could make cover the Misra aspect
here as well.

Jan

