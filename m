Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B8A88701
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950688.1346930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Lfn-0007Qr-77; Mon, 14 Apr 2025 15:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950688.1346930; Mon, 14 Apr 2025 15:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Lfn-0007OE-41; Mon, 14 Apr 2025 15:24:35 +0000
Received: by outflank-mailman (input) for mailman id 950688;
 Mon, 14 Apr 2025 15:24:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4Lfm-0007O7-4g
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:24:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 906d2c63-1944-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:24:32 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so36855525e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:24:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ed15caa5asm6250250f8f.20.2025.04.14.08.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 08:24:31 -0700 (PDT)
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
X-Inumbo-ID: 906d2c63-1944-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744644271; x=1745249071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S2Bg57abRsYJnw7FLVHBRr+Ur9F4YGxcQQ1uE7JnfJ0=;
        b=SMSsQKnwxct9hbIaZVoPkLS0FvxwzurTPXYEo/qfyuyg1LLLKbgpzok5LehlPa9u2q
         YDg6rUXRIZRPwMb+T9OdgBlQgcoi/7MEDh2Ra/zhGZRaOK7drrI5rWVuFuPB0kryD9OQ
         dDoLszIfjmAG4lU6C5SsBWBLxYmiE+E+KAXxIcp/Mxpe7TmDSS4ia1JQrN3fR9h15v09
         0D8XJKh8pqY24oys6vSXhnM/x70jbFIMWTPB1yGYUBEJL4J9zIb+o0+/3B2tvVW0iMAQ
         EjOAJEXDG8tdxKdXiaoHrq4u/FxsGBZ2xZ38dK37HOqjG8MesQ2LM2j8ee8oBjTyvMlk
         bEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644271; x=1745249071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2Bg57abRsYJnw7FLVHBRr+Ur9F4YGxcQQ1uE7JnfJ0=;
        b=R1aL+Z/DBVcPgd9DPSQmXUV6PjLarNfEqgpm/8E/Z5OO4gEo56Btj/PHkFVup/Xna3
         ega3sxfRDhYV6w9MW+XRSCn8whNlPleHnumY3kysedp0vtytDzQnaYw9xAi2c5oB+iFB
         C0vEJhRIxwmLbi8pSTWuP6PR5W796YPTS3bcscxnv18O3XgKrJt5LsI8dxU0ryHDN/GU
         i+ZrloZxYeRbP2OI7wuQaepM384P5dYOa2U83IGieuXf63C+yxUYLxJ5wde/s0MlKsh+
         ChAtqHRNojJHjBKQhCUHtDLbQXP+YC0wO3K4QVZsQ4bPQxYrUAKsPPr2eM4kir4dNBYB
         8pcg==
X-Forwarded-Encrypted: i=1; AJvYcCXtRGmOsdInrCiKOYTQ7XPcysjXX8pMMO1Jip76LfdLG7iHSOzQd/LofHlQcgnhjaqzI1KIPo1OOgQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5WwC2q4YRA/TfwAVTN0K9YzMD5LDLlrOMjLuRdQiWeRZECSmH
	s2tdlwgYX/URw5HF9OKil7GSl6dudexKc2N+0x5Vld58a9onaRcOE3wSDhz93g==
X-Gm-Gg: ASbGnctNhPJUpioHIIyXGBekeq8OhMEHrzuF/tR5EGKImq+b7REt0ArBvJQknlZZ1p5
	W3wlACkkjqzAffxjCuIZmgx1FQ+CFPuFmIo6YflFoC4V3TfyE4eMZgTbFhfiKtJFJHftONYNomK
	KbczKeC+GL54fWOnqjde4cKnLngQXEpZ1A9VLPeoUmpPo6XFKspMYihmRwqQkN8IvjcOCHrWfFI
	RocCfENRuiaDK5m/VCGJ+wv+2cp2XNpMF7AP8D1Khz/pWjmfpMvWq8cgA2rzXq3HEiNlE3Iub90
	m8AhkC9iY2hQsHpVeTNb7AvNBAamqm0Dr+qA7CtygXru8ZzoV2yiRVGBeob9PJhLVYCBOIF14UE
	p/UazJ9ZppiZYDtdnmwXkRcWXjA==
