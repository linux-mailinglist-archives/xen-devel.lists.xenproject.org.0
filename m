Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7041AA7F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197776.351008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8J0-0007Z2-21; Tue, 28 Sep 2021 08:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197776.351008; Tue, 28 Sep 2021 08:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8Iz-0007W7-Uj; Tue, 28 Sep 2021 08:17:37 +0000
Received: by outflank-mailman (input) for mailman id 197776;
 Tue, 28 Sep 2021 08:17:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6b1=OS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mV8Iy-0007W1-NU
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:17:36 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e8a0ead6-db31-427a-b54d-d5088b8c4365;
 Tue, 28 Sep 2021 08:17:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC6796D;
 Tue, 28 Sep 2021 01:17:34 -0700 (PDT)
Received: from [10.57.20.114] (unknown [10.57.20.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56FEE3F7B4;
 Tue, 28 Sep 2021 01:17:30 -0700 (PDT)
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
X-Inumbo-ID: e8a0ead6-db31-427a-b54d-d5088b8c4365
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
Date: Tue, 28 Sep 2021 10:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 28.09.2021 09:59, Jan Beulich wrote:
> On 28.09.2021 09:48, Michal Orzel wrote:
>> On 23.09.2021 14:55, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -833,6 +833,63 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>>      return ret;
>>>  }
>>>  
>>> +static struct vpci_dev *pci_find_virtual_device(const struct domain *d,
>>> +                                                const struct pci_dev *pdev)
>>> +{
>>> +    struct vpci_dev *vdev;
>>> +
>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>> +        if ( vdev->pdev == pdev )
>>> +            return vdev;
>>> +    return NULL;
>>> +}
>>> +
>>> +int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev)
>>> +{
>>> +    struct vpci_dev *vdev;
>>> +
>>> +    ASSERT(!pci_find_virtual_device(d, pdev));
>>> +
>>> +    /* Each PCI bus supports 32 devices/slots at max. */
>>> +    if ( d->vpci_dev_next > 31 )
>>> +        return -ENOSPC;
>>> +
>>> +    vdev = xzalloc(struct vpci_dev);
>>> +    if ( !vdev )
>>> +        return -ENOMEM;
>>> +
>>> +    /* We emulate a single host bridge for the guest, so segment is always 0. */
>>> +    *(u16*) &vdev->seg = 0;
>> Empty line hear would improve readability due to the asterisks being so close to each other.
>> Apart from that:
>> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
>>> +    /*
>>> +     * The bus number is set to 0, so virtual devices are seen
>>> +     * as embedded endpoints behind the root complex.
>>> +     */
>>> +    *((u8*) &vdev->bus) = 0;
>>> +    *((u8*) &vdev->devfn) = PCI_DEVFN(d->vpci_dev_next++, 0);
> 
> All of these casts are (a) malformed and (b) unnecessary in the first
> place, afaics at least.
> 
Agree.
*((u8*) &vdev->bus) = 0;
is the same as:
vdev->bus = 0;
> Jan
> 

