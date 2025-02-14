Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488AA35E59
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 14:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888804.1298100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivPW-00054O-1Y; Fri, 14 Feb 2025 13:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888804.1298100; Fri, 14 Feb 2025 13:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivPV-00051G-Uc; Fri, 14 Feb 2025 13:07:13 +0000
Received: by outflank-mailman (input) for mailman id 888804;
 Fri, 14 Feb 2025 13:07:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tivPU-00050r-Go
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 13:07:12 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a3d729e-ead4-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 14:07:11 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5de6c708315so2999469a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 05:07:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2709ffsm2879555a12.60.2025.02.14.05.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 05:07:07 -0800 (PST)
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
X-Inumbo-ID: 9a3d729e-ead4-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739538431; x=1740143231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KQ3p+nKyZp7uYOOppwLUe8eun1T1q+BKzT1xSquUjWo=;
        b=RSQ/cG0LfXQVDOV6lj5W1R5/ZYkTa9L2eAIwCO3/8M0Av+Gk7NWmrC+5++2tcg1VBx
         4fG+W5bj+tKoM+sN8Gp3h+PeG28mDqR4Kk8otxDkIgpg3MBfpGKyyys/xhvXC+vHDUki
         0IG7O3tT290RhvBK87hc+wgWrbZ+2rGNrIF4bZj36kYK2LnHd5hXzRZGkFMhX26onibu
         14H8pm3MjRAaQ3NZ8eVd9gFqxG2paoVECFqT7p+b0eCdqNYiwzNxbUEfPRLZoWfNj51U
         uvpkMWEiBE2G+ocZCI1v2s0Z22kvwbZpXqXJosSAgTJOikohhgRErCy5q/ut4RrTrJDl
         mzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739538431; x=1740143231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQ3p+nKyZp7uYOOppwLUe8eun1T1q+BKzT1xSquUjWo=;
        b=gWpUbedH635i/DmCBWyxv5+wjliraJPtb5JWsONkX3Yu5uhN226MPmiwlmIOyMym6c
         3EC0qqJzr8v0on8z5vRJv35KrKgpGHN0ftySsaTx0zHcOHbgAcFT3oA9iZLvUp6ssruv
         Ao0jMtlm1cWymOgXrjFpQVnNOu85cLzJPSWrc76QQZvjlunc3+/JFzLavbYtWdzSxKxV
         qZqp9KzwcxH8F1xuyZY2wJ89PYHUktUG4BCsHktie7ZLWJit8He10Ftf8J2X9sWXiDDf
         LccHmVX5Fk6rffeo+iupIwVWnO+Q16aqjdHMn9ThBFI5sSa9VBtwr752mslZoRQTPokd
         GGXw==
X-Forwarded-Encrypted: i=1; AJvYcCWC2bhDT9jn70k7VdFeVXq2p64XhkJvwT2gmx41toQ1OVhoicu6COgo7x7Sj17kfwXzGNMDQvudyyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJRxcl8fatPXb9OcQKE7uRuKXH2j+jZ8ODPvi3Ik/vLJjOejLT
	GkcEJ+LSzzvg8t87DzGZ/e+xQ8ynLCjl7juXuh7WDX6t4pFTzehtnUy59sXLxQ==
X-Gm-Gg: ASbGncvujLd9y4Ux649CUdukll4nV7GYRnaK2CsL1e2d0shrXGl7QbMPW0fvFtdEY/+
	lpu2zIKSDv3O03Cd7C9+C7AA9YcUYlS462nJoJkbR83NwCujVwoLI52fcuM6cirODxnnE5hjE1b
	r3EcoUjDLqx2R9nanZJ4zh3KkVtE4Kd384X4UjpdsBpn+vYjwd9Jup0kYbVoNs0DScbGCgAypFF
	pHXIqsWoXbeHZJfwKtlnyDzJfNC7+VutAJys2PPU9ZKPte8pCQGaPk1wXrhr8oOP7SWMjXQ9x+O
	0u+hXs0Mr95srl2ckHOXY+tqk4Y4T8HhkA6ZFPFUuKui3LVWpn/XBAhKjgBcM26ULn9xsTh/K8e
	K
X-Google-Smtp-Source: AGHT+IHlBbGRoo+veE0wV+CgCGXvK8mm2TZUZyythxJf48MeNY+fwFlYNSAFeKdOzx6529ciae7Ieg==
X-Received: by 2002:a05:6402:4612:b0:5d0:b925:a8a with SMTP id 4fb4d7f45d1cf-5deaddb57e2mr9813823a12.16.1739538427826;
        Fri, 14 Feb 2025 05:07:07 -0800 (PST)
