Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D401AD6FA6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 14:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012944.1391479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgdV-0006Cz-Ky; Thu, 12 Jun 2025 12:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012944.1391479; Thu, 12 Jun 2025 12:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgdV-0006B3-HV; Thu, 12 Jun 2025 12:02:25 +0000
Received: by outflank-mailman (input) for mailman id 1012944;
 Thu, 12 Jun 2025 12:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPgdT-0006As-SZ
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 12:02:23 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19108feb-4785-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 14:02:22 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so538642f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 05:02:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e6d99b1sm12124005ad.116.2025.06.12.05.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 05:02:21 -0700 (PDT)
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
X-Inumbo-ID: 19108feb-4785-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749729742; x=1750334542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jz1D4NLhV0Y5c5KxrDkXzqtjgWF7HMWo307y7/2+RrQ=;
        b=RmW3cX8cbpSvNm71Ds3ftj+6QR1dFNs75M+sDLWSLIc541kPxxuC+B1oHbOH/bfjpf
         WVM6FCjcM+rLqFo4C87ZR4EGYZKUglAVwWX+kz2hdBjrZ5UqW5KcIarlTKIKKMhE51qW
         WgpaVu4M9Mz6TZXQIeTTUDzAQGUbYwqvbGEuNZCzwSzj9cj5g/V9qAqkXHPV6uaxbK7P
         SK7xNrWk1qMQ9rbeLNwu+LuwLF3SEnkDuG4c+by69Vpsn3yvmCWmdFBKie3r1B9YIOYS
         9HUQkrety0f06DneIgGg9uTYHX/4QqoJJIAVeA+j+7n3qgM0hz1FtDlalSkdDzZxiJyk
         OpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749729742; x=1750334542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz1D4NLhV0Y5c5KxrDkXzqtjgWF7HMWo307y7/2+RrQ=;
        b=uDNufAh+ZEmagYdB/vQnb+fTob12DU2jp3vu4D6y8CtEr2yo3rm1v7RHb/FrQbTYTj
         7oVeFog9ita5N2Z4R2cDgGKGJrHP6q/8CDVSyyFfuPjAnuupA+da6idNa1ZWjSQ73ayA
         GQdyH5M8dCHyx51yQjJebTsWpqfdLFjHzj+7lOx/5F0IS1L7DqZiJQZY6VGSdzcLZrZt
         oAxR4ZZOhHhVHwRUqSm4o7KLH9AyjkFIt8tbjMCvdLgom7zZ3Yfw6YhoGWdu0P1UopOD
         /rIZTSoCBPDK3VCpdQFHEIjuQ57i7J1MrIubIBijTKnj4991GatDZiSF9y1dkKhEaqrb
         aM7A==
X-Forwarded-Encrypted: i=1; AJvYcCWbeRw86fROlmHEZdk7692vmRuMje1/jIqnDjBgzOqiHJeOe/+BbZxqOIqLHGaIB8Mm7YEJUukxc8I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4T9TCTzdTFc2Am68mOnI63DYXaBM1YybG+mFmCPJ59FLOyQTy
	QJpM9LE44WwlnUnqXZHiS1grgOomRMZG3L5PqOa1IRqcFOsMeiLm6oJzyh92y/WfIA==
X-Gm-Gg: ASbGncsEmyz9E5GBRXc1hZdgsXUVR93QzqDocXfA/0LPxSAdp1+IWgCcY0uvT6JL7yp
	04BbARkCzdGMEpW9LHo+YFqhDmpQJTveBKeVX3sPc1/lv0sL4JNQycpN6HHDaX0jqlKhX422ems
	vf6pFvwpDBy50q5wATMxP0OZDFsPWuaGgWI4+nMEtO8T+eXuqpN3lx49E65jo0uqjrj22e9ifMR
	c4jFG9N68eQNvy5rfbIiIW6kvIQi9EzP2KLxy94l+4f51noHyKsADHMOFKNYxoEny2zdq0A8tdH
	/bxoWqbm+vaMQv8uc9BS8AgzU3SphYAjWGUEF6HymS7F3VhYL6zhwzEpfnbUDDUqN5K67fwgtYE
	wPs/Vud4S3+j0uMs7t3JwRpEuD6xHAGN8mx/iv58nBOLvALA=
X-Google-Smtp-Source: AGHT+IF84x8rjTtpG3ogTw4fedIa2jSnt/AOCR8gnICiC60itGzx/aRwt+xLQHNkb4rwOEWI04ZTEw==
X-Received: by 2002:a05:6000:2086:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3a56078f39cmr2569776f8f.12.1749729741866;
        Thu, 12 Jun 2025 05:02:21 -0700 (PDT)
Message-ID: <9074f1a6-a605-43f4-97f3-d0a626252d3f@suse.com>
Date: Thu, 12 Jun 2025 14:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] pdx: introduce function to calculate max PFN based on
 PDX compression
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-3-roger.pau@citrix.com>
 <9e7925c4-3695-4320-8552-4ee0e39350e4@suse.com>
 <aEqwdKXaugedfAm4@macbook.local>
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
In-Reply-To: <aEqwdKXaugedfAm4@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2025 12:48, Roger Pau Monné wrote:
> On Thu, Jun 12, 2025 at 11:11:14AM +0200, Jan Beulich wrote:
>> On 11.06.2025 19:16, Roger Pau Monne wrote:
>>> This is the code already present and used by x86 in setup_max_pdx(), which
>>> takes into account the current PDX compression, plus the limitation of the
>>> virtual memory layout to return the maximum usable PFN in the system,
>>> possibly truncating the input PFN provided by the caller.
>>>
>>> This helper will be used by upcoming PDX related changes that introduce a
>>> new compression algorithm.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/setup.c  | 19 ++-----------------
>>>  xen/common/pdx.c      | 25 +++++++++++++++++++++++++
>>>  xen/include/xen/pdx.h |  8 ++++++++
>>>  3 files changed, 35 insertions(+), 17 deletions(-)
>>
>> This is all fine for x86, but on Arm you introduce unreachable code, which
>> Misra dislikes. Yet then it feels like it's wrong anyway that the function
>> isn't used there.
> 
> I was also concerned regarding why ARM doesn't have an equivalent
> function.  Is the frametable there supposed to cover up to the maximum
> physical address?  In which case there's likely no need for any PDX
> compression in the first place?

Question goes to Arm folks.

Jan

