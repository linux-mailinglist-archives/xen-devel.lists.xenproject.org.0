Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wBxQCnYWMWrFbQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:25:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB1268D802
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=cwH4xsu3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338940.1600030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQ2Y-0005oH-W5; Tue, 16 Jun 2026 09:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338940.1600030; Tue, 16 Jun 2026 09:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQ2Y-0005mN-TO; Tue, 16 Jun 2026 09:25:02 +0000
Received: by outflank-mailman (input) for mailman id 1338940;
 Tue, 16 Jun 2026 09:25:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZQ2X-0005mA-9s
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:25:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQ2W-008zos-Mw
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:25:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311660-bab6-0a2a0a5309dd-0a2a4507d2e6-40
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:25:00 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a31166c-229c-0a2a45070019-d1558031b133-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:25:00 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso39521965e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:25:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97a07sm108830425e9.14.2026.06.16.02.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:24:59 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781601900; x=1782206700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j9xbR/Vobwnj1Y8FOAI3SQJXOyxIWwLdE03CcWYJfOk=;
        b=cwH4xsu3J9/kHyqcI5tRRjEsLToaJ5AlgrCH0tT2SUvjRiPidpSQ80JgM6af9ztiTE
         fgLSQLbHIuQWQes7W2sMa8hEA6pQft6z5PJKo+Lnyo5EzNwDrM0SNJ83j19O409IFhm6
         uQhHs8FSwroRI0yI1l8mq7KtmwQoyt1OEMB+J7bj8HT1u1IWWvYuYPXLhXNeRz0R2PTK
         ASYJMZHDSLVjUhhDFsxSHq7y81FQOyXCEqJa6C+++4rQ0MGuGrwCq08FD8G8poHt+cfl
         /B3/Udx5iKntsNev/OpfdVmH9L1MTH7gImSxlV3TqGp/KhuJFpKjAe2/oApPf+7b35LE
         M96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601900; x=1782206700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9xbR/Vobwnj1Y8FOAI3SQJXOyxIWwLdE03CcWYJfOk=;
        b=O1shqydzBpBS9A5zwKB4rxTVVyjGrmV1VSIxyOrVIRJU+Ie3XBmDgI7hTsrZ8qnIbc
         pZGMGqw1jGqBXIPe3L/ba50sqr4+OEoWHQuJzeZ48iAjVsBUZYMlFfG9+eoNyvKBndML
         qpVhT4ZGad5E/6o4nlnyYTbam3Hy2tKTbGhrJqbEdDbJY7PZxuRyI3mU89lc61N/BwLX
         8E2Gaa22Qt60OJ3r+f6vt/HzJLEjgCYi6UhZHr9yIt8SH6cgbxWUyg8/HAdnrkc0jNHw
         ECQcFU3ge8K0qg4Dxonm8YsV3v+tT6Q8NCCozh2j0uLLigyZthl/ufGh1dFvQel1wR7U
         6eNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eYUtYiw8I1Ac5cuK3PyE62dCb/E1D6X/tO/wCblvUgVAaw8HJJoX9q1UFbW23OFstXqczxRSUMdo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIHj5V5YERqP3tCogpxIIJD1enm/sdl2Ej2faD9+xWv2KNxAMj
	AAfdUl4Jl5yutzzyPws68q9iH6PE9ObFeRwb2yLbr74DAE5WcRyB9edyS7pYIaRjhQ==
X-Gm-Gg: Acq92OHahqmWYf/oc4oQ7lT6qus6s5SEcB+Tv0zZdo5+mObug/R9GSzHVg27aMDUFby
	eSFG/WSBxWYBnqsM+9ssO1y9qpMPHucv1dX/sNSuCBNeCxuqk4R3pyWl09gJSTQh4B1pdgtwWbW
	fpisnoq7WPxqcRHpOOfIHC+VR3ifUI2hjtRvAUOHREn+GTfTGweE+z+h/QFMWB4kOJVLOug7oCU
	VA4868jGCTQdLoWgU14mTzk8GDzF2PAlhfRJ+4RrmMugkxzFlPQwju2fg03PRs5Yp/eTDzeGJJv
	OxO1AP0cysbcMwVmOiDxmlLNbB9qCAqd2+Mucfc/H6vL7CcljNMEyChH3NqJWwUrpa1pjep3LRP
	nXKG1toHiqPLllF0e1dBvpTn96q4PLfUvCmJEN8ZPGh2IYCHWX8O8wy2PaeEJcVUOdyQcZq1ls8
	PEOKbFN8hIMCAswfEFsDFxEKhF/4vpjyAw3HVz9w4Ljw7VNUETAoFEjTPOUVvUuDTv5Bs0/OzsZ
	RCPB2GQxN00lcQ=
X-Received: by 2002:a05:600c:698c:b0:490:b025:f324 with SMTP id 5b1f17b1804b1-4922ffbdad4mr40773595e9.32.1781601899922;
        Tue, 16 Jun 2026 02:24:59 -0700 (PDT)
Message-ID: <2ba3a921-1927-4f94-b986-ecce59842961@suse.com>
Date: Tue, 16 Jun 2026 11:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/26] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <434e0be590bc0550e143836edff7e8e1e96b28c1.1778250616.git.oleksii.kurochko@gmail.com>
 <133430db-5605-4f3a-8ff7-77f9b57c91ad@suse.com>
 <68a7f2bc-91f5-4a19-afa7-4a9fd065f558@gmail.com>
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
In-Reply-To: <68a7f2bc-91f5-4a19-afa7-4a9fd065f558@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781601900-2887FC48-C2E5A436/0/0
X-purgate-type: clean
X-purgate-size: 5250
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FB1268D802

