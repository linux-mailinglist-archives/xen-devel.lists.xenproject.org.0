Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0492B50D3B7
	for <lists+xen-devel@lfdr.de>; Sun, 24 Apr 2022 18:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312194.529400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nifUP-0005sP-4M; Sun, 24 Apr 2022 16:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312194.529400; Sun, 24 Apr 2022 16:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nifUP-0005pc-0A; Sun, 24 Apr 2022 16:53:37 +0000
Received: by outflank-mailman (input) for mailman id 312194;
 Sun, 24 Apr 2022 16:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ret3=VC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nifUN-0005pW-9D
 for xen-devel@lists.xenproject.org; Sun, 24 Apr 2022 16:53:35 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134f8f6d-c3ef-11ec-8fc2-03012f2f19d4;
 Sun, 24 Apr 2022 18:53:33 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id z18so5291503lfu.9
 for <xen-devel@lists.xenproject.org>; Sun, 24 Apr 2022 09:53:33 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a193812000000b00471f8573c96sm649350lfa.241.2022.04.24.09.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 09:53:32 -0700 (PDT)
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
X-Inumbo-ID: 134f8f6d-c3ef-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jglWAKRkI0cPF7sxIMVbMR7zt7h0C3kJ96kO8VwqGDI=;
        b=GYowuHqr7FB76QyplNtwwt3lky81k7Ou35ecYplCgAko4aBaXhy/MXAyl2x4Cu/MW6
         A4pRF0w0ewJckI7S8ELGwOHTFDh7jbReEQ26VnrDMV4qu3juRSwbpBdXChSHPNYzJmNd
         EHpOi7Mjq2QTjAF+XObk/nyy30OuCFJhSKdBQ+Y8I1flgab/G8K3uMsZzQcobPMA9HKV
         1kEJq9DMHRJL81nG7xqc1Ivq+c1M0Okte8Uf5RWCZA2JcJ3d4RyX0YkMLopKdkYqryTY
         TAmhz+4UYcJcT+l9p8zKrD1SrCQXsuNIOFI0RDhK9P6wTsNSdnQFTWRDH+NAyQ9FHB/3
         E/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jglWAKRkI0cPF7sxIMVbMR7zt7h0C3kJ96kO8VwqGDI=;
        b=KkxlWLdZCNPPPrq44RnaMaThWaqkD54LBlEGB9MyvomrfBV0elml7DI57BFZSHZHH0
         khVItp6Ajfppumhpbqg1lSsOkBGVLxzL9yPxn5oLSA6+WttVt6t5PcYBuvyZSop0OfzM
         qockPqA6O9ISpD3vSbg6S5iBWOkCHmzuXTl+JFV09SpQrnw5GC4JPWFnq367uVpNtqrU
         EYzKi9q0ltdopIFS/FOVJjcFmlAYMFwwvWWVQdnJ6CCGY9WSeW45UBMvuMlq2Og7VIoA
         ApyfRyF+lWXNLVEFKIDWJ1Q4PcTZrNNXlzMEnX7C1755LoTaxxyle4+BYnTpZ7GvOQZI
         7gPA==
X-Gm-Message-State: AOAM530M1nktUXNB9GThehuvjdZnmhYTTcAc91t2eEVn8iHeBD+/xxBH
	KCzbtXszI8/XxszS4JfuZME=
X-Google-Smtp-Source: ABdhPJwFreSpU5cEMVZzTUFm4eZzNyKMvOqf9D+S7BUgoISlXctBt6KVfUUcLTPNUQsOQOiq0aeg4w==
X-Received: by 2002:a05:6512:ac9:b0:470:e6d0:1bd8 with SMTP id n9-20020a0565120ac900b00470e6d01bd8mr10000761lfu.614.1650819212650;
        Sun, 24 Apr 2022 09:53:32 -0700 (PDT)
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
To: Christoph Hellwig <hch@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <YmQsFb36UEH9BUnN@infradead.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
Date: Sun, 24 Apr 2022 19:53:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YmQsFb36UEH9BUnN@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.04.22 19:40, Christoph Hellwig wrote:


Hello Christoph

> Please split this into one patch that creates grant-dma-ops, and another
> that sets up the virtio restricted access helpers.


Sounds reasonable, will do:

1. grant-dma-ops.c with config XEN_GRANT_DMA_OPS

2. arch_has_restricted_virtio_memory_access() with config XEN_VIRTIO


