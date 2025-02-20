Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C47EA3DFC6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 17:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893951.1302786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl93e-0003sb-5N; Thu, 20 Feb 2025 16:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893951.1302786; Thu, 20 Feb 2025 16:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl93e-0003r9-2G; Thu, 20 Feb 2025 16:05:50 +0000
Received: by outflank-mailman (input) for mailman id 893951;
 Thu, 20 Feb 2025 16:05:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl93c-0003qn-AJ
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 16:05:48 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bae3e3b-efa4-11ef-9aa9-95dc52dad729;
 Thu, 20 Feb 2025 17:05:47 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f22fe889aso943502f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 08:05:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53231fcasm1475408166b.25.2025.02.20.08.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 08:05:45 -0800 (PST)
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
X-Inumbo-ID: 8bae3e3b-efa4-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740067546; x=1740672346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HgAhPK/b66R88d8YNqM5nW3LNXL65DCGx2FSCqoZZk4=;
        b=Pj2zUcsueKukzLnVSNN1ZquzmBr3Ebmyo1C8Ib4BXKUyB/8Jr4PiVERfKiLaPuNB5R
         nG7Vcyi31sQszoY3cmko4ehUb6hwxvHhzDdiJJBb95FsUe3vVa0Gq+nwkFOsC4oEZMm6
         /KzmmvieE0Efj1rNGywfVk777Q5KjEEaJ3eXw/q6vV3cD9GaYjI/q3fkhQV5nBgCqNHF
         0ZDfxcMKadccM7pIpambShomLgF6BHZcUbiEr8PWhB5+dP0Trr0XO7N6jsvyteAAZTzH
         K/TlQxx+oI9FM1d+sKck3ZLCqmwG8EzT2X8yJPAZb7qrmdN4sbgwXYsg5BJMEKRqaWF2
         SR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067546; x=1740672346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgAhPK/b66R88d8YNqM5nW3LNXL65DCGx2FSCqoZZk4=;
        b=AeC/xG++xt3zX/1TIQrkgYO//AGav43r+CSsfj/KpFibFTB1LPngZFrCUrUtN1Nlg+
         lnvAHbzm8GowLsEpRSP6h58G7A366GjmDxgvnP4B8+zkAKkppZZZeTu8H8kZqxt4I70F
         fzsHS6ZSLrkwsg6RqOj/cPvmIVy4I2jAFYhF3/I87jRmtatnhZCsFwikoHwmujWHtDTW
         YIF+Pbw8XqERsZEGXZ0u8MnemybNbx9qrSjDyywxwCrzo3LX4sUzG7x+HNC0Ba+KlRwI
         PDV/MYNiAD8J2MF6aoeJvYcdTzKl8CxkV33jg8gEiBR1TnXwFpft/AM/qPiHW2O8psIR
         OLkw==
X-Forwarded-Encrypted: i=1; AJvYcCUziQ81gem62Sw3aZTQCSTECJmFqm6CXd2wR+4rhTd/ln2pyTN+xqpf9/0WCiNsAz1yMF8Lgu9dLnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySpk6BRIptuh8HolJ1roRHWBJ9y9m/5nkhLv0yGd6ch2GMTCbB
	NotUNALunTtIG9JgMV+6J6IpYzPezKuMl4n+H35T2iHQGa9rAKCh6E2xU1m7gQ==
X-Gm-Gg: ASbGncs9WHDxWxxaCyb9Tf3u8tXiLmPHopCagzlI5tUDRHvlNHffUO2+AcExs2YibEQ
	PPMcZnt/Z/cfsW0ocMkd/jZxHexLnqrWJlfKViqzQObggBRUC4ReCrQI6Cc8ReSnS2DOTw4ARed
	qJdvaDdkLuf1h10XzOOWENi/29uQ5E536TQ3SI0RVf4ZUY61LnBkNxwk9btWUFo3dShjPgIntuZ
	whLybSSs1hmWisQdpW/727D3iehRxqphrBFApLHqw+Wbm2JuSmjs6Epf7fqACSlGLWefmczOYSI
	NW/gFBhh6RLZegVnBAiz8dULcxpnuJAssNfmgkc64lPZQAES18yqw4q6JaKCagM49sm0/Dxt5WT
	v
