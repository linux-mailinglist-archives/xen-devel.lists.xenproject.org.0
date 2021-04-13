Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A908135DB3C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 11:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109611.209245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFPa-0004M5-CK; Tue, 13 Apr 2021 09:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109611.209245; Tue, 13 Apr 2021 09:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFPa-0004Lg-95; Tue, 13 Apr 2021 09:32:46 +0000
Received: by outflank-mailman (input) for mailman id 109611;
 Tue, 13 Apr 2021 09:32:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RIKl=JK=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lWFPZ-0004Lb-Hn
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 09:32:45 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6a3a0dc4-c136-44c6-b875-3ad6cd0a2d56;
 Tue, 13 Apr 2021 09:32:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF50106F;
 Tue, 13 Apr 2021 02:32:43 -0700 (PDT)
Received: from [10.57.30.107] (unknown [10.57.30.107])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9BAA3F73B;
 Tue, 13 Apr 2021 02:32:42 -0700 (PDT)
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
X-Inumbo-ID: 6a3a0dc4-c136-44c6-b875-3ad6cd0a2d56
Subject: Re: [PATCH] Remove support for ThumbEE
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210413082447.30313-1-michal.orzel@arm.com>
 <1c3d1c69-976c-6626-74e7-ded112f6ed03@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <83218c74-3d71-6165-31a3-1f6c77b95f94@arm.com>
Date: Tue, 13 Apr 2021 11:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1c3d1c69-976c-6626-74e7-ded112f6ed03@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 13.04.2021 11:07, Julien Grall wrote:
> Hi Michal,
> 
> On 13/04/2021 09:24, Michal Orzel wrote:
>> ThumbEE(T32EE) was introduced in ARMv7 and removed in ARMv8.
>> In 2011 ARM deprecated any use of the ThumbEE instruction set.
> 
> This doesn't mean this is not present in any CPU. In fact, in the same section (see A2.10 in ARM DDI 0406C.d):
> 
> "ThumbEE is both the name of the instruction set and the name of the extension that provides support for that
> instruction set. The ThumbEE Extension is:
>   - Required in implementations of the ARMv7-A profile.
>   - Optional in implementations of the ARMv7-R profile.
> "
> 
>>
>> This feature is untested and as per my understanding
>> there are no reported users for it. >
>> Remove all the bits related to it.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com> > ---
>>   xen/arch/arm/cpufeature.c        |  3 +++
>>   xen/arch/arm/domain.c            | 12 ------------
>>   xen/arch/arm/setup.c             |  3 +--
>>   xen/include/asm-arm/cpregs.h     |  6 ------
>>   xen/include/asm-arm/cpufeature.h |  1 -
>>   xen/include/asm-arm/domain.h     |  1 -
>>   6 files changed, 4 insertions(+), 22 deletions(-)
>>
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 1d88783809..82265a72f4 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -209,6 +209,9 @@ static int __init create_guest_cpuinfo(void)
>>       guest_cpuinfo.pfr32.ras = 0;
>>       guest_cpuinfo.pfr32.ras_frac = 0;
>>   +    /* Hide ThumbEE support */
>> +    guest_cpuinfo.pfr32.thumbee = 0;
> 
> Even if you hide the feature from the guest, the registers are still accessible. So you are not removing support but just opening a potential security hole as the registers now gets shared...
> 
> Looking at the spec, it doesn't look like it is possible to trap them.
Looking at the spec for ARMv7A/R:
https://developer.arm.com/documentation/ddi0406/c/System-Level-Architecture/System-Control-Registers-in-a-VMSA-implementation/VMSA-System-control-registers-descriptions--in-register-order/HSTR--Hyp-System-Trap-Register--Virtualization-Extensions
we can trap Thumbee operations.
This means that we will not open the security hole.

> 
> In any case, the number of registers to save/restore is pretty limited. So I don't see the problem to keep the code around. It doesn't mean the feature is working, it just means we properly keep the domain isolated from each other.
> 
> Cheers,
> 

Cheers,
Michal

