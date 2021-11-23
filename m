Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53D45A933
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229780.397285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYwC-00032b-4G; Tue, 23 Nov 2021 16:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229780.397285; Tue, 23 Nov 2021 16:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYwC-0002zC-0F; Tue, 23 Nov 2021 16:46:32 +0000
Received: by outflank-mailman (input) for mailman id 229780;
 Tue, 23 Nov 2021 16:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZo3=QK=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpYwA-0002z4-Hb
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:46:30 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7833a3b-4c7c-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 17:46:28 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id t5so95179796edd.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 08:46:28 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id hd15sm5782961ejc.69.2021.11.23.08.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 08:46:27 -0800 (PST)
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
X-Inumbo-ID: e7833a3b-4c7c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YYCG1Aq+fhWF5Zatko4LyF8TxGDWbc6pgSnyKGakjLA=;
        b=Pecn0LQk7pLV7vEF34B7fFT6PLTAZ5wI9cWkyC298OB9kO1VBv86+Vd6/fl2tQA6D4
         6iPsRg0T8dXadXh4nNwJc1oP8NNqokfjWidAz4bYxXLMbzHR6l1wsKhk5h+lBrbQT88s
         qdSdyAXQ0f1zY5xf7PiL0Dr8ZkXca0nuhneSpSimB1VwJRRgNy5iQrbVuKU130AAnntp
         NJb+2wCra7CzrjOnrLNOHXm8ImYHG/pggJinNCHJd05egAIH02RGp6f3Ue1fytGoFXDk
         lG+7b7jArUf+Xo8NdiXUHNuEO+QAynDywnc6xJ5XkPupWmjdY1Ojqm0m5AtoVYzAtN3I
         y9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YYCG1Aq+fhWF5Zatko4LyF8TxGDWbc6pgSnyKGakjLA=;
        b=hqCjU5GquID+K1gMeiKKtLEU6neu0t+VvZzUSD4UPudRYYZugfY/YaI6SxNVYP+qu7
         SrdWtZq/Y31ec38Bg/u6KqXB0ThTvuwUx9Ee3hltrokCfQCILzlkiNssTO/rYbtBI/xs
         YpWNtfxAOK/dR/mYBi2vqHSI8S3uGUFiGZ8bz8WR/bWWCxQP97bw3JnP4FI7WNGoXS/7
         6pg6OKzg8xHSGXJiprFm9f43HUYDRZ50prNR29SBWbkM7kO+XiNAuxQ7Woe/08fZ2qeJ
         0DdmHdsu2+oEm3CK2QbBat6FSfRhOYSygBESaBhLi7xn6Z08iDw9i+K2Ar4CPtmm4ij/
         ygSA==
X-Gm-Message-State: AOAM532k08YprdWSiCQoPxAtqkVa1/5BRF91Ko3BMrXqVcz9MKJVcb/Q
	anIAGSfDDk4GUVc6ej9Z+SI=
X-Google-Smtp-Source: ABdhPJwhvoz71Em4f53Zj7Q2z4DsefzjOEwnXn0XnWroOh34skVwNpgmuxj1i3vLFZv+zA6S659Tnw==
X-Received: by 2002:a05:6402:350a:: with SMTP id b10mr11635529edd.184.1637685988089;
        Tue, 23 Nov 2021 08:46:28 -0800 (PST)
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110280920110.20134@sstabellini-ThinkPad-T480s>
 <1d122e60-df9c-2ac6-8148-f6a836b9e51d@gmail.com>
 <alpine.DEB.2.22.394.2111181642340.1412361@ubuntu-linux-20-04-desktop>
 <f1f1025b-911d-3d27-f408-9c042bc4fca4@gmail.com>
 <alpine.DEB.2.22.394.2111191809100.1412361@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <76163855-c5eb-05db-2f39-3c6bfee46345@gmail.com>
Date: Tue, 23 Nov 2021 18:46:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111191809100.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.11.21 04:19, Stefano Stabellini wrote:

Hi Stefano, Juergen, all


