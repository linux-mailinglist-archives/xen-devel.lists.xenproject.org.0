Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33701E4CE0
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 20:11:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je0V3-0006SL-Lq; Wed, 27 May 2020 18:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnSh=7J=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1je0V2-0006SG-8n
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 18:09:56 +0000
X-Inumbo-ID: 447cce08-a045-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 447cce08-a045-11ea-9dbe-bc764e2007e4;
 Wed, 27 May 2020 18:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5MFQJumJ2IAunmsj+TT2q2BnfUmhDTmq47ASVCA/ruY=; b=s231dMdP+Z5t91qdWmgEk9KQsG
 uMWwbDPsKqy4K2FVOQ8wRxccOvElSE4DaOxcoj88lDOsKjeO7x6S3Z8e3yo+QuvI01I60zRzMAJCl
 1dDy03Q+rYVPfvQiGAVBHoZnTorb3pDcjoDgRU5eQzkb03VhSmKqE+ldPEdNJxPeo6Yc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1je0Uz-0001x3-Ry; Wed, 27 May 2020 18:09:53 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1je0Uz-0005nh-Lk; Wed, 27 May 2020 18:09:53 +0000
Subject: Re: [PATCH 12/12] xen/arm: call iomem_permit_access for passthrough
 devices
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-12-sstabellini@kernel.org>
 <521c8e55-73e8-950f-2d94-70b0c664bd3d@xen.org>
 <alpine.DEB.2.21.2004291318270.28941@sstabellini-ThinkPad-T480s>
 <f7f01eca-2415-e102-318f-0c58606fda96@xen.org>
 <453b58f8-d9ee-bbe7-ac05-b5268620e79f@xen.org>
 <alpine.DEB.2.21.2005260941250.27502@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <0f79d268-b154-0674-4c33-a06a0b585142@xen.org>
Date: Wed, 27 May 2020 19:09:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005260941250.27502@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 26/05/2020 17:46, Stefano Stabellini wrote:
> On Sun, 24 May 2020, Julien Grall wrote:
>> On 30/04/2020 14:01, Julien Grall wrote:
>>> On 29/04/2020 21:47, Stefano Stabellini wrote:
>>>> On Wed, 15 Apr 2020, Julien Grall wrote: But doesn't it make sense to give
>>>> domU permission if it is going to get
>>>> the memory mapped? But admittedly I can't think of something that would
>>>> break because of the lack of the iomem_permit_access call in this code
>>>> path.
>>>
>>> On Arm, the permissions are only useful if you plan you DomU to delegate the
>>> regions to another domain. As your domain is not even aware it is running on
>>> Xen (we don't expose 'xen' node in the DT), it makes little sense to add the
>>> permission.
>>
>> I actually found one use when helping a user last week. You can dump the list
>> of MMIO regions assigned to a guest from Xen Console.
>>
>> This will use d->iomem_caps that is modified via iomem_permit_access().
>> Without it, there is no easy way to confirm the list of MMIO regions assigned
>> to a guest. Although...
>>
>>> Even today, you can map IOMEM to a DomU and then revert the permission right
>>> after. They IOMEM will still be mapped in the guest and it will act normaly.
>>
>> ... this would not help the case where permissions are reverted. But I am
>> assuming this shouldn't happen for Dom0less.
> 
> Thank you for looking into this
> 
> 
>> Stefano, I am not sure what's your plan for the series itself for Xen 4.14. I
>> think this patch could go in now. Any thoughts?
> 
> For the series: I have addresses all comments in my working tree except
> for the ones on memory allocation (the thread "xen: introduce
> reserve_heap_pages"). It looks like that part requires a complete
> rewrite, and it seems that the new code is not trivial to write. So I am
> thinking of not targeting 4.14. What do you think? Do you think the new
> code should be "easy" enough that I could target 4.14?
It may be a stretch with the code freeze on Friday. I would suggest to 
send it when it is ready and we can either include in Xen 4.14 or as 
soon as the tree re-open.

> 
> For this patch: it is fine to go in now, doesn't have to wait for the
> series.

Feel free to add my ack on the patch.

Cheers,

-- 
Julien Grall

