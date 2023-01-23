Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5C678A51
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483286.749362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4yX-0002yA-C6; Mon, 23 Jan 2023 22:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483286.749362; Mon, 23 Jan 2023 22:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4yX-0002vu-9a; Mon, 23 Jan 2023 22:07:37 +0000
Received: by outflank-mailman (input) for mailman id 483286;
 Mon, 23 Jan 2023 22:07:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pK4yW-0002vo-9m
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:07:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK4yT-0004zk-Pg; Mon, 23 Jan 2023 22:07:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK4yT-0000t7-JB; Mon, 23 Jan 2023 22:07:33 +0000
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
	bh=2NxIrUoJGYNAjv4fKwE7bBm/FlFpPnGkwoMYc2rZZSQ=; b=2gKQ8Y0hTH5SadsB4dZYLHnPpE
	7oMsF8S21u6k0tAwag2KwYX9+jlKxBds7sos+//5F3KXjjGxgpbHrUswrJl+j3T7qCH46jlo+rQKZ
	jqFHvzfSphsCEsVGiy7UzOppr7mDapYipGM9sP7xtWmTNdzYi4Np3A3Ej3FQ+t1/qqJo=;
Message-ID: <af94ef17-0891-4540-4238-ef842b8af249@xen.org>
Date: Mon, 23 Jan 2023 22:07:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v3 1/3] xen/arm: Use the correct format specifier
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xuwei5@hisilicon.com
References: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
 <20230123134451.47185-2-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301231313370.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301231313370.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/01/2023 21:19, Stefano Stabellini wrote:
> On Mon, 23 Jan 2023, Ayan Kumar Halder wrote:
>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
>> while creating nodes in fdt, the address (if present in the node name)
>> should be represented using 'PRIx64'. This is to be in conformance
>> with the following rule present in https://elinux.org/Device_Tree_Linux
>>
>> . node names
>> "unit-address does not have leading zeros"
>>
>> As 'PRIpaddr' introduces leading zeros, we cannot use it.
>>
>> So, we have introduced a wrapper ie domain_fdt_begin_node() which will
>> represent physical address using 'PRIx64'.
>>
>> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
>> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
>> address.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from -
>>
>> v1 - 1. Moved the patch earlier.
>> 2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
>> into this patch.
>>
>> v2 - 1. Use PRIx64 for appending addresses to fdt node names. This fixes the CI failure.
>>
>>   xen/arch/arm/domain_build.c | 45 +++++++++++++++++--------------------
>>   xen/arch/arm/gic-v2.c       |  6 ++---
>>   xen/arch/arm/mm.c           |  2 +-
> 
> The changes to mm.c and gic-v2.c look OK and I'd ack them already. One
> question on the changes to domain_build.c below.
> 
> 
>>   3 files changed, 25 insertions(+), 28 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index f35f4d2456..97c2395f9a 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1288,6 +1288,20 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
>>       return res;
>>   }
>>   
>> +static int __init domain_fdt_begin_node(void *fdt, const char *name,
>> +                                        uint64_t unit)
>> +{
>> +    /*
>> +     * The size of the buffer to hold the longest possible string ie
>> +     * interrupt-controller@ + a 64-bit number + \0
>> +     */
>> +    char buf[38];
>> +
>> +    /* ePAPR 3.4 */
>> +    snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);

The return wants to be checked.

>> +    return fdt_begin_node(fdt, buf);
>> +}
>> +
>>   static int __init make_memory_node(const struct domain *d,
>>                                      void *fdt,
>>                                      int addrcells, int sizecells,
>> @@ -1296,8 +1310,6 @@ static int __init make_memory_node(const struct domain *d,
>>       unsigned int i;
>>       int res, reg_size = addrcells + sizecells;
>>       int nr_cells = 0;
>> -    /* Placeholder for memory@ + a 64-bit number + \0 */
>> -    char buf[24];
>>       __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
>>       __be32 *cells;
>>   
>> @@ -1314,9 +1326,7 @@ static int __init make_memory_node(const struct domain *d,
>>   
>>       dt_dprintk("Create memory node\n");
>>   
>> -    /* ePAPR 3.4 */
>> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
>> -    res = fdt_begin_node(fdt, buf);
>> +    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
> 
> Basically this "hides" the paddr_t->uint64_t cast because it happens
> implicitly when passing mem->bank[i].start as an argument to
> domain_fdt_begin_node.
> 
> To be honest, I don't know if it is necessary. Also a normal cast would
> be fine:
> 
>      snprintf(buf, sizeof(buf), "memory@%"PRIx64, (uint64_t)mem->bank[i].start);
>      res = fdt_begin_node(fdt, buf);
The problem with the open-coding version is you would need to explain 
the cast everywhere (I disliked unexplained one).

I don't particular mind 'hidden cast' but I think we need to explain on 
top of domain_fdt_begin_node() why it is necessary.

> 
> Julien, what do you prefer?

Definitely the function because that's what I suggested (see the 
rationale above).

Cheers,

-- 
Julien Grall

