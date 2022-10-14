Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BAF5FE9A9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 09:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422497.668557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFE9-00038p-O3; Fri, 14 Oct 2022 07:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422497.668557; Fri, 14 Oct 2022 07:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFE9-00036Z-Kt; Fri, 14 Oct 2022 07:35:29 +0000
Received: by outflank-mailman (input) for mailman id 422497;
 Fri, 14 Oct 2022 07:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1R5=2P=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ojFE8-00036T-V4
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 07:35:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5994d46-4b92-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 09:35:27 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id r17so8654737eja.7
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 00:35:27 -0700 (PDT)
Received: from [192.168.1.93] (adsl-9.109.242.227.tellas.gr. [109.242.227.9])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090653cd00b0078d175d6dc5sm1040479ejo.201.2022.10.14.00.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 00:35:26 -0700 (PDT)
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
X-Inumbo-ID: c5994d46-4b92-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IH2CpfxEnRPwyicRs6j2xX+M8g2xRDD94KWbgPm56UQ=;
        b=WTM16MpNXdwQMpkJIl9siCRyn8/P6hXgvjHqcZ4wHq5Ylr095mkKLwo1MssyAHb7T7
         AZ5gQWH3xEMbjuplmB1Uid8GIqzqZfEXRK8/iMRtKGULNKpCsrObFi7WT4rwGIFJUdY3
         amOeedWqg0fJzgTFTD8EwKoqNV7lQdmQoJAURykshfJQenO8eOMtFzB9YXutzL3aChr9
         xyfeKZNWy/8vpE+6OIFyve7NhEBlAywrTSC/npVIJYX+OPuX4svHHSWXxPPWbKnu4sUA
         HJZAKXcR17CXxJolDRAO0v9IHKe0QPMMGaYqMRopo5bUynVUGtt7bmljiTj751SQiGk7
         MeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IH2CpfxEnRPwyicRs6j2xX+M8g2xRDD94KWbgPm56UQ=;
        b=mot5r5OajY7/7Z2A5HBUL415h6UI2uyvV/ICiiCi3+RJcVcEMAxDC3KunsOLKSLFMl
         KTwXpX9KgbwCjx/obO4VbeFxmQ6e+dUIqMr5n68nNF2LVd5AC4zFN5KCMRS687jYVnMw
         NPRLosG4rqkGjnp2nx+U+U3FC1BDHaQKDMILKJ1b2NQd64E50H7jsDupIEf9FmIpcrUp
         drbCx2014xarZbeQ1Jmwg+uPkYpAhcsUbuoVzdeyV0vBWNTQA2C3R8GVi+vjQcdRZmKz
         Q5R3fvhlkcGtIn5VD+0HldmfO9gxwmnqM/D9Yl2Pbwii58KGLcuUl9GB5xdqUEWnQ4vN
         obXQ==
X-Gm-Message-State: ACrzQf3YFG+0vT/ONeCwSKMOUu1+sDB+/C/WYQ9LPrJgvyog34xdXRoN
	CBey6WjJlc35SVk8/nwxDFw=
X-Google-Smtp-Source: AMsMyM5tm2UqwC7RYDcv5cU9uJmlRMFT3E8NR+6T0bg+FpAoctHGfjZtODhQ0PuioODwiwWi3zZivQ==
X-Received: by 2002:a17:906:9c82:b0:781:5752:4f2b with SMTP id fj2-20020a1709069c8200b0078157524f2bmr2483158ejc.561.1665732926818;
        Fri, 14 Oct 2022 00:35:26 -0700 (PDT)
Message-ID: <ae26a54b-ece5-f8a3-2331-f7e495ecceea@gmail.com>
Date: Fri, 14 Oct 2022 10:35:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 1/2] xen/virtio: Handle cases when page offset >
 PAGE_SIZE properly
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <20221008151013.2537826-1-olekstysh@gmail.com>
 <20221008151013.2537826-2-olekstysh@gmail.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221008151013.2537826-2-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/22 18:10, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Passed to xen_grant_dma_map_page() offset in the page
> can be > PAGE_SIZE even if the guest uses the same page granularity
> as Xen (4KB).
> 
> Before current patch, if such case happened we ended up providing
> grants for the whole region in xen_grant_dma_map_page() which
> was really unnecessary. The more, we ended up not releasing all
> grants which represented that region in xen_grant_dma_unmap_page().
> 
> Current patch updates the code to be able to deal with such cases.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>

> ---
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Changes V1 -> V2:
>     - s/gfn_offset/pfn_offset
>     - clarify gfn calculation when granting a page
> 
> Previous discussion is at:
> https://lore.kernel.org/lkml/20221007132736.2275574-1-olekstysh@gmail.com/
> ---
>   drivers/xen/grant-dma-ops.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index c66f56d24013..1d018e3a68a0 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -168,7 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>   					 unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(offset + size);
> +	unsigned long dma_offset = offset_in_page(offset),
> +			pfn_offset = PFN_DOWN(offset);
> +	unsigned int i, n_pages = PFN_UP(dma_offset + size);
>   	grant_ref_t grant;
>   	dma_addr_t dma_handle;
>   
> @@ -187,10 +189,11 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>   
>   	for (i = 0; i < n_pages; i++) {
>   		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
> -				xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
> +				pfn_to_gfn(page_to_xen_pfn(page) + i + pfn_offset),
> +				dir == DMA_TO_DEVICE);
>   	}
>   
> -	dma_handle = grant_to_dma(grant) + offset;
> +	dma_handle = grant_to_dma(grant) + dma_offset;
>   
>   	return dma_handle;
>   }

-- 
Xenia

