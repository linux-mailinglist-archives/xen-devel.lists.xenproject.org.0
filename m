Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA58997E93
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 09:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815613.1229595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synv2-00023Q-St; Thu, 10 Oct 2024 07:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815613.1229595; Thu, 10 Oct 2024 07:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synv2-000212-PG; Thu, 10 Oct 2024 07:49:08 +0000
Received: by outflank-mailman (input) for mailman id 815613;
 Thu, 10 Oct 2024 07:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1synv1-00020w-Nd
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:49:07 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 206d7926-86dc-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 09:49:06 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c87c7d6ad4so752333a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 00:49:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9370d2196sm420104a12.7.2024.10.10.00.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 00:49:05 -0700 (PDT)
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
X-Inumbo-ID: 206d7926-86dc-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728546546; x=1729151346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7c2D3Mmu2goqbnbdSjnLzR1Xf59OTg9zIcYlxzvqdtw=;
        b=HM73N3Q9xFpMkRVSlaRVnjt/LKcBqqAWHRgCH2IaMmRFJjACz9usLVJgW8xZi7bu9k
         Usi/ZIJ6FkSivEsETclPHIZkp18FcT5C1wqmbG6LH9AjQez8OU2ReznArvaCEXRLruVF
         UyAlMcuN1qToqTUNcoAC9ZF53nmVF2j7vtM3/+6wv3L+8s0CHzGOOQY4LPQiexYrdGNr
         b/q1kyx/8L0qvNXVdiJ/h2FIsUEiks4e1JSsuLenG9zINI4LgmQKBXAu58blgS8ScZyM
         tjvgjWw+U4H1pyIkuoiCsGPHFsa0XPXJwWgb1L9t+t6i9lom4gV4EGOBHxMtJFp08/2m
         HDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728546546; x=1729151346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c2D3Mmu2goqbnbdSjnLzR1Xf59OTg9zIcYlxzvqdtw=;
        b=XnszpfipOSg2+5KSr7YRhWlVn7oxACtlYqWjP8KdOMOmwEEfNIagQUEjnretYxpui0
         f1K0IfMDscDuZXT+DmMS6tmXOe/SEK3JC7Kb3F2x6k9vieCltqN01NQNy9T/GDIg4LFg
         n5W7ewZxQkVxd//mwALS7bpbjFa6K48V4b52OmTv6bt7UORUbV0H4aw6PwKOsWXaAKqW
         SV6esNkN9pODicDBnETV4jN9jN1paCo5sf5OqRZh0AnyT9voH/XHw16LvZu4/Dp+WvzG
         VRaSejMqdHI4/9ksZ8qFLMXggF97QS46ZzuZyUJM+7Z6XRhbIL5P9uvR1uBQv8c9oAFb
         bS+w==
X-Forwarded-Encrypted: i=1; AJvYcCUS2x7mXfkZfxMBE6673/G37Qse/Yk0/YT+fOss4rH/p1za8HF6nfXO8Qw3Jy1V6GRthtO4jbXobHQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpCfUwcaKqxiCrWpoEtUEVYZRPT58A5TZ9yeJsoGcktMsFeSol
	HmHg1gQWrM1UhcKmpjVnHP+4nZjgyC1yuhILalhrieMT2nLsPYvmR/i4fGT3ig==
X-Google-Smtp-Source: AGHT+IGODX2I7293nNJRLHv6VRXnEQEiHHGnSvHrCsiY4l9FlIBoKMaXIG1OZh0NKoVsU3+1t7YV/g==
X-Received: by 2002:a05:6402:848:b0:5c8:b154:6506 with SMTP id 4fb4d7f45d1cf-5c91d5a368fmr3786282a12.17.1728546546193;
        Thu, 10 Oct 2024 00:49:06 -0700 (PDT)
Message-ID: <d079c013-1ae3-4cd4-a642-bed768f5a43b@suse.com>
Date: Thu, 10 Oct 2024 09:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-6-alejandro.vallejo@cloud.com>
 <f75dde2d-9c39-4be0-8465-6496a56cc658@suse.com>
 <D4RG3TTHTS1E.23ZAJIW3H4VC4@cloud.com>
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
In-Reply-To: <D4RG3TTHTS1E.23ZAJIW3H4VC4@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 19:19, Alejandro Vallejo wrote:
> On Wed Oct 9, 2024 at 3:03 PM BST, Jan Beulich wrote:
>> On 01.10.2024 14:38, Alejandro Vallejo wrote:
>>> Make it so the APs expose their own APIC IDs in a LUT. We can use that
>>> LUT to populate the MADT, decoupling the algorithm that relates CPU IDs
>>> and APIC IDs from hvmloader.
>>>
>>> While at this also remove ap_callin, as writing the APIC ID may serve
>>> the same purpose.
>>
>> ... on the assumption that no AP will have an APIC ID of zero.
>>
>>> @@ -341,11 +341,11 @@ int main(void)
>>>  
>>>      printf("CPU speed is %u MHz\n", get_cpu_mhz());
>>>  
>>> +    smp_initialise();
>>> +
>>>      apic_setup();
>>>      pci_setup();
>>>  
>>> -    smp_initialise();
>>
>> I can see that you may want cpu_setup(0) to run ahead of apic_setup().
> 
> Not only that. This hunk ensures CPU_TO_X2APICID is populated ASAP for every
> CPU. Reading zeroes where a non-zero APIC ID should be is fatal and tricky to
> debug later. I tripped on enough "used the LUT before being set up" bugs to
> really prefer initialising it before anyone has a chance to misuse it.
> 
>> Yet is it really appropriate to run boot_cpu() ahead of apic_setup() as well?
> 
> I would've agreed before the patches that went in to replace INIT-SIPI-SIPI
> with hypercalls, but now that hvmloader is enlightened it has no real need for
> the APIC to be configured. If feels weird because you wouldn't use this order
> on bare metal. But it's fine under virt.
> 
>> At the very least it feels logically wrong, even if at the moment there
>> may not be any direct dependency (which might change, however, down the
>> road).
> 
> I suspect it feels wrong because you can't boot CPUs ahead of configuring your
> APIC in real hardware. But hvmloader is always virtualized so that point is
> moot. If anything, I'd be scared of adding code ahead of smp_initialise() that
> relies on CPU_TO_X2APICID being set when it hasn't yet.
> 
> If you have a strong view on the matter I can remove this hunk and call
> read_apic_id() from apic_setup(). But it wouldn't be my preference to do so.

No, with the explanations above it's fine to stay as is. Just that some of
what you say above needs to move into the patch description.

Jan

