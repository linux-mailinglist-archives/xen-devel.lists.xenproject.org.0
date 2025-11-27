Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD53C8D4E8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 09:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173550.1498575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXCe-0003lB-0N; Thu, 27 Nov 2025 08:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173550.1498575; Thu, 27 Nov 2025 08:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXCd-0003jk-Tq; Thu, 27 Nov 2025 08:18:11 +0000
Received: by outflank-mailman (input) for mailman id 1173550;
 Thu, 27 Nov 2025 08:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOXCc-0003je-Jj
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 08:18:10 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a8d72c1-cb69-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 09:18:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso4800615e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 00:18:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0cc186sm79706295e9.13.2025.11.27.00.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 00:18:06 -0800 (PST)
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
X-Inumbo-ID: 9a8d72c1-cb69-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764231487; x=1764836287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SljjkoHSvNo7AYpNYa6OcIrQBWEj1HPkBjDJM1OQzEQ=;
        b=cWzyvwnf+kNm26YgkBmu/jrYXNTdHv0LeX19zOnn93jVxNKdohmmEEhT8INx8kLvGz
         qHMIzdizx7nDTRrfcW61ToMDYIWd1qdjhCW2Hj1DcQ6uZcNdP8ggBBJmjdVDSmkAnL9L
         H9jFd9cZN9++ntRInO1OZ0e8VRPC4j5AQZ8uHSLY6MgnPO1XK2qt2250ZxzU38vqPbmF
         /vmkvLLJ1njH4SXKq/3V2/QiCoyFLpEKJ90hx4Ce2iTpICA1uCAzJoDssJRlKT7iOPM7
         pRdKCk75Z6DFsqPc7qz/rgfy7m+GFfHTS/ATaxItEch/Mt7ioXtKIGjefcFAB7teffwf
         gjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764231487; x=1764836287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SljjkoHSvNo7AYpNYa6OcIrQBWEj1HPkBjDJM1OQzEQ=;
        b=KVyU5Nj+Cm05OhARq9kyPN2ib2gtzPJcNx6M+4jYbezf0j9tBsebplzyHAKhORKVH5
         v86r9/8ZjaijL9YkElShNSBgYUgr9f7ygGwdjdlLiec88k+rWDoGxLZBsiii3v4OQ1lM
         v6m48FkO7Glu0D3waJMwFjaAHs1HQNdue7t2SrQAZZMKIkTPUnBBFV4Nc6znwntXYFA4
         y5/Dgb8T2/919o7D1Gnbju/iIL1K3sW4SHm8taa3GsM+4wZc8Vzt2PP5A+GP5MUZ3t+H
         r0aEc97Mt/dfVfXiC2m9103UVolEQb7D13qfzkJsOaUZSg/Gj2rnm5+g+60UQev6oKWP
         ro7w==
X-Forwarded-Encrypted: i=1; AJvYcCWNpnWgmm7moZbOxNPs5dh3fVc0mEf7aK/Vt2BtZaFMZhEIFoJR1TE986gZGQ6ejl+6NSekqhnHrN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrTAvevPi0RXBTGGySLAxk5TeFFAXXpxwaa1Fd+Moeh87UwOP7
	5sug7WeYLMDPpfEZkcWNrJEyyJ5RSCY+x8J67L8gGHoyT4dxKdDEmVsCChJYXOQabA==
X-Gm-Gg: ASbGncvLZMwHJRVGbufAk64MyeaVkA2g7i7d8JsNgM5Z7eHsU9YP89ar/azO8IXdJ5e
	lAD4KVqorj8BcSOXzLqOBmmSZ0KKWNkXRXkyF8FcXjsAKuexhfI7bNfbId/RVNR7lH9kovyQNdi
	dxHcNj2GjjkXCR0nhdnzOArU9HuQKDlNfbprWgB4i/f5sgvhId/wLMH4xPrFY6QlfscCL9xCnuW
	akyh+AS0Os7B3yS85QK5u0h+HnuhlcrSjOBfyc1BqiKYj9iFDF+JFPLR6IWPqjwcUWgmk5+Wo/m
	u0ooeN4VNB3ljb7Ij5/2FoZG5izhc8oCEBhw3nEUYxcHAGmVcu+7Oa4TXP70zcVEhIJbKs77rJ5
	ZZLolaY4BMVM4HvHCGcQ+nvvBtXt6BsiJxDHTvERKaISAS8l5qgYJ0vQekFtGdtF9ioYG/fupuH
	HTvtR3+j8/sWm647au5+eBtExdfKwtrvTbff9To4HlJXblBJdtJ0xgK4Q6fGdYI6O/TyrKCNCoa
	/4=
