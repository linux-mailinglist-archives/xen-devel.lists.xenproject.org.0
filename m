Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C731B05761
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043946.1413997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcUA-0005lK-G1; Tue, 15 Jul 2025 10:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043946.1413997; Tue, 15 Jul 2025 10:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcUA-0005iI-Ck; Tue, 15 Jul 2025 10:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1043946;
 Tue, 15 Jul 2025 10:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubcU8-0005iC-KO
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 10:02:04 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1b816e1-6162-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 12:02:03 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a528243636so2875964f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 03:02:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c301eb975sm14718456a91.46.2025.07.15.03.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 03:02:02 -0700 (PDT)
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
X-Inumbo-ID: c1b816e1-6162-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752573723; x=1753178523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=03Mu3PnduTHNZLtLpjjXxrB966pBE79x9zYiNeAtufs=;
        b=d9bH+qHaDfadV2g2cbYGlKdbsPx5FPlo+d90pJrvh5VgZ2Om8n3aMPUBL9Je+V/9Gj
         82nIt/lNOCrKLzs3MYwqf/M6u7oiFbWqoqzVDNE+bxo1/pJqcq5esZnj8zfMRy/LdSt6
         oWXjEzb8EAF/S9bnC7besNH6x9iUrNVsjWbNjjONdg4TeOmPcryCgmB8Ap5k+METq1MO
         XPsr7o+yDOL9+XrOQ5dGvoN4a01GqZnmCJpnH5lPmVFSay54AJlncgwYArjNQLVhbiu2
         orYYPWlq7RZvG6HdnEiPyUroUQNbQyoLEWoqr3f8i+N6gwReDewFzVwSpw/nTouA19RY
         f2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573723; x=1753178523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03Mu3PnduTHNZLtLpjjXxrB966pBE79x9zYiNeAtufs=;
        b=O/zAoBRc5pM6YExdNtzLjkq9UGzLJVpC/fyMkbB+BcFwJ+LJZJbNwFloRtWORSr5Da
         eAHososLOfafa+UwqkuYiljCivY63D46LNrjaVlOmfsw2dSvV9PC6WZ0JbOxH6yXkcwH
         x0EXwKHKPf/FkkMuwpNoI6arDpbLotTMFwHDns5gH56XlbMXh+94RQxbcyt1QE30o2rI
         k65KGIHY64IKWvBgovLwJcwHFuqRcit4Ouv6RGHETzUFwHvwty4gzXbXNeTY9C0cN02u
         y9yNngK6n+fehteuzN8DMSSIvuC4bMyVkt2zqH9UhHaOcB2575YrpRgjJ5q60WYjITBb
         drog==
X-Gm-Message-State: AOJu0YzD5Sx9YlOFnwacIK2qZh4tf0sPIDKukkyg/WcwEDM2qx87T77f
	e8joLdRpphIM7vJHJh6IL7ldxq1B4tANNNN2bHtM7bDIjJqcvqYaMiNOHbzGyosFLA==
X-Gm-Gg: ASbGncvkwORHxaNCAzOMekrkCnhy6CdgDWYTMjAMg01d3305m3SUfRbI6eaj4OLrzms
	kF45dKEkIjkGgm6GcZ4ia3QhxD24nPLzyiowcngBnVzuzcLtfri94e5uvTuDnUu1qustZesLGds
	g+BCGYuEiyT1NsjLH51sz/beF8HhS2dbIZd022hRixHfmrWsBWcBkycRUco7OBofPHCLf5Dy2ja
	8L9grp3bSVjYRKdnpBHeC0mjFk4t8CpKy3CaObMWjcLOQ1NkwR7ewTqCYxntjFemNSLB4+8HTSO
	/6v7rJWE2D01/1IXy9LgcE2hMl0t4MXaDSjHJaahB9DtuO3J4iDCx+qjXJzhcieQU/yZ5sSeXsx
	i/pLG6sQMgR6zG16/aNo88b6v2vM7rOuj/S/O63tkLaE5q2cEvqXjIsiF0akwuFNNk2gTrc5iUt
	Rc7J7xTtc=
