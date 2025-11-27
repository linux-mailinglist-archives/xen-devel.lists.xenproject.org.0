Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B2C8E6B1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173824.1498826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObtu-0003SU-9t; Thu, 27 Nov 2025 13:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173824.1498826; Thu, 27 Nov 2025 13:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObtu-0003PS-5u; Thu, 27 Nov 2025 13:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1173824;
 Thu, 27 Nov 2025 13:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vObts-0003PK-IO
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:19:08 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6e8ac29-cb93-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 14:19:07 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so4749415e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 05:19:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790addeeaasm96721755e9.7.2025.11.27.05.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 05:19:06 -0800 (PST)
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
X-Inumbo-ID: a6e8ac29-cb93-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764249546; x=1764854346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5cM+IgudC/3xlBNLcuYS+mm9MNxugoCsz3rE2mmUEY=;
        b=BE8//yhYFhT1zKRKyvpgvyYO7HV06LnOt3HyNiELPx+/PKt37/PMKSR5KIJ1vEb2Yk
         gKehJ0poE8JDeEOzKx7Xc8qT6qE453uBbw/JltuHhT0YNtA6DrNIRggsrIKIs+yFr2R/
         YKGDiHPKwT+ovuXTiAtkD5Aup0SHTiRD233N3q5rDAaiMy6WBvq5M+4CwdXkytBMeAfD
         13mCANWtziNgJ7e3EeJTSCD1CduBZ3Uq/GK5hR8O+OvdqFSyjVn9jOSZbmnBIR1j9zH+
         xENQOZFg6DzGKPDwlVEyYE438qXaAC0cM0eo/7EK33AKkZAFalOgzxfwlPqllnghWTKP
         woSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764249546; x=1764854346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5cM+IgudC/3xlBNLcuYS+mm9MNxugoCsz3rE2mmUEY=;
        b=Swusqa80HFGCROK9H9mODYhIUuPVTpECQsXottSRSybccZR2UUG+d1obzlGXiWrjdY
         f7VDYHwshq7BIp6u6rPEaAFhb72HRS5dY0/vH+dkQ/bNbhsVSzk7lhbvEjpnVuj50fW0
         OlqOJ7p+9QrDd7grKRb3irBVuH2Jgj3nn1ZtxRtayAJxSOobAO5Gy1IK0P1ERDHwWnna
         N8kvU/LRZXl6bg4EDpTVPr7nZ0BUJN9g0Tau9k+15QJXUC6bSx7pR7BSEyHQSBZS/YVj
         YjAkCRugwvQXTXSiyCcVNr8fzD8EGBoRXKteD8idRqHXA/oj5TsFwB8pLU3Po+qAi+lu
         CgsA==
X-Forwarded-Encrypted: i=1; AJvYcCVAn9A3KB+ZNyd2m7ShzuyR21RJG5ohEYYzX3L1jJzhKwLHalXlWdkMy2F/aXdLuwxdUSj+uVtG8kM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhaCaJKx2nYezgxOtMnqUKd9QuHtZ3MEMvbeprcERvf6BIJ0rs
	cY9SxO97oTsIIfkwvEnlj7TBx2joRmsObrI1lFzIhSjPzQyaxFg1GxvABPGxoN+p2Q==
X-Gm-Gg: ASbGncsdu7AXsoEpmQAAWQNhnHzqvTktEw1wNl2unHceRwtU1DRid+t7Rf+tCAQGX4c
	JGezH6VKHIQJqTauW5ouet9GQqJHNKss2tKJ74TRLFbjfamNccd/OAUfNKHeldKGQJn6V+4/hmy
	tQ/BtbG3TiXcapAd2UZGU0yh7Ypi+G3zX3ya8C/8ugXPfhvthiMgdOltSS+iSqsUUTv+GbVW+Ux
	tXrTU8oUNBW1J+Xuz+CkJ4ffzX333SKfO5/nAdZxjWvg1nWaAcBClyc4XvhG+AMhp/2MxFIZC4g
	/LbczV3ShSX3M/3gDY9kVQRI5qalxL6k26YlLxpHbhodKisQV9bikYyxXYsFJ+vileAm6H7mkv2
	vg9MTDCBWEXxCNpfD77v+ZTA53uTM90318iMV3v+dtOlTX4AUVRAL1PxmB7x4bmHT4BNw+6jMWD
	+a7UDOZmeJEtxebF9+5O1bytUee+UqcLPhYHBwSDADs+korsDn1F6v1cl8rN5TY/wTjPLPeOhhS
	xE=
