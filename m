Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5636C0D8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 10:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118089.224047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJ7Y-0000a3-IL; Tue, 27 Apr 2021 08:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118089.224047; Tue, 27 Apr 2021 08:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJ7Y-0000Ze-Eh; Tue, 27 Apr 2021 08:31:04 +0000
Received: by outflank-mailman (input) for mailman id 118089;
 Tue, 27 Apr 2021 08:31:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbJ7W-0000ZZ-NY
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 08:31:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbJ7V-0002pA-K8; Tue, 27 Apr 2021 08:31:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbJ7V-0006ZD-8w; Tue, 27 Apr 2021 08:31:01 +0000
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
	bh=IsSeQwunhPr9X8tbKJhnbEUAHOEGZqQCyFjpQoCetZE=; b=SJWFf8YgPT6b8uXs3ugOBr9SPf
	Wttg+bhZtsG69HBJU+44PdorLpw7esQZ8aPjWKwV5fgHZolBevfr55cu946HgJ5Ti4hgbHMJNl9fK
	f1VP2rFCNSupoj7llhm/QeqjQ35i3z0EFQI8l9R4ph87GN6ReqOQAtM8m9PGULWdP1f8=;
Subject: Re: [PATCH 9/9] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-10-michal.orzel@arm.com>
 <c318c303-1187-3a64-833b-0684a2dc4312@xen.org>
 <a37f7d85-dee7-d2f8-9883-1a8004d1ca25@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0d4ffc04-3fbb-4b62-f6d8-e33da427e505@xen.org>
Date: Tue, 27 Apr 2021 09:30:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a37f7d85-dee7-d2f8-9883-1a8004d1ca25@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 27/04/2021 08:16, Michal Orzel wrote:
> Hi Jilien,

Hi,

> On 21.04.2021 21:16, Julien Grall wrote:
>> Hi Michal,
>>
>> On 20/04/2021 08:08, Michal Orzel wrote:
>>> AArch64 system registers are 64bit whereas AArch32 ones
>>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>>> we should get rid of helpers READ/WRITE_SYSREG32
>>> in favour of using READ/WRITE_SYSREG.
>>> We should also use register_t type when reading sysregs
>>> which can correspond to uint64_t or uint32_t.
>>> Even though many AArch64 sysregs have upper 32bit reserved
>>> it does not mean that they can't be widen in the future.
>>
>> As a general comment, all your commit message contains information about the goal (which is great). But they don't go much in details about the actual changes. I have tried to point out where I think those details would be helpful.
>>
>>>
>>> As there are no other places in the code using READ/WRITE_SYSREG32,
>>> remove the helper macros.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>>    xen/arch/arm/vcpreg.c               | 16 ++++++++++++++++
>>>    xen/include/asm-arm/arm64/sysregs.h |  5 -----
>>>    2 files changed, 16 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>>> index c7f516ee0a..6cb7f3108c 100644
>>> --- a/xen/arch/arm/vcpreg.c
>>> +++ b/xen/arch/arm/vcpreg.c
>>> @@ -48,6 +48,7 @@
>>>     */
>>>      /* The name is passed from the upper macro to workaround macro expansion. */
>>> +#ifdef CONFIG_ARM_32
>>>    #define TVM_REG(sz, func, reg...)                                           \
>>>    static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>>    {                                                                           \
>>> @@ -61,6 +62,21 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>>                                                                                \
>>>        return true;                                                            \
>>>    }
>>> +#else /* CONFIG_ARM_64 */
>>> +#define TVM_REG(sz, func, reg...)                                           \
>>> +static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>> +{                                                                           \
>>> +    struct vcpu *v = current;                                               \
>>> +    bool cache_enabled = vcpu_has_cache_enabled(v);                         \
>>> +                                                                            \
>>> +    GUEST_BUG_ON(read);                                                     \
>>> +    WRITE_SYSREG(*r, reg);                                                  \
>>> +                                                                            \
>>> +    p2m_toggle_cache(v, cache_enabled);                                     \
>>> +                                                                            \
>>> +    return true;                                                            \
>>> +}
>>> +#endif
>>
>> It would be nice if this change can be explained in the commit message. However, I think we can avoid the duplication by aliasing TVM_REG32() to TVM_REG64() on Arm64.
>>
> Unfortunately we cannot. This is the only working solution for now.
> If we do the alias we will get many errors due to incompatbile pointer type in vreg_emulate_*.
> Without a proper change in this functions we can't do that.

Right, so the prototype needs to stay the same. How about provide a 
wrapper WRITE_SYSREG_SZ(sz, val, sysreg) internal to vcpreg.c?

On 32-bit it would expand to WRITE_SYSREG##sz(val, sysreg) and on 
64-bit, it would expand to WRITE_SYSREG().

> I will modify it once I start working on vreg_emulate topic but it requires more investigation.

While it would be great to get rid of {READ, WRITE}_SYSREG32, I don't 
want to duplicate the code (even temporarily) just for the sake for 
removing the helpers.

If the new proposal I suggested above doesn't work, then I would 
strongly prefer to keep the existing code until vreg_emulate_* is reworked.

Cheers,

-- 
Julien Grall

