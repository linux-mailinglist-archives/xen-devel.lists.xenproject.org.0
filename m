Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B81F3F9545
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 09:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173454.316492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWUz-0004j5-Uv; Fri, 27 Aug 2021 07:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173454.316492; Fri, 27 Aug 2021 07:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJWUz-0004gj-RQ; Fri, 27 Aug 2021 07:42:01 +0000
Received: by outflank-mailman (input) for mailman id 173454;
 Fri, 27 Aug 2021 07:42:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJWUy-0004gc-1U
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 07:42:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJWUx-0007vJ-Pg; Fri, 27 Aug 2021 07:41:59 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJWUx-0005k4-Jq; Fri, 27 Aug 2021 07:41:59 +0000
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
	bh=0qq5wByrrqAKAqUsFDaxjn0k7yMX9HknZtzpqFP541M=; b=VG2BsBo9tUU33iSmruGrbuvYMZ
	KFwMFLpCGaCrSHRksIyD0vlHogMhSqZkj/c/0DZkBvYL/KlvhFKRCTwVGPUV75SdbpITUHR4sWCAH
	I6EpJY7kUfY917I/pO0BfZJ9R01HuXhqh5gaRZNxrqSp0ZUVhwFz+dQOr1G23bXsLWr0=;
Subject: Re: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA
 when boot from EFI
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
 Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-19-wei.chen@arm.com>
 <alpine.DEB.2.21.2108261622500.24433@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <77a7126c-3874-5643-38fc-dba8130826ec@xen.org>
Date: Fri, 27 Aug 2021 08:41:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2108261622500.24433@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 27/08/2021 00:24, Stefano Stabellini wrote:
> On Wed, 11 Aug 2021, Wei Chen wrote:
>> EFI can get memory map from EFI system table. But EFI system
>> table doesn't contain memory NUMA information, EFI depends on
>> ACPI SRAT or device tree memory node to parse memory blocks'
>> NUMA mapping.
>>
>> But in current code, when Xen is booting from EFI, it will
>> delete all memory nodes in device tree. So in UEFI + DTB
>> boot, we don't have numa-node-id for memory blocks any more.
>>
>> So in this patch, we will keep memory nodes in device tree for
>> NUMA code to parse memory numa-node-id later.
>>
>> As a side effect, if we still parse boot memory information in
>> early_scan_node, bootmem.info will calculate memory ranges in
>> memory nodes twice. So we have to prvent early_scan_node to
>> parse memory nodes in EFI boot.
>>
>> As EFI APIs only can be used in Arm64, so we introduced a wrapper
>> in header file to prevent #ifdef CONFIG_ARM_64/32 in code block.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>>   xen/arch/arm/bootfdt.c      |  8 +++++++-
>>   xen/arch/arm/efi/efi-boot.h | 25 -------------------------
>>   xen/include/asm-arm/setup.h |  6 ++++++
>>   3 files changed, 13 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index 476e32e0f5..7df149dbca 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -11,6 +11,7 @@
>>   #include <xen/lib.h>
>>   #include <xen/kernel.h>
>>   #include <xen/init.h>
>> +#include <xen/efi.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/libfdt/libfdt.h>
>>   #include <xen/sort.h>
>> @@ -335,7 +336,12 @@ static int __init early_scan_node(const void *fdt,
>>   {
>>       int rc = 0;
>>   
>> -    if ( device_tree_node_matches(fdt, node, "memory") )
>> +    /*
>> +     * If system boot from EFI, bootinfo.mem has been set by EFI,
>> +     * so we don't need to parse memory node from DTB.
>> +     */
>> +    if ( device_tree_node_matches(fdt, node, "memory") &&
>> +         !arch_efi_enabled(EFI_BOOT) )
>>           rc = process_memory_node(fdt, node, name, depth,
>>                                    address_cells, size_cells, &bootinfo.mem);
>>       else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
> 
> 
> If we are going to use the device tree info for the numa nodes (and
> related memory) does it make sense to still rely on the EFI tables for
> the memory map?

Yes. AFAIK, when booting using EFI, the Device-Tree may not contain all 
the reserved regions. Furthermore, we are still too early to know 
whether we boot using ACPI and DT.

> 
> I wonder if we should just use device tree for memory and ignore EFI
> instead. Do you know what Linux does in this regard?
I looked at Linux when I first reviewed this patch because I was 
wondering what happens if the DT and UEFI map disagrees.

Linux and Xen are the same after this patch:
   1) The memory map is coming from UEFI map
   2) NUMA ID is coming from the DT

The commit that introduced the change in Linux is:

commit 500899c2cc3e3f06140373b587a69d30650f2d9d
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Fri Apr 8 15:50:23 2016 -0700

     efi: ARM/arm64: ignore DT memory nodes instead of removing them

     There are two problems with the UEFI stub DT memory node removal
     routine:
     - it deletes nodes as it traverses the tree, which happens to work
       but is not supported, as deletion invalidates the node iterator;
     - deleting memory nodes entirely may discard annotations in the form
       of additional properties on the nodes.

     Since the discovery of DT memory nodes occurs strictly before the
     UEFI init sequence, we can simply clear the memblock memory table
     before parsing the UEFI memory map. This way, it is no longer
     necessary to remove the nodes, so we can remove that logic from the
     stub as well.

     Reviewed-by: Matt Fleming <matt@codeblueprint.co.uk>
     Acked-by: Steve Capper <steve.capper@arm.com>
     Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
     Signed-off-by: David Daney <david.daney@cavium.com>
     Signed-off-by: Will Deacon <will.deacon@arm.com>

Cheers,

-- 
Julien Grall

