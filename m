Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57003B0386D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042654.1412742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubE21-0006Em-Lx; Mon, 14 Jul 2025 07:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042654.1412742; Mon, 14 Jul 2025 07:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubE21-0006Bg-II; Mon, 14 Jul 2025 07:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1042654;
 Mon, 14 Jul 2025 07:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubE20-0006Ba-NH
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:55:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e45b8901-6087-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 09:55:21 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45610582d07so7697795e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 00:55:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe5b0201sm9293558a12.31.2025.07.14.00.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 00:55:20 -0700 (PDT)
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
X-Inumbo-ID: e45b8901-6087-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752479721; x=1753084521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6KkJAQ/Ex9YP0ZLzfsKXa4qoeRO67VeGyFDFMiIsv1M=;
        b=IP6nbcgUvBh+wVEAn3f/pE6fOTdIb4TWDJ+2mfPWK9AG895atbzIekl5RGbVMKEG3S
         +ey9SnDX7fyPV1wCKhKz4vtmRZIFjRFIRKaKEdKQcqqRZ/oosH8rUuUh9dGLY7bvIiHH
         oSSyDk+zJSacpRs2qSlDJ+FleZMVrymhdu3Mmu9DOwjIgbUR/7oAYlSBMKhCOkUAtoe/
         OK+x9j/Mv3vV+aueBeBAvpxMGFZ4LLAGE/wuXb2UfUN1BGcw1MDKGCgCThCRtKuhRen9
         paxSV3NGJ1gQHZJtaP8AlBFSWq3MfcIcFRx8fSJkUfn/DfoY+D8aD6S+r8L32AokNIrL
         +Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752479721; x=1753084521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KkJAQ/Ex9YP0ZLzfsKXa4qoeRO67VeGyFDFMiIsv1M=;
        b=O7nF8IlaJJ12j6nLdd52adKf8H3+Rs9jojNX0InHO+J40kEzbAd5WojV1VVZnKSFPf
         N2GixTb/YMmb1FSr2+9vQqZQ5wzmz9gxDZcgMQQqusQ89fQHwVVW2l7TfpvSrr31DsO8
         wKRxY4aTQcjb/y1mrk3rZlH3z5pajf7ZcY/EL5jV3Gz1J6R4goLBxjTGUGIIxCh/gwb8
         JsvKOPinrHgk6KHYSES05QySJ9bn9/x3LzShIm94ROhCIuOhQsyG62GkcJ0hq4REu1Y+
         QYTNUhcHUi6JUQrP8Zdzf+3UUGJJP0gaoKdw8tAwaL5fR7wFBbaZEwUduB2ynT+64OX5
         pEVw==
X-Forwarded-Encrypted: i=1; AJvYcCUN6oaespUPEQ/4RZ7BzX0LMUHsQnpO/tWDX9uQiSvme0+V8bTf3euVtxvSDySJ8owz8lOXU7OB1xo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxzm8Pbvyc9V0yXeNa9ZVDV9MRvMjz8E8cIlQZm1J2WGgkPdUOl
	Y8q2+qAbhgmAb1nDJhL4yxrbiYhs+9vYag1zzT3Qc1TEUMiU6qZJjxh6wn8kK0kijg==
X-Gm-Gg: ASbGncuasnHCeWg2A+3UqCqgVnTIIlx5V8vMh2zUHcDrj7Q9j8BK7487K7ALn2t2Lqr
	EVEhtICfdwPWuIwjtUy1ipVtKGRx6SNSBpnjX3xtZyGL3B61tNTVP6TM+4f/LzD54KmflM7rp7D
	puHoecgTrPOnBTTvqY6uz2Vb+3sdl8903sSE4W4GC6KK9vvILoXDBe5r7zBOheDbgGHnnjwAkiQ
	vonmcpl9kTg06hL5W+38LH1wm2ly7ajf3JTs1/Wt01voFdVq803h75D6ZDVCZctSJRlP/wKaXCA
	9NkkPsPJANPTMUSAqdgeIO2Cn2Y3RQyNOBjDtR4H/uHF+9Ji0kej3dppIsnjzpQJDDLUwBWSF74
	99S530H74UAldkZL87JsFPEzLhEqA05w/tNGkgOTEFW8BFjSAf5i7BPQAl2FSlz7/QQwe5KOUmJ
	LgGnfuDWw=
