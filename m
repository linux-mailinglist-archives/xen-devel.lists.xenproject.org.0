Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD76875E2B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 08:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690113.1075828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUGD-0003RN-G3; Fri, 08 Mar 2024 07:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690113.1075828; Fri, 08 Mar 2024 07:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUGD-0003Pq-C0; Fri, 08 Mar 2024 07:03:17 +0000
Received: by outflank-mailman (input) for mailman id 690113;
 Fri, 08 Mar 2024 07:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riUGC-0003PW-EO
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 07:03:16 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee241168-dd19-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 08:03:13 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a44628725e3so210837266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 23:03:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170906a38e00b00a45f3524ac3sm103550ejz.118.2024.03.07.23.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 23:03:12 -0800 (PST)
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
X-Inumbo-ID: ee241168-dd19-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709881393; x=1710486193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u65kGKGP9OS4t/YRB0fHFsYT9hmTBiOmEwHyF8Oinww=;
        b=N39IZ5kG94JTRepz4vpXzpLo4h69aGSQKxaeGaDwNvb1NoDLHKrT7ncEvq0XBwk9Ew
         A4yCeyilIMH10u045GMcmJ7Vy+2z58pu8WLTR4HLvlWo9rcKev4dPLriZJ+TRrRMLhQP
         HlTAGo4mmbQ17VYJEYdbep/L69UHcbLV41+R4FHWtYNlz3EcXaH19yeundRH3q4MRqiV
         3l3U9x9KmzWFDCVewWhymFI47LO7ydJRbhoMpOVYZacIJ508Yz/k3eiOGdbI+WETXmJe
         MkSLkw+OVZIe3ZaAGLQ/wxbclYYjmYeVSRMDOkx8OzA+ynyvzeFwpkyrmvC8THz/nFcT
         +/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709881393; x=1710486193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u65kGKGP9OS4t/YRB0fHFsYT9hmTBiOmEwHyF8Oinww=;
        b=w8VNyQ7LUGJiksVUErfX4e/W6/Wqmf0T9PQbd/Kps5lSSG8sFQ39INWABkPOuqBhPJ
         +GL/SUXLpisiSedushVbeDDNIKI6j+Px+81hIcyKDrlPs1ZxSO+5aDIp6gi5C1hgGcFj
         ai+okr3wjkaNYq0Q4In2yrF9V8HTDmYwtbGYd91u9w69I1yqDCdSyPBqUYkllNRBB+vT
         VM6EQ6UZqgj9OKsvqXXes4/K7BcjPEYWUAbEhaw93nwoPdDlt7URWMhMgXXqo+q82h8w
         blhNaIOtQWtBQu0Avr3lGTjSXoT4j6uUQ1kK3b71+WJJcJOFPLC8/zEjVC9f1hvc3MWA
         EEhQ==
X-Gm-Message-State: AOJu0YxCz5YrRCWQotd8zrO1zvUaJMZPAoSiIIlqx0PWQkl61IkeRkIW
	aNTKe0mpzBjpQGaDYZAbqNi5cNsiIBrEa3WS7vsHmNxWrALHAXMwX5eCU3TWEA==
X-Google-Smtp-Source: AGHT+IEaEnJqREv01fQAU0+qpgaUs2hhF0cV375ZfNWdY/z62Pc0DE0bwGQIaxJiEeh6XqvCCAUNnw==
X-Received: by 2002:a17:907:367:b0:a43:f020:57ed with SMTP id rs7-20020a170907036700b00a43f02057edmr13978704ejb.73.1709881392977;
        Thu, 07 Mar 2024 23:03:12 -0800 (PST)
Message-ID: <b781fdce-c0aa-4262-97e2-38e22be70198@suse.com>
Date: Fri, 8 Mar 2024 08:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86/pvh: Support relocating dom0 kernel
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <ZemQS-8a_a5pwzf-@macbook> <f6cbaf67-f5c7-4947-a07a-0f1d8f693462@suse.com>
 <ZemVBa1rxMsNI1pp@macbook> <c771b190-134b-453a-8699-2a29c6685e86@amd.com>
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
In-Reply-To: <c771b190-134b-453a-8699-2a29c6685e86@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 18:33, Jason Andryuk wrote:
> On 2024-03-07 05:20, Roger Pau Monné wrote:
>> On Thu, Mar 07, 2024 at 11:08:37AM +0100, Jan Beulich wrote:
>>> On 07.03.2024 11:00, Roger Pau Monné wrote:
>>>> On Wed, Mar 06, 2024 at 01:50:29PM -0500, Jason Andryuk wrote:
>>>>> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
>>>>> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
>>>>> it can be configured.
>>>>>
>>>>> Unfortunately there exist firmwares that have reserved regions at this
>>>>> address, so Xen fails to load the dom0 kernel since it's not RAM.
>>>>>
>>>>> The other issue is that the Linux PVH entry point is not
>>>>> position-independent.  It expects to run at the compiled
>>>>> CONFIG_PHYSICAL_ADDRESS.
>>>>>
>>>>> This patch set expands the PVH dom0 builder to try to relocate the
>>>>> kernel if needed and possible.  XENFEAT_pvh_relocatable is added for
>>>>> kernels to indicate they are relocatable.  However, we may want to
>>>>> switch to an additional ELF note with the kernel alignment.  Linux
>>>>> specifies a kernel alignment in the bzImage boot_params.setup_header,
>>>>> but that is not present the ELF vmlinux file.
>>>>
>>>> I wonder whether we need a pair of notes, to signal the min/max
>>>> addresses the kernel supports being relocated to.
>>>
>>> Plus, as per your other reply, a 3rd one to specify alignment needs.
>>
>> Alignment we could in theory get from the ELF program header, if OSes
>> fill those reliably.  FreeBSD seems to do so, haven't checked Linux.
> 
> I will look into this more, but at first glance, I don't see a 
> connection between Linux's CONFIG_PHYSICAL_ALIGN and the values in the 
> elf headers.  As a quick test, I set CONFIG_PHYSICAL_ALIGN=0x800000, but 
> the elf align values are still 0x200000.
> 
> The elf header values may be a suitable fallback though?

Imo, given the above, explicit values should be required. Better not
load a kernel than doing so and then getting hard to debug crashes.

Jan

