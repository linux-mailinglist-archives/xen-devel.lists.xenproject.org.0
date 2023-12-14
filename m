Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471E813249
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 14:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654598.1021673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmDE-0005z4-Gm; Thu, 14 Dec 2023 13:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654598.1021673; Thu, 14 Dec 2023 13:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmDE-0005wE-DR; Thu, 14 Dec 2023 13:57:16 +0000
Received: by outflank-mailman (input) for mailman id 654598;
 Thu, 14 Dec 2023 13:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDmDD-0005w8-BD
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 13:57:15 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeafb309-9a88-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 14:57:13 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so9529689e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 05:57:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qo5-20020a170907874500b00a1b7b0cc30dsm9362695ejc.7.2023.12.14.05.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 05:57:12 -0800 (PST)
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
X-Inumbo-ID: aeafb309-9a88-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702562233; x=1703167033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPjvs+p+NxwNmbmCR28jMCoUyiLyV+8ltmkkMpNliIY=;
        b=Vux6JoQLrWn59z0j2BIHWWTHg+MyndEtaSrR3ddI8nq2MrHX7aGlWYfV3jr1eURL7f
         lSC+rTrSRh6bz6oCf2Qoui8wc0C4GMiFs6+Yd3Ih83ZBlaNqrYZKfvk7krEpbNDGzuf1
         83Ray++3zeYreoKF1xnF4h7tpGN8cmZOpDR9dTFQ3xNu9acbg/gQLKZcJtuKKMujSnkc
         Ury5o8CSIm/NTpziJRhYKBfvz/ys/4RU4FEkAwVXBjNiiWG3PuBTeXPb0BcdEEsmpaoA
         XPMaeSjFsNPiHf0l3yoUeRhtCgsG20w37/cs9UCyAvRBXyhknscyLzwJIvTd4C6QW8g1
         S+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702562233; x=1703167033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPjvs+p+NxwNmbmCR28jMCoUyiLyV+8ltmkkMpNliIY=;
        b=l/XfRctIkSXHl8aWvTG7mR6CRDRIRtgAPkITjiy+tOLoijgiaTWsBGFE9fg/RgTMiP
         SC7ZjD3h4EfdPb6l1jKCQj2ChiRoi663NzAmVxXiQ9AZY27GVQcME+Hv7OynfWVjE9yr
         1ya/rXgxv104HKs/QOdomSVftOq4Y7dzb+4Vcklx5EC0jTGAnBn4CI0Elvkdp1VmCxIK
         C2Z1EHS6zhRqiJVwijgYpKiwM5xQCm346tChRgShZztjp03CD/XtyWhuGV1l5UD0T1fz
         bAuAOmUtwdq6G+iG1NNXuOW2dBvD3f9YnEnheCryRAk7YorX2wpqWb1W1hN7bk+BeEQI
         ZpkQ==
X-Gm-Message-State: AOJu0YzSDxNooMreIgFMjJ8W5IvYaURzrq6UOcIsv2BYKzu6EVxlvy/L
	gfUamX7xD42gcxxq13gWMB5b
X-Google-Smtp-Source: AGHT+IGBX0hFSWg202PtKVPL960itMZCQpKPgT1YqHZSy2xWsxSkdfCVg/IfjEdlq09IfRSkWo67FA==
X-Received: by 2002:a05:6512:3a88:b0:50b:fa69:16be with SMTP id q8-20020a0565123a8800b0050bfa6916bemr5289581lfu.15.1702562232735;
        Thu, 14 Dec 2023 05:57:12 -0800 (PST)
