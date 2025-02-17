Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F2A37EFD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889935.1298968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxpN-0001vV-KZ; Mon, 17 Feb 2025 09:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889935.1298968; Mon, 17 Feb 2025 09:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxpN-0001tf-HT; Mon, 17 Feb 2025 09:54:13 +0000
Received: by outflank-mailman (input) for mailman id 889935;
 Mon, 17 Feb 2025 09:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjxpM-0001tX-3V
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:54:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2312e765-ed15-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 10:54:11 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f22fe889aso3162982f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:54:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376326sm850593166b.87.2025.02.17.01.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:54:10 -0800 (PST)
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
X-Inumbo-ID: 2312e765-ed15-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739786050; x=1740390850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jofhTv9sBRV2I8DdS1izomuH3go92ahQThPVnLHH9DU=;
        b=g5PGcJvVpqizOguBzUjd+5GDvoPriS+a9KUp81f7QHeAscfRF4IKjRVUrgHxqewmzf
         nGVbDi+4xZAqsANdplZUdD5ZwKjn8OyUnTNvdMkZ1MnhyHl8ghFMghBFTqWj+GOMr/Wm
         j+tNtO27+SFLnD6IoUofKzxncVWtJ0vxPwTzwU5PKCCZIo8I5S9ec5IdRsomjKz43c2w
         KnbLwXjy+i684MRC0e13eHt3oI1NjS0t+1BwBhFo1NhjXyg3lP2hYSs5qcl96P997E/+
         rt+bJi+KFmDWVROj7Yegu563MwDaF224oxrR1Lfw8sB3HeewfbdbxmDNGni/vRCXro3e
         s8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786050; x=1740390850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jofhTv9sBRV2I8DdS1izomuH3go92ahQThPVnLHH9DU=;
        b=GNcRe2fiSSJK5w9bnEKZ+xSx/t6AnzMHrNgM2omV4ywigSlvjj1QEZme6ru2Leh5xR
         f2tbI6vLIC4RhyvOuwkoz/kYT7oI5zSlJcmiX8kQlqJGj+/KzAKLzayEfp8rMVBEFdgG
         BswzZ4Na6MjXkG0bwJuCZetLQ6WEwly81g0WdXeJJCOt1BCLSAHLC63/CLcRrGkH0hik
         kctNb1iNt32z5MySoyZmlyzETgLIXtlH3zJk+oLk1sN9PmPWWrbjwIuQU535hoa8svmr
         ZUYioeuK8vy6zWZepPBk3kH5xCVOw/JYR0xXGSueESxjICFpeDMtk6VJdWBErcuM2UUC
         l9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaFc6RS8zbq4VNNM9rHcn10IDQJJOtgiP81h7GepzfNVbH0KzyYsJ7SP+0Bzs2emS/yuA9Z4tQtgM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW985QfzBhCG9Q8KBdB0k7CCxObFTmUMde96Eaz5C48nlOl6hz
	UCzjFyjF1tsrQn0o68k74Ylp6fUPlXcreKKbcSG8DHs80aQCwEswgCNsRpA+Pw==
X-Gm-Gg: ASbGncukAiTFiLBRH6Hz0lMjeiBiuaD4HLKPBehJK09DIPY3zql2QofZeOQDKUW+9zE
	0l8AJggr32iILUfimoBaNE4xLl1jEoywid8sccgWNqP6QWqmEVkgPSKeyocex3ZwX2xaQm/3waZ
	BGTf76n6Fs8UMwmqNxGlLdZv7LjHbMf3u6LLfxG13VfXwYsEcKLF40VPKuHzfEyqkPwfuASiVS4
	KtYDDM84NDWOUb6HG2RoheZMFhJhR99n592j6aZj2DASt1nlP70DjoVrklSebl3KcGhsNrqNm7q
	34zSLMr4j/TSn12LaefTrziKoASWInN9NRtS843cdNuGyTQVnYeyJuddxMyDf6uwXljtDbhLKap
	C
X-Google-Smtp-Source: AGHT+IHuuPhPqDKW+E1QB8obYf6VkHOPmn4JrkFmTF+XdrBMsvJV4lLBPWIfVn7pbRE8kcG/SzUaMQ==
X-Received: by 2002:a05:6000:1a8e:b0:38e:d026:820 with SMTP id ffacd0b85a97d-38f33f28f6emr10480096f8f.16.1739786050574;
        Mon, 17 Feb 2025 01:54:10 -0800 (PST)
