Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6677B024F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 13:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608893.947690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSIq-0007Dt-40; Wed, 27 Sep 2023 11:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608893.947690; Wed, 27 Sep 2023 11:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSIp-0007AZ-Vl; Wed, 27 Sep 2023 11:01:59 +0000
Received: by outflank-mailman (input) for mailman id 608893;
 Wed, 27 Sep 2023 11:01:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlSIo-00079h-DH
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 11:01:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlSIn-0000Pp-5x; Wed, 27 Sep 2023 11:01:57 +0000
Received: from [15.248.2.159] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlSIn-0006U7-01; Wed, 27 Sep 2023 11:01:57 +0000
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
	bh=2JEfC/ZPlO5SGkriVrZISKNIoClThAcqE5i+uy8OLhY=; b=2tA8GIkueSWOR2/9u4gVrsgpIS
	WhXlMDRiiune+5C76kc3GPLFaTPbR1PxtjTVkEA4JG4YjIBSKkIU8c4o2v1zj4QKEJawEFWjmp5NC
	K+FyHrc0eQqYbRRyRoEOtK5RgdABWaql23LgKnx+VgvO++v/8/exylRTHIE43t0rLpaw=;
Message-ID: <36d8f5ce-ef87-40cc-9515-12a2007bfa6d@xen.org>
Date: Wed, 27 Sep 2023 12:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Leo Yan <leo.yan@linaro.org>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 26/09/2023 09:36, Michal Orzel wrote:
> On 26/09/2023 07:33, Leo Yan wrote:
>>
>>
>> During the Linux kernel booting, an error is reported by the Xen
>> hypervisor:
>>
>>    (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
>>
>> The kernel attempts to use an invalid memory frame number, which can be
>> converted to: 0x1a02dc << PAGE_SHIFT, resulting in 0x1_a02d_c000.
>>
>> The invalid memory frame falls into a reserved memory node, which is
>> defined in the device tree as below:
>>
>>    reserved-memory {
>>            #address-cells = <0x02>;
>>            #size-cells = <0x02>;
>>            ranges;
>>
>>            ...
>>
>>            ethosn_reserved {
>>                    compatible = "shared-dma-pool";
>>                    reg = <0x01 0xa0000000 0x00 0x20000000>;
>>                    status = "disabled";
>>                    no-map;
>>            };
>>
>>            ...
>>    };
>>
>> Xen excludes all reserved memory regions from the frame management
>> through the dt_unreserved_regions() function. On the other hand, the
>> reserved memory nodes are passed to the Linux kernel. However, the Linux
>> kernel ignores the 'ethosn_reserved' node since its status is
>> "disabled". This leads to the Linux kernel to allocate pages from the
>> reserved memory range.
>>
>> As a result, when the kernel passes the data structure residing in the
>> frame 0x1_a02d_c000 in the Xen hypervisor, the hypervisor detects that
>> it misses to manage the frame and reports the error.
>>
>> Essentially, this issue is caused by the Xen hypervisor which misses to
>> handle the status for the memory nodes (for both the normal memory nodes
>> and the reserved memory nodes) and transfers them to the Linux kernel.
>>
>> This patch introduces a function memory_node_is_available(). If it
>> detects a memory node is not enabled, the hypervisor will not add the
>> memory region into the memory lists. In the end, this avoids to generate
>> the memory nodes from the memory lists sent to the kernel and the kernel
>> cannot use the disabled memory nodes any longer.
> 
> Interesting. So FWICS, we have 2 issues that have a common ground:
> 1) If the reserved memory node has a status "disabled", it implies that this region
> is no longer reserved and can be used which is not handled today by Xen and leads
> to the above mentioned problem.
> 
> 2) If the memory node has a status "disabled" it implies that it should not be used
> which is not the case in current Xen. This means that at the moment, Xen would try
> to use such a memory region which is incorrect.
> 
> I think the commit msg should be more generic and focus on these two issues.
> Summary:
> Xen does not handle the status property of memory nodes and ends up using them.
> Xen does not handle the status property of reserved memory nodes. If status is disabled
> it means the reserved region shall no longer be treated as reserved. Xen passes the reserved
> memory nodes untouched to dom0 fdt and creates a memory node to cover reserved regions.
> Disabled reserved memory nodes are ignored by the guest which leaves us with the exposed
> memory nodes. Guest can access such a region but it is excluded from the page management in Xen
> which results in Xen being unable to obtain the corresponding MFN.
> 
>>
>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>> ---
>>   xen/arch/arm/bootfdt.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index 2673ad17a1..b46dde06a9 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -206,11 +206,27 @@ int __init device_tree_for_each_node(const void *fdt, int node,
>>       return 0;
>>   }
>>
>> +static bool __init memory_node_is_available(const void *fdt, unsigned long node)
> This function is not strictly related to memory node so it would be better to call it e.g. device_tree_node_is_available.

+1.

>> +{
>> +    const char *status = fdt_getprop(fdt, node, "status", NULL);
>> +
>> +    if (!status)
> white spaces between brackets and condition
> if ( !status )
> 
>> +        return true;
>> +
>> +    if (!strcmp(status, "ok") || !strcmp(status, "okay"))
> white spaces between brackets and condition
> if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
> 
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>>   static int __init process_memory_node(const void *fdt, int node,
>>                                         const char *name, int depth,
>>                                         u32 address_cells, u32 size_cells,
>>                                         void *data)
>>   {
>> +    if (!memory_node_is_available(fdt, node))
>> +        return 0;
> I would move this check to device_tree_get_meminfo()

I am ok with that. But the commit message would need to gain a paragraph 
explaining that we will now support "status" for static memory/heap.

>> +
>>       return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
>>                                      data, MEMBANK_DEFAULT);
>>   }
>> --
>> 2.39.2
>>
>>
> 
> Also, I think it would be nice to add ASSERT(bootinfo.mem.nr_banks); e.g. in boot_fdt_info().
> Otherwise the panic from Xen when there is no memory bank:
> The frametable cannot cover the physical region ...
> is not really meaningful for normal users.
> 
> This is just my suggestion (@Julien ?)

I think a check for the number of banks makes sense. But I would prefer 
if the check also happens in production. So, something like:

if ( !bootinfo.mem.nr_banks )
   panic(...);

We already have one in the setup_mm() for arm32. So we need another one 
for the arm64 version. The other solution is to consolidate it in one 
place you suggested.

I have a slightly preference for having it in setup_mm() even if this is 
duplicated.

Cheers,

-- 
Julien Grall

