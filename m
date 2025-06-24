Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31558AE62C4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 12:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023561.1399557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU18x-0001Kp-LB; Tue, 24 Jun 2025 10:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023561.1399557; Tue, 24 Jun 2025 10:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU18x-0001IU-IM; Tue, 24 Jun 2025 10:44:47 +0000
Received: by outflank-mailman (input) for mailman id 1023561;
 Tue, 24 Jun 2025 10:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU18v-0001IO-HK
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 10:44:45 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cdba2a9-50e8-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 12:44:43 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so175540f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 03:44:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f1241f07sm10086947a12.37.2025.06.24.03.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 03:44:42 -0700 (PDT)
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
X-Inumbo-ID: 3cdba2a9-50e8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750761883; x=1751366683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jeLu3ICCQu6W5hgFV9sjRVxbV89+G1fWtqyCL142kAA=;
        b=AnEbGYRJH9wvZe5SobOYdR1iv92Th3D3ye9jKDD5EAx5JjiDeRNR5kOqx8snvl7KeA
         Q3eorIdwlGgcLn0EJ0SAQSnq7x36fpIAR+IwH1fVCDbJdOl5xoZP1cFHpqsM3a1TsdQt
         Mgh1si7Y5sDh2Fup9gJJfHQUvetWqESyS6EEX0ar5L+llOXvaXSmnP1cLfmIi3RoCdSa
         SVu0bmHRk695ZYU+87H6yeEgmI7YnmuafJ4/MPG2q28TbA7yEXGSMaVyJ3fb79Rgaa3F
         86OIRsRgZFH/IfetQYuoDQJtGxqeSR0JTPkhZLrTVlyx7c1bdL83I2ZnQPNSA6HfMXoD
         j9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761883; x=1751366683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeLu3ICCQu6W5hgFV9sjRVxbV89+G1fWtqyCL142kAA=;
        b=Dloxr2HJN2ZUU9/5sOkQDh0zfCIkgWYFYCCtMF/5/djTSH7Ttu5lCll2tg+MUpidfg
         d3aTOhVwTAXirJ1/ovi9vQKwzm1vYZ3C546QfNoDDBEbljw4AZCnyiWvg/BZ2BPTjAL/
         ZOG7yWaBb3gXuva6Dp9lzXCCeB3ORGQd4sBGc2dKPxTVJ9c29kSeJMwk2frpqibNgoL8
         PemeNXi+dG8oZvGCarRnRzJchI9LJF0mxcuu/h52tgNDJBB7BN5jU5jOg7ZY/kUoBuUn
         6gqFRyQ8Vi5m5vth8U8stOJyIJgIpIjkPb8D8pdxJuTAsan3gzzkhyb5QQKqOo9ydk/a
         U6xA==
X-Forwarded-Encrypted: i=1; AJvYcCUwusu2Hu0KfhZvzPkKVteVutn34CmJRNHmY3yOM5eBFQDWhI4uh5ak3BJ1oKCdycF/ryY2rg0qsZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKpUSlSevvbnkX78WjzBGs8r1lwXWqG8VCRf/9Iz4EKaX1dWbi
	UwpR7Gj9FYO1jUfXEcEUZ2uaXn5xHmuJql7V727oEBwN1wkwBTVmN462F1M5emNyDA==
X-Gm-Gg: ASbGncsZVwV507pKbMFUsVsQV41PYjNxILuYbX/BacG5G0roIqePL6snMDkrWLdoD7O
	lu6jr5xhJOv1DjJH0na4ztfv3gLhPjdlhsUEqTK2zYfR5AQFOqXEIp3pnlxcix7n1xf7YduLg2c
	vUSV5O8yYOQxmoP9/vFKVed5c8u+DPFbt8/U/IXCwsyAPRS6bn7zrkrekipIhTKoX+SF1NnU9hL
	cH9KR/keNSFGoTZcFoAwwoZ/UFVVCjjzjcq9fQq2LlEbe1wD+j3/95RRoDTruXOnrTUG5s5vlTm
	yUh9ZFQP5EkmdZ0WTvMXOb+cqLp61sb8qme7IYBn33EMa/H8b8GLBqpUGk85B6e15Tp2GtA9h+l
	+EJbD5Xy1YECkvS02TvlUiyjmgpmhzWdg7CVNyfBPLGAnWsE=
X-Google-Smtp-Source: AGHT+IFOrUn1NY29QGV7qy24/rZ2wcOQiq7OWz4cNtaaJ9OviFtAcMOd6wsPhhBe0sJHLh0/ao0G0g==
X-Received: by 2002:a05:6000:2906:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3a6d12d9fb7mr13129253f8f.34.1750761882585;
        Tue, 24 Jun 2025 03:44:42 -0700 (PDT)
