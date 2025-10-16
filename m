Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FF8BE326F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 13:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144494.1477883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MSN-0008Q2-Co; Thu, 16 Oct 2025 11:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144494.1477883; Thu, 16 Oct 2025 11:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MSN-0008Nw-A6; Thu, 16 Oct 2025 11:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1144494;
 Thu, 16 Oct 2025 11:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9MSM-0008Nq-Cz
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 11:47:42 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb350ed8-aa85-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 13:47:40 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso329957f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 04:47:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e1024sm34001713f8f.42.2025.10.16.04.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 04:47:39 -0700 (PDT)
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
X-Inumbo-ID: eb350ed8-aa85-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760615260; x=1761220060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KckZCI76O27tUokk9V5SlMMsz7F0X6x76XUX6diCJx8=;
        b=P1xncKM/tTWoobv+hyoI090e5dyTVvfmYn0nF/HN8SGRdJvnDuJf5GgUILU1NOuos+
         qd/X4am3fqRfgUd/o/hEfLAxE83h5mJZGr0I5qDsUD3JgKL0dayjnsfEq6y1qeLinp9w
         5P4gZxbZahNMzQT7fwiBEiSoemjRyo/503hPhn2Ax5u/SVixKNKhu4ta7RDhsK5mYBC2
         emu/h4Xs7Im3y/a9kNZCT6MiGX0Cl+8TXYDtVAgJrA/59+SFZOwmWU7uwXfVZ48aA4nH
         1EsKRqeR2w4AurX0Bp36DK0OZ4eQT542kR1j1irnEW59YFkMtgYoyMmQIc/trG4dQkqR
         NzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760615260; x=1761220060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KckZCI76O27tUokk9V5SlMMsz7F0X6x76XUX6diCJx8=;
        b=HIlsZoqga4vqUCINofZmlBg6ervzEW0kNA4gtFLv3MAk8CxEtekzlWEsTeA3B+NuwJ
         KzgwzdNFurjFmuAJX6skpZGU0Qh4hYxXoQKti5qY1iFPvjBW6ubnli2EJY8BByHa/Wl3
         GyfidrG++W4tSNyTQbBI65MarSBeLUnlWI4cvIivHhOk7yMeKND5g3P6opkDc1HMvR1K
         qni0BgEs6bpUPExOQO3X7s1Qb7v3aVZX6H3fjhpu8ob0RoxjWD44vxJFM9/kLd8lu5xw
         AFC3XXeX2cfGq6S8PhBxoAegxLOoFvCTOvBmdbwhGmnzOrahLeDPZ4V6k0kZdxXR/Klv
         rRgw==
X-Gm-Message-State: AOJu0Yyddbfz0YapGVFvKoB0YVxo2ZQHiqLFXV0IV6/UT9nXzS1Xx14m
	mmdDYd2sIEbyu0CwMSgqE6/iYl8WE/OCdkNhYiC5ewiAtb4/rSb+Krus7wZzOBmiPw==
X-Gm-Gg: ASbGnctwbPD4NuUOx+Ytt+fZ8FEhhWjMEiJr7Ube7h98fUI0ivY8C8NuGK5aRDyrz6o
	moTmoJB0ghkh+6I7NY0MAKn7IFo235aQ4dpkXWz2/SkRTYRdGPzgXnERLDFxqMEXrbcxtqdSFZd
	eoc2yTFnaQYPWhnLTNvTxQimmgSNjg75beZsphm0/AI4uBqy72N7I+ij4nnHJCFxnzvG8QrN98X
	nRttyYSRN566tJVruyYQj0klCQ30Y9Ru0zbiBbybWLQYWmBfdRnke2gTXRuBqGcsr3ZCUVxtNpj
	yC3pYB5xpcgK60m2oBjg5aHlEirOAudO76tOI8EPmbawOxBnZF0oJ9R8A0fCOyfxUZEecsokNS+
	Vd2gjhaEUtmV7TTYnALVQSsvGiH23b9oOAb+yeMjntUX0NqXtqjvLjeptwvay4ZXKQPNn2knTz9
	ykuG+4dPPy31fFYaOQs0YivWJNJDfpYtzONV9rqpyoPFe8p0HE7P4x8u166Wcz
