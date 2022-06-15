Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA354CEE0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 18:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350249.576537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1W3s-0003j0-PF; Wed, 15 Jun 2022 16:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350249.576537; Wed, 15 Jun 2022 16:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1W3s-0003hE-LA; Wed, 15 Jun 2022 16:40:08 +0000
Received: by outflank-mailman (input) for mailman id 350249;
 Wed, 15 Jun 2022 16:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wv+x=WW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o1W3r-0003ZH-8C
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 16:40:07 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfaa7022-ecc9-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 18:40:05 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id c4so19760442lfj.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jun 2022 09:40:06 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 u18-20020ac25192000000b0047255d211cesm1851391lfi.253.2022.06.15.09.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 09:40:05 -0700 (PDT)
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
X-Inumbo-ID: cfaa7022-ecc9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MWANSzdRAOWKpopzWH4swQNo/XxRIXruJcTbdkHnuFo=;
        b=nqDPazFgESVPMchw5t1IyLKwSYffE31zuhyigqZoR0u6mWJ5lr0NxjOUBK3WHo8rAt
         lw5lYUMeqvkvM9wee5LNtZMFA/ozRR3JKfgcdoEJWd+n/a/C311MNCxlBSHydx8/VWxX
         eQ536sW66FtzcgyR57uRiUXDmqBfUk2qp/lxdnpk66AVQ590RbOxzfvnh8i9xccgOQjl
         +BeoWeUL0P4hTo632fmXGZJcrMwwsv27jGNv9nju398+9CI2baFqkzNnOat0Kx65Adom
         xpAnieakVJxYSAjEBMjHxXnxSskdIWPSl4dbTXZnihYWYkeX6+LKOUWgw0+v9tEb8+jI
         sS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MWANSzdRAOWKpopzWH4swQNo/XxRIXruJcTbdkHnuFo=;
        b=gk5kejkrlMCEZ0ft3qLIaDTJaLg5rvrxqHC3O6bdvowc5kJfaS0pvBLgB4QbcjbnOD
         9Frvj1NUqL5V8D7dGLt9MF6RpbdWLPlAj860yCAkiL9VLEBkFcPPJyfXsGRoheydbk58
         K1Gkrx93i6/RUP80IiqGrAwcak45jwEZgOHQ3rdwAW/rde7EiDB5qbMEtLkCFEGZN2a5
         fy6a3YeHo4vrIKkCR/IP7mBkA9Io5sRfD0jQhK0x3Sg6ReKJtg/z/DIzOWVPGizZHfv/
         Zcasght2bTChaXGGnCp98G3SzT6jfeHm0/taby1WwR3abcXWwz4X54gBi1D0W7J0u4/m
         NuhA==
X-Gm-Message-State: AJIora+8pC8gTURaIJsfgOQxzKKJ6trE2ZheLrbiQZ3F43jwqFateSW3
	MdzemdVHqzPW08Fts6H9MkQ=
X-Google-Smtp-Source: AGRyM1tajAVsOPq2QGMUHcUpNqZOlXppdM2bBQzKlxoCKdKoIfE+blT5jZUZrimz0oNBnRyTWdWwVw==
X-Received: by 2002:a05:6512:3484:b0:47d:451e:3d53 with SMTP id v4-20020a056512348400b0047d451e3d53mr235059lfr.144.1655311205711;
        Wed, 15 Jun 2022 09:40:05 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] xen/grant-table: Use unpopulated DMAable pages
 instead of real RAM ones
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <1652810658-27810-1-git-send-email-olekstysh@gmail.com>
 <1652810658-27810-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2206031348230.2783803@ubuntu-linux-20-04-desktop>
 <7f886dfb-2b42-bc70-d55f-14ecd8144e3e@gmail.com>
 <alpine.DEB.2.22.394.2206101644210.756493@ubuntu-linux-20-04-desktop>
 <1266f8cb-bbd6-d952-3108-89665ce76fec@gmail.com>
 <alpine.DEB.2.22.394.2206141748150.1837490@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9f1e4568-1cfd-e967-e54c-735bad1ea211@gmail.com>
Date: Wed, 15 Jun 2022 19:40:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2206141748150.1837490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.06.22 03:51, Stefano Stabellini wrote:

Hello Stefano

