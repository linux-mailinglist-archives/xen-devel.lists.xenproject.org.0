Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02F917ACA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748479.1156198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNtg-0002Ks-Pd; Wed, 26 Jun 2024 08:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748479.1156198; Wed, 26 Jun 2024 08:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNtg-0002I3-MR; Wed, 26 Jun 2024 08:20:56 +0000
Received: by outflank-mailman (input) for mailman id 748479;
 Wed, 26 Jun 2024 08:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMNtf-0002Hx-Ie
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:20:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 019ecb94-3395-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 10:20:54 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so176527f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 01:20:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f0300sm94274645ad.19.2024.06.26.01.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:20:53 -0700 (PDT)
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
X-Inumbo-ID: 019ecb94-3395-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719390054; x=1719994854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EoPPE5nCB6AeZblT4Jgz7cpKnwiTrDzJleH+NBPtUac=;
        b=M96rt1pefFUBhqLWG+ju+PlimxC3FzQR58hwJa79o0eFvOpuACWN3YiZvyApKPXs6K
         s4lV/Few9rWKGsuUcC5PM+OgMo5/iirXip9wIBsMz/4s9QGdjbfetFV2rIWSs6LZPWVI
         PjT8L3g8BCLTDYZkMX8ZfAlEWnjIFx2UdrJKlzqh5bEtflB7ehjSEMrvxXqtfSzGkcWw
         Z1nM+aYQ4c0dgQPUPE2N4+xBDSjO6bA85qE09bQT3OgHeQYDoaZMiTN1YAAhl0C7q96n
         gCPimPl/QMEBsqGztG9EIpnIwacZGGogZUwKSpQAy+DHyfuFDzj+f/2SOWie3ppBNXTB
         jx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719390054; x=1719994854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoPPE5nCB6AeZblT4Jgz7cpKnwiTrDzJleH+NBPtUac=;
        b=jQsph3rC7PVK9uL/FLMKR3fo61Ch+L8dm1K+bUIyjY1p+7IvufFoBVlpUARdIyAnmF
         7rQhETPVwjhSNJrU826uWM8Mxak2VfstueC1khHzqe9TwP+oNGcohps7N8+dnSQHJXUK
         nt9+N3W4PURjcUFnQWl6tP7uDD+BWCfDfdl0UXcaA8jcIUnTNSHGVcXgbZ/hzNFKFI5v
         BaLjsZ0junXcOpNtIY786sr4MklK2o6RbBE9VAQNMvTydXYsJkLdJrw/ddJ3lzyDZL8i
         V1yMWC84sETMxLYUNMOBUN2ipwpBgvH9FM8aBEZFUASM3OUepGGpbYIx04IE9xV8UJ6Z
         p5hA==
X-Forwarded-Encrypted: i=1; AJvYcCW/uK8bjrY6kQgphev7/ZkVn1Y9VU0pK9q4AgBN3xVFsVWfkra9TwM6Bypb7rDyt1Dgs0S80NRtt58cmIC3G8wwDttYOyh4ef+HAOdWHlc=
X-Gm-Message-State: AOJu0YzPwwLFtWYIuJMI94xWnhKps73HYziqabhHZj5C63txvh8TU5pT
	ZhZ7IowWocdeesNa4r0WoF9XG5hup+Y2og31IR7phEVI0vMWOkoJkTTNiyXPyQ==
X-Google-Smtp-Source: AGHT+IFjCen5At9qmYkefzL45PlLM1Wq/op1nRurE4h+uPEE0X+tPA1A/GgslGeXptFuXfpMP4geqA==
X-Received: by 2002:a5d:690e:0:b0:365:aec0:e191 with SMTP id ffacd0b85a97d-366e32956e7mr8572740f8f.21.1719390053770;
        Wed, 26 Jun 2024 01:20:53 -0700 (PDT)
