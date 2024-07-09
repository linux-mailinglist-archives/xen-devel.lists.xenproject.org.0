Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9EC92B16D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755950.1164494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR5Xo-00048M-L6; Tue, 09 Jul 2024 07:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755950.1164494; Tue, 09 Jul 2024 07:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR5Xo-00045i-IH; Tue, 09 Jul 2024 07:45:48 +0000
Received: by outflank-mailman (input) for mailman id 755950;
 Tue, 09 Jul 2024 07:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR5Xn-00045c-29
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:45:47 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40595634-3dc7-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 09:45:45 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ee91d9cb71so45308221fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:45:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99a980663sm9311082a91.28.2024.07.09.00.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:45:44 -0700 (PDT)
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
X-Inumbo-ID: 40595634-3dc7-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720511145; x=1721115945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x7FU6vgxAF8S5OPpX0HZ0u9OIsWg1BF1LupuinZ2Y28=;
        b=dgrHLojdTkDJHDScekbVjBsFFmxCsS/KYSdyaUNGI/ydMWeDrMpf5WuUcXvIvXzUZS
         a9UxAtnx7kfQnikE9yMemXZDcrBdZoVKG0DnMdgWy/dpBP+fUVjoi2QKQqmkHURuzVtj
         w21lODAj84uHEVPbBNF1+6STuVhpGX9GtU99II0LeN82MwNIoxoprjD1WV2eLzFt9KBC
         1y6b6QcBq0N1QNHQW8HBw3OOvjQuyNl5Dlfw40tbLb2u23qvYeCgg+edFMsmTCqxCCMR
         /jim3sTQQqq+NFKfmo8dTt2e7rFAXTxVNY7u8YLr+QL65V76e3192ibqdiwHyRVeGzK4
         Q13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720511145; x=1721115945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7FU6vgxAF8S5OPpX0HZ0u9OIsWg1BF1LupuinZ2Y28=;
        b=buPgXPjSREooQsztn/2dGAPfZNf8SER0qeGK4K6U1mdUBLvSSMnOulDaPSGjhxKEFe
         BnQZG9jg1/OC3fIjKunNK2oTs3GM2WEY6lvts51k/6rJJ5lbhWR5pqaiGz+zg7oQwyKk
         Far+MRS3ajwK8d5pKexPYkCEdBA+d8evJTJ+916E+qa/lPnoj4R/lEKZtke0MohIV3+k
         Ts4c48J/aPKhwO4Wir9FGCoHVXwtLUD6do4NXrS8AjUkvFvCRfc1xHK2IBRGxfu0+AVH
         0qwrXeQBvStN6AL4lBnmvRuoiU2kyzBgk4g6ktwujOH+urvLtUVedHTyB9RNBttmS+q6
         yPZA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ZYTmV2rGhTrkH1mAzrTSsaq/q3vrn2FpozYj71HQd3nVTBpoU2l/YeiiUfxWxEKIcoCsuREekDU87ePnzld19uQ4ktK733rS8YJRfeQ=
X-Gm-Message-State: AOJu0YzG0fFW03uzRSPnD+ZYsqOH1jv9sUcYZzMc4SvKzBmUY8gYNW07
	T7weErGkxTA6ZXcT0CCrieaiupg3HG1SqE9nmJkbpZVLMI+ferhznn5Z/V2iuw==
X-Google-Smtp-Source: AGHT+IFE1s3kxW7SaUwMDOJZoRWWLsI8yHNJKO8qvplK2twOhYL12i+/lW9Ohgfwt9ecEtQrUGhkrg==
X-Received: by 2002:a05:651c:210c:b0:2eb:f31e:9e7b with SMTP id 38308e7fff4ca-2eeb30e5129mr15425191fa.14.1720511145465;
        Tue, 09 Jul 2024 00:45:45 -0700 (PDT)
Message-ID: <6620954e-b6d3-4073-ae68-0451aea44c52@suse.com>
Date: Tue, 9 Jul 2024 09:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] xen/x86: address violations of MISRA C:2012
 Directive 4.10