> Juergen please see the bottom of the email
>
> On Fri, 19 Nov 2021, Oleksandr wrote:
>> On 19.11.21 02:59, Stefano Stabellini wrote:
>>> On Tue, 9 Nov 2021, Oleksandr wrote:
>>>> On 28.10.21 19:37, Stefano Stabellini wrote:
>>>>
>>>> Hi Stefano
>>>>
>>>> I am sorry for the late response.
>>>>
>>>>> On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> The main reason of this change is that unpopulated-alloc
>>>>>> code cannot be used in its current form on Arm, but there
>>>>>> is a desire to reuse it to avoid wasting real RAM pages
>>>>>> for the grant/foreign mappings.
>>>>>>
>>>>>> The problem is that system "iomem_resource" is used for
>>>>>> the address space allocation, but the really unallocated
>>>>>> space can't be figured out precisely by the domain on Arm
>>>>>> without hypervisor involvement. For example, not all device
>>>>>> I/O regions are known by the time domain starts creating
>>>>>> grant/foreign mappings. And following the advise from
>>>>>> "iomem_resource" we might end up reusing these regions by
>>>>>> a mistake. So, the hypervisor which maintains the P2M for
>>>>>> the domain is in the best position to provide unused regions
>>>>>> of guest physical address space which could be safely used
>>>>>> to create grant/foreign mappings.
>>>>>>
>>>>>> Introduce new helper arch_xen_unpopulated_init() which purpose
>>>>>> is to create specific Xen resource based on the memory regions
>>>>>> provided by the hypervisor to be used as unused space for Xen
>>>>>> scratch pages.
>>>>>>
>>>>>> If arch doesn't implement arch_xen_unpopulated_init() to
>>>>>> initialize Xen resource the default "iomem_resource" will be used.
>>>>>> So the behavior on x86 won't be changed.
>>>>>>
>>>>>> Also fall back to allocate xenballooned pages (steal real RAM
>>>>>> pages) if we do not have any suitable resource to work with and
>>>>>> as the result we won't be able to provide unpopulated pages.
>>>>>>
>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>> ---
>>>>>> Changes RFC -> V2:
>>>>>>       - new patch, instead of
>>>>>>        "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to
>>>>>> provide
>>>>>> unallocated space"
>>>>>> ---
>>>>>>     drivers/xen/unpopulated-alloc.c | 89
>>>>>> +++++++++++++++++++++++++++++++++++++++--
>>>>>>     include/xen/xen.h               |  2 +
>>>>>>     2 files changed, 88 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/xen/unpopulated-alloc.c
>>>>>> b/drivers/xen/unpopulated-alloc.c
>>>>>> index a03dc5b..1f1d8d8 100644
>>>>>> --- a/drivers/xen/unpopulated-alloc.c
>>>>>> +++ b/drivers/xen/unpopulated-alloc.c
>>>>>> @@ -8,6 +8,7 @@
>>>>>>       #include <asm/page.h>
>>>>>>     +#include <xen/balloon.h>
>>>>>>     #include <xen/page.h>
>>>>>>     #include <xen/xen.h>
>>>>>>     @@ -15,13 +16,29 @@ static DEFINE_MUTEX(list_lock);
>>>>>>     static struct page *page_list;
>>>>>>     static unsigned int list_count;
>>>>>>     +static struct resource *target_resource;
>>>>>> +static struct resource xen_resource = {
>>>>>> +	.name = "Xen unused space",
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * If arch is not happy with system "iomem_resource" being used for
>>>>>> + * the region allocation it can provide it's own view by initializing
>>>>>> + * "xen_resource" with unused regions of guest physical address space
>>>>>> + * provided by the hypervisor.
>>>>>> + */
>>>>>> +int __weak arch_xen_unpopulated_init(struct resource *res)
>>>>>> +{
>>>>>> +	return -ENOSYS;
>>>>>> +}
>>>>>> +
>>>>>>     static int fill_list(unsigned int nr_pages)
>>>>>>     {
>>>>>>     	struct dev_pagemap *pgmap;
>>>>>> -	struct resource *res;
>>>>>> +	struct resource *res, *tmp_res = NULL;
>>>>>>     	void *vaddr;
>>>>>>     	unsigned int i, alloc_pages = round_up(nr_pages,
>>>>>> PAGES_PER_SECTION);
>>>>>> -	int ret = -ENOMEM;
>>>>>> +	int ret;
>>>>>>       	res = kzalloc(sizeof(*res), GFP_KERNEL);
>>>>>>     	if (!res)
>>>>>> @@ -30,7 +47,7 @@ static int fill_list(unsigned int nr_pages)
>>>>>>     	res->name = "Xen scratch";
>>>>>>     	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>>>>>>     -	ret = allocate_resource(&iomem_resource, res,
>>>>>> +	ret = allocate_resource(target_resource, res,
>>>>>>     				alloc_pages * PAGE_SIZE, 0, -1,
>>>>>>     				PAGES_PER_SECTION * PAGE_SIZE, NULL,
>>>>>> NULL);
>>>>>>     	if (ret < 0) {
>>>>>> @@ -38,6 +55,31 @@ static int fill_list(unsigned int nr_pages)
>>>>>>     		goto err_resource;
>>>>>>     	}
>>>>>>     +	/*
>>>>>> +	 * Reserve the region previously allocated from Xen resource
>>>>>> to avoid
>>>>>> +	 * re-using it by someone else.
>>>>>> +	 */
>>>>>> +	if (target_resource != &iomem_resource) {
>>>>>> +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
>>>>>> +		if (!res) {
>>>>>> +			ret = -ENOMEM;
>>>>>> +			goto err_insert;
>>>>>> +		}
>>>>>> +
>>>>>> +		tmp_res->name = res->name;
>>>>>> +		tmp_res->start = res->start;
>>>>>> +		tmp_res->end = res->end;
>>>>>> +		tmp_res->flags = res->flags;
>>>>>> +
>>>>>> +		ret = insert_resource(&iomem_resource, tmp_res);
>>>>>> +		if (ret < 0) {
>>>>>> +			pr_err("Cannot insert IOMEM resource [%llx -
>>>>>> %llx]\n",
>>>>>> +			       tmp_res->start, tmp_res->end);
>>>>>> +			kfree(tmp_res);
>>>>>> +			goto err_insert;
>>>>>> +		}
>>>>>> +	}
>>>>> I am a bit confused.. why do we need to do this? Who could be
>>>>> erroneously re-using the region? Are you saying that the next time
>>>>> allocate_resource is called it could find the same region again? It
>>>>> doesn't seem possible?
>>>> No, as I understand the allocate_resource() being called for the same root
>>>> resource won't provide the same region... We only need to do this (insert
>>>> the
>>>> region into "iomem_resource") if we allocated it from our *internal*
>>>> "xen_resource", as *global* "iomem_resource" (which is used everywhere) is
>>>> not
>>>> aware of that region has been already allocated. So inserting a region
>>>> here we
>>>> reserving it, otherwise it could be reused elsewhere.
>>> But elsewhere where?
>> I think, theoretically everywhere where allocate_resource(&iomem_resource,
>> ...) is called.
>>
>>
>>> Let's say that allocate_resource allocates a range from xen_resource.
>>>   From reading the code, it doesn't look like iomem_resource would have
>>> that range because the extended regions described under /hypervisor are
>>> not added automatically to iomem_resource.
>>>
>>> So what if we don't call insert_resource? Nothing could allocate the
>>> same range because iomem_resource doesn't have it at all and
>>> xen_resource is not used anywhere if not here.
>>>
>>> What am I missing?
>>
>> Below my understanding which, of course, might be wrong.
>>
>> If we don't claim resource by calling insert_resource (or even
>> request_resource) here then the same range could be allocated everywhere where
>> allocate_resource(&iomem_resource, ...) is called.
>> I don't see what prevents the same range from being allocated. Why actually
>> allocate_resource(&iomem_resource, ...) can't provide the same range if it is
>> free (not-reserved-yet) from it's PoV? The comment above allocate_resource()
>> says "allocate empty slot in the resource tree given range & alignment". So
>> this "empty slot" could be exactly the same range.
>>
>> I experimented with that a bit trying to call
>> allocate_resource(&iomem_resource, ...) several times in another place to see
>> what ranges it returns in both cases (w/ and w/o calling insert_resource
>> here). So an experiment confirmed (of course, if I made it correctly) that the
>> same range could be allocated if we didn't call insert_resource() here. And as
>> I understand there is nothing strange here, as iomem_resource covers all
>> address space initially (0, -1) and everything *not* inserted/requested (in
>> other words, reserved) yet is considered as free and could be provided if fits
>> constraints. Or I really missed something?
> Thanks for the explanation! It was me that didn't know that
> iomem_resource covers all the address space initially. I thought it was
> populated only with actual iomem ranges. Now it makes sense, thanks!
>
>
>> It feels to me that it would be better to call request_resource() instead of
>> insert_resource(). It seems, that if no conflict happens both functions will
>> behave in same way, but in case of conflict if the conflicting resource
>> entirely fit the new resource the former will return an error. I think, this
>> way we will be able to detect that a range we are trying to reserve is already
>> present and bail out early.
>>
>>
>>> Or maybe it is the other way around: core Linux code assumes everything
>>> is described in iomem_resource so something under kernel/ or mm/ would
>>> crash if we start using a page pointing to an address missing from
>>> iomem_resource?
>>>      
>>>>>>     	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
>>>>>>     	if (!pgmap) {
>>>>>>     		ret = -ENOMEM;
>>>>>> @@ -95,12 +137,40 @@ static int fill_list(unsigned int nr_pages)
>>>>>>     err_memremap:
>>>>>>     	kfree(pgmap);
>>>>>>     err_pgmap:
>>>>>> +	if (tmp_res) {
>>>>>> +		release_resource(tmp_res);
>>>>>> +		kfree(tmp_res);
>>>>>> +	}
>>>>>> +err_insert:
>>>>>>     	release_resource(res);
>>>>>>     err_resource:
>>>>>>     	kfree(res);
>>>>>>     	return ret;
>>>>>>     }
>>>>>>     +static void unpopulated_init(void)
>>>>>> +{
>>>>>> +	static bool inited = false;
>>>>> initialized = false
>>>> ok.
>>>>
>>>>
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (inited)
>>>>>> +		return;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Try to initialize Xen resource the first and fall back to
>>>>>> default
>>>>>> +	 * resource if arch doesn't offer one.
>>>>>> +	 */
>>>>>> +	ret = arch_xen_unpopulated_init(&xen_resource);
>>>>>> +	if (!ret)
>>>>>> +		target_resource = &xen_resource;
>>>>>> +	else if (ret == -ENOSYS)
>>>>>> +		target_resource = &iomem_resource;
>>>>>> +	else
>>>>>> +		pr_err("Cannot initialize Xen resource\n");
>>>>>> +
>>>>>> +	inited = true;
>>>>>> +}
>>>>> Would it make sense to call unpopulated_init from an init function,
>>>>> rather than every time xen_alloc_unpopulated_pages is called?
>>>> Good point, thank you. Will do. To be honest, I also don't like the
>>>> current
>>>> approach much.
>>>>
>>>>
>>>>>>     /**
>>>>>>      * xen_alloc_unpopulated_pages - alloc unpopulated pages
>>>>>>      * @nr_pages: Number of pages
>>>>>> @@ -112,6 +182,16 @@ int xen_alloc_unpopulated_pages(unsigned int
>>>>>> nr_pages, struct page **pages)
>>>>>>     	unsigned int i;
>>>>>>     	int ret = 0;
>>>>>>     +	unpopulated_init();
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Fall back to default behavior if we do not have any
>>>>>> suitable
>>>>>> resource
>>>>>> +	 * to allocate required region from and as the result we won't
>>>>>> be able
>>>>>> to
>>>>>> +	 * construct pages.
>>>>>> +	 */
>>>>>> +	if (!target_resource)
>>>>>> +		return alloc_xenballooned_pages(nr_pages, pages);
>>>>> The commit message says that the behavior on x86 doesn't change but this
>>>>> seems to be a change that could impact x86?
>>>> I don't think, however I didn't tested on x86 and might be wrong, but
>>>> according to the current patch, on x86 the "target_resource" is always
>>>> valid
>>>> and points to the "iomem_resource" as arch_xen_unpopulated_init() is not
>>>> implemented. So there won't be any fallback to use
>>>> alloc_(free)_xenballooned_pages() here and fill_list() will behave as
>>>> usual.
>>>    If target_resource is always valid, then we don't need this special
>>> check. In fact, the condition should never be true.
>>
>> The target_resource is always valid and points to the "iomem_resource" on x86
>> (this is equivalent to the behavior before this patch).
>> On Arm target_resource might be NULL if arch_xen_unpopulated_init() failed,
>> for example, if no extended regions reported by the hypervisor.
>> We cannot use "iomem_resource" on Arm, only a resource constructed from
>> extended regions. This is why I added that check (and fallback to xenballooned
>> pages).
>> What I was thinking is that in case of using old Xen (although we would need
>> to balloon out RAM pages) we still would be able to keep working, so no need
>> to disable CONFIG_XEN_UNPOPULATED_ALLOC on such setups.
>>   
>>     
>>>> You raised a really good question, on Arm we need a fallback to balloon
>>>> out
>>>> RAM pages again if hypervisor doesn't provide extended regions (we run on
>>>> old
>>>> version, no unused regions with reasonable size, etc), so I decided to put
>>>> a
>>>> fallback code here, an indicator of the failure is invalid
>>>> "target_resource".
>>> I think it is unnecessary as we already assume today that
>>> &iomem_resource is always available.
>>>> I noticed the patch which is about to be upstreamed that removes
>>>> alloc_(free)xenballooned_pages API [1]. Right now I have no idea how/where
>>>> this fallback could be implemented as this is under build option control
>>>> (CONFIG_XEN_UNPOPULATED_ALLOC). So the API with the same name is either
>>>> used
>>>> for unpopulated pages (if set) or ballooned pages (if not set). I would
>>>> appreciate suggestions regarding that. I am wondering would it be possible
>>>> and
>>>> correctly to have both mechanisms (unpopulated and ballooned) enabled by
>>>> default and some init code to decide which one to use at runtime or some
>>>> sort?
>>> I would keep it simple and remove the fallback from this patch. So:
>>>
>>> - if not CONFIG_XEN_UNPOPULATED_ALLOC, then balloon
>>> - if CONFIG_XEN_UNPOPULATED_ALLOC, then
>>>       - xen_resource if present
>>>       - otherwise iomem_resource
>> Unfortunately, we cannot use iomem_resource on Arm safely, either xen_resource
>> or fail (if no fallback exists).
>>
>>
>>> The xen_resource/iomem_resource config can be done at init time using
>>> target_resource. At runtime, target_resource is always != NULL so we
>>> just go ahead and use it.
>>
>> Thank you for the suggestion. OK, let's keep it simple and drop fallback
>> attempts for now. With one remark:
>> We will make CONFIG_XEN_UNPOPULATED_ALLOC disabled by default on Arm in next
>> patch. So by default everything will behave as usual on Arm (balloon out RAM
>> pages),
>> if user knows for sure that Xen reports extended regions, he/she can enable
>> the config. This way we won't break anything. What do you think?
> Actually after reading your replies and explanation I changed opinion: I
> think we do need the fallback because Linux cannot really assume that
> it is running on "new Xen" so it definitely needs to keep working if
> CONFIG_XEN_UNPOPULATED_ALLOC is enabled and the extended regions are not
> advertised.
>
> I think we'll have to roll back some of the changes introduced by
> 121f2faca2c0a. That's because even if CONFIG_XEN_UNPOPULATED_ALLOC is
> enabled we cannot know if we can use unpopulated-alloc or whether we
> have to use alloc_xenballooned_pages until we parse the /hypervisor node
> in device tree at runtime.