Message-ID: <80223fe3-7403-4026-9505-8826c318fabb@suse.com>
Date: Tue, 24 Jun 2025 12:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
 <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
 <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
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
In-Reply-To: <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 11:46, Oleksii Kurochko wrote:
> On 6/18/25 5:46 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -0,0 +1,115 @@
>>> +#include <xen/bitops.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/spinlock.h>
>>> +#include <xen/xvmalloc.h>
>>> +
>>> +#include <asm/p2m.h>
>>> +#include <asm/sbi.h>
>>> +
>>> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>> +
>>> +/*
>>> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
>>> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
>>> + * concurrent domains.
>> Which is pretty limiting especially in the RV32 case. Hence why we don't
>> assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
>> not per-vCPU).
> 
> Good point.
> 
> I don't believe anyone will use RV32.
> For RV64, the available ID space seems sufficiently large.
> 
> However, if it turns out that the value isn't large enough even for RV64,
> I can rework it to manage IDs per physical CPU.
> Wouldn't that approach result in more TLB entries being flushed compared
> to per-vCPU allocation, potentially leading to slightly worse performance?

Depends on the condition for when to flush. Of course performance is
unavoidably going to suffer if you have only very few VMIDs to use.
Nevertheless, as indicated before, the model used on x86 may be a
candidate to use here, too. See hvm_asid_handle_vmenter() for the
core (and vendor-independent) part of it.

> What about then to allocate VMID per-domain?

That's what you're doing right now, isn't it? And that gets problematic when
you have only very few bits in hgatp.VMID, as mentioned below.

>>> The bitmap space will be allocated dynamically
>>> + * based on whether 7 or 14 bit VMIDs are supported.
>>> + */
>>> +static unsigned long *vmid_mask;
>>> +static unsigned long *vmid_flushing_needed;
>>> +
>>> +/*
>>> + * -2 here because:
>>> + *    - -1 is needed to get the maximal possible VMID
>> I don't follow this part.
> 
> Probably, I'm missing something.
> 
> hgat.vmid is 7 bit long. BIT(7,U) = 1 << 7 = 128 which is bigger
> then 7 bit can cover (0b1000_0000 and 0x111_1111). Thereby the MAX_VMID is:
>   BIT(7, U) - 1 (in case of RV32).

Right, but then why -2? (Maybe this is moot now that you agreed that
INVALID_VMID can be defined differently.

>> VMIDLEN being permitted to be 0, how would you run more than one VM (e.g. Dom0)
>> on such a system?
> 
> Hmm, good question.
> 
> Then it will be needed to flush TLB on each VM switch by using
> sbi_remote_hfence_gvma().

Right, but just to be clear: That flush should not be conditional upon
VMIDLEN being 0. In whatever model you chose, the handling of this special
case should come out "natural".

>>> +        sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
>> You're creating d; it cannot possibly have run on any CPU yet. IOW
>> d->dirty_cpumask will be reliably empty here. I think it would be hard to
>> avoid issuing the flush to all CPUs here in this scheme.
> 
> I didn't double check, but I was sure that in case d->dirty_cpumask is empty then
> rfence for all CPUs will be send. But I was wrong about that.
> 
> What about just update a code of sbi_rfence_v02()?

I don't know, but dealing with the issue there feels wrong. However,
before deciding where to do something, it needs to be clear what you
actually want to achieve. To me at least, that's not clear at all.

>>> +    spin_unlock(&vmid_alloc_lock);
>>> +    return rc;
>>> +}
>>> +
>>> +void p2m_free_vmid(struct domain *d)
>>> +{
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +
>>> +    spin_lock(&vmid_alloc_lock);
>>> +
>>> +    if ( p2m->vmid != INVALID_VMID )
>>> +    {
>>> +        clear_bit(p2m->vmid, vmid_mask);
>>> +        set_bit(p2m->vmid, vmid_flushing_needed);
>> Does this scheme really avoid any flushes (except near when the system is
>> about to go down)?
>>
>> As to choice of functions - see above.
> 
> I think yes, so my idea was that if vmid isn't freed then we have enough free VMID
> and in this case flush isn't needed as each vcpu has unique not-used yet VMID,
> and if there is no free VMID then and error will return in p2m_alloc_vmid():
>      if ( nr == MAX_VMID )
>      {
>          rc = -EBUSY;
>          printk(XENLOG_ERR "p2m.c: dom%pd: VMID pool exhausted\n", d->domain_id);
>          goto out;
>      }

Which, as said, is a problem when there are only very few VMIDs.

> On other hand, if VMID was freed and then re-used in p2m_alloc_vmid(), then it means
> that vmid_flushing_needed will have VMID bit set, what means that a TLB flush is needed.

Let's assume over the uptime of a system you cycle through all VMIDs a thousand
times. While you manage to delay some TLB flushes, the percentage of ones actually
saved is going to be very low then.

>>> +    }
>>> +
>>> +    spin_unlock(&vmid_alloc_lock);
>>> +}
>>> +
>>> +int p2m_init(struct domain *d)
>>> +{
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    int rc;
>>> +
>>> +    p2m->vmid = INVALID_VMID;
>> Given the absence of callers of p2m_free_vmid() it's also not clear what use
>> this is.
> 
> Just mark that VMID for this domain wasn't yet allocated.
> 
> Anyway, it will be called from arch_domain_create() by arch_domain_destroy() so if the some
> error happens during arch_domain_create() and p2m->vmid wasn't allocated yet (so is equal to
> INVALID_VMID), it means that there is no sense to update vmid_mask or vmid_flushing_needed.

But only if you actually came through p2m_init() prior to the error. My point
is: If you allocate a VMID here anyway, why first set the field like this?
(Again, this is likely moot since the allocation scheme is likely to change
altogether.)

Jan

