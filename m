Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C13A25324
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 08:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880464.1290538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ter0o-0008PW-KU; Mon, 03 Feb 2025 07:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880464.1290538; Mon, 03 Feb 2025 07:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ter0o-0008Ne-Gh; Mon, 03 Feb 2025 07:36:54 +0000
Received: by outflank-mailman (input) for mailman id 880464;
 Mon, 03 Feb 2025 07:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ter0m-0008NW-VD
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 07:36:52 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0bdafcf-e201-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 08:36:49 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so6302272a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 23:36:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff968sm705283066b.111.2025.02.02.23.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 23:36:48 -0800 (PST)
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
X-Inumbo-ID: a0bdafcf-e201-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738568209; x=1739173009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4baJp83ghtp+FU0uN2nnGqMot2AeGGHG9a+8M4GlBsA=;
        b=K3g3gfToPPF5xh1kF+Reu0o2PNzRmH1pA23h322PT1gn6rDn8VWQ/shr2kWUdjZZ+x
         Q7MgPz+05to7dOi7mx7Fi7sejt0IdHi6m6RaHqnXrUHyl8XOnKCPjD1dSEgaPoqP1bBb
         UPN5b/vX/wYwqLBpsNUkRz/wrmM/zXka0xd90sS2Q4O6MO93yG4nnL1Yr0VJg8BKm0CI
         yOfSBLtq73P/8wMuCyD3MMq67enY5uyW/B8jX3KoKlHWlB5yq6+4V1d49LYSmhueqQPa
         xcWg6cy+3nwQ/CN+aCI4nlwAwx3AEImW9lBkNDQSjZLjTYM7Gf/DBKUiLoCZZbRqaFq8
         iOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738568209; x=1739173009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4baJp83ghtp+FU0uN2nnGqMot2AeGGHG9a+8M4GlBsA=;
        b=I4f+Eu07zibgmqkH/8Lyqn2F7TT+N1JrZdjtSRv0T6UVdO3+OVHrX+a03yJ1TO0IsH
         5eAeicHOx5L2cNbJfObvf/0HT8TZPs5te9vm3vaDxFrt1F9F5VuaLiefJpm1lvx7WSOb
         Omkr5B/HUZ9rUwy1ykqicjv5g79TFGBTRBc2N5cCweURA18aA/345HDllXk9NG/pmuet
         VQxRaNLu4Wt5XZ6HGvLd7FMrR5mZWZACAX8KzJl4evBDHyYGerTd95Gw+LXnluN61DlE
         b9EJO2fG/BchDdK8JJMEaqsxgyo+LCq/TeGR+kxpcBKG+XhbQi/xxcX6thLDo9bwG2l1
         uTdA==
X-Forwarded-Encrypted: i=1; AJvYcCWLwdSxnY9P5VZ6ii4Xyr5+1ESiP1i9VHFCChEfQpm2UsWRe4MK6438zqEUdSqEodFwk1Rhtf5qauw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwarZBbgzP78VqdpEcG6nZonilpxfyZ3QLuheHezWrQzRDAiD9m
	8G4x7gFXdt9H9rmWueLf6UmHQs2vPK0j9XBkZ93v8y8nOgzrcUQvZ28nI0Rb0w==
X-Gm-Gg: ASbGncva9Iph/WnAPM604trmNcYYC3MEHo97hvw50jbxlHRvVMMR4v39rsue/Ex5WJc
	PxNDBxzKaVPR+Wy7rpt4Jjk88xQJWVGPtVIQycY/u/2u4v9zR8UBluHrazl/VFwIXBWA6GBeHNz
	d3IRStiFvDA6AYRk1GZo2V4I0/wwhDISWRNSV+RXM1J0Uy+IT+W6Pi05wucYvITsNJakxdIrBWQ
	7O80NT0Jo72tg1ySsqRZ/3ZMyt52Qf41fxDTVqVwG4J66zMyn3fCI7SfoIMthuMjFaU+xTm0Q+P
	Yqyx0SH4YjppEzbfRAeQaa7SWgBrOH/31QM0PPVEd0gn5zEwCZMNC3ynl7PbJlVFvOFdJtKAHrE
	J
X-Google-Smtp-Source: AGHT+IGOq7avkSsRydbSqAQFo+9tKawq6n47pR/AwMTLa9J9KEJYkjPXfdN6VmtXPTQG0/+URSUL3w==
X-Received: by 2002:a17:907:72d6:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab6cfdc6e55mr2377842066b.56.1738568208595;
        Sun, 02 Feb 2025 23:36:48 -0800 (PST)
