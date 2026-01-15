Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2228D23B98
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204616.1519242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgK2C-0000pD-US; Thu, 15 Jan 2026 09:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204616.1519242; Thu, 15 Jan 2026 09:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgK2C-0000nM-RV; Thu, 15 Jan 2026 09:52:56 +0000
Received: by outflank-mailman (input) for mailman id 1204616;
 Thu, 15 Jan 2026 09:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgK2B-0000nE-Df
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:52:55 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5828dc6-f1f7-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:52:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso4478485e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:52:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee27fd33dsm41426805e9.8.2026.01.15.01.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:52:50 -0800 (PST)
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
X-Inumbo-ID: f5828dc6-f1f7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768470772; x=1769075572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=APisuLnU2lPssXgJmZvw0WC+h035gdi5wEOk6crb6E0=;
        b=fZoUURjplUn0Yu6vaqxAqGMnCQCfK0uRr/wapVVUvROeEf+Zi//45uQTpHP0SpBttT
         RtBBmtTVcHyYE4xmYZQrV1srNaF34DgdKLgagFia5qVyJ2+wBRe/hFRugwjKCdZXjdB2
         0EVrUOXLEwoGllRpADhZ4Bk67CLvi59mQdwI1TN4izVbtNLQhjv6pymljR4FdJRgREq6
         ODhz8bKpcEmQ84rVy3HU1O+44PQ9NejUz5HeSHKJAkmW0mw1b6U2oeOqTU3BLjczMM1r
         uksdjztcTilB3rsJJUyXV9PLnsLhytdOazlTgnFRR6lOJNXsIVzQnM0zhAqXfxtEeP7E
         7swA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470772; x=1769075572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APisuLnU2lPssXgJmZvw0WC+h035gdi5wEOk6crb6E0=;
        b=OiunRPd7Cu5occT357+NzS7YhJnpdYyMGlagNNu5HEwASqR3QIJ6KzFmWctRxv/hSU
         xmQff1by2cPX5zqpIKU7IuM74x4PBdkWv4vvLs8sNIE006jNfVTrTKsfYzx5leLumOSo
         d2ELutJ9GnFGcqJ47jPzPLa3V3dTUONhPKPl/pS2uCpJIAUw7do1XDFYYwfmFdIPArjf
         fS7+6Vw5tGAWXVJoVpl4hLXJBahNZQSQdIjidW+m/FF+zDRCvDFeErYlpzc1OY9KaJcR
         /FkiDlM0Pnal9KiwavgP7pTr4bxFpYHH8bAQLSwaJDo7e9tTYSATIpyGqJ1WpEx/FGkh
         8QNA==
X-Forwarded-Encrypted: i=1; AJvYcCVUEdmF8MTos4SeSnqYC0fkp10d5HEcV0GcMrHRiVWcyo+VdCaOEzITXLoQt97v4YQYlN+LrDxTY/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzxpyrzTFVqwt8lWyfsR0S+qwO3t9jAsQEsnZ6reraBG8fNIOM
	esxcR5philUedi1r/m9qJ0vtkn8ueY3HOaT8ETR8YGpZNmTLCQ1MxUC9AG2quo/QxQ==
X-Gm-Gg: AY/fxX6EfIjJJSh7eOZQEMbH28m+NJprnk4/gBgy+hJ9A7XlPy5bWJtNg2dKsCf+xFU
	B5QZzdaLJrSHw3MxttkhqbdjzIUrw2FFnKKDMm8bpyrawXNPkqAm8IMbV7JudZBHVrh/JBKQmz8
	Um5C7dA3Hh4KUx/JT8O1u3z3Z8vAPJ5wzPtqpMM1W4kGh5tuSedxk8Ta93eeRO0MeOw8wbxvsv+
	sIkq3DN8ahuFpxZoTzWj/v+6n+Oo9tjRMm47GJox8OeMiRwO6tiapIYz35mvtI4d7bnuSh6zrq3
	AtPpIxPfwAqWoPBzrkG2wVW/SQT23Uh1f7uVqHRZI38SBJ+rpfzVpkGlm+W/gumvWeCk/OeNfCj
	ZhCrBAJAR9/ifLrTXGY+7dumyoClp8poUPQLY8tP6UuXgDRGxK0nmYQzaOkRgk+uJ18R0Ivwp7B
	VspAgRda/+/nl14T+6PNnVgKC2NcW1/c4ZaIDN3SNPXllscGMhdNlKJ+Y1AeapiOMwn2ZFF9sL0
	e8=
X-Received: by 2002:a05:600c:4e92:b0:47b:d914:98a7 with SMTP id 5b1f17b1804b1-47ee48325b1mr57930565e9.29.1768470772198;
        Thu, 15 Jan 2026 01:52:52 -0800 (PST)