X-Google-Smtp-Source: AGHT+IEwRqyLWcNP10XmNZ5FGUKHCZQG2ZYKukhb5Wk4/LkGYLsfW4C9hovRDW8rc5xlwb7mr7Clqg==
X-Received: by 2002:a05:6000:24c6:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3b5f187a48cmr12071135f8f.12.1752573722683;
        Tue, 15 Jul 2025 03:02:02 -0700 (PDT)
Message-ID: <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
Date: Tue, 15 Jul 2025 12:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
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
In-Reply-To: <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2025 11:46, Dmytro Prokopchuk1 wrote:
> Could we proceed with ARM deviations only so far?
> I understand Stefano's preferences, but it can unblock me to address 
> next ARM violations.

Hmm, ...

> On 7/14/25 10:55, Jan Beulich wrote:
>> On 12.07.2025 03:13, Stefano Stabellini wrote:
>>> On Fri, 11 Jul 2025, Nicola Vetrini wrote:
>>>> On 2025-07-09 23:38, Dmytro Prokopchuk1 wrote:
>>>>> MISRA C Rule 5.5 states that: "Identifiers shall
>>>>> be distinct from macro names".
>>>>>
>>>>> Update ECLAIR configuration to deviate:
>>>>> - clashes in 'xen/include/xen/bitops.h';
>>>>> - clashes in 'xen/include/xen/irq.h';
>>>>> - clashes in 'xen/common/grant_table.c'.
>>>>>
>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>> ---
>>>>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>>>>>   docs/misra/deviations.rst                        | 8 ++++++++
>>>>>   2 files changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> index e8f513fbc5..a5d7b00094 100644
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -117,6 +117,14 @@ it defines would (in the common case) be already
>>>>> defined. Peer reviewed by the c
>>>>>   -config=MC3A2.R5.5,reports+={deliberate,
>>>>> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>>>>>   -doc_end
>>>>>
>>>>> +-doc_begin="Clashes between function names and macros are deliberate for
>>>>> bitops functions, pirq_cleanup_check, update_gnttab_par and
>>>>> parse_gnttab_limit functions
>>>>> +and needed to have a function-like macro that acts as a wrapper for the
>>>>> function to be called. Before calling the function,
>>>>> +the macro adds additional checks or adjusts the number of parameters
>>>>> depending on the configuration."
>>>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>>>> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>>>>
>>>> Bitops violations are not inside "xen/include/xen/bitops.h", but rather
>>>> "xen/arch/x86/include/asm/bitops.h"
>>>>
>>>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>>>> "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}
>>>>
>>>> I would rather do (untested)
>>>>
>>>> -config=MC3A2.R5.5,reports+={deliberate,
>>>> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>>>>
>>>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>>>> "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limit)&&kind(function)))"}
>>>>> +-doc_end
>>>>> +
>>>>
>>>> same as above
>>>>
>>>
>>> Thanks Nicola! The following deviations are enough and sufficient to
>>> zero violations on both ARM and x86:
>>>
>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/bitops\\.h$)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat\\.c$)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat/.*$)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/genapic\\.h$)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(virt_to_maddr))||macro(name(virt_to_maddr)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_px_pminfo))||macro(name(set_px_pminfo)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_cx_pminfo))||macro(name(set_cx_pminfo)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_to_guest_ll))||macro(name(copy_to_guest_ll)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_from_guest_ll))||macro(name(copy_from_guest_ll)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(edd_put_string))||macro(name(edd_put_string)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(page_list_entry))||macro(name(page_list_entry)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_physdev_op))||macro(name(do_physdev_op)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_platform_op))||macro(name(do_platform_op)))"}

... in here, which of them are Arm-only?

Jan

