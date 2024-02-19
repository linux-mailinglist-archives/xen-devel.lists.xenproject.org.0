Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0A85AB73
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 19:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683060.1062388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8gy-0006lw-Qa; Mon, 19 Feb 2024 18:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683060.1062388; Mon, 19 Feb 2024 18:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8gy-0006jj-Np; Mon, 19 Feb 2024 18:48:40 +0000
Received: by outflank-mailman (input) for mailman id 683060;
 Mon, 19 Feb 2024 18:48:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rc8gx-0006jd-Gf
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 18:48:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8gx-000579-41; Mon, 19 Feb 2024 18:48:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8gw-0007HA-QL; Mon, 19 Feb 2024 18:48:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=LK4bgDKWFBvPwLWO9O8T2vSnAaqiuPT/R8E25MJ30iQ=; b=H+Z+yOhvL6EKHdp6KF8IR/KuoK
	puLhKdygOUfM25drmNBBWoB3sT3gSuF+5LtCymrYxgkLL6baiLlpaKp3+cVUbjYPL/6pwMztDVXtr
	5+ZDf2/TGhencSLFKd1h59Lv3MoWzG7ZUdiK3Zx0thsbZKV5zodplEEn71wkelo94u34=;
Message-ID: <aaeca1c4-8898-400f-a608-6ef758ed9d96@xen.org>
Date: Mon, 19 Feb 2024 18:48:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, luca.fancellu@arm.com
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-3-ayan.kumar.halder@amd.com>
 <0c4e4a40-7327-4377-bfdd-82e69bc838ae@xen.org>
 <7098c9ab-7008-4a49-92d4-6cd201b1490e@amd.com>
 <9d1a545c-a93e-4f8e-bc76-0b5676fa01ea@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9d1a545c-a93e-4f8e-bc76-0b5676fa01ea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 19/02/2024 15:43, Michal Orzel wrote:

