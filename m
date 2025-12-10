Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1756BCB230A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 08:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182572.1505435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEdW-0008AR-0p; Wed, 10 Dec 2025 07:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182572.1505435; Wed, 10 Dec 2025 07:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEdV-00087f-U7; Wed, 10 Dec 2025 07:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1182572;
 Wed, 10 Dec 2025 07:29:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTEdU-00087Z-WD
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 07:29:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f02cb462-d599-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 08:29:18 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42f8e39cf89so1614524f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 23:29:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331e29sm36415536f8f.32.2025.12.09.23.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:29:16 -0800 (PST)
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
X-Inumbo-ID: f02cb462-d599-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765351758; x=1765956558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lD07c0OC9sYKszaHOZBojBM13XCMNA8tdAdO+/v5kjI=;
        b=BTKFuEF4xtrAFFZzT2PhvQuTuN3a41AXZE0sNLG1+DpJfMlyn7gvOZ3m1lOGiFNf7j
         ZWu6FZOxsgsk0YPxZe+EbdpeHf2POrGz7n7vkKnREd/bumm3Exg2b+ca9PnxKjY+Kvb/
         9ai3NtQobIJRkQh770D41ASulnsj8n3qWw6oKaMrHYIEb+qTWlJr5iYzh4LoIOEXc+l3
         QHtogb44YNPwldx0CdExZyFUcjaNHvOSU/s6r+z0X1QVD0AtvZHKFOLglmE+rPlk2Zof
         vH1uopJ5c2c6/f/HO2FcSTvvihwcBgmq8qyfaMj3ePyoGzrOGEWmfsfaN07ZgTYWAf9r
         WeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765351758; x=1765956558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD07c0OC9sYKszaHOZBojBM13XCMNA8tdAdO+/v5kjI=;
        b=UQY8mJDd8+xADV7uvkmyeaZPCP4KSbahGnr0alZl7GEQCt/k9Yo2Ju2GMtdeQnrGXP
         cWo+kRjkzCRp5lFcuqlvizYZ+bCciQwrmwLqkKeeBXZMT+q+ntoiYPmj0zynV16cWBpH
         x7iclHqtw50QIRMt7cnOJ/Llr/e0LalFe65HBs0rdM1oQETSqNJ9B/PWS36Fjc0b0JHU
         9zNFcNEemA7kGLNr9WfB/B/K8sb+SjJ2Kypmh7JyCzgaQ8Cf/lYocAMb6HsN7AF5uWbf
         OxOLccyj2idybiANe0nYeijv8dNaagzIVKw/HCHJjmPH8MkJXQibpeUibmNLZuFbhoIG
         jNXw==
X-Forwarded-Encrypted: i=1; AJvYcCWxikAGMQ0aI/XV1wIsVgrDXM5Kg0Wi01mGzikC0FXZmsmf60cwEB99kUmWC1rlLei/k5TFHsLoMXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSkpffiCedspTqnIfKkEO/zM5vp4XMbpy4ART302aqqBWZsQA3
	c6F1B/M6a4EkoMn7Uwwg6RVfg2VHj4yQJ5my4mtlCr3TPDjumlMR505gandP4vw2rA==
X-Gm-Gg: AY/fxX6RKt16m7xJDpYlySXlY7KQoUD0LaBUWDD2//wexzKk23AEAmoRBBpLMDm5yV9
	UPYnbq5ue/cdMQdlzQlV5di79O7b2vq+dY8wEV0nX6qT6pk8gDzsKOu1OuU6BVEC8pn6KRq+wAf
	tp8Jgtw/dT6kjcVOAGciEg7882pMo4MxJMELgmfN0ixBYMuCLXqq1p6JIU1dut7FjvOKlOXD858
	SOqNkpdTu+DLADCER7UC5O6YhjenULofbAw0S1PxshlBWwrQNwCGdBRdhqgzfA8lWqGJpstQEde
	IYbJ1TZtqZeGIQAvej+Ts85rYKBpZcAEiW+u4zQZ9VsyYa6Y4VXp9Lcqke+wUROplI/AhKt9WAo
	oSNBK5ZaOfWQDWrSyGWy3ladbYCCqMLKuXFOsMOugtY7+lFg/0vIz/oANJH6j8HHcJ/L7ulCOoo
	z3C87ilhgDU3HjH1ioyfFUXIAzfvsKuFaVVlDEhqKNRuoBNGmFDrOZTlZioRyxvmx0WsXpVoGS/
	bA=
