Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B26A5FC83
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913089.1319246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsljb-0005r9-Hr; Thu, 13 Mar 2025 16:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913089.1319246; Thu, 13 Mar 2025 16:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsljb-0005on-F0; Thu, 13 Mar 2025 16:48:39 +0000
Received: by outflank-mailman (input) for mailman id 913089;
 Thu, 13 Mar 2025 16:48:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tslja-0005of-Eb
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:48:38 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0091c766-002b-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:48:34 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso11149765e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:48:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b22f4sm26536905e9.1.2025.03.13.09.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:48:35 -0700 (PDT)
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
X-Inumbo-ID: 0091c766-002b-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741884516; x=1742489316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A/1nIOv2kgvZSeHJES54lRaL87dDLICYc2vzUBxUkZo=;
        b=XYDLbuSH8SbvQAMJSykmmP5vKEbfGSTBssIpBZa1FaV5WhHy8Bkr5P+Wvl8YaGoVtW
         I7z5aHt8siTn3UcxiNJgo3EDxpvQycqJVCQW2gDK9c253Xa+mSRvzXRqMQrhm8tsA9jI
         uvH61IS/75BuhSHES6X+G5N/UeXNyhr+7MMGp7GvFn9KtypSXGDoGUM13vxBYDCLcsxz
         J901DpKdAdfSRDyYgroX6W/3GP8+EuV5m+STZCn/YhZFSDxM42yIAioqUn77BskX3Ndz
         cFBAHcUwZFGhkUAb5w6H1eYG7gHQp8TZfTbl8DqA4ocpi/IfamI42w+Zdt7AB88MNsko
         GFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884516; x=1742489316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/1nIOv2kgvZSeHJES54lRaL87dDLICYc2vzUBxUkZo=;
        b=AApLZ++bm773C9vy6Capc+mzlNTqZIpZkZ3dscttJppFouHNHtAkJ95zZevLO7V0HV
         CqlQkRrsrus3JnKpsKtGLsNfYdvLU93qwh9uI4xSBfZvI+U9JfYcSvzpvBNTbB4NcZsu
         8mTzJRZ7fqKPOD6ACS0gCBxI4PHvqoNKS8ThVmp13opeI3AQQYWyi9jbj62dor6L3gXi
         L7ARJdNOW3z4TcWLzD/IeQqHS5TrsZ8C1ilAbmBiyXEuoNq9telPwR2z1hIe0MhbQWH+
         1A50BkWpYbCri7dxtNBa8ETcAHGSAMI7Hw3AMDib2nYTV685mRsehFvYFnSF0oxWVLve
         9lKA==
X-Forwarded-Encrypted: i=1; AJvYcCV+dg8TsnSczIUJ45Qy7/z1OwxQ171J+mmNnFiCjdQl7J87pBL+VObuWVYvZZEEUKOEHA29jq+ZCfs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTnrdXZciWYdQA04rO1RKvhtmlQrOqNXpf6VU2hnIpKSAWEMhn
	bj3MHhAZPIFWnEw9VehNoFV67rT5fP9XJ4Yf7QwKuxyhbdTGXQzFyj5eT+57Jg==
X-Gm-Gg: ASbGncvFHY1NHw0fMksw19dXsBR1Z5HT+APD8ucyKyf71PEMLBh8iRQUe2uUtCMqNfd
	3r3eU8i1+H0ckOHnNKhJXI/GFvTBnBxiy6kL5aWk+DvU739Ex+G2jWHYrbO1kU82CWiZzgz1Nau
	TANbINaHiEgmwqVTiYvCsQ2pwT3FBMUQCnTa24V8condROOX3lD+JqQ7BPohUgFO5HdaWwCCPaB
	L1Is6so7aao/A40KzVoWjT/XumKqszI+GM8UwLQx48r5OeD+gaK3p0fnjR2NEUpjZcVX3S1jhJq
	1meZz8wz5vLsesnswtSTeED+vDponfgpsXH2WCQdzQhhGZB3XldY96P5OTJJMdLKrQ7dx2SmGe/
	fTHRT2AIHQkHNbPSaxJVEm0P9VihhSQ==
X-Google-Smtp-Source: AGHT+IHKrk3E2lUl++GZddcmROv4sQYKcXv8aIiLc8p5Gf96qEGlTsTX24p0Ymws0dzusJV8toxejg==
X-Received: by 2002:a05:600c:46cb:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43d01bdd4a4mr129976425e9.12.1741884515842;
        Thu, 13 Mar 2025 09:48:35 -0700 (PDT)
Message-ID: <9bf90547-43de-416e-b064-b54c0e79fc93@suse.com>
Date: Thu, 13 Mar 2025 17:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] symbols: arrange to know where functions end
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <51f2cd39-e92f-4745-8053-e51ada22d601@suse.com>
 <aace0fab-ce3f-4b9f-87c7-2daafd8442ba@citrix.com>
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
In-Reply-To: <aace0fab-ce3f-4b9f-87c7-2daafd8442ba@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 17:39, Andrew Cooper wrote:
> On 13/03/2025 1:54 pm, Jan Beulich wrote:
>> When determining the symbol for a given address (e.g. for the %pS
>> logging format specifier), so far the size of a symbol (function) was
>> assumed to be everything until the next symbol. There may be gaps
>> though, which would better be recognizable in output (often suggesting
>> something odd is going on).
> 
> Do you have an example %pS for this new case?

I haven't encountered one yet, and I wasn't particularly trying to
make up one.

>> Insert "fake" end symbols in the address table, accompanied by zero-
>> length type/name entries (to keep lookup reasonably close to how it
>> was).
>>
>> Note however that this, with present GNU binutils, won't work for
>> xen.efi: The linker loses function sizes (they're not part of a normal
>> symbol table entry), and hence nm has no way of reporting them.
> 
> By "present GNU binutils", does this mean that you've got a fix in mind
> (or in progress), or that it's an open problem to be solved?

The latter; I can't even tell yet whether this is legitimate to be
arranged for in a PE executable's symbol table.

>> The address table growth is quite significant on x86 release builds (due
>> to functions being aligned to 16-byte boundaries), though: Its size
>> almost doubles.
> 
> Why does the function alignment affect the growth?

I only insert fake end symbols when the following symbol doesn't match
the prior one's end. Hence with minimal alignment (and thus no gaps)
there wouldn't be any "end" symbols at all.

>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Note: Style-wise this is a horrible mix. I'm trying to match styles with
>>       what's used in the respective functions.
>>
>> Older GNU ld retains section symbols, which nm then also lists. Should
>> we perhaps strip those as we read in nm's output? They don't provide any
>> useful extra information, as our linker scripts add section start
>> symbols anyway. (For the purposes here, luckily such section symbols are
>> at least emitted without size.)
> 
> Will symbols_lookup() ever produce these?  If not, it might be better to
> ignore the problem.
> 
> Taking extra logic to work around a benign issue in older toolchains
> isn't necessarily ideal.

Afaict it's unpredictable from Xen's pov. All depends on the order of
entries after we sorted the table by address. The only criteria the
tool's compare_value() applies for multiple symbols at the same address
is to prefer global over local. As long as the first symbol in a section
is global, we wouldn't see section symbols as lookup result.

Jan

