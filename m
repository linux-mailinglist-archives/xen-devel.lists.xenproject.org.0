Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2DB057FF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043980.1414035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubd48-0003xB-W2; Tue, 15 Jul 2025 10:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043980.1414035; Tue, 15 Jul 2025 10:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubd48-0003uf-T0; Tue, 15 Jul 2025 10:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1043980;
 Tue, 15 Jul 2025 10:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubd47-0003uZ-K6
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 10:39:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2051527-6167-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 12:39:12 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so4250659f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 03:39:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4287268sm108375965ad.19.2025.07.15.03.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 03:39:10 -0700 (PDT)
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
X-Inumbo-ID: f2051527-6167-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752575951; x=1753180751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z0XpXPcKFxpUl+hPlJEKKWz19RxSBrsMi7jV4IGSqw=;
        b=N1i6laKuOQICPgUoAEZ0mL2Ku0RPkrFq2zbbNSY5T6JUjFw/T0xGzITDQDlslrDwrv
         b7ieIhl1YnFSBsR4T0brYPZstbvKXWYFvsLUzH9Hn6d4QqttlS0AqAozuvLU4vBYLaYH
         BCGy1ZvhV+TfbRGSQnNvwIPPDGNlR8UTbhJd0ZHphSA/OUorS6tVWWvXrYJtn9eBf1Ld
         kSwxXCc6nd3NGsy+HuByENjohgeikBfx45EGWFaJc2LxlZ4N8RmZ8l/sK+NY/HelMmGC
         gIPx+qzkHoyz3nFTi2WgpfrkVEzFnoY34dGOhWud6jJxovTq1wsThNHv3j0c9MD3Bq/W
         Y0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752575951; x=1753180751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Z0XpXPcKFxpUl+hPlJEKKWz19RxSBrsMi7jV4IGSqw=;
        b=iX30Nz5tBELttH1hiDkb+wKIjgQW7zLjXwM5b0Eoc6kAwFxCokfEtExFVN5pbjocQl
         ax9GlKsXNYeU4sIOGbj/vr60iQCD9J1DVFUv+ceujYblDDrDr9N8rq4ckKqZ+2Yw4+Tq
         l4dNo5etYTIeD5ymeYC1fJhmKpSNptEXKH60z98HYuVn0O3HQPRTWArC2iHJxKyBvce8
         Tj3wtw+WnAggp9JwoZ8wdyMG4qPmXhWfcRyWJs7D5IuwIZtf05lBNJYOByWw51uwDgx+
         KexJJ3rC07Z2YNGZrUTWOP2TvZKk2eAVoHUmKtSVMYk2v2ElTXUE8Ip1+PgeTk6PxQZC
         Ngrg==
X-Gm-Message-State: AOJu0YyjS+EwwOSfPMvYbqUEH8DX35cpxnTVMy7o5GlRzLTLomTULm0Y
	4Kx3gWF0uORRa5UrABf4u386X2YfK/mQ5EeOQGtIinANELmaoX8bo9DNaDzzxUf17Q==
X-Gm-Gg: ASbGnct/kFDVkGcmAlpCDZfG5TUdrefvM2NO8B8hZINczYQ91J2X0n8sj9BBmXoB/4Q
	4uXxJRRwJa1/LIMhcD1oTDUBQG+WvoY5uSzmxf/bgo9+BXmV5m6MT4ihF81qR6dSSrB9TEJhK26
	56Uz4sIfduVKtp+WZYxy14CGc+BNnmIzLAnPgFr1mWaKg3v8r9FP53e+lRDtceESPwFnlkUc7hQ
	1s3ucH3qxDrmTXg/Bf6Iuz/OrVFQ+sgIQ0MFhc+K1PJTZsuLKUmLScLpkvtjTKPkvxdVqHtPjho
	+L8jIO2IHqFVoQsm68ouP4Oi+EpkkX0Von894dqc6mZz6kjFwXq4G1S2t+U0YYICk6m2NwWz3J7
	fnbVV/lEwtDD3eNSY10c3RPQ/Yp5K/sSqV5Zd7UDVtwc3HfZQhlm1AU8O37+TTUR94ErHcgtUXm
	xAV3IhaIo=
X-Google-Smtp-Source: AGHT+IEQijNBnGTTCv7WbO4/Xkh6jh0/YPp1gmMxKioSi6AMCX1OoKZEYCDH6GlmVTMmhBFBcNUibw==
X-Received: by 2002:a05:6000:491e:b0:3b5:e6f3:f825 with SMTP id ffacd0b85a97d-3b60a15b155mr1776277f8f.23.1752575951239;
        Tue, 15 Jul 2025 03:39:11 -0700 (PDT)
