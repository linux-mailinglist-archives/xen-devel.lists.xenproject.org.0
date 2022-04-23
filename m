Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB4850CBB4
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 17:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311678.528938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niHbZ-0005Kb-9n; Sat, 23 Apr 2022 15:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311678.528938; Sat, 23 Apr 2022 15:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niHbZ-0005Ij-6f; Sat, 23 Apr 2022 15:23:25 +0000
Received: by outflank-mailman (input) for mailman id 311678;
 Sat, 23 Apr 2022 15:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJIN=VB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1niHbX-0005Id-3y
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 15:23:23 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f9de374-c319-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 17:23:22 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id bj36so12872341ljb.13
 for <xen-devel@lists.xenproject.org>; Sat, 23 Apr 2022 08:23:22 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b00471f7e4f09asm252577lfg.112.2022.04.23.08.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:23:21 -0700 (PDT)
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
X-Inumbo-ID: 4f9de374-c319-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IrpG+O4O8YGPLjnEW6ym2q9Ak0YBISr2l1Uzmevi7UU=;
        b=IQIfElwQ6vipgSII8m7fw6jPT7ARLMUo+GYVfI8Knl2qwcFVEEhcFvD8Om4SSjKAx2
         rhHWD/FD4idPYpw6gGmafqjLSO6s5PnKgRub3B+6obIRWzQnvSBJtyJQi3yrabfM/3YH
         nyMF8uDK1IRSsUIm9AaGjRtkUTA84vsuNJIwUvyB4GNP5y1x7sQZT+c8y4qqZ/6mHAet
         nubs7NGVFobqf7TGI1y4TrUGgxgSag+RI8iLIe9SEJTQyV0518eyYpKVLK3gEmGFlfzs
         i97+MmHFuoXsYprc+xZO4DAi1h+VcMtO3Ecc7KkUECH8yT0sSemR7hzD5vvLn3BlyJFZ
         JNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=IrpG+O4O8YGPLjnEW6ym2q9Ak0YBISr2l1Uzmevi7UU=;
        b=uJvrf0N6PFjm7NIpGA6ndGOV42akXGRGx9oF4cQi7ZDKR7qqvN0AxxXUisZTUsTuJM
         as/q3nHDoDpquoix6CQSgBJy5BuUoGVeNm8sp1sx/Ir98b3EOZVzprUkRf6zB2ykLn9z
         OuFgc0M6nNDYB8fQPFGxyL4A+3xdgrEyYTE3otc3di/x3GPNki9nwvY/CDjsswM3PfQI
         4F4jLkGaSqRvHaCnTmtT35d+PRUdFpWBcDL9RgG/pXq08RLuEvJnhUFFWRhsQXB8z0om
         xeS/A7HNereBb+X9Ybt4uVxP61buytj/APvN7Z5Ip4mO+jQD5adYqdcLmYW3b/2aGTIN
         2BsA==
X-Gm-Message-State: AOAM5328IYiMPqYfrZ6nKSN3MuGSbuRRCF9YIEvlLpmf7gbGyZ4IhSwD
	9IPzBdzsELpQYIRJrMt/i7Q=
X-Google-Smtp-Source: ABdhPJzDEm0kTMzLCkWHC07bFgwWAdrQLhfM8wiRtUiko+APIl1auVipAlGP2engdswsIY79u6w4jg==
X-Received: by 2002:a2e:b537:0:b0:24f:9dc:28a6 with SMTP id z23-20020a2eb537000000b0024f09dc28a6mr637763ljm.509.1650727401488;
        Sat, 23 Apr 2022 08:23:21 -0700 (PDT)
Subject: Re: [PATCH V1 5/6] xen/grant-dma-ops: Retrieve the ID of backend's
 domain for DT devices
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204221534080.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6ac03d9f-a678-60e9-ca6e-fcbe1aee51d3@gmail.com>
Date: Sat, 23 Apr 2022 18:23:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204221534080.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 23.04.22 02:00, Stefano Stabellini wrote:

Hello Stefano

