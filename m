Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75674B1C43B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 12:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071572.1435002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbLI-0000XY-Ft; Wed, 06 Aug 2025 10:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071572.1435002; Wed, 06 Aug 2025 10:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbLI-0000VN-C2; Wed, 06 Aug 2025 10:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1071572;
 Wed, 06 Aug 2025 10:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujbLH-0000VF-2S
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 10:25:55 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bad54a15-72af-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 12:25:52 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso6906581a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 03:25:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a396fsm1081664066b.42.2025.08.06.03.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 03:25:51 -0700 (PDT)
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
X-Inumbo-ID: bad54a15-72af-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754475952; x=1755080752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6sRR8qlD19/E5H9/tVm4PMDZYiUIYpV9uqZ+dLnm1RY=;
        b=Z2TXsTF0ToXPsGWNAOxppwdEUwgf9at2NQnDaV6Vdm59fnN4vM4R759DK3hNnZWO0d
         BDUK1shNPMdbKeUPN1gGfmyh+3Jet1KwWegi+Ivcdte7aOwy9u+/aN20LPtTt8FmbcW/
         JclVcjml3BBjbaFrHAJsCGFcsQfrfsKmCoY9fe2x5jGUMIN3bSdbf8NzUyjxUoJZXyvn
         u9viP+jiZFgH7jp63cMzsHhAAGNOWjXzj2F7LN79Pt51vdEo91u6+/KFTlv0cHoi+aLc
         3FF2XJdeTTc5hH1dPJr3Qr7KQ43VGigmRSg6mCGkUW57WOfH1BI12CYM2Ap1EHLQ1huM
         KaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754475952; x=1755080752;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sRR8qlD19/E5H9/tVm4PMDZYiUIYpV9uqZ+dLnm1RY=;
        b=q7vIzjYwVhrnbf/D+ZOukvZlmt9Ujlj/ShldfHnlQNOLwwC5ogT4W6Kl1hrqclHFkD
         ltdwS2n1VNOcayXDLyC0dBegt5671hXW3n1atfpdsowGcthqovIcebr1/fJnQXzs6XZf
         4fGN+8og/41rqfqy1f3rnCyVZAYhEN+d5wLn8IWQA/m8gFsdP1iVg5n4nsBYRonKFcDj
         fTHvR1hh4zhp6sjJbS5/DYG09wpCnYnOC5qkAx0Y8JVJIDyCU8rQY7PQQdTDbqVT/cKM
         Md3lOuYNrjaLlsfaLHJkUL83wasK+qaj83DC9fW4i3dA08Z6HKtXSEi+1OQj8CKcqUCn
         Clvg==
X-Forwarded-Encrypted: i=1; AJvYcCXm5IdG63HtBeqbX8VSHm64D+0tEXmqFJ17taMskWToJWBA3IKFSX2JgXZ4D6RyO6Vx1uS0Ipn8KWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUSxkalmJsaD2frspEcNAHGJVyhGvSvLNmIrQDRCbHy1PK2jVg
	JcTACXzcbsH7Ai+6l5zGPE7KEPF5K3MWArj2OAdBLfiGcrZAYfXRx1d8AvvCQokWlosYGfD4NZQ
	5D1U=
X-Gm-Gg: ASbGncvmGIiuUG+qCNpdsveXAe1XDWT76djRTmZWqcWWVdpFjtiq9d0/FMFsDK88b8R
	8f1ue/X3acOH3HbZab+4HZGnL1lo9mXTE6zOmgWgy47W/AZvgclVMRKonHtxi0dytVAkYgdNy+F
	xfgBuWOKedAS6DcZiTTzimrHgGuBjQ0lYahadSNv/NsmWXDlOoWEUEMkKdtyH6nQ0OWASgnlRGj
	d3nvFoXDMmJcmNn2SyJ4Ma2qP1wXu4cyYfErYT+LUxqROaUMuSYyhceE+jhEDJ7k/YFIYBOLxYX
	Dehvm9iEdR5OMYJfTz9nahntw2tEPlf6MjF0eESDjhozvG4JJYFSqDWblZn287G4woz30XfHzpc
	mB8gM4PLHTtyKATx6QVkmVBpJ7Aa2ufjoAxUwbwyZg9mr8ubAUthx6FXHRsGiWeS12OmWqcHMKc
	FwMQK7ILE=
X-Google-Smtp-Source: AGHT+IGA1fX1kRYo6jou0nmmgTbqUtrg+rIMCPegBt5edbHHXG3uthh1/r8WLW31/EYD2RYXIJ8rDQ==
X-Received: by 2002:a17:906:6a14:b0:ae9:c2b9:7eba with SMTP id a640c23a62f3a-af992aab7a3mr178065866b.24.1754475952183;
        Wed, 06 Aug 2025 03:25:52 -0700 (PDT)
