Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED0917BB3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748545.1156288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOby-0006GK-2D; Wed, 26 Jun 2024 09:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748545.1156288; Wed, 26 Jun 2024 09:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMObx-0006EL-Vn; Wed, 26 Jun 2024 09:06:41 +0000
Received: by outflank-mailman (input) for mailman id 748545;
 Wed, 26 Jun 2024 09:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMObw-0006EF-3y
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:06:40 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64118e2d-339b-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:06:36 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so72292041fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 02:06:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7069eb83d7fsm2305098b3a.99.2024.06.26.02.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 02:06:35 -0700 (PDT)
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
X-Inumbo-ID: 64118e2d-339b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719392796; x=1719997596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Jeq0n8+gSFVF/a9Kn28ZuDMbwG8/SmVYarkQo66UCU=;
        b=cPU5+U0LA/Pha0fqnZkLq+kTXtFOG3WGxReIvi9THEX2TnEGTTpYqUUK4ESacRXE9u
         /W2ffXYvNTlkapeU7H3ZYmWPCGcb/GsHy0zcYC7bKxw7p7FV1BPhN3ZKL/XNkRRhbDQ3
         3Vlyv1s0ENhC7D6zJx+d8JqkYXPDL0xKPU84BRVjS3w/im4nArvncW8DvICkFw3ezCTi
         qAOJaF+0S3zWXVaiTRXn6OfzqU8gUk1Rq5xH/Fpig/2dHEJFs90Uy649nDs8UnotOFEi
         v/WwGnJnyOjaoH5jjs1+FdxR856Y72rKXmPJDiYoQ9lBjGTArvuugqkwatkqVyGjn3Za
         eMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719392796; x=1719997596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Jeq0n8+gSFVF/a9Kn28ZuDMbwG8/SmVYarkQo66UCU=;
        b=GoJ7y3CWceUPAk4MRs7GbUScZzqkdF7u10qB8rXNfQ5mnyPZQgdh3lWGV6dNDgCQV8
         eXO0YaG2ekplZ2NOJ85AJaoM+wxjxl8w6Zg63HGt2YICJopCSc+KS1aa/VMsqi4p+ySi
         OiF412zx1EofnE4WfbcFwe3VqTfXWJ3dhH4X3jgWRDkIfqfI/BbJs+tA2G+OvmwxsEe9
         NNSWwbY0Uz3rXnbijYoguUdvE/H/czDgChkI31lJ3nbkQWk1rMsqidx31qk+gaT4YRHy
         /aNJHeylevHHDD6FFPoimKfg7S5Q7kETMxWdzqHBN1D10ao7HJlUkHCjuV+3Ppk6fPIo
         5Drw==
X-Forwarded-Encrypted: i=1; AJvYcCX0xBBXjrd/Gzs6qNaijSKxEDFgghE4Vb26gc+LyZVT8TH5LRQuihYOJJwDXxHT7u66qrLxnDv2XvgYHlDUz8+e/unNWQB+Wo97J1jKY5E=
X-Gm-Message-State: AOJu0YxPxJ8dG3ckG+axa9FGpQl5c4zCIVo9oEXfVUhzxSFxA/hhId3e
	1rjtYRlFZcfLpYxiCuzSGMx0f/BFwlaz27qbUeb6rEFN3u9s5r8+JA0MGX0hcA==
X-Google-Smtp-Source: AGHT+IGj8qL12/pe13crY3AWK9qjFSf4Ze8LTduTeAxWSLzdRVvfc9TAegtIFcorjZm+mCYaGCp6nw==
X-Received: by 2002:a2e:2419:0:b0:2ec:422:126 with SMTP id 38308e7fff4ca-2ec5932a567mr73398921fa.30.1719392795918;
        Wed, 26 Jun 2024 02:06:35 -0700 (PDT)
Message-ID: <ec92611e-6762-4b6c-af3e-999b748d1f1b@suse.com>
Date: Wed, 26 Jun 2024 11:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 05/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
 <dce6c44d-94b7-43bd-858a-9337336a79cf@suse.com>
 <ef623bad297d016438b35bedc80f091d@bugseng.com>
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
In-Reply-To: <ef623bad297d016438b35bedc80f091d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 21:31, Nicola Vetrini wrote:
> On 2024-03-12 09:16, Jan Beulich wrote:
>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
>>>  $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i 
>>> $(src)/Makefile
>>>  	$(call filechk,asm-macros.h)
>>>
>>> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
>>
>> This wants to use :=, I think - there's no reason to invoke the shell 
>> ...
> 
> I agree on this
> 
>>
>>>  define filechk_asm-macros.h
>>> +    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>>> +    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
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
>>> +    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
>>>  endef
>>
>> ... three times while expanding this macro. Alternatively (to avoid
>> an unnecessary shell invocation when this macro is never expanded at
>> all) a shell variable inside the "define" above would want introducing.
>> Whether this 2nd approach is better depends on whether we anticipate
>> further uses of ARCHDIR.
> 
> However here I'm not entirely sure about the meaning of this latter 
> proposal.
> My proposal is the following:
> 
> ARCHDIR := $(shell echo $(SRCARCH) | tr a-z A-Z)
> 
> in a suitably generic place (such as Kbuild.include or maybe 
> xen/Makefile) as you suggested in subsequent patches that reused this 
> pattern.

If $(ARCHDIR) is going to be used elsewhere, then what you suggest is fine.
My "whether" in the earlier reply specifically left open for clarification
what the intentions with the variable are. The alternative I had described
makes sense only when $(ARCHDIR) would only ever be used inside the
filechk_asm-macros.h macro.

Jan

