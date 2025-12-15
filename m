Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B51CBE32A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187046.1508477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9H7-00039Z-Oa; Mon, 15 Dec 2025 14:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187046.1508477; Mon, 15 Dec 2025 14:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9H7-00036l-La; Mon, 15 Dec 2025 14:10:09 +0000
Received: by outflank-mailman (input) for mailman id 1187046;
 Mon, 15 Dec 2025 14:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV9H6-00036K-Dc
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:10:08 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbd21ad0-d9bf-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 15:09:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso28222425e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 06:09:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f8e9115sm191173085e9.12.2025.12.15.06.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 06:09:54 -0800 (PST)
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
X-Inumbo-ID: bbd21ad0-d9bf-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765807796; x=1766412596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IkzkyO8rsnWrEYhYiX/uJfUzaY1Qiyu6dEUX9CxH620=;
        b=gZO37MprNycINCsbGY8lwdiyIus+VHNFiRYSsDyA4ototoMCkE14D26arJXrg/B1yM
         VkhdoNjWlcAFFyNsCaiEKRJW+OiHHI5KVkbKH+MMPOXzVNyuePqRAv7TwJc7yjMAbzDu
         GlEr0IxekESKxqgwoyHwoVF/bjNbzLhmYV9bkEE+ptczpMzmnANnGjueIk7tnq5dKyWx
         KiDQJqxG9bIcm+0866sUjoz0NRLh51CH6Bi5AGeJijuRD+RPyQy5BRIDIrNr3sPKVstC
         pnxAHMUGul6DBDAvrkQD6tgYNh75Y4ahkwpqYr3smc/SvhTsqGsqdje0Sw6Rkergd781
         Ivtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765807796; x=1766412596;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkzkyO8rsnWrEYhYiX/uJfUzaY1Qiyu6dEUX9CxH620=;
        b=xKkRdTZufN06ItcrzOxbEm3zs+sLgnQ6NQ/C2ejCXA85UrnR5LMd0E1wvaQPpHkSob
         /sEok8azrz3vNzUjwU+jhwCGWUadg2+V1aioUQJjUNhXooLNpG/RfqSmKBOR6MR9YJKN
         I9Lpq+yqk0P2if0L2mWX7BlSkFmvD/OVqzujK2tfBcHPh13mhGiv249zyCylFp2p9ANz
         FOT7UVlTsGYaPKsROr6hIar0653ESDMiHjX7svwajw5fnNcyD7/jyQh5W+i98mOg34M4
         VE5mCl3vjLEUnvCxRM3/GFKB8Qr43I3N8AgaEw501v+KZlDjons0fWpV01Ms/C5yMZ5C
         4qbg==
X-Forwarded-Encrypted: i=1; AJvYcCXxKwwejSlxL1RuJAT+WtwE2XXxxENsXskxIRuxgRpCY7NuSqpb8BQuHZRiwgHLQLrg85GhlIkHoJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxU7SCyxV8hofagr1jMgVd6SiM31yPreZ8FPfdjAtFVBYQgeYuB
	t68OW+fAwP2Rbu8FFgVVJE2RmrYyOzOD7BghgWdCKoyzJAi9LwWWgQormsmG2u8VXQ==
X-Gm-Gg: AY/fxX5bvqPDu+D5UdwSUZu8ISsPFHC3VOERf7AsTlAlSCyOFYUkG3IIWNUetbaJdSS
	XvdKftHmfuAG2LJUry6bPVC0VmQw5gXVffVTp3QOMLIoDOvA1F567FhPn5JZ+SAGm0Z5b4Kbcep
	eBf8irhsULFsxHP+THoxSU0r4b9YZrbFokR3bFO3tVZIhGmWt35rPxpJPCK8kWkRgQQ88kWxlby
	AFiQ4PV8Va/6QnZ5A7+E55U6pq1x3si1sttkkBeTc8zdHAh1bcMv9mom5RxNzVRDCu39+0VUWOc
	X/R5FMXAOzgaIqK7kh0V99mGOPlXh4uee1nuVdRY/ksIngnhj+CQf5DrlqDbvJULVOz3OFVqJIj
	7t0tK2cJh0L51S/jL8D5V9r9TsQMj2QH3N5cx8uxIGO3aSagLy9lddvet2+KsxBwnbkhsbI/YnK
	+rXVo3HsRTbl9ikNugY+uBjN7FeCPC3gC+Zhf2iPu/auTATLtI7CMyupcAXDRebt0vBt8uX+J5i
	LU=
