Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePH/LBDZiWlUCQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:54:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A210F338
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225325.1531801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQmb-0004Jq-P7; Mon, 09 Feb 2026 12:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225325.1531801; Mon, 09 Feb 2026 12:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQmb-0004Ht-Lk; Mon, 09 Feb 2026 12:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1225325;
 Mon, 09 Feb 2026 12:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpQma-0004Hl-NP
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 12:54:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 753f679a-05b6-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 13:54:23 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso37314395e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 04:54:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203d60d0sm99528645e9.1.2026.02.09.04.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 04:54:22 -0800 (PST)
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
X-Inumbo-ID: 753f679a-05b6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770641663; x=1771246463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QPc3F21/PLwVr2kD/0NfiQY4IxlG2jDkItlfyCOTuKY=;
        b=Frt2ibzkdPgYsxnNYmH27MDOlE2emrCejRii6SKHqVi5Lo42hxtNN46b9MQo/zghDp
         C/mNj1L2+m0aRtdbAptfykmxxKgIDQimV9ULP3THcOodViPXSOJm8rLTlMJq7xvRwPIM
         fz4JeZfLqGpJy8p+8/Xmmy3bCCoFi/0aEHqACiRTZO5hd4BeDj+Bn6zEyBUOXPCTa3eb
         dZnxEwiD7ghDoGv32wbKAYgaQ7aiXvbDeJ3LjoZTMno5gGOAhpMr/c4nf8W/TSRgu6kJ
         HM60/eb8GIIldmjwoL3B4YM26Jskxztbh2ikcGHx9CAViX9nrJzW4arLvN6XAnOzPc7H
         BCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641663; x=1771246463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPc3F21/PLwVr2kD/0NfiQY4IxlG2jDkItlfyCOTuKY=;
        b=oc0huddkG0zhXWOv2HM7IwQnHVf0zQ1FvJwvUu2IgOyZmeZkifmk/JyN5Ny2KYugwA
         Z9ygxRl5AQ588SWvO6I7SDWBDZ53jW/VvWfWMQB6q7oX9XyyNVwziJgKqFtVYdhsFlvm
         H9A22aOFbPHgKl/hWNuca4nRfIa3/ewei4FTxh63X2oW3mcWpKXdc3pxtBnYqIog6hiq
         MoIrDK1TzwantoD/ZjFrEry0eFJxgKSUeSglKHufSQlhh8r/W4Qq5OUedRUTL0BDM5Zt
         o/sZbGviP258duAqCwUk6KcjDTNknGY0lvslgg6vloL5LjU68UpUhq663mQ28N2QTJ+n
         ujDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeS6q6jfxU/iZ16Lqb39/AozeioiF2aTYMTN8btUrEfVwu05yTp4iO250WYq4SNZmwhrbXJbZ+eAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzjx/BP3yhDFvotQOdHEF1xQ4EyvOxOhK30Orn6pmwXm9N+iUkZ
	lGXAxyuM3kyKmrshI++GCWbUsOgCIxhW6FT4V3nTXQVzWvAi7uWZqea6HFdAUAbfneFsIJ6VNqz
	ikSc=
X-Gm-Gg: AZuq6aIuYgNPSFLfKxHBxaTaXXQNj/9vAGl0wXrsbjeAsh8zZqkbCpYnBmmKtuHXrO3
	glgcHgChK6AEk9NOhIwl7G6Rh9JuwFpse2NgUGWhMR44NAgvuyXwsmPMJQoonqqc0o16o+AXFgg
	RCnD3cmnuXXzWBcNM+iB8DkjC7UItuR0EaPFkeQppOEUS2yFG6DC2Ii3jLz1LZGOJ2ysr8s5aCC
	cv0l65K6Te9O7kcyLcT7R2BeI0haFfqzqomxpvEAfktWKYsMBWrRMugyNORaWpjgdzNrjqgt0fx
	DptoNZJ3/AczCygRzuVK+QSSTh7yIpYtY+q5wvoHugCF3LWdPVLKfkwl1mho8AQ2eKqWZlVnfK0
	n5PVDa674p5OYzOWOBnghpBHymn/jh3pVIXmdxy8hCkUryt+5h2ZGGoMw3EAhSsNfYkVs0gA5Ss
	zI/sMvGpSao64jhF2nVQZt3eAqZ/hDXP7GCgpWjnDl7yjTe1EF2xhb25QbdB1tncmkNEWNaOe0K
	hg/M8PE/ppqPw==
X-Received: by 2002:a05:600c:828e:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-483201dadc1mr181133985e9.6.1770641662905;
        Mon, 09 Feb 2026 04:54:22 -0800 (PST)
Message-ID: <089aeecb-4e58-407d-aa4d-e09f88f861a0@suse.com>
Date: Mon, 9 Feb 2026 13:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce vcpu_kick() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <0335a7db0343d81ce4256482a464e7ba5df1c204.1769099885.git.oleksii.kurochko@gmail.com>
 <14d19350-0de8-4496-99e5-0ba76e421684@gmail.com>
 <4a12e652-5b53-40d0-b701-d1f5b749dfa7@suse.com>
 <29006d8a-e003-4451-99af-0eef8f7d1c08@gmail.com>
 <87533cdf-c8cc-4a86-9946-a999e8d31b82@suse.com>
 <d82c9acd-9a51-4a1a-af0f-ef3aba515bb0@gmail.com>
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
In-Reply-To: <d82c9acd-9a51-4a1a-af0f-ef3aba515bb0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1A9A210F338
X-Rspamd-Action: no action

