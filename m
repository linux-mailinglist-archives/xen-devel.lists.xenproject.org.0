Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IFpNVeuiWndAgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:52:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512810DCC9
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225091.1531550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNw5-00025l-Sl; Mon, 09 Feb 2026 09:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225091.1531550; Mon, 09 Feb 2026 09:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNw5-00023O-Q3; Mon, 09 Feb 2026 09:52:05 +0000
Received: by outflank-mailman (input) for mailman id 1225091;
 Mon, 09 Feb 2026 09:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpNw4-00023I-6c
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:52:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9ca622d-059c-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 10:51:59 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so2818018f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:51:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376accfc58sm10384106f8f.16.2026.02.09.01.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:51:58 -0800 (PST)
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
X-Inumbo-ID: f9ca622d-059c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770630718; x=1771235518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CFemyBGgeUstEbpkJJOJGGd9yi/2M0injES8NM4DbJY=;
        b=gI9vk1QKeHaRJFo99dwROwvRWYacIvFjWYykuKDw8+uTwl5VVDmcuDOnxmnVUwvCQB
         N8jH1sY7QKB6CprgJOtNsk8uO3roxny1HY4iGqNMe6Ng6PeU8Ejt8r/afH/V7F15/yj2
         jFy2MUJim4jaQERhviKq6rc5XjPXVbVdH0vOCTcydQGaWaKCatbAVZ4bTiKKmd31o4XK
         MSDI/ZM9wxLEoiOWoPcAjZL2JWsqVQNTSv6fglYiUH/7BOaYYWhS7Qi34H3UcRJxYnZZ
         hpTrj45+9nqZmekVCWo2Z2DBqrorX2T0Z40y4s3Ij/iyNxzrnu4Sx8rWqx8hOPHoCz5K
         hRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630718; x=1771235518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFemyBGgeUstEbpkJJOJGGd9yi/2M0injES8NM4DbJY=;
        b=CISZrmeoKgEW0UPUhs/qIGpsk/4zRsdqwb/0+blWw5ZXATePZDxHB/5mBhTdjcQLto
         JAx7swIHHz70nU4pngkZARGIEyUPn0oszi++EfNMqbFd174xMdAgDDNZ1L8Sz0AB9zyu
         L4kylEIvXxqvSeOOV1omaSxbwguCkha4MMEzMEzQRGaz7RUuI976CByu4fJya2dUMLhf
         jZc9uGTd/Jy9PWt3VDZmn6nTTeuv4NiZJN0VTXvcIcl7QuPHJWTDHLx02X9Hpc0MptUL
         p8WxhmmscVAeQ2urVsId+Wt9yjFGopPbAjFFT1UzOlkib+SsycPATwD+rBJkFr/q57Ez
         U3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR6YOpitC2ReKUr/GGBlQVq9XUCKAeA98gzsHjoalKSgKNUv33o//n1hIcch1KeG9EJg5ZCC6eAyA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0PLlsgv69nSrCvDvGMO7E8n9HqpLhkpWNjyQKJzlsIAcPwR5+
	TofFqLlvuBupKfQhFs+yuCfC7NTqfG371LQgbHLpi75+xGgbC2GLH0NMPWXrcdccWg==
X-Gm-Gg: AZuq6aKX7i+m0Hmu1mJHDJ1Q7yMtEEreig25ysl4xGX6k0leOiUiROcVWH/mIxdvdFI
	5LYBiDywmrEAXjBwIy+dvC5OyjdAS+Qmci+2pU2wN5UMGlgimYbVnDPg0B8t+XLNamgEj+chYnz
	n3pz6YlWbS8KLf3MWpSw2BXPxcvWJuXdqr2m7E6JuuufGEtXRrDtqJ27deEXIGuodDIMMp2X2lX
	dDCHn7hIhmWfGxUPGD2fifPVv+IxZwKjPmcKwXSAy7CN0eM0DzlOXPkXG7tPlLEecKILGvn5Tld
	nN249ttEL8kK243Ca8JjkLS9rIJ/X8oZLH+2F1K61rz/v5CKtVkPS1f/xXabSYyxQRUqDpB+wEG
	BQ2uy1UJI95l9eoePD7ziCP6XgcjWpDPJwtqv25sDSWpcMXDuqTZELRm0lwTxou897DdylVITNe
	rm16iP7A1+JSJkcded6xEspZKr+vbdH6+U9pSVRMTrbvFLVITVZmF84TOn0NEvkBkvdEg8BPaEy
	IU=
X-Received: by 2002:adf:e3ca:0:b0:436:307c:b756 with SMTP id ffacd0b85a97d-436307cb85dmr9404908f8f.47.1770630718313;
        Mon, 09 Feb 2026 01:51:58 -0800 (PST)
