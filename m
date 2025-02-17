Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC2EA37D71
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 09:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889831.1298879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwoc-00043i-5i; Mon, 17 Feb 2025 08:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889831.1298879; Mon, 17 Feb 2025 08:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwoc-00040t-28; Mon, 17 Feb 2025 08:49:22 +0000
Received: by outflank-mailman (input) for mailman id 889831;
 Mon, 17 Feb 2025 08:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjwoa-0003tg-8P
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 08:49:20 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 130e9ae1-ed0c-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 09:49:19 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-abadccdfe5aso429013466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 00:49:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba4fc0c29sm75551366b.157.2025.02.17.00.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 00:49:17 -0800 (PST)
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
X-Inumbo-ID: 130e9ae1-ed0c-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739782158; x=1740386958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aUECwwFMNG2HN3M4nTVHD8oiY82J8vz2CC4oOznTguw=;
        b=eqfN02AAsTK+AL3NnOmQCzE7YA9K6ty2g1Z9/MpMZ/gs7aVIsQVV4pESW7aMk3T6Oc
         U4iOW8+dd1M7fJ4IJtuBSlNzy+ffX2kYFU3oCav6TJATBkOBdaTEx6FCK2lA8mP2tIQk
         tXW9EzHMDkr7gXz+S3CcZhPyuMeDeVAHDPnHdOXX6iVz6cV+bIgalTgtiiz5sFIAJTmX
         MEuVPY/tgICiVBoK+tQDkLEmEiSBJq/RnR6ldnQo+Y+LVoRrEJhqoXfuT8mLSWJGEt+k
         o729mklm7NzkaANBp03Qts+LKt1yQOKWizWJWoPlCt1h3l5ztz592aT49w8OPeMe2WU+
         Mbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782158; x=1740386958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUECwwFMNG2HN3M4nTVHD8oiY82J8vz2CC4oOznTguw=;
        b=TOQx+PpmMLtWgL+osYoWetZKTZQrb8o88+ekOUIRNF4808Ail9KNdcoBexXeAE7nyI
         CQ/Cs2y5cAS6+Fz30N2V5GmVDSSbqqeFz+twWgRtDDEZ0WUogLPc+yrAzCtHdNL4uwLi
         csw1zWwS1XNmKO1rzoFqGgWdo5fBqov56jFO+eEZ70XDli2Iiz1cK4TWb/ROfMH7PZlK
         NkzEh8M6BPYVt4+2RY1IU5KcGwRXy+iFkWCQnq5B0wujrlmjvVuvCSUDIOLQLq09bLmC
         j96YTALlJWVpYWMoApF6uER2N62Z4ZRyBXWSNoczhAVWE/9xCg20Qt1uWKxMKgFfIcM0
         ikLw==
X-Forwarded-Encrypted: i=1; AJvYcCWomWvfnS3dnZWRxmm4KmJSvkE0lvvs+ns7yEeSxXWm+zgJWMJRZ/geDVbdLRr49w6tuRWK6Ak++NY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCAArqdpMXfKf5T/y4lwMDhnLeOXGpRA5l+Yicwg3b63UrR6tV
	wucwynsL9s0sviTw7juwXI5pxiCYRyoI3RhlKULOiMBrbiZdFNbmoZZGbUQIUw==
X-Gm-Gg: ASbGncvn0f/DdnZ2XXgs3b28U8XJfr8Q0pX85Aa35CcYmDLiEa5XIExLK4syb6UZIGT
	vgc+ui0WM+XhyMg+oJ1FGoqwtVqFpTuFdc+BvYmGAWHmPVxaYfpySGDa8oYCyLaI352kuxHeAJP
	tnCu/iQwI47Pda1l+l+0SpM55ylFktDjGYiMQ0gf7sVeMX4rNu1g17LBPLrb2TZXwxvlx3pwEPP
	m2wY7EfQSeTnNJWYG8St1YZwPBGtlOZtpj3Mrej+b9SFfDZ6uPiPS1NewWB2oVwWHPHnpJPGip+
	PRW48PMaD54ZUIvfyq9l2483e5KvouBgCm8F2SWQmtWLQOvG1WsIU6LETGFlLGe9Bv4xCa2S9Eo
	U
X-Google-Smtp-Source: AGHT+IGN3CVKaCzsTTTZAhi5aLP3IU2i/yYec7EnKqtAbbhcljtUTg3XOYRNBhAiF/SB1c9ScHYqBg==
X-Received: by 2002:a17:906:6a0c:b0:aae:c3c1:1361 with SMTP id a640c23a62f3a-abb70d67858mr774976166b.44.1739782158231;
        Mon, 17 Feb 2025 00:49:18 -0800 (PST)
Message-ID: <dc2bf5f6-d6cd-4f54-b981-5c44b72be57d@suse.com>
Date: Mon, 17 Feb 2025 09:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250212153800.5159-1-roger.pau@citrix.com>
 <5bd90a77-eb82-438f-8f78-bfcf98507d58@suse.com>
 <Z69Ltd5cvwMuoYVa@macbook.local>
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
In-Reply-To: <Z69Ltd5cvwMuoYVa@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2025 14:57, Roger Pau Monné wrote:
> On Fri, Feb 14, 2025 at 02:01:09PM +0100, Jan Beulich wrote:
>> On 12.02.2025 16:38, Roger Pau Monne wrote:
>>> There's also the following restriction noted in Intel VT-d:
>>>
>>>> Software must not program paging-structure entries to remap any address to
>>>> the interrupt address range. Untranslated requests and translation requests
>>>> that result in an address in the interrupt range will be blocked with
>>>> condition code LGN.4 or SGN.8. Translated requests with an address in the
>>>> interrupt address range are treated as Unsupported Request (UR).
>>>
>>> However this restriction doesn't apply to the identity mappings possibly
>>> created for dom0, since the interrupt address range is never subject to DMA
>>> remapping.
>>
>> Coming back to this also with your on-demand-p2m-populating patch in mind:
>> I'm having some trouble following your comment on this quotation. The doc
>> text is quite clear that page table entries must not point at the interrupt
>> address range. They don't make an exception for identity mappings. And we
>> don't know how the IOMMUs internally work, e.g. what sanity checks they do
>> (and what failure thereof would result in).
> 
> My understanding is that address translation will never happen for the
> interrupt address range, so whatever gets mapped on that range will
> never be translated by the IOMMU.  Hence for the specific case here,
> there will never be untranslated request that result in an address in
> the interrupt address range, because translation is not done for input
> addresses in the interrupt address range.
> 
> Sorry, hope the above makes sense, I'm having a hard time trying to
> write down what I understand happens when the IOMMU handles accesses
> to the interrupt address range.
> 
> Maybe a diagram would be easier.  This is my understanding of how
> translation works in the IOMMU:
> 
>  input address -> translation -> output address
> 
> However input addresses that are in the interrupt address range are
> not subject to translation, and hence there's no output address that
> can be subject to the quoted VT-d paragraph.

I agree this is a possible (and plausible) interpretation of that text.
I'm merely unconvinced it's the only possible one.

Jan

>> Instead I'm now wondering whether we don't need to
>> - prevent ept_set_entry() from propagating to the IOMMU mappings targeting
>>   the interrupt range,
>> - demand non-shared page tables if any such mapping is to be established
>>   in the CPU page tables.
>>
>> Then again I won't assert that my interpretation of that quoted text makes
>> sense at all.
> 
> See above, *I think* the quoted paragraph only applies to output
> addresses, and in the case of mappings created on the interrupt
> address range there's simply no output address.
> 
> Thanks, Roger.


