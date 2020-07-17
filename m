Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB635223D81
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:59:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQtb-0003wU-05; Fri, 17 Jul 2020 13:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwQtZ-0003wL-Jk
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:59:25 +0000
X-Inumbo-ID: b89649c8-c835-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b89649c8-c835-11ea-bca7-bc764e2007e4;
 Fri, 17 Jul 2020 13:59:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A369AC20;
 Fri, 17 Jul 2020 13:59:28 +0000 (UTC)
Subject: Re: PCI devices passthrough on Arm design proposal
To: Julien Grall <julien@xen.org>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cae3706-7171-3f29-7b68-b5e6f26bc2b7@suse.com>
Date: Fri, 17 Jul 2020 15:59:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.07.2020 15:50, Julien Grall wrote:
> (Resending to the correct ML)
> On 17/07/2020 14:23, Julien Grall wrote:
>> On 16/07/2020 18:02, Rahul Singh wrote:
>>> # Discovering PCI devices:
>>>
>>> PCI-PCIe enumeration is a process of detecting devices connected to 
>>> its host. It is the responsibility of the hardware domain or boot 
>>> firmware to do the PCI enumeration and configure the BAR, PCI 
>>> capabilities, and MSI/MSI-X configuration.
>>>
>>> PCI-PCIe enumeration in XEN is not feasible for the configuration part 
>>> as it would require a lot of code inside Xen which would require a lot 
>>> of maintenance. Added to this many platforms require some quirks in 
>>> that part of the PCI code which would greatly improve Xen complexity. 
>>> Once hardware domain enumerates the device then it will communicate to 
>>> XEN via the below hypercall.
>>>
>>> #define PHYSDEVOP_pci_device_add        25
>>> struct physdev_pci_device_add {
>>>      uint16_t seg;
>>>      uint8_t bus;
>>>      uint8_t devfn;
>>>      uint32_t flags;
>>>      struct {
>>>          uint8_t bus;
>>>          uint8_t devfn;
>>>      } physfn;
>>>      /*
>>>      * Optional parameters array.
>>>      * First element ([0]) is PXM domain associated with the device 
>>> (if * XEN_PCI_DEV_PXM is set)
>>>      */
>>>      uint32_t optarr[XEN_FLEX_ARRAY_DIM];
>>>      };
>>>
>>> As the hypercall argument has the PCI segment number, XEN will access 
>>> the PCI config space based on this segment number and find the 
>>> host-bridge corresponding to this segment number. At this stage host 
>>> bridge is fully initialized so there will be no issue to access the 
>>> config space.
>>>
>>> XEN will add the PCI devices in the linked list maintain in XEN using 
>>> the function pci_add_device(). XEN will be aware of all the PCI 
>>> devices on the system and all the device will be added to the hardware 
>>> domain.
>> I understand this what x86 does. However, may I ask why we would want it 
>> for Arm?

Isn't it the normal thing to follow what there is, and instead provide
reasons why a different approach is to be followed? Personally I'd much
prefer if we didn't have two fundamentally different PCI implementations
in the tree. Perhaps some of what Arm wants or needs can actually
benefit x86 as well, but this requires sufficiently much code sharing
then.

Jan

