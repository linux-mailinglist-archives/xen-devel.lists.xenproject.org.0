Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6474BFF74B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 09:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148739.1480610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBpOH-00028Q-BN; Thu, 23 Oct 2025 07:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148739.1480610; Thu, 23 Oct 2025 07:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBpOH-00025K-8K; Thu, 23 Oct 2025 07:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1148739;
 Thu, 23 Oct 2025 07:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBpOF-00025E-Vi
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 07:05:39 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ade0f175-afde-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 09:05:38 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47100eae3e5so4291205e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 00:05:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428dafesm79188535e9.6.2025.10.23.00.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 00:05:37 -0700 (PDT)
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
X-Inumbo-ID: ade0f175-afde-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761203138; x=1761807938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yhHYyW+RiAuw4iOh9hbVcK0TAYMcVbtoumKvLWQUg4=;
        b=RmSeiOHTMSRoIydtdBNTAwscrhOzBZIVCRIekJCRcv4Lh9UbZSJ/DWGf3rX7K8dUBR
         rPihV8SIh2sfREIEx36zLm5Dd0pvakVsmybaJlAtP2bSHvG/UNaAHhcnKVdyaQ0kiE7e
         /VsOWFc4imQ6NWs6Hs8X3FMdAbBlcP7Ee7MR+dTHBhPFyyVBrU0VVT4+79glwXQ6Nt9U
         Sca/oJ//W31R1z80HQL1FmMbHXg+PlJdjlrbRo7dJzFI9cHbHn5zYfA7L4Fdz76ktB6W
         bBCe6DlmBLAIQlX7r0RIyBUExzpDKXh0ioqrMwop8mxGRfS9kel/aylOAGpOICXg99jM
         sorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761203138; x=1761807938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yhHYyW+RiAuw4iOh9hbVcK0TAYMcVbtoumKvLWQUg4=;
        b=qCnv3bucDhlXnI5FoXUySNkmo11KReRWsvW4qpL9l7/wIikbMWuBckB1aqxFSSDa6S
         hOq70TNwwhtOFhAN8RKbvnIySG6hTqrPrdjDax/3Upq/5hpZ+rw6wHvy6wY5pIRpTHIl
         AgyhwzkhJHylDx0qOIVzKgEUnkKtgWlpwDIIxFfhRkz87mfh6DWrho3KSOCB+saAV2xQ
         fMvkC1lGQXYMdusKvT6FnsbntDGP7JpwcfM1gUEY6iNsPWvDyba1jG8DTe00kAGphzZx
         BWQlQaOYw6oR+b2WkLo5KlEGvkiYs1s9fdQlbNpI4zBgJFXKeHtkzaWtY2ewrapJSRra
         xWIA==
X-Forwarded-Encrypted: i=1; AJvYcCWXTQrQxkNRxY2Jptaw6bUacO23Mm7ZE8qcnUOolXRRBnQVbfAOXSxOw7eS0wvT8D+qhIUrIeXLrAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykhfMQMlbZwWbjvVxkm48oRK+GISQxluMEVxeDPEVp2w593Q8O
	5Uirfr5EzJLJbIP3v7H+XOuhn5wmPWQ3YBnM7W+YAY4+C4L8D/UNBtl/0/ktv20+3w==
X-Gm-Gg: ASbGncvZB6ATqPw+hEp/liN73zZBh1mQQHlSPrnIhaHU5AK4rieBAr8edTnU9nFfE4w
	LQiBSAZ2k5UGlpOUWS/KyMbihJSkfyLwd1xNiq2bajRG4FE/xz7e15dfAPtmvOuKrOTDSXhgAM3
	M2wCSS5YUjCSLuiFTfJnO+c2LJ9GNqcwIy40+dOBM+l7V8uVd1aVTLc/Gvyg1sR9KD9/lT+XfWS
	Z9ytt/wsyJmkSjGbVZwuQh3yNU0M1oddGTH3tXowddz87wozwVLX5btBMfbiuLMnj7BMEkxxtxP
	VWxGT3Xwckb3wxR1lERX8lnegxim6V9/Zvw+YPr8Y4IX0GTaWEXJBimirBmHW56B9eTXLYMpUo7
	N4TnljvERcGeIdzgAHMZUfoI9BU7bRjtWWTJb6EXVQAtn5RDfslqLpqql2f8Rzn+VhpBaLjHDnB
	0Gx2OAxzwzmx8VyjIiNeuM5OhIWLNET6ZGq4ndqfqcZiyC0j1VapKTnBaJvwah
