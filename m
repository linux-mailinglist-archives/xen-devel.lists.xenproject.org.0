Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795F45DBD3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 15:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231440.400500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqFJh-0004hb-Bq; Thu, 25 Nov 2021 14:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231440.400500; Thu, 25 Nov 2021 14:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqFJh-0004fd-8e; Thu, 25 Nov 2021 14:01:37 +0000
Received: by outflank-mailman (input) for mailman id 231440;
 Thu, 25 Nov 2021 14:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lxap=QM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mqFJf-0004fX-Rw
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 14:01:36 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b63b39-4df8-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 15:01:34 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id bi37so16604805lfb.5
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 06:01:34 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s4sm269499lfp.198.2021.11.25.06.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 06:01:32 -0800 (PST)
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
X-Inumbo-ID: 32b63b39-4df8-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gxEXJk+/Nm8yBK7u2SoD1wpBRRgTcv94ctmyKUd0fmw=;
        b=CcURdyHgCwCK8GMxzcGnknGBBPMTwWdFOULNhk2CMGA9eNSPqmZiBVd3jHvPSmU9MI
         dbQO7LqHTLAHa+dfdnFa0L9PwwAfsiVRinqXXMoX69vfqqiyjS8AUYDO2SVbMoNOVJCu
         ehXSM6uYmVWJch7vR6V7zR/ZFqu8/YD3dGOjvdyhDTtVLF8Q1HOhAJWvvMqkpbwN/u9I
         +1P6NHum1wd5wCrOftH83qkT6CO3parKTYVbZnsP6Rb/+R1aqXtzMf9v4aIYZ2BAPeaU
         dniGROIorhvmJ5ZB+iKIIeEuPS7J3Ulm9Jy7WMiLapfAX4Q9CGVWgDtLOUU4+h37jles
         S67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gxEXJk+/Nm8yBK7u2SoD1wpBRRgTcv94ctmyKUd0fmw=;
        b=q6tS5OP6G5HyaY48vZqMUckHwd79gyU4v4AwsMtC/oOwJsJlHJMXK589uYEBMF39cf
         yl2Biw5mh9821qDbYyfefCFpoyiywbFO/MQ490hjY9n26DebdEoD564gwuPGJxB+oJFK
         PaIuiu12bNTcwDRFETg5XnfalCMQ2sbAnyL5UdpCSO4xNYc6cYIqH6JmWkAGLQQXnwJ9
         fbYyNpjK8W5EqUazVmgNOm24fY/mNMnybX7ZkjhLb2dryF4GZG6dSoPrRKLSqMrG3MD7
         KQKP8KsFwb6x2+y9LnZQoS5B129vJl+sbOvte8gGFynms7bn1tuB4VBTKulAQreRfk/N
         uMbw==
X-Gm-Message-State: AOAM530PIg/iU3YYVUz/7prYdxLA3XbeiENfxZ6Cgy5lNLoANKrVLqp/
	X7h/4DE5DfY4Z3Bx8uT92Ws=
X-Google-Smtp-Source: ABdhPJxYV7070hQNJD/zZLe7xYf3MLYW9fX8k8PnMAVuMRfSxCX0E47xMnIHTAR699WJSSqsmS70Xg==
X-Received: by 2002:a19:7404:: with SMTP id v4mr22825443lfe.76.1637848893098;
        Thu, 25 Nov 2021 06:01:33 -0800 (PST)
Subject: Re: [PATCH V3 4/6] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
 <1637787223-21129-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2111241701240.1412361@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c2e8c00a-3856-8330-8e8f-ab8a92e93e47@gmail.com>
Date: Thu, 25 Nov 2021 16:01:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111241701240.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 25.11.21 03:03, Stefano Stabellini wrote:

Hi Stefano, all

> On Wed, 24 Nov 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The main reason of this change is that unpopulated-alloc
>> code cannot be used in its current form on Arm, but there
>> is a desire to reuse it to avoid wasting real RAM pages
>> for the grant/foreign mappings.
>>
>> The problem is that system "iomem_resource" is used for
>> the address space allocation, but the really unallocated
>> space can't be figured out precisely by the domain on Arm
>> without hypervisor involvement. For example, not all device
>> I/O regions are known by the time domain starts creating
>> grant/foreign mappings. And following the advise from
>> "iomem_resource" we might end up reusing these regions by
>> a mistake. So, the hypervisor which maintains the P2M for
>> the domain is in the best position to provide unused regions
>> of guest physical address space which could be safely used
>> to create grant/foreign mappings.
>>
>> Introduce new helper arch_xen_unpopulated_init() which purpose
>> is to create specific Xen resource based on the memory regions
>> provided by the hypervisor to be used as unused space for Xen
>> scratch pages. If arch doesn't define arch_xen_unpopulated_init()
>> the default "iomem_resource" will be used.
>>
>> Update the arguments list of allocate_resource() in fill_list()
>> to always allocate a region from the hotpluggable range
>> (maximum possible addressable physical memory range for which
>> the linear mapping could be created). If arch doesn't define
>> arch_get_mappable_range() the default range (0,-1) will be used.
>>
>> The behaviour on x86 won't be changed by current patch as both
>> arch_xen_unpopulated_init() and arch_get_mappable_range()
>> are not implemented for it.
>>
>> Also fallback to allocate xenballooned pages (balloon out RAM
>> pages) if we do not have any suitable resource to work with
>> (target_resource is invalid) and as the result we won't be able
>> to provide unpopulated pages on a request.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!