To: alessandro.zucchelli@bugseng.com
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <d67d06849732fea11391afd61ff9891ed11795e5.1719829101.git.alessandro.zucchelli@bugseng.com>
 <09bc4d2e-b4fb-428b-b0e3-266952ebd3c5@suse.com>
 <20ad12e8beec50aaa58305ee5f376e21@bugseng.com>
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
In-Reply-To: <20ad12e8beec50aaa58305ee5f376e21@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 09:38, Alessandro Zucchelli wrote:
> On 2024-07-01 16:21, Jan Beulich wrote:
>> On 01.07.2024 15:36, Alessandro Zucchelli wrote:
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -260,17 +260,18 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: 
>>> $(obj)/asm-macros.i $(src)/Makefil
>>>  	$(call filechk,asm-macros.h)
>>>
>>>  define filechk_asm-macros.h
>>> +	guard=$$(echo ASM_${SRCARCH}_ASM_MACROS_H | tr a-z A-Z);  \
>>
>> Nit: Hard tab slipped in.
>>
>>> +    echo '#ifndef $$guard'; \
>>> +    echo '#define $$guard'; \
>>>      echo '#if 0'; \
>>>      echo '.if 0'; \
>>>      echo '#endif'; \
>>> -    echo '#ifndef __ASM_MACROS_H__'; \
>>> -    echo '#define __ASM_MACROS_H__'; \
>>>      echo 'asm ( ".include \"$@\"" );'; \
>>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>>>      echo '#if 0'; \
>>>      echo '.endif'; \
>>>      cat $<; \
>>> -    echo '#endif'
>>> +    echo '#endif'; \
>>> +    echo '#endif /* $$guard */'
>>>  endef
>>>
>>>  $(obj)/efi.lds: AFLAGS-y += -DEFI
>>> --- a/xen/arch/x86/cpu/cpu.h
>>> +++ b/xen/arch/x86/cpu/cpu.h
>>> @@ -1,3 +1,6 @@
>>> +#ifndef X86_CPU_CPU_H
>>> +#define X86_CPU_CPU_H
>>
>> This, ...
>>
>>> --- a/xen/arch/x86/x86_64/mmconfig.h
>>> +++ b/xen/arch/x86/x86_64/mmconfig.h
>>> @@ -5,6 +5,9 @@
>>>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>>>   */
>>>
>>> +#ifndef X86_64_MMCONFIG_H
>>> +#define X86_64_MMCONFIG_H
>>
>> ... this, and ...
>>
>>> --- a/xen/arch/x86/x86_emulate/private.h
>>> +++ b/xen/arch/x86/x86_emulate/private.h
>>> @@ -6,6 +6,9 @@
>>>   * Copyright (c) 2005-2007 XenSource Inc.
>>>   */
>>>
>>> +#ifndef X86_X86_EMULATE_PRIVATE_H
>>> +#define X86_X86_EMULATE_PRIVATE_H
>>
>> ... this guard can't possibly all follow the same proposed naming 
>> scheme
>> (wherever the final version of that is being recorded; I don't recall 
>> it
>> having gone in, and I didn't spot anything earlier in the series); at
>> least one must be wrong.
> 
> For x86/x86_64/mmconfig.h has been made an exception as stated in the 
> commit
> message:
> Note that in x86_64/mmconfig.h we slightly deviate from the naming
> convention in place: instead of having the inclusion guard as
> X86_X86_64_MMCONFIG_H we shortened the directory prefix as X86_64 for
> the sake of readability.
> 
> If you do not agree with this exception and you prefer to keep the 
> additional
> X86_ prefix let me know so as I prepare the patch series V5 I may 
> reintroduce it.

What I have an issue with is making an exception in one place when quite
clearly would as much (or as little) benefit from one. Before there's
any further back and forth, I'd like to suggest that you wait with
adjustments here until the base scheme has really been agreed upon,
including situations where we think we'd like to make exceptions (after
all we might decide that there simply shouldn't be exceptions, and that
in order to eliminate such redundancy in guard identifiers we'd rather
like to rename some of the files).

Jan