X-Google-Smtp-Source: AGHT+IHGNNnRRFsa3MEG48WM2YS+EYBQL0LoEEYP6G9+eICGq/tjEa3/6Q8cS/PYwxeIq7zSE/4OCg==
X-Received: by 2002:a05:600c:8705:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-43f3a93d9e7mr120840225e9.12.1744644271423;
        Mon, 14 Apr 2025 08:24:31 -0700 (PDT)
Message-ID: <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
Date: Mon, 14 Apr 2025 17:24:32 +0200
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
In-Reply-To: <Z_0TXKMe6tfrYR9T@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.04.2025 15:53, Roger Pau Monné wrote:
> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
>> On 11.04.2025 12:54, Roger Pau Monne wrote:
>>> ---
>>>  xen/arch/x86/hvm/emulate.c             | 47 +-------------
>>>  xen/arch/x86/hvm/hvm.c                 | 89 +++++++++++++++++++++++---
>>
>> It's quite a bit of rather special code you add to this catch-all file. How
>> about introducing a small new one, e.g. mmio.c (to later maybe become home
>> to some further stuff)?
> 
> Yes, I didn't find any suitable place, I was also considering
> hvm/io.c or hvm/intercept.c, but none looked very good TBH.
> 
> The main benefit of placing it in hvm.c is that the functions can all
> be static and confined to hvm.c as it's only user.

I understand that. Still, if we went by that criteria, we'd best put all of
our code in a single file ;-)

>>> +static int cf_check subpage_mmio_write(
>>> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    p2m_type_t t;
>>> +    mfn_t mfn = get_gfn_query(d, addr, &t);
>>> +
>>> +    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
>>> +    {
>>> +        put_gfn(d, addr);
>>> +        return X86EMUL_RETRY;
>>> +    }
>>> +
>>> +    subpage_mmio_write_emulate(mfn, PAGE_OFFSET(addr), data, len);
>>> +
>>> +    put_gfn(d, addr);
>>> +    return X86EMUL_OKAY;
>>> +}
>>
>> Unlike the read path this doesn't return RETRY when subpage_mmio_find_page()
>> fails (indicating something must have changed after "accept" said yes).
> 
> Yeah, I've noticed this, but didn't feel like modifying
> subpage_mmio_write_emulate() for this.  The list of partial r/o MMIO
> pages cannot change after system boot, so accept returning yes and not
> finding a page here would likely warrant an ASSERT_UNRECHABLE().
> 
> Would you like me to modify subpage_mmio_write_emulate to make it
> return an error code?

I'd be happy with the two paths being in sync in whichever way that's
achieved. The argument you give equally holds for the read path, after
all.

>>> @@ -1981,7 +2056,9 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>>>       */
>>>      if ( (p2mt == p2m_mmio_dm) ||
>>>           (npfec.write_access &&
>>> -          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
>>> +          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
>>> +           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
>>> +           (p2mt == p2m_mmio_direct))) )
>>>      {
>>>          if ( !handle_mmio_with_translation(gla, gfn, npfec) )
>>>              hvm_inject_hw_exception(X86_EXC_GP, 0);
>>
>> Aren't we handing too many things to handle_mmio_with_translation() this
>> way? At the very least you're losing ...
>>
>>> @@ -2033,14 +2110,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>>>          goto out_put_gfn;
>>>      }
>>>  
>>> -    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
>>
>> ... the .present check.
> 
> Isn't the p2mt == p2m_mmio_direct check already ensuring the entry is
> present?  Otherwise it's type would be p2m_invalid or p2m_mmio_dm?

Yes (to the 1st question), it kind of is.

> It did seem to me the other checks in this function already assume
> that by having a valid type the entry is present.

Except for the code above, where we decided to play safe. AT the very least
if you drop such a check, please say a justifying word in the description.

>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
>> p2m_mmio_direct.
> 
> But that won't go into hvm_hap_nested_page_fault() when using
> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
> mapped as p2m_mmio_direct)?
> 
> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
> differently?

All true as long as things work as expected (potentially including the guest
also behaving as expected). Also this was explicitly only an example I could
readily think of. I'm simply wary of handle_mmio_with_translation() now
getting things to handle it's not meant to ever see.

Jan