What still worries me is a concern with x86's xen_pvh_gnttab_setup() I 
described in post commit remark ...


>
>
>> ---
>> Please note the following:
>> for V3 arch_xen_unpopulated_init() was moved to init() as was agreed
>> and gained __init specifier. So the target_resource is initialized there.
>>
>> With current patch series applied if CONFIG_XEN_UNPOPULATED_ALLOC
>> is enabled:
>>
>> 1. On Arm, under normal circumstances, the xen_alloc_unpopulated_pages()
>> won't be called “before” arch_xen_unpopulated_init(). It will only be
>> called "before" when either ACPI is in use or something wrong happened
>> with DT (and we failed to read xen_grant_frames), so we fallback to
>> xen_xlate_map_ballooned_pages() in arm/xen/enlighten.c:xen_guest_init(),
>> please see "arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT"
>> for details. But in that case, I think, it doesn't matter much whether
>> xen_alloc_unpopulated_pages() is called "before" of "after" target_resource
>> initialization, as we don't have extended regions in place the target_resource
>> will remain invalid even after initialization, so xen_alloc_ballooned_pages()
>> will be used in both scenarios.
>>
>> 2. On x86, I am not quite sure which modes use unpopulated-alloc (PVH?),
>> but it looks like xen_alloc_unpopulated_pages() can (and will) be called
>> “before” arch_xen_unpopulated_init().
>> At least, I see that xen_xlate_map_ballooned_pages() is called in
>> x86/xen/grant-table.c:xen_pvh_gnttab_setup(). According to the initcall
>> levels for both xen_pvh_gnttab_setup() and init() I expect the former
>> to be called earlier.
>> If it is true, the sentence in the commit description which mentions
>> that “behaviour on x86 is not changed” is not precise. I don’t think
>> it would be correct to fallback to xen_alloc_ballooned_pages() just
>> because we haven’t initialized target_resource yet (on x86 it is just
>> assigning it iomem_resource), at least this doesn't look like an expected
>> behaviour and unlikely would be welcome.
>>
>> I am wondering whether it would be better to move arch_xen_unpopulated_init()
>> to a dedicated init() marked with an appropriate initcall level (early_initcall?)
>> to make sure it will always be called *before* xen_xlate_map_ballooned_pages().
>> What do you think?

    ... here (#2). Or I really missed something and there wouldn't be an 
issue?


>>
>> Changes RFC -> V2:
>>     - new patch, instead of
>>      "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space"
>>
>> Changes V2 -> V3:
>>     - update patch description and comments in code
>>     - modify arch_xen_unpopulated_init() to pass target_resource as an argument
>>       and update default helper to assign iomem_resource to it, also drop
>>       xen_resource as it will be located in arch code in the future
>>     - allocate region from hotpluggable range instead of hardcoded range (0,-1)
>>       in fill_list()
>>     - use %pR specifier in error message
>>     - do not call unpopulated_init() at runtime from xen_alloc_unpopulated_pages(),
>>       drop an extra helper and call arch_xen_unpopulated_init() directly from __init()
>>     - include linux/ioport.h instead of forward declaration of struct resource
>>     - replace insert_resource() with request_resource() in fill_list()
>>     - add __init specifier to arch_xen_unpopulated_init()
>> ---
>>   drivers/xen/unpopulated-alloc.c | 83 +++++++++++++++++++++++++++++++++++++----
>>   include/xen/xen.h               |  2 +
>>   2 files changed, 78 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
>> index a03dc5b..07d3578 100644
>> --- a/drivers/xen/unpopulated-alloc.c
>> +++ b/drivers/xen/unpopulated-alloc.c
>> @@ -8,6 +8,7 @@
>>   
>>   #include <asm/page.h>
>>   
>> +#include <xen/balloon.h>
>>   #include <xen/page.h>
>>   #include <xen/xen.h>
>>   
>> @@ -15,13 +16,29 @@ static DEFINE_MUTEX(list_lock);
>>   static struct page *page_list;
>>   static unsigned int list_count;
>>   
>> +static struct resource *target_resource;
>> +
>> +/*
>> + * If arch is not happy with system "iomem_resource" being used for
>> + * the region allocation it can provide it's own view by creating specific
>> + * Xen resource with unused regions of guest physical address space provided
>> + * by the hypervisor.
>> + */
>> +int __weak __init arch_xen_unpopulated_init(struct resource **res)
>> +{
>> +	*res = &iomem_resource;
>> +
>> +	return 0;
>> +}
>> +
>>   static int fill_list(unsigned int nr_pages)
>>   {
>>   	struct dev_pagemap *pgmap;
>> -	struct resource *res;
>> +	struct resource *res, *tmp_res = NULL;
>>   	void *vaddr;
>>   	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
>> -	int ret = -ENOMEM;
>> +	struct range mhp_range;
>> +	int ret;
>>   
>>   	res = kzalloc(sizeof(*res), GFP_KERNEL);
>>   	if (!res)
>> @@ -30,14 +47,40 @@ static int fill_list(unsigned int nr_pages)
>>   	res->name = "Xen scratch";
>>   	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>>   
>> -	ret = allocate_resource(&iomem_resource, res,
>> -				alloc_pages * PAGE_SIZE, 0, -1,
>> +	mhp_range = mhp_get_pluggable_range(true);
>> +
>> +	ret = allocate_resource(target_resource, res,
>> +				alloc_pages * PAGE_SIZE, mhp_range.start, mhp_range.end,
>>   				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
>>   	if (ret < 0) {
>>   		pr_err("Cannot allocate new IOMEM resource\n");
>>   		goto err_resource;
>>   	}
>>   
>> +	/*
>> +	 * Reserve the region previously allocated from Xen resource to avoid
>> +	 * re-using it by someone else.
>> +	 */
>> +	if (target_resource != &iomem_resource) {
>> +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
>> +		if (!res) {
>> +			ret = -ENOMEM;
>> +			goto err_insert;
>> +		}
>> +
>> +		tmp_res->name = res->name;
>> +		tmp_res->start = res->start;
>> +		tmp_res->end = res->end;
>> +		tmp_res->flags = res->flags;
>> +
>> +		ret = request_resource(&iomem_resource, tmp_res);
>> +		if (ret < 0) {
>> +			pr_err("Cannot request resource %pR (%d)\n", tmp_res, ret);
>> +			kfree(tmp_res);
>> +			goto err_insert;
>> +		}
>> +	}
>> +
>>   	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
>>   	if (!pgmap) {
>>   		ret = -ENOMEM;
>> @@ -95,6 +138,11 @@ static int fill_list(unsigned int nr_pages)
>>   err_memremap:
>>   	kfree(pgmap);
>>   err_pgmap:
>> +	if (tmp_res) {
>> +		release_resource(tmp_res);
>> +		kfree(tmp_res);
>> +	}
>> +err_insert:
>>   	release_resource(res);
>>   err_resource:
>>   	kfree(res);
>> @@ -112,6 +160,14 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>>   	unsigned int i;
>>   	int ret = 0;
>>   
>> +	/*
>> +	 * Fallback to default behavior if we do not have any suitable resource
>> +	 * to allocate required region from and as the result we won't be able to
>> +	 * construct pages.
>> +	 */
>> +	if (!target_resource)
>> +		return xen_alloc_ballooned_pages(nr_pages, pages);
>> +
>>   	mutex_lock(&list_lock);
>>   	if (list_count < nr_pages) {
>>   		ret = fill_list(nr_pages - list_count);
>> @@ -159,6 +215,11 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>>   {
>>   	unsigned int i;
>>   
>> +	if (!target_resource) {
>> +		xen_free_ballooned_pages(nr_pages, pages);
>> +		return;
>> +	}
>> +
>>   	mutex_lock(&list_lock);
>>   	for (i = 0; i < nr_pages; i++) {
>>   		pages[i]->zone_device_data = page_list;
>> @@ -169,9 +230,11 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>>   }
>>   EXPORT_SYMBOL(xen_free_unpopulated_pages);
>>   
>> -#ifdef CONFIG_XEN_PV
>>   static int __init init(void)
>>   {
>> +	int ret;
>> +
>> +#ifdef CONFIG_XEN_PV
>>   	unsigned int i;
>>   
>>   	if (!xen_domain())
>> @@ -196,8 +259,14 @@ static int __init init(void)
>>   			list_count++;
>>   		}
>>   	}
>> +#endif
>>   
>> -	return 0;
>> +	ret = arch_xen_unpopulated_init(&target_resource);
>> +	if (ret) {
>> +		pr_err("xen:unpopulated: Cannot initialize target resource\n");
>> +		target_resource = NULL;
>> +	}
>> +
>> +	return ret;
>>   }
>>   subsys_initcall(init);
>> -#endif
>> diff --git a/include/xen/xen.h b/include/xen/xen.h
>> index 86c5b37..a99bab8 100644
>> --- a/include/xen/xen.h
>> +++ b/include/xen/xen.h
>> @@ -55,6 +55,8 @@ extern u64 xen_saved_max_mem_size;
>>   #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>>   int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>>   void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>> +#include <linux/ioport.h>
>> +int arch_xen_unpopulated_init(struct resource **res);
>>   #else
>>   #include <xen/balloon.h>
>>   static inline int xen_alloc_unpopulated_pages(unsigned int nr_pages,
>> -- 
>> 2.7.4

-- 
Regards,

Oleksandr Tyshchenko


