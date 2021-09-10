Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F9406CD4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184382.333001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgSe-0004dj-9t; Fri, 10 Sep 2021 13:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184382.333001; Fri, 10 Sep 2021 13:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgSe-0004bZ-6U; Fri, 10 Sep 2021 13:20:56 +0000
Received: by outflank-mailman (input) for mailman id 184382;
 Fri, 10 Sep 2021 13:20:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOgSc-0004bQ-Gs
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:20:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOgSa-0007Tt-7A; Fri, 10 Sep 2021 13:20:52 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOgSZ-00049a-T4; Fri, 10 Sep 2021 13:20:52 +0000
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
	bh=/PeZxYBYI8hoEO4UWcgM3yIVrA953BkRdFDn3iqBSj8=; b=wLOGaeDQOd6IqbLaoGmisr6wUB
	Oxgnl91L2Q0m61hkE0FD5T4imnkp8tNNVfGBrf4hXcGnL7XbGdFq1w42EMpz1wjUQgRPz+0nO/jJg
	CXAc7meqTRa/lKiwfEPDTwLTAkOCSwefQ6HeFt314iyFHiBD2Y+qWUgTeS8xddS6CrAQ=;
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
 <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com>
 <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
 <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6810eefb-b6d0-9557-7bdd-80ac381e467b@xen.org>
Date: Fri, 10 Sep 2021 14:20:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/09/2021 14:15, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hi,

> On 10.09.21 16:04, Julien Grall wrote:
>>
>>
>> On 10/09/2021 12:43, Oleksandr Andrushchenko wrote:
>>> Hi, Julien!
>>
>> Hi Oleksandr,
>>
>>> On 09.09.21 20:43, Julien Grall wrote:
>>>> Hi Oleksandr,
>>>>
>>>> On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> In order vPCI to work it needs all access to PCI configuration space
>>>>> (ECAM) to be synchronized among all entities, e.g. hardware domain and
>>>>> guests.
>>>>
>>>> I am not entirely sure what you mean by "synchronized" here. Are you refer to the content of the configuration space?
>>>
>>> We maintain hwdom's and guest's view of the registers we are interested in
>>>
>>> So, to have hwdom's view we also need to trap its access to the configuration space.
>>>
>>> Probably "synchronized" is not the right wording here.
>> I would simply say that we want to expose an emulated hostbridge to the dom0 so we need to unmap the configuration space.
> Sounds good
>>
>>>
>>>>
>>>>> For that implement PCI host bridge specific callbacks to
>>>>> properly setup those ranges depending on particular host bridge
>>>>> implementation.
>>>>>
>>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>> ---
>>>>>     xen/arch/arm/pci/ecam.c            | 11 +++++++++++
>>>>>     xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
>>>>>     xen/arch/arm/vpci.c                | 13 +++++++++++++
>>>>>     xen/include/asm-arm/pci.h          |  8 ++++++++
>>>>>     4 files changed, 48 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
>>>>> index 91c691b41fdf..92ecb2e0762b 100644
>>>>> --- a/xen/arch/arm/pci/ecam.c
>>>>> +++ b/xen/arch/arm/pci/ecam.c
>>>>> @@ -42,6 +42,16 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>>>>>         return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
>>>>>     }
>>>>>     +static int pci_ecam_register_mmio_handler(struct domain *d,
>>>>> +                                          struct pci_host_bridge *bridge,
>>>>> +                                          const struct mmio_handler_ops *ops)
>>>>> +{
>>>>> +    struct pci_config_window *cfg = bridge->sysdata;
>>>>> +
>>>>> +    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);
>>>>
>>>> We have a fixed array for handling the MMIO handlers.
>>>
>>> Didn't know that:
>>>
>>> xen/include/asm-arm/mmio.h:27:#define MAX_IO_HANDLER  16
>>>
>>>> So you need to make sure we have enough space in it to store one handler per handler.
>>>>
>>>> This is quite similar to the problem we had with the re-distribuor on GICv3. Have a look there to see how we dealt with it.
>>>
>>> Could you please point me to that solution? I can only see
>>>
>>>        /* Register mmio handle for the Distributor */
>>>        register_mmio_handler(d, &vgic_distr_mmio_handler, d->arch.vgic.dbase,
>>>                              SZ_64K, NULL);
>>>
>>>        /*
>>>         * Register mmio handler per contiguous region occupied by the
>>>         * redistributors. The handler will take care to choose which
>>>         * redistributor is targeted.
>>>         */
>>>        for ( i = 0; i < d->arch.vgic.nr_regions; i++ )
>>>        {
>>>            struct vgic_rdist_region *region = &d->arch.vgic.rdist_regions[i];
>>>
>>>            register_mmio_handler(d, &vgic_rdistr_mmio_handler,
>>>                                  region->base, region->size, region);
>>>        }
>>> which IMO doesn't care about the number of MMIOs we can handle
>>
>> Please see vgic_v3_init(). We update mmio_count that is then used as a the second argument for domain_io_init().
> 
> Ah, so
> 
> 1) This needs to be done before the array for the handlers is allocated
> 
> 2) How do I know at the time of 1) how many bridges we have?

By counting the number of bridge you want to expose to dom0? I am not 
entirely sure what else you expect me to say.

Cheers,

-- 
Julien Grall

