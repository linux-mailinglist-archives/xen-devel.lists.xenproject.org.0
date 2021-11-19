Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA1457644
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228174.394753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Sr-0001Tr-5B; Fri, 19 Nov 2021 18:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228174.394753; Fri, 19 Nov 2021 18:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Sr-0001Qg-1K; Fri, 19 Nov 2021 18:18:21 +0000
Received: by outflank-mailman (input) for mailman id 228174;
 Fri, 19 Nov 2021 18:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GMHT=QG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mo8Sq-0001Qa-6R
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:18:20 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12313dd9-4965-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 19:18:18 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id y26so47001298lfa.11
 for <xen-devel@lists.xenproject.org>; Fri, 19 Nov 2021 10:18:18 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o9sm54121lfi.182.2021.11.19.10.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 10:18:17 -0800 (PST)
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
X-Inumbo-ID: 12313dd9-4965-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1Sj7cKDDHZ5tNz5j011GwrHTDVtsOHwByLu9tI/Ma5Y=;
        b=OCwTtys2U1rFvLbTOwzWz53eDKuRyTyoIcawZzXloJ2LGts0Ce7xPVigXAQjlYRpo+
         MBj8KpxKsGa7j0UFkiff6woQyMLsh83dHv2s9nnps6e8fLjJ0wejvvGdlkEZSNgmMf6P
         CLmG6uaU8vZfhHk4GTRLmRK6nOIcgq0JPaIaqNMF1F288Mu/Jo8imbjG57H3t3XXIjfS
         JRzFg2yCyLSzulmdkL5h8AQwav9+ttSipXppyI+TA9dvfLn4jyyC/2c2OvkNZI9KoHCV
         Gh8s3nvz0Lr5WY8FScnd3cPvJZ+mxcS4h6nDR7YFkN9wSSxMxvA8/tPwJXdTL/uJz8cv
         QAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1Sj7cKDDHZ5tNz5j011GwrHTDVtsOHwByLu9tI/Ma5Y=;
        b=L69Pky0vAvkPap7sFNi8Pnj1FgvLVHlXRaoNpty0nSOsIBhEIs+cM/J1FYHuZ6JYwC
         490PI7ozda8ljWEbIUdLEQReB6tW4Lu3s/CHx0/RtWLF7hB3szj9PmnOIlJEf/jCCMyJ
         cTLYO2vYsouR82nNWJY5YgLx6LcHqggnPDKOiheEeoJndjFRusn7M3W7xpDL5DIBDB5n
         58N4o9tym16bF4qR7OPUdH4jbHT4YZ6YBOccoJrC95XjeQUoZePW3Zeu2/1GvTc0DB7Q
         23QIXdu3UQO6OxURWZPA5IIIUforRoeeUat1xLFfCalxBZtXH48I5bQhlt21o3NSpMLm
         rkhw==
X-Gm-Message-State: AOAM530otoykEMp2fsOkta6A1iIMX4Osg3IyaknMPR1DMN2BgagLlFC7
	9T/AQnLZjNg6YgFMeGUc/L0=
X-Google-Smtp-Source: ABdhPJzNU/U6MP0A3QqSIot2eKCpw1CX41hseoDEmEZFC01ngF1P8puDg24K1Ae3o4nLIA7GrwUzOA==
X-Received: by 2002:a2e:b163:: with SMTP id a3mr28156520ljm.264.1637345898175;
        Fri, 19 Nov 2021 10:18:18 -0800 (PST)
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110280920110.20134@sstabellini-ThinkPad-T480s>
 <1d122e60-df9c-2ac6-8148-f6a836b9e51d@gmail.com>
 <alpine.DEB.2.22.394.2111181642340.1412361@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f1f1025b-911d-3d27-f408-9c042bc4fca4@gmail.com>
Date: Fri, 19 Nov 2021 20:18:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111181642340.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 19.11.21 02:59, Stefano Stabellini wrote:


Hi Stefano