Exactly!


>
> In short, we cannot switch between unpopulated-alloc and
> alloc_xenballooned_pages at build time, we have to do it at runtime
> (boot time).

+1


I created a patch to partially revert 121f2faca2c0a "xen/balloon: rename 
alloc/free_xenballooned_pages".

If there is no objections I will add it to V3 (which is almost ready, 
except the fallback bits). Could you please tell me what do you think?


 From dc79bcd425358596d95e715a8bd8b81deaaeb703 Mon Sep 17 00:00:00 2001
From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date: Tue, 23 Nov 2021 18:14:41 +0200
Subject: [PATCH] xen/balloon: Bring alloc(free)_xenballooned_pages helpers
  back

This patch rolls back some of the changes introduced by commit
121f2faca2c0a "xen/balloon: rename alloc/free_xenballooned_pages"
in order to make possible to still allocate xenballooned pages
if CONFIG_XEN_UNPOPULATED_ALLOC is enabled.

On Arm the unpopulated pages will be allocated on top of extended
regions provided by Xen via device-tree (the subsequent patches
will add required bits to support unpopulated-alloc feature on Arm).
The problem is that extended regions feature has been introduced
into Xen quite recently (during 4.16 release cycle). So this
effectively means that Linux must only use unpopulated-alloc on Arm
if it is running on "new Xen" which advertises these regions.
But, it will only be known after parsing the "hypervisor" node
at boot time, so before doing that we cannot assume anything.

