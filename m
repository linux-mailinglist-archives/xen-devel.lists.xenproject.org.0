Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191FE2FD5D0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 17:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71620.128393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GX1-0006aL-AR; Wed, 20 Jan 2021 16:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71620.128393; Wed, 20 Jan 2021 16:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GX1-0006Zw-6g; Wed, 20 Jan 2021 16:40:31 +0000
Received: by outflank-mailman (input) for mailman id 71620;
 Wed, 20 Jan 2021 16:40:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2GWz-0006Zf-OT
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:40:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2GWv-00055j-RV; Wed, 20 Jan 2021 16:40:25 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2GWv-000074-Jp; Wed, 20 Jan 2021 16:40:25 +0000
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
	bh=P45D/gg5j6wl40ccI7r5ei8+tcEomqmj48xBGbZJUOM=; b=UVj1q25JBkyj61ZmvYXhlXa8o4
	m+o+kDgXzVsFgbQf8HJDZdcW4Kd8MGUhxLUg1whbH94tcGJY/irGwnQewf2Isin+6PLGxP+rmjTG3
	tznJOs6yIfJcgclxxtcpyIsZOewa13hNWSdVb6R5PpFjGYtyn/6X+uia3OYHjovfCRaI=;
Subject: Re: [PATCH V4 23/24] libxl: Introduce basic virtio-mmio support on
 Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-24-git-send-email-olekstysh@gmail.com>
 <25b62097-9ea9-31f3-0f8f-92a7f0d01d7c@xen.org>
 <51d44085-f178-3985-9324-da6494cd9d2e@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <58c9da23-ef6a-1d33-b2ec-30e3425da2f3@xen.org>
Date: Wed, 20 Jan 2021 16:40:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <51d44085-f178-3985-9324-da6494cd9d2e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 17/01/2021 22:22, Oleksandr wrote:
> On 15.01.21 23:30, Julien Grall wrote:
>> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>>> From: Julien Grall <julien.grall@arm.com>
>> So I am not quite too sure how this new parameter can be used. Could 
>> you expand it?
> The original idea was to set it if we are going to assign virtio 
> device(s) to the guest.
> Being honest, I have a plan to remove this extra parameter. It might not 
> be obvious looking at the current patch, but next patch will show that 
> we can avoid introducing it at all.

Right, so I think we want to avoid introducing the parameter. I have 
suggested in patch #24 a different way to split code introduced by #23 
and #24.

[...]

>>
>>> +#define GUEST_VIRTIO_MMIO_SIZE xen_mk_ullong(0x200)
>>
>> AFAICT, the size of the virtio mmio region should be 0x100. So why is 
>> it 0x200?
> 
> 
> I didn't find the total size requirement for the mmio region in virtio 
> specification v1.1 (the size of control registers is indeed 0x100 and 
> device-specific configuration registers starts at the offset 0x100, 
> however it's size depends on the device and the driver).
> 
> kvmtool uses 0x200 [1], in some Linux device-trees we can see 0x200 [2] 
> (however, device-tree bindings example has 0x100 [3]), so what would be 
> the proper value for Xen code?

Hmm... I missed that fact. I would say we want to use the biggest size 
possible so we can cover most of the devices.

Although, as you pointed out, this may not cover all the devices. So 
maybe we want to allow the user to configure the size via xl.cfg for the 
one not conforming with 0x200.

This could be implemented in the future. Stefano/Ian, what do you think?

>> Most likely, you will want to reserve a range
> 
> it seems yes, good point. BTW, the range is needed for the mmio region 
> as well, correct?

I would reserve 1MB (just for the sake of avoid region size in KB).

For the SPIs, I would consider to reserve 10-20 interrupts. Do you think 
this will cover your use cases?

Cheers,

-- 
Julien Grall