Message-ID: <b1e87068-977d-45a6-b61f-e3c40876b947@suse.com>
Date: Fri, 14 Feb 2025 14:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-3-roger.pau@citrix.com>
 <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>
 <Z685StmNlL2d8iQT@macbook.local>
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
In-Reply-To: <Z685StmNlL2d8iQT@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2025 13:38, Roger Pau Monné wrote:
> On Fri, Feb 14, 2025 at 12:53:01PM +0100, Jan Beulich wrote:
>> On 14.02.2025 10:29, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/emulate.c
>>> +++ b/xen/arch/x86/hvm/emulate.c
>>> @@ -338,8 +338,38 @@ static int hvmemul_do_io(
>>>          if ( !s )
>>>          {
>>>              if ( is_mmio && is_hardware_domain(currd) )
>>> -                gdprintk(XENLOG_DEBUG, "unhandled memory %s to %#lx size %u\n",
>>> -                         dir ? "read" : "write", addr, size);
>>> +            {
>>> +                /*
>>> +                 * PVH dom0 is likely missing MMIO mappings on the p2m, due to
>>> +                 * the incomplete information Xen has about the memory layout.
>>> +                 *
>>> +                 * Either print a message to note dom0 attempted to access an
>>> +                 * unpopulated GPA, or try to fixup the p2m by creating an
>>> +                 * identity mapping for the faulting GPA.
>>> +                 */
>>> +                if ( opt_dom0_pf_fixup )
>>> +                {
>>> +                    int inner_rc = hvm_hwdom_fixup_p2m(addr);
>>
>> Why not use rc, as we do elsewhere in the function?
> 
> hvm_hwdom_fixup_p2m() returns an errno, while rc in this context
> contains X86EMUL_ values.  I could indeed re-use rc, it just felt
> wrong to mix different error address spaces on the same variable.

Hmm, yes, I see.

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -13,6 +13,7 @@
>>>  #include <xen/lib.h>
>>>  #include <xen/trace.h>
>>>  #include <xen/sched.h>
>>> +#include <xen/iocap.h>
>>>  #include <xen/irq.h>
>>>  #include <xen/softirq.h>
>>>  #include <xen/domain.h>
>>> @@ -5458,6 +5459,36 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
>>>      return rc;
>>>  }
>>>  
>>> +bool __ro_after_init opt_dom0_pf_fixup;
>>> +int hvm_hwdom_fixup_p2m(paddr_t addr)
>>
>> The placement here looks odd to me. Why not as static function in emulate.c?
>> Or alternatively why not as p2m_hwdom_fixup() in mm/p2m.c?
> 
> I don't have a strong opinion, if you are fine with it a static
> function in emulate.c might be the best then.

I'd be fine with either of the suggested options. mm/p2m.c is perhaps
the more logical home for such a function, yet the option of having it
static is quite appealing, too. Hence why I came to think of that one
first.

>>> +{
>>> +    unsigned long gfn = paddr_to_pfn(addr);
>>> +    struct domain *currd = current->domain;
>>> +    p2m_type_t type;
>>> +    mfn_t mfn;
>>> +    int rc;
>>> +
>>> +    ASSERT(is_hardware_domain(currd));
>>> +    ASSERT(!altp2m_active(currd));
>>> +
>>> +    /*
>>> +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
>>> +     * having identity mappings for non RAM regions (gfn == mfn).
>>> +     */
>>> +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
>>> +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
>>> +        return -EPERM;
>>> +
>>> +    mfn = get_gfn(currd, gfn, &type);
>>> +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
>>> +        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;
>>
>> I understand this is to cover the case where two vCPU-s access the same GFN
>> at about the same time. However, the "success" log message at the call site
>> being debug-only means we may be silently hiding bugs in release builds, if
>> e.g. we get here despite the GFN having had an identity mapping already for
>> ages.
> 
> Possibly, but what would be your suggestion to fix this?  I will think
> about it, but I can't immediately see a solution that's not simply to
> make the message printed by the caller to be gprintk() instead of
> gdprintk() so catch such bugs.  Would you agree to that?

My thinking was that it might be best to propagate a distinguishable error
code (perhaps -EEXIST, with its present use then replaced) out of the function,
and make the choice of gprintk() vs gdprintk() depend on that. Accompanied by a
comment explaining things a little.

Jan

