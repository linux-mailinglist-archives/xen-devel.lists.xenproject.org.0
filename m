Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05583A8952B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952150.1347687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4amh-0006sQ-00; Tue, 15 Apr 2025 07:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952150.1347687; Tue, 15 Apr 2025 07:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4amg-0006pL-SS; Tue, 15 Apr 2025 07:32:42 +0000
Received: by outflank-mailman (input) for mailman id 952150;
 Tue, 15 Apr 2025 07:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4amf-0006pF-Vi
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:32:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf3b95cc-19cb-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 09:32:39 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso25859715e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 00:32:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecc73sm201873445e9.8.2025.04.15.00.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 00:32:38 -0700 (PDT)
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
X-Inumbo-ID: cf3b95cc-19cb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744702359; x=1745307159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wgUNWilhxhevH0Ne6XLOjuE4u5zJle7bLantVl5dpkU=;
        b=N9wz1LxwBDwIDmB9Wrf5F9df1BuvD654CZHfYUnGrHfEI4bpLu9VnlPG6kr637LPzg
         sc3EmJp9ZGvyAqQoYhDvpkDmEqqby0fzAPsbS1yS3U/+nzlqAIG8GWkA4p+yo/bqilYw
         gpfxmwWnoCd7UFusg5lp8GjRSrdbGS2Ni00zretEZqeIKKwunQkWe40dc2oJ32fM8oWE
         dhm9TjhfN/6TT4huHahyVOgt+lHcSwaCQQm2Vbu1Msqtkfl4S3SKvchSwe+SmOusEao6
         +1NgganV/E6flsSD/HUBhUuSoSA4Ib0xSgzi8mzpjSXAw9XwAED3QLQ3sed1fI5EoB9P
         ByKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702359; x=1745307159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgUNWilhxhevH0Ne6XLOjuE4u5zJle7bLantVl5dpkU=;
        b=PVC3pchmBrYf/HKlDWaztkv2r6UYcfcfE1NLwwr4JcAAT01MeoUdadbB+KVEm36lMM
         oms3LiBzsMOd/gf8fy9Jvm+1JJYOLxb46gtZyB9KuXt+0e7ekXgEXgK3AwvAUBCVJtvY
         2MPECiOC2MFV5Re9hW+SJo6bmh8VOpw8CeIXjnkcWt09Yn/Ehaf3USHOckJq9G2Bb96W
         85P5lRpEKZIAVgb9oV2qcmpeTkFWoH2vivvgO33cO9CwpSI71uctAo1v4+EmYE/blcpj
         M7qUDSZbgCDwDBh4+D95w9NIsmhlDgFNw3J2QxOi6+3lS1S2bhigRrIp9S66iScr/2Qb
         KsJA==
X-Forwarded-Encrypted: i=1; AJvYcCWFi4KPi6gfK8AE0gSTEI2diF7N5i4eXNt5rzaKoWgBAgmEEvxPEA9oxyh3RaDu0jBCgt0RwLNpM1c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7GuGhrPkUKVtqfpUlH57+J4jqA4tugFMNRMeAtq74W9vFHewC
	do/m8uYIYbvk888V33F5kRIY0I7Nad2hIm6EYyYOoFrbnDBc+j9DXV+9C2ArLQ==
X-Gm-Gg: ASbGncshu+OPMhQaLazlCakcr4q7o69+hvNp/uNvaWIba5/K/mI+xC5CEgrs5tIFTH1
	el4NoCvS50bYhZ4UE7/q8TjOrEXI+wU/Yz3kBzXEnnUNaf+dzgDOLhO16zov3OwImW/DQ9cXcPT
	Lnr1bDM4a6J9q1cwJJEnJUB3pwPFrmagbk8hjJ1BWFdpDYXMm/1beEx4Xda+Lq+DCCIeD4mzHk5
	ui7nY/wHfZ1HHSjT2FGf0fSvUmFBPLuApTMHLN46nUn0ljlT3587HWymZqY2cmjI3xMpgcEcSOy
	Xzs3YmPMKuzik7fHVp9BrWd6+hGu0fYZvci+KeztYVPPVpcZys/Qpv7q9pUDZmQrjiFxROjG0uu
	so9YoTwhfGHJxM4vscazrE4oLjA==
X-Google-Smtp-Source: AGHT+IHfgV9IeGc/ncY0d/NGjL44jlAkdp6XPYH7YIXLGy+fS9c1+zUU6ExC383jRKuaK9Ae+1mPBQ==
X-Received: by 2002:a05:600c:3591:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-43f3a959e43mr137253295e9.18.1744702358957;
        Tue, 15 Apr 2025 00:32:38 -0700 (PDT)
