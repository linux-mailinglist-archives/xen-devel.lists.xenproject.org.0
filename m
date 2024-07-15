Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CB930EB9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 09:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758690.1168117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTG7S-00038M-Ij; Mon, 15 Jul 2024 07:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758690.1168117; Mon, 15 Jul 2024 07:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTG7S-00035u-Fx; Mon, 15 Jul 2024 07:27:34 +0000
Received: by outflank-mailman (input) for mailman id 758690;
 Mon, 15 Jul 2024 07:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTG7Q-00035o-VZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 07:27:32 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1fb51e7-427b-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 09:27:30 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7523f0870cso435795066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 00:27:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc48de8sm34256835ad.255.2024.07.15.00.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:27:29 -0700 (PDT)
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
X-Inumbo-ID: b1fb51e7-427b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721028450; x=1721633250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0E5OvlxyOxa3nPbkFhwH5R9IjqWMFuxpE0FMpHITQt8=;
        b=Pf5HxBp/Y6JHJLZ4Wd+WCLC49y8eH8I8X/VGGN5GPreYI7LOsmSjImCv0HFzqyxyqu
         I3PZbXRAujemFxbCuOOInHpTJteC6lTLjPXieeEdx01mwAQndWK/lu/GS1yElvYcAdwq
         359q/BeWgX2/36JxA+9576i9mvdUJA5HbDf7OPIjXyL9OBQhuPXYsZ3L4Nphw9T3J8Rq
         vZNRfQDWuO3WnPVnOsuieaOnWgOPf4Hywn2CAhho6y8kRMDA3D6Ceo5E+AAVCaSyHOZi
         JazO9oWd2UkK1TdBHxf2n4GI3UCKQqcyImmnTSOwSW6ZyjK9ppvCNpjdksczbS7Rv8It
         BhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721028450; x=1721633250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0E5OvlxyOxa3nPbkFhwH5R9IjqWMFuxpE0FMpHITQt8=;
        b=j1lYdf4nPphGV7ocn39RHRSUnHE9lKzvaBuFORLdk4bvUQFq2JEZNNu2T1pzGC42fX
         RlDEHIv3JLBJ6PKxAU0h9p2SyKM3ZvvhqOSvzHZQNRNU8bJiIVRVz2rvtyCUDf7Ryj0f
         qvL+YN1rwENniqXvZUFF6rDCDwHzz8X8xnOFFBqY22qZfik6GKXZroVvHBD3tKzQbYkW
         GemY938TllJB56j5gxj3okVE6MVQBicSuiEXiWBb50OQDJnfaUnun389XpA2MjNFlLyS
         lrEdqPHNqqmr4Uq9/HjdpIFaqFW+EIl5GgHar+m2DrfWujplg50dpz5yJH1S8uB/5Sah
         9g4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyBRb4KrQCfB0dYtLzi61PM+IBjgKVjxLi+VEcyKeM29IjAsLODyuyK+GomSPiyNRI3dhFnzkaZtLN2RTIZjB46R1/r+ixdgU1m234C08=
X-Gm-Message-State: AOJu0Yw0OI48sNxc6Hcv4zvQrRj9mPBIMc+vFKxVJc+xrbejIlO6NfTs
	GjMPM4bFcIN2cNtGcq0N8VlCt98VKwyJYXkvqPeYvpGGXjOXG0FvpIZnbwyKqQ==
X-Google-Smtp-Source: AGHT+IHj24D42SG/Qz8xQoEcjJoo3wPCg4JAeWVve09nlmEsyEz8NcaKvMvMgQehbq9AhSEQpAmVQw==
X-Received: by 2002:a17:906:d287:b0:a77:f2c5:84b3 with SMTP id a640c23a62f3a-a780b6b0edfmr1073910666b.22.1721028450153;
        Mon, 15 Jul 2024 00:27:30 -0700 (PDT)
Message-ID: <54bd70de-2426-4573-b95e-8f00a415c8af@suse.com>
Date: Mon, 15 Jul 2024 09:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] xen/x86: address violations of MISRA C:2012
 Directive 4.10
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: alessandro.zucchelli@bugseng.com, nicola.vetrini@bugseng.com,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <d67d06849732fea11391afd61ff9891ed11795e5.1719829101.git.alessandro.zucchelli@bugseng.com>
 <09bc4d2e-b4fb-428b-b0e3-266952ebd3c5@suse.com>
 <20ad12e8beec50aaa58305ee5f376e21@bugseng.com>
 <6620954e-b6d3-4073-ae68-0451aea44c52@suse.com>
 <alpine.DEB.2.22.394.2407121505330.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2407121505330.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.07.2024 00:09, Stefano Stabellini wrote:
> On Tue, 9 Jul 2024, Jan Beulich wrote:
>> On 09.07.2024 09:38, Alessandro Zucchelli wrote:
>>> On 2024-07-01 16:21, Jan Beulich wrote:
>>>> On 01.07.2024 15:36, Alessandro Zucchelli wrote:
>>>>> --- a/xen/arch/x86/Makefile
>>>>> +++ b/xen/arch/x86/Makefile
>>>>> @@ -260,17 +260,18 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: 
>>>>> $(obj)/asm-macros.i $(src)/Makefil
>>>>>  	$(call filechk,asm-macros.h)
>>>>>
>>>>>  define filechk_asm-macros.h
>>>>> +	guard=$$(echo ASM_${SRCARCH}_ASM_MACROS_H | tr a-z A-Z);  \
>>>>
>>>> Nit: Hard tab slipped in.
>>>>
>>>>> +    echo '#ifndef $$guard'; \
>>>>> +    echo '#define $$guard'; \
>>>>>      echo '#if 0'; \
>>>>>      echo '.if 0'; \
>>>>>      echo '#endif'; \
>>>>> -    echo '#ifndef __ASM_MACROS_H__'; \
>>>>> -    echo '#define __ASM_MACROS_H__'; \
>>>>>      echo 'asm ( ".include \"$@\"" );'; \
>>>>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>>>>>      echo '#if 0'; \
>>>>>      echo '.endif'; \
>>>>>      cat $<; \
>>>>> -    echo '#endif'
>>>>> +    echo '#endif'; \
>>>>> +    echo '#endif /* $$guard */'
>>>>>  endef
>>>>>
>>>>>  $(obj)/efi.lds: AFLAGS-y += -DEFI
>>>>> --- a/xen/arch/x86/cpu/cpu.h
>>>>> +++ b/xen/arch/x86/cpu/cpu.h
>>>>> @@ -1,3 +1,6 @@
>>>>> +#ifndef X86_CPU_CPU_H
>>>>> +#define X86_CPU_CPU_H
>>>>
>>>> This, ...
>>>>
>>>>> --- a/xen/arch/x86/x86_64/mmconfig.h
>>>>> +++ b/xen/arch/x86/x86_64/mmconfig.h
>>>>> @@ -5,6 +5,9 @@
>>>>>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>>>>>   */
>>>>>
>>>>> +#ifndef X86_64_MMCONFIG_H
>>>>> +#define X86_64_MMCONFIG_H
>>>>
>>>> ... this, and ...
>>>>
>>>>> --- a/xen/arch/x86/x86_emulate/private.h
>>>>> +++ b/xen/arch/x86/x86_emulate/private.h
>>>>> @@ -6,6 +6,9 @@
>>>>>   * Copyright (c) 2005-2007 XenSource Inc.
>>>>>   */
>>>>>
>>>>> +#ifndef X86_X86_EMULATE_PRIVATE_H
>>>>> +#define X86_X86_EMULATE_PRIVATE_H
>>>>
>>>> ... this guard can't possibly all follow the same proposed naming 
>>>> scheme
>>>> (wherever the final version of that is being recorded; I don't recall 
>>>> it
>>>> having gone in, and I didn't spot anything earlier in the series); at
>>>> least one must be wrong.
>>>
>>> For x86/x86_64/mmconfig.h has been made an exception as stated in the 
>>> commit
>>> message:
>>> Note that in x86_64/mmconfig.h we slightly deviate from the naming
>>> convention in place: instead of having the inclusion guard as
>>> X86_X86_64_MMCONFIG_H we shortened the directory prefix as X86_64 for
>>> the sake of readability.
>>>
>>> If you do not agree with this exception and you prefer to keep the 
>>> additional
>>> X86_ prefix let me know so as I prepare the patch series V5 I may 
>>> reintroduce it.
>>
>> What I have an issue with is making an exception in one place when quite
>> clearly would as much (or as little) benefit from one. Before there's
>> any further back and forth, I'd like to suggest that you wait with
>> adjustments here until the base scheme has really been agreed upon,
>> including situations where we think we'd like to make exceptions (after
>> all we might decide that there simply shouldn't be exceptions, and that
>> in order to eliminate such redundancy in guard identifiers we'd rather
>> like to rename some of the files).
> 
> I don't think it is a good idea to introduce a naming scheme and
> immediately add exceptions. I would stick to the naming scheme even if
> it doesn't always lead to the best possible name. Also these are header
> guards, they are not critical variables for which clarity and shortness
> are paramount.
> 
> The naming scheme was written in the 0 email and copy/pasted here for
> convenience:
> 
> - private headers -> <dir>_<filename>_H
> - asm-generic headers -> ASM_GENERIC_<filename>_H
> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
> - include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
> - arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H
> 
> So in this patch I would sticked to the naming scheme and used:
> 
> X86_CPU_CPU_H
> X86_X86_64_MMCONFIG_H
> X86_X86_EMULATE_PRIVATE_H

Uniformly sticking to the scheme is definitely an option. Provided we're
happy with excessively long identifiers (think of, sooner or later, there
going to be style violations wrt line length) and ones having overly
redundant name components. Yet as said elsewhere, first and foremost I
think we need a scheme where collisions cannot occur.

Jan