Message-ID: <25371d03-1c33-41dd-9cdb-12d74fe38d42@suse.com>
Date: Wed, 26 Jun 2024 10:20:44 +0200
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
> 
>>
>>> --- a/xen/arch/x86/cpu/cpu.h
>>> +++ b/xen/arch/x86/cpu/cpu.h
>>> @@ -1,3 +1,6 @@
>>> +#ifndef XEN_ARCH_X86_CPU_CPU_H
>>> +#define XEN_ARCH_X86_CPU_CPU_H
>>> +
>>>  /* attempt to consolidate cpu attributes */
>>>  struct cpu_dev {
>>>  	void		(*c_early_init)(struct cpuinfo_x86 *c);
>>> @@ -24,3 +27,5 @@ void amd_init_lfence(struct cpuinfo_x86 *c);
>>>  void amd_init_ssbd(const struct cpuinfo_x86 *c);
>>>  void amd_init_spectral_chicken(void);
>>>  void detect_zen2_null_seg_behaviour(void);
>>> +
>>> +#endif /* XEN_ARCH_X86_CPU_CPU_H */
>>
>> Leaving aside the earlier voiced request to get rid of the XEN_ 
>> prefixes
>> here, ...
>>
>>> --- a/xen/arch/x86/x86_64/mmconfig.h
>>> +++ b/xen/arch/x86/x86_64/mmconfig.h
>>> @@ -5,6 +5,9 @@
>>>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>>>   */
>>>
>>> +#ifndef XEN_ARCH_X86_X86_64_MMCONFIG_H
>>> +#define XEN_ARCH_X86_X86_64_MMCONFIG_H
>>> +
>>>  #define PCI_DEVICE_ID_INTEL_E7520_MCH    0x3590
>>>  #define PCI_DEVICE_ID_INTEL_82945G_HB    0x2770
>>>
>>> @@ -72,3 +75,5 @@ int pci_mmcfg_reserved(uint64_t address, unsigned 
>>> int segment,
>>>  int pci_mmcfg_arch_init(void);
>>>  int pci_mmcfg_arch_enable(unsigned int idx);
>>>  void pci_mmcfg_arch_disable(unsigned int idx);
>>> +
>>> +#endif /* XEN_ARCH_X86_X86_64_MMCONFIG_H */
>>
>> ... in a case like this and maybe even ...
>>
>>> --- a/xen/arch/x86/x86_emulate/private.h
>>> +++ b/xen/arch/x86/x86_emulate/private.h
>>> @@ -6,6 +6,9 @@
>>>   * Copyright (c) 2005-2007 XenSource Inc.
>>>   */
>>>
>>> +#ifndef XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
>>> +#define XEN_ARCH_X86_X86_EMULATE_PRIVATE_H
>>> +
>>>  #ifdef __XEN__
>>>
>>>  # include <xen/bug.h>
>>> @@ -836,3 +839,5 @@ static inline int read_ulong(enum x86_segment seg,
>>>      *val = 0;
>>>      return ops->read(seg, offset, val, bytes, ctxt);
>>>  }
>>> +
>>> +#endif /* XEN_ARCH_X86_X86_EMULATE_PRIVATE_H */
>>
>> ... this I wonder whether they are too strictly sticking to the base
>> scheme (or whether the base scheme itself isn't flexible enough): I'm
>> not overly happy with the "_X86_X86_" in there. Especially in the
>> former case, where it's the sub-arch path, like for arm/arm<NN> I'd
>> like to see that folded to just "_X86_64_" here as well.
>>
> 
> I do agree we should make an exception here: e.g. 
> XEN_X86_64_EMULATE_PRIVATE_H
> 
> I'm ambivalent about the XEN_ prefix: I can't immediately see an issue 
> with dropping it, but on the other hand there are several headers that 
> already use it (either it or the __XEN prefix) as far as I can tell 
> (e.g. x86/cpu/cpu.h), so dropping it from the naming convention would 
> imply that a fair amount of additional churn may be needed to have an 
> uniform naming scheme in all the xen/ directory. I'll leave the decision 
> to the maintainers.

Hmm, I'm puzzled: The example you point at presently has no guard at all,
afaics. There'll need to be churn there anyway. If you picked an example,
I would have expected that to be one where the guard already fully
matches the proposed scheme. To be honest I'd be surprised if we had many
files fulfilling this criteria.

Jan

