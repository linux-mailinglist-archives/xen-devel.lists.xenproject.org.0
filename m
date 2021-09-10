Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB8406B0C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 13:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184314.332915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOf6C-0006jX-FP; Fri, 10 Sep 2021 11:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184314.332915; Fri, 10 Sep 2021 11:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOf6C-0006hN-CM; Fri, 10 Sep 2021 11:53:40 +0000
Received: by outflank-mailman (input) for mailman id 184314;
 Fri, 10 Sep 2021 11:53:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOf6A-0006hH-O6
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 11:53:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOf69-0005sP-NM; Fri, 10 Sep 2021 11:53:37 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOf69-0003jA-H0; Fri, 10 Sep 2021 11:53:37 +0000
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
	bh=E432K6PZQY8zmduY1UeenjxjP++XpHejF65LrVD4sdA=; b=n6trwaFYHdu7HF3uX76GrPatXS
	NdMw6MuM9QzAZPoeyEKvFUK/8NkKyins23FfGeHE0EzHG6uwjv4h2an9wdS904oYpho2620r9Qsec
	QaRDc/tWS89xq0YtF6MDibDslBkDKcejrSSoSxKNpLxhlh59HIp5IIAY+/jRsLrQRDhI=;
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN on
 ARM
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
 <1f4a0284-302e-47e9-6958-47dca449d580@xen.org>
 <332992DF-56A9-42CF-B266-B46E4622A03E@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <39a8e71a-f73b-e704-622d-d38cdad70066@xen.org>
Date: Fri, 10 Sep 2021 12:53:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <332992DF-56A9-42CF-B266-B46E4622A03E@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/09/2021 12:22, Rahul Singh wrote:
> Hi Julien

Hi Rahul,
>> On 7 Sep 2021, at 10:05 am, Julien Grall <julien@xen.org> wrote:
>> On 19/08/2021 13:02, Rahul Singh wrote:
>>> +#include <xen/rwlock.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/vmap.h>
>>> +
>>> +/*
>>> + * List for all the pci host bridges.
>>> + */
>>> +
>>> +static LIST_HEAD(pci_host_bridges);
>>> +
>>> +static atomic_t domain_nr = ATOMIC_INIT(-1);
>>> +
>>> +bool dt_pci_parse_bus_range(struct dt_device_node *dev,
>>> +                            struct pci_config_window *cfg)
>>
>> Aside, "pci_config_window", the function is not Arm specific. Would it be possible to consider to introduce "struct resource" in Xen so this function can be moved in common/device_tree.c?
> 
> I can introduce the "struct resource” but I am not sure whether "struct resource” will be
> useful later point in time. What I prefer as of now, we can have this function and we can
> move this to common/device_tree.c once we have the requirement for "struct resource”.

TBH, I wasn't asking about using "struct resource". This was simply a 
suggestion how to make the code common.

What I am more interested is moving this function in common code so it 
can be re-used by RISC-v in the future. I don't particularly mind 
whether this is using "struct resource" or a different structure.

>>> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
>>> new file mode 100644
>>> index 0000000000..13d0f7f999
>>> --- /dev/null
>>> +++ b/xen/arch/arm/pci/pci-host-generic.c
>>> @@ -0,0 +1,55 @@
>>> +/*
>>> + * Copyright (C) 2021 Arm Ltd.
>>> + *
>>> + * Based on Linux drivers/pci/controller/pci-host-common.c
>>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
>>> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include <asm/device.h>
>>> +#include <xen/pci.h>
>>> +#include <asm/pci.h>
>>> +
>>> +static const struct dt_device_match gen_pci_dt_match[] = {
>>> +    { .compatible = "pci-host-ecam-generic" },
>>> +    { },
>>> +};
>>> +
>>> +static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
>>> +{
>>> +    const struct dt_device_match *of_id;
>>> +
>>> +    of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);
>>
>> This seems to be a bit pointless to me as you already know the compatible (there is only one possible...).
>   As of now we are only implementing the "pci-host-ecam-generic” compatible PCI, but in future we might
> need to implement the other compatible like Linux see as below.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/pci-host-generic.c#L59

Right... You know the node matched and you don't need any data. So this 
is a bit pointless to have to walk again the structure for just printing 
the compatible that matched.

Cheers,

-- 
Julien Grall