X-Google-Smtp-Source: AGHT+IEtNvdGYmHqIcIfHgSee3Wb+2PzBT2uCDcJ4LIRFblOcR7NWJnxHL8yQdwYNstgeY3HYnEhBQ==
X-Received: by 2002:a05:6000:11d0:b0:38d:af14:cb1 with SMTP id ffacd0b85a97d-38f33f58dbdmr17916843f8f.54.1740067545762;
        Thu, 20 Feb 2025 08:05:45 -0800 (PST)
Message-ID: <7fe59f29-34b9-4404-9634-3604b78e1df5@suse.com>
Date: Thu, 20 Feb 2025 17:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-4-roger.pau@citrix.com>
 <1e8ef6d3-09db-4d53-b7c8-4b10a7f5d8f0@suse.com>
 <Z7buBc4yLtf-UpmB@macbook.local>
 <c8ce79c1-0d8a-45b3-868a-2b67b05d6aee@suse.com>
 <Z7dM5_X4OEHk5gn1@macbook.local>
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
In-Reply-To: <Z7dM5_X4OEHk5gn1@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.02.2025 16:40, Roger Pau Monné wrote:
> On Thu, Feb 20, 2025 at 02:30:38PM +0100, Jan Beulich wrote:
>> On 20.02.2025 09:55, Roger Pau Monné wrote:
>>> On Thu, Feb 20, 2025 at 09:33:46AM +0100, Jan Beulich wrote:
>>>> On 19.02.2025 17:48, Roger Pau Monne wrote:
>>>>> Note that the restriction to map the local APIC page is enforced
>>>>> separately, and that continues to be present.  Additionally make sure the
>>>>> emulated local APIC page is also not mapped, in case dom0 is using it.
>>>>
>>>> But that's in GFN space, not in MFN one. Why would that matter for iomem_caps?
>>>
>>> It's required to avoid arch_iommu_hwdom_init() creating an identity
>>> mapping for APIC_DEFAULT_PHYS_BASE, which would prevent the local APIC
>>> emulation from being used.
>>
>> Hmm, yes, on one hand such a mapping would be created by default, as we
>> default to "dom0-iommu=map-reserved". Otoh that mapping would be replaced
>> before Dom0 is actually started, via the domain_creation_finished() hook.
>> On (modern) VMX that is. So yes, on old VMX and on SVM the slot would need
>> to remain unpopulated. Otoh, when the physical LAPICs are elsewhere and
>> when the domain is in x2APIC mode, there would be no reason to disallow
>> Dom0 access to that page.
> 
> Right, but that's now how dom0 is started ATM, as the local APIC is
> unconditionally started in xAPIC mode and at APIC_DEFAULT_PHYS_BASE.
> 
> I could use vlapic_base_address() against vCPU#0 vlapic, but even in
> guest_wrmsr_apic_base() we don't allow moving the local APIC MMIO
> region, and hence I assumed it was fine to just use
> APIC_DEFAULT_PHYS_BASE here.  Note in pvh_setup_acpi_madt() Xen also
> hardcodes the local APIC address to APIC_DEFAULT_PHYS_BASE.
> 
> Would you be fine if I expand the comment so it's:
> 
>     /* If using an emulated local APIC make sure its MMIO is unpopulated. */
>     if ( has_vlapic(d) )
>     {
>         /* Xen doesn't allow changing the local APIC MMIO window position. */
>         mfn = paddr_to_pfn(APIC_DEFAULT_PHYS_BASE);
>         rc |= iomem_deny_access(d, mfn, mfn);
>     }

That will do, I think. Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

>> That would apparently mean fiddling with
>> iomem_caps once all vCPU-s have entered x2APIC mode.
> 
> Urg, that seems ugly.  It would also need undoing if the APICs are
> reverted to xAPIC mode?

Right.

>> With LAPICs not
>> normally being elsewhere, question is whether this corner case actually
>> needs dealing with. Yet even if not, commentary may want extending, just
>> to make clear the case was considered?
> 
> As said above, for both HVM and PVH Xen doesn't allow moving the APIC
> MMIO window to anything different than APIC_DEFAULT_PHYS_BASE.

I was talking about the real one Xen uses.

Jan