Message-ID: <fc3d92fe-e04e-48df-a0ed-c74b3bb7d3ba@suse.com>
Date: Thu, 15 Jan 2026 10:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c6bd40a9a40ae3194bcfcf90b9a71d4c190ab7f6.1766595589.git.oleksii.kurochko@gmail.com>
 <cdefd959-5700-4cdc-8563-d4954be1e91e@suse.com>
 <f707899a-3200-4467-a827-2195351f1226@gmail.com>
 <dd10f076-cf91-426d-b2c0-2fa3056fb54f@suse.com>
 <7a90cc1b-b053-4b9f-91f1-d32064b1ec29@gmail.com>
 <c0d5104b-52ec-484e-ac40-8901ae298fa8@suse.com>
 <b6d9eb9d-24a1-4d11-aa74-c76fd96a2c96@gmail.com>
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
In-Reply-To: <b6d9eb9d-24a1-4d11-aa74-c76fd96a2c96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 10:14, Oleksii Kurochko wrote:
> On 1/14/26 4:56 PM, Jan Beulich wrote:
>> On 14.01.2026 16:39, Oleksii Kurochko wrote:
>>> On 1/13/26 2:54 PM, Jan Beulich wrote:
>>>> On 13.01.2026 13:51, Oleksii Kurochko wrote:
>>>>> On 1/7/26 5:28 PM, Jan Beulich wrote:
>>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>> By maintaining irqs_pending_mask, you can detect “this bit changed
>>>>> recently,” even if the final state is 0.
>>>>>
>>>>> Also, having irqs_pending_mask allows to flush interrupts without lock:
>>>>> if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
>>>>> {
>>>>> mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
>>>>> val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
>>>>>
>>>>> *hvip &= ~mask;
>>>>> *hvip |= val;
>>>>> }
>>>>> Without it I assume that we should have spinlcok around access to irqs_pending.
>>>> Ah yes, this would indeed be a benefit. Just that it's not quite clear to
>>>> me:
>>>>
>>>>       *hvip |= xchg(&v->arch.irqs_pending[0], 0UL);
>>>>
>>>> wouldn't require a lock either
>>> Because vCPU's hvip (which is stored on the stack) can't be changed concurrently
>>> and it's almost the one place in the code where vCPU->hvip is changed. Another
>>> place it is save_csrs() during context switch but it can't be called in parallel
>>> with the vcpu_sync_interrupts() (look below).
>>>
>>>> . What may be confusing me is that you put
>>>> things as if it was normal to see 1 -> 0 transitions from (virtual)
>>>> hardware, when I (with my x86 background) would expect 1 -> 0 transitions
>>>> to only occur due to software actions (End Of Interrupt), unless - see
>>>> above - something malfunctioned and an interrupt was lost. That (the 1 ->
>>>> 0 transitions) could be (guest) writes to SVIP, for example.
>>>>
>>>> Talking of which - do you really mean HVIP in the code you provided, not
>>>> VSVIP? So far I my understanding was that HVIP would be recording the
>>>> interrupts the hypervisor itself has pending (and needs to service).
>>> HVIP is correct to use here, HVIP is used to indicate virtual interrupts
>>> intended for VS-mode. And I think you confused HVIP with the HIP register
>>> which supplements the standard supervisor-level SIP register to indicate
>>> pending virtual supervisor (VS-level) interrupts and hypervisor-specific
>>> interrupts.
>>>
>>> If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
>>> to SVIP, for example." then the correspondent HVIP (and HIP as usually
>>> they are aliasis of HVIP) bits will be updated. And that is why we need
>>> vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
>>> +void vcpu_sync_interrupts(struct vcpu *v)
>>> +{
>>> +    unsigned long hvip;
>>> +
>>> +    /* Read current HVIP and VSIE CSRs */
>>> +    v->arch.vsie = csr_read(CSR_VSIE);
>>> +
>>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
>>> +    hvip = csr_read(CSR_HVIP);
>>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>>> +    {
>>> +        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
>>> +        {
>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>> +                                   &v->arch.irqs_pending_mask) )
>>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>> +        }
>>> +        else
>>> +        {
>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>> +                                   &v->arch.irqs_pending_mask) )
>>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>> +        }
>>> +    }
>> I fear I don't understand this at all. Why would the guest having set a
>> pending bit not result in the IRQ to be marked pending?
> 
> Maybe it is wrong assumption but based on the spec:
>    Bits sip.SSIP and sie.SSIE are the interrupt-pending and interrupt-enable
>    bits  for supervisor-level software interrupts. If implemented, SSIP is
>    writable in sip and may also be set to 1 by a platform-specific interrupt
>    controller.
> and:
>    Interprocessor interrupts are sent to other harts by implementation-specific
>    means, which will ultimately cause the SSIP bit to be set in the recipient
>    hart’s sip register.
> 
> Meaning that sending an IPI to self by writing 1 to sip.SSIP is
> well-defined. The same should be true of vsip.SSIP while in VS mode.

I can't read that out of the text above. To the contrary, "will ultimately cause
the SSIP bit to be set" suggests to me that the bit is not to be set by writing
the CSR. Things still may work like this for self-IPI, but that wouldn't follow
from the quotation above.

>>   You can't know
>> whether that guest write happened before or after you last touched
>> .irqs_pending{,mask}[]?
> 
> Yes, I think you are right.
> 
> On the other hand, if we are in hypervisor when vcpu_sync_interrupts() is
> called it means that pCPU on which vCPU is ran and for which
> vcpu_sync_interrupts() is called now executes some hypervisor things, so
> guest won't able to update VSIP.SSIP for this pCPU. So nothing else will
> change VSIP.SSIP and so h/w HVIP won't be changed by something and it is
> okay to sync .irqs_pending{,mask} with what h/w in its HVIP.

That is, vcpu_sync_interrupts() is called on every entry to the hypervisor?
Not just during context switch?

Jan

