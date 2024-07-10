Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFFB92CEEE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756752.1165477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUQW-000103-I2; Wed, 10 Jul 2024 10:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756752.1165477; Wed, 10 Jul 2024 10:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUQW-0000y1-Et; Wed, 10 Jul 2024 10:19:56 +0000
Received: by outflank-mailman (input) for mailman id 756752;
 Wed, 10 Jul 2024 10:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRUQV-0000xv-MN
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:19:55 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3748a28-3ea5-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:19:54 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ee91d9cb71so59219881fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 03:19:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99a950c37sm11593321a91.13.2024.07.10.03.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:19:53 -0700 (PDT)
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
X-Inumbo-ID: f3748a28-3ea5-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720606794; x=1721211594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B4cmyMoROnRR9fkloJzFXqgLrlcsrVQKRMto3oyCunE=;
        b=GLF990DvIBI8oTAWxyDPQIyAZHqv5WazOepasBZPCbYPV3ehl4HdUOWP6xOcknnO6c
         x5zoZDSlTbFp7lnA/J7HiF2ijq2BqjSR6MAcbWOyLokrpTYJ4LVyPaVPTNTIDqYGvKyW
         OrgwzyBCQxD6BLChzOtAZCgibBYtdaxLil1IgmRzCgIN7KU7tebr6aL/iDESNEm57jvt
         h6xxAUXzEDWYsHlVU/RdT5BlDg7WXnXiIrcN6yBdIWm4lXAD208OYLgXfvVSZiLp1bdH
         IwGeIGN3W89Xb+r4NuQBvwiApFM18rX5xXkpOn7xh48ssKC/K1H+XVfBsrPbm75lGM+V
         qczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720606794; x=1721211594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4cmyMoROnRR9fkloJzFXqgLrlcsrVQKRMto3oyCunE=;
        b=e32EQLiVE0bGqakyZcUUYpnyrgnbBWjyVLaz75kZafotE73ojmLCIAr9eqAMU9CJJ6
         Tk1AWbWvhPHhZLCn/aNZ/D0Q8J6keMQdMduxUeLdyiaUEE3KjkhI3ArP4Rr8dWX66VFA
         bArLM+J4RrAjbpUQu9g+TdHvUoZFd/YEB/lr2Gw1yT/jF73Gc07v/qByUbCi1DNDvE9x
         e0wXXq6sjQyvgwdj+mxMDi8otLY/jCA9iPWgKvS+/bHTNhxR7oBYbayEfbp5ioCdchFM
         rAjGmOkKD9lQHmuoQvUJHTUJevYMQEGzYkpnfApFTEiTvebPstqloRdISbTvr9JcrktL
         18Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVQPgYlqev47UayZssx2vxMuIeHXiqMTo5gGxhd5Ks5kkd930l3bqqvDVXQjzPl6bEBomiM0/mnXZwh6mzDGPVp95uifwsgAP6h20yzHQQ=
X-Gm-Message-State: AOJu0YwRRByBDrOTrwVrM1HN9gBKa+FqybD3LEAJq1TdJLDkAjUJNT47
	R2MtXK2Pqo6slPwGo42AkejgzFq4sJ3p40H8ScT1eqaksL8sh3aX7gck3YhJQg==
X-Google-Smtp-Source: AGHT+IFXw+ROq86/aid7dam6dBHFUsYG9U12STXq602WBMAkg/TzAi9P4JLP3TunEQkrLgm27uOpJQ==
X-Received: by 2002:a2e:9a92:0:b0:2ed:136b:755b with SMTP id 38308e7fff4ca-2eeb318b5e9mr34836001fa.53.1720606794207;
        Wed, 10 Jul 2024 03:19:54 -0700 (PDT)
Message-ID: <2b408be4-70e4-41a0-b15d-c4cab58198c2@suse.com>
Date: Wed, 10 Jul 2024 12:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 12/14] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <e6e0f30ea69ecfed4d8de531fc42162162b3f6e5.1720501197.git.Sergiy_Kibrik@epam.com>
 <5fad5c8e-a7f0-4536-86ea-b74a3116d122@suse.com>
 <6fc22816-5f2c-4f87-a86b-09363f254e05@epam.com>
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
In-Reply-To: <6fc22816-5f2c-4f87-a86b-09363f254e05@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 12:10, Sergiy Kibrik wrote:
> 09.07.24 10:28, Jan Beulich:
>> On 09.07.2024 08:09, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/ioreq.h
>>> +++ b/xen/arch/x86/include/asm/hvm/ioreq.h
>>> @@ -13,6 +13,11 @@
>>>   #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>>>   #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>>>   
>>> +#ifdef CONFIG_VMX
>>> +bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>>> +#define arch_vcpu_ioreq_completion
>>> +#endif
>>
>> Putting the (or some kind of) #define here is certainly fine, but moving ...
>>
>>> --- a/xen/include/xen/ioreq.h
>>> +++ b/xen/include/xen/ioreq.h
>>> @@ -111,7 +111,6 @@ void ioreq_domain_init(struct domain *d);
>>>   int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>>>   
>>>   bool arch_ioreq_complete_mmio(void);
>>> -bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>>>   int arch_ioreq_server_map_pages(struct ioreq_server *s);
>>>   void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
>>>   void arch_ioreq_server_enable(struct ioreq_server *s);
>>
>> ... the declaration from here requires that all architectures wanting to
>> implement the function need to have identical copies. That's unnecessary
>> risk of going out of sync.
>>
>> As to the #define itself: It expanding to nothing means the call site
>> de-generates to
>>
>> #ifdef arch_vcpu_ioreq_completion
>>          res = (completion);
>> #else
>>
>> which hardly is what is meant (despite compiling fine, and it likely
>> only being Eclair which would then tell us about the issue). Further
>> there you're also removing a blank line, I don't see why you're doing
>> that.
>>
> 
> looking through these changes once again I wonder why can't we just move 
> stub to the header like this:
> 
> in xen/include/xen/ioreq.h:
> 
> #ifdef arch_vcpu_ioreq_completion
> 
> #ifdef CONFIG_VMX
> bool arch_vcpu_ioreq_completion(enum vio_completion completion);
> #else
> static inline bool arch_vcpu_ioreq_completion(enum vio_completion 
> completion)
> {
>      ASSERT_UNREACHABLE();
>      return true;
> }
> #endif
> 
> 
> and avoid additional pre-processor variables & conditionals, because it 
> looks like we do need some kind of stub that does ASSERT_UNREACHABLE() 
> anyway.

That's possible to do, yes, but not as long as you key it off of CONFIG_VMX.
This arch-specific setting would better not be used in a common code header.
You could introduce a helper CONFIG_* which VMX selects, at which point
doing what you suggest is an option.

However, in what you have above I can't figure why "#ifdef
arch_vcpu_ioreq_completion" is still there.

Jan

