Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BAE645F42
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 17:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456531.714307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2xcl-0007Ge-49; Wed, 07 Dec 2022 16:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456531.714307; Wed, 07 Dec 2022 16:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2xcl-0007Du-0O; Wed, 07 Dec 2022 16:50:23 +0000
Received: by outflank-mailman (input) for mailman id 456531;
 Wed, 07 Dec 2022 16:50:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2xci-00073N-Nt
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 16:50:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2xcf-0006Pm-NT; Wed, 07 Dec 2022 16:50:17 +0000
Received: from [15.248.2.156] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2xcf-0002PA-GF; Wed, 07 Dec 2022 16:50:17 +0000
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
	bh=z8Q5b1N8Jz9euipTZvbGNA47AUluIUZY8hK2/XGVOjI=; b=rZ+3hlds5xx/W9V3WtaZ8oGTNk
	LQMZfHXd7DNifTUbqc/W3dXajvMbJ79cJWpoGKeyoIdsLO/GJVHBM0RWq/9pPqSG1li6whHZBxx9b
	GMzTQUMytlFo7dSWEm5aAIOEZH8eG/bZeWwZ/jKHDXGw6D99cgg1bmDoLcElkGj5yY7M=;
Message-ID: <478d4c20-31b7-e98d-25c1-4b4e9afe7e0a@xen.org>
Date: Wed, 7 Dec 2022 16:50:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN][RFC PATCH v3 10/14] xen/arm: Implement device tree node
 removal functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-11-fnu.vikram@xilinx.com>
 <f00fa29e-d59a-471a-ef05-4f72787ad8e8@xen.org>
 <e5876e70-740c-74ad-f6ef-c6afe955199d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e5876e70-740c-74ad-f6ef-c6afe955199d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/12/2022 01:37, Vikram Garhwal wrote:
>> In your use-case, are you planning to ask the admin to reboot if you
>> can't remove a node?
> Yeah. What is error case where it may happen?

The code below have many possible failures. I would suggest to test by 
throwing an error on the second node and check what happen if you try to 
remove again.