In order to keep working if CONFIG_XEN_UNPOPULATED_ALLOC is enabled
and the extended regions are not advertised (Linux is running on
"old Xen", etc) we need the fallback to alloc_xenballooned_pages().

This way we wouldn't reduce the amount of memory usable (wasting
RAM pages) for any of the external mappings anymore (and eliminate
XSA-300) with "new Xen", but would be still functional ballooning
out RAM pages with "old Xen".

Also rename alloc(free)_xenballooned_pages to 
xen_alloc(free)_ballooned_pages.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
  drivers/xen/balloon.c | 20 +++++++++-----------
  include/xen/balloon.h |  3 +++
  include/xen/xen.h     |  6 ++++++
  3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index ba2ea11..a2c4fc49 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -581,7 +581,6 @@ void balloon_set_new_target(unsigned long target)
  }
  EXPORT_SYMBOL_GPL(balloon_set_new_target);

-#ifndef CONFIG_XEN_UNPOPULATED_ALLOC
  static int add_ballooned_pages(unsigned int nr_pages)
  {
      enum bp_state st;
@@ -610,12 +609,12 @@ static int add_ballooned_pages(unsigned int nr_pages)
  }

  /**
- * xen_alloc_unpopulated_pages - get pages that have been ballooned out
+ * xen_alloc_ballooned_pages - get pages that have been ballooned out
   * @nr_pages: Number of pages to get
   * @pages: pages returned
   * @return 0 on success, error otherwise
   */