> On Tue, 14 Jun 2022, Oleksandr wrote:
>> On 11.06.22 02:55, Stefano Stabellini wrote:
>>
>> Hello Stefano
>>
>>> On Thu, 9 Jun 2022, Oleksandr wrote:
>>>> On 04.06.22 00:19, Stefano Stabellini wrote:
>>>> Hello Stefano
>>>>
>>>> Thank you for having a look and sorry for the late response.
>>>>
>>>>> On Tue, 17 May 2022, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> Depends on CONFIG_XEN_UNPOPULATED_ALLOC. If enabled then unpopulated
>>>>>> DMAable (contiguous) pages will be allocated for grant mapping into
>>>>>> instead of ballooning out real RAM pages.
>>>>>>
>>>>>> TODO: Fallback to real RAM pages if xen_alloc_unpopulated_dma_pages()
>>>>>> fails.
>>>>>>
>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>> ---
>>>>>>     drivers/xen/grant-table.c | 27 +++++++++++++++++++++++++++
>>>>>>     1 file changed, 27 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
>>>>>> index 8ccccac..2bb4392 100644
>>>>>> --- a/drivers/xen/grant-table.c
>>>>>> +++ b/drivers/xen/grant-table.c
>>>>>> @@ -864,6 +864,25 @@ EXPORT_SYMBOL_GPL(gnttab_free_pages);
>>>>>>      */
>>>>>>     int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
>>>>>>     {
>>>>>> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>>>>>> +	int ret;
>>>>> This is an alternative implementation of the same function.
>>>> Currently, yes.
>>>>
>>>>
>>>>>     If we are
>>>>> going to use #ifdef, then I would #ifdef the entire function, rather
>>>>> than just the body. Otherwise within the function body we can use
>>>>> IS_ENABLED.
>>>> Good point. Note, there is one missing thing in current patch which is
>>>> described in TODO.
>>>>
>>>> "Fallback to real RAM pages if xen_alloc_unpopulated_dma_pages() fails."
>>>> So I
>>>> will likely use IS_ENABLED within the function body.
>>>>
>>>> If CONFIG_XEN_UNPOPULATED_ALLOC is enabled then gnttab_dma_alloc_pages()
>>>> will
>>>> try to call xen_alloc_unpopulated_dma_pages() the first and if fails then
>>>> fallback to allocate RAM pages and balloon them out.
>>>>
>>>> One moment is not entirely clear to me. If we use fallback in
>>>> gnttab_dma_alloc_pages() then we must use fallback in
>>>> gnttab_dma_free_pages()
>>>> as well, we cannot use xen_free_unpopulated_dma_pages() for real RAM
>>>> pages.
>>>> The question is how to pass this information to the
>>>> gnttab_dma_free_pages()?
>>>> The first idea which comes to mind is to add a flag to struct
>>>> gnttab_dma_alloc_args...
>>>    You can check if the page is within the mhp_range range or part of
>>> iomem_resource? If not, you can free it as a normal page.
>>>
>>> If we do this, then the fallback is better implemented in
>>> unpopulated-alloc.c because that is the one that is aware about
>>> page addresses.
>>
>> I got your idea and agree this can work technically. Or if we finally decide
>> to use the second option (use "dma_pool" for all) in the first patch
>> "[RFC PATCH 1/2] xen/unpopulated-alloc: Introduce helpers for DMA allocations"
>> then we will likely be able to check whether a page in question
>> is within a "dma_pool" using gen_pool_has_addr().
>>
>> I am still wondering, can we avoid the fallback implementation in
>> unpopulated-alloc.c.
>> Because for that purpose we will need to pull more code into
>> unpopulated-alloc.c (to be more precise, almost everything which
>> gnttab_dma_free_pages() already has except gnttab_pages_clear_private()) and
>> pass more arguments to xen_free_unpopulated_dma_pages(). Also I might mistake,
>> but having a fallback split between grant-table.c (to allocate RAM pages in
>> gnttab_dma_alloc_pages()) and unpopulated-alloc.c (to free RAM pages in
>> xen_free_unpopulated_dma_pages()) would look a bit weird.
>>
>> I see two possible options for the fallback implementation in grant-table.c:
>> 1. (less preferable) by introducing new flag in struct gnttab_dma_alloc_args
>> 2. (more preferable) by guessing unpopulated (non real RAM) page using
>> is_zone_device_page(), etc
>>
>>
>> For example, with the second option the resulting code will look quite simple
>> (only build tested):
>>
>> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
>> index 738029d..3bda71f 100644
>> --- a/drivers/xen/grant-table.c
>> +++ b/drivers/xen/grant-table.c
>> @@ -1047,6 +1047,23 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args
>> *args)
>>          size_t size;
>>          int i, ret;
>>
>> +       if (IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC)) {
>> +               ret = xen_alloc_unpopulated_dma_pages(args->dev,
>> args->nr_pages,
>> +                               args->pages);
>> +               if (ret < 0)
>> +                       goto fallback;
>> +
>> +               ret = gnttab_pages_set_private(args->nr_pages, args->pages);
>> +               if (ret < 0)
>> +                       goto fail;
>> +
>> +               args->vaddr = page_to_virt(args->pages[0]);
>> +               args->dev_bus_addr = page_to_phys(args->pages[0]);
>> +
>> +               return ret;
>> +       }
>> +
>> +fallback:
>>          size = args->nr_pages << PAGE_SHIFT;
>>          if (args->coherent)
>>                  args->vaddr = dma_alloc_coherent(args->dev, size,
>> @@ -1103,6 +1120,12 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args
>> *args)
>>
>>          gnttab_pages_clear_private(args->nr_pages, args->pages);
>>
>> +       if (IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC) &&
>> +                       is_zone_device_page(args->pages[0])) {
>> +               xen_free_unpopulated_dma_pages(args->dev, args->nr_pages,
>> args->pages);
>> +               return 0;
>> +       }
>> +
>>          for (i = 0; i < args->nr_pages; i++)
>>                  args->frames[i] = page_to_xen_pfn(args->pages[i]);
>>
>>
>> What do you think?
>   
> I have another idea. Why don't we introduce a function implemented in
> drivers/xen/unpopulated-alloc.c called is_xen_unpopulated_page() and
> call it from here? is_xen_unpopulated_page can be implemented by using
> gen_pool_has_addr.

I like the idea, will do


-- 
Regards,

Oleksandr Tyshchenko