X-Google-Smtp-Source: AGHT+IEK6EPC7YSjjl5gIkpXsJ8eA+ROk66oIRuZnKJ6wp8efiRqLqkGUm6jCOAPnGNTsp2ihz0dOQ==
X-Received: by 2002:a05:600d:105:b0:47a:97c7:f08b with SMTP id 5b1f17b1804b1-47a97c7f1a9mr41033765e9.31.1765807795448;
        Mon, 15 Dec 2025 06:09:55 -0800 (PST)
Message-ID: <091bafe9-ba7f-413a-a740-7856b79f9307@suse.com>
Date: Mon, 15 Dec 2025 15:09:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/24] xen/x86: library-fy cpuid-releated functions
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-3-Penny.Zheng@amd.com>
 <e09ed373-47a4-4afc-84df-b66184ea424a@suse.com>
Content-Language: en-US
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
In-Reply-To: <e09ed373-47a4-4afc-84df-b66184ea424a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2025 13:14, Jan Beulich wrote:
> On 12.12.2025 05:01, Penny Zheng wrote:
>> There are some cpuid library functions only referenced in
>> XEN_DOMCTL-case, and shall be wrapped with CONFIG_MGMT_HYPERCALLS later,
>> otherwise they will become unreachable when MGMT_HYPERCALLS=n, and hence
>> violate Misra 2.1
> 
> At this point of the series there's no MGMT_HYPERCALLS yet (see also my reply
> to the cover letter).
> 
>> For file cpupolicy-clr.c to contain cpupolicy clearing library function:
>> - x86_cpu_policy_clear_out_of_range_leaves
>>   - zero_leaves
>> For file cpuid-cp2buf.c to contain cpuid copy-to-buffer library function:
>> - x86_cpuid_copy_to_buffer
>>   - copy_leaf_to_buffer
>> For file cpuid-cpfrbuf.c to contain cpuid copy-from-buffer library function:
>> - x86_cpuid_copy_from_buffer
>> Sunmmerize all needed cpuid-library object file under a new variable
>> CPUID_OBJS in Makefile.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>> v4 -> v5:
>> - library-fy cpuid-releated functions
>> ---
>>  tools/fuzz/cpu-policy/Makefile               |   4 +-
>>  tools/fuzz/x86_instruction_emulator/Makefile |  11 +-
>>  tools/libs/guest/Makefile.common             |   4 +-
>>  tools/tests/cpu-policy/Makefile              |   3 +-
>>  tools/tests/x86_emulator/Makefile            |   3 +-
>>  xen/lib/Makefile                             |   5 +
>>  xen/lib/x86/cpuid-cp2buf.c                   | 123 ++++++++
>>  xen/lib/x86/cpuid-cpfrbuf.c                  | 129 +++++++++
>>  xen/lib/x86/cpuid.c                          | 286 -------------------
>>  xen/lib/x86/cpupolicy-clr.c                  |  73 +++++
>>  10 files changed, 346 insertions(+), 295 deletions(-)
>>  create mode 100644 xen/lib/x86/cpuid-cp2buf.c
>>  create mode 100644 xen/lib/x86/cpuid-cpfrbuf.c
>>  create mode 100644 xen/lib/x86/cpupolicy-clr.c
> 
> This looks to be doing at least three things in one go. If all of them would be
> simple (including them being a reasonably small diff), that may be fine. But
> the diffstat above says otherwise, so I may I ask that this be split in three,
> maybe even four pieces (one per function moving to a new file, and maybe one
> doing prep work in the Makefile-s touched)?
> 
> The filenames also aren't very descriptive. cp-from-buffer.c, cp-to-buffer.c,
> and cp-clear.c maybe? Albeit the last one is where I'm the least convinced
> that splitting out and making a library function is actually a good idea. Note
> how I also didn't mention that function as a possible candidate for library-
> fying. I'll try to not forget to bring this up with the x86 maintainers later
> in the day.

Having discussed this, we thought we might as well aim for proper library
fication (longer term, i.e. not something we'd ask you to do). Therefore
splitting by function is generally okay, but the filenames really want to be
sufficiently descriptive. For x86_cpu_policy_clear_out_of_range_leaves() this
may very well mean cp-clear-out-of-range-leaves.c (not sure whether
shortening to e.g. cp-clear-oor-leaves.c would make sense).

Jan

