Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCFA71494
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927526.1330259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNrA-0004WQ-M2; Wed, 26 Mar 2025 10:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927526.1330259; Wed, 26 Mar 2025 10:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNrA-0004Uf-Hj; Wed, 26 Mar 2025 10:19:32 +0000
Received: by outflank-mailman (input) for mailman id 927526;
 Wed, 26 Mar 2025 10:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txNr9-00042K-GP
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:19:31 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce0b9a42-0a2b-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 11:19:30 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so59874395e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 03:19:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f2asm16532849f8f.30.2025.03.26.03.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 03:19:29 -0700 (PDT)
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
X-Inumbo-ID: ce0b9a42-0a2b-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742984370; x=1743589170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=enaZ41R7a26K5TcpXO33gsxTdPnQnO4M4gP9U1VD8iA=;
        b=YR2JUqso92HlRzm2JfhgWYuS++LoA8Ma8eVLAFYPvAqZ8v6aaUIYj28wVXCmmNsd8m
         iF5FwJ85pba18LoqxivhMuIk5WqevnncTh5EescB8VU7VG/ag7WAlVjunmWhRnvq1j/u
         Q/KjHqXhQMdhsy2YVe9CkLO5hEjdF3spbmDSQ3TglQoupkaMzdMHolrQM0A6kP3t6ltT
         fsIUFALIWUh9TCDUnucre7y+ZMQsK/ABEltlONd0q4vQ1i/hTJ/TwnJWpeB1ocOkADdY
         TRFvlOE/GacTmGnKTKbc1VFcXOJFNxeRNBNJJ2bVh8pUoSdfTmIdWhHICjcIOVOsG7PJ
         BDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742984370; x=1743589170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enaZ41R7a26K5TcpXO33gsxTdPnQnO4M4gP9U1VD8iA=;
        b=xTH+FiJ1tUHzM6MFHIFBjKzPNGcMQxnbpH4LwGZu1Qn7no9Hh8qJhI1ny3JfFwmJqc
         Git8e2PpETwriuR67KvmDWr/nhvlg5O7bmL8eMYoOdQrv1UYNCaFuCNb49wPJPR2GVbd
         Cr8cLg55Ma8oB+yQhMAxATqrAU7xbGV+q9An89EOmjBG3KCigQIoWP4O1Ln7sdywEKqG
         ng8mHPTnOPRdnhfZA5Un65ttjHjQJGEZvNT9RUODawOMbgYwYRjd7bFdDJJr2dBBFzmp
         I2/BIE9OvdVbwERuBsoFu8Uebbf1PVTRVI5M5iRp243MF4yCQEC0d7tB4YLxBKJAUReU
         xEQA==
X-Forwarded-Encrypted: i=1; AJvYcCV69q/xmnUTRtyfzZXOuGWBXsYr2O+4X05n2zyZqm9QlKSDBm16BNlYR7Pm03xwiXeKloROcAIFjuw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwauWUnH+g+co+j4/e7Oo2Jfz2pZFbtKmojZTUa6D4iEtM8yhTw
	d4BQNf885TVLdhgFiTnPzM9F35B30g6F4RHWWCCWsJ+qUKp0TUGT/62YeGJ+8A==
X-Gm-Gg: ASbGncuJX5mHyViIXFThgHQ3S3aCE8leMBhTLt18lFGkMmBttQ3tggeCbkOcxhBi5zv
	D3bvoAC3qSNmqO8u53CNvUrJVoM/Wgb/I7szuhemjxyVJC3srp7F008qlxJnBGoB05V7Qh7SaCH
	dgguyw+xmmYB/GwzEwbvFlaNvlcsIy24g471dj5XmJDkx27rGJJ9/pNgm7v66MKzp8rUlYI9/+T
	YSkAuwJ6O0cp7yrdlv0o+X6PkE0WdgInfjvxjSkvID9An23iQI8dK7jSaGikEoyuXrNVIomZUoX
	YHPPA3iW1obqSPpzEvCRVQVG1ntXj0Fyue3jkkPMQcT04j0sasogsmzXY/Z0BJXIaErAwtOEUpN
	pBhf0RvIyCorMAEGlEognlvSungvvCQ==