>
>> +
>> +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>> +int arch_has_restricted_virtio_memory_access(void)
>> +{
>> +	return (xen_has_restricted_virtio_memory_access() ||
>> +			cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
>> +}
> So instead of hardcoding Xen here, this seems like a candidate for
> another cc_platform_has flag.


I have a limited knowledge of x86 and Xen on x86.

Would the Xen specific bits fit into Confidential Computing Platform 
checks? I will let Juergen/Boris comment on this.


>
>> +config XEN_VIRTIO
>> +	bool "Xen virtio support"
>> +	default n
> n is the default default, so no need to specify it.

ok, will drop


>
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/******************************************************************************
> The all * line is not the usual kernel style, I'd suggest to drop it.

ok, will drop


>
>> +static struct page *xen_grant_dma_alloc_pages(struct device *dev, size_t size,
>> +					      dma_addr_t *dma_handle,
>> +					      enum dma_data_direction dir,
>> +					      gfp_t gfp)
>> +{
>> +	WARN_ONCE(1, "xen_grant_dma_alloc_pages size %zu\n", size);
>> +	return NULL;
>> +}
>> +
>> +static void xen_grant_dma_free_pages(struct device *dev, size_t size,
>> +				     struct page *vaddr, dma_addr_t dma_handle,
>> +				     enum dma_data_direction dir)
>> +{
>> +	WARN_ONCE(1, "xen_grant_dma_free_pages size %zu\n", size);
>> +}
> Please just wire this up to the same implementation as .alloc and .free.

I got it, will implement


>
>> +	spin_lock(&xen_grant_dma_lock);
>> +	list_add(&data->list, &xen_grant_dma_devices);
>> +	spin_unlock(&xen_grant_dma_lock);
> Hmm, having to do this device lookup for every DMA operation is going
> to suck. It might make sense to add a private field (e.g. as a union
> with the iommu field) in struct device instead.


I was thinking about it, but decided to not alter common struct device 
for adding Xen specific field, but haven't managed to think of a better 
idea than just using that brute lookup ...


>
> But if not you probably want to switch to a more efficient data
> structure like the xarray at least.

... I think, this is good point, thank you. I have no idea how faster it 
is going to be, but the resulting code looks simple (if of course I 
correctly understood the usage of xarray)


diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index a512c0a..7ecc0b0 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -11,6 +11,7 @@
  #include <linux/dma-map-ops.h>
  #include <linux/of.h>
  #include <linux/pfn.h>
+#include <linux/xarray.h>
  #include <xen/xen.h>
  #include <xen/grant_table.h>

@@ -19,12 +20,9 @@ struct xen_grant_dma_data {
         domid_t dev_domid;
         /* Is device behaving sane? */
         bool broken;
-       struct device *dev;
-       struct list_head list;
  };

-static LIST_HEAD(xen_grant_dma_devices);
-static DEFINE_SPINLOCK(xen_grant_dma_lock);
+static DEFINE_XARRAY(xen_grant_dma_devices);

  #define XEN_GRANT_DMA_ADDR_OFF (1ULL << 63)

@@ -40,21 +38,13 @@ static inline grant_ref_t dma_to_grant(dma_addr_t dma)

  static struct xen_grant_dma_data *find_xen_grant_dma_data(struct 
device *dev)
  {
-       struct xen_grant_dma_data *data = NULL;
-       bool found = false;
-
-       spin_lock(&xen_grant_dma_lock);
-
-       list_for_each_entry(data, &xen_grant_dma_devices, list) {
-               if (data->dev == dev) {
-                       found = true;
-                       break;
-               }
-       }
+       struct xen_grant_dma_data *data;

-       spin_unlock(&xen_grant_dma_lock);
+       xa_lock(&xen_grant_dma_devices);
+       data = xa_load(&xen_grant_dma_devices, (unsigned long)dev);
+       xa_unlock(&xen_grant_dma_devices);

-       return found ? data : NULL;
+       return data;
  }

  /*
@@ -310,11 +300,12 @@ void xen_grant_setup_dma_ops(struct device *dev)
                 goto err;

         data->dev_domid = dev_domid;
-       data->dev = dev;

-       spin_lock(&xen_grant_dma_lock);
-       list_add(&data->list, &xen_grant_dma_devices);
-       spin_unlock(&xen_grant_dma_lock);
+       if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, 
data,
+                       GFP_KERNEL))) {
+               dev_err(dev, "Cannot store Xen grant DMA data\n");
+               goto err;
+       }

         dev->dma_ops = &xen_grant_dma_ops;


>
>> +EXPORT_SYMBOL_GPL(xen_grant_setup_dma_ops);
> I don't think this has any modular users, or did I miss something?

No, you didn't. Will drop here and in the next patch for 
xen_is_grant_dma_device() as well.


-- 
Regards,

Oleksandr Tyshchenko


