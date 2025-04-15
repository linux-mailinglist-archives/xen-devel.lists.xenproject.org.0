Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33445A89858
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 11:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952400.1347851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cnQ-0002R6-Hq; Tue, 15 Apr 2025 09:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952400.1347851; Tue, 15 Apr 2025 09:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cnQ-0002PR-Eq; Tue, 15 Apr 2025 09:41:36 +0000
Received: by outflank-mailman (input) for mailman id 952400;
 Tue, 15 Apr 2025 09:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4cnO-0002PL-CH
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 09:41:34 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce5849bf-19dd-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 11:41:29 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so44380785e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 02:41:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f207aed49sm202751635e9.34.2025.04.15.02.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:41:28 -0700 (PDT)
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
X-Inumbo-ID: ce5849bf-19dd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744710088; x=1745314888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3CjwdWudMBWN99I+63GmUOAeSL/JTI8q0sSUCNDFfg0=;
        b=QpWNAJeEZcSq2lIl+rMCIAPXBYlv4ViirmZGWE/x4XkJz0eZKVFQJqObbVlnHb2HLs
         87zn3K8kuglGslhdljKFxFyRsgPR2KkLXvMZ6s8kUOWi8d+qLUamukc54vPiriKksx01
         Att/r0xTvE1cg/HDwVrrNdpLt9DePBVVAgef7BLCq0sahbxKCyPBxkALUHNRVy+1lkVi
         rKOTCifRJuAC3NWu72VblIV2GH4xagLUCy9nrK2bsZABDeG0BReoy4Poj0OgH6AFxcRV
         jTgLYyiA0YsGXKJupNp/zKCrETl0Xc0yfuYjGFuvhFBBDyi5mn14nVwGbdo+14JIixe5
         aemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710088; x=1745314888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CjwdWudMBWN99I+63GmUOAeSL/JTI8q0sSUCNDFfg0=;
        b=ppIyWvgFp49DBIlXZiKKa2vvBUN8I3CWrGpKcegnvSdU6G9BFxhfFlg9npmzKejaCj
         wDPuS0Y/B68SDezkmkPUGQhG2K/K5K6YMM2YD5WJs14QnWcxJ7fajdEs4Kydq52zyrCz
         Re5SW9GA+9jZi8tUoN3tnO000sw2JUidcWkf4d3VrHN3NscmEwAyEZW6ktB6K3wAyUOl
         rGUuFTN23s8hDKMSy17ucLU+SKQ4sr7c8GP+wEcVdsrCq3Wx/XCp0bNJkkOHsVAn80vE
         KA9JJJacbV6XExkb0Fq2Z+rMXlEGdc1Brxw+OwPqRQs5We1KzLIvCX+3JFozXDr91vt+
         1M6A==
X-Forwarded-Encrypted: i=1; AJvYcCUHBoUnJK+k2dGUdTlxGtsiiGUIVaeptaoEjgTEVt028NoMEgZJFQLlkPvWd31lMf1S2/OTPqA8rcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/GDSAyYqY5uRw1GM7wgVwEgObQrTSE38fQm2BPJJIkoRG4Zwr
	hX77XNmswNCYYvDI1d3Tm22bOJSXZqFCvYRh7Gx2MohXz2SEEyDlbjNqMlfYCA==
X-Gm-Gg: ASbGncv0cHnv8QcN1BwgIv7QdlYy9Nn7RQzJk5AGR0xt0jCaQt01L/W53jq4POAMhsx
	O8PIIvHbPKePgx+S3/qPk0tVEqL/Y9sH85t26Yg2v9r3m8U17svBZpA9KmL1WzD2dlWRKvVFsGj
	L5TOxHqZwCjGLxoKiK2FOYRpvIQxMIwT7qebl+bog+YeAq29gbStbDwJRWmV07ObRX1gswkP+1H
	ms4z3f4ZQ8AofDsAsZ3ZJbcZbor/cjBK4QhWsUGEhNX7ujNb+ka0JjeNdZ3Vz4C5Wr1HJUPxEyW
	w7xltv6RtPfPzH3aBGiETHXnrOP0X3oDoVwy98ZPuOW4QTj8l90lvD8+D9Ojo6ReCfb/X1pSAH2
	oOrk61+7r7oRg/RHp6bNaPUzr7Q==
X-Google-Smtp-Source: AGHT+IGfzInVEnAnkwYAdcl2cV+6fgiyX0HHHQCgYomXJMcNLL3KRh8ucGUzwIhaB30ZYw+ElJlrOQ==
X-Received: by 2002:a5d:6d8e:0:b0:390:e889:d1cf with SMTP id ffacd0b85a97d-39eaaebc66emr11148491f8f.37.1744710088372;
        Tue, 15 Apr 2025 02:41:28 -0700 (PDT)
