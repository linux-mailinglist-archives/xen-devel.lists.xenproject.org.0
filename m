Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5BB1D589
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 12:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072768.1435741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxbH-0001R6-2Q; Thu, 07 Aug 2025 10:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072768.1435741; Thu, 07 Aug 2025 10:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxbG-0001Og-Vr; Thu, 07 Aug 2025 10:11:54 +0000
Received: by outflank-mailman (input) for mailman id 1072768;
 Thu, 07 Aug 2025 10:11:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujxbG-0001OY-2X
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 10:11:54 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efbe0d9e-7376-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 12:11:51 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ae6f8d3bcd4so155154766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 03:11:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af985e63730sm451485066b.67.2025.08.07.03.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 03:11:50 -0700 (PDT)
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
X-Inumbo-ID: efbe0d9e-7376-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754561511; x=1755166311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dDQ8rvNQzB5IMXZPuZ1Mgl6mOsnFX7TIDFqMJFg9Ycw=;
        b=Vpxkp/fAk31v3SqfmQEy7/C65EF2i6uEyTl/a16zKFvkBoIvrE+Q4VwdUi5labyhOH
         ZJMpxPRsmCi0Prm0FxQzhieXaOc39UuEJ76o7IWZNFVuZNkCCafFV5Z3fyqbFJod5cO8
         CD1CVRHC/HP0R128NgNtZvhE14+/EwnKGEknvekFDRgkMy4VzDB8xj0Q5w2+CUu0YLBL
         R64gfJdnG/BVXWRhKh/KCVT02CF1AtnAZZZbTWo/PM1paezH0Gu4iaDVtJKu+WH1xKJx
         TY9OtBelzI2NL9V8aiK+ea5Kver3kxnsAbFFyWgJ86WQiY8JSiIib+aKN9/9ef7V5bbY
         g41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754561511; x=1755166311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDQ8rvNQzB5IMXZPuZ1Mgl6mOsnFX7TIDFqMJFg9Ycw=;
        b=AK8EGtbyUp8o3N1pvh+hPij2/DPtttISkPRI98fmhDDSL39vzs/zPhc9dmndOSZpWs
         07CCwX1knFztCPZmpmP0AA9YFVNEERtCjyKIHlRVIc1KQuR/wVkhfpZV3gcGuHOe55ay
         RTSPcEQeh6T4h95oEMHfkBOwnbSYTHyWdSzwSfF3h2K6b2/y22khGlYi3pfSd0XCNxSq
         4pKVV5FRx73PN6oElHjVPE1vuEvsbc1HJDchdQpcSuxi7akLMQaZvKzbC9g3MN++cxSd
         5dDxnclvDVae4Vdx2mHrYK4Ot0c0p9a5xG0nSp/LTw+ayLJyl2u5LhhyuAQZI9rtGAA3
         4oRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdepdKZPGQaA235/qxQtsh1PO1kyJ0DClLaBm7CInPETd4uG+UIw6BhoQBPXPhbCrqhrvAUy7mJmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze/yNfHW6xyziGUQX05rh62x/kmBb9G4cJ3WOrA4+s6rPk8j1w
	f2nP+n+TEEq+dF1ZPjMrYFky1EGIIjBs8R32hdBFR23e7crRulb03+YEyX28EqDn9w==
X-Gm-Gg: ASbGncuwzO4NMsJFnR6CzZmAxun9ZMVaeFrkmnrglTw5OQMDf2WhmX7yqRKf3nPQcn/
	1G2tvBmiErH40VtbQcIqqN1G15oXG3/8IG9JYnhfgYBJvKGcpzRYyV+SvxIGIfJs0XOUv1u79fg
	NYd4WXK+e0YlhrH48VWramkymlMdMClfgfoBED5452SeiKDwNGHKoZQfu6IDi8EBTjaMAQeCEWh
	cksbOr1bGPDO0julJaZkPaAWZKREg2tGMiz2f6kRY7LWQb7DgVOakOaqhXbcZEFy55qEhWZdUnp
	TqbyE8UowmaNXvR1XrLEeZaf+ddAFUt2XH0B6Y4mDrS4TdyIf36I96OTK0quwfV/0f0k12uRx2Y
	PDuWcvgDk7qcVjWibBBvd76FM7Dn2vrPOloru8nYdOmUUODD9luiOMEpp6UhJGtE91USfLEbxdY
	2Ly0UNvYs=