X-Google-Smtp-Source: AGHT+IHyXna879N6HOKdV1CyCJ13A4nRpjVyloSZq2PpHkt3uEhyDcqwG/bCSnCsMwSQtL9ZqI+oIg==
X-Received: by 2002:a05:600c:354e:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47904ac4380mr99432295e9.5.1764249546464;
        Thu, 27 Nov 2025 05:19:06 -0800 (PST)
Message-ID: <7cbca09d-919f-490a-9b68-26a466c84831@suse.com>
Date: Thu, 27 Nov 2025 14:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
 <868f28fe-f2dd-469d-a0cf-111885184dfe@suse.com>
 <DEJHD0L6BMLD.1IWHHEXGAHH4I@amd.com>
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
In-Reply-To: <DEJHD0L6BMLD.1IWHHEXGAHH4I@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 13:36, Alejandro Vallejo wrote:
> On Thu Nov 27, 2025 at 10:43 AM CET, Jan Beulich wrote:
>> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/Kconfig.cpu
>>> +++ b/xen/arch/x86/Kconfig.cpu
>>> @@ -19,4 +19,49 @@ config INTEL
>>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>>  	  must be enabled for Xen to work suitably on Intel platforms.
>>>  
>>> +config HYGON
>>> +	bool "Support Hygon CPUs"
>>> +	depends on AMD
>>> +	default y
>>> +	help
>>> +	  Detection, tunings and quirks for Hygon platforms.
>>> +
>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>> +	  must be enabled for Xen to work suitably on Hygon platforms.
>>> +
>>> +
>>> +config CENTAUR
>>> +	bool "Support Centaur CPUs"
>>> +	depends on INTEL
>>> +	default y
>>> +	help
>>> +	  Detection, tunings and quirks for Centaur platforms.
>>> +
>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>> +	  must be enabled for Xen to work suitably on Centaur platforms.
>>> +
>>> +config SHANGHAI
>>> +	bool "Support Shanghai CPUs"
>>> +	depends on INTEL
>>> +	default y
>>> +	help
>>> +	  Detection, tunings and quirks for Shanghai platforms.
>>> +
>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>> +	  must be enabled for Xen to work suitably on Shanghai platforms.
>>> +
>>> +config UNKNOWN_CPU
>>> +	bool "Support unknown CPUs"
>>
>> "Unknown CPUs" can be of two kinds: Such of vendors we don't explicitly support,
>> and such of vendors we do explicitly support, but where we aren't aware of the
>> particular model. This needs to be unambiguous here, perhaps by it becoming
>> UNKNOWN_CPU_VENDOR (and the prompt changing accordingly).
> 
> Right, what I do in this RFC is have compiled-out vendors fall back onto the
> unknown vendor path. Because it really is unknown to the binary.
> 
> I could call it GENERIC_CPU_VENDOR, or anything else, but the main question
> is whether a toggle for this seems acceptable upstream. I don't see obvious
> drawbacks.

I'd recommend against "generic" or anything alike, as it'll rather suggest any
vendor's CPU will work reasonably. I'm fine with "unknown", just that the nature
of the unknown-ness needs making unambiguous.

>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -118,7 +118,7 @@ static void cf_check default_init(struct cpuinfo_x86 * c)
>>>  	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
>>>  }
>>>  
>>> -static const struct cpu_dev __initconst_cf_clobber __used default_cpu = {
>>> +static const struct cpu_dev __initconst_cf_clobber default_cpu = {
>>
>> This change isn't explained in the description. __used here was introduced not
>> all this long ago together with __initconst_cf_clobber. Maybe this really was
>> a mistake, but if so it's correction should be explained.
> 
> It wasn't clear to me why __used was there (I assume it shouldn't have been),
> but it definitely clashes with the intent of having it gone when UNKNOWN_CPU=n.
> 
> If __used was misplaced to begin with I'm happy to get rid of it in a separate
> patch. I don't think it warrants a Fixes tag, though.

I can only vaguely reconstruct that it may have been put there so the
.init.rodata.cf_clobber entry wouldn't go away. But as long as the compiler
also eliminates the function pointed at, that would be of no concern.

>>> @@ -340,7 +340,8 @@ void __init early_cpu_init(bool verbose)
>>>  	*(u32 *)&c->x86_vendor_id[8] = ecx;
>>>  	*(u32 *)&c->x86_vendor_id[4] = edx;
>>>  
>>> -	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
>>> +	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx) &
>>> +	                X86_ENABLED_VENDORS;
>>
>> May I suggest the & to move ...
>>
>>>  	switch (c->x86_vendor) {
>>
>> ... here? Yes, you panic() below, but I see no reason to store inaccurate
>> data when that's easy to avoid.
> 
> That's intentional. Otherwise further checks of c->x86_vendor in other parts of
> the code may not go through the same branch as the one here.

Hmm. I would kind of expect x86_vendor_is() to be capable of dealing with
that.

Jan