X-Google-Smtp-Source: AGHT+IEdi+4gmdkOUwPlxsnaYXAuoEbfy91E00NkhJN/s3UmJox+wKwxcOF64HQNz/oRhmYqBGIcjw==
X-Received: by 2002:a05:600c:4fcb:b0:477:557b:691d with SMTP id 5b1f17b1804b1-477c01eea7fmr194181775e9.25.1764231486897;
        Thu, 27 Nov 2025 00:18:06 -0800 (PST)
Message-ID: <726f1d23-343b-4151-8c8f-a7b9ee3e08a1@suse.com>
Date: Thu, 27 Nov 2025 09:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] VMX: support MSR-IMM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <1404b901-0821-4e8d-82c7-1eebd8ed4daa@suse.com>
 <0b20af96-bfef-43b1-a22a-db85a18b849d@citrix.com>
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
In-Reply-To: <0b20af96-bfef-43b1-a22a-db85a18b849d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 19:50, Andrew Cooper wrote:
> On 24/11/2025 3:00 pm, Jan Beulich wrote:
>> Hook up the new VM exit codes and handle guest uses of the insns.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v9: New.
>> ---
>> The lack of an enable bit is concerning; at least for the nested case
>> that's a security issue afaict (when L0 isn't aware of the insns, or more
>> specifically the exit codes).
> 
> This is why we need support statements of new CPUs.

I hope you don't mean the lack thereof to be a blocking factor for this
change?

> Intel say that unknown VMExits turning into #UD is the expected course
> of action.  That covers all of these cases which don't have an explicit
> enable.

Do you have a pointer?

> This is better than our current behaviour, which is non-architectural
> for supervisor code and practically the most unhelpful course of action
> going.
> 
> Obviously, logic turning on a new feature is expected to handle all the
> VMExit cases it can produce.

What you say here ...

> The corollary for nested virt is that L0 must never make a Virtual
> VMExit with case that isn't enabled.  Combined with #UD in the unknown
> case, that covers things reasonably well.
> 
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -453,7 +453,7 @@ void domain_cpu_policy_changed(struct do
>>      }
>>  
>>      /* Nested doesn't have the necessary processing, yet. */
>> -    if ( nestedhvm_enabled(d) && p->feat.user_msr )
>> +    if ( nestedhvm_enabled(d) && (p->feat.user_msr || p->feat.msr_imm) )
>>          return /* -EINVAL */;
> 
> What processing is missing?  (Aside from correcting the unknown case.)

... is what would need doing for this check to disappear. Going the #UD
route looks to make sense, but it still wouldn't feel quite right then
to drop this check. If we expose the feature, we shouldn't convert
respective exits to #UD. They aren't "unknown" (anymore) after all.

And then again the question is: Are you expecting me to deal with
switching to the #UD model as a prereq (if, as per above, that's
relevant at all here)? If so, I have to admit that it's not quite clear
to me what exactly this would be meant to look like: Alter the default
cases of the big switch()es in both the normal and nested exit handlers?
Or merely the latter?

>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -4762,6 +4762,7 @@ void asmlinkage vmx_vmexit_handler(struc
>>          break;
>>  
>>      case EXIT_REASON_URDMSR:
>> +    case EXIT_REASON_RDMSR_IMM:
> 
> Instructions which aren't enumerated in CPUID have reserved behaviour.
> 
> The exit handler needs to check cp->feat.msr_imm and inject #UD.
> 
> It's not perfect; un-intercepted MSRs will happen to execute correctly
> on capable hardware, but most MSRs are not intercepted and it's far
> closer to adequate behaviour than omitting the #UD check.

Hmm, okay, I can certainly do it this way.

Jan

