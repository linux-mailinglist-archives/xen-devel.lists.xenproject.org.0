Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4637EC255
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633617.988623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3F5H-0003kr-GS; Wed, 15 Nov 2023 12:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633617.988623; Wed, 15 Nov 2023 12:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3F5H-0003iR-Cn; Wed, 15 Nov 2023 12:33:31 +0000
Received: by outflank-mailman (input) for mailman id 633617;
 Wed, 15 Nov 2023 12:33:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3F5F-0003iL-RZ
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:33:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3F5F-0000Jw-Dd; Wed, 15 Nov 2023 12:33:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3F5F-0002xX-7w; Wed, 15 Nov 2023 12:33:29 +0000
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
	bh=UVxCVe+BTrigTGFnDJWgbNr9Jjgi0VZxs0W3CVERRoY=; b=mFo53UTUezrs9pQorWzVDQ+i8S
	+P/rxSGG1McS3Y93aHkAHPH4yxvMlkpZhAf2R2Ji3HEKIqQuVQ2GDbIzsZ5i2rA2o8Cfdsukq7IYr
	Z7Nc6lKnGg6cRwggwRK0xFS+JV+LAn7nxoqStbKfgb2+AFHdQod4CYM/e/MQ0kPjJh3k=;
Message-ID: <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
Date: Wed, 15 Nov 2023 12:33:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-GB
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks for adding support for virtio-pci in Xen. I have some questions.

On 15/11/2023 11:26, Sergiy Kibrik wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> In order to enable more use-cases such as having multiple
> device-models (Qemu) running in different backend domains which provide
> virtio-pci devices for the same guest, we allocate and expose one
> PCI host bridge for every virtio backend domain for that guest.

OOI, why do you need to expose one PCI host bridge for every stubdomain?

In fact looking at the next patch, it seems you are handling some of the 
hostbridge request in Xen. This is adds a bit more confusion.

I was expecting the virtual PCI device would be in the vPCI and each 
Device emulator would advertise which BDF they are covering.

> 
> For that purpose, reserve separate virtio-pci resources (memory and SPI range
> for Legacy PCI interrupts) up to 8 possible PCI hosts (to be aligned with

Do you mean host bridge rather than host?

> MAX_NR_IOREQ_SERVERS) and allocate a host per backend domain. The PCI host
> details including its host_id to be written to dedicated Xenstore node for
> the device-model to retrieve.

So which with approach, who is decide which BDF will be used for a given 
virtio PCI device?

> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>   xen/include/public/arch-arm.h | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index a25e87dbda..e6c9cd5335 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -466,6 +466,19 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
>   #define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
>   
> +/*
> + * 16 MB is reserved for virtio-pci configuration space based on calculation
> + * 8 bridges * 2 buses x 32 devices x 8 functions x 4 KB = 16 MB

Can you explain how youd ecided the "2"?

> + */
> +#define GUEST_VIRTIO_PCI_ECAM_BASE          xen_mk_ullong(0x33000000)
> +#define GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE    xen_mk_ullong(0x01000000)
> +#define GUEST_VIRTIO_PCI_HOST_ECAM_SIZE     xen_mk_ullong(0x00200000)
> +
> +/* 64 MB is reserved for virtio-pci memory */
> +#define GUEST_VIRTIO_PCI_ADDR_TYPE_MEM    xen_mk_ullong(0x02000000)
> +#define GUEST_VIRTIO_PCI_MEM_ADDR         xen_mk_ullong(0x34000000)
> +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x04000000)
> +
>   /*
>    * 16MB == 4096 pages reserved for guest to use as a region to map its
>    * grant table in.
> @@ -476,6 +489,11 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>   #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>   
> +/* 64 MB is reserved for virtio-pci Prefetch memory */

This doesn't seem a lot depending on your use case. Can you details how 
you can up with "64 MB"?

> +#define GUEST_VIRTIO_PCI_ADDR_TYPE_PREFETCH_MEM    xen_mk_ullong(0x42000000)
> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_ADDR         xen_mk_ullong(0x3a000000)
> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE         xen_mk_ullong(0x04000000)
> +
>   #define GUEST_RAM_BANKS   2
>   
>   /*
> @@ -515,6 +533,9 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
>   #define GUEST_VIRTIO_MMIO_SPI_LAST    43
>   
> +#define GUEST_VIRTIO_PCI_SPI_FIRST   44
> +#define GUEST_VIRTIO_PCI_SPI_LAST    76

Just to confirm this is 4 interrupts per PCI host bridge? If so, can 
this be clarified in a comment?

Also, above you said that the host ID will be written to Xenstore. But 
who will decide which SPI belongs to which host bridge?

Cheers,

-- 
Julien Grall

