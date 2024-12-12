Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759329EE471
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855720.1268549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLghW-0001K8-HO; Thu, 12 Dec 2024 10:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855720.1268549; Thu, 12 Dec 2024 10:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLghW-0001H8-E6; Thu, 12 Dec 2024 10:45:46 +0000
Received: by outflank-mailman (input) for mailman id 855720;
 Thu, 12 Dec 2024 10:45:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLghU-0001H2-UR
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:45:44 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cd56347-b876-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:45:43 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa69251292dso83613266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:45:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6975b1f27sm480935566b.113.2024.12.12.02.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 02:45:43 -0800 (PST)
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
X-Inumbo-ID: 3cd56347-b876-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734000343; x=1734605143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aIQzt1yulu5i1a3ynxfDWvmaKZkJve7gh764YAZyV7s=;
        b=cphOBBfQIQ6Mq8JjBEsa4lAKcJvLp5LVbuQ+o7LwwbcdMFuN3AD5eGoA5ipVDObBdu
         vKzEA+q0C0Kaj1J6ishmHSXDJ++JZTLhBuDLJHbnDqiWgfMaHOGiv1i6HsbYO1Eq59uh
         sMj0c6a66doHktLQzAuXLifAUuIB1MIMru0a9sQabPvu/eDHCcN5qveFod9PYX/qqV3T
         3K5adM4ngIax1tc+trgDl6UrkhRn7UUUQ3BPKYTD0OXcOE2ICVIPAOCk/ikiMjALYsI1
         Y26+xepuuySfOz5Wm6CoaPaN7Fv0NoOBQYmsM5Dsop3mAvHUOHVTvZgUhBEuHTn5gRTB
         qqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734000343; x=1734605143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIQzt1yulu5i1a3ynxfDWvmaKZkJve7gh764YAZyV7s=;
        b=kT1Q4yRltsGccYAqyqxXzXANjanriZfs5SEr+UAQwVQaLHXikrIwYEdsbVJl8U6bV/
         nEwRACBkKGA2rIDGE9jl0X3ZM47SUOcrJ0doeM3GvKChjmuo2laXslREl6qzwgM+IDj9
         HbAixV9f33q5aVJInlK6gmUXgObKHVb3nWpSJXNYeztX9LANuaTu8YmzLXnkl0Z1k9In
         dIjfeDDEr1VObuCJQZEq4UwhEWQ3KPfvbFRp5dqnAGmdAYAhPbuTShe5hMHf/0mfd6Fb
         nLRzUzT/988+9LrPp/01a61xz/45tFuPmq2sYeWjDJa+uAmHvCsB5DBwEwZl9amd2ZDK
         pOjA==
X-Forwarded-Encrypted: i=1; AJvYcCU/jYMbNB2ItjbpO3RWE03FuOcH6+e41Y0g6n2i/UoVxk9V26vK4yvWky8EQYioTy8RtIGRE/3y3pw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXtov1f/h0aYlrMm6Pyxb4Gt876WoOzpEsJygrA0JRDpAdnuBb
	+O1ZRvZRzKI+mILh8D7SC+QVOWDUstzWdlztaSFlZjV5nWx/RGazb/4U4X8jzNtDbKOEm045XdQ
	=
X-Gm-Gg: ASbGncsvowsrGdZcUPj2pTpbpz7fiYiTR7N/5sSRWoFHeazTVw0AiJn2Ooq9BPz3hfG
	71BwzijWAUiPn4KkqUyLDG8LT2h3+trTeWxyig5dMTWdBEwZwmmvOg1XLGmNOwGKxId4MATGmU9
	lwRFDkyHTtPUPnaeD+P4VkyH81a9C8VDhKxsIbLOFhIcrtxaLoz4R4t6N4vf9DGGzyBDAMrhxM/
	yM/zKMmL1th3Gk+WN1oJyxj1EZCga9diW6PSCkKsKZ6J1praJ79ue0gg8XxHQXEthjyhSnsMIOP
	xLlxCQUEjwsRGXC2lIg+/dOYnj+rvJ4Zl/4W894dzQ==
X-Google-Smtp-Source: AGHT+IH6qPGJrqZAXTDeBJOLiWxOQlMXaK11rD0YMqHBkMwQMjfAcbFIRHDNY2v3JI0QsXlJVRQHtg==
X-Received: by 2002:a17:907:7707:b0:aa6:5eae:7ed4 with SMTP id a640c23a62f3a-aa6b11912fbmr454748266b.13.1734000343404;
        Thu, 12 Dec 2024 02:45:43 -0800 (PST)
Message-ID: <e369fbb7-9a6e-492e-a85f-a83a86bc2c1d@suse.com>
Date: Thu, 12 Dec 2024 11:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen: common: add ability to enable stack protector
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <20241211020424.401614-3-volodymyr_babchuk@epam.com>
 <0d04abb1-dae1-47d1-93e3-23d88399fa64@suse.com>
 <6b5326de-1ffb-4bac-b698-0e17435e89bc@citrix.com>
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
In-Reply-To: <6b5326de-1ffb-4bac-b698-0e17435e89bc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2024 01:52, Andrew Cooper wrote:
> On 11/12/2024 8:16 am, Jan Beulich wrote:
>> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -432,7 +432,11 @@ else
>>>  CFLAGS_UBSAN :=
>>>  endif
>>>  
>>> +ifeq ($(CONFIG_STACK_PROTECTOR),y)
>>> +CFLAGS += -fstack-protector
>>> +else
>>>  CFLAGS += -fno-stack-protector
>>> +endif
>> Personally I'd prefer if we consistently used the list approach we use
>> in various places, whenever possible:
>>
>> CFLAGS-stack-protector-y := -fno-stack-protector
>> CFLAGS-stack-protector-$(CONFIG_STACK_PROTECTOR) := -fstack-protector
>> CFLAGS += $(CFLAGS-stack-protector-y)
> 
> No - please stop this antipattern.
> 
> It saves 2 lines of code and makes the logic complete unintelligible.
> 
> I have a very strong preference for this patch to happen as Volodymyr
> presented, and without the double := replacing the more-legible ifeq.

Why "antipattern"? Surely there are cases where the list approach is
preferable. Surely there are cases where it ends up less legible, and
this may indeed be one such case. Yet then - where do you suggest to
draw the boundary?

>>> +void asmlinkage __stack_chk_fail(void)
>>> +{
>>> +    panic("Stack Protector integrity violation identified in %ps\n",
>>> +	  __builtin_return_address(0));
>> Again.
>>
>> Is panic() really the right construct to use here, though?
>> __builtin_return_address() will merely identify the immediate caller. A
>> full stack trace (from BUG()) would likely be more useful in identifying
>> the offender.
> 
> Well - we have to be careful, because the backtrace from here is
> specifically misleading in this case.
> 
> When this trips, it's either the caller itself that broke, or some
> sibling call tree which is rubble under the active stack now.
> 
> BUG() also comes with 0 information.

Not quite, the more that you suggest an alternative way to ...

> So, maybe we want a dump_execution_state() (to get the backtrace), and
> then this panic() which states it was a Stack Protection violation,
> which hopefully is enough of a hint to people to look in the sibling
> call tree.

... get register state and stack trace out. Which I'd be entirely fine
with.

Jan

