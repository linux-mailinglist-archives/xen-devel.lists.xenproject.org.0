Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDB3BA1A3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 15:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149145.275706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJXU-0001lF-5y; Fri, 02 Jul 2021 13:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149145.275706; Fri, 02 Jul 2021 13:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzJXU-0001i5-2X; Fri, 02 Jul 2021 13:49:04 +0000
Received: by outflank-mailman (input) for mailman id 149145;
 Fri, 02 Jul 2021 13:49:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j+um=L2=gmail.com=groeck7@srs-us1.protection.inumbo.net>)
 id 1lzJXS-0001hz-1h
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 13:49:02 +0000
Received: from mail-ot1-x333.google.com (unknown [2607:f8b0:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2da892b3-a654-4c8e-8c23-2ccfa732e28c;
 Fri, 02 Jul 2021 13:49:01 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso10074494otu.10
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jul 2021 06:49:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n26sm599488oos.14.2021.07.02.06.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 06:48:59 -0700 (PDT)
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
X-Inumbo-ID: 2da892b3-a654-4c8e-8c23-2ccfa732e28c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9x+juvDeOlaCtKmozneQfrCt9yo0Whbh1MNkOy7JJZU=;
        b=UEjOTwG3dEw4BMs9zskTAlB/qyEqwJyHyp2F3uc3IEyjANLR6uP1/H9KR/MbGUoN+q
         uXXp5fn/iI8ZGaLxshXE1VQxeK5/3UWORkO2pNxSV6JX6TB55C98dgtqR+ifQCzwR/+E
         tWXw5g4HJNLzPOLmN5ZESxRdKK1SlSI9vIjSxu/oxrzoNqDVDJAp6devlE/I9vjje1jl
         UriRs+KKNlto9yhu5Cc6j3zBlDtCEQbiH6DoyRIcLxwtvRuZjbkzbi0yal/mv3qJLt2a
         3fiDvGnsl5Hudqdx9BEktUwL9MS3wAY6jCzLNb0Q5Ly1c+F45rGX3brSqu3cPed6aviv
         JOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9x+juvDeOlaCtKmozneQfrCt9yo0Whbh1MNkOy7JJZU=;
        b=ZCTGP4CyT+8Z9LyRsplfQinqlw+A048EpprqlN0KfKpgs9CzGHx0FQYQRfCfTeNOIc
         0j3s3OYrbDVqyJomjoaDrEOvhMxpQp/M82NUu2qIBH/jv9TccfQfTsO8dnRLNe4iGg/6
         cjuyDohMLfbrX+nRQ6rotVEnFgtPl0bd2KL9a56CV4rCPNKCBYY2Lvc1q+TKvn/cG/Kw
         t2giVmLbl8kANcdLKvhgedbs2lMKZAxrIlZp5hP+g4Gjwr5MbDklW56cTBl22XjnPIoK
         GDWqy9dSZrhMbePFdwqipvT47zxwXpG6nllaTYYNj5syFbwrUQWNQJy1/cPm5ygUaY6W
         ZKOQ==
X-Gm-Message-State: AOAM530LKbpqS8LMRXTV0010TE8god9sjpeSwifWmuPE2MefWqKVAA6W
	D6kXX987wcf8VXbSeqn3KQo=
X-Google-Smtp-Source: ABdhPJzlnGPxxKYZSXkVHHmfsdkLH9E7ecEfVsvBHCQZR82klKUBGGO/PYD4fEoEphoBmS1gKABKng==
X-Received: by 2002:a05:6830:823:: with SMTP id t3mr4518459ots.334.1625233740480;
        Fri, 02 Jul 2021 06:49:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v15 12/12] of: Add plumbing for restricted DMA pool
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Nicolas Boichat <drinkcat@chromium.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 quic_qiancai@quicinc.com, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, thomas.lendacky@amd.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-13-tientzu@chromium.org>
 <20210702030807.GA2685166@roeck-us.net>
 <87ca3ada-22ed-f40c-0089-ca6fffc04f24@arm.com>
 <20210702131829.GA11132@willie-the-truck>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2f2d6633-2457-f7eb-81c1-355f56dc34ce@roeck-us.net>
Date: Fri, 2 Jul 2021 06:48:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702131829.GA11132@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/2/21 6:18 AM, Will Deacon wrote:
> On Fri, Jul 02, 2021 at 12:39:41PM +0100, Robin Murphy wrote:
>> On 2021-07-02 04:08, Guenter Roeck wrote:
>>> On Thu, Jun 24, 2021 at 11:55:26PM +0800, Claire Chang wrote:
>>>> If a device is not behind an IOMMU, we look up the device node and set
>>>> up the restricted DMA when the restricted-dma-pool is presented.
>>>>
>>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Tested-by: Will Deacon <will@kernel.org>
>>>
>>> With this patch in place, all sparc and sparc64 qemu emulations
>>> fail to boot. Symptom is that the root file system is not found.
>>> Reverting this patch fixes the problem. Bisect log is attached.
>>
>> Ah, OF_ADDRESS depends on !SPARC, so of_dma_configure_id() is presumably
>> returning an unexpected -ENODEV from the of_dma_set_restricted_buffer()
>> stub. That should probably be returning 0 instead, since either way it's not
>> an error condition for it to simply do nothing.
> 
> Something like below?
> 

Yes, that does the trick.

> Will
> 
> --->8
> 
>>From 4d9dcb9210c1f37435b6088284e04b6b36ee8c4d Mon Sep 17 00:00:00 2001
> From: Will Deacon <will@kernel.org>
> Date: Fri, 2 Jul 2021 14:13:28 +0100
> Subject: [PATCH] of: Return success from of_dma_set_restricted_buffer() when
>   !OF_ADDRESS
> 
> When CONFIG_OF_ADDRESS=n, of_dma_set_restricted_buffer() returns -ENODEV
> and breaks the boot for sparc[64] machines. Return 0 instead, since the
> function is essentially a glorified NOP in this configuration.
> 
> Cc: Claire Chang <tientzu@chromium.org>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Link: https://lore.kernel.org/r/20210702030807.GA2685166@roeck-us.net
> Signed-off-by: Will Deacon <will@kernel.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/of/of_private.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 8fde97565d11..34dd548c5eac 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -173,7 +173,8 @@ static inline int of_dma_get_range(struct device_node *np,
>   static inline int of_dma_set_restricted_buffer(struct device *dev,
>   					       struct device_node *np)
>   {
> -	return -ENODEV;
> +	/* Do nothing, successfully. */
> +	return 0;
>   }
>   #endif
>   
> 


