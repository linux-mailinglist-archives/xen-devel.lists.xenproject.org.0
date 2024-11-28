Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15BB9DB764
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 13:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845431.1260848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGdRg-0004o9-LP; Thu, 28 Nov 2024 12:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845431.1260848; Thu, 28 Nov 2024 12:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGdRg-0004mR-I7; Thu, 28 Nov 2024 12:16:32 +0000
Received: by outflank-mailman (input) for mailman id 845431;
 Thu, 28 Nov 2024 12:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGdRe-0004mK-Gb
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 12:16:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96345cd1-ad82-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 13:16:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43494a20379so6821585e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 04:16:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1496058f8f.11.2024.11.28.04.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 04:16:24 -0800 (PST)
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
X-Inumbo-ID: 96345cd1-ad82-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk2MzQ1Y2QxLWFkODItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzk2MTg1LjI3ODIzOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732796184; x=1733400984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8/RGRX8/A0dq26pitlHAhxpfBag9OTt01pkq8ZW6dZI=;
        b=ZxPe+i8y/ii96ONJBoTM6WRH1idgNi9VfclvOvmNRVzgWaewg33KPJyJEJnxlVoqcv
         ZoeVHg+S6PgVJN602ZkZ9/KAUAgZ1b0QcUZl+IhWapjhuwMQ0u6kbVpVOwckQYYoVe6Y
         cRnt7EvwirJvkBnMupO1F4U+JXJM4arPXwzNCoJKcl5MNKQ6MV137Z8QJ6dy6hacejIH
         hXS9v8h1G0Vei3sCRXyKQuh6NvD09RpjX66wqya6+wpUAv88JxSXvLiSSl7Wh0mIvF86
         g+xjyVhJg9shu18+PiP6x56DdUi6fyPqcQ96lnh6ZJ6fZYWowoNojWXorEGVkENlvP3o
         OA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796184; x=1733400984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/RGRX8/A0dq26pitlHAhxpfBag9OTt01pkq8ZW6dZI=;
        b=QbRFeAUYWvfcvAbAx8d+BQk/piGx8zkmICLvMYw1q2ckGATcm4VUe1BhIAzCN1Wgbn
         1fOyU9o2xiIRnQ1elgF1sBarXoolrp9apZrcj3cPounzb9pEIlNrKnP4A5xZiv39iJTT
         70F0j56BGym82ent580h7W3sPa/v/ALlPafJBiGZYMH9/mEDSXpLoMnmpptWqtCcgGtr
         Zft3eoq2VUjWlTxuP78Ueu/8EXEDAok059vJO8BCRqU/rifOfpQpLoEzoDS3oMx+pSYt
         1mtFavB+2pQCO4vdjchcCFFa67qSHj0fNHZaZX973tZ2VpYag3Qa8DkC5I6b+9UGvrcX
         TCPw==
X-Forwarded-Encrypted: i=1; AJvYcCUYyrLSaJ0GK0D5yI9ZtS9+f++hLYmC5fn1jEx3MOwqXGMIfUylfnR672cIK8H8l1VbEzU6g2N4MLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFfzt6+TZF5x79OLtM3QAmTuP+feW0VgyYUlNiAPmsWgJMQwIP
	xxOy5GL4uNkg1VffxaD0WIGX/bNtZH8MMKZzn71P6F+rET3u6q5oCou88eiZ1A==
X-Gm-Gg: ASbGncvoouLo+9XdS82x1V3L1E0H5V4XDzdE/AX74cmc54Nm+L8iEQ9yiEgBkPmn7SU
	v78SKqVNsI+DROb8MF5S2Flij52XI7LpdnbtkPsM4ADU9q9C6l2pZeSSm5+13J3mX8fr1hdgfhN
	e6T4Rf/I5hgz73j2G3/bmVH2V5JrnDiOCyo4B9/fWZ+WtkXaK5YatQNlYY6wb53G5iQgKRDVyko
	nrxz5HtJOq9wJQH+JYlSzwZ6lSQQ8dcf0qEBGTwaIekRKvD/sldsgoToKWPCJnr5OTTHlIQLqDi
	aOFHxPordqeLaw34ZQfn9hJg73mVgM1No0E=
X-Google-Smtp-Source: AGHT+IF20xe22l2tPAsNN1VCalYNfXsbxBWCDo/LXcE99ZzRUcYl+c7IXSwPX/2rpCwaN/dgzKbj6A==
X-Received: by 2002:a05:600c:458d:b0:433:c463:62dd with SMTP id 5b1f17b1804b1-434a9e0e5femr61192575e9.27.1732796184340;
        Thu, 28 Nov 2024 04:16:24 -0800 (PST)
