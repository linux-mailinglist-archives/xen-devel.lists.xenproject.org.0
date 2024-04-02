Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B6894BB7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 08:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699981.1092420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrXso-0005Bj-IE; Tue, 02 Apr 2024 06:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699981.1092420; Tue, 02 Apr 2024 06:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrXso-0005A8-ES; Tue, 02 Apr 2024 06:44:34 +0000
Received: by outflank-mailman (input) for mailman id 699981;
 Tue, 02 Apr 2024 06:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrXsm-0005A2-Uk
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 06:44:33 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7503cfad-f0bc-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 08:44:30 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so3405512f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Apr 2024 23:44:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d4884000000b0033e7603987dsm13300991wrq.12.2024.04.01.23.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 23:44:29 -0700 (PDT)
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
X-Inumbo-ID: 7503cfad-f0bc-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712040270; x=1712645070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbBcv4vM9cxCoUaNPtf6jm5Arz9yTd2IuVeBEzNAVIc=;
        b=GpTf32ZI5w8f29HSa3RlTs5T6tT3HyYUJfoL6KWzB2pgScpQgu2was7GcM6oowsANt
         wpm/6N9LJlFbQd3/0dXzlz+x4i0uQ2tDEJgkDasyO7J+wUppAmxJOJ4VKTdScLyoLsi3
         FyHD0jzd66QjLvhNamKf/ZNAopOowuhhsbVYElxwi4YulU7Lx/ojzqfoU5rLwSnyOapV
         0pbxDeSxcYS3ZDCXFWWd/FmUUaxC0XPhkt6HKLDI4KSWGHxqmEQoq2xxl4sts6bN3vKC
         jbjIQuOdPIlhxmvaVucBiI12hPiUdIqW3NmAzlvJUvMJLjWA2FMZHp/jH4TioDzGM4Na
         R4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712040270; x=1712645070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbBcv4vM9cxCoUaNPtf6jm5Arz9yTd2IuVeBEzNAVIc=;
        b=PqglMiUk4KCh/W74ngX7Ou+gRW7h79jOSiRiQGbU9DTh4ElqP/vQyXJll6mYe+h0k9
         6fuLfq1/3IjMBsvZLJfJ422iXK0BFfNPlSDvlGlCGyT/wNvumAxSWrr+DDHkMEQnYRcb
         hrbBJ97gOocNfGRpBhaoN54kIknBO9bFDeVekqp1FB5nF7cfAVCLIJODydvHfSknIzoe
         0OoIqK+mRGYQeHV1smG+ZH3Wz5pfZHg8iyXNIHxwctsAqPqdwWvcknbjdbQkmWOxxp0Z
         xrSeLaDPVsDTIGFh75yeLmqAeER/0kqREgb36SqjlGBZfH8D1LgE+GqtIpcSlapnHL+L
         TXRw==
X-Forwarded-Encrypted: i=1; AJvYcCWB1OyhE2weCJLb5kkTkItMO7EtIbGqYXCPljc8hwq2kvWyWo9UyVlOAeM+MGuExxjIgUr2HddP6ms+CWdc3L9kU2ay7zgr5AUUpKRyAEE=
X-Gm-Message-State: AOJu0YyqXxteLPYCH5XUU5vBPxHvYTV8Ok5mFBRgmKEoAB8ozxSKP3cB
	wlmS2q6JKbBavM+BrdnhRZyUIWVMwU8otrxtcv7W4KzyfJZvGlUcyoQFNnJ6eg==
X-Google-Smtp-Source: AGHT+IGEfeHtOJTOECClQGUd5SalbfLPF3rtN4R8CPdy4hTqWOQTa22pKRjv2YzD4yaB8QNn7ZmRrA==
X-Received: by 2002:a05:6000:110e:b0:341:7e10:1a1e with SMTP id z14-20020a056000110e00b003417e101a1emr9226059wrw.60.1712040269822;
        Mon, 01 Apr 2024 23:44:29 -0700 (PDT)
Message-ID: <514380b9-d7ba-466b-b992-28bb1953a6ae@suse.com>
Date: Tue, 2 Apr 2024 08:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] libelf: Store maximum PHDR p_align
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-4-jason.andryuk@amd.com>
 <f2297a46-4d19-4b98-b986-e05ac9f7a2c5@suse.com>
 <d6927896-0168-4620-b10a-8d6304b4d6eb@amd.com>
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
In-Reply-To: <d6927896-0168-4620-b10a-8d6304b4d6eb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2024 15:41, Jason Andryuk wrote:
> On 2024-03-28 12:47, Jan Beulich wrote:
>> On 27.03.2024 22:51, Jason Andryuk wrote:
>>> --- a/xen/common/libelf/libelf-loader.c
>>> +++ b/xen/common/libelf/libelf-loader.c
>>> @@ -468,6 +468,7 @@ void elf_parse_binary(struct elf_binary *elf)
>>>   {
>>>       ELF_HANDLE_DECL(elf_phdr) phdr;
>>>       uint64_t low = -1, high = 0, paddr, memsz;
>>> +    uint64_t max_align = 0, palign;
>>>       unsigned i, count;
>>>   
>>>       count = elf_phdr_count(elf);
>>> @@ -481,17 +482,23 @@ void elf_parse_binary(struct elf_binary *elf)
>>>               continue;
>>>           paddr = elf_uval(elf, phdr, p_paddr);
>>>           memsz = elf_uval(elf, phdr, p_memsz);
>>> -        elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
>>> -                paddr, memsz);
>>> +        palign = elf_uval(elf, phdr, p_align);
>>> +        elf_msg(elf,
>>> +                "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 " palign=%#" PRIx64 "\n",
>>> +                paddr, memsz, palign);
>>>           if ( low > paddr )
>>>               low = paddr;
>>>           if ( high < paddr + memsz )
>>>               high = paddr + memsz;
>>> +        if ( max_align < palign )
>>> +            max_align = palign;
>>>       }
>>>       elf->pstart = low;
>>>       elf->pend = high;
>>> -    elf_msg(elf, "ELF: memory: %#" PRIx64 " -> %#" PRIx64 "\n",
>>> -            elf->pstart, elf->pend);
>>> +    elf->palign = max_align;
>>> +    elf_msg(elf,
>>> +            "ELF: memory: %#" PRIx64 " -> %#" PRIx64 " align:%#" PRIx64 "\n",
>>> +            elf->pstart, elf->pend, elf->palign);
>>>   }
>>
>> Hmm, it's just this final logging change which I'm a little concerned by:
>> Having looked at Linux'es phdr, I noticed that the addresses there aren't
>> necessarily matching the corresponding alignment. Therefore I'm a little
>> concerned that the output here might raise questions when people see
>> seemingly inconsistent values in the log. Could you/we at least make it
>> read like e.g. "align (max): ..."?
> 
> max_align?
> 
> Looking at my test vmlinux, it looks like PHDR 0 (.text) and PHDR 1 
> (.data) are aligned.  It's the PHDR 2 (.init) that isn't aligned.  Is 
> that what you see?
> 
> This line is already printing the min and max across all the PHDRs, so 
> it would only look confusing if the start didn't match the align.
> 
> I'm not sure how useful it is to print the alignment, and I considered 
> not printing it.  It's only used with PVH Dom0 right now, so it's not 
> relevant in most cases.

Well, yes, not printing the alignment would be fine with me. I just didn't
suggest that as an alternative since I was assuming you put its printing
there for a reason.

Jan

