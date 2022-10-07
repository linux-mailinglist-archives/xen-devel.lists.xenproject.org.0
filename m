Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E225F749D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 09:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417433.662146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oghZi-0006n3-Em; Fri, 07 Oct 2022 07:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417433.662146; Fri, 07 Oct 2022 07:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oghZi-0006jt-BP; Fri, 07 Oct 2022 07:15:14 +0000
Received: by outflank-mailman (input) for mailman id 417433;
 Fri, 07 Oct 2022 07:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hbjo=2I=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oghZg-0006jn-LK
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 07:15:12 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7265842-460f-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 09:15:10 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id w10so5816310edd.4
 for <xen-devel@lists.xenproject.org>; Fri, 07 Oct 2022 00:15:09 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b0073ae9ba9ba8sm792356ejc.3.2022.10.07.00.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 00:15:09 -0700 (PDT)
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
X-Inumbo-ID: c7265842-460f-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VdPP7ZbynXA6QuugzlRWuE4AJslI1k9PX+cmlWKyz7c=;
        b=jyPS84BTRcfJudXidSokxeG1ZdD37ZyQXS0gnxY8B3oVOQT0BKEIbeFVYQF33lL80B
         sV+DQ66TiyHvEC+3V401219cQu3R5Q1p2oSS8eWe6Rb68NR9jDw5jdnkyyVuZToAV1tj
         U4bk7ayCpi0ARbeJPV7RxH72YIFEqY7DkjXUgbeD1omF35vP3Hg4lk938r28ATLG/ACi
         vPxgkN1TUV8k8BdcPFYSMD/FTSrCfwa1TW6L7mFQpYotWD90Z3FVCX7R9cRjFkMj7r+r
         n9PUVpkY7/CjRJfNXK/bbog0XTd/qGYoApiDn73Abwst/SWZWigsd7GyH+j6rdJP4g9T
         D5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdPP7ZbynXA6QuugzlRWuE4AJslI1k9PX+cmlWKyz7c=;
        b=BNLm51LDHzgs7CDesPfUSGGLRYgPPx5Own6PIp7eZEtbFZ0fW2E25wDukuI4dscbRf
         DhqY71cwTslGVoLKYTclzL4IlTCPIe5fUcr1HNErpuP6nkAZR7v3XlgfVC54llG9zG9S
         V54S4LGBpSrVAFLeFM/LA+bLJzAEhThnvugQs8rUQbRRiHrp2j5ajXUkiCYlPVV2XbOb
         2sXvHcnzTxs24Anf0RVGtrEct+9O1F/3A3iVYzXIxXwgaVXg8DgWYQ8noas6fIQkHFjl
         qv1NBrsGN35eVfaj6MqC9dLGJsM07QzAF9ZFHm6VZXTU/eFyCv7F+9605kP0tNY9bfPQ
         /WqQ==
X-Gm-Message-State: ACrzQf22Q6BDG6AY35BtfeGvjYpnGqvCjkkNSXZQmWGiQNiS7CdZ2t2m
	Ah0OULbJH9T5jdPeLGQ1lSE=
X-Google-Smtp-Source: AMsMyM7nE+3Y9YT3ZoUjnjechzTKdx8lPadALD1ODlJcHowSJch/AthJdJzGNUn/mHrKtMp3uWBksg==
X-Received: by 2002:a05:6402:1cc5:b0:453:ed3f:6a38 with SMTP id ds5-20020a0564021cc500b00453ed3f6a38mr3258525edb.346.1665126909391;
        Fri, 07 Oct 2022 00:15:09 -0700 (PDT)
Message-ID: <7f54bdab-c68f-0d38-93f4-007408151f01@gmail.com>
Date: Fri, 7 Oct 2022 10:15:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen
 counterparts
