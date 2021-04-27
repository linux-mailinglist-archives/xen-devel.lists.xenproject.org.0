Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A777936BFF2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 09:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118052.224020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHxH-0001Ev-GN; Tue, 27 Apr 2021 07:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118052.224020; Tue, 27 Apr 2021 07:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHxH-0001EW-D4; Tue, 27 Apr 2021 07:16:23 +0000
Received: by outflank-mailman (input) for mailman id 118052;
 Tue, 27 Apr 2021 07:16:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3fO=JY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lbHxG-0001ER-B0
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 07:16:22 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4a958f5e-648c-4268-83de-09a5ab17fc76;
 Tue, 27 Apr 2021 07:16:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E57C731B;
 Tue, 27 Apr 2021 00:16:20 -0700 (PDT)
Received: from [10.57.27.22] (unknown [10.57.27.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A32C3F70D;
 Tue, 27 Apr 2021 00:16:19 -0700 (PDT)
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
X-Inumbo-ID: 4a958f5e-648c-4268-83de-09a5ab17fc76
Subject: Re: [PATCH 9/9] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-10-michal.orzel@arm.com>
 <c318c303-1187-3a64-833b-0684a2dc4312@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <a37f7d85-dee7-d2f8-9883-1a8004d1ca25@arm.com>
Date: Tue, 27 Apr 2021 09:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c318c303-1187-3a64-833b-0684a2dc4312@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Jilien,

On 21.04.2021 21:16, Julien Grall wrote:
> Hi Michal,
> 
> On 20/04/2021 08:08, Michal Orzel wrote:
>> AArch64 system registers are 64bit whereas AArch32 ones
>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>> we should get rid of helpers READ/WRITE_SYSREG32
>> in favour of using READ/WRITE_SYSREG.
>> We should also use register_t type when reading sysregs
>> which can correspond to uint64_t or uint32_t.
>> Even though many AArch64 sysregs have upper 32bit reserved
>> it does not mean that they can't be widen in the future.
> 
> As a general comment, all your commit message contains information about the goal (which is great). But they don't go much in details about the actual changes. I have tried to point out where I think those details would be helpful.
> 
>>
>> As there are no other places in the code using READ/WRITE_SYSREG32,
>> remove the helper macros.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/arch/arm/vcpreg.c               | 16 ++++++++++++++++
>>   xen/include/asm-arm/arm64/sysregs.h |  5 -----
>>   2 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> index c7f516ee0a..6cb7f3108c 100644
>> --- a/xen/arch/arm/vcpreg.c
>> +++ b/xen/arch/arm/vcpreg.c
>> @@ -48,6 +48,7 @@
>>    */
>>     /* The name is passed from the upper macro to workaround macro expansion. */
>> +#ifdef CONFIG_ARM_32
>>   #define TVM_REG(sz, func, reg...)                                           \
>>   static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>   {                                                                           \
>> @@ -61,6 +62,21 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>>                                                                               \
>>       return true;                                                            \
>>   }
>> +#else /* CONFIG_ARM_64 */
>> +#define TVM_REG(sz, func, reg...)                                           \
>> +static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>> +{                                                                           \
>> +    struct vcpu *v = current;                                               \
>> +    bool cache_enabled = vcpu_has_cache_enabled(v);                         \
>> +                                                                            \
>> +    GUEST_BUG_ON(read);                                                     \
>> +    WRITE_SYSREG(*r, reg);                                                  \
>> +                                                                            \
>> +    p2m_toggle_cache(v, cache_enabled);                                     \
>> +                                                                            \
>> +    return true;                                                            \
>> +}
>> +#endif
> 
> It would be nice if this change can be explained in the commit message. However, I think we can avoid the duplication by aliasing TVM_REG32() to TVM_REG64() on Arm64.
> 
Unfortunately we cannot. This is the only working solution for now.
If we do the alias we will get many errors due to incompatbile pointer type in vreg_emulate_*.
Without a proper change in this functions we can't do that.
I will modify it once I start working on vreg_emulate topic but it requires more investigation.

For now I'd suggest to keep it as it is + explain the change in the commit.
I will push v2 soon.
>>     #define TVM_REG32(regname, xreg) TVM_REG(32, vreg_emulate_##regname, xreg)
>>   #define TVM_REG64(regname, xreg) TVM_REG(64, vreg_emulate_##regname, xreg)
>> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
>> index 077fd95fb7..83a1157ac4 100644
>> --- a/xen/include/asm-arm/arm64/sysregs.h
>> +++ b/xen/include/asm-arm/arm64/sysregs.h
>> @@ -86,11 +86,6 @@
>>   #endif
>>     /* Access to system registers */
>> -
>> -#define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
>> -
>> -#define WRITE_SYSREG32(v, name) WRITE_SYSREG64((uint64_t)v, name)
>> -
>>   #define WRITE_SYSREG64(v, name) do {                    \
>>       uint64_t _r = v;                                    \
>>       asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
>>
> 
> Cheers,
> 
Cheers,
Michal

