Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD42A9161D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957068.1350262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KHs-0007Uj-NS; Thu, 17 Apr 2025 08:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957068.1350262; Thu, 17 Apr 2025 08:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KHs-0007T7-IZ; Thu, 17 Apr 2025 08:07:56 +0000
Received: by outflank-mailman (input) for mailman id 957068;
 Thu, 17 Apr 2025 08:07:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5KHr-0007T1-Dw
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:07:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ffc14ec-1b63-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 10:07:53 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so322258f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 01:07:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fc43d5sm27510145ad.162.2025.04.17.01.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 01:07:52 -0700 (PDT)
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
X-Inumbo-ID: 0ffc14ec-1b63-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744877273; x=1745482073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dubHgutPlcjbbhrvqQDDZwR7TX1nJOvucvrB3xnRZqc=;
        b=efbe3QMsHdw6OYWAxloTQ592bJ2jN6Fx1J21N8YNeYNVyoYum+BdSn38ENCCoNS4UM
         PZm5lmybuM4jAGmMLdpObnmu+7lOWz3D/kcZUuINPS+RvlamzLwGNk+BANxRCp1xC2a9
         2GgfZYJAyHk0VWrFr0YCvx00mCM/Y0r4S377SqtyLuSOEGNW4f1/oiRAhmu6ZiJaagbB
         IT3XhN5Q4wrcGX23w2ZXNWb3mhRE32m2JYBalWBVs1+25WMkHKdmZXK0lp7NllJkFx/i
         iYfZ4PuElmi31aeevNLAD3Y9WXjBPOo/57Tz/arwVDkaM9QLKC4PYNhUg5SgxiAwUmd/
         6iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877273; x=1745482073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dubHgutPlcjbbhrvqQDDZwR7TX1nJOvucvrB3xnRZqc=;
        b=nqhGl0QLyP4FlPt9i9ajjvNG5O6FwLhhpWjpK5gpv6pFOGjdOKkygRVpNYR8vsuHDQ
         72P6m49v2Uif/ZPNf4zvAHHDFIui3z6VrMjv35mbi5k550nMy6jGQpsipfFqyGXMpqmT
         QqqjqhYVNw8kLM8Z9E4MdvGSFuROnd+b9EwxjNk32HXbnu+Xalf1GS4JObPhSIOAjW3O
         mgnkuJ5xNJjLSPcaoLsbMcRV8axAmOkQduH1YZGFrZHMBjHrKAVIMU4HrymnVCPTAk4K
         7BV47WcnhntQgP2E/T8z6NLYGDbY0v/VfTpmcwGmsBBe+7WfxwI6lV7/MIYmMMt0e3sH
         p8/w==
X-Forwarded-Encrypted: i=1; AJvYcCV8jcbI+we1xoa9JJBqnIrHfFU94jJa8JwThLvjDSRATw0xE0KdVm+rR7o2aW909jJYH46okvM7CxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaMyE1oM9c4DoTjIfctrGNsXzLlJHlyygwiHjbOAIz08xMpaSR
	EETo2vbKOi2Hjeu5yUoSBfzewu5yqxK/g6AF63v81Jod94iplkrcTCftygoooQ==
X-Gm-Gg: ASbGncu6tfcNaipfCL7OK7f5E20Ejes1rqgjaRosolvZqY4WqGI9B1ryh0BV7u6iXVL
	gfEffGfMJx7Xyvhe5yRS0u5UWJ7IQN5SAG69kLR/nFEFsyk5CR3zNgsM2P1/C/DpQlSSNP7z9hV
	UDgTOiS0vbCeeoEEgYl6mexrJstAW4rKhpEbGQDwOTn16bS6Oy+/9sS4UrjB4JRvJmuXWd2XTq2
	eTsh0TV0RgdrqBZGuCplzVGn+1iczDjUB6tJ3R2trQCMiXVGu7AkD+C9su8I/YKwAuVgQ3XQj+Y
	dSzrxXJQffgI6wnFjIOcCzZOqtfCifecUcZb14vkuTvSRBPIC7dtCC3GEwBZixLmizpzhlCJ+2k
	X35JriV1Cf5jXj4SZp2TrEDdALw==