> On 19/02/2024 15:45, Ayan Kumar Halder wrote:
>>
>> On 06/02/2024 19:05, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien/Michal,
>>>
>>> On 31/01/2024 12:10, Ayan Kumar Halder wrote:
>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>
>>>> Currently, if user enables HVC_DCC config option in Linux, it invokes
>>>> access
>>>> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64,
>>>> DBGDTRTXINT on
>>>> arm32). As these registers are not emulated, Xen injects an undefined
>>>> exception to the guest and Linux crashes.
>>>>
>>>> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
>>>> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as
>>>> TXfull.
>>>>
>>>> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
>>>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
>>>>
>>>> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
>>>> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
>>>> hvc_dcc_check(),
>>>> and returns -ENODEV in case TXfull bit is still set after writing a test
>>>> character. This way we prevent the guest from making use of HVC DCC as a
>>>> console.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> Changes from
>>>>
>>>> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving
>>>> the OS any
>>>> indication that the RX buffer is full and is waiting to be read.
>>>>
>>>> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at
>>>> EL0 only.
>>>>
>>>> 3. Fixed the commit message and inline code comments.
>>>>
>>>> v2 :- 1. Split the patch into two (separate patches for arm64 and
>>>> arm32).
>>>> 2. Removed the "fail" label.
>>>> 3. Fixed the commit message.
>>>>
>>>> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
>>>> partial_emulation_enabled is true or not.
>>>>
>>>> 2. If partial_emulation_enabled is false, then access to
>>>> HSR_SYSREG_DBGDTR_EL0,
>>>> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
>>>>
>>>>    xen/arch/arm/arm64/vsysreg.c         | 28 ++++++++++++++++++++++++----
>>>>    xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>>>>    2 files changed, 27 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>>>> index b5d54c569b..94f0a6c384 100644
>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>> @@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>         *
>>>>         * Unhandled:
>>>>         *    MDCCINT_EL1
>>>> -     *    DBGDTR_EL0
>>>> -     *    DBGDTRRX_EL0
>>>> -     *    DBGDTRTX_EL0
>>>>         *    OSDTRRX_EL1
>>>>         *    OSDTRTX_EL1
>>>>         *    OSECCR_EL1
>>>> @@ -173,10 +170,32 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>>        case HSR_SYSREG_MDCCSR_EL0:
>>>>            /*
>>>> +         * Xen doesn't expose a real (or emulated) Debug
>>>> Communications Channel
>>>> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an
>>>> optional
>>>> +         * feature. So some domains may start to probe it. For
>>>> instance, the
>>>> +         * HVC_DCC driver in Linux (since f377775dc083 and at least
>>>> up to v6.7),
>>>> +         * will try to write some characters and check if the
>>>> transmit buffer
>>>> +         * has emptied.
>>>> +         *
>>>> +         * By setting TX status bit (only if partial emulation is
>>>> enabled) to
>>>> +         * indicate the transmit buffer is full, we would hint the
>>>> OS that the
>>>> +         * DCC is probably not working.
>>>> +         *
>>>> +         * Bit 29: TX full
>>>> +         *
>>>>             * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We
>>>> emulate that
>>>>             * register as RAZ/WI above. So RO at both EL0 and EL1.
>>>
>>> The sentence "we emulate that register as ..." seems to be stale?
> I can see that you tried to handle Julien remark here. But I disagree. This statement
> is not stale. It explains that because MDSCR_EL1 is RAZ/WI, MDCCSR_EL0 is RO at both
> EL0 and EL1. This patch does not change this behavior.

Indeed. I misread the comment. So what I wrote can be ignored here.

> 
>>>
>>>>             */
>>>> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read,
>>>> hsr, 0,
>>>> +                                  partial_emulation ? (1U << 29) : 0);
>>>> +
>>>> +    case HSR_SYSREG_DBGDTR_EL0:
>>>> +    /* DBGDTR[TR]X_EL0 share the same encoding */
>>>> +    case HSR_SYSREG_DBGDTRTX_EL0:
>>>> +        if ( !partial_emulation )
>>>> +            goto fail;
>>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>>>
>>> AFAICT, all the emulation helpers have an explanation why we are using
>>> them. But here this is not the case. Can you add one?
>> This and..
>>>
>>>> +
>>>>        HSR_SYSREG_DBG_CASES(DBGBVR):
>>>>        HSR_SYSREG_DBG_CASES(DBGBCR):
>>>>        HSR_SYSREG_DBG_CASES(DBGWVR):
>>>> @@ -394,6 +413,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>         * And all other unknown registers.
>>>>         */
>>>>        default:
>>>> + fail:
>>>
>>> AFAICT, this would violate MISRA 15.3 [1]. We didn't seem to have yet
>>> (?) accepted the rule, but I don't see we would not given I feel this
>>> is similar to what Rule 16.2 is trying to prevent and we accepted it.
>>>
>>> I think case, I move all the code within default outside. And then
>>> call "goto fail" from the default label.
>>
>> I am not sure if I have interpreted this correctly.
>>
>> Is it ok if you can take a look at the attached patch and let me know if
>> the explaination and the code change looks sane ?
> Looking at the attached patch and fail handling, I don't think it is what Julien meant.
> In the default case you should jump to fail that would be defined outside of switch clause.
> 
> Something like:
>      default:
>          goto fail;
>      }
> 
>      regs->pc += 4;
>      return;
> 
> fail:
>      gdprintk...

+1.

> 
> When it comes to explanation for HSR_SYSREG_DBGDTRTX_EL0, I will let Julien to provide a comment he believes is right.
> To me, it feels strange to repeat almost the same information as for MDCCSR_EL0.

It is not clear to me whether you are objecting of adding a comment or 
whether you would be ok with a comment that is not duplicating.

If the latter, you could move the first paragraph outside of the case 
and then have a register specific explanation of the implementation.

Cheers,

-- 
Julien Grall

