Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19FB86D014
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 18:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687364.1070741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjr0-0003do-RB; Thu, 29 Feb 2024 17:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687364.1070741; Thu, 29 Feb 2024 17:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjr0-0003cC-OT; Thu, 29 Feb 2024 17:05:54 +0000
Received: by outflank-mailman (input) for mailman id 687364;
 Thu, 29 Feb 2024 17:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjqz-0003c2-2U
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 17:05:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cad8ee49-d724-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 18:05:51 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563d32ee33aso1695016a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 09:05:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g26-20020a056402321a00b0055fba4996d9sm779204eda.71.2024.02.29.09.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 09:05:50 -0800 (PST)
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
X-Inumbo-ID: cad8ee49-d724-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709226351; x=1709831151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQ057896F41b8xKHo3i3EmInyNgHYs5xAmXc0tMAJw0=;
        b=Qlr9rXjbyilwC9MFqwa59YlDiMwSB7i5NCBEWS5gXkRFeinRebUhby7EDhtkSOEn2+
         EiiIOnh8iPb/dtmm6TM9iaAqgZzkwzcBddcU5Isbs/LK+T/8TvTgVaSG43jQPdA25FKj
         6sWMFfBv4y6bd4Yt/ItnSJOFfkKAt66nk0UYBLSD76Fho19zImvEZq1Uhf/XUnua5t9S
         f4l+W/FxE6Ji6fXIjStCsjQDPubqoNIvZxwL23+AUREzroyxFZiiLAcQ5UM9uHz675Uj
         qXusIkAeXyu9KS+iWj90q9lu6ATAZpEuJcJiwGqjyAkbDsKpj14qkMXF6Djv/KVhD7wq
         nE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709226351; x=1709831151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ057896F41b8xKHo3i3EmInyNgHYs5xAmXc0tMAJw0=;
        b=ne8XfD2zC2mnGBHHjD79hczkquIMQs2zN7oYBu9tu0gkEaE1LvSQ2Ydv+xw06MHDm6
         7nmC6fGmb5j56rHOYI34aTLNFocsCzdj8vvnSIv+stwmueFUrApjayuC24/3H4HBxxL8
         JH0qd2FA7Z6MNsJjYehATgWXmAJ3Vt/0j39D0GbXmV53sA8GwK7TNY+tHLHAuMO+/MuK
         8JB+y8OVNgtol8NvCMEjzkKvp+lJZ6UYzr4kmMVzQHbODxcqGvTxALVBwXL9SHusQzOO
         QP4+2ItEfSqy5Z/miGWdlk0UUIK1XAA6WETvMhhY8Txzp7GBbx+f4VlUUjkXkdp8lTjt
         TrfA==
X-Forwarded-Encrypted: i=1; AJvYcCU5LAnoQnq+XPANu+QXlluvHHqZj8UqzpOg8oKooOILtKfEACiQD3+4RIOlLpVDMSygiYz8wXAPYTyCVvyK6DhEE7QjUUy7OPXc3EGHnKQ=
X-Gm-Message-State: AOJu0YwMpDziOjeLzlHAzVLNxgw7JjXLfgL5YkNE559u60b/Wjrofcx+
	RhkMwUtbfksKfdFB3cwZH8kUOElUECFHCoHkFoMDp7Z3WXEQoR8GRC7cK1cPxw==
X-Google-Smtp-Source: AGHT+IGhsGq3Rcr1toRtnu606f48JbBE+Yt/jiGxXn3NRWm3QKckBRKQe1SGjZlxNZgyloyOHRrEJg==
X-Received: by 2002:a05:6402:95a:b0:566:b326:d105 with SMTP id h26-20020a056402095a00b00566b326d105mr815879edz.24.1709226351191;
        Thu, 29 Feb 2024 09:05:51 -0800 (PST)
Message-ID: <f32720e1-294d-453f-b830-ea524cd27e97@suse.com>
Date: Thu, 29 Feb 2024 18:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 03/10] x86: address some violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <3c9e90aaf5dde769b689468fc818e4ae61fa11f3.1709219010.git.nicola.vetrini@bugseng.com>
 <14d94c7e-7cd4-4508-a74e-eddd6a592219@suse.com>
 <85c54b2492a87f0538831c8baf5a8c76@bugseng.com>
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
In-Reply-To: <85c54b2492a87f0538831c8baf5a8c76@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 17:45, Nicola Vetrini wrote:
> On 2024-02-29 17:37, Jan Beulich wrote:
>> On 29.02.2024 16:27, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/include/asm/irq.h
>>> +++ b/xen/arch/x86/include/asm/irq.h
>>> @@ -179,9 +179,9 @@ void cleanup_domain_irq_mapping(struct domain *d);
>>>      void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq, 
>>> emuirq);\
>>>      __ret ? radix_tree_ptr_to_int(__ret) : IRQ_UNBOUND;               
>>>   \
>>>  })
>>> -#define IRQ_UNBOUND -1
>>> -#define IRQ_PT -2
>>> -#define IRQ_MSI_EMU -3
>>> +#define IRQ_UNBOUND (-1)
>>> +#define IRQ_PT      (-2)
>>> +#define IRQ_MSI_EMU (-3)
>>>
>>>  bool cpu_has_pending_apic_eoi(void);
>>>
>>
>> I'd be happy to ack this change right away.
>>
>>> --- a/xen/arch/x86/usercopy.c
>>> +++ b/xen/arch/x86/usercopy.c
>>> @@ -106,7 +106,7 @@ unsigned int copy_from_guest_ll(void *to, const 
>>> void __user *from, unsigned int
>>>      return n;
>>>  }
>>>
>>> -#if GUARD(1) + 0
>>> +#if GUARD((1)) + 0
>>
>> I don't even understand the need for this one, and nothing is said in
>> the description in that regard. Generally I'm afraid I'm averse to
>> such (seemingly) redundant parentheses in macro invocations.
>>
> 
> It's because
> #define UA_KEEP(args...) args
> #define GUARD UA_KEEP
> 
> which would expand to #if 1 + 0, while the rule demands #if (1) + 0
> I did note in the message after --- that I didn't wanna touch UA_KEEP so 
> I did this instead, which I'm not particularly happy about either. I can 
> remove this and deviate, there is no other issue with GUARD.

Or

#if (GUARD(1) + 0)

? To me at least that's quite a bit less odd. But I guess that still
wouldn't satisfy the rule. Perhaps even

#if (GUARD(1)) + 0

would be a little less odd, albeit there I'd already be on the edge.

Jan

