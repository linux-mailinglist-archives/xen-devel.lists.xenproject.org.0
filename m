Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E04545448
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 20:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345652.571328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzN4G-0005uv-E6; Thu, 09 Jun 2022 18:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345652.571328; Thu, 09 Jun 2022 18:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzN4G-0005s6-AS; Thu, 09 Jun 2022 18:39:40 +0000
Received: by outflank-mailman (input) for mailman id 345652;
 Thu, 09 Jun 2022 18:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3t4G=WQ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nzN4E-0005s0-K3
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 18:39:38 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83319a8d-e823-11ec-8b38-e96605d6a9a5;
 Thu, 09 Jun 2022 20:39:36 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id a15so39315801lfb.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jun 2022 11:39:36 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a2e571c000000b0024f3d1dae7csm3796073ljb.4.2022.06.09.11.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 11:39:35 -0700 (PDT)
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
X-Inumbo-ID: 83319a8d-e823-11ec-8b38-e96605d6a9a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=de7CZ8jeEcERGED2Q96ugWzLITXNhs+e7DuD9EZQpkI=;
        b=Z3UGsAv2k8V7+UhtCeOEPgRUU8g3Gd5ZsoDNWGXDXBx63L2yq4A5L1yAa4y4PlXPC/
         s6sJVvfhSSdKcaZZOPvZNolhW1/I5Ywy0r8A68dG826aaekyPcC+lndkpzjfFIt+IWC0
         CtGS1RgpLSe+QcQ0ORHIYlA9QNWL8a7o8/tjm/U0x5eJ8oYBkPuPuOoiW5W6GnACdHWI
         oXgZ8B40x/z5lyBx4qYrXb7HBFvX6aoHpXuVV3iJBNJnNiz4x8Vd5XdIMJdlPGt0NYM6
         r08cTDfZkgJe4PuW/t6tNa8w1UaVthWe6f+XYpLyZnkQQo7a1qybjxDKPsoUe3pbK8F8
         6XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=de7CZ8jeEcERGED2Q96ugWzLITXNhs+e7DuD9EZQpkI=;
        b=78z83A6AOZ1HFV0kjo/2ntWlViTz+9aEvDjFB8ZOHC6uMSDU4XwCdqVnltsDF7tIQ/
         cJGBywZ92Tp0ZzyoBwaDnhqxMoWqRSfO2VgSXlbbx7X1bBZlUudv16E5YC+NN+1VeN2t
         4kTdBaviJnFiqfCudwk01qJIE/FAhsbMv1JTG90NUrx2OmnIxdkWE13EF8/LLBkDvxi9
         BG5L8FoqN3bqD6w5aSSL/N0Mf3nSZF9cHeMGBj9ucrw5tWH2eFXfI6sNkQbXgc4JDdD4
         eWVQaSnW5qruwjCt+e51Z7zXpjz8WeyIcPFPFBYWlChfs1XW6iR9cD2dCqg2t2mvXrCH
         XMag==
X-Gm-Message-State: AOAM531Zb3aI3OV69yOWvDAT/IYwwVAX38DwH66G/vPADz97q4yiw9GX
	gNwdvMMubSQtcxzdXVoxWWU=
X-Google-Smtp-Source: ABdhPJyxgn8y703PIdZdT+iSaqkj7xP8yQhxWw4Bbr2lxRzCyaF5hcAgLMHi7vf3aYveYvKsHF5wpg==
X-Received: by 2002:a05:6512:606:b0:478:fdce:eef8 with SMTP id b6-20020a056512060600b00478fdceeef8mr29927481lfe.461.1654799975798;
        Thu, 09 Jun 2022 11:39:35 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7f886dfb-2b42-bc70-d55f-14ecd8144e3e@gmail.com>
Date: Thu, 9 Jun 2022 21:39:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2206031348230.2783803@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 04.06.22 00:19, Stefano Stabellini wrote:


Hello Stefano

Thank you for having a look and sorry for the late response.