Content-Language: en-US
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20221006120912.1948459-1-olekstysh@gmail.com>
 <96a16b32-0950-b538-65e5-9955ed8cc529@gmail.com>
 <b3b8047e-b4a5-1e75-2a55-a7beecf8ca7d@epam.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <b3b8047e-b4a5-1e75-2a55-a7beecf8ca7d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/7/22 00:13, Oleksandr Tyshchenko wrote:

Hi Oleksandr

> 
> On 06.10.22 20:59, Xenia Ragiadakou wrote:
> 
> Hello Xenia
> 
>>
>> On 10/6/22 15:09, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Although XEN_PAGE_SIZE is equal to PAGE_SIZE (4KB) for now, it would
>>> be more correct to use Xen specific #define-s as XEN_PAGE_SIZE can
>>> be changed at some point in the future.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>
>>> As it was proposed at:
>>> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/20221005174823.1800761-1-olekstysh@gmail.com/__;!!GF_29dbcQIUBPA!zHt-xZ_7tZc_EM6zva21E_YgwIiEeimFWfsJIpPwAu-TBcnzQhXHqlKzmXmwIcI6uIx_arHNZiaZeHt_428_8p-DyMpd$
>>> [lore[.]kernel[.]org]
>>>
>>> Should go in only after that series.
>>> ---
>>>    drivers/xen/grant-dma-ops.c | 20 ++++++++++----------
>>>    1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>>> index c66f56d24013..5392fdc25dca 100644
>>> --- a/drivers/xen/grant-dma-ops.c
>>> +++ b/drivers/xen/grant-dma-ops.c
>>> @@ -31,12 +31,12 @@ static DEFINE_XARRAY_FLAGS(xen_grant_dma_devices,
>>> XA_FLAGS_LOCK_IRQ);
>>>      static inline dma_addr_t grant_to_dma(grant_ref_t grant)
>>>    {
>>> -    return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << PAGE_SHIFT);
>>> +    return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant <<
>>> XEN_PAGE_SHIFT);
>>>    }
>>
>> With this change, can the offset added to the dma handle, generated by
>> grant_to_dma(), be the offset in the page? Couldn't it corrupt the
>> grant ref?
> 
> 
> Good point, indeed, I think it could corrupt if guest uses a different
> than Xen page granularity (i.e 64KB).
> 
> 
>>
>>>      static inline grant_ref_t dma_to_grant(dma_addr_t dma)
>>>    {
>>> -    return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >>
>>> PAGE_SHIFT);
>>> +    return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >>
>>> XEN_PAGE_SHIFT);
>>>    }
>>>      static struct xen_grant_dma_data *find_xen_grant_dma_data(struct
>>> device *dev)
>>> @@ -79,7 +79,7 @@ static void *xen_grant_dma_alloc(struct device
>>> *dev, size_t size,
>>>                     unsigned long attrs)
>>>    {
>>>        struct xen_grant_dma_data *data;
>>> -    unsigned int i, n_pages = PFN_UP(size);
>>> +    unsigned int i, n_pages = XEN_PFN_UP(size);
>>>        unsigned long pfn;
>>>        grant_ref_t grant;
>>>        void *ret;
>>> @@ -91,14 +91,14 @@ static void *xen_grant_dma_alloc(struct device
>>> *dev, size_t size,
>>>        if (unlikely(data->broken))
>>>            return NULL;
>>>    -    ret = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
>>> +    ret = alloc_pages_exact(n_pages * XEN_PAGE_SIZE, gfp);
>>>        if (!ret)
>>>            return NULL;
>>>          pfn = virt_to_pfn(ret);
>>>          if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
>>> -        free_pages_exact(ret, n_pages * PAGE_SIZE);
>>> +        free_pages_exact(ret, n_pages * XEN_PAGE_SIZE);
>>>            return NULL;
>>>        }
>>>    @@ -116,7 +116,7 @@ static void xen_grant_dma_free(struct device
>>> *dev, size_t size, void *vaddr,
>>>                       dma_addr_t dma_handle, unsigned long attrs)
>>>    {
>>>        struct xen_grant_dma_data *data;
>>> -    unsigned int i, n_pages = PFN_UP(size);
>>> +    unsigned int i, n_pages = XEN_PFN_UP(size);
>>>        grant_ref_t grant;
>>>          data = find_xen_grant_dma_data(dev);
>>> @@ -138,7 +138,7 @@ static void xen_grant_dma_free(struct device
>>> *dev, size_t size, void *vaddr,
>>>          gnttab_free_grant_reference_seq(grant, n_pages);
>>>    -    free_pages_exact(vaddr, n_pages * PAGE_SIZE);
>>> +    free_pages_exact(vaddr, n_pages * XEN_PAGE_SIZE);
>>>    }
>>>      static struct page *xen_grant_dma_alloc_pages(struct device *dev,
>>> size_t size,
>>> @@ -168,7 +168,7 @@ static dma_addr_t xen_grant_dma_map_page(struct
>>> device *dev, struct page *page,
>>>                         unsigned long attrs)
>>>    {
>>>        struct xen_grant_dma_data *data;
>>> -    unsigned int i, n_pages = PFN_UP(offset + size);
>>> +    unsigned int i, n_pages = XEN_PFN_UP(offset + size);
>>
>> The offset, here, refers to the offset in the page ...
>>
>>>        grant_ref_t grant;
>>>        dma_addr_t dma_handle;
>>>    @@ -200,8 +200,8 @@ static void xen_grant_dma_unmap_page(struct
>>> device *dev, dma_addr_t dma_handle,
>>>                         unsigned long attrs)
>>>    {
>>>        struct xen_grant_dma_data *data;
>>> -    unsigned long offset = dma_handle & (PAGE_SIZE - 1);
>>> -    unsigned int i, n_pages = PFN_UP(offset + size);
>>> +    unsigned long offset = dma_handle & ~XEN_PAGE_MASK;
>>
>> ... while, here, it refers to the offset in the grant.
>> So, the calculated number of grants may differ.
> 
> Good point, I think you are right, so we need to additionally use
> xen_offset_in_page() macro in xen_grant_dma_map_page(),
> 
> something like that to be squashed with current patch:
> 
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 9d5eca6d638a..bb984dc05deb 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -169,7 +169,7 @@ static dma_addr_t xen_grant_dma_map_page(struct
> device *dev, struct page *page,
>                                            unsigned long attrs)
>    {
>           struct xen_grant_dma_data *data;
> -       unsigned int i, n_pages = XEN_PFN_UP(offset + size);
> +       unsigned int i, n_pages = XEN_PFN_UP(xen_offset_in_page(offset)
> + size);
>           grant_ref_t grant;
>           dma_addr_t dma_handle;
> 
> @@ -191,7 +191,7 @@ static dma_addr_t xen_grant_dma_map_page(struct
> device *dev, struct page *page,
>                                   xen_page_to_gfn(page) + i, dir ==
> DMA_TO_DEVICE);
>           }
> 
> -       dma_handle = grant_to_dma(grant) + offset;
> +       dma_handle = grant_to_dma(grant) + xen_offset_in_page(offset);
> 
>           return dma_handle;
>    }
> 
> Did I get your point right?
> 

I think it 's more complicated than that.
Let's say that the offset in page is > XEN_PAGE_SIZE, then the 
calculation of the number of grants won't take into account the part of 
the offset that is multiple of the XEN_PAGE_SIZE i.e it will calculate 
only the strictly necessary number of grants.
But xen_grant_dma_map_page() grants access to the whole page because, as 
it can be observed in the code snippet below, it does not take into 
account the page offset.

for (i = 0; i < n_pages; i++) {
   gnttab_grant_foreign_access_ref(grant + i, data->backend_domid, 
xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
}

>>
>>
>>> +    unsigned int i, n_pages = XEN_PFN_UP(offset + size);
>>>        grant_ref_t grant;
>>>          if (WARN_ON(dir == DMA_NONE))
>>
> 
> Thank you.
> 
> 

-- 
Xenia

