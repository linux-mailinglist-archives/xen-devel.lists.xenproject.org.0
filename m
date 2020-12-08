Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D72D2725
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 10:07:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47233.83627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmYxj-0004Is-I6; Tue, 08 Dec 2020 09:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47233.83627; Tue, 08 Dec 2020 09:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmYxj-0004IT-F0; Tue, 08 Dec 2020 09:07:11 +0000
Received: by outflank-mailman (input) for mailman id 47233;
 Tue, 08 Dec 2020 09:07:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmYxi-0004IO-2X
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 09:07:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmYxh-0002Aa-1R; Tue, 08 Dec 2020 09:07:09 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmYxg-000282-OW; Tue, 08 Dec 2020 09:07:08 +0000
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
	bh=O6ppWs7CkQhDVKrgp7pUo1DZnK/ZfTFLu7ap3jFjf0o=; b=quV4mXrgMckJW45pEINS6pTzhg
	uCFjjHmpHCmtaRf2BlncSRiUHa2wHZH6yXVvGlfZUAiB5x6U39RDFrrEygdgkRF1ufBj75gYXl/uQ
	eJbHB0mxQSUOeYmeROyVq0SHNdFjCRlCoZLNB9UippG6tuWkD1YPQyUO49wiQqedV8Js=;
Subject: Re: [RFC] design: design doc for 1:1 direct-map
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Kaly.Xin@arm.com, Wei.Chen@arm.com, nd@arm.com,
 Paul Durrant <paul@xen.org>, famzheng@amazon.com
References: <20201208052113.1641514-1-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6731d0c1-37df-ade8-7b77-d1032c326111@xen.org>
Date: Tue, 8 Dec 2020 09:07:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208052113.1641514-1-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

I am adding Paul and Zheng in the thread as there are similar interest 
for the x86 side.

On 08/12/2020 05:21, Penny Zheng wrote:
> This is one draft design about the infrastructure for now, not ready
> for upstream yet (hence the RFC tag), thought it'd be useful to firstly
> start a discussion with the community.
> 
> Create one design doc for 1:1 direct-map.
> It aims to describe why and how we allocate 1:1 direct-map(guest physical
> == physical) domains.
> 
> This document is partly based on Stefano Stabellini's patch serie v1:
> [direct-map DomUs](
> https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00707.html).

May I ask why a different approach?

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> For the part regarding allocating 1:1 direct-map domains with user-defined
> memory regions, it will be included in next design of static memory
> allocation.

I don't think you can do without user-defined memory regions (see more 
below).

> ---
>   docs/designs/1_1_direct-map.md | 87 ++++++++++++++++++++++++++++++++++
>   1 file changed, 87 insertions(+)
>   create mode 100644 docs/designs/1_1_direct-map.md
> 
> diff --git a/docs/designs/1_1_direct-map.md b/docs/designs/1_1_direct-map.md
> new file mode 100644
> index 0000000000..ce3e2c77fd
> --- /dev/null
> +++ b/docs/designs/1_1_direct-map.md
> @@ -0,0 +1,87 @@
> +# Preface
> +
> +The document is an early draft for direct-map memory map
> +(`guest physical == physical`) of domUs. And right now, it constrains to ARM

s/constrains/limited/

Aside the interface to the user, you should be able to re-use the same 
code on x86. Note that because the memory layout on x86 is fixed (always 
starting at 0), you would only be able to have only one direct-mapped 
domain.

> +architecture.
> +
> +It aims to describe why and how the guest would be created as direct-map domain.
> +
> +This document is partly based on Stefano Stabellini's patch serie v1:
> +[direct-map DomUs](
> +https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00707.html).
> +
> +This is a first draft and some questions are still unanswered. When this is the
> +case, the text shall contain XXX.
> +
> +# Introduction
> +
> +## Background
> +
> +Cases where domU needs direct-map memory map:
> +
> +  * IOMMU not present in the system.
> +  * IOMMU disabled, since it doesn't cover a specific device.

If the device is not covered by the IOMMU, then why would you want to 
disable the IOMMUs for the rest of the system?

