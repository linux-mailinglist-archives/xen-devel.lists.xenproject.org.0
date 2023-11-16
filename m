Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5417EE4EE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 17:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634494.989986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3etL-0000DB-Ul; Thu, 16 Nov 2023 16:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634494.989986; Thu, 16 Nov 2023 16:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3etL-0000BT-Rb; Thu, 16 Nov 2023 16:06:55 +0000
Received: by outflank-mailman (input) for mailman id 634494;
 Thu, 16 Nov 2023 16:06:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3etK-0000BL-BV
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 16:06:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3etK-0001Ap-12; Thu, 16 Nov 2023 16:06:54 +0000
Received: from [15.248.3.7] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3etJ-0007CK-QE; Thu, 16 Nov 2023 16:06:53 +0000
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
	bh=I8F5bpET6P5qhCrDl1XuqlUr3OKVKTVGIJmoUJIjkIU=; b=1SKF1GjXbPgnTxjSx5bMeVvSw2
	tiTJ+X4Bfsr5hQcjOKFcs+Wk/5l7SHWvtaKqJiItRqBAMtoiS4/Ny5eQ7FTrbu56sMbbLZpKtDAGa
	OeHaxkL0DFiAiuJ1jsg3Q95lgAvg6yMFNfh10oobIrBrkSf/5vGIdqVsGrFSSkq/DVps=;
Message-ID: <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
Date: Thu, 16 Nov 2023 16:06:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

This patch was mentioned in another context about allocating the BDF. So 
I thought I would comment here as well.

On 12/10/2023 23:09, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Your signed-off-by should be added even if you are only sending the 
patch on behalf of Oleksandr. This is part of the DCO [1]

> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 5e34d0092a..7c46a2d3f4 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -36,6 +36,52 @@ extern vpci_register_init_t *const __start_vpci_array[];
>   extern vpci_register_init_t *const __end_vpci_array[];
>   #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>   
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    unsigned long new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn && !pdev->info.is_virtfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);

IIUC, this means that Xen will allocate the BDF. I think this will 
become a problem quite quickly as some of the PCI may need to be 
assigned at a specific vBDF (I have the intel graphic card in mind).

Also, xl allows you to specificy the slot (e.g. <bdf>@<vslot>) which 
would not work with this approach.

For dom0less passthrough, I feel the virtual BDF should always be 
specified in device-tree. When a domain is created after boot, then I 
think you want to support <bdf>@<vslot> where <vslot> is optional.

[1] https://cert-manager.io/docs/contributing/sign-off/

-- 
Julien Grall

