Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E9224AE6
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 13:14:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwknT-0008ID-D5; Sat, 18 Jul 2020 11:14:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BrZA=A5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwknS-0008I8-2u
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 11:14:26 +0000
X-Inumbo-ID: d61b685e-c8e7-11ea-9723-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d61b685e-c8e7-11ea-9723-12813bfff9fa;
 Sat, 18 Jul 2020 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lUNFPxOXlpwjXpbLc667sJKTqQx9dTl0ncXjEF1pc+A=; b=t9A7SIZLDJh+tPGP1j+mHhViDa
 bUQuoLi5XVh6pPH9XZq6v5f5vlqKbgJzs7qof5YCb1HUJ5+svect1cNH+Li2GuEWOkzQhZybBqVey
 UT+FZyT/FWWPpGyi1s6FxRwCDeU9dvShkHmxXNbgh7hgPoJjXA6l4CpLe0xlCgxINLBU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwknP-0003gb-EC; Sat, 18 Jul 2020 11:14:23 +0000
Received: from cpc91186-cmbg18-2-0-cust22.5-4.cable.virginm.net ([80.1.50.23]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwknP-0005oX-6H; Sat, 18 Jul 2020 11:14:23 +0000
Subject: Re: PCI devices passthrough on Arm design proposal
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <865D5A77-85D4-4A88-A228-DDB70BDB3691@arm.com>
 <972c0c81-6595-7c41-baa5-8882f5d1c0ff@xen.org>
 <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
 <20200717160550.GZ7191@Air-de-Roger>
 <C86FE34B-4587-4895-8001-D8CD3F9D44F0@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f6a0da85-6d44-b0fa-abe6-6839d88c3578@xen.org>
Date: Sat, 18 Jul 2020 12:14:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <C86FE34B-4587-4895-8001-D8CD3F9D44F0@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/07/2020 10:55, Bertrand Marquis wrote:
> 
> 
>> On 17 Jul 2020, at 18:05, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Fri, Jul 17, 2020 at 03:47:25PM +0000, Bertrand Marquis wrote:
>>>> On 17 Jul 2020, at 17:26, Julien Grall <julien@xen.org> wrote:
>>>> On 17/07/2020 15:47, Bertrand Marquis wrote:
>>>>>>>> * Dom0Less implementation will require to have the capacity inside Xen to discover the PCI devices (without depending on Dom0 to declare them to Xen).
>>>>>>>>
>>>>>>>> # Enable the existing x86 virtual PCI support for ARM:
>>>>>>>>
>>>>>>>> The existing VPCI support available for X86 is adapted for Arm. When the device is added to XEN via the hyper call “PHYSDEVOP_pci_device_add”, VPCI handler for the config space access is added to the PCI device to emulate the PCI devices.
>>>>>>>>
>>>>>>>> A MMIO trap handler for the PCI ECAM space is registered in XEN so that when guest is trying to access the PCI config space, XEN will trap the access and emulate read/write using the VPCI and not the real PCI hardware.
>>>>>>>>
>>>>>>>> Limitation:
>>>>>>>> * No handler is register for the MSI configuration.
>>>>>>>> * Only legacy interrupt is supported and tested as of now, MSI is not implemented and tested.
>>>>>>> IIRC, legacy interrupt may be shared between two PCI devices. How do you plan to handle this on Arm?
>>>>> We plan to fix this by adding proper support for MSI in the long term.
>>>>> For the use case where MSI is not supported or not wanted we might have to find a way to forward the hardware interrupt to several guests to emulate some kind of shared interrupt.
>>>>
>>>> Sharing interrupts are a bit pain because you couldn't take advantage of the direct EOI in HW and have to be careful if one guest doesn't EOI in timely maneer.
>>>>
>>>> This is something I would rather avoid unless there is a real use case for it.
>>>
>>> I would expect that most recent hardware will support MSI and this
>>> will not be needed.
>>
>> Well, PCI Express mandates MSI support, so while this is just a spec,
>> I would expect most (if not all) devices to support MSI (or MSI-X), as
>> Arm platforms haven't implemented legacy PCI anyway.
> 
> Yes that’s our assumption to. But we have to start somewhere so MSI is
> planned but in a future step. I would think that supporting non MSI if not
> impossible will be a lot more complex due to the interrupt sharing.
> I do think that not supporting non MSI should be ok on Arm.
> 
>>
>>> When MSI is not used, the only solution would be to enforce that
>>> devices assigned to different guest are using different interrupts
>>> which would limit the number of domains being able to use PCI
>>> devices on a bus to 4 (if the enumeration can be modified correctly
>>> to assign the interrupts properly).
>>>
>>> If we all agree that this is an acceptable limitation then we would
>>> not need the “interrupt sharing”.
>>
>> I might be easier to start by just supporting devices that have MSI
>> (or MSI-X) and then move to legacy interrupts if required?
> 
> MSI support requires also some support in the interrupt controller part
> on arm. So there is some work to achieve that.
> 
>>
>> You should have most of the pieces you require already implemented
>> since that's what x86 uses, and hence could reuse almost all of it?
> 
> Inside PCI probably but the GIC part will require some work.

We already have an ITS implementation in Xen. This is required in order 
to use PCI devices in DOM0 on thunder-x (there is no legacy interrupts 
supported).

It wasn't yet exposed to the guest because we didn't fully investigate 
the security aspect of the implementation. However, for a tech preview 
this should be sufficient.


-- 
Julien Grall