X-Google-Smtp-Source: AGHT+IEZ7Xy15m6ggLaFp3uSqlvwb8DPK/i+rzX+1i3f8YyiMRxGdlbIkg6KABDrNooWCWnArlRLeA==
X-Received: by 2002:a05:6000:1ac8:b0:429:8b01:c08d with SMTP id ffacd0b85a97d-42fa3afd8e5mr1222604f8f.41.1765351757851;
        Tue, 09 Dec 2025 23:29:17 -0800 (PST)
Message-ID: <fa1600f4-eff3-43cf-a96c-7c23890d1d99@suse.com>
Date: Wed, 10 Dec 2025 08:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] misra: consider conversion from UL or (void*) to
 function pointer as safe
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <daa126218e11484c72f3de4b39186b6d9afd26c6.1761589314.git.dmytro_prokopchuk1@epam.com>
 <73ab67f9-d24f-42c8-a383-4c9db5de5bd4@suse.com>
 <alpine.DEB.2.22.394.2512091656400.19429@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2512091656400.19429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2025 01:57, Stefano Stabellini wrote:
> On Tue, 28 Oct 2025, Jan Beulich wrote:
>> On 27.10.2025 19:51, Dmytro Prokopchuk1 wrote:
>>> Rule 11.1 states as following: "Conversions shall not be performed
>>> between a pointer to a function and any other type."
>>>
>>> This deviation from Rule 11.1 relies on both ABI definitions and compiler
>>> implementations supported by Xen. The System V x86_64 ABI and the AArch64
>>> ELF ABI define consistent and compatible representations (i.e., having
>>> the same size and memory layout) for (void *), unsigned long, and function
>>> pointers, enabling safe conversions between these types without data loss
>>> or corruption. Additionally, GCC and Clang, faithfully implement the ABI
>>> specifications, ensuring that the generated machine code conforms to these
>>> guarantees. Developers must note that this behavior is not universal and
>>> depends on platform-specific ABIs and compiler implementations.
>>>
>>> Configure Eclair to avoid reporting violations for conversions from
>>> unsigned long or (void *) to a function pointer.
>>>
>>> Add a compile-time assertion into the file 'xen/common/version.c' to
>>> confirm this conversion compatibility across X86 and ARM platforms
>>> (assuming this file is common for them).
>>>
>>> References:
>>> - System V x86_64 ABI: https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build
>>> - AArch64 ELF ABI: https://github.com/ARM-software/abi-aa/releases
>>> - GCC: https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
>>> - Clang: https://clang.llvm.org/docs/CrossCompilation.html
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Changes in v4:
>>> - the build assertions for the X86 and ARM are enabled by default (unconditionally)
>>> - re-wrote description for the build_assertions() function
>>> - excluded PowerPC architecture (not in scope of certification) from the check and wrote apropriate explanation
>>>
>>> Link to v3:
>>> https://patchew.org/Xen/0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro._5Fprokopchuk1@epam.com/
>>> ---
>>>  .../eclair_analysis/ECLAIR/deviations.ecl     |  8 ++++++
>>>  docs/misra/deviations.rst                     |  8 +++++-
>>>  docs/misra/rules.rst                          |  7 +++++-
>>>  xen/common/version.c                          | 25 +++++++++++++++++++
>>>  4 files changed, 46 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 7f3fd35a33..219ba6993b 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -375,6 +375,14 @@ constant expressions are required.\""
>>>  }
>>>  -doc_end
>>>  
>>> +-doc_begin="Conversion from unsigned long or (void *) to a function pointer can restore full information, provided that the source type has enough bits to restore it."
>>> +-config=MC3A2.R11.1,casts+={safe,
>>> +  "from(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
>>> +   &&to(type(canonical(__function_pointer_types)))
>>> +   &&relation(definitely_preserves_value)"
>>> +}
>>> +-doc_end
>>> +
>>>  -doc_begin="The conversion from a function pointer to a boolean has a well-known semantics that do not lead to unexpected behaviour."
>>>  -config=MC3A2.R11.1,casts+={safe,
>>>    "from(type(canonical(__function_pointer_types)))
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index 3271317206..b3431ef24e 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -366,11 +366,17 @@ Deviations related to MISRA C:2012 Rules:
>>>       - Tagged as `safe` for ECLAIR.
>>>  
>>>     * - R11.1
>>> -     - The conversion from a function pointer to unsigned long or (void \*) does
>>> +     - The conversion from a function pointer to unsigned long or '(void *)' does
>>>         not lose any information, provided that the target type has enough bits
>>>         to store it.
>>>       - Tagged as `safe` for ECLAIR.
>>>  
>>> +   * - R11.1
>>> +     - Conversion from unsigned long or '(void *)' to a function pointer can
>>> +       restore full information, provided that the source type has enough bits
>>> +       to restore it.
>>> +     - Tagged as `safe` for ECLAIR.
>>> +
>>>     * - R11.1
>>>       - The conversion from a function pointer to a boolean has a well-known
>>>         semantics that do not lead to unexpected behaviour.
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index 4388010ec9..4e94251887 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -431,7 +431,12 @@ maintainers if you want to suggest a change.
>>>       - All conversions to integer types are permitted if the destination
>>>         type has enough bits to hold the entire value. Conversions to bool
>>>         and void* are permitted. Conversions from 'void noreturn (*)(...)'
>>> -       to 'void (*)(...)' are permitted.
>>> +       to 'void (*)(...)' are permitted. Conversions from unsigned long or
>>> +       '(void *)' to a function pointer are permitted.
>>> +       Example::
>>> +
>>> +           unsigned long func_addr = (unsigned long)&some_function;
>>> +           void (*restored_func)(void) = (void (*)(void))func_addr;
>>>  
>>>     * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_02.c>`_
>>>       - Required
>>> diff --git a/xen/common/version.c b/xen/common/version.c
>>> index 553b97ba9b..674bd72b31 100644
>>> --- a/xen/common/version.c
>>> +++ b/xen/common/version.c
>>> @@ -217,6 +217,31 @@ void __init xen_build_init(void)
>>>  #endif /* CONFIG_X86 */
>>>  }
>>>  #endif /* BUILD_ID */
>>> +
>>> +/*
>>> + * This assertion checks compatibility between 'unsigned long', 'void *',
>>> + * and function pointers. This is true for most supported architectures,
>>> + * including X86 (x86_64) and ARM (arm, aarch64).
>>> + *
>>> + * For more context on architecture-specific preprocessor guards, see
>>> + * docs/misc/C-language-toolchain.rst.
>>> + *
>>> + * If porting Xen to a new architecture where this compatibility does not hold,
>>> + * exclude that architecture from these checks and provide suitable commentary
>>> + * and/or alternative checks as appropriate.
>>> + */
>>> +static void __init __maybe_unused build_assertions(void)
>>> +{
>>> +    /*
>>> +     * Exclude architectures where function pointers are larger than data pointers:
>>> +     * - PowerPC: uses function descriptors (code address + TOC pointer).
>>> +     */
>>
>> Yes, it uses function descriptors (aiui they consist of three longs, not just
>> two though), but "function pointers are larger than data pointers" is still
>> wrong there, which is why (as you indicated before) ...
>>
>>> +#if !defined(__powerpc__)
>>> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>>> +#endif
>>
>> ... these checks still will not cause build breakage even if enabled for PPC.
>> At least aiui (what is being passed around are pointers to function
>> descriptors). IOW I don't view it as justified to exclude PPC here, at least
>> not yet.
> 
> Could the patch be committed without the #if !defined(__powerpc__) /
> #endif chunk considering that according to Dmytro it should pass the
> pipeline anyway?

And with the comment also dropped (or adjusted accordingly).

Jan

