Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F63C461D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 10:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154420.285359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rai-0005g0-BF; Mon, 12 Jul 2021 08:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154420.285359; Mon, 12 Jul 2021 08:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rai-0005dV-7b; Mon, 12 Jul 2021 08:47:04 +0000
Received: by outflank-mailman (input) for mailman id 154420;
 Mon, 12 Jul 2021 08:47:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bOWM=ME=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m2rag-0005dN-Ih
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 08:47:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b94ae67a-e2ed-11eb-86d8-12813bfff9fa;
 Mon, 12 Jul 2021 08:47:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81A321FB;
 Mon, 12 Jul 2021 01:47:00 -0700 (PDT)
Received: from [10.57.1.228] (unknown [10.57.1.228])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E4643F694;
 Mon, 12 Jul 2021 01:46:59 -0700 (PDT)
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
X-Inumbo-ID: b94ae67a-e2ed-11eb-86d8-12813bfff9fa
Subject: Re: [PATCH v2] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210709124035.5520-1-michal.orzel@arm.com>
 <24141b99-a4a2-80f2-1cca-4f86ebc90d94@xen.org>
 <076a6500-2471-c834-97b9-547e3cf3e3b2@arm.com>
 <ad4a4cb4-efbd-1e62-8de4-366302a244b5@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <ca4bdb02-0a0e-46dc-5271-166660225e3e@arm.com>
Date: Mon, 12 Jul 2021 10:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ad4a4cb4-efbd-1e62-8de4-366302a244b5@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12.07.2021 10:33, Julien Grall wrote:
> 
> 
> On 12/07/2021 07:26, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 09.07.2021 17:21, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 09/07/2021 13:40, Michal Orzel wrote:
>>>> AArch64 system registers are 64bit whereas AArch32 ones
>>>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>>>> we should get rid of helpers READ/WRITE_SYSREG32
>>>> in favour of using READ/WRITE_SYSREG.
>>>>
>>>> The last place in code making use of READ/WRITE_SYSREG32
>>>> on arm64 is in TVM_REG macro defining functions vreg_emulate_<register>.
>>>> Implement a macro WRITE_SYSREG_SZ which expands as follows:
>>>> -on arm64: WRITE_SYSREG
>>>> -on arm32: WRITE_SYSREG{32/64}
>>>>
>>>> As there are no other places in the code using these helpers
>>>> on arm64 - remove them.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>>> ---
>>>> Changes since v1:
>>>> -implement WRITE_SYSREG_SZ instead of duplicating the TVM_REG
>>>> ---
>>>>    xen/arch/arm/vcpreg.c               | 12 +++++++++++-
>>>>    xen/include/asm-arm/arm64/sysregs.h |  4 ----
>>>>    2 files changed, 11 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>>>> index f0cdcc8a54..10c4846954 100644
>>>> --- a/xen/arch/arm/vcpreg.c
>>>> +++ b/xen/arch/arm/vcpreg.c
>>>> @@ -47,6 +47,16 @@
>>>>     *
>>>>     */
>>>>    +#ifdef CONFIG_ARM_64
>>>> +#define WRITE_SYSREG_SZ(sz, val, sysreg)     WRITE_SYSREG(val, sysreg)
>>>
>>> I think you want to cast to (uint##sz##_t) to avoid any surprise. I think...
>>>
>> But the val will always be of type uint##sz##_t because it is passed from ...
>>>> +#else
>>>> +/*
>>>> + * WRITE_SYSREG{32/64} on arm32 is defined as variadic macro which imposes
>>>> + * on the below macro to be defined like that as well.
>>>> + */
>>>> +#define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
>>>> +#endif
>>>> +
>>>>    /* The name is passed from the upper macro to workaround macro expansion. */
>>>>    #define TVM_REG(sz, func, reg...)                                           \
>>>>    static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>>> @@ -55,7 +65,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>> ... here(*r argument).
>> So I do not think that such casting makes sense e.g
>> uint##sz##_t foo;
>> WRITE_SYSREG((uint##sz##_t)foo, bar);
> 
> I agree that this doesn't make sense for the *current* use. However, when writing code, we need to think how one could use it in the future...
> 
> When I read the name, I would expect that if I call it with sz == 32, then bottom 32-bit value to be written and the top 32-bit zeroed. But this is not the case...
> 
> You are relying on the developper and reviewer to notice that only 32-bit value should be passed when sz == 32.
> 
> I am not particularly keen on relying on this when a simple cast could prevent any future misuse. Alternatively, I would be happy to consider checking the type of the value at build time.
> 
> Cheers,
> 

Ok, you are right that it does not cost much to add it, so let's stick with:
#ifdef CONFIG_ARM_64
#define WRITE_SYSREG_SZ(sz, val, sysreg) WRITE_SYSREG((uint##sz##_t)val, sysreg)
#else

I will push v3 with this change.

Cheers,
Michal

