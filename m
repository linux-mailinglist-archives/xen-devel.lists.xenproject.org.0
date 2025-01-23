Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF7A1A7A7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 17:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876357.1286717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tazqv-0005F2-4I; Thu, 23 Jan 2025 16:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876357.1286717; Thu, 23 Jan 2025 16:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tazqv-0005Dd-1C; Thu, 23 Jan 2025 16:14:45 +0000
Received: by outflank-mailman (input) for mailman id 876357;
 Thu, 23 Jan 2025 16:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tazqt-0005DX-KZ
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 16:14:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26c9c5a7-d9a5-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 17:14:41 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43635796b48so7869585e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 08:14:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31c6fbasm65761645e9.33.2025.01.23.08.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 08:14:40 -0800 (PST)
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
X-Inumbo-ID: 26c9c5a7-d9a5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737648881; x=1738253681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ4ivLeAwKE7KroPvTmAfQrCzVUwXfNphHY6Uzsd7mg=;
        b=I8w/ULaTj9voPOpWb0GyO03bJPdrHmWZ1S93wgcoCIUrDPHkjJdwskpz3EV7ASvIx2
         ADtLzbfrS/xomTECtyDE2mLJ8wflzgyL+6pb2VDVzetF6BOK5kDRm4DzBA3cD/e4A7hO
         C5gXNfOMUT3WX2luGS0SWjWHuJp8lwGBbMack/VEZNEair4fov/BPWkL5BBXOMF3QC8S
         imYrOb4UZUwDHSaTzPmwp2k9jbzfu0byhLx1c2uTo28JMLlFXk9PmrImu0t2Yh8e3HPu
         iKdJBOtzqcs5MDgD0lCZtmALgQtqrvSTb78VNmkTc1EeKtzvV++LRirKd4C0QuAuzJWa
         /Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737648881; x=1738253681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ4ivLeAwKE7KroPvTmAfQrCzVUwXfNphHY6Uzsd7mg=;
        b=LYXW5TsEJmKL32JitNds/PBAyFiB7eDGLZU41ZKe+5lBoNi30LoT1YkIMiESYLPoIe
         UVNGME8QDJ9DRD1HY4tp8aYfT2R5Vga8IqVQQg1cjbS8Mw9m/4KVFlZHTwG3cAsnAFGf
         2ukwm0kE0fMshvJ971MsfoFIH3WV/C51FKlj10/upN1gNL9a1bBKibhxppAxx++MNjCv
         i4k/XnD5IMLaykwqumvCfZYIDaj8JLpYj82XlgCfgzmMVOA5kd/uLF3TruG26xj6OIvR
         oLmUIHIcZGW7bbG702V2Uftq5mDzQ+rMz6uc6iqRxllGpkWsznOIz3PRjwHk02wTZkzL
         tnVA==
X-Gm-Message-State: AOJu0Yzf1yk1VgzoifnDiE2heGbEPiLR+uWxfNxgCzSBXrmU7DuLhxjk
	n/wDE+xJTBFId8cYe8Al6VAPu0kTbxqF41LLtYECwtd2Yn2ZeKqukigetviN/w==
X-Gm-Gg: ASbGnct8t3RTfwXu2QwnxikbHQTjSDMVakqeg0Ya9glQfvps+1oTP3uLFrVy9JROlwk
	xdlpGgPKIBHfwO6KWhpOrBekWxK7MwMafpWDRWEAicvHVVOj3098Ph3J1Su2XYPll76XgDmueCO
	9C08wE+XXKYk3PIdehzcDLh7cJWG7FyJFFY9gNXcsCEneNT8v5MqqvHL2OtlCGhUvN6N9ns5zHe
	nr8FPRebMjKKya7NgnjwUUuhJLLawFNegEECmtibj2rGkgytU+euNxzXN1GmxyhjKpCocDyKU6Q
	VobiMzeOeu8exvNw7qpuDO7ZF5z8q6d8GOaFNcokwapK4FLwsrKP5oda5DNu1jO6QQ==
