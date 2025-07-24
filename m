Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE81B1021D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055369.1423785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqaU-0002hU-EV; Thu, 24 Jul 2025 07:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055369.1423785; Thu, 24 Jul 2025 07:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqaU-0002fF-Bq; Thu, 24 Jul 2025 07:41:58 +0000
Received: by outflank-mailman (input) for mailman id 1055369;
 Thu, 24 Jul 2025 07:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqaS-0002RK-96
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:41:56 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aac38bec-6861-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 09:41:53 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4563bc166a5so4177635e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:41:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4586eeb5f3asm9493195e9.2.2025.07.24.00.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 00:41:52 -0700 (PDT)
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
X-Inumbo-ID: aac38bec-6861-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753342913; x=1753947713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gSfz8BtlyZTL0euQQcsgtQT5pLBjvrEnHns6MBMm7Ls=;
        b=foVEVLXvuhCTMyThcqFe79i5ipSu7MGZQa3DwmscLSh5+zdRXpsFPSPWtofVss0WJX
         2Ar4ScJ3u/Q3kFE1qhsout5VqTw7tcpObauMT3YZB99IQ4mmBJ2khKP/wkWRWCgVmoeZ
         ezP3WvAKi1vJ7Z97Eoy4Elq9tJ14ybCscnWCHhDFjjLvPz3O+LrBXzHeDQmg6DAfytRy
         KkzeCRJXE7dNWnjfYmwc6IHWyuN3WC+opgpyOafGp5SWQw103ggdMRfnc3K9TB9syJBT
         Oie8dx4FUnLUXR4ruJnnx9aysLuaEwzY3ufg3zo5yC+TyxscgXgTXGWGFwoEOZ/Q0iNN
         37Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753342913; x=1753947713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSfz8BtlyZTL0euQQcsgtQT5pLBjvrEnHns6MBMm7Ls=;
        b=SkDSGVQpzhtvgUZY9hQp1e1teM1sWJTL3YqnRskI3vDrFRTjY9e0NM4/mlVAzX5cK2
         uZjHqK2MUrVn1cA/xA+YtSJ0tGI5gw+vLe6olF+8z4oETB2fcO1wMt0VZOvWtuVy+Pgf
         D0cj2A5ZVhgKhbRFtVIV9hyCXvkD5qyYf0mvPSA1x0mCZ4irc+LG0D/aZqE0RodeyfHJ
         kP78u8YPEJVIlPKcExKc0YEtmJN3bbxS7HUgCXrHqzFh2qGYgsL8QsTpoL3myJ81QOSe
         RJhdKQY1Iu4HFc4mCjBMqOPYe/l/k8nq+wffZMGjrBo42E0DCtebVQNbYnulDx2HRPut
         4QIw==
X-Gm-Message-State: AOJu0YzStvJc5BBcw26zIrKsgfu+cU6XitZ0ln0+l6cYukbXPU9jKnJ+
	8/qO0Igc514wb2eku8Qk2lboi0BeXkYIX4PbJyk0xw0x8zDvwIe9y0lZqAzBZs8BLw==
X-Gm-Gg: ASbGnculh3YfSrf3smR+duAcppL6eu3SHUdZBBW+9SnhT/bLQTJriBS578Dygb8cYft
	2t9bAojAt5WuSaJ9qWGo267Xf4iWoQJzoe9gBzWjde/TNUBfyHhRTXgtD/7hqbkbWwX4q+uJjci
	kGpOPSrikyeIW7CZB8kSrBq4fozH4OlYGqQBdC+D4DaFY1BJL6CQSmgAPY13wJVmTMwdpyNdDUB
	lmyD4jP3c3ztMMND73rB6LFgeMBFsVZDS6KDGBPHmVcgI3G03DlMrMzfvzSbcDXX41gTHMBwXIp
	4fG4mnxGyQ2cn9cBfwWoXfrgc3L/PeuHU3nTOX8qIIgzqfDG/3nWypMaAWfgGLQWwFgZ3LEX6yG
	7yEPg2vkq/E7+BHrMIKkdmPZEUvO1s1ei0FutYvur3T/yICoAeBpIKDvWRNDdfHvQJQrV/mPryj
	cGXZMt3j8=
X-Google-Smtp-Source: AGHT+IGggrDvf4Cj6q+oCWfDtlUHIbmc3clEURiUVJrqTgfWfvPT4WmwAF2F1b280WU6kR6wwy7ERQ==
X-Received: by 2002:a05:600c:4505:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-4587050d183mr9902885e9.3.1753342912581;
        Thu, 24 Jul 2025 00:41:52 -0700 (PDT)