Message-ID: <4dd5ada8-32e7-4b94-b2a4-51b20e09eb79@suse.com>
Date: Tue, 15 Apr 2025 11:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o MMIO
 pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
 <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
 <Z_4aBL7JhTv_oxWR@macbook.lan>
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
In-Reply-To: <Z_4aBL7JhTv_oxWR@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2025 10:34, Roger Pau Monné wrote:
> On Tue, Apr 15, 2025 at 09:32:37AM +0200, Jan Beulich wrote:
>> On 14.04.2025 18:13, Roger Pau Monné wrote:
>>> On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
>>>> On 14.04.2025 15:53, Roger Pau Monné wrote:
>>>>> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
>>>>>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
>>>>>> p2m_mmio_direct.
>>>>>
>>>>> But that won't go into hvm_hap_nested_page_fault() when using
>>>>> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
>>>>> mapped as p2m_mmio_direct)?
>>>>>
>>>>> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
>>>>> differently?
>>>>
>>>> All true as long as things work as expected (potentially including the guest
>>>> also behaving as expected). Also this was explicitly only an example I could
>>>> readily think of. I'm simply wary of handle_mmio_with_translation() now
>>>> getting things to handle it's not meant to ever see.
>>>
>>> How was access to MMIO r/o regions supposed to be handled before
>>> 33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
>>> added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
>>> (~2010), yet I can't figure out how writes would be handled back then
>>> that didn't result in a p2m fault and crashing of the domain.
>>
>> Was that handled at all before said change?
> 
> Not really AFAICT, hence me wondering how where write accesses to r/o
> MMIO regions supposed to be handled by (non-priv) domains.  Was the
> expectation that those writes trigger an p2m violation thus crashing
> the domain?

I think so, yes. Devices with such special areas weren't (aren't?) supposed
to be handed to DomU-s.

>> mmio_ro_do_page_fault() was
>> (and still is) invoked for the hardware domain only, and quite likely
>> the need for handling (discarding) writes for PVHv1 had been overlooked
>> until someone was hit by the lack thereof.
> 
> I see, I didn't realize r/o MMIO was only handled for PV hardware
> domains only.  I could arguably do the same for HVM in
> hvm_hap_nested_page_fault().
> 
> Not sure whether the subpage stuff is supposed to be functional for
> domains different than the hardware domain?  It seems to be available
> to the hanrdware domain only for PV guests, while for HVM is available
> for both PV and HVM domains:

DYM Dom0 and DomU here?

> is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, gla)
> 
> In hvm_hap_nested_page_fault().

See the three XHCI_SHARE_* modes. When it's XHCI_SHARE_ANY, even DomU-s
would require this handling. It looks like a mistake that we permit the
path to be taken for DomU-s even when the mode is XHCI_SHARE_HWDOM. It
also looks like a mistake that the PV path has remained Dom0-only, even
in the XHCI_SHARE_ANY case. Cc-ing Marek once again ...

>>> I'm happy to look at other ways to handling this, but given there's
>>> current logic for handling accesses to read-only regions in
>>> hvm_hap_nested_page_fault() I think re-using that was the best way to
>>> also handle accesses to MMIO read-only regions.
>>>
>>> Arguably it would already be the case that for other reasons Xen would
>>> need to emulate an instruction that accesses a read-only MMIO region?
>>
>> Aiui hvm_translate_get_page() will yield HVMTRANS_bad_gfn_to_mfn for
>> p2m_mmio_direct (after all, "direct" means we expect no emulation is
>> needed; while arguably wrong for the introspection case, I'm not sure
>> that and pass-through actually go together). Hence it's down to
>> hvmemul_linear_mmio_access() -> hvmemul_phys_mmio_access() ->
>> hvmemul_do_mmio_buffer() -> hvmemul_do_io_buffer() -> hvmemul_do_io(),
>> which means that if hvm_io_intercept() can't handle it, the access
>> will be forwarded to the responsible DM, or be "processed" by the
>> internal null handler.
>>
>> Given this, perhaps what you do is actually fine. At the same time
>> note how several functions in hvm/emulate.c simply fail upon
>> encountering p2m_mmio_direct. These are all REP handlers though, so
>> the main emulator would then try emulating the insn the non-REP way.
> 
> I'm open to alternative ways of handling such accesses, just used what
> seemed more natural in the context of hvm_hap_nested_page_fault().
> 
> Emulation of r/o MMIO accesses failing wouldn't be an issue from Xen's
> perspective, that would "just" result in the guest getting a #GP
> injected.

That's not the part I'm worried about. What worries me is that we open up
another (or better: we're widening a) way to hit the emulator in the first
place. (Plus, as said, the issue with the not really tidy P2M type system.)

> Would you like me to add some of your reasoning above to the commit
> message?

While I'd still be a little hesitant as to ack-ing of the result, I think
that's all I'm really asking for, yes.

Jan

