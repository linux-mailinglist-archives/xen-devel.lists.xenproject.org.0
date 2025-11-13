Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CDC579D8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:19:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161490.1489434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXEU-0007UV-8D; Thu, 13 Nov 2025 13:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161490.1489434; Thu, 13 Nov 2025 13:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXEU-0007T3-5Q; Thu, 13 Nov 2025 13:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1161490;
 Thu, 13 Nov 2025 13:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXET-0006uu-Mp
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:19:25 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f26e281-c093-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:19:23 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so1488471a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:19:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b1dc1sm1485362a12.25.2025.11.13.05.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:19:22 -0800 (PST)
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
X-Inumbo-ID: 5f26e281-c093-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763039963; x=1763644763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nJBHzD6gKkuZAHFa7RBzBbE70tyY7oUWjrvjeW9kIEA=;
        b=D+bJIbXs/8J+AZUtWdeHQvHBxSya24bOtsVMFEbcYkBkFb8PffdKxBZT78K3GRtbpZ
         w1tDOzp0+AhanDOGo2xCG+y/cV5Wa3w6Z7YI0lhfFt1jPBtkpR9FZfo3aRbJ2xU7dPFm
         o3Gg2i+eIpRu/wNnn6fBGqq1l8VVadEitHPrB+dyVjMUEIni9QVmxBTka5X1tiPuhtb3
         AALTJo7/E7+6KurxHCMDlbgzlSGHoipPACkTReEd6/h59ph1l+WAj+ILuGpeA6zFfWds
         dYw5BkJsm+Ha8DYhYGaZihhvwnCC7VHl+fA0q2kJIrrVMmKcp0B+nIRqO9LxZrL/tuDd
         ExXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039963; x=1763644763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJBHzD6gKkuZAHFa7RBzBbE70tyY7oUWjrvjeW9kIEA=;
        b=sL1qOhCuQDUeEqaPs8rx/ktGkekaNnmSk9aHtoznrUKI5mh6eK3+r91K+yiUhJAitz
         2MwKdEyzEpNtVNAsVO2Kp8CKjrf6ahBZemV6gJ0ZW5xE7RSVSFTRaDoJ3xlP42pixQnT
         gIH/5uWyxJb4CeyEn7RHLbJEgw9Z4cur9Gydc4aMK0OzuYndW8eKMqANCu2+G1cw/ED4
         ha+iiSC04yfSb+9jbq6wY5aXHmcuOe6mZJJ2QZyQ1qsrTKU0bXMoEods7U4KYJkfXLVt
         F8mKl9xAWSgmS4/9/2ccT2f3CZ6Xr0IlnLDDh8xts1mJRRwbfsaoqgNshdDE/L9YZ0gA
         y2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUndx26yT4MgreRCD21R7z7VKON8KMKUXhqJpUq1B2boh/FgDYiMSZlSR3DlYgwvhzqPrzAxwVKICQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8OHc++JNg9co/+f3C07NoHm7w1mU5dUcvHgpfI2/+XT8yB/zf
	Icq1HIKcpEe9SrOM78ANaWQpIsIY6OhL+tybO1E7niTGit9rr/IjeQ2k3uWPZdPX6w==
X-Gm-Gg: ASbGnctE8dZ32kgwD2W8g1fRm9Yj/5clbWg5P+MR8xJDCrglhNhZXqd465o65+tQa4R
	zwFxDUoYNsdpUWGqEkJMou62rwoSXrYu1vaKogpOlOq+sSiVQkmCfdPq3F1QuiE2nfIRDd6SPBp
	eI5zvvnf1AQCQGIMi8Dww+WlSdSu42p9piU0haCjYigquNltpAycppzYLCTIHoVMszVn8ltJTcP
	W4tfsFbC3QCc01g95EOnK3ETNq8QXDpKNR3Ecbi6P+XBZBTFW/IJwAbCTZmV5InUoI8fQX6PwJp
	LqKELGkhWHZvP6BnqaAWb47s+5XhjWCL9sBScFwvrLyt4yj600uAs/ARIbu+nRIN0bYtP6eIIHh
	JYzr6IqjoggTLYqclj2k2XCrP+xeexNMz2vcTBMzfwcY1iEW+kltmERmlwaU+cPZQOE6Bg5ynjO
	r/e4ded+KWxHSWsNDm/StdCJbtEhx80kaPZyh0sF/6xUIyB4Cy7mwW742L0GVup26D
X-Google-Smtp-Source: AGHT+IFDJz6bECSFCp3o/6cSu38GBqJu9L+415RRf3YVNf+KAtAKHSgcXwEYk5Q2s6I+HXyXBJjiOw==
X-Received: by 2002:a05:6402:34d5:b0:640:947e:70b7 with SMTP id 4fb4d7f45d1cf-6431a38d1d0mr5913410a12.3.1763039963312;
        Thu, 13 Nov 2025 05:19:23 -0800 (PST)
Message-ID: <3c70553d-adc4-4f84-aa28-399f6f4c1677@suse.com>
Date: Thu, 13 Nov 2025 14:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/5] x86: hvm: compat: introduce
 vcpu_is_hcall_compat() helper
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-3-grygorii_strashko@epam.com>
 <da0d003e-a593-4b40-ac79-c889a6be683f@suse.com>
 <f929a081-4f8a-489f-935c-4ed0656095f0@epam.com>
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
In-Reply-To: <f929a081-4f8a-489f-935c-4ed0656095f0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 14:07, Grygorii Strashko wrote:
> On 13.11.25 14:22, Jan Beulich wrote:
>> On 11.11.2025 18:54, Grygorii Strashko wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -311,6 +311,15 @@ struct vcpu
>>>   #endif
>>>   };
>>>   
>>> +static inline bool vcpu_is_hcall_compat(const struct vcpu *v)
>>
>> Does the vcpu_ prefix really buy us much here? The per-vCPU aspect is already
>> conveyed by the function parameter, I'd say.
> 
> Such annotation makes it clear that operation is performed on struct vcpu object,
> which improves readability and code analyze (might help also if somebody will ever
> try split sched.h).
> 
> For example:
> 
> is_hcall_compat(curr) in the code doesn't say too much - need parse code
> (or have modern editor which can parse and highlight parameter type for us,
>   still need some mouse manipulations:))

That's one of the reasons we aim at using consistently named variables. "curr"
should be pretty clear to everyone as being "current" latched into a local
variable. Plus of course for every function invocation call site context is
relevant anyway, when it comes to arguments passed to the function.

> vcpu_is_hcall_compat(curr) - is kinda absolutely clear from the first look.
>   
>>
>> Actually - is a parameter in fact needed? It's always current afaics. (Then,
>> if the parameter was to stay for some reason, it would want naming "curr".)
> 
> "curr" it be

My preference would still be is_hcall_compat(void).

Jan

