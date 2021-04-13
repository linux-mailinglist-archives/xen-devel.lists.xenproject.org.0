Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5335DC3C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 12:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109644.209323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWG0H-00005x-Tu; Tue, 13 Apr 2021 10:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109644.209323; Tue, 13 Apr 2021 10:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWG0H-00005X-QG; Tue, 13 Apr 2021 10:10:41 +0000
Received: by outflank-mailman (input) for mailman id 109644;
 Tue, 13 Apr 2021 10:10:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWG0G-00005Q-CL
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 10:10:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWG0F-0000hi-Aq; Tue, 13 Apr 2021 10:10:39 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWG0F-0004yx-4y; Tue, 13 Apr 2021 10:10:39 +0000
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
	bh=s+A0Nhy8kv+x0OJ02mSRMHQxeTxYgb0EeRnaVa3gzh4=; b=XcHe4mTLCFFazxoiJUOn8Dt3sY
	dySSj/Ik3q9FOwVCJCTuqBTRGpLE8lDEqydhJTc9qsywKdK1jpxBe2+OjSalC+Wc0qjH4bpYyf2px
	OPoOHlF1sgepPRyS4IU+on2WHkYwXl5xwuhSsGsC/D9IWw6qOGNCGOg5cMFKEmsd3tOE=;
Subject: Re: [PATCH] Remove support for ThumbEE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210413082447.30313-1-michal.orzel@arm.com>
 <1c3d1c69-976c-6626-74e7-ded112f6ed03@xen.org>
 <83218c74-3d71-6165-31a3-1f6c77b95f94@arm.com>
 <693507bd-5640-dd2a-3e37-9f8ea7da1a53@xen.org>
 <616b27e4-8882-d577-188d-0a183c94bc52@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <384d0e85-bc14-b465-ddf0-a1d4ce399b9e@xen.org>
Date: Tue, 13 Apr 2021 11:10:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <616b27e4-8882-d577-188d-0a183c94bc52@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 13/04/2021 10:59, Michal Orzel wrote:
> 
> 
> On 13.04.2021 11:42, Julien Grall wrote:
>>
>>
>> On 13/04/2021 10:32, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 13.04.2021 11:07, Julien Grall wrote:
>>>> Hi Michal,
>>>>
>>>> On 13/04/2021 09:24, Michal Orzel wrote:
>>>>> ThumbEE(T32EE) was introduced in ARMv7 and removed in ARMv8.
>>>>> In 2011 ARM deprecated any use of the ThumbEE instruction set.
>>>>
>>>> This doesn't mean this is not present in any CPU. In fact, in the same section (see A2.10 in ARM DDI 0406C.d):
>>>>
>>>> "ThumbEE is both the name of the instruction set and the name of the extension that provides support for that
>>>> instruction set. The ThumbEE Extension is:
>>>>     - Required in implementations of the ARMv7-A profile.
>>>>     - Optional in implementations of the ARMv7-R profile.
>>>> "
>>>>
>>>>>
>>>>> This feature is untested and as per my understanding
>>>>> there are no reported users for it. >
>>>>> Remove all the bits related to it.
>>>>>
>>>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com> > ---
>>>>>     xen/arch/arm/cpufeature.c        |  3 +++
>>>>>     xen/arch/arm/domain.c            | 12 ------------
>>>>>     xen/arch/arm/setup.c             |  3 +--
>>>>>     xen/include/asm-arm/cpregs.h     |  6 ------
>>>>>     xen/include/asm-arm/cpufeature.h |  1 -
>>>>>     xen/include/asm-arm/domain.h     |  1 -
>>>>>     6 files changed, 4 insertions(+), 22 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>>>> index 1d88783809..82265a72f4 100644
>>>>> --- a/xen/arch/arm/cpufeature.c
>>>>> +++ b/xen/arch/arm/cpufeature.c
>>>>> @@ -209,6 +209,9 @@ static int __init create_guest_cpuinfo(void)
>>>>>         guest_cpuinfo.pfr32.ras = 0;
>>>>>         guest_cpuinfo.pfr32.ras_frac = 0;
>>>>>     +    /* Hide ThumbEE support */
>>>>> +    guest_cpuinfo.pfr32.thumbee = 0;
>>>>
>>>> Even if you hide the feature from the guest, the registers are still accessible. So you are not removing support but just opening a potential security hole as the registers now gets shared...
>>>>
>>>> Looking at the spec, it doesn't look like it is possible to trap them.
>>> Looking at the spec for ARMv7A/R:
>>> https://developer.arm.com/documentation/ddi0406/c/System-Level-Architecture/System-Control-Registers-in-a-VMSA-implementation/VMSA-System-control-registers-descriptions--in-register-order/HSTR--Hyp-System-Trap-Register--Virtualization-Extensions
>>> we can trap Thumbee operations.
>>> This means that we will not open the security hole.
>>
>> That's for pointing that out. However, I am not still not sure why you want to drop the code. Yes this is technically untested, but:
>>    1) The change is very small
>>    2) There are CPU out there supporting it (it is mandated after all).
>>
> I wanted to drop the support for thumbee due to the following reasons:
> -it is untested
> -it is deprecated

Deprecated only means new code should avoid to use the instruction set. 
But it is still present for existing code until they are migrated to a 
newer instruction set.

However, as I pointed out only the instruction set is deprecated. The 
extension itself is mandated by Armv7-A.

> -no reported users for this feature
We probably only see the tip of the iceberg in term of the users. If the 
feature/pain is quite small to the community, then we should try to not 
drop feature.

> -KVM did that

Well, KVM fully dropped 32-bit support. But I am not yet in favor of 
that in Xen.

> 
> If you think we should not do this, then I am ok to abandon this patch.

Based on the information you provided, I think we should keep support.

Cheers,

-- 
Julien Grall

