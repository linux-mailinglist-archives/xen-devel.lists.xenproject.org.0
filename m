Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8D50488D
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 19:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306671.521808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng8IB-0005DW-Bw; Sun, 17 Apr 2022 17:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306671.521808; Sun, 17 Apr 2022 17:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng8IB-0005Aj-8b; Sun, 17 Apr 2022 17:02:31 +0000
Received: by outflank-mailman (input) for mailman id 306671;
 Sun, 17 Apr 2022 17:02:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3EG=U3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ng8IA-0005Ad-64
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 17:02:30 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29632672-be70-11ec-a405-831a346695d4;
 Sun, 17 Apr 2022 19:02:28 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id 17so14630189lji.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 Apr 2022 10:02:28 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05651c04c900b0024b6ce19ef1sm921681lji.96.2022.04.17.10.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 10:02:26 -0700 (PDT)
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
X-Inumbo-ID: 29632672-be70-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hafAfueljTfqgLafYpJ0VMiQP+fHqJGqkLhjQLTHMfs=;
        b=KZJTT9SaRHmCQskg5KlLXLJayizDmfcXTulKEUTAmG26q9Ke698WoFa1dnScnVYZwM
         FmMTpBuiAZDzjQ6iaOFshvmdkkq9k+WFUSw+l7loDt6ZugMuE7lzvgO6gGUHj0jOL/2I
         iPzmbJTVDbT0pNBr0KOU7sCDqZQ5pLUIAEpisphAyO02bKLkAzoHdCAFGvaCQj6EtLNB
         0rNvP5LejaJ2jOXJ1skyloepvxUjTTN61qIGxiBSo4qfv/aFoGzacNzTFjP8oDN+FQIn
         GuUAweqfRB4d6sfyyomA8t6W41kGI7HkO0bMDKExMbukUQ8NmWQl+1pDJh2eXU81M8lW
         hsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hafAfueljTfqgLafYpJ0VMiQP+fHqJGqkLhjQLTHMfs=;
        b=IcGN4CWu/AW4/C1IeRIvCGkGelSXvcl7UFJXP+N7PFkRaOyCx5g7IMpDI2ghO6aMPo
         43sTkewXvZXqYD3W/MeTgt26exFlpoSZe767aC3H7uggeWjU2hXl3KwSrKeiSQoAssx4
         UebKyjteDnZVn8e5xFCDxVOXtstuiLJASujtTR3hMsfUILTDAdmPG0G7HbEtJMktyw6y
         1toef4RmaQjSJPEe9cUJUPfQHzfuuytxcacjX1CL0Fbejq60C8goL2LMbOaAuez9GGyr
         Y/b2ccMRTfpqf4/90ZMgJT8Tp60iGPcC+JtuWZAe5OJBRjtN3FmA/2OY135v1h7ulaz4
         yGSA==
X-Gm-Message-State: AOAM532I38f5wI14XK2b9LjJtkofuojWRpk0OdSOQ6S8k4RXKH8w2BPr
	ueKBS5ep/nojXCQuoFOo/TCtBtpLmQ0=
X-Google-Smtp-Source: ABdhPJx6FibJ/hCfUGzrlPei6jqFjeM4z16w/wWKJHfluEauRsSBrcOz2tinQuqtoorCY4g25STP/w==
X-Received: by 2002:a2e:9c8f:0:b0:24d:ba11:7552 with SMTP id x15-20020a2e9c8f000000b0024dba117552mr1541735lji.260.1650214946667;
        Sun, 17 Apr 2022 10:02:26 -0700 (PDT)
Subject: Re: [RFC PATCH 2/6] virtio: add option to restrict memory access
 under Xen
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 linux-arm-kernel@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151235440.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <8a66ad42-a3e7-c29d-7d4e-35766dcccd15@gmail.com>
Date: Sun, 17 Apr 2022 20:02:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204151235440.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 16.04.22 01:01, Stefano Stabellini wrote:


Hello Stefano