Message-ID: <02cbd163-9048-45dc-9951-c8f2febb8b5f@suse.com>
Date: Mon, 3 Feb 2025 08:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
 <c74d334e-6e33-4a58-bf94-936249244cb0@suse.com>
 <CABfawhm8Cb3xz8Fv=YhA1TSKtvA3ThWHMcqJCFDarwSuYKQ5ZA@mail.gmail.com>
 <b850c2b1-5aa9-4e64-9161-ba55028b43a7@suse.com>
 <CABfawhn8uhUbr4yRcSb=_Jw3y2Cgsh_ozXotTFkrDt12K8Cyog@mail.gmail.com>
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
In-Reply-To: <CABfawhn8uhUbr4yRcSb=_Jw3y2Cgsh_ozXotTFkrDt12K8Cyog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.02.2025 00:36, Tamas K Lengyel wrote:
> On Fri, Jan 31, 2025 at 1:30 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 31.01.2025 01:26, Tamas K Lengyel wrote:
>>> On Thu, Jan 30, 2025 at 8:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 21.01.2025 11:19, Sergiy Kibrik wrote:
>>>>> Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
>>>>> CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher level
>>>>> feature, with mem_access & monitor depending on it.
>>>>>
>>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I don't think this is applicable; my suggestion went in a different direction.
>>>>
>>>>> Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
>>>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>>
>>>> Before considering to ack this, I'd like you, Tamas, to confirm this is really
>>>> what you had thought of. In particular ...
>>>>
>>>>> --- a/xen/arch/arm/Makefile
>>>>> +++ b/xen/arch/arm/Makefile
>>>>> @@ -37,7 +37,7 @@ obj-y += irq.o
>>>>>  obj-y += kernel.init.o
>>>>>  obj-$(CONFIG_LIVEPATCH) += livepatch.o
>>>>>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>>>>> -obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>>>>> +obj-$(CONFIG_VM_EVENT) += mem_access.o
>>>>
>>>> ... changes like this one look somewhat odd to me.
>>>>
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -92,7 +92,7 @@ config HAS_VMAP
>>>>>  config MEM_ACCESS_ALWAYS_ON
>>>>>       bool
>>>>>
>>>>> -config MEM_ACCESS
>>>>> +config VM_EVENT
>>>>>       def_bool MEM_ACCESS_ALWAYS_ON
>>>>>       prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
>>>>>       depends on HVM
>>>>
>>>> What about MEM_ACCESS_ALWAYS_ON (visible in patch context)? Shouldn't that
>>>> become VM_EVENT_ALWAYS_ON then, too?
>>>>
>>>> Further, what about MEM_PAGING and MEM_SHARING? Shouldn't those, at least
>>>> documentation purposes, then also gain a dependency on VM_EVENT?
>>>
>>> MEM_PAGING, yes. MEM_SHARING, definitely not. MEM_SHARING is perfectly
>>> functional without vm_event.
>>
>> Is it? I see e.g.
>>
>>     if ( sharing_enomem )
>>     {
>> #ifdef CONFIG_MEM_SHARING
>>         if ( !vm_event_check_ring(currd->vm_event_share) )
>>         {
>>             gprintk(XENLOG_ERR, "Domain %pd attempt to unshare "
>>                     "gfn %lx, ENOMEM and no helper\n",
>>                     currd, gfn);
>>             /* Crash the domain */
>>             rc = 0;
>>         }
>> #endif
>>     }
> 
> On x86 vm_event is always compiled in as per current setup. If we were
> to make that dependent on the now renamed config option this here
> should be converted to CONFIG_MEM_SHARING && CONFIG_VM_EVENT. The rest
> of the mem_sharing codebase does not require vm_event to function,
> this here is used only if there is a subscriber to the enomem
> corner-case. It isn't normally used.

I see.

>> in hvm_hap_nested_page_fault().
>>
>> Also - you responded only to a secondary remark here. What about the
>> more basic points further up?
> 
> My recommendation to use CONFIG_VM_EVENT for the
> vm_event/mem_access/monitor subsystems strictly only applies to ARM
> where these three subsystems have a 1:1:1 dependency. On x86 the
> dependency between the three can be more complex, I would not change
> the x86 side of things unless we want to get the three subsystems
> their own kconfig options.

Then why did you ack the patch, which clearly extends things to x86 as
well? Iirc my suggestion was to indeed go with separate options (hence
why I think the Suggested-by: here is wrong; see context near the top).

Jan

