Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84DCC6687
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 08:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188588.1509720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmFu-0003Gp-Jn; Wed, 17 Dec 2025 07:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188588.1509720; Wed, 17 Dec 2025 07:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmFu-0003EV-H1; Wed, 17 Dec 2025 07:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1188588;
 Wed, 17 Dec 2025 07:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVmFs-0003EP-Dc
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 07:47:28 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f636d7a-db1c-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 08:47:22 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso43255855e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 23:47:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310ada8426sm3312629f8f.5.2025.12.16.23.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 23:47:22 -0800 (PST)
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
X-Inumbo-ID: 9f636d7a-db1c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765957642; x=1766562442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tdcc4DDrbE+/4pognCRSg2l+tF0fZwy0o0r04FYXIZk=;
        b=gPILFuCWLHHca36oQoITgmYrpftUzyJjwli4R1BTFhZHzzlJMwnXZVygJGdQrmzoVK
         mEbmQUoBSoOMFuz7abpTWwG4x9qRIZnhe9P1e1rS7XUVdfkhwYrrES6zTEcHhIUyosn7
         15JRJMO4rahmDzw5uVs58qC9vKwGkjHltbJB5hjNudDRLmgi6WoR+T31yB64tV3mUSj2
         oq5q6ITPTfIwBoVXMNDDSdt2cmzJYcrqA7bK/KjGt2thqxEmFbQRTh+NTt6x0hY828No
         ZfYSMRbwlM/mMzRLwR3ppswvCXhgnpHy/m3s0BoF84uu5TW1aTjha/wQZarHuRTG7r/U
         4t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765957642; x=1766562442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdcc4DDrbE+/4pognCRSg2l+tF0fZwy0o0r04FYXIZk=;
        b=gBCAGYYWQvoSztHsryTIlg3ongQvHcRRa9qU+DBd+sIWGOSYffLiBngkN4lH7g63fO
         rGlxPikUU4T+3bR8lo9SQMbkJ/1nMH1wEBxgy5Gg9XHY6Uc6eOq8pNOi+qjDf66hwOh6
         YxKNE+78Cj/LHWIGIgQro2p/gn/Sv9pcCWxZKD/TrNo7VB2en19Cihx7cTluVi7HGiaJ
         Ogmal/+2cfu8M9bTSY+ndY19/ennEs28oFyeoXFb+4z7965Fg5gK5zc7U+STF6KjwT5Z
         HmNRNiazYfDuv3u6JY9VY00B3y3fsqlWRvNeY/W8doaIW1UyNVoMiKiarQkwOb+Fpf15
         slAQ==
X-Gm-Message-State: AOJu0YymVln170t1Vs2hZaBelapnwpycpxRGPoWzHR90fWemcEdcg5mH
	5kVB/Zh2fu/AedQMNQB9nJmDhl1qbXZsHLBobIv5pzpNUVjpadYoaxzdlupbFSJmPw==
X-Gm-Gg: AY/fxX4B5CAyrmL7w6mGO/f0jcE4S3t9OykngkLvIrvwpQjUDxArPECPJ8/KuxNIQ/O
	gbsbr3lmPP1G9nyvrvNzHAJRnyjyJ4nKgn6X6X6pS0WkHiT4oTXofYSbv0zTE5Az6V1Rt1SGaZA
	9va6Jg6qCkQQBZxfpWAJsFNehXe7fWBFNTUphaggPnzssB6t/X5IAzeLUo2ekkvPvrsSjHrFko+
	kIAmXdPp1zdH8h1Q/5oRn+BiMn64PrJT0d/j/B8/Lj0JifTyxNMuyoPwpFLkp7xSWlF+zMM9jy3
	9P/JdnZhIeUg0ioePkQv5Kw1GUrH9cSMyeMGmDfHOn4mIRT1OvrFGF9Y1tyGjscKSm8kKgCn/47
	F9x8aobVvYCh5rr486OG9l7ul7vaAwWDTSsYYHttMVdQBNDkO8a8OBHYRqWTeckIcMgrONNzX+u
	NnouC9i9fk50q1uWiEHGgP/WgvPI9+JZ8+mLcAldMEgQNF+DLqyDbWWWgV6Uf7wsWbQSpq7/ev1
	z0=
