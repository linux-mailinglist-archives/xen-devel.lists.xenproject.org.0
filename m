Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB80ACB1E3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003513.1383087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM65s-0004Al-Hd; Mon, 02 Jun 2025 14:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003513.1383087; Mon, 02 Jun 2025 14:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM65s-00049K-EJ; Mon, 02 Jun 2025 14:24:52 +0000
Received: by outflank-mailman (input) for mailman id 1003513;
 Mon, 02 Jun 2025 14:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM65q-00049E-5X
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:24:50 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 566e3d95-3fbd-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 16:24:48 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so13177465e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 07:24:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8b0fsm71255915ad.7.2025.06.02.07.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 07:24:47 -0700 (PDT)
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
X-Inumbo-ID: 566e3d95-3fbd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748874287; x=1749479087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+xSc7AvOYJ5oAG7rtbkBJTkVM+vaBHZuRstLmwn9AGM=;
        b=cD8goVFI6yk2r0TTvrtd53Pcfha0VJcNiIJAOvhcRRMCN4AYNSARpjxp6ZlffOg6sW
         fY8na3ZFzdkeDCESiyoKF1Q1PvHktJlliVDsU4kh2cfdpZoH4do7QnimXr5kUYHIhQPc
         ktSK5VhVIqV8kgHQmmY7RWK3awHer8oDy5+JRsVK6qhw/1fhWTiNyJz82U2yv07JGqie
         nWth776Se6guIMfSrBV4KHp4LY037208wB1IzDC80rjYwqF8LPvfrt/bKvNQYvSiJRzH
         Cn7m+nZHknakFkN/4RbrJ+tlBygPaBKhXGbmnDGrOkoQ85d3txWYxyUwvh3hmqdjsmG7
         13xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748874287; x=1749479087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xSc7AvOYJ5oAG7rtbkBJTkVM+vaBHZuRstLmwn9AGM=;
        b=T6VPXxdrpON6CwxVxkcFcBkoR1oUXpjYs4fL8oHY/utin3SCz9zK6vSNvQUEx9VqkK
         1j1h/JWuez8nCO/uaBgxpxMFvifThSVqpnh4evitWObxauG8SMIsJbb4FExytEh6UIMG
         0wEZJOVZJHdugi1BZcqqFZYXwUwbBf2/up+OLQQL2NqTQq0Vpc+adqXmAS0WeFfG5J0q
         vs67cRf/Jb8td0AmpOSBqSvTBBsUr6zhu/3UQCLHBOcISY4wfJrRfeWwW4/9RBsoDkPv
         1ybtiwQt0ksaWhCVt180UNzdsqfIueDNZEmYUg0ap/2F+yEDjZzbOKhC5pI8RUNb+rIU
         bvDA==
X-Forwarded-Encrypted: i=1; AJvYcCXy3hPJXieIYRZgyBZuVSd+4uFabCH/v2igs3/u0bvTbXuhEcusO4pYJAdYuUMwn9mA+exbuE73LFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye9N+guMLslXN4TrDoDK7vnMHF8iPNlExLhLQ20ZIweK+MIo3g
	1W0AN0+eyHy8ibPqWvMJUrEzGkgaB52Z78XaD7m2NOKs6HKmROHEpLW7IGhv/ER89g==
X-Gm-Gg: ASbGncuPVS81Q/vhqmbGd1R9qlDuzL2t8jJW4oRXZHTn7+yKdGQGzjfyWItW8AmrEDJ
	ihGk1fXpE9psAHrkUCg0ooN62/ylpE7ADUUIYy2d9T/2vyKlQJJCD3a5RSOF5JLlZKjn5dODsu4
	RhpN1fHBXxYiWDkQ3PBPmA+5LWLIdyaobevsu9F4hwO4dlclqE7LAwyDFVtPJgcr/SO4lLcovE/
	7R+8NSMEf+ue67ZO5NOyTeOcuXovU+IthTwIhSJzKVN2rM1vGiNHk4+rz/nrnZvDPgxNbc+/x+I
	+ufxYluMoez84tlg4eu4MlYDZz9NfU/5AE5ANO/Hxvnzxn3j6znea6M7Ni2R1Xxh5N0Jit/BobJ
	aU8VJF5xALGxD0+x5e79vCiOaGVSSH2+w7Ynczh8tACtnKMI=
X-Google-Smtp-Source: AGHT+IHG7eP42v2dgk428z3sGHrVSCKO9+ajlpz8VQ1N2OLEqLJtP5jPewMdY+CQ2Sfo99qOIWVtwQ==
X-Received: by 2002:a05:6000:2c12:b0:3a4:d64a:3df0 with SMTP id ffacd0b85a97d-3a4f7a025bdmr10826143f8f.4.1748874287541;
        Mon, 02 Jun 2025 07:24:47 -0700 (PDT)
Message-ID: <daa4bf8b-3082-47c0-abab-74a103c1b6b2@suse.com>
Date: Mon, 2 Jun 2025 16:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-7-agarciav@amd.com>
 <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
 <DAC42T9A7DMZ.3P5GWMI89RZ90@amd.com>
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
In-Reply-To: <DAC42T9A7DMZ.3P5GWMI89RZ90@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 16:19, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 9:51 AM CEST, Jan Beulich wrote:
>> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>>> --- a/xen/include/asm-generic/device.h
>>> +++ b/xen/include/asm-generic/device.h
>>> @@ -6,9 +6,7 @@
>>>  
>>>  enum device_type
>>>  {
>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>>      DEV_DT,
>>> -#endif
>>
>> Why would this enumerator need exposing on a non-DT arch? In fact I would have
>> hoped for ...
> 
> A non-DT arch would not include this. x86 doesn't.

Both here and ...

>>>      DEV_PCI
>>
>> ... this to be hidden for arch-es not supporting PCI.
>>
>> Similar concerns elsewhere in this change.
> 
> This file is exclusively used by arches supporting DT to abstract away where
> the device came from. x86 does not use it at all, and while it wouldn't be
> impossible to compile-out DEV_PCI, it would needlessly pollute the codebase with
> no measurable gain, because the abstractions still need to stay.

... here: In "xen/include/asm-generic/device.h" there's nothing at all saying
that this file is a DT-only one. Instead there is something in there saying
that it's suitable to use in the entirely "generic" case.

Jan