On 09.02.2026 13:35, Oleksii Kurochko wrote:
> On 2/9/26 10:51 AM, Jan Beulich wrote:
>> On 09.02.2026 10:40, Oleksii Kurochko wrote:
>>> On 2/9/26 10:07 AM, Jan Beulich wrote:
>>>> On 06.02.2026 17:36, Oleksii Kurochko wrote:
>>>>> On 1/22/26 5:47 PM, Oleksii Kurochko wrote:
>>>>>> Add a RISC-V implementation of vcpu_kick(), which unblocks the target
>>>>>> vCPU and sends an event check IPI if the vCPU was running on another
>>>>>> processor. This mirrors the behavior of Arm and enables proper vCPU
>>>>>> wakeup handling on RISC-V.
>>>>>>
>>>>>> Remove the stub implementation from stubs.c, as it is now provided by
>>>>>> arch/riscv/domain.c.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>>     - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
>>>>>> ---
>>>>>>     xen/arch/riscv/domain.c | 14 ++++++++++++++
>>>>>>     xen/arch/riscv/stubs.c  |  5 -----
>>>>>>     2 files changed, 14 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>>>>>> index e38c0db62cac..13ac384c4b76 100644
>>>>>> --- a/xen/arch/riscv/domain.c
>>>>>> +++ b/xen/arch/riscv/domain.c
>>>>>> @@ -1,8 +1,10 @@
>>>>>>     /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>     
>>>>>> +#include <xen/cpumask.h>
>>>>>>     #include <xen/init.h>
>>>>>>     #include <xen/mm.h>
>>>>>>     #include <xen/sched.h>
>>>>>> +#include <xen/smp.h>
>>>>>>     #include <xen/vmap.h>
>>>>>>     
>>>>>>     #include <asm/bitops.h>
>>>>>> @@ -240,3 +242,15 @@ void vcpu_sync_interrupts(struct vcpu *v)
>>>>>>     #   error "Update vsieh"
>>>>>>     #endif
>>>>>>     }
>>>>>> +
>>>>>> +void vcpu_kick(struct vcpu *v)
>>>>>> +{
>>>>>> +    bool running = v->is_running;
>>>>>> +
>>>>>> +    vcpu_unblock(v);
>>>>>> +    if ( running && v != current )
>>>>>> +    {
>>>>>> +        perfc_incr(vcpu_kick);
>>>>> Because of this it is needed to introduce:
>>>>>      PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
>>>>> Otherwise randconfig build will fail when CONFIG_PERF_COUNTERS=y.
>>>>>
>>>>> I would like to ask if it would be okay to add it xen/include/xen/perfc_defn.h
>>>>> just after PERFCOUNTER(need_flush_tlb_flush,...) or would it be better to have
>>>>> it in arch specific perfc_defn.h?
>>>> Arch-specific please - it's not used by x86 nor ppc.
>>> Then I will do the following changes:
>>>
>>> diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
>>> index 3824f31c395c..86c56251d5d7 100644
>>> --- a/xen/arch/riscv/include/asm/Makefile
>>> +++ b/xen/arch/riscv/include/asm/Makefile
>>> @@ -7,7 +7,6 @@ generic-y += hypercall.h
>>>    generic-y += iocap.h
>>>    generic-y += irq-dt.h
>>>    generic-y += percpu.h
>>> -generic-y += perfc_defn.h
>>>    generic-y += random.h
>>>    generic-y += softirq.h
>>>    generic-y += vm_event.h
>>> diff --git a/xen/arch/riscv/include/asm/perfc_defn.h b/xen/arch/riscv/include/asm/perfc_defn.h
>>> new file mode 100644
>>> index 000000000000..4fc161f1abad
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/perfc_defn.h
>>> @@ -0,0 +1,7 @@
>>> +/* This file is intended to be included multiple times. */
>>> +/*#ifndef __XEN_PERFC_DEFN_H__*/
>>> +/*#define __XEN_PERFC_DEFN_H__*/
>>> +
>>> +PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
>>> +
>>> +/*#endif*/ /* __XEN_PERFC_DEFN_H__ */
>>>
>>> and add the following to commit message:
>>>       Since vcpu_kick() calls perfc_incr(vcpu_kick), add perfcounter for
>>>       vcpu_kick to handle the case when CONFIG_PERF_COUNTERS=y. Although
>>>       CONFIG_PERF_COUNTERS is not enabled by default, it can be enabled,
>>>       for example, by randconfig what will lead to CI build issues.
>>>
>>> Note that I keep __XEN_PERFC_DEFN_H__ as other archictectures use the same,
>>> not something like ASM__<arch>__PERFC_DEFN_H.
>> Please don't copy this mistake. I actually question the commented-out pre-
>> processor directives altogether: Misra also has a rule against commented-
>> out code (directive 4.4, which we didn't accept [yet], but which exists
>> nevertheless). Yet at the very least what's commented out should not be
>> obviously wrong.
> 
> Do I understand correctly that it would be acceptable to simply drop the
> commented-out preprocessor directives and keep only /* This file is intended
> to be included multiple times. */ ?

I think so, yes. You could simply check how the same situation is covered
for elsewhere.

Jan

