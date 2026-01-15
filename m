Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86977D2463B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 13:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204977.1519472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgMAl-0005tB-0t; Thu, 15 Jan 2026 12:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204977.1519472; Thu, 15 Jan 2026 12:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgMAk-0005qf-Tf; Thu, 15 Jan 2026 12:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1204977;
 Thu, 15 Jan 2026 12:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgMAj-0005qZ-E1
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 12:09:53 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17857f66-f20b-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 13:09:50 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so691789f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 04:09:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6fca57sm5340612f8f.42.2026.01.15.04.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 04:09:49 -0800 (PST)
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
X-Inumbo-ID: 17857f66-f20b-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768478990; x=1769083790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fVNLL7Ed0X6HGAu6P4eo0tISqnJrZlBVXmfFsuNGwik=;
        b=U+q4wKE4BL+XJ5gWyBwwAWPTruV2cnIbQxvLFNPfOcvBie19H3xW+rkjCJgzeiNT8p
         Te0Z2vJlK62/Nr8eE93qyZZlqdY7qFOt0PdhIo7zHWLX6HQDoDIKDYrz81jbAri8b2AD
         K31uKFlhYmNkHEzOBrgo6Xt4f1/RhJxly7T/JFUCvSZos/7XCMPo6gQO3MfeIMlLqdRK
         xuomeLEEhjRtvjt44xJL6Qmcz7RlvcAvQGT3dRuGbMuMP80WfXKQp8rup0psmmRWBBSU
         nBIYFwdbxAvRRxDgk0z9nHc8RHtDSq0feg6+VuqCBp5vfF5gibVHFARkX0dKQfsPaocy
         Mx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768478990; x=1769083790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVNLL7Ed0X6HGAu6P4eo0tISqnJrZlBVXmfFsuNGwik=;
        b=WlWfwvJU2azF1gTDgy4OAKncKJ9BrK3x1SKpzWB2q1JDVu3NeS6dhyZ+TUth1XfGPC
         fHYbhWnkxJ2wMrbCIBUVg63UG71EprlM0UbHLWc6OAytAIwOHpmSBhkEgnkX556hlCmb
         eUQj0fiyq11DNAo2GpT0P4LRGVG/ol3Pc0DW/rpI7THhxcTj/GzTowaP9WFCiHwq5vjs
         mxaE/Uu5DzvMBr3oO3sCmku0/l/OijeMQOERkibpowg4vh5ZTHoSdwC3msm/ukKU2yKu
         XPoqDEURvTEIdHZWb/CQRChR3DYz7TTg6WrvO8LpvA50i4It4wKbWtl/udLV7Js8M5Zd
         nb4g==
X-Forwarded-Encrypted: i=1; AJvYcCXqSUh8kOWSvqMgfV44WLsD+j8x8kixBuIZ8hYR0fX+mLPzOObd2hUbE+lu8uK0JFn/kHNOT9sRJkg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yximp+MVSXJhhvFWlM/HZjqoiKCf+grqDbggN3dUGnOg58VmCtY
	nuTGzof0Dx5WHJ/cUw9MSkPdBXRQzj9crhU8ACV9WP8uICqx/3xuWFrhQRxyaaF+9w==
X-Gm-Gg: AY/fxX6YG/mP+2mWJkfVZoQqPHetMQjcYnsKJlkmXazBkzhulq7LQKqVK2azOxx2GR9
	Eyo5Axn+OtsiSeW5IQUWfqeSudRBu0OhXtj5UnphWMEun6MJxfR9w6C7yPA9CwfLaJzEBoS1rje
	nPFPlsAlqN7a+oSxTqK5443yF9bDR2QIYyZkfA3zN1Rx10CCujSpjvTnpR5rQrmjZ3L49jvHS+a
	Lih+oRzLuDT+6QoFuP9HrE5qUVXonbB2dNzS3zTLk9fcrz7OujgC129NkQezE8j1+Ps/FJuDitj
	P35eBllU6L3M3qiqcDQ3eRCaCKPuSouScRqhbUNSd9d+wMYq93UAD1ltbWryqbtN+907f3TgNSK
	CAPcW/qfj8DoFPuvSa5oZC8XY7PJLqlGjI1/GS3jfAgTPyzw7B8UjboKzlmDLtt4Sbq9spSikkf
	igYDVg3mZT+nERzjF3sz28IuX3S6o0bDRd5ikhSTxoVBl/uWz9BdpdWgnfrf0U4uJtQrJQud2GZ
	nM=
X-Received: by 2002:a05:6000:2403:b0:42c:b8fd:21b3 with SMTP id ffacd0b85a97d-4342c574ca2mr7777111f8f.57.1768478989667;
        Thu, 15 Jan 2026 04:09:49 -0800 (PST)
