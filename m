Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F43F75D6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172300.314279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIstJ-0007Ji-1l; Wed, 25 Aug 2021 13:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172300.314279; Wed, 25 Aug 2021 13:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIstI-0007Gl-U5; Wed, 25 Aug 2021 13:24:28 +0000
Received: by outflank-mailman (input) for mailman id 172300;
 Wed, 25 Aug 2021 13:24:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIstH-0007GN-EH
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:24:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIstH-0005gl-7q; Wed, 25 Aug 2021 13:24:27 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIstH-0001xC-2U; Wed, 25 Aug 2021 13:24:27 +0000
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
	bh=Q0lffNYAkr0CaSNniiVRngNS5zJx2GWYEA3wuqoFI2g=; b=MUA4M12APekwiZfTEo2eRvSdPQ
	ohAqrqHRREOIu4EAZYBbLrNy2Ab6oE9OBfco0wTOTuNAK2FF2FtUgafo6pZd2pX6m2eiwJ2g0KVl2
	KIgYtzOnUvL4kOa+Ip2LC16njslqlimG1IkfHiTw7SgwrNaCnxuRdskhQPxdKyrWkREA=;
Subject: Re: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for Arm
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-14-wei.chen@arm.com>
 <a07963e4-84c8-32de-4e8b-013a5419deea@xen.org>
 <DB9PR08MB6857E228F4C0847D4DF014ED9EC69@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <af61e054-5ac3-d302-0750-04566b3d797c@xen.org>
Date: Wed, 25 Aug 2021 14:24:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857E228F4C0847D4DF014ED9EC69@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 25/08/2021 13:07, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月25日 18:37
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for
>> Arm
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:23, Wei Chen wrote:
>>> This API is used to set one CPU to a NUMA node. If the system
>>> configure NUMA off or system initialize NUMA failed, the
>>> online NUMA node would set to only node#0. This will be done
>>> in following patches. When NUMA turn off or init failed,
>>> node_online_map will be cleared and set node#0 online. So we
>>> use node_online_map to prevent to set a CPU to an offline node.
>>
>> IHMO numa_set_node() should behave exactly the same way on x86 and Arm
>> because this is going to be used by the common code.
>>
>>   From the commit message, I don't quite understand why the check is
>> necessary on Arm but not on x86. Can you clarify it?
>>
> 
> Yes, in patch#27, in smpboot.c, dt_smp_init_cpus function.
> We will parse CPU numa-node-id from dtb CPU node. If we get
> a valid node ID for one CPU, we will invoke numa_set_node to
> create CPU-NODE map. But in our testing, we found when NUMA
> init failed, numa_set_node still can set CPU to a offline
> or invalid NODE. So we're using node_online_map to prevent
> this behavior. Otherwise we have to check node_online_map
> everywhere before we call numa_set_node.

What do you mean by invalid NODE? Is it 0xFF (NUMA_NO_NODE)?

> 
> x86 actually is doing the same way, but it handles node_online_map
> check out of numa_set_node:

Right...

>> I think numa_set_node() will want to be implemented in common code.
>>
> 
> See my above comment. If x86 is ok, I think yes, we can do it
> in common code.

... on x86, this check is performed outside of numa_set_node() for one 
caller whereas on Arm you are adding it in numa_set_node().

For example, numa_set_node() can be called with NUMA_NO_NODE. On x86, we 
would set cpu_to_node[] to that value. However, if I am not mistaken, on 
Arm we would set the value to 0.

This will change the behavior of users to cpu_to_node() later on (such 
as XEN_SYSCTL_cputopoinfo).

NUMA is not something architecture specific, so I dont't think the 
implementation should differ here.

In this case, I think numa_set_node() shouldn't check if the node is 
valid. Instead, the caller should take care of it if it is important.

Cheers,

-- 
Julien Grall