X-Google-Smtp-Source: AGHT+IFrKqLtlmjLKHOOhP9/Pne2Yy1O06us843vmnygeiHomUT6SQZdGIKHItFQtK0sSHFAb+KX4Q==
X-Received: by 2002:a05:600c:34d5:b0:46f:b42e:e39e with SMTP id 5b1f17b1804b1-4711791da0amr175755655e9.39.1761203137720;
        Thu, 23 Oct 2025 00:05:37 -0700 (PDT)
Message-ID: <78874979-52ed-48f6-a9ba-4ddb6c78c208@suse.com>
Date: Thu, 23 Oct 2025 09:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/ucode: Relax digest check when Entrysign is fixed
 in firmware
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-6-andrew.cooper3@citrix.com>
 <dbe8a444-daf2-4929-921f-704aa5f48cde@suse.com>
 <8306217c-2f7b-4d69-b051-ae1e6b4f443a@citrix.com>
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
In-Reply-To: <8306217c-2f7b-4d69-b051-ae1e6b4f443a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.10.2025 23:19, Andrew Cooper wrote:
> On 21/10/2025 10:47 am, Jan Beulich wrote:
>> On 20.10.2025 15:19, Andrew Cooper wrote:
>>> +void __init amd_check_entrysign(void)
>>> +{
>>> +    unsigned int curr_rev;
>>> +    uint8_t fixed_rev;
>>> +
>>> +    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
>>> +         boot_cpu_data.family < 0x17 ||
>>> +         boot_cpu_data.family > 0x1a )
>>> +        return;
>>> +
>>> +    /*
>>> +     * Table taken from Linux, which is the only known source of information
>>> +     * about client revisions.
>>> +     */
>>> +    curr_rev = this_cpu(cpu_sig).rev;
>>> +    switch ( curr_rev >> 8 )
>>> +    {
>>> +    case 0x080012: fixed_rev = 0x6f; break;
>>> +    case 0x080082: fixed_rev = 0x0f; break;
>> In your reply you mentioned a "general off-by-1" when comparing with Linux,
>> but I'm in trouble understanding how both can be correct. Leaving aside the
>> 1st line (for which you sent a Linux patch anyway), how can our
>> "(uint8_t)curr_rev >= fixed_rev" (i.e. "(uint8_t)curr_rev >= 0x0f") further
>> below be correct at the same time as Linux'es "return cur_rev <= 0x800820f"
>> (indicating to the caller whether a SHA check is needed) is also correct?
>> We say 0x0f is okay, while they demand a SHA check for that revision.
>>
>> In any event, whatever (legitimate) off-by-1 it is that I'm failing to spot,
>> I think this would want explaining in the comment above.
> 
> What you've spotted is the off-by-one error.
> 
> Linux is written as "curr <= last-vuln-rev" in order to do the digest check.
> 
> Xen wants "cur >= first-fixed-rev"; I renamed the variable and forgot to
> adjust the table to compensate.  I've already fixed it in v2, so this
> line now reads fixed_rev = 0x0a.

Now I'm even more confused. If Linux uses 0x0f for last-vuln-rev, how would
0x0a be first-fixed-ref?

>>> +    case 0x083010: fixed_rev = 0x7c; break;
>>> +    case 0x086001: fixed_rev = 0x0e; break;
>>> +    case 0x086081: fixed_rev = 0x08; break;
>>> +    case 0x087010: fixed_rev = 0x34; break;
>>> +    case 0x08a000: fixed_rev = 0x0a; break;
>>> +    case 0x0a0010: fixed_rev = 0x7a; break;
>>> +    case 0x0a0011: fixed_rev = 0xda; break;
>>> +    case 0x0a0012: fixed_rev = 0x43; break;
>>> +    case 0x0a0082: fixed_rev = 0x0e; break;
>>> +    case 0x0a1011: fixed_rev = 0x53; break;
>>> +    case 0x0a1012: fixed_rev = 0x4e; break;
>>> +    case 0x0a1081: fixed_rev = 0x09; break;
>>> +    case 0x0a2010: fixed_rev = 0x2f; break;
>>> +    case 0x0a2012: fixed_rev = 0x12; break;
>>> +    case 0x0a4041: fixed_rev = 0x09; break;
>>> +    case 0x0a5000: fixed_rev = 0x13; break;
>>> +    case 0x0a6012: fixed_rev = 0x0a; break;
>>> +    case 0x0a7041: fixed_rev = 0x09; break;
>>> +    case 0x0a7052: fixed_rev = 0x08; break;
>>> +    case 0x0a7080: fixed_rev = 0x09; break;
>>> +    case 0x0a70c0: fixed_rev = 0x09; break;
>>> +    case 0x0aa001: fixed_rev = 0x16; break;
>>> +    case 0x0aa002: fixed_rev = 0x18; break;
>>> +    case 0x0b0021: fixed_rev = 0x46; break;
>>> +    case 0x0b1010: fixed_rev = 0x46; break;
>>> +    case 0x0b2040: fixed_rev = 0x31; break;
>>> +    case 0x0b4040: fixed_rev = 0x31; break;
>>> +    case 0x0b6000: fixed_rev = 0x31; break;
>>> +    case 0x0b7000: fixed_rev = 0x31; break;
>> Without at least brief model related comments this looks extremely opaque.
>> Linux, as a minimal reference, at least has cpuid_to_ucode_rev() and the
>> accompanying union zen_patch_rev.
> 
> We have other tables like this in Xen.  Linux has even more.

The one in amd-patch-digests.c I'm aware of. Oh, and tsa_calculations().
But ...

> These case labels are family/model/steppings, but not in the same format
> as CPUID.1.EAX, and also not in the same format at patch->processor_id.

... none of them explaining what these numbers really mean isn't helpful.
I didn't question them earlier because I assumed them to be all "magic".
Now that I learned how they're encoded, I thought it might be (have been)
nice if they weren't left as "entirely magic".

>>  Background of my remark is that I would
>> have expected there to be more models per Zen<N>, seeing in particular how
>> many different BKDGs / PPRs and RGs there are. Many RGs in particular say
>> they apply to a range of models, yet no similar ranges are covered here
>> (unless my deciphering attempts went wrong).
> 
> PPRs/RGs are generally per block of 0x10 models and all steppings
> therewith.  This is quite often one production CPU and a handful of
> preproduction steppings, but e.g. Milan and MilanX are two production
> CPUs share a same PPR/RG, as they differ only by stepping.
> 
> Preproduction CPUs probably won't have a fix (other than the final two
> rows which are A0 stepping of something presumably trying to get out of
> the door when Entrysign was found.)  The list does look to be right
> order of magnitude for the production CPUs.

Sure, and my question wasn't towards steppings of individual models. My
question was towards models of individual families, where the docs
suggest far more exist than this table would cover. I guess that while
talking mainly of steppings, you really (also) meant to say that most of
the model numbers weren't used in practice (for production CPUs) either?

> The AMD bulletin only gives microcode versions for server.  Clients only
> state AgesaPI versions, so I'm entirely reliant on Linux for the
> microcode versions.

I did understand that, yes, as you have a code comment saying so.

Jan