Message-ID: <7789a11a-15ef-4bfe-9cc5-aa9a447749b4@suse.com>
Date: Mon, 17 Feb 2025 10:54:11 +0100
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
 <dc2bf5f6-d6cd-4f54-b981-5c44b72be57d@suse.com>
 <Z7MFoZAJw3ITRtUK@macbook.local>
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
In-Reply-To: <Z7MFoZAJw3ITRtUK@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 10:47, Roger Pau Monné wrote:
> On Mon, Feb 17, 2025 at 09:49:18AM +0100, Jan Beulich wrote:
>> On 14.02.2025 14:57, Roger Pau Monné wrote:
>>> On Fri, Feb 14, 2025 at 02:01:09PM +0100, Jan Beulich wrote:
>>>> On 12.02.2025 16:38, Roger Pau Monne wrote:
>>>>> There's also the following restriction noted in Intel VT-d:
>>>>>
>>>>>> Software must not program paging-structure entries to remap any address to
>>>>>> the interrupt address range. Untranslated requests and translation requests
>>>>>> that result in an address in the interrupt range will be blocked with
>>>>>> condition code LGN.4 or SGN.8. Translated requests with an address in the
>>>>>> interrupt address range are treated as Unsupported Request (UR).
>>>>>
>>>>> However this restriction doesn't apply to the identity mappings possibly
>>>>> created for dom0, since the interrupt address range is never subject to DMA
>>>>> remapping.
>>>>
>>>> Coming back to this also with your on-demand-p2m-populating patch in mind:
>>>> I'm having some trouble following your comment on this quotation. The doc
>>>> text is quite clear that page table entries must not point at the interrupt
>>>> address range. They don't make an exception for identity mappings. And we
>>>> don't know how the IOMMUs internally work, e.g. what sanity checks they do
>>>> (and what failure thereof would result in).
>>>
>>> My understanding is that address translation will never happen for the
>>> interrupt address range, so whatever gets mapped on that range will
>>> never be translated by the IOMMU.  Hence for the specific case here,
>>> there will never be untranslated request that result in an address in
>>> the interrupt address range, because translation is not done for input
>>> addresses in the interrupt address range.
>>>
>>> Sorry, hope the above makes sense, I'm having a hard time trying to
>>> write down what I understand happens when the IOMMU handles accesses
>>> to the interrupt address range.
>>>
>>> Maybe a diagram would be easier.  This is my understanding of how
>>> translation works in the IOMMU:
>>>
>>>  input address -> translation -> output address
>>>
>>> However input addresses that are in the interrupt address range are
>>> not subject to translation, and hence there's no output address that
>>> can be subject to the quoted VT-d paragraph.
>>
>> I agree this is a possible (and plausible) interpretation of that text.
>> I'm merely unconvinced it's the only possible one.
> 
> The AMD-Vi specification mentions the following regarding the
> interrupt address range:
> 
>> 2.1.4.2 Interrupt Address Range
>>
>> Accesses to the interrupt address range (Table 3) are defined to go
>> through the interrupt remapping portion of the IOMMU and not through
>> address translation processing. Therefore, when a transaction is being
>> processed as an interrupt remapping operation, the transaction
>> attribute of pretranslated or untranslated is ignored.
>>
>> Software Note: The IOMMU should not be configured such that an address
>> translation results in a special address such as the interrupt address
>> range.
> 
> Which I interpret in the same way as VT-d: input addresses that belong
> to the interrupt address range are not subject to translation.  Output
> addresses that belong to the interrupt address range are not allowed,
> otherwise the IOMMU will raise a fault.
> 
> I've added the following chunk to Xen:
> 
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index 8b1e0596b84a..20aa46e305a3 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -480,6 +480,9 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( rc )
>          panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
>  
> +    rc = rangeset_add_range(map, 0xfee01, 0xfeeff);
> +    BUG_ON(rc);
> +
>      /* If emulating IO-APIC(s) make sure the base address is unmapped. */
>      if ( has_vioapic(d) )
>      {
> 
> And run a basic test on each server microarchitecture (AMD Naples to
> Genoa, Intel Haswell to Emerald Rapids) available on XenRT, everything
> seems to be OK, no IOMMU faults, but still running.
> 
> Would you agree to allowing mappings to the interrupt address range if
> the above test raises no issues?  I know it's not every possible piece
> of hardware out there, but it's quite good coverage.

Yeah, I think that ought to be good enough.

Jan

