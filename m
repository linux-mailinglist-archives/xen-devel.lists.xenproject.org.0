Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2CB1AF79
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 09:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070048.1433699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCGC-0000SB-1E; Tue, 05 Aug 2025 07:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070048.1433699; Tue, 05 Aug 2025 07:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCGB-0000O2-Um; Tue, 05 Aug 2025 07:38:59 +0000
Received: by outflank-mailman (input) for mailman id 1070048;
 Tue, 05 Aug 2025 07:38:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCGA-0000Nw-7c
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 07:38:58 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2cc588-71cf-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 09:38:53 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so845509366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 00:38:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a2436easm857845666b.135.2025.08.05.00.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 00:38:52 -0700 (PDT)
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
X-Inumbo-ID: 3c2cc588-71cf-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754379532; x=1754984332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qLoBfqbr4yIKmzit5NTC4INwlOdLMWn/X9rtxZEv4Vw=;
        b=N0B4CZs2IGGiYBhfakru6FuR7a+FViHdT0EBiPZ0rfhcpVDZbyMGRHfB5J57ZoV9fG
         LjQZPPaSrJGNTmHRDPiFByiRZWqgTXhgDL+MLyj7q0ZPdU/5kfU6q0ZnbmJA6hdJYAov
         VTOmir78ek4jux2c8HigJwg9Ay/gPmCCFhzwmblbHI9rUqFWIdMPpNB+atABg7k+e02d
         dMEB97oxi77Ymi0EHyXlLb8MOQxIQ8CM/ODSln0rK7q2cmkk5B+aV4/4y0F/5fxaoVj3
         bff/QZfqyGeK6HdBryaWe0U8nPmb8biRPsk82IeDyL3v8zARKvSquHh1zZYbK8b1ZW0l
         jRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754379532; x=1754984332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLoBfqbr4yIKmzit5NTC4INwlOdLMWn/X9rtxZEv4Vw=;
        b=efdNsBaqLTRAU5rhpDncARdYUQUIhvJdJX63tGOtRm78DHNH033jBDUani66ZeDbA/
         t6SkDz+q5fDopK/HteEonUq8ANfv3qhaubr7hGCP0oOvbYPI8Enrd8PtihrS+hPW5aH1
         ioivrRG0OxEm/Rs+xi5dhyCLSJM6mAwfsahHajgputrWB3fEe9HWRTqIHsUnzO74tfBx
         XqAAXViDsECQ201EIozLpv5WUVpnrrOQvrGJpjCfU+HkEe/AVTR+4ZvyeBQ+uHDozU8w
         egalm02/FIqrh+I7clEC48G6BoaihJ37/ZOOZsA9ZkjigKp6PjTB1wMSE5CjgRID37qY
         AF6A==
X-Forwarded-Encrypted: i=1; AJvYcCVULUVLSZuMgCo8YxKOyXSeaq+TyXcybFPkm6pZQHiLeLNDlxxF94D1QndaXkv+ewsmAD7I/i1XeuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6jM6PrFNzKJmtJvwSOKVikE3a79np4pqsB7M4uNUUQKEtlcqh
	vWAAK1qF/++8PsjaaRkL2nFaKcp/NueNvK4Fd8IUrKSAjCuC3zaaiHw67isFXcQxEg==
X-Gm-Gg: ASbGnctXzsFL5rUFHy8rVu4stn8A9lGbWEe8cg+wugiNu0tZmrYBvmpb0SwfuFwjL5M
	hKC2E5CIEk96qeCNl1WkU3SwjdN9rYdGommXWMmdKnYQfveaqGrWEX5e7nkYBN74wN6nzZpyAMh
	acoI5+NOhAXJAwgBZxD00gj36yFYFYBkTapqAcxac0Euuoc/9445x5yPRUzCAzzaRQLxxeVA4+3
	Ci0pRI3J6pMSqJAd0cuoDt7EKrH2M8FXAokv8ng1fRWZYjXfGo8TfeIFS3s1sUvvqYVenhS/vbz
	Hz2blgWrbfSUhB/PyrqMmnIteE5YtVGmAcfBQKhIid476C716I7wlkB6Vec627JVfghYKSlO1sG
	KvBof36W3KX+l83b5nyztl8wrXcHPZ0EfyFNC4giGk6PNIsh4CDbmR+vPW4Q/KkZAAwZFcZ42wu
	BGC3WrEssnLSbYrDzxGg==
X-Google-Smtp-Source: AGHT+IFSgAjwLv1lh6e82nmDgNhSeOWZGXHK8AvFhMKC4j3s32rcAGnZ9Cg0HxRHc8hU5IxN5jAZHQ==
X-Received: by 2002:a17:907:2dac:b0:ae6:c0a3:1606 with SMTP id a640c23a62f3a-af93ffc5afbmr1342059966b.7.1754379532565;
        Tue, 05 Aug 2025 00:38:52 -0700 (PDT)
Message-ID: <3e20688c-c125-4aa4-bc06-1fe634550f70@suse.com>
Date: Tue, 5 Aug 2025 09:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-2-Penny.Zheng@amd.com>
 <371bc812-acdb-41ef-950b-3c9e5feea48e@suse.com>
 <DM4PR12MB84510F1F89641B672916C055E122A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84510F1F89641B672916C055E122A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2025 05:38, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, August 4, 2025 3:43 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 01/25] xen/x86: move domctl.o out of
>> PV_SHIM_EXCLUSIVE
>>
>> On 03.08.2025 11:47, Penny Zheng wrote:
>>> In order to fix CI error of a randconfig picking both
>>> PV_SHIM_EXCLUSIVE=y and HVM=y results in hvm.c being built, but
>>> domctl.c not being built, which leaves a few functions, like
>>> domctl_lock_acquire/release() undefined, causing linking to fail.
>>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE
>>> Makefile /hypercall-defs section, with this adjustment, we also need
>>> to release redundant vnuma_destroy() stub definition and paging_domctl
>>> hypercall-defs from PV_SHIM_EXCLUSIVE guardian, to not break
>>> compilation Above change will leave dead code in the shim binary
>>> temporarily and will be fixed with the introduction of CONFIG_DOMCTL.
>>>
>>> Fixes: 568f806cba4c ("xen/x86: remove "depends on
>>> !PV_SHIM_EXCLUSIVE"")
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>> v1 -> v2:
>>> - remove paging_domctl hypercall-defs
>>
>> And you've run this through a full round of testing this time, in isolation?
> 
> This commit shall be committed together with "xen/x86: complement PG_log_dirty wrapping", (I've added in change log, idk why it didn't get delivered in the mail list in the last).

And "committed together" still means the two at least build okay independently
(i.e. allowing the build-each-commit job to succeed)?

As to the missing indication thereof in the submission: Patch 01 has a revlog,
so if anything was missing there you must have added it some other way. But
the cover letter is lacking that information as well. (As indicated earlier,
to increase the chance of such a remark actually being noticed, it's best put
in both places.)

> As PG_log_dirty is disabled on PV mode, paging_domctl() will still have "undefined reference" on PV mode, which gets fixed in "xen/x86: complement PG_log_dirty wrapping".  I thought it better sits there.
> If it doesn't comply with the commit policy, I'll move according fix here.

Let me post a pair of patches dealing with part of the problem, in an imo
(longer term) more desirable way.

Jan

