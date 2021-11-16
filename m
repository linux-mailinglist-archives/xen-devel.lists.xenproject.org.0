Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6245399B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 19:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226534.391481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn3Vq-0005nB-Di; Tue, 16 Nov 2021 18:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226534.391481; Tue, 16 Nov 2021 18:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn3Vq-0005ks-Ah; Tue, 16 Nov 2021 18:48:58 +0000
Received: by outflank-mailman (input) for mailman id 226534;
 Tue, 16 Nov 2021 18:48:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mn3Vo-0005km-R4
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 18:48:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn3Vn-00028f-JC; Tue, 16 Nov 2021 18:48:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.43.125])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn3Vn-0005Mk-CZ; Tue, 16 Nov 2021 18:48:55 +0000
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
	bh=szMWftmAkKOjMywPbfo27OHXruT/fRXvjWfAt8mdJfc=; b=SG1aLhgbW5G2R835kkMsBvFWtD
	i1Wa93cgWzk+GzoD2cjSfxoPKIxYY3tHGIjSDYYWDeQaoOSfoXT1RO4ocD6kPF97DTuw3rJClUkPa
	VOoS7Nr0i9TxN9VicOGhva/+dZJP7ApnzPJdTbKQck4gZ4IPJictBB+10Zt51aetu9wQ=;
Message-ID: <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
Date: Tue, 16 Nov 2021 18:48:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211105063326.939843-3-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksander,

On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> If a PCI host bridge device is present in the device tree, but is
> disabled, then its PCI host bridge driver was not instantiated.
> This results in the failure of the pci_get_host_bridge_segment()
> and the following panic during Xen start:
> 
> (XEN) Device tree generation failed (-22).
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not set up DOM0 guest OS
> (XEN) ****************************************
> 
> Fix this by adding "linux,pci-domain" property for all device tree nodes
> which have "pci" device type, so we know which segments will be used by
> the guest for which bridges.
> 
> Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> New in v6
> ---
>   xen/arch/arm/domain_build.c        | 15 ++++++++++++++-
>   xen/arch/arm/pci/pci-host-common.c |  2 +-
>   xen/include/asm-arm/pci.h          |  8 ++++++++
>   3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 491f5e2c316e..f7fcb1400c19 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -753,9 +753,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>           {
>               uint16_t segment;
>   
> +            /*
> +             * The node doesn't have "linux,pci-domain" property and it is
> +             * possible that:
> +             *  - Xen only has drivers for a part of the host bridges
> +             *  - some host bridges are disabled
> +             * Make sure we insert the correct "linux,pci-domain" property
> +             * in any case, so we know which segments will be used
> +             * by Linux for which bridges.

The check above will check the node type is "pci". AFAICT, this would 
also cover PCI devices. I am not aware of any issue to add 
"linux,pci-domain" for them. However, this feels a bit odd.

 From my understanding, a PCI device would always be described as a 
child of the hostbridges. So I would rework the 'if' to also check if 
the parent type is not "pci".

> +             */
>               res = pci_get_host_bridge_segment(node, &segment);
>               if ( res < 0 )
> -                return res;
> +            {
> +                segment = pci_get_new_domain_nr();
> +                printk(XENLOG_DEBUG "Assigned segment %d to %s\n",
> +                       segment, node->full_name);
> +            }
>   
>               res = fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
>               if ( res )
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index d8cbaaaba654..47104b22b221 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -137,7 +137,7 @@ void pci_add_host_bridge(struct pci_host_bridge *bridge)
>       list_add_tail(&bridge->node, &pci_host_bridges);
>   }
>   
> -static int pci_get_new_domain_nr(void)
> +int pci_get_new_domain_nr(void)
>   {
>       return atomic_inc_return(&domain_nr);

We may have a DT where only the nodes used by Xen have 
"linux,pci-domain". In this case, we would end up to return 0, 1... 
which may have already been used.

This will probably make Linux unhappy. So I would return -1 here if 
use_dt_domains == 1. The caller would also need to bail out if -1 is 
returned.

Cheers,

-- 
Julien Grall