Message-ID: <caae4d06-fc26-4f96-8029-2747fea52d3b@suse.com>
Date: Thu, 15 Jan 2026 13:09:48 +0100
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
 <fc3d92fe-e04e-48df-a0ed-c74b3bb7d3ba@suse.com>
 <a80a50c0-eefc-4ee3-8d49-145698d45297@gmail.com>
 <ffbedb0f-f992-45b1-aa7a-a2f7e5f2b1e4@suse.com>
 <fed7075c-4c1f-4aa5-ad29-c5fba0442b47@gmail.com>
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
In-Reply-To: <fed7075c-4c1f-4aa5-ad29-c5fba0442b47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 12:46, Oleksii Kurochko wrote:
> 
> On 1/15/26 11:59 AM, Jan Beulich wrote:
>> On 15.01.2026 11:55, Oleksii Kurochko wrote:
>>> On 1/15/26 10:52 AM, Jan Beulich wrote:
>>>> On 15.01.2026 10:14, Oleksii Kurochko wrote:
>>>>> On 1/14/26 4:56 PM, Jan Beulich wrote:
>>>>>> On 14.01.2026 16:39, Oleksii Kurochko wrote:
>>>>>>> If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
>>>>>>> to SVIP, for example." then the correspondent HVIP (and HIP as usually
>>>>>>> they are aliasis of HVIP) bits will be updated. And that is why we need
>>>>>>> vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
>>>>>>> +void vcpu_sync_interrupts(struct vcpu *v)
>>>>>>> +{
>>>>>>> +    unsigned long hvip;
>>>>>>> +
>>>>>>> +    /* Read current HVIP and VSIE CSRs */
>>>>>>> +    v->arch.vsie = csr_read(CSR_VSIE);
>>>>>>> +
>>>>>>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
>>>>>>> +    hvip = csr_read(CSR_HVIP);
>>>>>>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>>>>>>> +    {
>>>>>>> +        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
>>>>>>> +        {
>>>>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>>>>> +                                   &v->arch.irqs_pending_mask) )
>>>>>>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>>>>> +        }
>>>>>>> +        else
>>>>>>> +        {
>>>>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>>>>> +                                   &v->arch.irqs_pending_mask) )
>>>>>>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>>>>> +        }
>>>>>>> +    }
>>>>>> I fear I don't understand this at all. Why would the guest having set a
>>>>>> pending bit not result in the IRQ to be marked pending?
>>>>> Maybe it is wrong assumption but based on the spec:
>>>>>      Bits sip.SSIP and sie.SSIE are the interrupt-pending and interrupt-enable
>>>>>      bits  for supervisor-level software interrupts. If implemented, SSIP is
>>>>>      writable in sip and may also be set to 1 by a platform-specific interrupt
>>>>>      controller.
>>>>> and:
>>>>>      Interprocessor interrupts are sent to other harts by implementation-specific
>>>>>      means, which will ultimately cause the SSIP bit to be set in the recipient
>>>>>      hart’s sip register.
>>>>>
>>>>> Meaning that sending an IPI to self by writing 1 to sip.SSIP is
>>>>> well-defined. The same should be true of vsip.SSIP while in VS mode.
>>>> I can't read that out of the text above. To the contrary, "will ultimately cause
>>>> the SSIP bit to be set" suggests to me that the bit is not to be set by writing
>>>> the CSR. Things still may work like this for self-IPI, but that wouldn't follow
>>>> from the quotation above.
>>> Why not that wouldn't follow from the quotation above?
>>>
>>> The first quotation tells that we can do self-IPI so VSSIP.SSIP will set to 1
>>> what we could miss SSIP bit if won't explicitly try to read h/w HVIP (or VSSIP,
>>> or whatever other alias of the SSIP bit) and sync with what we have cached
>>> in hypervisor.
>> The bit being writable doesn't imply that it being written with 1 would also
>> trigger an interruption. If that's indeed the behavior, it surely is being
>> said elsewhere.
> 
> According to the spec it will trap to S-mode (VS-mode in our context) if both of
> the following are true: (a) either the current privilege mode is S and the SIE
> bit in the sstatus register is set, or the current privilege mode has less
> privilege than S-mode; and (b) bit i is set in both sip and sie.

That's still not it. Here is the relevant quote:

"These conditions for an interrupt trap to occur must be evaluated in a bounded
 amount of time from when an interrupt becomes, or ceases to be, pending in sip,
 and must also be evaluated immediately following the execution of an SRET
 instruction or an explicit write to a CSR on which these interrupt trap
 conditions expressly depend (including sip, sie and sstatus)."

Note in particular the "explicit write to a CSR". (Sorry, I did read that before,
but I didn't memorize it. Else I wouldn't have asked the original question.)

Jan