X-Google-Smtp-Source: AGHT+IFYEVCHdbCHpkhfM1LGD3ZUypj6N6CMOLbKmDvV4iOzaQxlhmGB6A+5D/1991To8GDyT6AlWg==
X-Received: by 2002:a05:600c:524b:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47a8f90d716mr179672215e9.27.1765957642383;
        Tue, 16 Dec 2025 23:47:22 -0800 (PST)
Message-ID: <6483e684-accc-41ed-a934-e72f3c470af2@suse.com>
Date: Wed, 17 Dec 2025 08:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: X86: build failure
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <8ee2e801-9a3a-414d-9df9-113f419e02e9@epam.com>
 <63b6f29f-29ca-458e-8d6f-3408e84173e9@citrix.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <63b6f29f-29ca-458e-8d6f-3408e84173e9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.12.2025 00:54, Andrew Cooper wrote:
> On 16/12/2025 11:35 pm, Grygorii Strashko wrote:
>> Hi All,
>>
>> I experience build failure with following Kconfig combination:
>>  CONFIG_DEBUG=n and CONFIG_XEN_IBT=n
>>
>> with gcc:
>>  gcc --version
>>  gcc (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0
>>  Copyright (C) 2021 Free Software Foundation, Inc.
>>  This is free software; see the source for copying conditions.  There
>> is NO
>>  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>> PURPOSE.
>>
>> Is this known issue?
>>
>> ====== log ===============
>>   CC      arch/x86/x86_emulate.o
>> In file included from arch/x86/x86_emulate.c:27:
>> arch/x86/x86_emulate/x86_emulate.c: In function ‘x86_emulate’:
>> arch/x86/x86_emulate/x86_emulate.c:70:36: error: writing 1 byte into a
>> region of size 0 [-Werror=stringop-overflow=]
>>    70 |     gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 :
>> 0x8f; \
>> arch/x86/x86_emulate/x86_emulate.c:78:9: note: in expansion of macro
>> ‘copy_VEX’
>>    78 |         copy_VEX(ptr, vex); \
>>       |         ^~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:8140:13: note: in expansion of
>> macro ‘copy_REX_VEX’
>>  8140 |             copy_REX_VEX(opc, rex_prefix, vex);
>>       |             ^~~~~~~~~~~~
>> In file included from arch/x86/x86_emulate/x86_emulate.c:11,
>>                  from arch/x86/x86_emulate.c:27:
>> arch/x86/x86_emulate/private.h:691:17: note: at offset [0, 4095] into
>> destination object of size [0, 9223372036854775807] allocated by
>> ‘map_domain_page’
>>   691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:60:21: note: in expansion of macro
>> ‘get_stub’
>>    60 |     uint8_t *buf_ = get_stub(stub); \
>>       |                     ^~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:3354:15: note: in expansion of
>> macro ‘init_prefixes’
>>  3354 |         opc = init_prefixes(stub);
>>       |               ^~~~~~~~~~~~~
>> arch/x86/x86_emulate/private.h:691:17: note: at offset [1, 4096] into
>> destination object of size [0, 9223372036854775807] allocated by
>> ‘map_domain_page’
>>   691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:94:21: note: in expansion of macro
>> ‘get_stub’
>>    94 |     uint8_t *buf_ = get_stub(stub); \
>>       |                     ^~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:3402:15: note: in expansion of
>> macro ‘init_evex’
>>  3402 |         opc = init_evex(stub);
>> [...]
>>
> 
> Hmm - that looks like more of the GCC 11 bounds bugs, but that's what
> the gcc11_wrap() visible at the top is supposed to be fixing.
> 
> Neither of those CONFIG options ought to be relevant.

CONFIG_DEBUG=n may well matter, due to the different -O<n> settings.
CONFIG_XEN_IBT=n otoh is indeed curious.

May want experimenting some starting from the pre-processed file. Grygorii,
could you generate that in your build env and then make it available
somewhere (together with the exact options passed to gcc when you observe
the build failure)?

Jan