Message-ID: <5b7f2a0f-9840-400a-8a01-e43e1ee20056@suse.com>
Date: Tue, 15 Jul 2025 12:39:00 +0200
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
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
 <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
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
In-Reply-To: <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2025 12:07, Dmytro Prokopchuk1 wrote:
> ARM only are:
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}

Hmm, I'd call these "common code" ones, but I guess you meant "anything that
would make Arm clean".

As an aside - please don't top-post.

Jan

> On 7/15/25 13:01, Jan Beulich wrote:
>> On 15.07.2025 11:46, Dmytro Prokopchuk1 wrote:
>>> Could we proceed with ARM deviations only so far?
>>> I understand Stefano's preferences, but it can unblock me to address
>>> next ARM violations.
>>
>> Hmm, ...
>>
>>> On 7/14/25 10:55, Jan Beulich wrote:
>>>> On 12.07.2025 03:13, Stefano Stabellini wrote:
>>>>> On Fri, 11 Jul 2025, Nicola Vetrini wrote:
>>>>>> On 2025-07-09 23:38, Dmytro Prokopchuk1 wrote:
>>>>>>> MISRA C Rule 5.5 states that: "Identifiers shall
>>>>>>> be distinct from macro names".
>>>>>>>
>>>>>>> Update ECLAIR configuration to deviate:
>>>>>>> - clashes in 'xen/include/xen/bitops.h';
>>>>>>> - clashes in 'xen/include/xen/irq.h';
>>>>>>> - clashes in 'xen/common/grant_table.c'.
>>>>>>>
>>>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>>>> ---
>>>>>>>    automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>>>>>>>    docs/misra/deviations.rst                        | 8 ++++++++
>>>>>>>    2 files changed, 16 insertions(+)
>>>>>>>
>>>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> index e8f513fbc5..a5d7b00094 100644
>>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>> @@ -117,6 +117,14 @@ it defines would (in the common case) be already
>>>>>>> defined. Peer reviewed by the c
>>>>>>>    -config=MC3A2.R5.5,reports+={deliberate,
>>>>>>> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>>>>>>>    -doc_end
>>>>>>>
>>>>>>> +-doc_begin="Clashes between function names and macros are deliberate for
>>>>>>> bitops functions, pirq_cleanup_check, update_gnttab_par and
>>>>>>> parse_gnttab_limit functions
>>>>>>> +and needed to have a function-like macro that acts as a wrapper for the
>>>>>>> function to be called. Before calling the function,
>>>>>>> +the macro adds additional checks or adjusts the number of parameters
>>>>>>> depending on the configuration."
>>>>>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>>>>>> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>>>>>>
>>>>>> Bitops violations are not inside "xen/include/xen/bitops.h", but rather
>>>>>> "xen/arch/x86/include/asm/bitops.h"
>>>>>>
>>>>>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>>>>>> "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}
>>>>>>
>>>>>> I would rather do (untested)
>>>>>>
>>>>>> -config=MC3A2.R5.5,reports+={deliberate,
>>>>>> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>>>>>>
>>>>>>> +-config=MC3A2.R5.5,reports+={deliberate,
>>>>>>> "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limit)&&kind(function)))"}
>>>>>>> +-doc_end
>>>>>>> +
>>>>>>
>>>>>> same as above
>>>>>>
>>>>>
>>>>> Thanks Nicola! The following deviations are enough and sufficient to
>>>>> zero violations on both ARM and x86:
>>>>>
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/bitops\\.h$)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat\\.c$)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat/.*$)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/genapic\\.h$)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(virt_to_maddr))||macro(name(virt_to_maddr)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_px_pminfo))||macro(name(set_px_pminfo)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_cx_pminfo))||macro(name(set_cx_pminfo)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_to_guest_ll))||macro(name(copy_to_guest_ll)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_from_guest_ll))||macro(name(copy_from_guest_ll)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(edd_put_string))||macro(name(edd_put_string)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(page_list_entry))||macro(name(page_list_entry)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_physdev_op))||macro(name(do_physdev_op)))"}
>>>>> -config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_platform_op))||macro(name(do_platform_op)))"}
>>
>> ... in here, which of them are Arm-only?
>>
>> Jan