Message-ID: <221814c1-faf3-418a-985a-2475416c1a4b@suse.com>
Date: Thu, 24 Jul 2025 09:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
 <69b7ea65-c69a-4184-b4d1-0664282ab849@epam.com>
 <a5d97ba5-9450-455d-972e-181e179f7ca0@suse.com>
 <726672c2-1846-41e8-a5ce-5cbce8d1fb73@epam.com>
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
In-Reply-To: <726672c2-1846-41e8-a5ce-5cbce8d1fb73@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 18:12, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/21/25 13:34, Jan Beulich wrote:
>> On 21.07.2025 12:27, Dmytro Prokopchuk1 wrote:
>>> On 7/16/25 21:08, Dmytro Prokopchuk wrote:
>>>> MISRA C Rule 5.5 states that: "Identifiers shall
>>>> be distinct from macro names".
>>>>
>>>> Update ECLAIR configuration to deviate:
>>>> - clashes in 'xen/include/xen/bitops.h';
>>>> - clashes in 'xen/include/xen/irq.h';
>>>> - clashes in 'xen/common/grant_table.c'.
>>>>
>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>> ---
>>>> This patch makes MISRA Rule 5.5 "clean" for ARM only.
>>>>
>>>> Was agreed to narrow deviation:
>>>> https://patchew.org/Xen/cover.1752096263.git.dmytro._5Fprokopchuk1@epam.com/e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro._5Fprokopchuk1@epam.com/
>>>>
>>>> CI:
>>>> https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/rule_5.5_deviation_final/ARM64/10706457595/PROJECT.ecd;/by_service.html#service&kind
>>>> ---
>>>>    automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
>>>>    docs/misra/deviations.rst                        | 7 +++++++
>>>>    2 files changed, 14 insertions(+)
>>>>
>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> index 8504e850c1..3895148460 100644
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -117,6 +117,13 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
>>>>    -config=MC3A2.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>>>>    -doc_end
>>>>
>>>> +-doc_begin="Clashes between function names and macros are deliberate and needed to have a function-like macro that acts as a wrapper for the function to be called.
>>>> +Before calling the function, the macro adds additional checks or adjusts the number of parameters depending on the configuration."
>>>> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)) && macro(name(__test_and_set_bit||__test_and_clear_bit||__test_and_change_bit||test_bit)))"}
>>>> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&macro(name(update_gnttab_par||parse_gnttab_limit)))"}
>>>> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&macro(name(pirq_cleanup_check)))"}
>>>> +-doc_end
>>>> +
>>>>    -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>>>>    depending on the guest."
>>>>    -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>> index 620e97f0bd..84bc933cbf 100644
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -142,6 +142,13 @@ Deviations related to MISRA C:2012 Rules:
>>>>           memmove.
>>>>         - Tagged as `deliberate` for ECLAIR.
>>>>
>>>> +   * - R5.5
>>>> +     - Clashes between function names and macros are deliberate and needed
>>>> +       to have a function-like macro that acts as a wrapper for the function to be
>>>> +       called. Before calling the function, the macro adds additional checks or
>>>> +       adjusts the number of parameters depending on the configuration.
>>>> +     - Tagged as `deliberate` for ECLAIR.
>>>> +
>>>>       * - R5.6
>>>>         - The type ret_t is deliberately defined multiple times depending on the
>>>>           type of guest to service.
>>>
>>> Could you review this patch?
>>
>> I don't understand. I'm not feeling capable of (fully) reviewing changes to
>> automation/eclair_analysis/ECLAIR/deviations.ecl. Nor am I the only maintainer
>> of that file. And the text being added to docs/misra/deviations.rst is too
>> unspecific for my taste, yet I thought I'd better not repeat that same concern
>> over and over again. If others feel like ack-ing in this shape, so be it.
> 
> Hello all!
> 
> Since there have been no new comments so far, I would like to propose a
> straightforward solution: rename the macros (that violate Rule 5.5)
> using capital letters (using best practices for naming macros in C).

Well, in your ping as well as here, despite the "Hello all" you address
just me (as per the To: list). Therefore I think you will want to send a
wider ping first. Also note that it's (sadly) entirely usual to not get
any reply on a patch for extended periods of time. I have no good
suggestion what you could do to help that in this case. Pinging, in my
experience, only rarely helps. (However, if you ping, it may be a good
idea to identify the mail being a ping already in the subject. What I
often do is replace the Re: with Ping:.)

> I can prepare such a patch.
> 
> The main question is: "Is it possible to upstream such changes?"
> Or is this idea not worthwhile?

I'm opposed to it.

Jan