> +  * IOMMU disabled, since it doesn't have enough bandwidth.

I am not sure to understand this one.

> +  * IOMMU disabled, since it adds too much latency.

The list above sounds like direct-map memory would be necessary even 
without device-passthrough. Can you clarify it?

> +
> +*WARNING:
> +Users should be careful that it is not always secure to assign a device without

s/careful/aware/ I think. Also, it is never secure to assign a device 
without IOMMU/SMMU unless you have a replacement.

I would suggest to reword it something like:

"When the device is not protected by the IOMMU, the administrator should 
make sure that:
    - The device is assigned to a trusted guest
    - You have an additional security mechanism on the platform (e.g 
MPU) to protect the memory."

> +IOMMU/SMMU protection.
> +Users must be aware of this risk, that guests having access to hardware with
> +DMA capacity must be trusted, or it could use the DMA engine to access any
> +other memory area.
> +Guests could use additional security hardware component like NOC, System MPU
> +to protect the memory.

What's the NOC?

> +
> +## Design
> +
> +The implementation may cover following aspects:
> +
> +### Native Address and IRQ numbers for GIC and UART(vPL011)
> +
> +Today, fixed addresses and IRQ numbers are used to map GIC and UART(vPL011)
> +in DomUs. And it may cause potential clash on direct-map domains.
> +So, Using native addresses and irq numbers for GIC, UART(vPL011), in
> +direct-map domains is necessary.
> +e.g.

To me e.g. means example. But below this is not an example, this is a 
requirement in order to use the vpl011 on system without pl011 UART.

> +For the virtual interrupt of vPL011: instead of always using `GUEST_VPL011_SPI`,
> +try to reuse the physical SPI number if possible.

How would you find the following region for guest using PV drivers;
    - Event channel interrupt
    - Grant table area

> +
> +### Device tree option: `direct_map`
> +
> +Introduce a new device tree option `direct_map` for direct-map domains.
> +Then, when users try to allocate one direct-map domain(except DOM0),
> +`direct-map` property needs to be added under the appropriate `/chosen/domUx`.
> +
> +
> +            chosen {
> +                ...
> +                domU1 {
> +                    compatible = "xen, domain";
> +                    #address-cells = <0x2>;
> +                    #size-cells = <0x1>;
> +                    direct-map;
> +                    ...
> +                };
> +                ...
> +            };
> +
> +If users are using imagebuilder, they can add to boot.source something like the

This documentations ounds like more something for imagebuilder rather 
than Xen itself.

> +following:
> +
> +    fdt set /chosen/domU1 direct-map
> +
> +Users could also use `xl` to create direct-map domains, just use the following
> +config option: `direct-map=true`
> +
> +### direct-map guest memory allocation
> +
> +Func `allocate_memory_direct_map` is based on `allocate_memory_11`, and shall
> +be refined to allocate memory for all direct-map domains, including DOM0.
> +Roughly speaking, firstly, it tries to allocate arbitrary memory chunk of
> +requested size from domain sub-allocator(`alloc_domheap_pages`). If fail,
> +split the chunk into halves, and re-try, until it succeed or bail out with the
> +smallest chunk size.

If you have a mix of domain with direct-mapped and normal domain, you 
may end up to have the memory so small that your direct-mapped domain 
will have many small banks. This is going to be a major problem if you 
are creating the domain at runtime (you suggest xl can be used).

In addition, some users may want to be able to control the location of 
the memory as this reduced the amount of work in the guest (e.g you 
don't have to dynamically discover the memory).

I think it would be best to always require the admin to select the RAM 
bank used by a direct mapped domain. Alternatively, we could have a pool 
of memory that can only be used for direct mapped domain. This should 
limit the fragmentation of the memory.

> +Then, `insert_11_bank` shall insert above allocated pages into a memory bank,
> +which are ordered by address, and also set up guest P2M mapping(
> +`guest_physmap_add_page`) to ensure `gfn == mfn`.

Cheers,

-- 
Julien Grall

