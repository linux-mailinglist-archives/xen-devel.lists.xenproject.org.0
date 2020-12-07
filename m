Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA92D17AF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 18:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46906.83104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKUM-0001jE-Cy; Mon, 07 Dec 2020 17:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46906.83104; Mon, 07 Dec 2020 17:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKUM-0001ip-9M; Mon, 07 Dec 2020 17:39:54 +0000
Received: by outflank-mailman (input) for mailman id 46906;
 Mon, 07 Dec 2020 17:39:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmKUK-0001ik-Jh
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 17:39:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmKUG-0006hS-Q9; Mon, 07 Dec 2020 17:39:48 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmKUG-00056Z-IS; Mon, 07 Dec 2020 17:39:48 +0000
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
	bh=pfHGBUr1s9nQwpTrKDSjpf3MZkvL4xZtowvLk9HwFcw=; b=hkGUgDt9dH51LNsi6lq2qf49x7
	pXUJgxTFPOBs7u8UkJ842Jab6IV3x1uDxxaeSQMVhqhTZeIrhn/Bab1KzZRfNTOID5vwX9hEpEZzK
	T0mAUgOE7S37h9hEC6dLs4gefBuMn7swcyisb/neIBLxdd+6uGJU/0gYT3Ggixco2WJE=;
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <a67bb114-a4a9-651a-338b-123b350ac4b3@xen.org>
 <9C890E87-D438-4232-8647-8EC64FF32C42@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bb6a710e-4a7a-5db2-fece-b5845e06d092@xen.org>
Date: Mon, 7 Dec 2020 17:39:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <9C890E87-D438-4232-8647-8EC64FF32C42@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/12/2020 12:12, Rahul Singh wrote:
>>> +typedef paddr_t dma_addr_t;
>>> +typedef unsigned int gfp_t;
>>> +
>>> +#define platform_device device
>>> +
>>> +#define GFP_KERNEL 0
>>> +
>>> +/* Alias to Xen device tree helpers */
>>> +#define device_node dt_device_node
>>> +#define of_phandle_args dt_phandle_args
>>> +#define of_device_id dt_device_match
>>> +#define of_match_node dt_match_node
>>> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
>>> +#define of_property_read_bool dt_property_read_bool
>>> +#define of_parse_phandle_with_args dt_parse_phandle_with_args
>>> +
>>> +/* Alias to Xen lock functions */
>>> +#define mutex spinlock
>>> +#define mutex_init spin_lock_init
>>> +#define mutex_lock spin_lock
>>> +#define mutex_unlock spin_unlock
>>
>> Hmm... mutex are not spinlock. Can you explain why this is fine to switch to spinlock?
> 
> Yes mutex are not spinlock. As mutex is not implemented in XEN I thought of using spinlock in place of mutex as this is the only locking mechanism available in XEN.
> Let me know if there is another blocking lock available in XEN. I will check if we can use that.

There are no blocking lock available in Xen so far. However, if Linux 
were using mutex instead of spinlock, then it likely means they 
operations in the critical section can be long running.

How did you came to the conclusion that using spinlock in the SMMU 
driver would be fine?

Cheers,

-- 
Julien Grall

