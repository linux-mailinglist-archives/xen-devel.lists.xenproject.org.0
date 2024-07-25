Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924F093BC78
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 08:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764639.1175123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWro9-0004Y3-AC; Thu, 25 Jul 2024 06:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764639.1175123; Thu, 25 Jul 2024 06:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWro9-0004WZ-7c; Thu, 25 Jul 2024 06:18:33 +0000
Received: by outflank-mailman (input) for mailman id 764639;
 Thu, 25 Jul 2024 06:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWro7-0004WT-ET
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 06:18:31 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ec2324-4a4d-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 08:18:29 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso20918666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 23:18:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab260besm36193766b.4.2024.07.24.23.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:18:29 -0700 (PDT)
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
X-Inumbo-ID: b5ec2324-4a4d-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721888309; x=1722493109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i5l58HtoMGBpgKq+ZNQOo3FEK/p0y6FWPUmFXwp3Mwo=;
        b=dm7uErXM5lKUWAGwja1C1klt3TJA2tYDPbyI9Wx/Bodo/dF4dtWWECB0zLlJBA+Qen
         dRy2dibQmtAAMTqcrnw+M4qGxy4j+wAuM/4X0EDah3A1VZf6nWKXgq4xgPkgucc8gsLf
         cdDZxF/DoHgElTxD83Ch9/3mGTG2v5x6RJBZW/s3D/++nkc/I2+fIjJ6qHBC6qX8ivta
         xsApQvju5DElmlezL3Msfj1eCeN+AwsE0AeOlWLfY+Mf+Jxeg3rvUz9ySdCT4FSwZ9TQ
         Qj9HxCF4sghbL38MgQUL28F4s2PErq5MTO+2IfNCOG3aYOQVWX4DJjEBVnXHE4Nwvip0
         RISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721888309; x=1722493109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5l58HtoMGBpgKq+ZNQOo3FEK/p0y6FWPUmFXwp3Mwo=;
        b=WWYcmP1t8xVKd58jLMAr3m5EAZYUG2NuTQEMikUpXadmI8b3a2NmgcN41yRVIsH4y1
         9eR2qmK7bFN15XzYCTiRAm0h2nJ39cV03P6GuWsSlV7w9tzPXQb2WRYBEfuguEyusClt
         jokMV+xrxiZV/9ilUUUUv2I7A9bqKmddwqZJw8lcCUJke3uDexbjMJeUZ6Iizh5p9PDW
         ONmlY2lxYittiI7zxX3qUBoMT5xWsyIRiJpfJMwSvdSKmVSmZFETCc4Asl0OocUBGAYZ
         OJqNq3zfT3ppLg+Tto/HjOmMvVVAphbXxkOjixQkC/uoM9RPtqmjf6qFmWPr44XPFWl1
         c00A==
X-Forwarded-Encrypted: i=1; AJvYcCVhyzOQKpBMLtpYE/yHzL6ANqJOPW1IyZ3HhipuUc8sS8mV4uk50WrERZYOeK//srOnmpFy1c22sHvxJ93Ff5idgfr2yowUR+SfjRdkr08=
X-Gm-Message-State: AOJu0YypzCEANbUa3t8BH0A3c+SRa525jWcz4u7l//3+N4m2zZgPaGFh
	u1BqE14UD/IUFQSV7NUbFjCDU3eQlu1U/ZXdkC5HZU0t6mTjTjGRtZIcowIXmQ==
X-Google-Smtp-Source: AGHT+IHTvCOt0u5SLnP6cbudeMIIl3wG86DXKBZQ3uObc8Ps5RFQxFMfM21Qvn5EKV16SJoqFhlZjw==
X-Received: by 2002:a17:907:3ea2:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a7acb3d6a08mr62276866b.6.1721888309212;
        Wed, 24 Jul 2024 23:18:29 -0700 (PDT)