> On Tue, 9 Nov 2021, Oleksandr wrote:
>> On 28.10.21 19:37, Stefano Stabellini wrote:
>>
>> Hi Stefano
>>
>> I am sorry for the late response.
>>
>>> On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> The main reason of this change is that unpopulated-alloc
>>>> code cannot be used in its current form on Arm, but there
>>>> is a desire to reuse it to avoid wasting real RAM pages
>>>> for the grant/foreign mappings.
>>>>
>>>> The problem is that system "iomem_resource" is used for
>>>> the address space allocation, but the really unallocated
>>>> space can't be figured out precisely by the domain on Arm
>>>> without hypervisor involvement. For example, not all device
>>>> I/O regions are known by the time domain starts creating
>>>> grant/foreign mappings. And following the advise from
>>>> "iomem_resource" we might end up reusing these regions by
>>>> a mistake. So, the hypervisor which maintains the P2M for
>>>> the domain is in the best position to provide unused regions
>>>> of guest physical address space which could be safely used
>>>> to create grant/foreign mappings.
>>>>
>>>> Introduce new helper arch_xen_unpopulated_init() which purpose
>>>> is to create specific Xen resource based on the memory regions
>>>> provided by the hypervisor to be used as unused space for Xen
>>>> scratch pages.
>>>>
>>>> If arch doesn't implement arch_xen_unpopulated_init() to
>>>> initialize Xen resource the default "iomem_resource" will be used.
>>>> So the behavior on x86 won't be changed.
>>>>
>>>> Also fall back to allocate xenballooned pages (steal real RAM
>>>> pages) if we do not have any suitable resource to work with and
>>>> as the result we won't be able to provide unpopulated pages.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> Changes RFC -> V2:
>>>>      - new patch, instead of
>>>>       "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide
>>>> unallocated space"
>>>> ---
>>>>    drivers/xen/unpopulated-alloc.c | 89
>>>> +++++++++++++++++++++++++++++++++++++++--
>>>>    include/xen/xen.h               |  2 +
>>>>    2 files changed, 88 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/xen/unpopulated-alloc.c
>>>> b/drivers/xen/unpopulated-alloc.c
>>>> index a03dc5b..1f1d8d8 100644
>>>> --- a/drivers/xen/unpopulated-alloc.c
>>>> +++ b/drivers/xen/unpopulated-alloc.c
>>>> @@ -8,6 +8,7 @@
>>>>      #include <asm/page.h>
>>>>    +#include <xen/balloon.h>
>>>>    #include <xen/page.h>
>>>>    #include <xen/xen.h>
>>>>    @@ -15,13 +16,29 @@ static DEFINE_MUTEX(list_lock);
>>>>    static struct page *page_list;
>>>>    static unsigned int list_count;
>>>>    +static struct resource *target_resource;
>>>> +static struct resource xen_resource = {
>>>> +	.name = "Xen unused space",
>>>> +};
>>>> +
>>>> +/*
>>>> + * If arch is not happy with system "iomem_resource" being used for
>>>> + * the region allocation it can provide it's own view by initializing
>>>> + * "xen_resource" with unused regions of guest physical address space
>>>> + * provided by the hypervisor.
>>>> + */
>>>> +int __weak arch_xen_unpopulated_init(struct resource *res)
>>>> +{
>>>> +	return -ENOSYS;
>>>> +}
>>>> +
>>>>    static int fill_list(unsigned int nr_pages)
>>>>    {
>>>>    	struct dev_pagemap *pgmap;
>>>> -	struct resource *res;
>>>> +	struct resource *res, *tmp_res = NULL;
>>>>    	void *vaddr;
>>>>    	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
>>>> -	int ret = -ENOMEM;
>>>> +	int ret;
>>>>      	res = kzalloc(sizeof(*res), GFP_KERNEL);
>>>>    	if (!res)
>>>> @@ -30,7 +47,7 @@ static int fill_list(unsigned int nr_pages)
>>>>    	res->name = "Xen scratch";
>>>>    	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>>>>    -	ret = allocate_resource(&iomem_resource, res,
>>>> +	ret = allocate_resource(target_resource, res,
>>>>    				alloc_pages * PAGE_SIZE, 0, -1,
>>>>    				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
>>>>    	if (ret < 0) {
>>>> @@ -38,6 +55,31 @@ static int fill_list(unsigned int nr_pages)
>>>>    		goto err_resource;
>>>>    	}
>>>>    +	/*
>>>> +	 * Reserve the region previously allocated from Xen resource to avoid
>>>> +	 * re-using it by someone else.
>>>> +	 */
>>>> +	if (target_resource != &iomem_resource) {
>>>> +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
>>>> +		if (!res) {
>>>> +			ret = -ENOMEM;
>>>> +			goto err_insert;
>>>> +		}
>>>> +
>>>> +		tmp_res->name = res->name;
>>>> +		tmp_res->start = res->start;
>>>> +		tmp_res->end = res->end;
>>>> +		tmp_res->flags = res->flags;
>>>> +
>>>> +		ret = insert_resource(&iomem_resource, tmp_res);
>>>> +		if (ret < 0) {
>>>> +			pr_err("Cannot insert IOMEM resource [%llx - %llx]\n",
>>>> +			       tmp_res->start, tmp_res->end);
>>>> +			kfree(tmp_res);
>>>> +			goto err_insert;
>>>> +		}
>>>> +	}
>>> I am a bit confused.. why do we need to do this? Who could be
>>> erroneously re-using the region? Are you saying that the next time
>>> allocate_resource is called it could find the same region again? It
>>> doesn't seem possible?
>>
>> No, as I understand the allocate_resource() being called for the same root
>> resource won't provide the same region... We only need to do this (insert the
>> region into "iomem_resource") if we allocated it from our *internal*
>> "xen_resource", as *global* "iomem_resource" (which is used everywhere) is not
>> aware of that region has been already allocated. So inserting a region here we
>> reserving it, otherwise it could be reused elsewhere.
> But elsewhere where?

I think, theoretically everywhere where 
allocate_resource(&iomem_resource, ...) is called.


> Let's say that allocate_resource allocates a range from xen_resource.
>  From reading the code, it doesn't look like iomem_resource would have
> that range because the extended regions described under /hypervisor are
> not added automatically to iomem_resource.
>
> So what if we don't call insert_resource? Nothing could allocate the
> same range because iomem_resource doesn't have it at all and
> xen_resource is not used anywhere if not here.
>
> What am I missing?


Below my understanding which, of course, might be wrong.

If we don't claim resource by calling insert_resource (or even 
request_resource) here then the same range could be allocated everywhere 
where allocate_resource(&iomem_resource, ...) is called.
I don't see what prevents the same range from being allocated. Why 
actually allocate_resource(&iomem_resource, ...) can't provide the same 
range if it is free (not-reserved-yet) from it's PoV? The comment above 
allocate_resource() says "allocate empty slot in the resource tree given 
range & alignment". So this "empty slot" could be exactly the same range.

I experimented with that a bit trying to call 
allocate_resource(&iomem_resource, ...) several times in another place 
to see what ranges it returns in both cases (w/ and w/o calling 
insert_resource here). So an experiment confirmed (of course, if I made 
it correctly) that the same range could be allocated if we didn't call 
insert_resource() here. And as I understand there is nothing strange 
here, as iomem_resource covers all address space initially (0, -1) and 
everything *not* inserted/requested (in other words, reserved) yet is 
considered as free and could be provided if fits constraints. Or I 
really missed something?

It feels to me that it would be better to call request_resource() 
instead of insert_resource(). It seems, that if no conflict happens both 
functions will behave in same way, but in case of conflict if the 
conflicting resource entirely fit the new resource the former will 
return an error. I think, this way we will be able to detect that a 
range we are trying to reserve is already present and bail out early.


>
> Or maybe it is the other way around: core Linux code assumes everything
> is described in iomem_resource so something under kernel/ or mm/ would
> crash if we start using a page pointing to an address missing from
> iomem_resource?
>   
>   
>>>>    	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
>>>>    	if (!pgmap) {
>>>>    		ret = -ENOMEM;
>>>> @@ -95,12 +137,40 @@ static int fill_list(unsigned int nr_pages)
>>>>    err_memremap:
>>>>    	kfree(pgmap);
>>>>    err_pgmap:
>>>> +	if (tmp_res) {
>>>> +		release_resource(tmp_res);
>>>> +		kfree(tmp_res);
>>>> +	}
>>>> +err_insert:
>>>>    	release_resource(res);
>>>>    err_resource:
>>>>    	kfree(res);
>>>>    	return ret;
>>>>    }
>>>>    +static void unpopulated_init(void)
>>>> +{
>>>> +	static bool inited = false;
>>> initialized = false
>> ok.
>>
>>
>>>
>>>> +	int ret;
>>>> +
>>>> +	if (inited)
>>>> +		return;
>>>> +
>>>> +	/*
>>>> +	 * Try to initialize Xen resource the first and fall back to default
>>>> +	 * resource if arch doesn't offer one.
>>>> +	 */
>>>> +	ret = arch_xen_unpopulated_init(&xen_resource);
>>>> +	if (!ret)
>>>> +		target_resource = &xen_resource;
>>>> +	else if (ret == -ENOSYS)
>>>> +		target_resource = &iomem_resource;
>>>> +	else
>>>> +		pr_err("Cannot initialize Xen resource\n");
>>>> +
>>>> +	inited = true;
>>>> +}
>>> Would it make sense to call unpopulated_init from an init function,
>>> rather than every time xen_alloc_unpopulated_pages is called?
>> Good point, thank you. Will do. To be honest, I also don't like the current
>> approach much.
>>
>>
>>>
>>>>    /**
>>>>     * xen_alloc_unpopulated_pages - alloc unpopulated pages
>>>>     * @nr_pages: Number of pages
>>>> @@ -112,6 +182,16 @@ int xen_alloc_unpopulated_pages(unsigned int
>>>> nr_pages, struct page **pages)
>>>>    	unsigned int i;
>>>>    	int ret = 0;
>>>>    +	unpopulated_init();
>>>> +
>>>> +	/*
>>>> +	 * Fall back to default behavior if we do not have any suitable
>>>> resource
>>>> +	 * to allocate required region from and as the result we won't be able
>>>> to
>>>> +	 * construct pages.
>>>> +	 */
>>>> +	if (!target_resource)
>>>> +		return alloc_xenballooned_pages(nr_pages, pages);
>>> The commit message says that the behavior on x86 doesn't change but this
>>> seems to be a change that could impact x86?
>> I don't think, however I didn't tested on x86 and might be wrong, but
>> according to the current patch, on x86 the "target_resource" is always valid
>> and points to the "iomem_resource" as arch_xen_unpopulated_init() is not
>> implemented. So there won't be any fallback to use
>> alloc_(free)_xenballooned_pages() here and fill_list() will behave as usual.
>   
> If target_resource is always valid, then we don't need this special
> check. In fact, the condition should never be true.


The target_resource is always valid and points to the "iomem_resource" 
on x86 (this is equivalent to the behavior before this patch).
On Arm target_resource might be NULL if arch_xen_unpopulated_init() 
failed, for example, if no extended regions reported by the hypervisor.
We cannot use "iomem_resource" on Arm, only a resource constructed from 
extended regions. This is why I added that check (and fallback to 
xenballooned pages).
What I was thinking is that in case of using old Xen (although we would 
need to balloon out RAM pages) we still would be able to keep working, 
so no need to disable CONFIG_XEN_UNPOPULATED_ALLOC on such setups.


>
>
>> You raised a really good question, on Arm we need a fallback to balloon out
>> RAM pages again if hypervisor doesn't provide extended regions (we run on old
>> version, no unused regions with reasonable size, etc), so I decided to put a
>> fallback code here, an indicator of the failure is invalid "target_resource".
> I think it is unnecessary as we already assume today that
> &iomem_resource is always available.
>> I noticed the patch which is about to be upstreamed that removes
>> alloc_(free)xenballooned_pages API [1]. Right now I have no idea how/where
>> this fallback could be implemented as this is under build option control
>> (CONFIG_XEN_UNPOPULATED_ALLOC). So the API with the same name is either used
>> for unpopulated pages (if set) or ballooned pages (if not set). I would
>> appreciate suggestions regarding that. I am wondering would it be possible and
>> correctly to have both mechanisms (unpopulated and ballooned) enabled by
>> default and some init code to decide which one to use at runtime or some sort?
> I would keep it simple and remove the fallback from this patch. So:
>
> - if not CONFIG_XEN_UNPOPULATED_ALLOC, then balloon
> - if CONFIG_XEN_UNPOPULATED_ALLOC, then
>      - xen_resource if present
>      - otherwise iomem_resource

Unfortunately, we cannot use iomem_resource on Arm safely, either 
xen_resource or fail (if no fallback exists).


>
> The xen_resource/iomem_resource config can be done at init time using
> target_resource. At runtime, target_resource is always != NULL so we
> just go ahead and use it.


Thank you for the suggestion. OK, let's keep it simple and drop fallback 
attempts for now. With one remark:
We will make CONFIG_XEN_UNPOPULATED_ALLOC disabled by default on Arm in 
next patch. So by default everything will behave as usual on Arm 
(balloon out RAM pages),
if user knows for sure that Xen reports extended regions, he/she can 
enable the config. This way we won't break anything. What do you think?


[snip]


-- 
Regards,

Oleksandr Tyshchenko