-int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
+int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages)
  {
      unsigned int pgno = 0;
      struct page *page;
@@ -652,23 +651,23 @@ int xen_alloc_unpopulated_pages(unsigned int 
nr_pages, struct page **pages)
      return 0;
   out_undo:
      mutex_unlock(&balloon_mutex);
-    xen_free_unpopulated_pages(pgno, pages);
+    xen_free_ballooned_pages(pgno, pages);
      /*
-     * NB: free_xenballooned_pages will only subtract pgno pages, but since
+     * NB: xen_free_ballooned_pages will only subtract pgno pages, but 
since
       * target_unpopulated is incremented with nr_pages at the start we 
need
       * to remove the remaining ones also, or accounting will be screwed.
       */
      balloon_stats.target_unpopulated -= nr_pages - pgno;
      return ret;
  }
-EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
+EXPORT_SYMBOL(xen_alloc_ballooned_pages);

  /**
- * xen_free_unpopulated_pages - return pages retrieved with 
get_ballooned_pages
+ * xen_free_ballooned_pages - return pages retrieved with 
get_ballooned_pages
   * @nr_pages: Number of pages
   * @pages: pages to return
   */
-void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
+void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages)
  {
      unsigned int i;

@@ -687,9 +686,9 @@ void xen_free_unpopulated_pages(unsigned int 
nr_pages, struct page **pages)

      mutex_unlock(&balloon_mutex);
  }