> On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Juergen Gross <jgross@suse.com>
>>
>> In order to support virtio in Xen guests add a config option enabling
>> the user to specify whether in all Xen guests virtio should be able to
>> access memory via Xen grant mappings only on the host side.
>>
>> This applies to fully virtualized guests only, as for paravirtualized
>> guests this is mandatory.
>>
>> This requires to switch arch_has_restricted_virtio_memory_access()
>> from a pure stub to a real function on x86 systems (Arm systems are
>> not covered by now).
>>
>> Add the needed functionality by providing a special set of DMA ops
>> handling the needed grant operations for the I/O pages.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/mm/init.c        |  15 ++++
>>   arch/x86/mm/mem_encrypt.c |   5 --
>>   arch/x86/xen/Kconfig      |   9 +++
>>   drivers/xen/Kconfig       |  20 ++++++
>>   drivers/xen/Makefile      |   1 +
>>   drivers/xen/xen-virtio.c  | 177 ++++++++++++++++++++++++++++++++++++++++++++++
>>   include/xen/xen-ops.h     |   8 +++
>>   7 files changed, 230 insertions(+), 5 deletions(-)
>>   create mode 100644 drivers/xen/xen-virtio.c
>>
>> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
>> index d8cfce2..526a3b2 100644
>> --- a/arch/x86/mm/init.c
>> +++ b/arch/x86/mm/init.c
>> @@ -8,6 +8,8 @@
>>   #include <linux/kmemleak.h>
>>   #include <linux/sched/task.h>
>>   
>> +#include <xen/xen.h>
>> +
>>   #include <asm/set_memory.h>
>>   #include <asm/e820/api.h>
>>   #include <asm/init.h>
>> @@ -1065,3 +1067,16 @@ unsigned long max_swapfile_size(void)
>>   	return pages;
>>   }
>>   #endif
>> +
>> +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>> +int arch_has_restricted_virtio_memory_access(void)
>> +{
>> +	if (IS_ENABLED(CONFIG_XEN_PV_VIRTIO) && xen_pv_domain())
>> +		return 1;
>> +	if (IS_ENABLED(CONFIG_XEN_HVM_VIRTIO_GRANT) && xen_hvm_domain())
>> +		return 1;
> I think these two checks could be moved to a separate function in a Xen
> header, e.g. xen_restricted_virtio_memory_access, and here you could
> just
>
> if (xen_restricted_virtio_memory_access())
>      return 1;

Agree, will do


>
>
>
>> +	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
>> +}
>> +EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
>> +#endif
>> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
>> index 50d2099..dda020f 100644
>> --- a/arch/x86/mm/mem_encrypt.c
>> +++ b/arch/x86/mm/mem_encrypt.c
>> @@ -77,8 +77,3 @@ void __init mem_encrypt_init(void)
>>   	print_mem_encrypt_feature_info();
>>   }
>>   
>> -int arch_has_restricted_virtio_memory_access(void)
>> -{
>> -	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
>> -}
>> -EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
>> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
>> index 85246dd..dffdffd 100644
>> --- a/arch/x86/xen/Kconfig
>> +++ b/arch/x86/xen/Kconfig
>> @@ -92,3 +92,12 @@ config XEN_DOM0
>>   	select X86_X2APIC if XEN_PVH && X86_64
>>   	help
>>   	  Support running as a Xen Dom0 guest.
>> +
>> +config XEN_PV_VIRTIO
>> +	bool "Xen virtio support for PV guests"
>> +	depends on XEN_VIRTIO && XEN_PV
>> +	default y
>> +	help
>> +	  Support virtio for running as a paravirtualized guest. This will
>> +	  need support on the backend side (qemu or kernel, depending on the
>> +	  virtio device types used).
>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>> index 120d32f..fc61f7a 100644
>> --- a/drivers/xen/Kconfig
>> +++ b/drivers/xen/Kconfig
>> @@ -335,4 +335,24 @@ config XEN_UNPOPULATED_ALLOC
>>   	  having to balloon out RAM regions in order to obtain physical memory
>>   	  space to create such mappings.
>>   
>> +config XEN_VIRTIO
>> +	bool "Xen virtio support"
>> +	default n
>> +	depends on VIRTIO && DMA_OPS
>> +	select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>> +	help
>> +	  Enable virtio support for running as Xen guest. Depending on the
>> +	  guest type this will require special support on the backend side
>> +	  (qemu or kernel, depending on the virtio device types used).
>> +
>> +config XEN_HVM_VIRTIO_GRANT
>> +	bool "Require virtio for fully virtualized guests to use grant mappings"
>> +	depends on XEN_VIRTIO && X86_64
>> +	default y
>> +	help
>> +	  Require virtio for fully virtualized guests to use grant mappings.
>> +	  This will avoid the need to give the backend the right to map all
>> +	  of the guest memory. This will need support on the backend side
>> +	  (qemu or kernel, depending on the virtio device types used).
> I don't think we need 3 visible kconfig options for this.
>
> In fact, I would only add one: XEN_VIRTIO. We can have any X86 (or ARM)
> specific dependencies in the "depends" line under XEN_VIRTIO. And I
> don't think we need XEN_HVM_VIRTIO_GRANT as a kconfig option
> necessarely. It doesn't seem like some we want as build time option. At
> most, it could be a runtime option (like a command line) or a debug
> option (like an #define at the top of the source file.)


I don't know what was the initial idea of having and extra 
XEN_HVM_VIRTIO and XEN_PV_VIRTIO options, but taking into the account that
they are only used in arch_has_restricted_virtio_memory_access() 
currently, I share your opinion regarding a single XEN_VIRTIO option.

Looking ahead (including changes in the commit #4), we can imagine the 
resulting option:

config XEN_VIRTIO
     bool "Xen virtio support"
     default n
     depends on VIRTIO && DMA_OPS
     depends on (X86_64 || ARM || ARM64)
     select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
     help
       Enable virtio support for running as Xen guest. Depending on the
       guest type this will require special support on the backend side
       (qemu or kernel, depending on the virtio device types used).


and then arch_has_restricted_virtio_memory_access() per arch:


1. x86:

int arch_has_restricted_virtio_memory_access(void)
{
     return (xen_has_restricted_virtio_memory_access() ||
             cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
}


2. Arm:

int arch_has_restricted_virtio_memory_access(void)
{
     return xen_has_restricted_virtio_memory_access();
}


3. xen.h:

static inline int xen_has_restricted_virtio_memory_access(void)
{
     if (IS_ENABLED(CONFIG_XEN_VIRTIO) && (xen_pv_domain() || 
xen_hvm_domain()))
         return 1;

     return 0;
}


Actually, as domain type on Arm is always XEN_HVM_DOMAIN, we could 
probably have the following on Arm:

int arch_has_restricted_virtio_memory_access(void)
{
     return IS_ENABLED(CONFIG_XEN_VIRTIO);
}

but I would prefer not to diverge and use common 
xen_has_restricted_virtio_memory_access().

Any thoughts?



>
>
>>   endmenu
>> diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
>> index 5aae66e..767009c 100644
>> --- a/drivers/xen/Makefile
>> +++ b/drivers/xen/Makefile
>> @@ -39,3 +39,4 @@ xen-gntalloc-y				:= gntalloc.o
>>   xen-privcmd-y				:= privcmd.o privcmd-buf.o
>>   obj-$(CONFIG_XEN_FRONT_PGDIR_SHBUF)	+= xen-front-pgdir-shbuf.o
>>   obj-$(CONFIG_XEN_UNPOPULATED_ALLOC)	+= unpopulated-alloc.o
>> +obj-$(CONFIG_XEN_VIRTIO)		+= xen-virtio.o
>> diff --git a/drivers/xen/xen-virtio.c b/drivers/xen/xen-virtio.c
>> new file mode 100644
>> index 00000000..cfd5eda
>> --- /dev/null
>> +++ b/drivers/xen/xen-virtio.c
>> @@ -0,0 +1,177 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/******************************************************************************
>> + * Xen virtio driver - enables using virtio devices in Xen guests.
>> + *
>> + * Copyright (c) 2021, Juergen Gross <jgross@suse.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/dma-map-ops.h>
>> +#include <linux/pci.h>
>> +#include <linux/pfn.h>
>> +#include <linux/virtio_config.h>
>> +#include <xen/xen.h>
>> +#include <xen/grant_table.h>
>> +
>> +#define XEN_GRANT_ADDR_OFF	0x8000000000000000ULL
> NIT: (1ULL << 31)

ok, I assume you meant (1ULL << 63)?


>
>
>> +static inline dma_addr_t grant_to_dma(grant_ref_t grant)
>> +{
>> +	return XEN_GRANT_ADDR_OFF | ((dma_addr_t)grant << PAGE_SHIFT);
>> +}
>> +
>> +static inline grant_ref_t dma_to_grant(dma_addr_t dma)
>> +{
>> +	return (grant_ref_t)((dma & ~XEN_GRANT_ADDR_OFF) >> PAGE_SHIFT);
>> +}
>> +
>> +/*
>> + * DMA ops for Xen virtio frontends.
>> + *
>> + * Used to act as a kind of software IOMMU for Xen guests by using grants as
>> + * DMA addresses.
>> + * Such a DMA address is formed by using the grant reference as a frame
>> + * number and setting the highest address bit (this bit is for the backend
>> + * to be able to distinguish it from e.g. a mmio address).
>> + *
>> + * Note that for now we hard wire dom0 to be the backend domain. In order to
>> + * support any domain as backend we'd need to add a way to communicate the
>> + * domid of this backend, e.g. via Xenstore or via the PCI-device's config
>> + * space.
> I would add device tree as possible way of domid communication

I agree, but changes in the commit #4 (which add DT support and remove 
hardcoded domid 0) render this comment stale. For the next version I 
will squash changes and drop or rephrase this comment.


>
>
>> + */
>> +static void *xen_virtio_dma_alloc(struct device *dev, size_t size,
>> +				  dma_addr_t *dma_handle, gfp_t gfp,
>> +				  unsigned long attrs)
>> +{
>> +	unsigned int n_pages = PFN_UP(size);
>> +	unsigned int i;
>> +	unsigned long pfn;
>> +	grant_ref_t grant;
>> +	void *ret;
>> +
>> +	ret = (void *)__get_free_pages(gfp, get_order(size));
>> +	if (!ret)
>> +		return NULL;
>> +
>> +	pfn = virt_to_pfn(ret);
>> +
>> +	if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
>> +		free_pages((unsigned long)ret, get_order(size));
>> +		return NULL;
>> +	}
>> +
>> +	for (i = 0; i < n_pages; i++) {
>> +		gnttab_grant_foreign_access_ref(grant + i, 0,
>> +						pfn_to_gfn(pfn + i), 0);
>> +	}
>> +
>> +	*dma_handle = grant_to_dma(grant);
>> +
>> +	return ret;
>> +}
>> +
>> +static void xen_virtio_dma_free(struct device *dev, size_t size, void *vaddr,
>> +				dma_addr_t dma_handle, unsigned long attrs)
>> +{
>> +	unsigned int n_pages = PFN_UP(size);
>> +	unsigned int i;
>> +	grant_ref_t grant;
>> +
>> +	grant = dma_to_grant(dma_handle);
>> +
>> +	for (i = 0; i < n_pages; i++)
>> +		gnttab_end_foreign_access_ref(grant + i);
>> +
>> +	gnttab_free_grant_reference_seq(grant, n_pages);
>> +
>> +	free_pages((unsigned long)vaddr, get_order(size));
>> +}
>> +
>> +static struct page *xen_virtio_dma_alloc_pages(struct device *dev, size_t size,
>> +					       dma_addr_t *dma_handle,
>> +					       enum dma_data_direction dir,
>> +					       gfp_t gfp)
>> +{
>> +	WARN_ONCE(1, "xen_virtio_dma_alloc_pages size %ld\n", size);
>> +	return NULL;
>> +}
>> +
>> +static void xen_virtio_dma_free_pages(struct device *dev, size_t size,
>> +				      struct page *vaddr, dma_addr_t dma_handle,
>> +				      enum dma_data_direction dir)
>> +{
>> +	WARN_ONCE(1, "xen_virtio_dma_free_pages size %ld\n", size);
>> +}
>> +
>> +static dma_addr_t xen_virtio_dma_map_page(struct device *dev, struct page *page,
>> +					  unsigned long offset, size_t size,
>> +					  enum dma_data_direction dir,
>> +					  unsigned long attrs)
>> +{
>> +	grant_ref_t grant;
>> +
>> +	if (gnttab_alloc_grant_references(1, &grant))
>> +		return 0;
>> +
>> +	gnttab_grant_foreign_access_ref(grant, 0, xen_page_to_gfn(page),
>> +					dir == DMA_TO_DEVICE);
>> +	return grant_to_dma(grant) + offset;
>> +}
>> +
>> +static void xen_virtio_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
>> +				      size_t size, enum dma_data_direction dir,
>> +				      unsigned long attrs)
>> +{
>> +	grant_ref_t grant;
>> +
>> +	grant = dma_to_grant(dma_handle);
>> +
>> +	gnttab_end_foreign_access_ref(grant);
>> +
>> +	gnttab_free_grant_reference(grant);
>> +}
>> +
>> +static int xen_virtio_dma_map_sg(struct device *dev, struct scatterlist *sg,
>> +				 int nents, enum dma_data_direction dir,
>> +				 unsigned long attrs)
>> +{
>> +	WARN_ONCE(1, "xen_virtio_dma_map_sg nents %d\n", nents);
>> +	return -EINVAL;
>> +}
>> +
>> +static void xen_virtio_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
>> +				    int nents, enum dma_data_direction dir,
>> +				    unsigned long attrs)
>> +{
>> +	WARN_ONCE(1, "xen_virtio_dma_unmap_sg nents %d\n", nents);
>> +}
> You can implement xen_virtio_dma_map_sg and xen_virtio_dma_unmap_sg
> based on xen_virtio_dma_map_page and xen_virtio_dma_unmap_page, like we
> do in drivers/xen/swiotlb-xen.c.

