Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D1228A6D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 23:14:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxzZ9-0007XZ-Ej; Tue, 21 Jul 2020 21:12:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oq7=BA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxzZ8-0007XU-9p
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 21:12:46 +0000
X-Inumbo-ID: eb13d9ba-cb96-11ea-a151-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb13d9ba-cb96-11ea-a151-12813bfff9fa;
 Tue, 21 Jul 2020 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WWbAlpS5UkAiKMlHO0S+8mbb3NFJuOWLX01zCrTB4w4=; b=reG3RG2X4kORvKyzghVA5tpvdB
 D264W/HedP+BLwu/99j+VkJFj5yoTI1p97TLVRYcRPpFN/3Uh6scD8QZGJ7xcDQeed8EuUaIE4Lzf
 OVsUShIQ1kafYhaJ3B3geqXPmcN3rDkWwdAbuxL7ys4geueqvQ8F6khSNqCIDhqNv64k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxzZ4-0000ZO-Bg; Tue, 21 Jul 2020 21:12:42 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxzZ4-0001Md-2K; Tue, 21 Jul 2020 21:12:42 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Oleksandr <olekstysh@gmail.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <3dcab37d-0d60-f1cc-1d59-b5497f0fa95f@xen.org>
 <b6cf0931-c31e-b03b-3995-688536de391a@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <05acce61-5b29-76f7-5664-3438361caf82@xen.org>
Date: Tue, 21 Jul 2020 22:12:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6cf0931-c31e-b03b-3995-688536de391a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Oleksandr,

On 21/07/2020 19:16, Oleksandr wrote:
> 
> On 21.07.20 17:27, Julien Grall wrote:
>> On a similar topic, I am a bit surprised you didn't encounter memory 
>> exhaustion when trying to use virtio. Because on how Linux currently 
>> works (see XSA-300), the backend domain as to have a least as much RAM 
>> as the domain it serves. For instance, you have serve two domains with 
>> 1GB of RAM each, then your backend would need at least 2GB + some for 
>> its own purpose.
>>
>> This probably wants to be resolved by allowing foreign mapping to be 
>> "paging" out as you would for memory assigned to a userspace. 
> 
> Didn't notice the last sentence initially. Could you please explain your 
> idea in detail if possible. Does it mean if implemented it would be 
> feasible to map all guest memory regardless of how much memory the guest 
> has? 
 >
> Avoiding map/unmap memory each guest request would allow us to have 
> better performance (of course with taking care of the fact that guest 
> memory layout could be changed)...

I will explain that below. Before let me comment on KVM first.

> Actually what I understand looking at 
> kvmtool is the fact it does not map/unmap memory dynamically, just 
> calculate virt addresses according to the gfn provided.

The memory management between KVM and Xen is quite different. In the 
case of KVM, the guest RAM is effectively memory from the userspace 
(allocated via mmap) and then shared with the guest.

 From the userspace PoV, the guest memory will always be accessible from 
the same virtual region. However, behind the scene, the pages may not 
always reside in memory. They are basically managed the same way as 
"normal" userspace memory.

In the case of Xen, we are basically stealing a guest physical page 
allocated via kmalloc() and provide no facilities for Linux to reclaim 
the page if it needs to do it before the userspace decide to unmap the 
foreign mapping.

I think it would be good to handle the foreing mapping the same way as 
userspace memory. By that I mean, that Linux could reclaim the physical 
page used by the foreing mapping if it needs to.

The process for reclaiming the page would look like:
     1) Unmap the foreign page
     2) Ballon in the backend domain physical address used by the 
foreing mapping (allocate the page in the physmap)

The next time the userspace is trying to access the foreign page, Linux 
will receive a data abort that would result to:
     1) Allocate a backend domain physical page
     2) Balloon out the physical address (remove the page from the physmap)
     3) Map the foreing mapping at the new guest physical address
     4) Map the guest physical page in the userspace address space

With this approach, we should be able to have backend domain that can 
handle frontend domain without require a lot of memory.

Note that I haven't looked at the Linux code yet, so I don't know the 
complexity to implement it or all the pitfalls.

One pitfall I could think right now is the frontend guest may have 
removed the page from its physmap. Therefore the backend domain wouldn't 
be able to re-map the page. We definitely don't want to crash the 
backend app in this case. However, I am not entirely sure what would be 
the correct action.

Long term, we may want to consider to use separate region in the backend 
domain physical address. This may remove the pressure in the backend 
domain RAM and reducing the number of page that may be "swapped out".

Cheers,

-- 
Julien Grall

