Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B446D991
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 18:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242545.419471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0cR-0003aU-Ag; Wed, 08 Dec 2021 17:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242545.419471; Wed, 08 Dec 2021 17:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0cR-0003Yh-7V; Wed, 08 Dec 2021 17:20:39 +0000
Received: by outflank-mailman (input) for mailman id 242545;
 Wed, 08 Dec 2021 17:20:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mv0cP-0003Yb-LQ
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 17:20:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv0cO-0002Ie-NW; Wed, 08 Dec 2021 17:20:36 +0000
Received: from [54.239.6.189] (helo=[192.168.13.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv0cO-0008PZ-Gf; Wed, 08 Dec 2021 17:20:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=iTfqszxfVCktiQeinUB2CymkWpPoVKlfRn45wj5JphU=; b=cZ6N2oq/5R+vzC71VrGW3WzLZR
	S5jWfsnDI8W11G91nR2iw1TEcZdxaRHT+4vIUVOWQfriKgaIOAicxF2cJgc0hpc56BLjNsnRqJlfz
	klugye5VDaXNqZR9BGV839rW7vXGCHxsdPbGhyvFrnpguBi2/W/PFwpdPPA4BknK2mGo=;
Message-ID: <dc367640-b445-9c47-6d66-9c6a8cdbc85f@xen.org>
Date: Wed, 8 Dec 2021 17:20:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v7 5/7] xen/arm: do not map PCI ECAM and MMIO space to
 Domain-0's p2m
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-6-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211124075942.2645445-6-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 24/11/2021 07:59, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> PCI host bridges are special devices in terms of implementing PCI
> passthrough. According to [1] the current implementation depends on
> Domain-0 to perform the initialization of the relevant PCI host
> bridge hardware and perform PCI device enumeration. In order to
> achieve that one of the required changes is to not map all the memory
> ranges in map_range_to_domain as we traverse the device tree on startup
> and perform some additional checks if the range needs to be mapped to
> Domain-0.
> 
> The generic PCI host controller device tree binding says [2]:
> - ranges: As described in IEEE Std 1275-1994, but must provide
>            at least a definition of non-prefetchable memory. One
>            or both of prefetchable Memory and IO Space may also
>            be provided.
> 
> - reg   : The Configuration Space base address and size, as accessed
>            from the parent bus.  The base address corresponds to
>            the first bus in the "bus-range" property.  If no
>            "bus-range" is specified, this will be bus 0 (the default).
> 
>  From the above none of the memory ranges from the "ranges" property
> needs to be mapped to Domain-0 at startup as MMIO mapping is going to
> be handled dynamically by vPCI as we assign PCI devices, e.g. each
> device assigned to Domain-0/guest will have its MMIOs mapped/unmapped
> as needed by Xen.
> 
> The "reg" property covers not only ECAM space, but may also have other
> then the configuration memory ranges described, for example [3]:
> - reg: Should contain rc_dbi, config registers location and length.
> - reg-names: Must include the following entries:
>     "rc_dbi": controller configuration registers;
>     "config": PCIe configuration space registers.
> 
> This patch makes it possible to not map all the ranges from the
> "ranges" property and also ECAM from the "reg". All the rest from the
> "reg" property still needs to be mapped to Domain-0, so the PCI
> host bridge remains functional in Domain-0. This is done by first
> skipping the mappings while traversing the device tree as it is done for
> usual devices and then by calling a dedicated pci_host_bridge_mappings
> function which only maps MMIOs required by the host bridges leaving the
> regions, needed for vPCI traps, unmapped.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00777.html
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

I haven't committed because it is not clear whether this patch depends 
on earlier patches that are still under review. Can you advise?

Cheers,

-- 
Julien Grall