X-Google-Smtp-Source: AGHT+IHrlqU7QhOjsVl0FwBf7VOW5XFV6Zu9rJ/TjzBu2K8n+w/Yrr2asnfrmkkvor5+mpc0VNqYTw==
X-Received: by 2002:a05:6000:2c09:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3b5f188e822mr11565841f8f.25.1752479721095;
        Mon, 14 Jul 2025 00:55:21 -0700 (PDT)
Message-ID: <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
Date: Mon, 14 Jul 2025 09:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2025 03:13, Stefano Stabellini wrote:
> On Fri, 11 Jul 2025, Nicola Vetrini wrote:
>> On 2025-07-09 23:38, Dmytro Prokopchuk1 wrote:
>>> MISRA C Rule 5.5 states that: "Identifiers shall
>>> be distinct from macro names".
>>>
>>> Update ECLAIR configuration to deviate:
>>> - clashes in 'xen/include/xen/bitops.h';
>>> - clashes in 'xen/include/xen/irq.h';
>>> - clashes in 'xen/common/grant_table.c'.
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> ---
>>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>>>  docs/misra/deviations.rst                        | 8 ++++++++
>>>  2 files changed, 16 insertions(+)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index e8f513fbc5..a5d7b00094 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -117,6 +117,14 @@ it defines would (in the common case) be already
>>> defined. Peer reviewed by the c
>>>  -config=MC3A2.R5.5,reports+={deliberate,
>>> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>>>  -doc_end
>>>
>>> +-doc_begin="Clashes between function names and macros are deliberate for
>>> bitops functions, pirq_cleanup_check, update_gnttab_par and
>>> parse_gnttab_limit functions
>>> +and needed to have a function-like macro that acts as a wrapper for the
>>> function to be called. Before calling the function,
>>> +the macro adds additional checks or adjusts the number of parameters
>>> depending on the configuration."
>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>>
>> Bitops violations are not inside "xen/include/xen/bitops.h", but rather
>> "xen/arch/x86/include/asm/bitops.h"
>>
>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>> "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}
>>
>> I would rather do (untested)
>>
>> -config=MC3A2.R5.5,reports+={deliberate,
>> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>>
>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>> "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limit)&&kind(function)))"}
>>> +-doc_end
>>> +
>>
>> same as above
>>
> 
> Thanks Nicola! The following deviations are enough and sufficient to
> zero violations on both ARM and x86:
> 
> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/bitops\\.h$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat\\.c$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat/.*$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/genapic\\.h$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(virt_to_maddr))||macro(name(virt_to_maddr)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_px_pminfo))||macro(name(set_px_pminfo)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_cx_pminfo))||macro(name(set_cx_pminfo)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_to_guest_ll))||macro(name(copy_to_guest_ll)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_from_guest_ll))||macro(name(copy_from_guest_ll)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(edd_put_string))||macro(name(edd_put_string)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(page_list_entry))||macro(name(page_list_entry)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_physdev_op))||macro(name(do_physdev_op)))"}
> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_platform_op))||macro(name(do_platform_op)))"}
> 
> Jan, are you OK with it?

For many of them the scope (all_area) looks to be far too wide, especially
for about everything involved in compat handling. I can only repeat that I
think that we would be (far) better off not having wider than necessary
deviations.

There are others which I may not understand, e.g. the genapic.h one. IOW I
further think that such a change would need to come with a fair bit of
explanation / justification.

Jan

