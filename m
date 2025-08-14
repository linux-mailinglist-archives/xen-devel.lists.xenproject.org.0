Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4919B25F7E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081111.1441238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTey-0004nf-4x; Thu, 14 Aug 2025 08:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081111.1441238; Thu, 14 Aug 2025 08:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTey-0004mF-1g; Thu, 14 Aug 2025 08:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1081111;
 Thu, 14 Aug 2025 08:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umTex-0004m7-Cs
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:50:07 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd53cdb-78eb-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:50:06 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso106862166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 01:50:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9f4796e23sm818405366b.26.2025.08.14.01.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 01:50:05 -0700 (PDT)
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
X-Inumbo-ID: acd53cdb-78eb-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755161405; x=1755766205; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Tg2c+tzOy5RWBUnwp3v848SerrjlYPioh8RYMm/iM4=;
        b=AWDv7rWxLCqpK9fxdzjqSKNwZz43XqC7DD/oV/CVcc8FXrpEBS3RRA26JBO6Y1y+Zf
         ZOwb2D5L6XxfW3d3juThyvkH6k2ZPdvX2AhfIXxR7HOoMAavSbk+xHyPEgF5eJzjhBU/
         Dqc0UGrpOhbOO4ZNcclbzhMl5ebBl6ZyMdOwCOHw4ObmS9vLY5wYPeMxFu+FbDjFFAFU
         mrSx0XTvuR74AkIAJE4lx99s+APIiZovfg5DNCtLIcDhmfPsi2+ncgwHCqbIBVXY1dCC
         BxmYZKFOlTRiRrCdHC9u0wfbpjnfbIo8hFFkYZvUhjO7bFhFX0/TrZBIMdAZPeLmTmPv
         jPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161405; x=1755766205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Tg2c+tzOy5RWBUnwp3v848SerrjlYPioh8RYMm/iM4=;
        b=thLkspJZZWQ8lpWxEAVER5ZiK6GWZ+NsH/v442PxDsAKQghdlwWBfptvcuMy3sRl8k
         EW51dIbyHgAPbkbkkfnwRRrW2x1OEouotghfrrb2jQRRQxUHEsImwBi1QEID5GphTWEu
         HXU9/uWYkUV5BSYe2b1rNYele7c6+e7hC5Ea7pQzOHyNh3QMCr3RhxHwjqd/PzxPXgRe
         idUXdUwBo8geFVAhizEt1nCvYJL2MOTTZoZCa4+37aM4HLQyOb1FBllLA4O8UWVY3S6L
         Kl204owjoFZv7NqFwGz7STtupK5sGYiVgB7x4qH60tNmE84elqcNw4Prbc3tNz+OA3/d
         DX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYMHhYMisnyM/SO6IvdfOZaOtw3mfOKAFYayDUKACAaxo/KWqKzYiivq+zMOnC6OfmXqoz6yd6XOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt6GbfgfOC+G0BhHC0xcvMqDz4OGy30ObRTWvdPAYEY6ix3b2h
	huvtI3USMvsKtZTUIMTKbUTTvl+Z9aEHrGHl/06VUwA+vGcQ4Z7AjNDdnbOL3sEsSU1+Ctfj8rf
	xgPQ=
X-Gm-Gg: ASbGncscKNXgdodKxBy+KOebll/uQmdLKXq0hKOkuJXOyWqB8/VHzPuXvLHQLHLMm0I
	tVITDAGHO7IBzDZUPvOrzBFVE9aQO5vSO/3BZbyQAcB1M+qrqI/NKdeRfrH21lw+Aed7KcmnQ+e
	tdGNL5gNWJvuaX9S5/BtYdwQ3NVGUQjcG4z5Gg9XR6vg8z5uJPi0gm3BRdVWGjOjh0ahmcEKDiL
	HHhvnAYQlsrKo6sG5IdFztyFLe/c5grDuQwgV7PWSD1U2zVbzE+ZoUrLJ7O8iZ6/fb0CK5xCbAK
	Yus4WEo2oqSOX/K/S1GrryFzFXwM/+mowbj7AyCq3RAkpxRwMY1YIUZM789tjnfCb8zniXnl/hA
	oR6l+GeMsX22eCtU4DNtp5MBiS6XUuK3hPj5vh8ayk5KQhCi+l3FAvgHIS7dn7xLfM01wHgadc0
	+XS7MLQuM=
X-Google-Smtp-Source: AGHT+IEyIQhSYyK8otuy4jTe43ySBCyJXOMuP+b8EqvmkEMGxSYcmS29tkKUANuR9Sh1QaMME9gySg==
X-Received: by 2002:a17:907:9815:b0:af9:3ef6:86f4 with SMTP id a640c23a62f3a-afcb981f533mr214724966b.20.1755161405496;
        Thu, 14 Aug 2025 01:50:05 -0700 (PDT)
Message-ID: <9d4623d1-d1ce-4661-b07a-ad8d5ea478bc@suse.com>
Date: Thu, 14 Aug 2025 10:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] x86/traps: Drop incorrect BUILD_BUG_ON() and
 comment in load_system_tables()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-4-andrew.cooper3@citrix.com>
 <f8cfb9c0-f505-452d-b18e-801beea69d1d@suse.com>
 <5aadadb9-65e2-4f30-bac5-a2b3a2f4a29e@citrix.com>
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
In-Reply-To: <5aadadb9-65e2-4f30-bac5-a2b3a2f4a29e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.08.2025 11:40, Andrew Cooper wrote:
> On 12/08/2025 9:11 am, Jan Beulich wrote:
>> On 08.08.2025 22:22, Andrew Cooper wrote:
>>> This was added erroneously by me.
>>>
>>> Hardware task switching does demand a TSS of at least 0x67 bytes, but that's
>>> not relevant in 64bit, and not relevant for Xen since commit
>>> 5d1181a5ea5e ("xen: Remove x86_32 build target.") in 2012.
>>>
>>> We already load a 0-length TSS in early_traps_init() demonstrating that it's
>>> possible.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/cpu/common.c | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>>> index f6ec5c9df522..cdc41248d4e9 100644
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -936,8 +936,6 @@ void load_system_tables(void)
>>>  		wrmsrl(MSR_ISST, (unsigned long)ist_ssp);
>>>  	}
>>>  
>>> -	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
>>> -
>>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>>>  	if ( IS_ENABLED(CONFIG_PV32) )
>> Well, the comment is wrong. Whether the BUILD_BUG_ON() itself is also wrong
>> depends on our intentions with the structure. Don't we need it to be that
>> size for everything (incl I/O bitmap) to work correctly elsewhere?
> 
> We don't use the IO bitmap.  We've talked about it a few times, but
> never got it sorted.
> 
> Xen's TSS could be as short as 0x37 (covering IST3) and still work
> correctly and safely (as there's no task switching).

Then shouldn't we have a BUILD_BUG_ON(sizeof(*tss) <= 0x37) here? Hmm,
arguably that get pretty close to useless, though, so
Acked-by: Jan Beulich <jbeulich@suse.com>

> A failure to read tss->iopb is the same as a failure to read the bitmap
> itself.  In fact, it's probably marginally faster for users of
> IOBMP_INVALID_OFFSET as it fails one step earlier.

(Provided there are no errata lurking anywhere.)

Jan