Message-ID: <d1abd5ef-745c-49bb-b392-3ca5159e4cb4@suse.com>
Date: Thu, 25 Jul 2024 08:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] hvmloader: Rework hypercall infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240717111231.3517605-1-andrew.cooper3@citrix.com>
 <ec6f3d2b-d5be-4ff5-9bf1-79eb5a3a85e1@suse.com>
 <4f24cc9a-3eb8-4c6f-bcb4-a9e04a50cd9e@citrix.com>
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
In-Reply-To: <4f24cc9a-3eb8-4c6f-bcb4-a9e04a50cd9e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2024 19:24, Andrew Cooper wrote:
> On 17/07/2024 1:37 pm, Jan Beulich wrote:
>> On 17.07.2024 13:12, Andrew Cooper wrote:
>>>  static inline int
>>>  hypercall_sched_op(
>>>      int cmd, void *arg)
>>>  {
>>> -    return _hypercall2(int, sched_op, cmd, arg);
>>> +    return _hypercall2(int, __HYPERVISOR_sched_op, cmd, arg);
>>>  }
>> I know you don't really like token concatenation in cases like these ones,
>> but these adjustments all don't look as if they were necessary right here.
>> The new macros use the macro parameter only in ways where token pasting
>> would continue to work, afaics. And in the new assembly file you use very
>> similar token pasting anyway.
> 
> That's because my judgement is not about simply tokenisation (or not). 
> It's about not using ## when it is likely to interfere with
> grep/cscope/tags/etc.
> 
> The assembly file both isn't really interesting to find this way, and
> needs ## in order to work the way it does (differing prefixes in the
> hypercall names).

The "not interesting" part is very subjective. If one really wanted to find
everything, this still would get in the way. And there being differing
prefixes in the other case would then simply require passing two arguments
to the macro instead of just one (which imo is undesirable, but that is
along with considering the change above undesirable as well).

I'm not bothered enough to request to undo this altogether, or to split
this into a separate change, but I wonder whether in the opposite case you
wouldn't demand either or even both.

>>> +        .align 4096
>> PAGE_SIZE? And then again ...
>>
>>> +        .globl hypercall_page
>>> +hypercall_page:
>>> +         /* Poisoned with `ret` for safety before hypercalls are set up. */
>>> +        .fill 4096, 1, 0xc3
>>> +        .type hypercall_page, STT_OBJECT
>>> +        .size hypercall_page, 4096
>> ... here?
> 
> HVMLoader doesn't have a suitable constant, and doesn't have _AC().
> 
> Although we probably can just get away with (1 << PAGE_SHIFT) and drop
> the ul.

Oh, right, we still mean to be compatible with gas not ignoring the ul
suffix on numbers.

>> As to the "poisoning" - how does RET provide any safety? If a call happened
>> early, the uncertainty of what %eax is set to would make it unpredictable
>> how such a caller would further behave. Imo better to crash / hang in such
>> a case, perhaps by using INT3 instead.
>>
>> I notice that matches earlier behavior, but there the comment at least
>> validly said "rendering them no-ops" (yet still without considering
>> possible problems resulting from doing so).
> 
> That's a complicated one.  I can't remember why I chose that exact
> phraseology, but it's not really about accidentally-too-early case, it's
> about error handling.
> 
> HVMLoader doesn't have an IDT, so any exception is fatal.  But that's
> also something that ideally wants fixing (if it weren't for the fact
> that it's more likely that I'll complete plans to remove hvmloader
> completely before having time to do an IDT).
> 
> But for code which does have a panic() function, there's console_io
> (logging) and sched_op (SHUTDOWN_crash) which you want to use just in
> case they do work, before moving onto other methods of terminating.

All fine, but that still leaves this RET filling yielding random behavior
at possible early call sites. At the very least the pre-fill should result
in errors to be observed by too-early callers. For this to at least vaguely
resemble something valid to call "poisoned", that is.

Jan

