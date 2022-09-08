Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2335B1C00
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403241.645305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGAj-0005mJ-Jh; Thu, 08 Sep 2022 11:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403241.645305; Thu, 08 Sep 2022 11:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGAj-0005ix-FQ; Thu, 08 Sep 2022 11:58:17 +0000
Received: by outflank-mailman (input) for mailman id 403241;
 Thu, 08 Sep 2022 11:58:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWGAi-0005ir-7W
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:58:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWGAh-0006hE-Qk; Thu, 08 Sep 2022 11:58:15 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWGAh-0006hf-I9; Thu, 08 Sep 2022 11:58:15 +0000
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
	bh=bIWR4MGEGU3W7iMF6SN72UneegUQ8SeV6assMQr+5Vo=; b=OsAVx1waasuvl3EKPwzZKOvud0
	umRZOaWHGiTq95Bai89O6oa2KgZz9oeUviipPrykbgP3fJwOCLHJuyjMtO2CRkZB9c+9Lo6VCLme6
	rBi5csC/zJ7tkXWlUsRK/oGYAQI+QJZSufzJy5cgBXluMX5/t4lzeP2MMSpSDCGOfnhM=;
Message-ID: <f6018070-2ecb-99cd-cde9-d8c1f52ce74f@xen.org>
Date: Thu, 8 Sep 2022 12:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220908093129.30124-1-Henry.Wang@arm.com>
 <f9874353-6060-61b1-3faa-9698f85c7ac4@amd.com>
 <AS8PR08MB799177FFC8C90D870DED79B792409@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799177FFC8C90D870DED79B792409@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/09/2022 11:54, Henry Wang wrote:
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>>> @@ -362,14 +362,13 @@ device-tree:
>>>
>>>       / {
>>>           chosen {
>>> +            #address-cells = <0x1>;
>>> +            #size-cells = <0x1>;
>>> +            ...
>>>               domU1 {
>>>                   compatible = "xen,domain";
>>> -                #address-cells = <0x2>;
>>> -                #size-cells = <0x2>;
>> Why did you remove this set if it relates to the childs of domU1 (e.g. kernel,
>> ramdisk) and not to domU1 itself?
> 
> Well, I think here the example is just how we setup the static memory, so we just
> want to emphasize the related part. I agree users can add another #address-cells
> and #size-cells for domU1 node for the parts that you mentioned, but that is
> not reflected by the current example (I can't find anything related to kernel,
> ramdisk, etc. in current example). I might get it wrong but having two #address-cells
> and #size-cells in that case would be quite misleading from my understanding.

I agree with that. As this is only a small part of the DT we want to 
focus on what is necessary for the current section.

> So I decided to remove it.

I would mention it in the commit message because the change seems 
unrelated otherwise.

The same apply for replacing adding extra "====". But TBH, this change 
feels completely unrelated to this patch. So I think it is better to 
have a separate patch.

[...]

>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>> index ec81a45de9..cd264793d5 100644
>>> --- a/xen/arch/arm/bootfdt.c
>>> +++ b/xen/arch/arm/bootfdt.c
>>> @@ -352,11 +352,6 @@ static int __init process_domain_node(const void
>> *fdt, int node,
>>>           /* No "xen,static-mem" present. */
>>>           return 0;
>>>
>>> -    address_cells = device_tree_get_u32(fdt, node,
>>> -                                        "#xen,static-mem-address-cells", 0);
>>> -    size_cells = device_tree_get_u32(fdt, node,
>>> -                                     "#xen,static-mem-size-cells", 0);
>>> -
>>>       return device_tree_get_meminfo(fdt, node, "xen,static-mem",
>> address_cells,
>>>                                      size_cells, &bootinfo.reserved_mem, true);
>>>   }
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index b76a84e8f5..258d74699d 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -563,21 +563,9 @@ static int __init parse_static_mem_prop(const
>> struct dt_device_node *node,
>>>       const struct dt_property *prop;
>>>
>>>       prop = dt_find_property(node, "xen,static-mem", NULL);
>>> -    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
>>> -                               addr_cells) )
>>> -    {
>>> -        printk(XENLOG_ERR
>>> -               "failed to read \"#xen,static-mem-address-cells\".\n");
>>> -        return -EINVAL;
>>> -    }
>>>
>>> -    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
>>> -                               size_cells) )
>>> -    {
>>> -        printk(XENLOG_ERR
>>> -               "failed to read \"#xen,static-mem-size-cells\".\n");
>>> -        return -EINVAL;
>>> -    }
>>> +    *addr_cells = dt_n_addr_cells(node);
>>> +    *size_cells = dt_n_size_cells(node);
>> There is a type mismatch here as e.g. addr_cells is u32 and dt_n_addr_cells
>> return type is int.
>> But I don't think this can be harmful and also it's strange for me that
>> dt_n_addr_cells
>> is defined to return int given that it either returns 2 or be32_to_cpup, which
>> means it should return u32.
> 
> Yeah. I agree. I did a git blame here and found this function is introduced 9
> years ago in "dbd1243 xen/arm: Add helpers to use the device tree". So I think
> probably it would be easier to ask the author for the following action directly :))

The code was imported from Linux where it seems to be more common to use 
"int" rather than "unsigned".

> 
> @Julien, what do you think? Shall we modify the return type of these two
> functions?

I think it would be good to be consistent. However, there are other 
users of d_n_addr_cells() (some are expecting 'int'). So if you switch 
to a different type then this use will be consistent but not the others.

I would only suggest to look at it if you have if you have copious time 
and fancy going down the rabbit hole :).

As to which type to chose, we are phasing out use of uXX in new code. So 
this should be 'uint32_t'. I would also be fine to use 'unsigned int' 
for the outside interface.

I don't have a strong opinion either way.

Cheers,

-- 
Julien Grall