Good point, thank you, will implement.


>
>
>> +static int xen_virtio_dma_dma_supported(struct device *dev, u64 mask)
>> +{
>> +	return 1;
>> +}
>> +
>> +static const struct dma_map_ops xen_virtio_dma_ops = {
>> +	.alloc = xen_virtio_dma_alloc,
>> +	.free = xen_virtio_dma_free,
>> +	.alloc_pages = xen_virtio_dma_alloc_pages,
>> +	.free_pages = xen_virtio_dma_free_pages,
>> +	.mmap = dma_common_mmap,
>> +	.get_sgtable = dma_common_get_sgtable,
>> +	.map_page = xen_virtio_dma_map_page,
>> +	.unmap_page = xen_virtio_dma_unmap_page,
>> +	.map_sg = xen_virtio_dma_map_sg,
>> +	.unmap_sg = xen_virtio_dma_unmap_sg,
>> +	.dma_supported = xen_virtio_dma_dma_supported,
>> +};
>> +
>> +void xen_virtio_setup_dma_ops(struct device *dev)
>> +{
>> +	dev->dma_ops = &xen_virtio_dma_ops;
>> +}
>> +EXPORT_SYMBOL_GPL(xen_virtio_setup_dma_ops);
>> +
>> +MODULE_DESCRIPTION("Xen virtio support driver");
>> +MODULE_AUTHOR("Juergen Gross <jgross@suse.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
>> index a3584a3..ae3c1bc 100644
>> --- a/include/xen/xen-ops.h
>> +++ b/include/xen/xen-ops.h
>> @@ -221,4 +221,12 @@ static inline void xen_preemptible_hcall_end(void) { }
>>   
>>   #endif /* CONFIG_XEN_PV && !CONFIG_PREEMPTION */
>>   
>> +#ifdef CONFIG_XEN_VIRTIO
>> +void xen_virtio_setup_dma_ops(struct device *dev);
>> +#else
>> +static inline void xen_virtio_setup_dma_ops(struct device *dev)
>> +{
>> +}
>> +#endif /* CONFIG_XEN_VIRTIO */
>> +
>>   #endif /* INCLUDE_XEN_OPS_H */
>> -- 
>> 2.7.4
>>
-- 
Regards,

Oleksandr Tyshchenko


