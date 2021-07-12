Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064B3C460F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 10:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154406.285335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rNK-0003TW-V3; Mon, 12 Jul 2021 08:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154406.285335; Mon, 12 Jul 2021 08:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rNK-0003Rn-Oj; Mon, 12 Jul 2021 08:33:14 +0000
Received: by outflank-mailman (input) for mailman id 154406;
 Mon, 12 Jul 2021 08:33:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m2rNJ-0003Rh-1g
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 08:33:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m2rNH-0001Hx-RI; Mon, 12 Jul 2021 08:33:11 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m2rNH-0001nh-Kq; Mon, 12 Jul 2021 08:33:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=kUuvFVs03oX1CwJf7o+7+AnKIVzAVyJW/GEjOCD5gd8=; b=L5NSpSIbPt6In0w1akNZ5ZoH1d
	KX1OB5vYTZJ2bUWzolZ6pTTr2RTdtQNURDLkGOj48wm7zZwRGvXQdMqxpbk5uT/OQcqxKipDXAlPh
	uSwghDmu7oaPI5keshWsATzh2kyabFQFQABIk9KnqRN5pTcBlD59mG8cJ4/PB8qXdKK4=;
Subject: Re: [PATCH v2] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210709124035.5520-1-michal.orzel@arm.com>
 <24141b99-a4a2-80f2-1cca-4f86ebc90d94@xen.org>
 <076a6500-2471-c834-97b9-547e3cf3e3b2@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ad4a4cb4-efbd-1e62-8de4-366302a244b5@xen.org>
Date: Mon, 12 Jul 2021 09:33:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <076a6500-2471-c834-97b9-547e3cf3e3b2@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 12/07/2021 07:26, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 09.07.2021 17:21, Julien Grall wrote:
>> Hi Michal,
>>
>> On 09/07/2021 13:40, Michal Orzel wrote:
>>> AArch64 system registers are 64bit whereas AArch32 ones
>>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>>> we should get rid of helpers READ/WRITE_SYSREG32
>>> in favour of using READ/WRITE_SYSREG.
>>>
>>> The last place in code making use of READ/WRITE_SYSREG32
>>> on arm64 is in TVM_REG macro defining functions vreg_emulate_<register>.
>>> Implement a macro WRITE_SYSREG_SZ which expands as follows:
>>> -on arm64: WRITE_SYSREG
>>> -on arm32: WRITE_SYSREG{32/64}
>>>
>>> As there are no other places in the code using these helpers
>>> on arm64 - remove them.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>> Changes since v1:
>>> -implement WRITE_SYSREG_SZ instead of duplicating the TVM_REG
>>> ---
>>>    xen/arch/arm/vcpreg.c               | 12 +++++++++++-
>>>    xen/include/asm-arm/arm64/sysregs.h |  4 ----
>>>    2 files changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>>> index f0cdcc8a54..10c4846954 100644
>>> --- a/xen/arch/arm/vcpreg.c
>>> +++ b/xen/arch/arm/vcpreg.c
>>> @@ -47,6 +47,16 @@
>>>     *
>>>     */
>>>    +#ifdef CONFIG_ARM_64
>>> +#define WRITE_SYSREG_SZ(sz, val, sysreg)     WRITE_SYSREG(val, sysreg)
>>
>> I think you want to cast to (uint##sz##_t) to avoid any surprise. I think...
>>
> But the val will always be of type uint##sz##_t because it is passed from ...
>>> +#else
>>> +/*
>>> + * WRITE_SYSREG{32/64} on arm32 is defined as variadic macro which imposes
>>> + * on the below macro to be defined like that as well.
>>> + */
>>> +#define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
>>> +#endif
>>> +
>>>    /* The name is passed from the upper macro to workaround macro expansion. */
>>>    #define TVM_REG(sz, func, reg...)                                           \
>>>    static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>> @@ -55,7 +65,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
> ... here(*r argument).
> So I do not think that such casting makes sense e.g
> uint##sz##_t foo;
> WRITE_SYSREG((uint##sz##_t)foo, bar);

I agree that this doesn't make sense for the *current* use. However, 
when writing code, we need to think how one could use it in the future...

When I read the name, I would expect that if I call it with sz == 32, 
then bottom 32-bit value to be written and the top 32-bit zeroed. But 
this is not the case...

You are relying on the developper and reviewer to notice that only 
32-bit value should be passed when sz == 32.

I am not particularly keen on relying on this when a simple cast could 
prevent any future misuse. Alternatively, I would be happy to consider 
checking the type of the value at build time.

Cheers,

-- 
Julien Grall