Message-ID: <18c28180-c0ff-4b54-a964-e8ab753014ea@suse.com>
Date: Wed, 6 Aug 2025 12:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] x86/mm: adjust loop in arch_init_memory() to
 iterate over the PDX space
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-9-roger.pau@citrix.com>
 <31691bf7-94bf-4f73-b04c-a32f86bb0e37@suse.com>
 <aJIi6wrNZck1DSU_@macbook.local>
 <68da529e-7fd7-4ca5-b6ef-4c1f95423246@suse.com>
Content-Language: en-US
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
In-Reply-To: <68da529e-7fd7-4ca5-b6ef-4c1f95423246@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2025 10:11, Jan Beulich wrote:
> On 05.08.2025 17:27, Roger Pau Monné wrote:
>> On Tue, Aug 05, 2025 at 02:38:38PM +0200, Jan Beulich wrote:
>>> On 05.08.2025 11:52, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -275,7 +275,7 @@ static void __init assign_io_page(struct page_info *page)
>>>>  
>>>>  void __init arch_init_memory(void)
>>>>  {
>>>> -    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
>>>> +    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn, pdx;
>>>>  
>>>>      /*
>>>>       * Basic guest-accessible flags:
>>>> @@ -328,9 +328,20 @@ void __init arch_init_memory(void)
>>>>              destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
>>>>                                   (unsigned long)mfn_to_virt(ioend_pfn));
>>>>  
>>>> -        /* Mark as I/O up to next RAM region. */
>>>> -        for ( ; pfn < rstart_pfn; pfn++ )
>>>> +        /*
>>>> +         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
>>>> +         * skip holes which would always fail the mfn_valid() check.
>>>> +         *
>>>> +         * pfn_to_pdx() requires a valid (iow: RAM) PFN to convert to PDX,
>>>> +         * hence provide pfn - 1, which is the tailing PFN from the last RAM
>>>> +         * range, or pdx 0 if the input pfn is 0.
>>>> +         */
>>>> +        for ( pdx = pfn ? pfn_to_pdx(pfn - 1) + 1 : 0;
>>>> +              pdx < pfn_to_pdx(rstart_pfn);
>>>> +              pdx++ )
>>>>          {
>>>> +            pfn = pdx_to_pfn(pdx);
>>>> +
>>>>              if ( !mfn_valid(_mfn(pfn)) )
>>>>                  continue;
>>>>  
>>>
>>> As much as I would have liked to ack this, I fear there's another caveat here:
>>> At the top of the loop we check not only for RAM, but also for UNUSABLE. The
>>> latter, like RAM, shouldn't be marked I/O, but we also can't use PFN <-> PDX
>>> transformations on any such page.
>>
>> Right you are.  I'm not sure however why we do this - won't we want
>> the mappings of UNUSABLE regions also be removed from the Xen
>> page-tables? (but not marked as IO)
> 
> Yes, I think this is a flaw in current code. Perhaps it was (wrongly) assumed
> that no UNUSABLE regions would ever exist this low in a memory map? Imo we want
> to deal with this in two steps - first sort the UNUSABLE issue, then improve
> the dealing with what is passed to assign_io_page().
> 
> While there we may also want to find a way to tie together the 16Mb boundary
> checks - the 16UL isn't properly connected to the BOOTSTRAP_MAP_BASE definition
> in setup.c. Yet then: Am I overlooking something, or is the 16Mb boundary not
> really special anymore? I.e. could e.g. BOOTSTRAP_MAP_BASE perhaps be moved (at
> least in principle), either almost arbitrarily up (within the low 4Gb), or down
> as much as to the 2Mb boundary? The relevant aspect here would be that the
> comment saying "the statically-initialised 1-16MB mapping area" looks to be
> stale, as of 7cd7f2f5e116 ("x86/boot: Remove the preconstructed low 16M
> superpage mappings"). If there are excess mappings to worry about, those may
> nowadays well live above the 16Mb boundary (because of it being 2Mb mappings
> that head.S inserts into l2_directmap[]).

Hmm, extending this to beyond 16M collides with mappings done by acpi_dmar_init(),
erst_init(), and acpi_hest_init(). Luckily efi_init_memory() runs only afterwards.
While I guess I could limit this to the space 2M mappings were done for in head.S,
theoretically there could still be a collision afterwards. So I think we need to
either somehow exclude such mappings (might end up fragile), or stop (ab)using
the directmap there. Thoughts?

Jan