> On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Use the presence of recently introduced "xen,dev-domid" property
>> in the device node as a clear indicator of enabling Xen grant
>> mappings scheme for that device and read the ID of Xen domain where
>> the corresponding backend resides. The ID (domid) is used as
>> an argument to the Xen grant mapping APIs.
>>
>> Also introduce xen_is_grant_dma_device() to check whether xen-grant
>> DMA ops need to be set for a passed device.
>>
>> Remove the hardcoded domid 0 in xen_grant_setup_dma_ops().
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Changes RFC -> V1:
>>     - new patch, split required changes from commit:
>>      "[PATCH 4/6] virtio: Various updates to xen-virtio DMA ops layer"
>>     - update checks in xen_virtio_setup_dma_ops() to only support
>>       DT devices for now
>>     - remove the "virtio,mmio" check from xen_is_virtio_device()
>>     - remane everything according to the new naming scheme:
>>       s/virtio/grant_dma
>> ---
>>   drivers/xen/grant-dma-ops.c | 25 ++++++++++++++++++-------
>>   include/xen/xen-ops.h       |  5 +++++
>>   2 files changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index 0e69aa8..70d5d77 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -66,11 +66,6 @@ static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
>>    * Such a DMA address is formed by using the grant reference as a frame
>>    * number and setting the highest address bit (this bit is for the backend
>>    * to be able to distinguish it from e.g. a mmio address).
>> - *
>> - * Note that for now we hard wire dom0 to be the backend domain. In order
>> - * to support any domain as backend we'd need to add a way to communicate
>> - * the domid of this backend, e.g. via Xenstore, via the PCI-device's
>> - * config space or DT/ACPI.
>>    */
>>   static void *xen_grant_dma_alloc(struct device *dev, size_t size,
>>   				 dma_addr_t *dma_handle, gfp_t gfp,
>> @@ -277,6 +272,16 @@ static const struct dma_map_ops xen_grant_dma_ops = {
>>   	.dma_supported = xen_grant_dma_supported,
>>   };
>>   
>> +bool xen_is_grant_dma_device(struct device *dev)
>> +{
>> +	/* XXX Handle only DT devices for now */
>> +	if (!dev->of_node)
>> +		return false;
>> +
>> +	return of_property_read_bool(dev->of_node, "xen,dev-domid");
>> +}
>> +EXPORT_SYMBOL_GPL(xen_is_grant_dma_device);
>> +
>>   void xen_grant_setup_dma_ops(struct device *dev)
>>   {
>>   	struct xen_grant_dma_data *data;
>> @@ -288,8 +293,14 @@ void xen_grant_setup_dma_ops(struct device *dev)
>>   		return;
>>   	}
>>   
>> -	/* XXX The dom0 is hardcoded as the backend domain for now */
>> -	dev_domid = 0;
>> +	/* XXX ACPI and PCI devices unsupported for now */
>> +	if (dev_is_pci(dev) || !dev->of_node)
>> +		goto err;
> I think we can remove the "dev_is_pci" check, right?

I think, yes (at least for now). I will remove the inclusion of #include 
<linux/pci.h> as well.


>
>
>> +	if (of_property_read_u32(dev->of_node, "xen,dev-domid", &dev_domid)) {
>> +		dev_err(dev, "xen,dev-domid property is not present\n");
>> +		goto err;
>> +	}
>>   
>>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data) {
>> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
>> index 4f9fad5..62be9dc 100644
>> --- a/include/xen/xen-ops.h
>> +++ b/include/xen/xen-ops.h
>> @@ -223,10 +223,15 @@ static inline void xen_preemptible_hcall_end(void) { }
>>   
>>   #ifdef CONFIG_XEN_GRANT_DMA_OPS
>>   void xen_grant_setup_dma_ops(struct device *dev);
>> +bool xen_is_grant_dma_device(struct device *dev);
>>   #else
>>   static inline void xen_grant_setup_dma_ops(struct device *dev)
>>   {
>>   }
>> +static inline bool xen_is_grant_dma_device(struct device *dev)
>> +{
>> +	return false;
>> +}
>>   #endif /* CONFIG_XEN_GRANT_DMA_OPS */
>>   
>>   #endif /* INCLUDE_XEN_OPS_H */
>> -- 
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
-- 
Regards,

Oleksandr Tyshchenko


