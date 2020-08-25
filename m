Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96202510B5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 06:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAQWb-0003Fq-R1; Tue, 25 Aug 2020 04:25:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAQWa-0003Fl-1K
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 04:25:32 +0000
X-Inumbo-ID: 30f3b890-a677-4f26-ad08-11e15625ae08
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30f3b890-a677-4f26-ad08-11e15625ae08;
 Tue, 25 Aug 2020 04:25:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1873FAC37;
 Tue, 25 Aug 2020 04:26:01 +0000 (UTC)
Subject: Re: [Linux] [ARM] Granting memory obtained from the DMA API
To: Stefano Stabellini <sstabellini@kernel.org>, Simon Leiner <simon@leiner.me>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
 <alpine.DEB.2.21.2008201120260.6005@sstabellini-ThinkPad-T480s>
 <025BF4BE-5932-4589-8083-874AE9B1F112@leiner.me>
 <alpine.DEB.2.21.2008241257150.24407@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0cf505c7-abe0-f42f-81f5-6a49dccdd538@suse.com>
Date: Tue, 25 Aug 2020 06:25:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008241257150.24407@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.20 22:02, Stefano Stabellini wrote:
> On Fri, 21 Aug 2020, Simon Leiner wrote:
>> On 20.08.20 20:35, Stefano Stabellini wrote:
>>> Thank for the well-written analysis of the problem. The following
>> should
>>> work to translate the virtual address properly in xenbus_grant_ring:
>>>
>>> 	if (is_vmalloc_addr(vaddr))
>>> 		page = vmalloc_to_page(vaddr);
>>> 	else
>>> 		page = virt_to_page(vaddr);
>>
>> Great idea, thanks! I modified it lightly (see below) and it did indeed
>> work! I'm wondering though whether the check for vmalloc'd addresses
>> should be included directly in the ARM implementation of virt_to_gfn.
>> As far as I see, this should not break anything, but might impose a
>> small performance overhead in cases where it is known for sure that we
>> are dealing with directly mapped memory. What do you think?
> 
> Thanks for testing!
> 
> We could ask the relevant maintainers for feedback, but I think it is
> probably intended that virt_to_gfn doesn't work on vmalloc addresses.
> That's because vmalloc addresses are not typically supposed to be used
> like that.
> 
> 
> 
>> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
>> index e17ca8156171..d7a97f946f2f 100644
>> --- a/drivers/xen/xenbus/xenbus_client.c
>> +++ b/drivers/xen/xenbus/xenbus_client.c
>> @@ -344,6 +344,21 @@ static void xenbus_switch_fatal(struct xenbus_device *dev, int depth, int err,
>>          __xenbus_switch_state(dev, XenbusStateClosing, 1);
>>   }
>>   
>> +/**
>> + * vaddr_to_gfn
>> + * @vaddr: any virtual address
>> + *
>> + * Returns the guest frame number (GFN) corresponding to vaddr.
>> + */
>> +static inline unsigned long vaddr_to_gfn(void *vaddr)
>> +{
>> +   if (is_vmalloc_addr(vaddr)) {
>> +       return pfn_to_gfn(vmalloc_to_pfn(vaddr));
>> +   } else {
>> +       return virt_to_gfn(vaddr);
>> +   }
>> +}
>> +
> 
> For the same reason as above, I would rather have the check inside
> xenbus_grant_ring, rather than above in a generic function:
> 
> - if this is a special case the check should be inside xenbus_grant_ring
> - if this is not a special case, then the fix should be in virt_to_gfn
>    as you mentioned
> 
> either way, I wouldn't introduce this function here
> 
> Juergen, do you agree with this?

Basically, yes. Lets do it in xenbus_grant_ring() plus adding a

WARN_ON_ONCE(is_vmalloc_addr(vaddr), ...)

in virt_to_gfn() for being able to catch other special cases.


Juergen