> On Tue, 17 May 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Depends on CONFIG_XEN_UNPOPULATED_ALLOC. If enabled then unpopulated
>> DMAable (contiguous) pages will be allocated for grant mapping into
>> instead of ballooning out real RAM pages.
>>
>> TODO: Fallback to real RAM pages if xen_alloc_unpopulated_dma_pages()
>> fails.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   drivers/xen/grant-table.c | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
>> index 8ccccac..2bb4392 100644
>> --- a/drivers/xen/grant-table.c
>> +++ b/drivers/xen/grant-table.c
>> @@ -864,6 +864,25 @@ EXPORT_SYMBOL_GPL(gnttab_free_pages);
>>    */
>>   int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
>>   {
>> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>> +	int ret;
> This is an alternative implementation of the same function.

Currently, yes.


>   If we are
> going to use #ifdef, then I would #ifdef the entire function, rather
> than just the body. Otherwise within the function body we can use
> IS_ENABLED.


Good point. Note, there is one missing thing in current patch which is 
described in TODO.

"Fallback to real RAM pages if xen_alloc_unpopulated_dma_pages() 
fails."  So I will likely use IS_ENABLED within the function body.

If CONFIG_XEN_UNPOPULATED_ALLOC is enabled then gnttab_dma_alloc_pages() 
will try to call xen_alloc_unpopulated_dma_pages() the first and if 
fails then fallback to allocate RAM pages and balloon them out.

One moment is not entirely clear to me. If we use fallback in 
gnttab_dma_alloc_pages() then we must use fallback in 
gnttab_dma_free_pages() as well, we cannot use 
xen_free_unpopulated_dma_pages() for real RAM pages. The question is how 
to pass this information to the gnttab_dma_free_pages()? The first idea 
which comes to mind is to add a flag to struct gnttab_dma_alloc_args...


>
>> +	ret = xen_alloc_unpopulated_dma_pages(args->dev, args->nr_pages,
>> +			args->pages);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = gnttab_pages_set_private(args->nr_pages, args->pages);
>> +	if (ret < 0) {
>> +		gnttab_dma_free_pages(args);
> it should xen_free_unpopulated_dma_pages ?

Besides calling the xen_free_unpopulated_dma_pages(), we also need to 
call gnttab_pages_clear_private() here, this is what 
gnttab_dma_free_pages() is doing.

I can change to call both function instead:

     gnttab_pages_clear_private(args->nr_pages, args->pages);
     xen_free_unpopulated_dma_pages(args->dev, args->nr_pages, args->pages);

Shall I?


>
>
>> +		return ret;
>> +	}
>> +
>> +	args->vaddr = page_to_virt(args->pages[0]);
>> +	args->dev_bus_addr = page_to_phys(args->pages[0]);
> There are two things to note here.
>
> The first thing to note is that normally we would call pfn_to_bfn to
> retrieve the dev_bus_addr of a page because pfn_to_bfn takes into
> account foreign mappings. However, these are freshly allocated pages
> without foreign mappings, so page_to_phys/dma should be sufficient.

agree


>
>
> The second has to do with physical addresses and DMA addresses. The
> functions are called gnttab_dma_alloc_pages and
> xen_alloc_unpopulated_dma_pages which make you think we are retrieving a
> DMA address here. However, to get a DMA address we need to call
> page_to_dma rather than page_to_phys.
>
> page_to_dma takes into account special offsets that some devices have
> when accessing memory. There are real cases on ARM where the physical
> address != DMA address, e.g. RPi4.

I got it. Now I am in doubt whether it would be better to name the API:

xen_alloc_unpopulated_cma_pages()

or

xen_alloc_unpopulated_contiguous_pages()

What do you think?


>
> However, to call page_to_dma you need to specify as first argument the
> DMA-capable device that is expected to use those pages for DMA (e.g. an
> ethernet device or a MMC controller.) While the args->dev we have in
> gnttab_dma_alloc_pages is the gntdev_miscdev.

agree

As I understand, at this time it is unknown for what exactly device 
these pages are supposed to be used at the end.

For now, it is only known that these pages to be used by userspace PV 
backend for grant mappings.


>
> So this interface cannot actually be used to allocate memory that is
> supposed to be DMA-able by a DMA-capable device, such as an ethernet
> device.

agree


>
> But I think that should be fine because the memory is meant to be used
> by a userspace PV backend for grant mappings. If any of those mappings
> end up being used for actual DMA in the kernel they should go through the
> drivers/xen/swiotlb-xen.c and xen_phys_to_dma should be called, which
> ends up calling page_to_dma as appropriate.
>
> It would be good to double-check that the above is correct and, if so,
> maybe add a short in-code comment about it:
>
> /*
>   * These are not actually DMA addresses but regular physical addresses.
>   * If these pages end up being used in a DMA operation then the
>   * swiotlb-xen functions are called and xen_phys_to_dma takes care of
>   * the address translations:
>   *
>   * - from gfn to bfn in case of foreign mappings
>   * - from physical to DMA addresses in case the two are different for a
>   *   given DMA-mastering device
>   */

I agree this needs to be re-checked. But, there is one moment here, if 
userspace PV backend runs in other than Dom0 domain (non 1:1 mapped 
domain), the xen-swiotlb seems not to be in use then? How to be in this 
case?


>
>
>
>> +	return ret;
>> +#else
>>   	unsigned long pfn, start_pfn;
>>   	size_t size;
>>   	int i, ret;
>> @@ -910,6 +929,7 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
>>   fail:
>>   	gnttab_dma_free_pages(args);
>>   	return ret;
>> +#endif
>>   }
>>   EXPORT_SYMBOL_GPL(gnttab_dma_alloc_pages);
>>   
>> @@ -919,6 +939,12 @@ EXPORT_SYMBOL_GPL(gnttab_dma_alloc_pages);
>>    */
>>   int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
>>   {
>> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>> +	gnttab_pages_clear_private(args->nr_pages, args->pages);
>> +	xen_free_unpopulated_dma_pages(args->dev, args->nr_pages, args->pages);
>> +
>> +	return 0;
>> +#else
>>   	size_t size;
>>   	int i, ret;
>>   
>> @@ -946,6 +972,7 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
>>   		dma_free_wc(args->dev, size,
>>   			    args->vaddr, args->dev_bus_addr);
>>   	return ret;
>> +#endif
>>   }
>>   EXPORT_SYMBOL_GPL(gnttab_dma_free_pages);
>>   #endif
>> -- 
>> 2.7.4
>>
-- 
Regards,

Oleksandr Tyshchenko


