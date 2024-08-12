Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB594EFF3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 16:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775623.1185846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWH6-0008G2-Nn; Mon, 12 Aug 2024 14:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775623.1185846; Mon, 12 Aug 2024 14:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWH6-0008EY-L0; Mon, 12 Aug 2024 14:43:56 +0000
Received: by outflank-mailman (input) for mailman id 775623;
 Mon, 12 Aug 2024 14:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyEi=PL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdWH5-0008ES-TM
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 14:43:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bca99e2-58b9-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 16:43:53 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a9185e1c0so331664166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 07:43:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb0e045asm233560066b.52.2024.08.12.07.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 07:43:52 -0700 (PDT)
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
X-Inumbo-ID: 4bca99e2-58b9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723473833; x=1724078633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xVUo5zWUWLi4Fd1ntyxA9JdIVlguUFpiDsoPnszxioM=;
        b=WBLl6IDi2TnQ+32OJXeCsTgj1PnbLTgFD0bz3COL7o/4goA7QAlp4PXy+kVl5sEcGB
         dLjNrnTOpsW2Uh/qIzuJ66itipqB0NN2BMNUk1avJ/kqrVFIUWjQ1MRpkNRGjrQo8x9J
         qgyKJSBc1CikQqvUJhKUHwJEuLQsFqHSgShPTQzUxMpsVsll/6F777x1PU1ewWJVr4Wb
         5V9l/7UuFpsBibsf5mi1ihMwU2lb8/3HQNd7XQHimvfDj00OnN7fvaBjI8PI0LrW0mFI
         W1dKTKmf5w3ybjPE82LCA14d0DAF23PKiSTYOJJOPQ36TgvyRGb0raIhgjhFjT4I1GW1
         vFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723473833; x=1724078633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVUo5zWUWLi4Fd1ntyxA9JdIVlguUFpiDsoPnszxioM=;
        b=lQY5zoDYg/OtY/syyyqPnwj40e6KPMgFFS8v1XMoqOHPTKgdvfTky7Xf97Tq1FdCEG
         6e/sfQOeyDiLenhmixj+zm7R0ziWL8vaBwf4o2mSYf2yCM7jC5vYD0rCRT7k853KUjXx
         FFxp91Pg2eNwcQ3162rBdJehlwTdS2gwLsNMUaEkK2MF1V9Wut1oMdl9KKuJGTN77dQ/
         RIS12S3agOSFx+X86u+e0neHxiNAaWrmeHIr4olLZDlWUEH868criMZvSMR4yX4DaFOE
         PlgneNZ4+GPtTsuBE6ECDzNbDn/DyQWJK32C3UfWmvNBfUD01b6nXru8PtoRpRlM4nti
         aDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWru4KCZIwomBSAAgrn2y8gkd1RcEmY9XMl8zttD5TZRKypD2yBUPM67bpUgACGGjnov5YW6pt2iOsmmSeaYevrGBTMQDGGfQ5cSR8r8iM=
X-Gm-Message-State: AOJu0YyP6fPbbgmTEEnlw0TQ3mKAsJIYj4sqLtGMdnaAgRwVRObJZ7Oo
	58FytcfLF3+H+lCGKjd86Ke7wmwZgQBR0oSgUgyEMScokpPqpHTJTYpvF4DPZQ==
X-Google-Smtp-Source: AGHT+IGNcS7CqhGmQAJ+3jT8p9H+HJMEGxmx1tjpLSW/e4+rNOWz6wzN1PmAom7MyzEiHnr2N4scvA==
X-Received: by 2002:a17:907:94ce:b0:a77:e1fb:7de9 with SMTP id a640c23a62f3a-a80ed1aafebmr33163066b.5.1723473833038;
        Mon, 12 Aug 2024 07:43:53 -0700 (PDT)
Message-ID: <53c6c9ba-de64-4e46-9e29-2e03a9d8224b@suse.com>
Date: Mon, 12 Aug 2024 16:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: slightly simplify MB2/EFI "magic" check
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
 <D3E0A9YVBOAD.LLLJMNX31BG6@cloud.com>
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
In-Reply-To: <D3E0A9YVBOAD.LLLJMNX31BG6@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2024 16:34, Alejandro Vallejo wrote:
> On Thu Aug 8, 2024 at 9:49 AM BST, Jan Beulich wrote:
>> A few dozen lines down from here we repeatedly use a pattern involving
>> just a single (conditional) branch. Do so also when checking for the
>> boot loader magic value.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I further question the placement of the clearing of vga_text_buffer,
>> just out of context: Shouldn't that be placed with the increments of
>> efi_platform and skip_realmode? Or else is the terminology in comments
>> ("on EFI platforms") wrong in one of the two places? In the end, if we
>> are entered at __efi64_mb2_start but the magic doesn't match, we simply
>> don't know what environment we're in. There may or may not be a VGA
>> console at the default address, so we may as well (try to) write to it
>> (just like we do when entered at start).
> 
> It's fair to assume we're in 64bits, and in that situation it's also fair to
> assume the text console is long gone (pun intended).

How is being in 64-bit mode correlated with there being a VGA console?
(I question "fair to assume" here anyway. We're on a path where we know
something's wonky.)

>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -233,13 +233,11 @@ __efi64_mb2_start:
>>  
>>          /* Check for Multiboot2 bootloader. */
>>          cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
>> -        je      .Lefi_multiboot2_proto
>>  
>>          /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
>>          lea     .Lnot_multiboot(%rip), %r15
> 
> I don't think there's much benefit to this, but it would read more naturally if
> lea was before cmp. Then cmp would be next to its (new) associated jne.

You did look at the pattern though that I'm referring to in the description?
Knowing that generally paring the CMP/TEST with the Jcc, I would have
switched things around. Yet I wanted to make things as similar as possible,
in the hope that be(com)ing consistent would make it easiest to get such a
minor change in.

Jan

