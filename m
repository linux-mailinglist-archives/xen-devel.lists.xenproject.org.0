Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6683E18E4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 17:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164454.300759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfjl-0007BV-8X; Thu, 05 Aug 2021 15:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164454.300759; Thu, 05 Aug 2021 15:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfjl-00079X-5M; Thu, 05 Aug 2021 15:56:49 +0000
Received: by outflank-mailman (input) for mailman id 164454;
 Thu, 05 Aug 2021 15:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vwN3=M4=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mBfjj-00079R-16
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:56:47 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9d5c666-2916-49e1-a606-7349058bd377;
 Thu, 05 Aug 2021 15:56:46 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so10590900pjb.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Aug 2021 08:56:46 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 m1sm4685977pfk.84.2021.08.05.08.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 08:56:45 -0700 (PDT)
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
X-Inumbo-ID: d9d5c666-2916-49e1-a606-7349058bd377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RCTsDCtEUr9crU7FdVukkrAFOZDkX3iu2puUZlCshpI=;
        b=QLTD+I4si6TRStW3i+byEh+1Irtr6ILej9vo4oW1Nn2U3wtKPus5Q6l0kyCkqfLQ+P
         hZ8yjDAd0Nuc6MtizkDbmXNItH98ZjFBLjtXtMxv39zNJnaZWCHW2ngj5q4Pu9jNvfq8
         bzNSavZ4ty6c8S6Sfv/hFxaTSSnUMx90F8xfVWQm9z5xV1zhBRpVu10ETufiRpOiQTD9
         RzE6mO6mQczpUPW+Q+r00eX58g42C1HasWKWfZ2UVeAFyJj+HwJU606hzf87gKJ/+ooV
         BuwmRJ98aX+tfm7YNSXUbt4iN34dCtoubVxnaF1USweLp+Vjbulgjcf9sDEiBTuejvtR
         5IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RCTsDCtEUr9crU7FdVukkrAFOZDkX3iu2puUZlCshpI=;
        b=W8o3TjOAxEcLWmqd1evyBdCRss43tJZzkHmX5Ixr6aHr6xhhhVyVc89BHJThNdm3Gi
         9K7n4SG7pM/p/f0S2FWRrTJldZF0u9RWI+Sai4bURIBh3DL9Yv4Znjif8YiAVdoewDh9
         QhrIKrsVORJRUBU7Df4skuIPFEnuh9anHp+qK8AHHR9aaJ2x3BZTgiBAUPcfeDhlRkQ0
         cLW3hkj2KPsqWXby1KgwKIRYmyHwVgnK4wb+e9Bprc6Y0nRgJZM8ciuTn8XKc5N9lI25
         1YncfVPLHlERxR/r2hqj5BiQAjGPYVpqJqWvo0sXQnqScsL/3ukrnKKzdh/WwiDps9De
         Z3Yg==
X-Gm-Message-State: AOAM5325X1kpcQXrmrF/PqfamLegytMSvDcnLJF6b+4Q1X3ssSvA31Yi
	3/OHVj0Fsbpxyq3Dh3JqVmM=
X-Google-Smtp-Source: ABdhPJx2CcJ9YMvvKydKzMmm/L2XWhlBqcisHtQ6BBUyv1YcZ1T2Ns9MTQ4Jit08qy2zQW953vHgXw==
X-Received: by 2002:a17:902:9a46:b029:12c:9aae:daac with SMTP id x6-20020a1709029a46b029012c9aaedaacmr4504908plv.78.1628179005359;
        Thu, 05 Aug 2021 08:56:45 -0700 (PDT)
Subject: Re: [PATCH V2 10/14] DMA: Add dma_map_decrypted/dma_unmap_encrypted()
 function
From: Tianyu Lan <ltykernel@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 parri.andrea@gmail.com, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, Tianyu.Lan@microsoft.com, rppt@kernel.org,
 kirill.shutemov@linux.intel.com, akpm@linux-foundation.org,
 brijesh.singh@amd.com, thomas.lendacky@amd.com, pgonda@google.com,
 david@redhat.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 aneesh.kumar@linux.ibm.com, xen-devel@lists.xenproject.org,
 martin.b.radev@gmail.com, ardb@kernel.org, rientjes@google.com,
 tj@kernel.org, keescook@chromium.org, michael.h.kelley@microsoft.com
References: <20210804184513.512888-1-ltykernel@gmail.com>
 <20210804184513.512888-11-ltykernel@gmail.com>
Message-ID: <fc36c85f-cc34-5ad2-8f9c-06dbe85ca165@gmail.com>
Date: Thu, 5 Aug 2021 23:56:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804184513.512888-11-ltykernel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Christoph:
      Could you have a look at this patch? It adds new API 
dma_map_decrypted() to do memory decrypted and remap. It will
be used in the swiotlb code.

Thanks.

On 8/5/2021 2:45 AM, Tianyu Lan wrote:
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

