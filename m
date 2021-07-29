Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC53DA748
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 17:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161976.297202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m97j2-0002Ym-Fh; Thu, 29 Jul 2021 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161976.297202; Thu, 29 Jul 2021 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m97j2-0002Wq-CY; Thu, 29 Jul 2021 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 161976;
 Thu, 29 Jul 2021 15:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Rz1=MV=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m97j1-0002Wf-Lz
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 15:13:31 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7710f194-20dc-4b19-8e7d-500621abaca5;
 Thu, 29 Jul 2021 15:13:30 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso9880001pjs.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jul 2021 08:13:29 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 c7sm4247137pgq.22.2021.07.29.08.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 08:13:28 -0700 (PDT)
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
X-Inumbo-ID: 7710f194-20dc-4b19-8e7d-500621abaca5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=akMNdPJ4WS5nbnxgvsvMYm/zRUHwcBCfIsow9Ks6kis=;
        b=dLioqOpBl2TpGowMKGZzRjcLFx0fZ0sBHYpCjAxABGEJkW9CgwGvHYqQ7apVDck0xx
         W5FuDqVbCnNd70/DtkMCPd4nqMpezuT6upxl41IkUNtJlgdLrD+RhjExDK3z3ce7yAyi
         4T3pGiS49Fpux5+3O0k15LkGMg6tQKFB1XgNeZAHuGRcTvc6EBLKsj3eNAVBiUHKR1xX
         /CgKKN3LRKSV3ywoC91cZi4VtcHW9BdxphQdF31SCJLo1LkxTmqp53t070UtFqT4mdev
         zb6GH16wdrsVQodoRsmLapOWCa0r0OH1HB0WqtJ3jUF4EHVlDutR3ypdLueHvAxYkwe8
         3NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=akMNdPJ4WS5nbnxgvsvMYm/zRUHwcBCfIsow9Ks6kis=;
        b=Xn0OQaIveJZQ/1Lh/OE1hpomx4PWdOW9FGzZXkYAWMgIJSJedgETDbKbLZnUPlKewX
         jou4cNUDpLw2kTJFinPSUJBEPS3CyjIrgSv0qxBsZ3vdgONBFHkcy8+VwZXojyhGl3vE
         UxV/1gHY+cE15Wu9ouCJ9vEyhlvW/HghionntsxN1bn4srwwVBrhYesUs2cPmzlELEet
         PNvyKXYs5XtymgGEfGXqvnk+ZS+HzZENnfHldzkfIs4j0u/dVZL1RGK5GRplGhZm7Gxz
         jEW2gun2MDiIDIeakCyNpSpD86D6yAyJt5NrYMtwrjic+e8Y/K3bPgJvwHodkH3pfG3s
         gnpg==
X-Gm-Message-State: AOAM533uOktx7VS7qrIidwcf+Mr+62CCxPLA0bXeG81g8wXxOF/D1GXh
	idYzNQjkJtgSkFNfDKIN+dg=
X-Google-Smtp-Source: ABdhPJz+1u+t4XYMb612jZVRZC2eq6EVWswZWptItrWPSpDVi083nnf1kcuFDG/7rvR4ghR/eM6m5A==
X-Received: by 2002:a63:5505:: with SMTP id j5mr4265664pgb.250.1627571608984;
        Thu, 29 Jul 2021 08:13:28 -0700 (PDT)
Subject: Re: [PATCH 09/13] DMA: Add dma_map_decrypted/dma_unmap_encrypted()
 function
From: Tianyu Lan <ltykernel@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 anparri@microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, thomas.lendacky@amd.com, brijesh.singh@amd.com,
 ardb@kernel.org, Tianyu.Lan@microsoft.com, rientjes@google.com,
 martin.b.radev@gmail.com, akpm@linux-foundation.org, rppt@kernel.org,
 kirill.shutemov@linux.intel.com, aneesh.kumar@linux.ibm.com,
 krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-10-ltykernel@gmail.com>
Message-ID: <da69c920-c12a-b4ad-7554-68b9e99bb6ce@gmail.com>
Date: Thu, 29 Jul 2021 23:13:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728145232.285861-10-ltykernel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Christoph:
      Could you have a look at this patch and the following patch
"[PATCH 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap function
for HV IVM" These two patches follows your previous comments and add 
dma_map_decrypted/dma_unmap_decrypted(). I don't add arch prefix because 
each platform may populate their callbacks into dma memory decrypted ops.

Thanks.

On 7/28/2021 10:52 PM, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> In Hyper-V Isolation VM with AMD SEV, swiotlb boucne buffer
> needs to be mapped into address space above vTOM and so
> introduce dma_map_decrypted/dma_unmap_encrypted() to map/unmap
> bounce buffer memory. The platform can populate man/unmap callback
> in the dma memory decrypted ops.
> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
>   include/linux/dma-map-ops.h |  9 +++++++++
>   kernel/dma/mapping.c        | 22 ++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 0d53a96a3d64..01d60a024e45 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -71,6 +71,11 @@ struct dma_map_ops {
>   	unsigned long (*get_merge_boundary)(struct device *dev);
>   };
>   
> +struct dma_memory_decrypted_ops {
> +	void *(*map)(void *addr, unsigned long size);
> +	void (*unmap)(void *addr);
> +};
> +
>   #ifdef CONFIG_DMA_OPS
>   #include <asm/dma-mapping.h>
>   
> @@ -374,6 +379,10 @@ static inline void debug_dma_dump_mappings(struct device *dev)
>   }
>   #endif /* CONFIG_DMA_API_DEBUG */
>   
> +void *dma_map_decrypted(void *addr, unsigned long size);
> +int dma_unmap_decrypted(void *addr, unsigned long size);
> +
>   extern const struct dma_map_ops dma_dummy_ops;
> +extern struct dma_memory_decrypted_ops dma_memory_generic_decrypted_ops;
>   
>   #endif /* _LINUX_DMA_MAP_OPS_H */
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 2b06a809d0b9..6fb150dc1750 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -13,11 +13,13 @@
>   #include <linux/of_device.h>
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
> +#include <asm/set_memory.h>
>   #include "debug.h"
>   #include "direct.h"
>   
>   bool dma_default_coherent;
>   
> +struct dma_memory_decrypted_ops dma_memory_generic_decrypted_ops;
>   /*
>    * Managed DMA API
>    */
> @@ -736,3 +738,23 @@ unsigned long dma_get_merge_boundary(struct device *dev)
>   	return ops->get_merge_boundary(dev);
>   }
>   EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
> +
> +void *dma_map_decrypted(void *addr, unsigned long size)
> +{
> +	if (set_memory_decrypted((unsigned long)addr,
> +				 size / PAGE_SIZE))
> +		return NULL;
> +
> +	if (dma_memory_generic_decrypted_ops.map)
> +		return dma_memory_generic_decrypted_ops.map(addr, size);
> +	else
> +		return addr;
> +}
> +
> +int dma_unmap_encrypted(void *addr, unsigned long size)
> +{
> +	if (dma_memory_generic_decrypted_ops.unmap)
> +		dma_memory_generic_decrypted_ops.unmap(addr);
> +
> +	return set_memory_encrypted((unsigned long)addr, size / PAGE_SIZE);
> +}
> 

