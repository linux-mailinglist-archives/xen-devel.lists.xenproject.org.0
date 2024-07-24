Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9F293B0F4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 14:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764163.1174500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbC9-00089Q-7F; Wed, 24 Jul 2024 12:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764163.1174500; Wed, 24 Jul 2024 12:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbC9-00087h-4g; Wed, 24 Jul 2024 12:34:13 +0000
Received: by outflank-mailman (input) for mailman id 764163;
 Wed, 24 Jul 2024 12:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWbC7-00087T-K0
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 12:34:11 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 010c5baf-49b9-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 14:34:00 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso61775851fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 05:34:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a93c70c41sm182914966b.42.2024.07.24.05.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 05:33:59 -0700 (PDT)
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
X-Inumbo-ID: 010c5baf-49b9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721824440; x=1722429240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rcRhokmq6WLZcBPydD/CHjgEbRheWu7fj0qXLc38ehQ=;
        b=Nxw78ZPrVye+22lKMw716X9HWQeLEm1BX7Nfm/3qvdQi+KHU+Wh+YR5OoBALvnbhRh
         Z3DYlSR7Hc22xNJJtK1umQ4v32CzwBJsmvKhXt8Q/LVmt4UyGRNl+q0+jul1lSeZgdxL
         7pROKkAcgKwt+7qrHgKqZvX+h8dC13XxmprOmZ/p+IGvWRAE/MGEZNFMu7ZEDDLvlQrP
         UmKExUWruIbTtOdYaGeKiq6glhtSFj6+XZ1FP3ypTr0V9f+RBpU5/G3+rrJTupMozhvy
         Igx7ih3aomRVnOIlXpSB9yEmicorjGjG1UiJRngzz1gjO+JC9ieyEbadI3DzzGV/+mMb
         xjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721824440; x=1722429240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcRhokmq6WLZcBPydD/CHjgEbRheWu7fj0qXLc38ehQ=;
        b=LZUUBXDhGBGlbGkWTKg98z5JpQtdlVW5tLYa8u0XPkBHa6eI5GqN+HT5gdyL9pPKKh
         G02glvrM015S4z2QF4SUv52XxsEBvQjZZ6B0Bj8NSfcdYpiM92atRzxbuSyUWLEc6KaR
         qWynDGDAeGIhwURsT9d5MmB63L+yIaj7ltblGdtS2q0FIkRg514xBu2sY7A0ssZU5jQJ
         0Rd7OIFtzVC1IyyiYDMBu6AYiJqCwakrITr57RcYYX3wgHrJzgODgvDEsgyZcVkY3CbE
         F8BQSOEGZrt4ISThIHWt1PSXFspo8GcFxMb5QECHllID5FQOH6wc95zNNEY9WwdEzwgc
         uIdw==
X-Forwarded-Encrypted: i=1; AJvYcCX7TzCsZd4j5B4sNY5nhNLz3l+0UOs2pQJ1tkFCKvNuu1V37ess+OfU9YaGqzyZoemEtLyGUkBogutxwkuTFhQz8+WVrK8qCoDpgKNyZrs=
X-Gm-Message-State: AOJu0YwJeZuTe5II7cYF6t9t+cRKOT655EhTP0dlYUcC83v21rKGOSxX
	rUTnWl9w0VCEqqoxSeSa4LHsffFCC83b3Ail7ndRXiZ1W7SvbiqzpKhBbU5KcQ==
X-Google-Smtp-Source: AGHT+IEe5tIr88dhau/hp4cGFqNgorG6PCh03Lq9DqUi+0W2/aGRl4vPRYopnY0bg6Mbii/nfQvMHw==
X-Received: by 2002:a05:651c:2211:b0:2ef:2490:46f1 with SMTP id 38308e7fff4ca-2f02b741d17mr30664261fa.23.1721824440079;
        Wed, 24 Jul 2024 05:34:00 -0700 (PDT)
Message-ID: <7641ef1d-b6b0-409d-8169-6e0c43a0227f@suse.com>
Date: Wed, 24 Jul 2024 14:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/printk: Avoid the use of L as a length modifier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723174129.67911-1-andrew.cooper3@citrix.com>
 <f88005d5-8c1f-4060-b3b4-7f88d8c42725@suse.com>
 <7125fef0-fe2c-4c6d-bfc8-fdb4dc126905@citrix.com>
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
In-Reply-To: <7125fef0-fe2c-4c6d-bfc8-fdb4dc126905@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2024 12:30, Andrew Cooper wrote:
> On 24/07/2024 8:34 am, Jan Beulich wrote:
>> On 23.07.2024 19:41, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/mcheck/vmce.c
>>> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
>>> @@ -71,7 +71,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
>>>      if ( ctxt->caps & ~guest_mcg_cap & ~MCG_CAP_COUNT & ~MCG_CTL_P )
>>>      {
>>>          printk(XENLOG_G_ERR
>>> -               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#Lx)\n",
>>> +               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#llx)\n",
>>>                  is_hvm_vcpu(v) ? "HVM" : "PV", ctxt->caps,
>>>                  v, guest_mcg_cap & ~MCG_CAP_COUNT);
>> guest_mcg_cap is unsigned long and MCG_CAP_COUNT could as well use UL instead
>> of ULL, couldn't it?
> 
> Well, like ...
> 
>>
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -517,7 +517,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>          if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) >
>>>               PAGE_SIZE )
>>>          {
>>> -            printk("VMX: CPU%d VMCS size is too big (%Lu bytes)\n",
>>> +            printk("VMX: CPU%d VMCS size is too big (%llu bytes)\n",
>>>                     smp_processor_id(),
>>>                     vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
>>>              return -EINVAL;
>>> @@ -564,7 +564,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>          if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) !=
>>>               ((vmx_basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
>>>          {
>>> -            printk("VMX: CPU%d unexpected VMCS size %Lu\n",
>>> +            printk("VMX: CPU%d unexpected VMCS size %llu\n",
>>>                     smp_processor_id(),
>>>                     vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
>>>              mismatch = 1;
>> Same here for VMX_BASIC_VMCS_SIZE_MASK. We leverage not doing 32-bit builds
>> anymore in exactly this way elsewhere.
> 
> ... this, it is about 32bit builds.

I don't think this is relevant for the VMCS constants?

> For better or worse, the msr-index cleanup says to use ULL, and this was
> so it could be shared into 32bit codebases.  (In this case, I was
> thinking HVMLoader and misc bits of userspace.)

Hmm, yes. Let me mention though that right when starting that cleanup, you
introduced two outliers - MSR_CTC_{THREAD,CORE}_MASK. The latter was later
changed to have a U suffix, in part due to both Stefano and me not paying
enough attention when reviewing. So while I can see the goal, I'm wondering
whether we shouldn't take the abstraction there yet a step further and
arrange for UL suffixes in 64-bit builds, but for ULL in 32-bit ones:

#ifdef __i386__
# define _MC(x) _AC(x, ULL)
#else
# define _MC(x) _AC(x, UL)
#endif

Thoughts?

Jan

