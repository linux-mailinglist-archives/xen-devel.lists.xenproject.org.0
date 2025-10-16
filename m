Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941B3BE2DC8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 12:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144426.1477824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9LQG-0006qu-Jv; Thu, 16 Oct 2025 10:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144426.1477824; Thu, 16 Oct 2025 10:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9LQG-0006ow-Gv; Thu, 16 Oct 2025 10:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1144426;
 Thu, 16 Oct 2025 10:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9LQF-0006oq-3z
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 10:41:27 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa363c94-aa7c-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 12:41:25 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so329392f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 03:41:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42704141cc3sm621425f8f.9.2025.10.16.03.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 03:41:24 -0700 (PDT)
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
X-Inumbo-ID: aa363c94-aa7c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760611285; x=1761216085; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Prue7TJG0D8ESilQ5vJPKJdO0Y6nIEWiUxG/sU9D56o=;
        b=EI5dgwdNt1YOSfjd7iFzetrsIJyjSzlCOSrfHTR+zfIuXkSQQApcrOxcbCZ4acy2OA
         nI0qTcZecvH82JGhNUlDbqF+E5/Sg1kwk1pyt7NHIvCOkXItwKHshRhX6MAgMc3gNjzM
         4XXs+plcrwnBKos6qk0HCPqSmCX7P6/CfG7kLu7K1UoliA8Q2zzqsHBtrHwX1ui5zGoF
         cTmO2cGVuxeMixPucbJlJGBGd+pmiB8gTZ29bfAw2/3cTRvRgnXZFdS4izi4SO4AeRMI
         VI5Nv8xb9TJSl6oQ8nQsieACj8vnyUtRLmiTmL/k2x8fgjb0OpzTFfoR6tQ8A8UVuZ+v
         WVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760611285; x=1761216085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Prue7TJG0D8ESilQ5vJPKJdO0Y6nIEWiUxG/sU9D56o=;
        b=ub7UCWGcmgExGU1/y52tjbU/CuoS1lyy99geZz1d2dReudbqO+HVL22IPo6P8x3opn
         xn2n4CBMPOLTiZqrtq0zpf6vrOmtJ82oLKLvt9LXq6D+tZju0DV1EGtIDwVoC3408/dQ
         3t1az0o873nIYLr2kcIOXoRwXBU/pR2NN/hrMciCEO9zUNf27vB9hjEPLyTcHkqmAMZF
         HWw6oWPNK9Jbxm2ZmyY2zMUuelYmSnoAK6k08jptxboTr8oGDR8pCO+XdHKvTLdoX/3c
         jX97uAhDyQ+jmiNSzrFO8N0nz8WRg+wf7Ek6OEWQ0pKmz3M4O54XzWz6lCuVzmTnCZOO
         BUxQ==
X-Gm-Message-State: AOJu0YzB1K9it0v+gVVlSuPTv81aonP7GA1DqGYtA65WMaRyJSQcDipa
	aWVR4MSWQGg42Su+2ggBwzTrsDRUealhX8wXVIz9lwhvdwlyrwO0Zrb1rvA3YbhLaw==
X-Gm-Gg: ASbGnct5qIo/LAqJwySXDksWvWoq7RlfP/VBFPI76buHu7HBZJlCTbb6kvAZuxC1YJU
	z/qeXJX/1EiW4/rzS/0AO3OPsMMRGHoJnzdswR0ALub8MMDbsE+w9pEvd/FuJrfneOEPQZEtMYA
	9+poNEGMreF0XlogtE5wZgHQSPPizUmOHkMtQQvTJDsBtqz18lQQ6BAyJPYwpwOMNEZAq2Ntj7V
	Tpx0bRg1d/4+9PFDHqthJmBq+HvPJjTkvSYJrLaaeUhJ82UhVuK5K6V7+iYXdLmVr4GGhsr8VnN
	8zsrJtsg2w1FK+zuU7IGEowaNgjbKz/n+GN7g+8QCInt9HtduiCbMwFNR02o9M0TVSlhOuY2EYQ
	EP4Q+tK8RPlXRY3zJCHeYoolIjfceIcCp2mci7jf+WbZhOApFa3SPhyT4CBXPMheZWkIUj4SHNx
	1uLt7JiU005daUr4p19u092QryX8Zh3g0l6CACLh3okHv5jDLLDxgPOotXg/sM76YG1bv+5j8=
X-Google-Smtp-Source: AGHT+IHGcSNKnD+VzzVMDKeVAduU3+/TjF127FJ7TJYPxROUbGmHN7bdMMJwuk7sRPNFthPpgIXCJg==
X-Received: by 2002:a05:6000:2dc7:b0:426:d5f4:7913 with SMTP id ffacd0b85a97d-426d5f479cbmr12397371f8f.42.1760611285237;
        Thu, 16 Oct 2025 03:41:25 -0700 (PDT)
Message-ID: <0c54bb8b-4fd5-458c-9fd3-8320e598ae4e@suse.com>
Date: Thu, 16 Oct 2025 12:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 00/10] x86/HPET: broadcast IRQ and other
 improvements
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <aPDDW9N6plRHw2Rb@Mac.lan>
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
In-Reply-To: <aPDDW9N6plRHw2Rb@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 12:05, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 09:30:28AM +0200, Jan Beulich wrote:
>> While 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt processing")
>> helped quite a bit, nested interrupts could still occur. First and foremost
>> as a result from IRQ migration (where we don't have any control over the
>> vectors chosen). Hence besides reducing the number of IRQs that can be raised
>> (first two patches) and possibly the number of invocations of
>> handle_hpet_broadcast() from the IRQ handler (optional patch 4), the main
>> goal here is to eliminate the potential for nested IRQs (patch 3). These
>> patches are imo 4.21 candidates (with patch 4 being questionable altogether;
>> see there). Patches 5 and onwards likely aren't important enough anymore at
>> this point of the release cycle, even if those with a Fixes: tag would likely
>> end up being backported later on.
>>
>> The one related thing I haven't been able to find a viable solution for is
>> the elimination of the cpumask_t local variable in handle_hpet_broadcast().
>> That'll get in the way of possible future increases of the NR_CPUS upper
>> bound: Much like right now a single level of nesting is already too much,
>> if the limit was doubled even a single IRQ would end up consuming too much
>> stack space (together with cpumask_raise_softirq() also having such a
>> variable). Yet further doubling would not allow any such stack variables
>> anymore.
> 
> If there's no nesting anymore, you could introduce a per-CPU cpumask_t
> to use in the context of handle_hpet_broadcast()?

Not quite, as there are other callers, too. But yes, possibly other callers
could be dealt with differently.

Jan

