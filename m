Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D2C73E78
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167156.1493514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3VD-0007a9-Gb; Thu, 20 Nov 2025 12:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167156.1493514; Thu, 20 Nov 2025 12:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3VD-0007XY-Dh; Thu, 20 Nov 2025 12:11:07 +0000
Received: by outflank-mailman (input) for mailman id 1167156;
 Thu, 20 Nov 2025 12:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM3VB-0007XS-JN
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:11:05 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc1d91a0-c609-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:11:03 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b737c6c13e1so150552466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 04:11:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7655051625sm194625566b.65.2025.11.20.04.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:11:02 -0800 (PST)
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
X-Inumbo-ID: fc1d91a0-c609-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763640663; x=1764245463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zmIVRrPfbg41gA+a6ffxp9TdPPfgOWMvBkwtwAqD0sE=;
        b=LYuVelq2KVBczLC40DPSrvhq6BqzoRa3DtSGpCwz+wn2wNRVeNKKx4PJFJ6kxfvdkc
         86YFUk4zLsxvmhIfMs07sORHo7H1kdnGXaquwGGQQKDVOAxaiT1I9ExWvuWDlueEnI6n
         4ORhxS7Z7e4q2NKf5sRdnXpfv7+CZBepW7KWQ87eapvb9gE8Gzr1IzLRRe3T1WiH59p+
         h4L1+/ooAt89YJWs+KYdPheMlUMTGnvgoIuj3gTdQM/fPDQ6omRM/uLtn8DDToDmDtau
         3d5aKAce1/Nsd07PsLJA8RepfQg8kS+axZC69FQrLTu5/5HLydVhTv5aAzj5/dCjFwzP
         Z6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640663; x=1764245463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmIVRrPfbg41gA+a6ffxp9TdPPfgOWMvBkwtwAqD0sE=;
        b=VhtZw27BGmf7DUopwi0qouEJSooOqfzkgonIfr+72XIOW1w2DMVZEBynq6sEdJJ3fG
         7gYPK3zIcTq9qC23eJEwC13lr6uvUTKlHvl5YDEDDoV1PydealKI6JwwRSPledqmMnFU
         qTaRvv/HSs9hlV4qMAVNN2Q5tIN/goYP1yOylwMThcOVXFyMC8Z15K00Rb29qEgS6a8Z
         P5kJdjcVfbwW7FGUdM/sNaTfwgyYlg5goafz8qoVQ8SZRJLjP0nRFqt4D3+FYhqk07Q9
         CynI1+jp5rYr5JO32l4K2xm/3zEHgUC3h20+E9ZkTu3BOCxPLJehLUkn1WePNzo9QwIR
         zYOw==
X-Forwarded-Encrypted: i=1; AJvYcCX+tUCYwMhSqMLFdE2mDYfg1NnSr24PPK2m6jhupN+Y/vhmGgnatEPZ70NybRczW6y1oJs007M1swI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtnbdaMgOBb92G3bwLcmKiQuD/BxocR93NpKMGx7Lgtwg/pE6D
	iv6Wn9sa1hogdbj7bqIdewdrbon/0YW+DUK586gw6WherS2TAoBWAGll0vtp2KNvTg==
X-Gm-Gg: ASbGncszmeiI/1y9k226xcWf0ku1HZKeO6DEvxPg9cUMoBhCbXfSEm2wNny1RuSARGk
	xEGcanwf9nxNBdVOjy7ZHTcXIF+22+FwNYm+faViaR43djUESThq4I1jD/MeYxDWfEPz7kONmAX
	NHT7CbyYSEaVhZa4lv2u6IrWhTY6miI0Kh2V06WRxoa4KuBgqA38gWJL9hRRpHZYRQBohnvdrnX
	VGdKyteTAplRpXr0z6y/+QYrtpOWwblYms1CpW2k2HIkB6NCDW3Wy09fcYWJobgyoVSQBhORreS
	FL0Pldx1P10K7oKAkaQHf7ktdKG9f1kkezGmUezp/kX6rLH6y4czmZCRUS5rFfg20OkaZ+WeUqa
	wCxncx/Pz+gMMUl8r4XY94ZXOc/lyWDckbeP+LiL/MoCiEXENsQ2++0NbK4q/96l+JKOXDYqEOH
	EP+zm0awgAL6ZsQGAbC5ph2NYzlR7zAjsMU3M9ECP43wGcH+2FYBhRfz1TwzxuhJCbfcnLqaxx1
	ykyIgp+O0+XaQ==
X-Google-Smtp-Source: AGHT+IGfyA6JyNOPguw3sQbMfZXScw8QvzJiY9ARppOrjQeeXKY+1EdH/RZluC/4pgggG8bq2slLTg==
X-Received: by 2002:a17:907:94d1:b0:b73:4aa5:35e5 with SMTP id a640c23a62f3a-b7654d8c128mr370197766b.7.1763640662970;
        Thu, 20 Nov 2025 04:11:02 -0800 (PST)
Message-ID: <5a476cc5-0095-4783-bde9-c84f24740372@suse.com>
Date: Thu, 20 Nov 2025 13:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/MCE: restrict allocation of thermal and CMCI
 vector to BSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <638d0954-e889-41ee-b277-282f83170c69@suse.com>
 <ed2f44ce-b28d-482f-b6bb-5ef40149f2b2@citrix.com>
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
In-Reply-To: <ed2f44ce-b28d-482f-b6bb-5ef40149f2b2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 12:51, Andrew Cooper wrote:
> On 19/11/2025 10:50 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -110,13 +110,13 @@ static void __init mcheck_intel_therm_in
>>  }
>>  
>>  /* P4/Xeon Thermal regulation detect and init */
>> -static void intel_init_thermal(struct cpuinfo_x86 *c)
>> +static void intel_init_thermal(const struct cpuinfo_x86 *c, bool bsp)
>>  {
>>      uint64_t msr_content;
>>      uint32_t val;
>>      int tm2 = 0;
>>      unsigned int cpu = smp_processor_id();
>> -    static uint8_t thermal_apic_vector;
>> +    static uint8_t __ro_after_init thermal_apic_vector;
>>  
>>      if ( !intel_thermal_supported(c) )
>>          return; /* -ENODEV */
>> @@ -160,7 +160,8 @@ static void intel_init_thermal(struct cp
>>          return; /* -EBUSY */
>>      }
>>  
>> -    alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
>> +    if ( bsp )
>> +        alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
> 
> We really don't want both c and bsp passed in.  That can only go wrong.
> 
> Furthermore, this function has 2 other examples generating bsp locally.
> 
> The function is in desperate need of cleanup (MSRs, variable and
> constant names), but right now this makes it worse.
> 
> Please either use c == &boot_cpu_data, and I'll do some cleanup later,
> or generate bsp = c == &boot_cpu_data and fix up all users in the function.

No, throughout mce/ this won't work as long as acpi/power.c:enter_state() has

    mcheck_init(&boot_cpu_data, false);

Jan