Message-ID: <87533cdf-c8cc-4a86-9946-a999e8d31b82@suse.com>
Date: Mon, 9 Feb 2026 10:51:59 +0100
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
In-Reply-To: <29006d8a-e003-4451-99af-0eef8f7d1c08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4512810DCC9
X-Rspamd-Action: no action

On 09.02.2026 10:40, Oleksii Kurochko wrote:
> 
> On 2/9/26 10:07 AM, Jan Beulich wrote:
>> On 06.02.2026 17:36, Oleksii Kurochko wrote:
>>> On 1/22/26 5:47 PM, Oleksii Kurochko wrote:
>>>> Add a RISC-V implementation of vcpu_kick(), which unblocks the target
>>>> vCPU and sends an event check IPI if the vCPU was running on another
>>>> processor. This mirrors the behavior of Arm and enables proper vCPU
>>>> wakeup handling on RISC-V.
>>>>
>>>> Remove the stub implementation from stubs.c, as it is now provided by
>>>> arch/riscv/domain.c.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Changes in v2:
>>>>    - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
>>>> ---
>>>>    xen/arch/riscv/domain.c | 14 ++++++++++++++
>>>>    xen/arch/riscv/stubs.c  |  5 -----
>>>>    2 files changed, 14 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>>>> index e38c0db62cac..13ac384c4b76 100644
>>>> --- a/xen/arch/riscv/domain.c
>>>> +++ b/xen/arch/riscv/domain.c
>>>> @@ -1,8 +1,10 @@
>>>>    /* SPDX-License-Identifier: GPL-2.0-only */
>>>>    
>>>> +#include <xen/cpumask.h>
>>>>    #include <xen/init.h>
>>>>    #include <xen/mm.h>
>>>>    #include <xen/sched.h>
>>>> +#include <xen/smp.h>
>>>>    #include <xen/vmap.h>
>>>>    
>>>>    #include <asm/bitops.h>
>>>> @@ -240,3 +242,15 @@ void vcpu_sync_interrupts(struct vcpu *v)
>>>>    #   error "Update vsieh"
>>>>    #endif
>>>>    }
>>>> +
>>>> +void vcpu_kick(struct vcpu *v)
>>>> +{
>>>> +    bool running = v->is_running;
>>>> +
>>>> +    vcpu_unblock(v);
>>>> +    if ( running && v != current )
>>>> +    {
>>>> +        perfc_incr(vcpu_kick);
>>> Because of this it is needed to introduce:
>>>     PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
>>> Otherwise randconfig build will fail when CONFIG_PERF_COUNTERS=y.
>>>
>>> I would like to ask if it would be okay to add it xen/include/xen/perfc_defn.h
>>> just after PERFCOUNTER(need_flush_tlb_flush,...) or would it be better to have
>>> it in arch specific perfc_defn.h?
>> Arch-specific please - it's not used by x86 nor ppc.
> 
> Then I will do the following changes:
> 
> diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
> index 3824f31c395c..86c56251d5d7 100644
> --- a/xen/arch/riscv/include/asm/Makefile
> +++ b/xen/arch/riscv/include/asm/Makefile
> @@ -7,7 +7,6 @@ generic-y += hypercall.h
>   generic-y += iocap.h
>   generic-y += irq-dt.h
>   generic-y += percpu.h
> -generic-y += perfc_defn.h
>   generic-y += random.h
>   generic-y += softirq.h
>   generic-y += vm_event.h
> diff --git a/xen/arch/riscv/include/asm/perfc_defn.h b/xen/arch/riscv/include/asm/perfc_defn.h
> new file mode 100644
> index 000000000000..4fc161f1abad
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/perfc_defn.h
> @@ -0,0 +1,7 @@
> +/* This file is intended to be included multiple times. */
> +/*#ifndef __XEN_PERFC_DEFN_H__*/
> +/*#define __XEN_PERFC_DEFN_H__*/
> +
> +PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
> +
> +/*#endif*/ /* __XEN_PERFC_DEFN_H__ */
> 
> and add the following to commit message:
>      Since vcpu_kick() calls perfc_incr(vcpu_kick), add perfcounter for
>      vcpu_kick to handle the case when CONFIG_PERF_COUNTERS=y. Although
>      CONFIG_PERF_COUNTERS is not enabled by default, it can be enabled,
>      for example, by randconfig what will lead to CI build issues.
> 
> Note that I keep __XEN_PERFC_DEFN_H__ as other archictectures use the same,
> not something like ASM__<arch>__PERFC_DEFN_H.

Please don't copy this mistake. I actually question the commented-out pre-
processor directives altogether: Misra also has a rule against commented-
out code (directive 4.4, which we didn't accept [yet], but which exists
nevertheless). Yet at the very least what's commented out should not be
obviously wrong.

Jan

