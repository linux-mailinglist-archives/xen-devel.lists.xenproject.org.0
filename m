Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E953B985462
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 09:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803496.1214074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stMhY-0001d2-TK; Wed, 25 Sep 2024 07:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803496.1214074; Wed, 25 Sep 2024 07:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stMhY-0001a1-QI; Wed, 25 Sep 2024 07:44:44 +0000
Received: by outflank-mailman (input) for mailman id 803496;
 Wed, 25 Sep 2024 07:44:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1stMhX-0001Zv-M4
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 07:44:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stMhX-0003nH-8D; Wed, 25 Sep 2024 07:44:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stMhW-0001kt-Vv; Wed, 25 Sep 2024 07:44:43 +0000
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
	bh=4i0zJOyjnsRkinwaGLJHX3vSoJlBFUWBfWrKW0xk17U=; b=yQy3jNEYq64tTVi2STT/Uu5v+0
	KDmdz/4eaWZDUcwJMaWFtIp1mq+ttF1vwhGUf84ZsL824czhaeoc/uOwfL6zQHJiHcT6NZAcSqSps
	ihiqBROkal0FYvYYJ8RsJ9Ou0H3pYQ1spMENKwSkjFDBaq5mAtr+pL1g8UZwdup0q3pg=;
Message-ID: <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org>
Date: Wed, 25 Sep 2024 08:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
 edgar.iglesias@amd.com, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240924162359.1390487-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> When virtio-pci is specified in the dom0less domU properties, create a
> virtio-pci node in the guest's device tree. Set up an mmio handler with
> a register for the guest to poll when the backend has connected and
> virtio-pci bus is ready to be probed. Grant tables may be used by
> specifying virtio-pci = "grants";.
> 
> [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
>   Make grants iommu-map cover the entire PCI bus.
>   Add virtio-pci-ranges to specify memory-map for direct-mapped guests.
>   Document virtio-pci dom0less fdt bindings.]
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   docs/misc/arm/device-tree/booting.txt |  21 +++
>   xen/arch/arm/dom0less-build.c         | 238 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/kernel.h     |  15 ++
>   3 files changed, 274 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 3a04f5c57f..82f3bd7026 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -276,6 +276,27 @@ with the following properties:
>       passed through. This option is the default if this property is missing
>       and the user does not provide the device partial device tree for the domain.
>   
> +- virtio-pci

Similar question to the other patches, why is this specific to virtio 
PCI? QEMU (or another device module) is free to emulate whatever it 
wants behind the PCI hosbtridge.

> +
> +    A string property specifying whether virtio-pci is enabled for the
> +    domain and if grant table mappings should be used. If no value is set
> +    this property is treated as a boolean and the same way as if set to
> +    "enabled".
> +    Possible property values are:
> +
> +    - "enabled"
> +    Virtio-pci is enabled for the domain.
> +
> +    - "grants"
> +    Virtio-pci is enabled for the domain and an grants IOMMU node will be
> +    generated in the domains device-tree.
> +
> +- virtio-pci-ranges
> +
> +    An optional array of 6 u32 values specifying the 2 cells base addresses of
> +    the ECAM, Memory and Prefetchable-Memory regions for virtio-pci. This is
> +    useful to avoid memory-map collisions when using direct-mapped guests.
> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 09b65e44ae..dab24fa9e2 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -586,6 +586,189 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>       return res;
>   }
>   
> +static int __init make_virtio_pci_domU_node(const struct kernel_info *kinfo)
> +{
> +    void *fdt = kinfo->fdt;
> +    /* reg is sized to be used for all the needed properties below */
> +    __be32 reg[(1 + (GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS)
> +               * 2];
> +    __be32 irq_map[4 * 4 * 8];
> +    __be32 *cells;
> +    char buf[22]; /* pcie@ + max 16 char address + '\0' */
> +    int res;
> +    int devfn, intx_pin;
> +    static const char compat[] = "pci-host-ecam-generic";
> +    static const char reg_names[] = "ecam";
> +
> +    if ( p2m_ipa_bits <= 40 ) {
> +        printk("PA bits %d is too small!\nvirtio-pci is only supported "
> +               "on platforms with PA bits > 40\n", p2m_ipa_bits);
> +        return -EINVAL;
> +    }

Please add a comment explaining where does this requires come from. If 
this is the Address layout, then probably be to avoid relying on 
hardcoded number of bits.

Cheers,

-- 
Julien Grall