X-Google-Smtp-Source: AGHT+IHlLQO1d43mXfMUEF4ZoDof+Tz0egZgCyDOe70C5uWzBMJvcG2VDntKQlFdHUV3nvrUcPNizw==
X-Received: by 2002:a17:907:868a:b0:ade:198c:4b6f with SMTP id a640c23a62f3a-af9a6046c89mr210053766b.1.1754561510549;
        Thu, 07 Aug 2025 03:11:50 -0700 (PDT)
Message-ID: <affb589c-0e4e-46c1-a2c7-d09b6cca0a6c@suse.com>
Date: Thu, 7 Aug 2025 12:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
 <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
 <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
 <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>
 <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
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
In-Reply-To: <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2025 18:24, Oleksii Kurochko wrote:
> On 8/6/25 2:05 PM, Jan Beulich wrote:
>> On 06.08.2025 13:33, Oleksii Kurochko wrote:
>>> On 8/4/25 5:19 PM, Jan Beulich wrote:
>>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>>> +{
>>>>> +    unsigned long vmid_bits;
>>>> Why "long" (also for the function return type)?
>>> Because csr_read() returns unsigned long as HGATP register has
>>> 'unsigned long' length.
>> Oh, right, I should have commented on the function return type only.
>> Yet then I also can't resist stating that this kind of use of a variable,
>> which initially is assigned a value that doesn't really fit its name, is
>> easily misleading towards giving such comments.
>>
>>> But it could be done in this way:
>>>       csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>       vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
>>>       vmid_bits = ffs_g(vmid_bits);
>>>       csr_write(CSR_HGATP, old);
>>> And then use uint16_t for vmid_bits and use uin16_t as a return type.
>> Please check ./CODING_STYLE again as to the use of fixed-width types.
> 
> I meant unsigned short, uint16_t was just short to write. I'll try to be
> more specific.

I'd also recommend against unsigned short when there are no space concerns.
unsigned int is what wants using in the general case.

>>>>> +    unsigned long old;
>>>>> +
>>>>> +    /* Figure-out number of VMID bits in HW */
>>>>> +    old = csr_read(CSR_HGATP);
>>>>> +
>>>>> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>>> +    vmid_bits = csr_read(CSR_HGATP);
>>>>> +    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
>>>> Nit: Stray blank.
>>>>
>>>>> +    vmid_bits = flsl(vmid_bits);
>>>>> +    csr_write(CSR_HGATP, old);
>>>>> +
>>>>> +    /*
>>>>> +     * We polluted local TLB so flush all guest TLB as
>>>>> +     * a speculative access can happen at any time.
>>>>> +     */
>>>>> +    local_hfence_gvma_all();
>>>> There's no guest running. If you wrote hgat.MODE as zero, as per my
>>>> understanding now new TLB entries could even purely theoretically appear.
>>> It could be an issue (or, at least, it is recommended) when hgatp.MODE is
>>> changed:
>>>    If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
>>>    (and rs2 set to either x0 or the VMID) must be executed to order subsequent
>>>    guest translations with the MODE change—even if the old MODE or new MODE
>>>    is Bare.
>>> On other hand it is guaranteed that, at least, on Reset (and so I assume
>>> for power on) that:
>>>    If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
>>>    fields are reset to 0.
>>>
>>> So it seems like if no guest is ran then there is no need even to write
>>> hgatp.MODE as zero, but it might be sense to do that explicitly just to
>>> be sure.
>>>
>>> I thought it was possible to have a running guest and perform a CPU hotplug.
>> But that guest will run on another hart.
>>
>>> In that case, I expect that during the hotplug,|vmidlen_detect()| will be
>>> called and return the|vmid_bits| value, which is used as the active VMID.
>>> At that moment, the local TLB could be speculatively polluted, I think.
>>> Likely, it makes sense to call vmidlen_detect() only once for each hart
>>> during initial bringup.
>> That may bring you more problems than it solves. You'd need to stash away
>> the value originally read somewhere. And that somewhere isn't per-CPU data.
>>
>>>> In fact, with no guest running (yet) I'm having a hard time seeing why
>>>> you shouldn't be able to simply write the register with just
>>>> HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
>>>> whether "old" needs restoring; writing plain zero afterwards ought to
>>>> suffice. You're in charcge of the register, after all.
>>> It make sense (but I don't know if it is a possible case) to be sure that
>>> HGATP.MODE remains the same, so there is no need to have TLB flush. If
>>> HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
>>> above.
>>>
>>> If we agreed to keep local_hfence_gvma_all() then I think it isn't really
>>> any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.
>>>
>>> Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
>>> to check that in vmidlen_detect() and panic if it isn't zero) and if
>>> vmidlen_detect() function will be called before any guest domain(s) will
>>> be ran then I could agree that we don't need local_hfence_gvma_all() here.
>>>
>>> As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
>>> set to zero.
>>>
>>> Does it make sense?
>> Well - I'd like the pre-conditions to be understood better. For example, can
>> a hart really speculate into guest mode, when the hart is only in the
>> process of being brought up?
> 
> I couldn't explicit words that a hart can't speculate into guest mode
> either on bring up or during its work.
> 
> But there are some moments in the spec which tells:
>    Implementations with virtual memory are permitted to perform address
>    translations speculatively and earlier than required by an explicit
>    memory access, and are permitted to cache them in address translation
>    cache structures—including possibly caching the identity mappings from
>    effective address to physical address used in Bare translation modes and
>    M-mode.
> And here:
>    Implementations may also execute the address-translation algorithm
>    speculatively at any time, for any virtual address, as long as satp is
>    active (as defined in Section 10.1.11). Such speculative executions have
>    the effect of pre-populating the address-translation cache.

That's satp though, not hgatp.

> Where it is explicitly mentioned that speculation can happen in *any time*.
> And at the same time:
>    Speculative executions of the address-translation algorithm behave as
>    non-speculative executions of the algorithm do, except that they must
>    not set the dirty bit for a PTE, they must not trigger an exception,
>    and they must not create address-translation cache entries if those
>    entries would have been invalidated by any SFENCE.VMA instruction
>    executed by the hart since the speculative execution of the algorithm began.
> What I read as if TLB was empty before it will stay empty.
> 
> Also, despite of the fact here it is mentioned that when V=0 two-stage address
> translation is inactivated:
>    The current virtualization mode, denoted V, indicates whether the hart is
>    currently executing in a guest. When V=1, the hart is either in virtual
>    S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest OS running
>    in VS-mode. When V=0, the hart is either in M-mode, in HS-mode, or in
>    U-mode atop an OS running in HS-mode. The virtualization mode also
>    indicates whether two-stage address translation is active (V=1) or
>    inactive (V=0).
> But on the same side, writing to hgatp register activates it:
>    The hgatp register is considered active for the purposes of
>    the address-translation algorithm unless the effective privilege mode
>    is U and hstatus.HU=0.
> And if so + considering that speculation could happen at any time, and
> we are in HS-mode, not it U mode then I would say that it could really
> speculate into guest mode.

Hmm, that leaves some things to be desired. What I'm particularly puzzled
by is that there's nothing said either way towards speculation through SRET.
That's the important aspect here aiui, because without that the hart can't
speculate into guest mode.

But yes, in the absence of any clear indication to the contrary, I think
you want to keep the local_hfence_gvma_all() (with a suitable comment).

>>>>> +    data->max_vmid = BIT(vmid_len, U) - 1;
>>>>> +    data->disabled = !opt_vmid_enabled || (vmid_len <= 1);
>>>> Actually, what exactly does it mean that "VMIDs are disabled"? There's
>>>> no enable bit that I could find anywhere. Isn't it rather that in this
>>>> case you need to arrange to flush always on VM entry (or always after a
>>>> P2M change, depending how the TLB is split between guest and host use)?
>>> "VMIDs are disabled" here means that TLB flush will happen each time p2m
>>> is changed.
>> That's better described as "VMIDs aren't used" then?
> 
> It sounds a little bit just like an opposite to "disabled" (i.e. means
> basically the same), but I am okay to use "used" instead.

If you want to stick to using "disabled", then how about "VMID use is
disabled"? (You probably meanwhile understood that what I'm after is it
becoming clear that this is a software decision, not something you can
enforce in hardware.)

Jan

