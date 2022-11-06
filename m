Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640161E54C
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438642.692695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkLp-0006xl-22; Sun, 06 Nov 2022 18:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438642.692695; Sun, 06 Nov 2022 18:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkLo-0006vO-V3; Sun, 06 Nov 2022 18:26:32 +0000
Received: by outflank-mailman (input) for mailman id 438642;
 Sun, 06 Nov 2022 18:26:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkLn-0006vH-AV
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:26:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkLm-0005ez-QB; Sun, 06 Nov 2022 18:26:30 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkLm-0000xS-Jh; Sun, 06 Nov 2022 18:26:30 +0000
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
	bh=vskquFxYEDCKLkfhz08IoYmcVluLR5iK/Wdrn25zm1E=; b=ZDh3q5XTESgM+oajijDaYgLW7A
	y4FKrvPUmrvgVkyX49KFbQS07a+8+QQ8jjBsKB0YDLAjZ1RlnS1AfmNQJy+YUED13JJmWw1jUPWDM
	CTzHmdwZWini5HEXllWJvtl59MWHeLAZxzwouwcZhfnSpDIfDiRNGNMjOchZXdK0b6rY=;
Message-ID: <a4885e1d-3f86-4287-838d-5d8959e6957e@xen.org>
Date: Sun, 6 Nov 2022 18:26:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 09/12] xen/Arm: GICv3: Define GIC registers for AArch32
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-10-ayankuma@amd.com>
 <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/2022 15:08, Michal Orzel wrote:
> Hi Ayan,
> 
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>
> The title is a bit ambiguous given that the previous patches were also defining GIC registers.
> Maybe adding "remaining" would result in a better commit title.
> 
>>
>> Refer "Arm IHI 0069H ID020922"
>> 12.5.23 ICC_SGI1R, Interrupt Controller Software Generated Interrupt
>> Group 1 Register
>> 12.5.12 ICC_HSRE, Interrupt Controller Hyp System Register Enable register
>> 12.7.10 ICH_VTR, Interrupt Controller VGIC Type Register
>> 12.7.5 ICH_HCR, Interrupt Controller Hyp Control Register
>> 12.5.20 ICC_PMR, Interrupt Controller Interrupt Priority Mask Register
>> 12.5.24 ICC_SRE, Interrupt Controller System Register Enable register
>> 12.5.7 ICC_DIR, Interrupt Controller Deactivate Interrupt Register
>> 12.5.9 ICC_EOIR1, Interrupt Controller End Of Interrupt Register 1
>> 12.5.14 ICC_IAR1, Interrupt Controller Interrupt Acknowledge Register 1
>> 12.5.5 ICC_BPR1, Interrupt Controller Binary Point Register 1
>> 12.5.6 ICC_CTLR, Interrupt Controller Control Register
>> 12.5.16 ICC_IGRPEN1, Interrupt Controller Interrupt Group 1 Enable register
>> 12.7.9 ICH_VMCR, Interrupt Controller Virtual Machine Control Register
>>
> As said in the previous patches: this may be my personal opinion but sth like this would be easier to read:
> "
> Define missing assembly aliases for GIC registers on arm32, taking the ones
> defined already for arm64 as a base. Aliases are defined according to the
> GIC Architecture Specification ARM IHI 0069H.
> "

+1 with one remark. I think listing the registers added in the commit 
message (no need for the section) is fine.

>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changes from :-
>> v1 - 1. Moved coproc regs definition to asm/cpregs.h
>>
>>   xen/arch/arm/include/asm/cpregs.h | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index bfabee0bc3..62b63f4cef 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -415,6 +415,22 @@
>>   #define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
>>   #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>>   #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>> +
>> +#define ICC_SGI1R_EL1             p15,0,c12
>> +
>> +#define ICC_SRE_EL2               p15,4,c12,c9,5
>> +#define ICH_VTR_EL2               p15,4,c12,c11,1
>> +#define ICH_HCR_EL2               p15,4,c12,c11,0
>> +
>> +#define ICC_PMR_EL1               p15,0,c4,c6,0
>> +#define ICC_SRE_EL1               p15,0,c12,c12,5
>> +#define ICC_DIR_EL1               p15,0,c12,c11,1
>> +#define ICC_EOIR1_EL1             p15,0,c12,c12,1
>> +#define ICC_IAR1_EL1              p15,0,c12,c12,0
>> +#define ICC_BPR1_EL1              p15,0,c12,c12,3
>> +#define ICC_CTLR_EL1              p15,0,c12,c12,4
>> +#define ICC_IGRPEN1_EL1           p15,0,c12,c12,7
>> +#define ICH_VMCR_EL2              p15,4,c12,c11,7
> I did not check this in previous patches but in which order are you defining these registers?
> I took a look at arm64/sysregs.h and these regs are placed in assembly aliases name order.
> So for instance ICC_PMR_EL1 would be defined before ICC_SRE_EL2, etc.

Per the comment in the header, they should be ordered as followed:

Coprocessor-> CRn-> Opcode 1-> CRm-> Opcode 2

Also, we first define the arm32 name and *then* define an alias for 
common code.

These remarks applies for the full series.

Cheers,

-- 
Julien Grall

