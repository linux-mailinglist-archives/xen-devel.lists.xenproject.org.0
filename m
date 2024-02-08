Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE384E4E7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678334.1055493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY798-0006dg-FF; Thu, 08 Feb 2024 16:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678334.1055493; Thu, 08 Feb 2024 16:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY798-0006bW-CM; Thu, 08 Feb 2024 16:21:06 +0000
Received: by outflank-mailman (input) for mailman id 678334;
 Thu, 08 Feb 2024 16:21:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY797-0006bQ-Fe
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:21:05 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cc92b68-c69e-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:21:01 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4102f273c46so207475e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 08:21:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfea04000000b0033afcc899c1sm3927352wrm.13.2024.02.08.08.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 08:21:00 -0800 (PST)
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
X-Inumbo-ID: 0cc92b68-c69e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707409261; x=1708014061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xqG/Vmab/OeEfIeTFczQuKZrhTLj5YYY2ejvrMDjsJA=;
        b=VEFg8/2dx8tdjFSvk+B++EvYIPsHSF/kdPhtVUiFQeU5tpBVZ59AtilmeznU2VGbwQ
         ZsY9RBznivdm30iFJfGj7ARUuodbrgOnxJNjqSCzaV6FGK0uk81U4TohWLNIwhTNSp3E
         tyYUKpwICuFmBbk5XPrGtxdhUg6PZEa5oltbRlewwXuUO3Gv3cCAe3uIxoB4r4N6mbCU
         /4l4XE2GATiUnb+XwGcQ7V6LgwJxYO2JfLEmOK7IHFzRJNLTR/csEtV49WtczQmJsmLJ
         YkrFFlCfeGjhJ+1HiS1YPYCPtPob8FSnrpmLCAXzrkz+SfSuQRjDjfRVyPPdqd4Ic6B8
         GPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707409261; x=1708014061;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqG/Vmab/OeEfIeTFczQuKZrhTLj5YYY2ejvrMDjsJA=;
        b=douXm+eyBKtqHaJVkQePbtaMBYKov9v1XNSQ4qInzJdmgvARXbuOlGtIV5uIxXMRoU
         uUmOHu6XSqlwTjQ3YMUmErSw7xjjf4Ay1+y6DaKq5bdvYaYLXoZHlpUaMRLmD9gLH7IO
         SIG/TslsWx8oF5PGw/y0r+m3bnJCbt97JBiU3XQdo6ntp/1P+KKs67JD7wE2D7IG6wWT
         bQaUlg4z8nBVFf2EaYMx7zeibNPeLbhCiGiEVCPknDGlElwnXVKD5EJuMmf/Q533fxPS
         qfCsmb3kWm/9cdQakUyI1VRQq6BAU4o1uaI9T/vNxQPTGWJklkA1wwPp4PmoA4kqyz5M
         oUnw==
X-Gm-Message-State: AOJu0YwATwYqjQQ4IpcNaKd5rcCF+0Dn0RqwmEGlbRzhO13ttGei+66i
	rJevbjf2XmpzQlBJmw6uj7vdKnNbpgkwCIYVQZzlz4eWPls9mhLc+ArIKMCgHw==
X-Google-Smtp-Source: AGHT+IG5eNWYMVBH+AvsGH8q161Jguv0pvgJ5f20ENibyuAMOFGBGk/wtIpsSP9I12eNC6KtuhX94w==
X-Received: by 2002:a5d:4607:0:b0:33b:470b:a377 with SMTP id t7-20020a5d4607000000b0033b470ba377mr5863752wrq.14.1707409261220;
        Thu, 08 Feb 2024 08:21:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvLvlux8ux2QjLbif3Ie6ZENmuKiV5+pfGK9rcIVdEBMUqsGZvnieP+yv6FOMUvdMSRWbND6qANQNJxupqcqRLbiFZ4Jd/BZVLYz1zsikzq5GHWUrJivXW4FWttxKWkKGhw+MOUmg1Ekso6v1Yiqr5Q5z4k9ZAOTGgcKzG9XKiGmapTWQ7x0j8uzYu8moAJo4tqJSLp8cJJC2QknPmAHiSlFQJGrl1GC+oYKdv
Message-ID: <1d3f93c0-64ac-414d-b677-ec48a1ddf046@suse.com>
Date: Thu, 8 Feb 2024 17:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] VMX: convert entry point annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
 <5fc304c0-be1f-46dd-a783-4030ec76a2f8@suse.com>
 <c11bd472-fc43-49c5-8482-4fc7ed836269@citrix.com>
 <a6bf6d72-5796-4ccc-aa3e-38438f986b32@suse.com>
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
In-Reply-To: <a6bf6d72-5796-4ccc-aa3e-38438f986b32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.02.2024 15:25, Jan Beulich wrote:
> On 07.02.2024 14:55, Andrew Cooper wrote:
>> On 07/02/2024 1:37 pm, Jan Beulich wrote:
>>> Use the generic framework from xen/linkage.h.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v6: New.
>>>
>>> --- a/xen/arch/x86/hvm/vmx/entry.S
>>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>>> @@ -24,7 +24,7 @@
>>>  #define VMRESUME     .byte 0x0f,0x01,0xc3
>>>  #define VMLAUNCH     .byte 0x0f,0x01,0xc2
>>>  
>>> -ENTRY(vmx_asm_vmexit_handler)
>>> +FUNC(vmx_asm_vmexit_handler)
>>>          SAVE_ALL
>>>  
>>>          mov  %cr2,%rax
>>> @@ -132,7 +132,7 @@ UNLIKELY_END(realmode)
>>>          call vmx_vmentry_failure
>>>          jmp  .Lvmx_process_softirqs
>>>  
>>> -ENTRY(vmx_asm_do_vmentry)
>>> +LABEL(vmx_asm_do_vmentry)
>>
>> This really is a function, not a label.
>>
>> xen.git/xen$ git grep vmx_asm_do_vmentry
>> arch/x86/hvm/vmx/entry.S:135:ENTRY(vmx_asm_do_vmentry)
>> arch/x86/hvm/vmx/vmcs.c:1855:void noreturn vmx_asm_do_vmentry(void);
>> arch/x86/hvm/vmx/vmcs.c:1929:    reset_stack_and_jump(vmx_asm_do_vmentry);
>>
>> It is giant mess, of two functions forming part of the same loop.
>>
>> Considering that you declines to take CODE, I don't know what to
>> suggest.  The point of CODE, distinct to FUNC, was to identify the
>> places where weird things were going on, and this absolutely counts.
> 
> What's not clear to me: How would CODE() differ from both FUNC() and
> LABEL()? And if the symbol is to be a function, what's wrong with
> using FUNC() here as is?

Well, I figured this one: FUNC() may switch sections following patch 1,
so indeed we'd need something that is much like FUNC(), but without the
(optional) section switch.

Jan