Message-ID: <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
Date: Tue, 15 Apr 2025 09:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o MMIO
 pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
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
In-Reply-To: <Z_00JReo7Ji7RwkD@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.04.2025 18:13, Roger Pau Monné wrote:
> On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
>> On 14.04.2025 15:53, Roger Pau Monné wrote:
>>> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
>>>> On 11.04.2025 12:54, Roger Pau Monne wrote:
>>>>> @@ -1981,7 +2056,9 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>>>>>       */
>>>>>      if ( (p2mt == p2m_mmio_dm) ||
>>>>>           (npfec.write_access &&
>>>>> -          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
>>>>> +          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
>>>>> +           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
>>>>> +           (p2mt == p2m_mmio_direct))) )
>>>>>      {
>>>>>          if ( !handle_mmio_with_translation(gla, gfn, npfec) )
>>>>>              hvm_inject_hw_exception(X86_EXC_GP, 0);
>>>>
>>>> Aren't we handing too many things to handle_mmio_with_translation() this
>>>> way? At the very least you're losing ...
>>>>
>>>>> @@ -2033,14 +2110,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>>>>>          goto out_put_gfn;
>>>>>      }
>>>>>  
>>>>> -    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
>>>>
>>>> ... the .present check.
>>>
>>> Isn't the p2mt == p2m_mmio_direct check already ensuring the entry is
>>> present?  Otherwise it's type would be p2m_invalid or p2m_mmio_dm?
>>
>> Yes (to the 1st question), it kind of is.
>>
>>> It did seem to me the other checks in this function already assume
>>> that by having a valid type the entry is present.
>>
>> Except for the code above, where we decided to play safe. AT the very least
>> if you drop such a check, please say a justifying word in the description.
> 
> I've added:
> 
> "As part of the fix r/o MMIO accesses are now handled by
> handle_mmio_with_translation(), re-using the same logic that was used
> for other read-only types part of p2m_is_discard_write().  The page
> present check is dropped as type p2m_mmio_direct must have the
> present bit set in the PTE."
> 
> Let me know if you think that's enough.

That's fine; it's even more verbose than I was hoping for.

Independently (i.e. not for this patch) we may want to actually assert
that npfec.present is set for P2M types where we demand that to always
be the case. (I wouldn't be too surprised if we actually found such an
assertion to trigger.)

>>>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
>>>> p2m_mmio_direct.
>>>
>>> But that won't go into hvm_hap_nested_page_fault() when using
>>> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
>>> mapped as p2m_mmio_direct)?
>>>
>>> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
>>> differently?
>>
>> All true as long as things work as expected (potentially including the guest
>> also behaving as expected). Also this was explicitly only an example I could
>> readily think of. I'm simply wary of handle_mmio_with_translation() now
>> getting things to handle it's not meant to ever see.
> 
> How was access to MMIO r/o regions supposed to be handled before
> 33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
> added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
> (~2010), yet I can't figure out how writes would be handled back then
> that didn't result in a p2m fault and crashing of the domain.

Was that handled at all before said change? mmio_ro_do_page_fault() was
(and still is) invoked for the hardware domain only, and quite likely
the need for handling (discarding) writes for PVHv1 had been overlooked
until someone was hit by the lack thereof.

> I'm happy to look at other ways to handling this, but given there's
> current logic for handling accesses to read-only regions in
> hvm_hap_nested_page_fault() I think re-using that was the best way to
> also handle accesses to MMIO read-only regions.
> 
> Arguably it would already be the case that for other reasons Xen would
> need to emulate an instruction that accesses a read-only MMIO region?

Aiui hvm_translate_get_page() will yield HVMTRANS_bad_gfn_to_mfn for
p2m_mmio_direct (after all, "direct" means we expect no emulation is
needed; while arguably wrong for the introspection case, I'm not sure
that and pass-through actually go together). Hence it's down to
hvmemul_linear_mmio_access() -> hvmemul_phys_mmio_access() ->
hvmemul_do_mmio_buffer() -> hvmemul_do_io_buffer() -> hvmemul_do_io(),
which means that if hvm_io_intercept() can't handle it, the access
will be forwarded to the responsible DM, or be "processed" by the
internal null handler.

Given this, perhaps what you do is actually fine. At the same time
note how several functions in hvm/emulate.c simply fail upon
encountering p2m_mmio_direct. These are all REP handlers though, so
the main emulator would then try emulating the insn the non-REP way.

Jan