On 16.06.2026 11:07, Oleksii Kurochko wrote:
> On 6/15/26 5:13 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>> +    val = readl((void __iomem *)((uintptr_t)aplic.regs + offset)) & mask;
>>
>> Easier as
>>
>>      val = readl((volatile void __iomem *)aplic.regs + offset) & mask;
>>
>> ? (Note that like const, volatile also shouldn't be cast away.)
> 
> Is arithmetic on void * pointers correct from the C standard's point of 
> view?
> 
> It works with GCC (see 
> https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html), but I can't find 
> anything that guarantees the same behavior for other compilers.
> 
> I'm okay with the suggested change if it's acceptable for Xen to rely on 
> GCC's void * pointer arithmetic extension.

We use that all over the place. Even docs/misra/C-language-toolchain.rst
mentions it as explicitly permitted.

>>> --- a/xen/arch/riscv/include/asm/vaplic.h
>>> +++ b/xen/arch/riscv/include/asm/vaplic.h
>>> @@ -26,6 +26,9 @@ struct vaplic_regs {
>>>   struct vaplic {
>>>       struct vintc vintc;
>>>       struct vaplic_regs regs;
>>> +
>>> +    paddr_t regs_start;
>>> +    paddr_t regs_size;
>>
>> Can regs_size really go beyond 4G?
> 
> Good question and it depends on an amount of vCPUs:
> 
> #define APLIC_MIN_SIZE          0x4000
> #define APLIC_SIZE_ALIGN(x)     ROUNDUP(x, APLIC_MIN_SIZE)
> 
> #define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
>                                   APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * 
> (nr_cpus)))
> 
> paddr_t aplic_size = APLIC_SIZE(d->max_vcpus);
> 
> With the current limitation of 128 vCPUs max (IIRC) it won't beyond 4G.

Tying to the overly low limit of 128 isn't very helpful, I guess. With
APLIC_IDC_SIZE resolving to 32, the limit would be millions of vCPU-s
aiui, so imo not a concern at all.

>>> --- a/xen/arch/riscv/vaplic.c
>>> +++ b/xen/arch/riscv/vaplic.c
>>> @@ -26,6 +26,283 @@
>>>   
>>>   #define FDT_VAPLIC_INT_CELLS 2
>>>   
>>> +#define AUTH_IRQ_BIT(d, irqn) ( \
>>> +    ((irqn) <= (d)->arch.vintc->irq_nums) && \
>>> +    test_bit(irqn, (d)->arch.vintc->allocated_irqs) )
>>> +
>>> +#define regindx_to_irqn(reg_val) ((reg_val) / sizeof(uint32_t))
>>> +
>>> +static inline uint32_t generate_auth_mask(const struct domain *d,
>>> +                                          unsigned int irqsn)
>>> +{
>>> +    if ( irqsn >= DIV_ROUND_UP(d->arch.vintc->irq_nums,
>>> +                               sizeof(uint32_t) * BITS_PER_BYTE) )
>>
>> Why the rounding up? Isn't ->irqs_num the proper upper bound?
> 
> Probably irqsn isn't a correct name here as it looks like "IRQ source 
> number" (an IRQ number), but regindx_to_irqn(offset & MASK) actually 
> computes offset / 4 - a word index into the used_irqs bitmap. Word 0 
> covers IRQs 0–31, word 1 covers IRQs 32–63, etc.
> Given that, the bounds check:
>    irqsn >= DIV_ROUND_UP(irq_nums, sizeof(uint32_t) * BITS_PER_BYTE)
> is "word index >= number of 32-bit words in the bitmap" which is 
> correct. The DIV_ROUND_UP converts the IRQ count into a word count to 
> compare against the word index.
> 
> So the real issue is naming. There are two options to resolve it:
> - rename to reflect reality; call it word_idx (not irqsn), and rename 
> regindx_to_irqn to something like regoffset_to_word_idx. The 
> DIV_ROUND_UP check then reads clearly.
> 
> - Change the API to take an actual IRQ number, pass irqsn * 32 (the 
> first IRQ in the word) and check irqsn >= irq_nums directly, computing 
> the word index inside generate_auth_mask. This aligns with how 
> AUTH_IRQ_BIT works.
> 
> Which one option do you prefer?

I don't care very much as long as the result is self-consistent.

>>> +    default:
>>> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
>>> +                 offset);
>>> +
>>> +        domain_crash(vcpu->domain);
>>> +
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    *out = aplic_hw_read_reg(offset, auth_mask);
>>
>> You blindly assume a 32-bit access here (and also in the write counterpart).
>> How do you end up knowing?
> 
> he APLIC spec requires all register accesses to be 32-bit wide.
> 
> Also, I have the following at the caller side (yes, it can't be 
> understand from the current patch):
> 
>      /* Fault address should be aligned to length of MMIO */
>      if ( fault_addr & (len - 1) )
>          return -EIO;
> 
>      if ( vintc->ops->is_access(vcpu, fault_addr) )
>      {
>          /* PLIC/APLIC access are always on 32bit */
>          ASSERT( len == 4 );

"len" being guest controlled, how can you have such an assertion?

>          rc = vintc->ops->emulate_store(vcpu, fault_addr, data32);
>          if ( rc < 0 )
>              return rc;
>      }
> 
> Probably it would be better addi a size parameter to both callbacks:
> 
> int (*emulate_load)(const struct vcpu *vcpu, unsigned long addr,
>                      unsigned int size, uint32_t *out);
> int (*emulate_store)(const struct vcpu *vcpu, unsigned long addr,
>                       unsigned int size, uint32_t in);

Yes please.

Jan

