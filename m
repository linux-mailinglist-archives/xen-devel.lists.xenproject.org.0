Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36205F6D4C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 19:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417216.661872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogV9m-0004tZ-9A; Thu, 06 Oct 2022 17:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417216.661872; Thu, 06 Oct 2022 17:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogV9m-0004rF-50; Thu, 06 Oct 2022 17:59:38 +0000
Received: by outflank-mailman (input) for mailman id 417216;
 Thu, 06 Oct 2022 17:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0w9=2H=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ogV9k-0004r4-H4
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 17:59:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a30e0fb4-45a0-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 19:59:35 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id a2so6228764ejx.10
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 10:59:35 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a17090630d100b0078b03d57fa7sm45931ejb.34.2022.10.06.10.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 10:59:34 -0700 (PDT)
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
X-Inumbo-ID: a30e0fb4-45a0-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9C7ByqeSaw8akdMJt6lEHhq8DB9Wv7neSKwYSa568Bc=;
        b=GBm0FgVhh/SmHkKRk0VR06xZUv2s5FfWzez1BIME/djcjD8cCDknzdtn1Fzhu5g/kg
         S0nic5/R50Bm/zdW792pnzivTdOkci4ZuJd6UtTqZkWQR+bgoIeaRseAhInbl5QEe0et
         8N9tZHW6xeR/VzU5/A/FgJuS8BCAfMW2jbFDvQk6P/9FFkXYFHolvelHSX0+cC3UQHsT
         sbTIVXvPoU0hKTnRuQIheFe9SkyQKUzCkxiQfgRPn5TKhablgXDgTJotMao2Y2fAanLQ
         K2x1hQrwtmzM/aRWdW6b7HIO9mMYR5nU8rLvbd3Nhsd4eWQlW3wVo7MOTKd5tTGzY/XV
         cC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9C7ByqeSaw8akdMJt6lEHhq8DB9Wv7neSKwYSa568Bc=;
        b=IkXBk0jnArje+IBeMoQ5gbLJ/ylnPXtsABif8SO1/obJ9I4M+n6xacqP+mT+MPRlGk
         W7/D3YI2bC/WUh+6EBQWySEW+6HyCVcfCqkCBZcCiYD5aDt2jfiIGOHXYM/0uIDN0juz
         OOm8vvBMCfEzxN2ibfe2DSd+FasUCt+DaLIWzcCh9ygoTT+R3ITgw8YjT/BZ64ONSSEI
         LubWGVX2PELvI0doYTX+kCIgW0S4OD39tIZEaA/z0dgVeEsM228Pk2ifN8u5MxZRxKmp
         ZO+ea8FwiCddjXsDxkrvGLiGY2grf/NQNL/VucaNyaV+kxYBByp9cyCyoVqHUfAQxY2T
         6NMg==
X-Gm-Message-State: ACrzQf18VRh+c6APsU36xAA6SB6EXHa0hA16y/4KBCbN1NsT/NxiijBg
	rmDBNUZrd8SaecIcfvAN2Ac=
X-Google-Smtp-Source: AMsMyM5kuaauO1vW4syhZvX2RO/dfucMb6YYgUT3lLJ4eHvtA3RTG8amKMunPAeu3qoE1ar1WyyYcA==
X-Received: by 2002:a17:907:8a0a:b0:78d:2ecb:63e6 with SMTP id sc10-20020a1709078a0a00b0078d2ecb63e6mr919611ejc.620.1665079174812;
        Thu, 06 Oct 2022 10:59:34 -0700 (PDT)
Message-ID: <96a16b32-0950-b538-65e5-9955ed8cc529@gmail.com>
Date: Thu, 6 Oct 2022 20:59:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen
 counterparts
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <20221006120912.1948459-1-olekstysh@gmail.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221006120912.1948459-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/22 15:09, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Although XEN_PAGE_SIZE is equal to PAGE_SIZE (4KB) for now, it would
> be more correct to use Xen specific #define-s as XEN_PAGE_SIZE can
> be changed at some point in the future.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> As it was proposed at:
> https://lore.kernel.org/xen-devel/20221005174823.1800761-1-olekstysh@gmail.com/
> 
> Should go in only after that series.
> ---
>   drivers/xen/grant-dma-ops.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index c66f56d24013..5392fdc25dca 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -31,12 +31,12 @@ static DEFINE_XARRAY_FLAGS(xen_grant_dma_devices, XA_FLAGS_LOCK_IRQ);
>   
>   static inline dma_addr_t grant_to_dma(grant_ref_t grant)
>   {
> -	return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << PAGE_SHIFT);
> +	return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << XEN_PAGE_SHIFT);
>   }

With this change, can the offset added to the dma handle, generated by 
grant_to_dma(), be the offset in the page? Couldn't it corrupt the grant 
ref?

>   
>   static inline grant_ref_t dma_to_grant(dma_addr_t dma)
>   {
> -	return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >> PAGE_SHIFT);
> +	return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >> XEN_PAGE_SHIFT);
>   }
>   
>   static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
> @@ -79,7 +79,7 @@ static void *xen_grant_dma_alloc(struct device *dev, size_t size,
>   				 unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned int i, n_pages = XEN_PFN_UP(size);
>   	unsigned long pfn;
>   	grant_ref_t grant;
>   	void *ret;
> @@ -91,14 +91,14 @@ static void *xen_grant_dma_alloc(struct device *dev, size_t size,
>   	if (unlikely(data->broken))
>   		return NULL;
>   
> -	ret = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
> +	ret = alloc_pages_exact(n_pages * XEN_PAGE_SIZE, gfp);
>   	if (!ret)
>   		return NULL;
>   
>   	pfn = virt_to_pfn(ret);
>   
>   	if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
> -		free_pages_exact(ret, n_pages * PAGE_SIZE);
> +		free_pages_exact(ret, n_pages * XEN_PAGE_SIZE);
>   		return NULL;
>   	}
>   
> @@ -116,7 +116,7 @@ static void xen_grant_dma_free(struct device *dev, size_t size, void *vaddr,
>   			       dma_addr_t dma_handle, unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned int i, n_pages = XEN_PFN_UP(size);
>   	grant_ref_t grant;
>   
>   	data = find_xen_grant_dma_data(dev);
> @@ -138,7 +138,7 @@ static void xen_grant_dma_free(struct device *dev, size_t size, void *vaddr,
>   
>   	gnttab_free_grant_reference_seq(grant, n_pages);
>   
> -	free_pages_exact(vaddr, n_pages * PAGE_SIZE);
> +	free_pages_exact(vaddr, n_pages * XEN_PAGE_SIZE);
>   }
>   
>   static struct page *xen_grant_dma_alloc_pages(struct device *dev, size_t size,
> @@ -168,7 +168,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>   					 unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(offset + size);
> +	unsigned int i, n_pages = XEN_PFN_UP(offset + size);

The offset, here, refers to the offset in the page ...

>   	grant_ref_t grant;
>   	dma_addr_t dma_handle;
>   
> @@ -200,8 +200,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
>   				     unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned long offset = dma_handle & (PAGE_SIZE - 1);
> -	unsigned int i, n_pages = PFN_UP(offset + size);
> +	unsigned long offset = dma_handle & ~XEN_PAGE_MASK;

... while, here, it refers to the offset in the grant.
So, the calculated number of grants may differ.

> +	unsigned int i, n_pages = XEN_PFN_UP(offset + size);
>   	grant_ref_t grant;
>   
>   	if (WARN_ON(dir == DMA_NONE))

-- 
Xenia