X-Google-Smtp-Source: AGHT+IGEJvYUD+4zIm2nBnWsXbg3MYCekxy8Sjc9AKbga1JLBjdq+EZ/EPEH1BS8Jhh2oYoFBUVLng==
X-Received: by 2002:a05:600c:4512:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43d50a3781amr141598035e9.21.1742984369955;
        Wed, 26 Mar 2025 03:19:29 -0700 (PDT)
Message-ID: <2e6e7ce3-0d60-4d25-ba6f-6d74599dfb8f@suse.com>
Date: Wed, 26 Mar 2025 11:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-8-Penny.Zheng@amd.com>
 <0b340303-db4e-4723-b53d-178b2676a36c@suse.com>
 <DM4PR12MB84515BDB3E64C4AEA561B266E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
 <3e0155aeee7a8629801adbc9c78a5bb6@bugseng.com>
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
In-Reply-To: <3e0155aeee7a8629801adbc9c78a5bb6@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 11:14, Nicola Vetrini wrote:
> On 2025-03-26 10:54, Penny, Zheng wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Monday, March 24, 2025 11:48 PM
>>>
>>> On 06.03.2025 09:39, Penny Zheng wrote:
>>>> This commit fixes core frequency calculation for AMD Family 1Ah CPUs,
>>>> due to a change in the PStateDef MSR layout in AMD Family 1Ah+.
>>>> In AMD Family 1Ah+, Core current operating frequency in MHz is
>>>> calculated as
>>>> follows:
>>>
>>> Why 1Ah+? In the code you correctly limit to just 1Ah.
>>>
>>>> --- a/xen/arch/x86/cpu/amd.c
>>>> +++ b/xen/arch/x86/cpu/amd.c
>>>> @@ -572,12 +572,24 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
>>>>                                                            :
>>>> c->cpu_core_id);  }
>>>>
>>>> +static uint64_t amd_parse_freq(const struct cpuinfo_x86 *c, uint64_t
>>>> +value) {
>>>> +   ASSERT(c->x86 <= 0x1A);
>>>> +
>>>> +   if (c->x86 < 0x17)
>>>> +           return (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
>>>> +   else if (c->x86 <= 0x19)
>>>> +           return ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
>>>> +   else
>>>> +           return (value & 0xfff) * 5;
>>>> +}
>>>
>>> Could I talk you into omitting the unnecessary "else" in cases like 
>>> this one?
>>> (This may also make sense to express as switch().)
>>>
>>
>> Sorry, bad habit... will change it to switch
>>
>>>> @@ -658,19 +670,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>>>>     if (!(lo >> 63))
>>>>             return;
>>>>
>>>> -#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) &
>>> 7) \
>>>> -                                : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
>>>>     if (idx && idx < h &&
>>>>         !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
>>>>         !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
>>>>             printk("CPU%u: %lu (%lu ... %lu) MHz\n",
>>>> -                  smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
>>>> +                  smp_processor_id(),
>>>> +                  amd_parse_freq(c, val),
>>>> +                  amd_parse_freq(c, lo), amd_parse_freq(c, hi));
>>>
>>> I fear Misra won't like multiple function calls to evaluate the 
>>> parameters to pass to
>>> another function. Iirc smp_process_id() has special exception, so 
>>> that's okay here.
>>> This may be possible to alleviate by marking the new helper pure or 
>>> even const
>>> (see gcc doc as to caveats with passing pointers to const functions). 
>>> Cc-ing Nicola
>>> for possible clarification or correction.
>>>
>>
>> Maybe we shall declare the function __pure. Having checked the gcc doc,
>> ``
>> a function that has pointer arguments must not be declared const
>> ``
>> Otherwise we store the "c->x86" value to avoid using the pointer
> 
> Either way could work. ECLAIR will automatically pick up 
> __attribute__((pure)) or __attribute__((const)) from the declaration. 
> Maybe it could be const, as from a cursory look I don't think the gcc 
> restriction on pointer arguments applies, as the pointee is not modified 
> between successive calls, but I might be mistaken.

Indeed this matches my reading of it. Yet things are somewhat delicate here,
so I like to always leave room for being proven wrong.

Jan

