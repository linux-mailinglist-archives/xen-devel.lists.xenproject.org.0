Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150EC9C6E83
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 13:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835506.1251377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBC38-00045K-Sx; Wed, 13 Nov 2024 12:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835506.1251377; Wed, 13 Nov 2024 12:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBC38-00042A-Q7; Wed, 13 Nov 2024 12:00:42 +0000
Received: by outflank-mailman (input) for mailman id 835506;
 Wed, 13 Nov 2024 12:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBC36-0002tw-Mu
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 12:00:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55c4cfe-a1b6-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 13:00:37 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so84885425e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 04:00:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d55054a4sm23257115e9.25.2024.11.13.04.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 04:00:36 -0800 (PST)
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
X-Inumbo-ID: e55c4cfe-a1b6-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU1NWM0Y2ZlLWExYjYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDk5MjM3Ljc4NjI0LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731499237; x=1732104037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kJf/gQA45CP4D/4Y6vOugYBGfudKZ43RGYtNiQjjtV8=;
        b=en2d51QLkOqjvxjXSXunUqrkUR5UqOuARSH5WrczXufb/kUirRlCd+0+AeD4KgnlZR
         nC0ZPvU9Esqm1zaGct8hGYqnQZ+E0DlvlJ/E9uEx6BTxxROK+8JrIUSS4FAM1yxGkvix
         VYiPwd0y4I97eIQgYPgrZr+H0A8BVlUuueQhwPerexlmfBowo0Wq5HDZEwhNoSWFQHF5
         KIKV0URGF950z1HybsEMc6hSZOSfGJdMmnBhAUO7wc+XrqSde5SqIv0qOuN9aO864Vly
         bj+X+Nv8ZM8PJatOA7c74Srx6co8/0NAZKclDpdnhhyPQS1CLvn9b4k1AQ+7FhvzEr1o
         7IdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731499237; x=1732104037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJf/gQA45CP4D/4Y6vOugYBGfudKZ43RGYtNiQjjtV8=;
        b=c+FYqM7wY/7b6k9MDzkH+H8waACujvC3VrztozMGEu4/3enIxlr024TT4qvTC54amO
         7a47ljI7q6GHbmU3iwV7f1bTdpra34v4vebcPc4rrFYsYGFltBBZNNvuJgPdBjjDJiQO
         g5qNkOKtanXMHyr/cqJ3BksvcpIq2aH8z+2L0WTc8UNIOfAy2UJNYBUVimsmfOyTaiTm
         cfO3rYE/RVpfIPLlIp/ezz2u6ALOgTDvks7xWDjvyVKB4WN9MJFdKOqVcnBefACEt4hN
         q9bFakXTu3T1Jd24uyz3dpviXzLLPF4y0dGCyZijOy3d3w3Kb395m0Vk7BkZV0ptikjY
         aWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWWxcmRh1pt0u4f5aNEE3Xa3xzlw0RlwPoE1PSj+wN0qaVzPog+XUTkr+BDxkThJ3yZ+5IgBMO55k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxpFjpsUN02dRJOpsfzmRjBP8LJSHSLdn/I3ltJBH2bDNnVfbL
	M9h5kJCglH1ACeH9IL+/Zrm0bG3bQhWCpEoKaPgFZ0zv1a7NiwkQOEiaW/kUzg==
X-Google-Smtp-Source: AGHT+IFCcbPBPtLMFCrPlPYZAfacYD+3zWlL+ysbbXWx7LKzv298cB+QVcCiBnurLqLEP3tER3NKPA==
X-Received: by 2002:a05:600c:a04:b0:42c:a387:6a6f with SMTP id 5b1f17b1804b1-432b7518cd4mr196379825e9.20.1731499237052;
        Wed, 13 Nov 2024 04:00:37 -0800 (PST)
Message-ID: <8b3d42b6-3c22-4882-8df3-e3ce2bfd2dfb@suse.com>
Date: Wed, 13 Nov 2024 13:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/trampoline: Rationalise the constants to describe
 the size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-3-andrew.cooper3@citrix.com>
 <5961777b-2d38-4edd-b2e0-2da89862655c@suse.com>
 <49a1ba0d-b24c-46d2-a0a9-49183575aeaa@citrix.com>
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
In-Reply-To: <49a1ba0d-b24c-46d2-a0a9-49183575aeaa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 12:52, Andrew Cooper wrote:
> On 13/11/2024 10:23 am, Jan Beulich wrote:
>> On 13.11.2024 10:30, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/config.h
>>> +++ b/xen/arch/x86/include/asm/config.h
>>> @@ -51,8 +51,9 @@
>>>  
>>>  #define IST_SHSTK_SIZE 1024
>>>  
>>> -#define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
>>> -#define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
>>> +/* See asm/trampoline.h */
>>> +#define TRAMPOLINE_SIZE         KB(64)
>>> +#define TRAMPOLINE_HEAP_END     (TRAMPOLINE_SIZE - PAGE_SIZE)
>> Is there actually a reason these can't move to trampoline.h?
> 
> I considered that, and ruled it out, but I can't remember why exactly.
> 
> Right now, trampoline.h is C-only, but it can gain some __ASSEMBLY__
> easily enough.
> 
> 
> The two later constants, WAKEUP_STACK_MIN and MBI_SPACE_MIN are used
> only in linker assertions, and of dubious value.  In particular, the
> size of the VESA information in the heap is not accounted for in the
> MBI_SPACE_MIN check.
> 
> I have an idea to remove all of this boot metadata shuffling when the
> boot_info work is a bit better done, which is why I left the constants
> alone.

Fair enough then.

Jan