-EXPORT_SYMBOL(xen_free_unpopulated_pages);
+EXPORT_SYMBOL(xen_free_ballooned_pages);

-#if defined(CONFIG_XEN_PV)
+#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
  static void __init balloon_add_region(unsigned long start_pfn,
                        unsigned long pages)
  {
@@ -712,7 +711,6 @@ static void __init balloon_add_region(unsigned long 
start_pfn,
      balloon_stats.total_pages += extra_pfn_end - start_pfn;
  }
  #endif
-#endif

  static int __init balloon_init(void)
  {
diff --git a/include/xen/balloon.h b/include/xen/balloon.h
index e93d4f0..f78a6cc 100644
--- a/include/xen/balloon.h
+++ b/include/xen/balloon.h
@@ -26,6 +26,9 @@ extern struct balloon_stats balloon_stats;

  void balloon_set_new_target(unsigned long target);

+int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages);
+void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages);
+
  #ifdef CONFIG_XEN_BALLOON
  void xen_balloon_init(void);
  #else
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 9f031b5..410e3e4 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,7 +52,13 @@ bool xen_biovec_phys_mergeable(const struct bio_vec 
*vec1,
  extern u64 xen_saved_max_mem_size;
  #endif

+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
  int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page 
**pages);
  void xen_free_unpopulated_pages(unsigned int nr_pages, struct page 
**pages);
+#else
+#define xen_alloc_unpopulated_pages xen_alloc_ballooned_pages
+#define xen_free_unpopulated_pages xen_free_ballooned_pages
+#include <xen/balloon.h>
+#endif

  #endif    /* _XEN_XEN_H */
-- 
2.7.4



>
> Juergen, what do you think?


-- 
Regards,

Oleksandr Tyshchenko