X-Google-Smtp-Source: AGHT+IFdwOld0UFHFKr4ncMFX7tqMmdBqc0rHuq3xXleXGR+vD2K9pI5SryslDxB/3UkWTeHuGYhZw==
X-Received: by 2002:a05:6000:4b0e:b0:427:45f:ee21 with SMTP id ffacd0b85a97d-427045ff248mr259457f8f.27.1760615259743;
        Thu, 16 Oct 2025 04:47:39 -0700 (PDT)
Message-ID: <14bb12b2-1a01-49a8-be9a-6a32c3729e9e@suse.com>
Date: Thu, 16 Oct 2025 13:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 01/10] x86/HPET: limit channel changes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com> <aPDH4-ZEfJ9LGc9J@Mac.lan>
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
In-Reply-To: <aPDH4-ZEfJ9LGc9J@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 12:24, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 09:31:21AM +0200, Jan Beulich wrote:
>> Despite 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt
>> processing") we can still observe nested invocations of
>> hpet_interrupt_handler(). This is, afaict, a result of previously used
>> channels retaining their IRQ affinity until some other CPU re-uses them.
> 
> But the underlying problem here is not so much the affinity itself,
> but the fact that the channel is not stopped after firing?

(when being detached, that is) That's the main problem here, yes. A minor
benefit is to avoid the MMIO write in hpet_msi_set_affinity(). See also
below.

Further, even when mask while detaching, the issue would re-surface after
unmasking; it's just that the window then is smaller.

>> @@ -454,9 +456,21 @@ static struct hpet_event_channel *hpet_g
>>      if ( num_hpets_used >= nr_cpu_ids )
>>          return &hpet_events[cpu];
>>  
>> +    /*
>> +     * Try the least recently used channel first.  It may still have its IRQ's
>> +     * affinity set to the desired CPU.  This way we also limit having multiple
>> +     * of our IRQs raised on the same CPU, in possibly a nested manner.
>> +     */
>> +    ch = per_cpu(lru_channel, cpu);
>> +    if ( ch && !test_and_set_bit(HPET_EVT_USED_BIT, &ch->flags) )
>> +    {
>> +        ch->cpu = cpu;
>> +        return ch;
>> +    }
>> +
>> +    /* Then look for an unused channel. */
>>      next = arch_fetch_and_add(&next_channel, 1) % num_hpets_used;
>>  
>> -    /* try unused channel first */
>>      for ( i = next; i < next + num_hpets_used; i++ )
>>      {
>>          ch = &hpet_events[i % num_hpets_used];
>> @@ -479,6 +493,8 @@ static void set_channel_irq_affinity(str
>>  {
>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>>  
>> +    per_cpu(lru_channel, ch->cpu) = ch;
>> +
>>      ASSERT(!local_irq_is_enabled());
>>      spin_lock(&desc->lock);
>>      hpet_msi_mask(desc);
> 
> Maybe I'm missing the point here, but you are resetting the MSI
> affinity anyway here, so there isn't much point in attempting to
> re-use the same channel when Xen still unconditionally goes through the
> process of setting the affinity anyway?

While still using normal IRQs, there's still a benefit: We can re-use the
same vector (as staying on the same CPU), and hence we save an IRQ
migration (being the main source of nested IRQs according to my
observations).

We could actually do even better, by avoiding the mask/unmask pair there,
which would avoid triggering the "immediate" IRQ that I (for now) see as
the only explanation of the large amount of "early" IRQs that I observe
on (at least) Intel hardware. That would require doing the msg.dest32
check earlier, but otherwise looks feasible. (Actually, the unmask would
still be necessary, in case we're called with the channel already masked.)

Jan