> 
> We are checking if dtbo is same as it was added and also expect user to 
> remove the nodes only iff the nodes aren't
> 
> used by any domain.
> 
>>
>>> +        {
>>> +            printk(XENLOG_ERR "Device %s is not present in the tree. 
>>> Removing nodes failed\n",
>>> +                   full_dt_node_path[j]);
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        domid = dt_device_used_by(overlay_node);
>>> +
>>> +        dt_dprintk("Checking if node %s is used by any domain\n",
>>> +                   full_dt_node_path[j]);
>>> +
>>> +        /* Remove the node iff it's assigned to domain 0 or domain 
>>> io. */
>>> +        if ( domid != 0 && domid != DOMID_IO )
>>
>> I think I asked before, but I have seen no answer on that. What will
>> prevent the device to not be assigned after this check?
> 
> So, here for removal we assume that user removed all on-going ops on the 
> dtbo nodes which they wants to remove.
Please don't make any assumption on what the user is doing even if it is 
dom0. So the hypervisor code should be hardened.

>>> +        {
>>> +            printk(XENLOG_ERR "Device %s as it is being used by 
>>> domain %d. Removing nodes failed\n",
>>> +                   full_dt_node_path[j], domid);
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        dt_dprintk("Removing node: %s\n", full_dt_node_path[j]);
>>> +
>>> +        nirq = node_num_irq[j];
>>> +
>>> +        /* Remove IRQ permission */
>>> +        for ( i = 0; i < nirq; i++ )
>>> +        {
>>> +            rc = nodes_irq[j][i];
>>> +            /*
>>> +             * TODO: We don't handle shared IRQs for now. So, it is 
>>> assumed that
>>> +             * the IRQs was not shared with another domain.
>>> +             */
>>
>> This is not what I meant in v2. Interrupts cannot be shared between
>> domain on Arm. However, interrupts can be shared between devices.
>>
>> This is the latter part that needs a TODO.
>>
>> In addition to that, as I wrote, an IRQ can be assigned to a *single*
>> domain without the device been assigned to that domain. So I think this
>> needs to be checked possibly by using the information stored in "desc"
>> to know where the IRQ was routed to.
>>
>>> +            rc = irq_deny_access(d, rc);
>>> +            if ( rc )
>>> +            {
>>> +                printk(XENLOG_ERR "unable to revoke access for irq 
>>> %u for %s\n",
>>> +                       i, dt_node_full_name(overlay_node));
>>> +                return rc;
>>> +            }
>>> +        }
>>> +
>>> +        rc = iommu_remove_dt_device(overlay_node);
>>> +        if ( rc != 0 && rc != -ENXIO )
>>> +            return rc;
>>> +
>>> +        naddr = dt_number_of_address(overlay_node);
>>> +
>>> +        /* Remove mmio access. */
>>> +        for ( i = 0; i < naddr; i++ )
>>> +        {
>>> +            rc = dt_device_get_address(overlay_node, i, &addr, &size);
>>> +            if ( rc )
>>> +            {
>>> +                printk(XENLOG_ERR "Unable to retrieve address %u for 
>>> %s\n",
>>> +                       i, dt_node_full_name(overlay_node));
>>> +                return rc;
>>> +            }
>>> +
>>> +            rc = iomem_deny_access(d, paddr_to_pfn(addr),
>>> +                                   paddr_to_pfn(PAGE_ALIGN(addr + 
>>> size - 1)));
>>
>> I think you missed my comment here. Similar to the IRQs, you are asking
>> for trouble to parse the device-tree again. It would be better to store
>> the information using a rangeset (see include/xen/rangeset.h).
>>
>> I also think the double array for the IRQs should be converted to a
>> rangeset as this would simplify the code.
>>
> Keeping rangeset will work if we only parse one-level nodes. But if 
> there are descendant nodes, then its looking complicated to get info 
> using rangeset. While adding, we have to add parent first and then it's 
> descendant. But while remove, we will need to remove descendants first 
> and the parent node lastly.

I am not sure I understand the problem here. If you use a rangeset, then 
you don't need to go through every node one by one to apply/revert the 
permissions. You could simply apply/revert all the permission in one call.

>> Furthemore, you are removing the permission but not the mapping in the
>> P2M. Can you clarify why?
> We are not actually mapping the nodes here.
The remove function should be the inverse of the add function. AFAICT, 
you are calling mapping the P2M (see call to map_range_to_domain()). So 
this removal function *have* to remove the entry from the P2Ms.

If you disagree with that, then please explain who is going to remove 
the P2M mappings.

±>>
>>
>>> +            if ( rc )
>>> +            {
>>> +                printk(XENLOG_ERR "Unable to remove dom%d access to"
>>> +                        " 0x%"PRIx64" - 0x%"PRIx64"\n",
>>> +                        d->domain_id,
>>> +                        addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
>>> +                return rc;
>>> +            }
>>> +        }
>>> +
>>> +        rc = dt_overlay_remove_node(overlay_node);
>>> +        if ( rc )
>>> +            return rc;
>>> +    }
>>> +
>>> +    return rc;
>>> +}
>>
>> [...]
>>
>>> + * overlay_node_track describes information about added nodes 
>>> through dtbo.
>>> + * @entry: List pointer.
>>> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 
>>> 'updated fdt'.
>>> + * @fdt: Stores the fdt.
>>> + * @nodes_fullname: Stores the full name of nodes.
>>> + * @nodes_irq: Stores the IRQ added from overlay dtb.
>>> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
>>> + * @num_nodes: Stores total number of nodes in overlay dtb.
>>> + */
>>> +struct overlay_track {
>>> +    struct list_head entry;
>>> +    struct dt_device_node *dt_host_new;
>>> +    void *fdt;
>>> +    char **nodes_fullname;
>>
>> Looking at the code, the main use for the fullname are to check the FDT
>> match and looking up in the DT.
>>
>> In order to check the DT, you could use memcmp() to confirm both the
>> stored FDT and the one provided by the user match.
>>
>> For the lookup, you could avoid it by storing a pointer to the root of
>> the new subtrees.
>>
>> Please let me know if you disagree with this approach.
>>
> If I understood correctly: just keeping the root of new overlay subtree 
> will not work for all case. It will work only if the nodes added are 
> adjacent to each other i.e. have the same parent then it will work as we 
> add all overlay nodes as the last child of their parent. But If two 
> subnodes have different parents, they may or may not be 
> nearby(node->allnext won't work) then we will issues removing the node 
> from this approach.

Thanks for the explanation.

> 
> I did following small modification to your suggestion:
> Keep FDT( do memcmp) for match and also keep address for all added nodes 
> at one-level( we can find children info if we know the top one-level 
> nodes. Please check overlay_node_count()). This will take 8bytes * num 
> of nodes in one-level space which is lot less space than keeping 
> nodes_fullname.

This seems to match my thoughts after your explanation above. I will 
have a look at the next version.

Cheers,

-- 
Julien Grall

