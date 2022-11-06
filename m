Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4461E547
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438636.692685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkGN-0005vv-Ee; Sun, 06 Nov 2022 18:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438636.692685; Sun, 06 Nov 2022 18:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkGN-0005sV-Aw; Sun, 06 Nov 2022 18:20:55 +0000
Received: by outflank-mailman (input) for mailman id 438636;
 Sun, 06 Nov 2022 18:20:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkGM-0005sI-3E
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:20:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkGL-0005Yk-M8; Sun, 06 Nov 2022 18:20:53 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkGL-0000jw-GH; Sun, 06 Nov 2022 18:20:53 +0000
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
	bh=CASCy4BhQ/unKHff5JKokd9r8+b6dFu5u+xsUWnyPes=; b=omsk/BR7VtiUyPOHEWYn+4X9s1
	A3mQ69sp3Yvgik2WsktXuWOFKN3DpvZrXcoQSaQnC8LFxbxMbzo8y+FQmiGtkA5EvkEvEcAmT81m3
	LPh+PlVUjaW6LrgyIGqojEXblmudDwYjefDYYdzOWpWTvUj8DYxmpc+8vzgDbxRe5ZfI=;
Message-ID: <64785048-502f-ac1f-e3c3-cfc133b2e0b6@xen.org>
Date: Sun, 6 Nov 2022 18:20:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 08/12] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n>
 for AArch32
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-9-ayankuma@amd.com>
 <64dbd0a2-3629-ff88-0b23-0fc8b087ada2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <64dbd0a2-3629-ff88-0b23-0fc8b087ada2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/2022 12:35, Michal Orzel wrote:
> Hi Ayan,
> 
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>
>>
>> Refer "Arm IHI 0069H ID020922",
>> 12.7.1 - Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
>> 12.7.2 - Interrupt Controller Hyp Active Priorities Group1 Registers 0-3
>>
> Commit msg like this is not really beneficial as it requires someone to have
> this spec and only tells that such registers exist on AArch32. It is missing some
> information e.g. what is the purpose of defining them.

+1

> 
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - 1. Moved coproc register definition to asm/cpregs.h.
>>
>>   xen/arch/arm/include/asm/arm32/sysregs.h |  1 -
>>   xen/arch/arm/include/asm/cpregs.h        | 11 +++++++++++
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
>> index 8a9a014bef..1b2915a526 100644
>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>> @@ -81,7 +81,6 @@
>>
>>   /* MVFR2 is not defined on ARMv7 */
>>   #define MVFR2_MAYBE_UNDEFINED
>> -

Spurious change.

>>   #endif /* __ASSEMBLY__ */
>>
>>   #endif /* __ASM_ARM_ARM32_SYSREGS_H */
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index 4421dd49ac..bfabee0bc3 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -404,6 +404,17 @@
>>   #define ICH_LRC14_EL2              __LRC8_EL2(6)
>>   #define ICH_LRC15_EL2              __LRC8_EL2(7)
>>
>> +#define __AP0Rx_EL2(x)            ___CP32(p15,4,c12,c8,x)
>> +#define ICH_AP0R0_EL2             __AP0Rx_EL2(0)
>> +#define ICH_AP0R1_EL2             __AP0Rx_EL2(1)
>> +#define ICH_AP0R2_EL2             __AP0Rx_EL2(2)
>> +#define ICH_AP0R3_EL2             __AP0Rx_EL2(3)
>> +
>> +#define __AP1Rx_EL2(x)            ___CP32(p15,4,c12,c9,x)
>> +#define ICH_AP1R0_EL2             __AP1Rx_EL2(0)
>> +#define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
>> +#define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>> +#define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
> This might need to be re-aligned after you fix patch no. 7.
> Then, you can add:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

