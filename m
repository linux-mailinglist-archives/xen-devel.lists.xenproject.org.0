Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9395C808986
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649869.1014918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEoN-0001ub-AE; Thu, 07 Dec 2023 13:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649869.1014918; Thu, 07 Dec 2023 13:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEoN-0001sw-6Y; Thu, 07 Dec 2023 13:53:07 +0000
Received: by outflank-mailman (input) for mailman id 649869;
 Thu, 07 Dec 2023 13:53:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TliB=HS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rBEoL-0001sn-Ga
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:53:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0c17959-9507-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 14:53:03 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 91BC54EE073A;
 Thu,  7 Dec 2023 14:53:02 +0100 (CET)
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
X-Inumbo-ID: f0c17959-9507-11ee-9b0f-b553b5be7939
Message-ID: <65db0ca1-9afa-4d9a-8bf2-7b1720ac1f60@bugseng.com>
Date: Thu, 7 Dec 2023 14:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/x86: address violations of MISRA C:2012 Rule 14.4
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
 <d494980216b8f0f870083fcfae7269f45e779780.1701941924.git.maria.celeste.cesario@bugseng.com>
 <30b48e9b-0630-4df9-ac6b-5ece418bf4b0@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <30b48e9b-0630-4df9-ac6b-5ece418bf4b0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/23 11:54, Jan Beulich wrote:
> On 07.12.2023 10:48, Simone Ballarin wrote:
>> --- a/xen/arch/x86/hpet.c
>> +++ b/xen/arch/x86/hpet.c
>> @@ -279,7 +279,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
>>   {
>>       ch->msi.msg = *msg;
>>   
>> -    if ( iommu_intremap )
>> +    if ( iommu_intremap != iommu_intremap_off )
>>       {
>>           int rc = iommu_update_ire_from_msi(&ch->msi, msg);
>>   
>> @@ -353,7 +353,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>>       u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>>       irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>>   
>> -    if ( iommu_intremap )
>> +    if ( iommu_intremap != iommu_intremap_off )
>>       {
>>           ch->msi.hpet_id = hpet_blockid;
>>           ret = iommu_setup_hpet_msi(&ch->msi);
>> @@ -372,7 +372,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>>           ret = __hpet_setup_msi_irq(desc);
>>       if ( ret < 0 )
>>       {
>> -        if ( iommu_intremap )
>> +        if ( iommu_intremap != iommu_intremap_off )
>>               iommu_update_ire_from_msi(&ch->msi, NULL);
>>           return ret;
>>       }
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index 7f8e794254..72dce2e4ab 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -189,7 +189,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>>   {
>>       entry->msg = *msg;
>>   
>> -    if ( iommu_intremap )
>> +    if ( iommu_intremap != iommu_intremap_off )
>>       {
>>           int rc;
>>   
>> @@ -555,7 +555,7 @@ int msi_free_irq(struct msi_desc *entry)
>>               destroy_irq(entry[nr].irq);
>>   
>>           /* Free the unused IRTE if intr remap enabled */
>> -        if ( iommu_intremap )
>> +        if ( iommu_intremap != iommu_intremap_off )
>>               iommu_update_ire_from_msi(entry + nr, NULL);
>>       }
>>   
> 
> All of this would logically be part of patch 1. Is there a particular reason
> why it wasn't done right there?

These changes and the ones in patch 1 are related, but still remain
independent. Patch 1 can be accepted without patch 2 and vice versa.
So we've decided to split the commits because patch 1 is in common
code, while patch 2 is in x86-specific code.

No other real reasons, but in any case we can move these changes to
patch 1.

> 
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -1320,7 +1320,7 @@ x86_emulate(
>>           ea.bytes = 2;
>>           goto srcmem_common;
>>       case SrcMem:
>> -        if ( state->simd_size )
>> +        if ( state->simd_size != simd_none )
>>               break;
>>           ea.bytes = (d & ByteOp) ? 1 : op_bytes;
>>       srcmem_common:
>> @@ -1460,7 +1460,7 @@ x86_emulate(
>>           /* Becomes a normal DstMem operation from here on. */
>>       case DstMem:
>>           generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
>> -        if ( state->simd_size )
>> +        if ( state->simd_size != simd_none )
>>           {
>>               generate_exception_if(lock_prefix, X86_EXC_UD);
>>               break;
>> @@ -8176,7 +8176,7 @@ x86_emulate(
>>           goto done;
>>       }
>>   
>> -    if ( state->rmw )
>> +    if ( state->rmw != rmw_NONE )
>>       {
>>           ea.val = src.val;
>>           op_bytes = dst.bytes;
>> @@ -8205,7 +8205,7 @@ x86_emulate(
>>   
>>           dst.type = OP_NONE;
>>       }
>> -    else if ( state->simd_size )
>> +    else if ( state->simd_size != simd_none )
>>       {
>>           generate_exception_if(!op_bytes, X86_EXC_UD);
>>           generate_exception_if((vex.opcx && (d & TwoOp) &&
> 
> I'd be (somewhat reluctantly) okay with ack-ing this part of the patch.
> 
> Jan

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