Message-ID: <31cb367f-1a20-4ced-8f6f-aeab69f7c4fb@suse.com>
Date: Thu, 14 Dec 2023 14:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/x86: introduce self modifying code test
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-3-roger.pau@citrix.com>
 <6226aa5e-c87f-48bf-b793-96aa04498c5e@suse.com> <ZXsHWzcCSBKRS83S@macbook>
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
In-Reply-To: <ZXsHWzcCSBKRS83S@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.12.2023 14:47, Roger Pau Monné wrote:
> On Thu, Dec 14, 2023 at 12:55:22PM +0100, Jan Beulich wrote:
>> On 14.12.2023 11:17, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -58,6 +58,7 @@
>>>  #include <asm/microcode.h>
>>>  #include <asm/prot-key.h>
>>>  #include <asm/pv/domain.h>
>>> +#include <asm/test-smoc.h>
>>>  
>>>  /* opt_nosmp: If true, secondary processors are ignored. */
>>>  static bool __initdata opt_nosmp;
>>> @@ -1951,6 +1952,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>  
>>>      alternative_branches();
>>>  
>>> +    test_smoc(XEN_SYSCTL_TEST_SMOC_ALL, NULL);
>>
>> I realize I'm at risk of causing scope creep, but I'd still like to at
>> least ask: As further self-tests are added, we likely don't want to
>> alter __start_xen() every time. Should there perhaps better be a wrapper
>> (going forward: multiple ones, depending on the time tests want invoking),
>> together with a Kconfig control to allow suppressing all of these tests in
>> at least release builds?
> 
> Right now I only had in mind that livepatch related tests won't be
> executed as part of the call in __start_xen(), but all the other ones
> would, and hence wasn't expecting the code to change from the form in
> the next patch.

Well, I was thinking of there more stuff appearing in test/, not self-
modifying-code related, and hence needing further test_*() alongside.
test_smoc().

>>> --- /dev/null
>>> +++ b/xen/arch/x86/test/smoc.c
>>> @@ -0,0 +1,68 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +
>>> +#include <xen/errno.h>
>>> +
>>> +#include <asm/alternative.h>
>>> +#include <asm/cpufeature.h>
>>> +#include <asm/test-smoc.h>
>>> +
>>> +static bool cf_check test_insn_replacement(void)
>>> +{
>>> +#define EXPECTED_VALUE 2
>>> +    unsigned int r = ~EXPECTED_VALUE;
>>> +
>>> +    alternative_io("", "mov %1, %0", X86_FEATURE_ALWAYS,
>>> +                   "+r" (r), "i" (EXPECTED_VALUE));
>>> +
>>> +    return r == EXPECTED_VALUE;
>>> +#undef EXPECTED_VALUE
>>> +}
>>> +
>>> +int test_smoc(uint32_t selection, uint32_t *results)
>>> +{
>>> +    struct {
>>> +        unsigned int mask;
>>> +        bool (*test)(void);
>>> +        const char *name;
>>> +    } static const tests[] = {
>>> +        { XEN_SYSCTL_TEST_SMOC_INSN_REPL, &test_insn_replacement,
>>> +          "alternative instruction replacement" },
>>> +    };
>>> +    unsigned int i;
>>> +
>>> +    if ( selection & ~XEN_SYSCTL_TEST_SMOC_ALL )
>>> +        return -EINVAL;
>>> +
>>> +    if ( results )
>>> +        *results = 0;
>>> +
>>> +    printk(XENLOG_INFO "Checking Self Modify Code\n");
>>> +
>>> +    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
>>> +    {
>>> +        if ( !(selection & tests[i].mask) )
>>> +            continue;
>>> +
>>> +        if ( tests[i].test() )
>>> +        {
>>> +            if ( results )
>>> +                *results |= tests[i].mask;
>>> +            continue;
>>> +        }
>>> +
>>> +        add_taint(TAINT_ERROR_SMOC);
>>> +        printk(XENLOG_ERR "%s test failed\n", tests[i].name);
>>
>> Do we really want both of these even when coming here from the sysctl?
> 
> So only print the messages if system_state < SYS_STATE_active?

Yes. Nor tainting the system.

>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -386,13 +386,14 @@ char *print_tainted(char *str)
>>>  {
>>>      if ( tainted )
>>>      {
>>> -        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
>>> +        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c%c",
>>>                   tainted & TAINT_MACHINE_INSECURE ? 'I' : ' ',
>>>                   tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
>>>                   tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
>>>                   tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
>>>                   tainted & TAINT_HVM_FEP ? 'H' : ' ',
>>> -                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ');
>>> +                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ',
>>> +                 tainted & TAINT_ERROR_SMOC ? 'A' : ' ');
>>
>> How well is this going to scale as other selftests are added? IOW should
>> this taint really be self-modifying-code-specific?
> 
> I'm afraid I'm not sure I'm following.  Would you instead like to make
> the taint per-test selectable?

The other way around actually: Taint generally for failed selftests,
not just for the self-modifying-code one (which ends up being the only
one right now).

Jan