Message-ID: <f587c517-aeb0-46bb-8f44-9c98c4417ec8@suse.com>
Date: Thu, 28 Nov 2024 13:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-2-andrew.cooper3@citrix.com>
 <e576e161-5054-40d2-af02-6f32ef636782@suse.com>
 <8a3a3daa-16f6-4488-ae46-224379033c54@citrix.com>
 <b97f13ad-f3d4-4e92-b3e6-5522badbad5b@suse.com>
 <e8bf67fb-fc58-42cd-81dd-b11e041e82b2@citrix.com>
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
In-Reply-To: <e8bf67fb-fc58-42cd-81dd-b11e041e82b2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2024 12:57, Andrew Cooper wrote:
> On 28/11/2024 11:50 am, Jan Beulich wrote:
>> On 28.11.2024 12:10, Andrew Cooper wrote:
>>> On 28/11/2024 10:31 am, Jan Beulich wrote:
>>>> On 28.11.2024 01:47, Andrew Cooper wrote:
>>>>> Xen currently presents APIC_ESR to guests as a simple read/write register.
>>>>>
>>>>> This is incorrect.  The SDM states:
>>>>>
>>>>>   The ESR is a write/read register. Before attempt to read from the ESR,
>>>>>   software should first write to it. (The value written does not affect the
>>>>>   values read subsequently; only zero may be written in x2APIC mode.) This
>>>>>   write clears any previously logged errors and updates the ESR with any
>>>>>   errors detected since the last write to the ESR. This write also rearms the
>>>>>   APIC error interrupt triggering mechanism.
>>>>>
>>>>> Introduce a new pending_esr field in hvm_hw_lapic.  Update vlapic_error() to
>>>>> accumulate errors here, and extend vlapic_reg_write() to discard the written
>>>>> value, and instead transfer pending_esr into APIC_ESR.  Reads are still as
>>>>> before.
>>>>>
>>>>> Importantly, this means that guests no longer destroys the ESR value it's
>>>>> looking for in the LVTERR handler when following the SDM instructions.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> No Fixes: tag presumably because the issue had been there forever?
>>> Oh, I forgot to note that.
>>>
>>> I can't decide between forever, or since the introduction of the ESR
>>> support (so Xen 4.5 like XSA-462, and still basically forever).
>>>>> ---
>>>>> Slightly RFC.  This collides with Alejandro's patch which adds the apic_id
>>>>> field to hvm_hw_lapic too.  However, this is a far more obvious backport
>>>>> candidate.
>>>>>
>>>>> lapic_check_hidden() might in principle want to audit this field, but it's not
>>>>> clear what to check.  While prior Xen will never have produced it in the
>>>>> migration stream, Intel APIC-V will set APIC_ESR_ILLREGA above and beyond what
>>>>> Xen will currently emulate.
>>>> The ESR really is an 8-bit value (in a 32-bit register), so checking the
>>>> upper bits may be necessary.
>>> It is now, but it may not be in the future.
>>>
>>> My concern is that this value is generated by microcode, so we can't
>>> audit based on which reserved bits we think prior versions of Xen never set.
>>>
>>> I don't particularly care about a toolstack deciding to feed ~0 in
>>> here.  But, if any bit beyond 7 gets allocated in the future, then
>>> auditing the bottom byte would lead to a migration failure of what is in
>>> practice a correct value.
>> If a bit beyond zero got allocated, then it being set in an incoming stream
>> will, for an unaware Xen version, still be illegal. Such a guest simply can't
>> be migrated to a Xen version unaware of the bit. Once Xen becomes aware, the
>> auditing would (of course) also need adjustment.
> 
> That's the whole point.  It's not about Xen's awareness; it's what
> APIC-V/AVIC might do *in existing configurations* on future hardware
> without taking a VMExit.

How would you migrate such a guest to arbitrary other hardware, i.e.
potentially lacking support for that bit? If LVTERR triggering is as per
Roger's reading of the SDM, without knowing how many bits hardware
presently checks we couldn't guarantee correctness. Bits from 8 up being
reserved right now even leaves me wondering what happens on present
hardware when one of those top 24 bits is set.

> If there were no APIC-V support to begin with, this would be easy and
> auditing would be limited to SENDILL|RECVILL as those are the only two
> bits Xen knows about.

Limiting to just these two bits would be wrong; future Xen might make
use of more of them, and a guest should then still migrate correctly
(just that, after this initial being set of extra bits, it would never
again see any of them becoming set).

Jan

