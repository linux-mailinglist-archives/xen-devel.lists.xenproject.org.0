Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6BB93AC57
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 07:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763736.1174040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUpW-0004X3-CL; Wed, 24 Jul 2024 05:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763736.1174040; Wed, 24 Jul 2024 05:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUpW-0004VV-8b; Wed, 24 Jul 2024 05:46:26 +0000
Received: by outflank-mailman (input) for mailman id 763736;
 Wed, 24 Jul 2024 05:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWUpV-0004VK-Fi
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 05:46:25 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f94e859-4980-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 07:46:23 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so5474013e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 22:46:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c95200fsm606102766b.225.2024.07.23.22.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 22:46:22 -0700 (PDT)
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
X-Inumbo-ID: 0f94e859-4980-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721799983; x=1722404783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uqi+O8ia6HnD8cwY0vwlxSC4t2rKFpfwYtQayEFo7Gc=;
        b=eWdrYhCcTtG6JZL0Yc4K8gBP8xMqA94uE+EYfzUarhIbGy6lnXHmWdscGR8eyFPkeX
         M64NsZc9uJplbMb0jJbkfLLnbSWB7OGtk5LQuDjmtXoTtve/dGAfyZMME2NHpFyxboZC
         5PUBayUlTKFtIBnc95Rfjks5ForxL2sAVIep08StBqLaKa5jSAfhFrijixVSaaGm7imk
         YhHLp/T6oKaXmbhF1Zs9phZJYBwZNL6XQ0o/qKjwpHxUSt3o2fLhxq78P1lJ281+eoRl
         9vzKRUg9nvxr0hF7/V+8uBW9PN6mzxFifndKFzrcT8WjpU4TAPvmaLkh5HFsZawIge8B
         AtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721799983; x=1722404783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqi+O8ia6HnD8cwY0vwlxSC4t2rKFpfwYtQayEFo7Gc=;
        b=CfCXe5ZhOlvhfGRXORcFKHvWco3na0xiCY4i4qykmIR8DOzOBqn0UX0wtdnXKBNZI5
         lTf/d25CRaX/GC5/LaCeTRuDK12vfJ6+N/Me2EekqpP+kYTrrCxStc157vsBr92dhI/h
         J0eYheorxsc5ngIQSEZthkf12621vHI7lwvE8mEqhugdaA3X4CwQiwoK0GoK4H29X1vz
         wkz9SpShRic7sTQ5RokePjj+RoPdhbaRJl1SSUCr4IJyD6gAlHX/XI7UKBE5qv0aZm/+
         0voUEKEEbAjkrnhaxxdSEUh9fgUGos/LJWSaF+8CKCQpWbY0T0vibyCSgdyMKAnFXUrR
         fUaw==
X-Forwarded-Encrypted: i=1; AJvYcCX/N72n2dNSdAjL5w5yueFaL6v8ICyitbzFFr0/MLbiTZ1Gfr34zWul+dJYAapJfb6yBo7J+0OmUeGJywQntRrlxwCuZCaCuNt0X8eVpII=
X-Gm-Message-State: AOJu0YzqhNgp4GrbyfN89kriJo3ifuGLLfieBIOeN9K7jbWXvMbt9Fk/
	LprXTTliMiFAoct9/CyPKcafKKKYgiAapn2puXwQplWykD9GDY3EyFklgcZ/Mg==
X-Google-Smtp-Source: AGHT+IEsdyfVNr3IMtt8OgcWmAfer+A7qFPcbIPlUP3Z8nYFwNeBd0sr2Qg/Nzsor3/86qPfURFN6A==
X-Received: by 2002:a05:6512:3c87:b0:52c:df8c:72cc with SMTP id 2adb3069b0e04-52fcda64051mr1014491e87.43.1721799983183;
        Tue, 23 Jul 2024 22:46:23 -0700 (PDT)
Message-ID: <6be25cb3-2481-4832-9a05-6f58468b8cc0@suse.com>
Date: Wed, 24 Jul 2024 07:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 16/17] CODING_STYLE: Add a section on header guards
 naming conventions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <14a663eaab02a78e688e1d260e1a4eb1799b13c5.1721720583.git.alessandro.zucchelli@bugseng.com>
 <9ceeedb1-31c6-4701-849c-e4f32fc07409@suse.com>
 <alpine.DEB.2.22.394.2407231539570.4857@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2407231539570.4857@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 00:40, Stefano Stabellini wrote:
> On Tue, 23 Jul 2024, Jan Beulich wrote:
>> On 23.07.2024 10:15, Alessandro Zucchelli wrote:
>>> This section explains which format should be followed by header
>>> inclusion guards via a drop-down list of rules.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>
>> As indicated in reply to v4, this wants (imo needs) to move to the very start
>> of the series. No changes following the new scheme should be made without the
>> new scheme actually having been committed.
>>
>>> --- a/CODING_STYLE
>>> +++ b/CODING_STYLE
>>> @@ -159,6 +159,27 @@ Emacs local variables
>>>  A comment block containing local variables for emacs is permitted at
>>>  the end of files.  It should be:
>>>  
>>> +Header inclusion guards
>>> +-----------------------
>>> +
>>> +Unless differently specified all header files should have proper inclusion
>>> +guards in order to avoid being included multiple times.
>>> +The following naming conventions have been devised:
>>> +
>>> +- private headers -> <dir>__<filename>_H
>>> +    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>>> +    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
>>> +    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
>>> +
>>> +- asm-generic headers -> ASM_GENERIC__<filename>_H
>>> +    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
>>> +
>>> +- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM__<architecture>__<subdir>__<filename>_H
>>> +    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
>>> +
>>> +- include/xen -> XEN__<filename>_H
>>> +    - include/xen/something.h -> XEN__SOMETHING_H
>>
>> While I think this expresses what we have settled on, it lack details. For
>> example, when to use single vs double underscores is left for the reader
>> to derive from the examples, which leaves room for interpretation.
> 
> I think so too. Here is my improved version, what do you think:
> 
> 
> Header inclusion guards
> -----------------------
> 
> Unless otherwise specified, all header files should include proper
> guards to prevent multiple inclusions. The following naming conventions
> apply:
> 
> - Private headers: <dir>__<filename>_H
>     - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>     - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
>     - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> 
> - asm-generic headers: ASM_GENERIC__<filename>_H
>     - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> 
> - arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
>     - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
> 
> - Xen headers: XEN__<filename>_H
>     - include/xen/something.h -> XEN__SOMETHING_H
> 
> Notes:
> 
> - Filenames and directories are converted to uppercase.
> - Dashes are converted to underscores.

s/Dashes/Non-alphanumeric characters/

Jan

> - Directories, subdirectories, and filenames are separated by double
>   underscores.
> 