X-Google-Smtp-Source: AGHT+IHbBdxq5PHh63JRgIgEOfGIBYtnaIFhtjSmMex5sus+9DB7g6fMusn8VKMqCIQUWCQiC70XAA==
X-Received: by 2002:a05:6000:1449:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-39ee5b33b58mr4366391f8f.31.1744877272791;
        Thu, 17 Apr 2025 01:07:52 -0700 (PDT)
Message-ID: <4ee5c7e3-1072-4f12-b38d-de33ab3a5081@suse.com>
Date: Thu, 17 Apr 2025 10:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86 emulation bug
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: manuel.andreas@tum.de, xen-devel@lists.xenproject.org,
 Fabian Specht <f.specht@tum.de>
References: <jfgrmlid6fhbptebr22ccqimqhys3pchcoyuoepjz2iwoillei@xxaicsktj2pl>
 <910868c1-fc90-49ec-bd06-3ff638ff0c1d@suse.com>
 <ecfce9c8-6c69-422d-bb2a-867c94502f9b@citrix.com>
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
In-Reply-To: <ecfce9c8-6c69-422d-bb2a-867c94502f9b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 10:01, Andrew Cooper wrote:
> On 17/04/2025 8:14 am, Jan Beulich wrote:
>> On 17.04.2025 00:52, Fabian Specht wrote:
>>> Dear all,
>>>
>>> we discovered a bug in hvm64 x86 Xen. Using the attached xtf test we are
>>> able to trigger an assert in arch/x86/hvm/emulate.c:
>>>
>>>
>>> if ( (hvmemul_ctxt->ctxt.regs->eflags & X86_EFLAGS_DF) && (reps > 1) )
>>> {
>>> 	/*
>>> 	 * x86_emulate() clips the repetition count to ensure we don't wrap
>>> 	 * the effective-address index register. Hence this assertion holds.
>>> 	 */
>>> 	ASSERT(offset >= ((reps - 1) * bytes_per_rep));
>>> 	okay = hvm_virtual_to_linear_addr(
>>> 		seg, reg, offset - (reps - 1) * bytes_per_rep,
>>> 		reps * bytes_per_rep, access_type,
>>> 		hvmemul_get_seg_reg(x86_seg_cs, hvmemul_ctxt), linear);
>>> 	*linear += (reps - 1) * bytes_per_rep;
>>> 	if ( hvmemul_ctxt->ctxt.addr_size != 64 )
>>> 		*linear = (uint32_t)*linear;
>>> }
>>>
>>>
>>> If debug mode is not enabled, this will later on result in an integer
>>> underflow, however we were not able to find any severe problems.
>>>
>>> The test below will not work with vanilla xtf.
>> Thanks for the report. However, already on Andreas' report on the day before
>> yesterday I was heavily inclined to ask about details you certainly have
>> figured out already. I find it odd that you leave to us all re-figuring out.
>> In this case, for example: Is the specific value you set %eax to relevant?
>> (Probably not.) Is the specific value you set %rcx to relevant? (Probably
>> not, but likely some part of it is.) Is the specific value you set %rdi to
>> relevant? (Probably not, but likely some part of it is. Probably you
>> setting it to 0 is also why the adjustment below is needed, and using a
>> different value might permit avoiding that adjustment.) Is it relevant
>> that you set EFLAGS.DF? (Quite likely.)
>>
>> Any other investigation results you may have collected would likely also
>> make our job easier.
> 
> To add to this, the amount of RAM you create the XTF guest with is very
> relevant too, because it changes the behaviour.
> 
> E.g. when the guest has 6G of RAM, 0x5564000000 becomes normal RAM.

It's more like 342Gb that would be needed?

Jan