X-Google-Smtp-Source: AGHT+IFQleoj5MhZsMmVajEiKDgPZgo5utL3vrTngILg1WPPDOcNjUvSope6kTPgCOkghr3cdmMUZw==
X-Received: by 2002:a05:600c:83c4:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-438b885be4cmr34116705e9.12.1737648881104;
        Thu, 23 Jan 2025 08:14:41 -0800 (PST)
Message-ID: <8aa7c377-b664-4786-b671-deff1601ac5f@suse.com>
Date: Thu, 23 Jan 2025 17:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] x86/HVM: improve CET-IBT pruning of ENDBR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <537b0d9c-1936-4cf5-a012-d50b1097a22d@suse.com>
 <Z5I5D_uVxijLF6sK@macbook.local>
 <f0e2a3f3-3081-414d-824c-bf940134aece@suse.com>
 <Z5JRGwA51lOs65t5@macbook.local>
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
In-Reply-To: <Z5JRGwA51lOs65t5@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2025 15:24, Roger Pau Monné wrote:
> On Thu, Jan 23, 2025 at 02:18:41PM +0100, Jan Beulich wrote:
>> On 23.01.2025 13:41, Roger Pau Monné wrote:
>>> On Mon, Feb 26, 2024 at 05:42:20PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
>>>>      else if ( cpu_has_svm )
>>>>          fns = start_svm();
>>>>  
>>>> +    if ( fns )
>>>> +        hvm_funcs = *fns;
>>>> +
>>>> +    prune_vmx();
>>>> +    prune_svm();
>>>
>>> Isn't it actually the opposite of pruning.  What the helpers do is
>>> fill all the pointers in the structure.
>>
>> With the goal of their ENDBR to then be pruned. I agree though that the
>> functions don't do any pruning themselves. Yet
>> {svm,vmx}_prepare_for_cet_ibt_pruning() is a little awkward for my taste
>> (although it would properly document the purpose). Plus ...
>>
>>>  I would rather name them {vmx,svm}_fill_hvm_funcs() or similar.
>>
>> ... while I can use those names (perhaps without the "hvm" infix), the
>> present names have the advantage that any other pruning that we may
>> find desirable could also be put there. Hence also why the cpu_has_*
>> checks live there.
> 
> Hm, I'm unsure.  What else do you see becoming part of those
> functions?  It's hard for me to suggest a name when it's unclear what
> future logic do you think they could contain.

Prior to IBT it wasn't foreseeable any pruning might be needed. We're
in a similar position now: We simply can't know whether anything else
is going to be needed there.

> Given the current code I still think something that contains 'fill' or
> similar is way more appropriate, the more if the IBT check is pulled
> out into the caller.

As indicated, I'd prefer the IBT check to remain in the function. But
yes, I'll see about renaming. If ever other stuff wants adding there,
we can surely rename another time.

>>>  And possibly pull the
>>> cpu_has_xen_ibt check outside the functions:
>>>
>>> if ( cpu_has_xen_ibt )
>>> {
>>>     /*
>>>      * Now that svm_function_table was copied, populate all function pointers
>>>      * which may have been left at NULL, for __initdata_cf_clobber to have as
>>>      * much of an effect as possible.
>>>      */
>>>     vmx_fill_hvm_funcs();
>>>     svm_fill_hvm_funcs();
>>> }
>>
>> Which would leave the SVM function entirely empty.
> 
> You could possible declare it as an static inline in the hvm.h header
> for the time being?
> 
>> The intention was for
>> that to not be the case, and also for the comment you have added above
>> to also live in the per-vendor functions.
> 
> Isn't that a bit redundant?  I would prefer to not have duplicated
> comments over the code, hence my suggestion to place part of the logic
> in the caller.

In this case I view the redundancy as necessary. You want to know what
to add to the functions when you look at them, irrespective of whether
you also look at their caller.

Jan

