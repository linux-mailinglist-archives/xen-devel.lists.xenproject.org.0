Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE995F84E0
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 13:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418483.663303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh7h1-0004Fw-33; Sat, 08 Oct 2022 11:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418483.663303; Sat, 08 Oct 2022 11:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh7h0-0004Du-WA; Sat, 08 Oct 2022 11:08:30 +0000
Received: by outflank-mailman (input) for mailman id 418483;
 Sat, 08 Oct 2022 11:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XqZC=2J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oh7gz-0004Do-P8
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 11:08:29 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88d68202-46f9-11ed-9377-c1cf23e5d27e;
 Sat, 08 Oct 2022 13:08:28 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id q9so11565744ejd.0
 for <xen-devel@lists.xenproject.org>; Sat, 08 Oct 2022 04:08:27 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a17090677de00b00779cde476e4sm2627061ejn.62.2022.10.08.04.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 04:08:26 -0700 (PDT)
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
X-Inumbo-ID: 88d68202-46f9-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPZgg2KnD8Z7siPytxPxGEaqGU1Xq2bMtMqXe2XAWmg=;
        b=B1AWuiRwETAIVwO/fjjrTIH84Ti6hy4VAfEWe/YHtWmZuE1NIAopPN3V7M9lMJ2TzZ
         IuxTg7TcatqYM4JJp5rddRhXJ7wkzTpAiBfEmyL/wfnxZuteKGQoodfqdbMlwC0HbUNe
         gUMHhXo0nEXPu3+pAoPKs9z96PcL9tzDiW0+wYzAfhG7JLyta9IOT77fahhq1UMY5PM2
         0EhbjMrZ69HhbAC/pd/vudkReI1B/YF55AaQkvEWxAZQ8yrmO24RTqqIrPVDifjSAMZS
         2ki7XxLHJ8+olq4T6uH6wq8sRT7ouHFkPyWFF/Oyt5OcskhjsvmYz1kOPxK8/VIv+6Nu
         H17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPZgg2KnD8Z7siPytxPxGEaqGU1Xq2bMtMqXe2XAWmg=;
        b=6TYStsREOU25DFHT+trYhlLW+8BGz0TmwT7Weh3IsDBvj7xctcqm9UMUQY9REtWQLD
         6ubuhYHKV2Z2bYSQhjeDDFc+wai6rZiDPV+DHigkvYDkvS/oAWnlEAyf5LXOapVh0Of7
         eZhZnzmaD/aG6Wt5GbNPvmTl9aOtl7pNWYWQu9Its65R64qCUOYylH7PqCFkMxnHVSTX
         iqRaKEF7ZVtRsS+Xa+NYJPUV+r+mIbvmkXibVzw51eIbhjmH7m/V71m+m5JNQ0Qc2TdT
         E04g2KjrbRNugtvm9S3lV1TOqWokxfplF0p9hTaKPXQPnIgbWpeEUo8Iko1ZORXSisb5
         1IRQ==
X-Gm-Message-State: ACrzQf1D/CJVE9ckn6oIOjdbuEmfHuRa+MVCt/koszoQumNTC02pnGcf
	pathvIgGddZrwyKzTsVIO9hixEqkRkxQcA==
X-Google-Smtp-Source: AMsMyM7/VoqHTVniuWj17yldk3O8VkznRZMOeEK4f+aulZOQhWkBG6yv3r/ch0RcU4jBrk76zzL4uA==
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id dt14-20020a170907728e00b007828e9164c8mr7688796ejc.36.1665227307127;
        Sat, 08 Oct 2022 04:08:27 -0700 (PDT)
Message-ID: <6e33b687-8862-d208-a707-77a95c61525e@gmail.com>
Date: Sat, 8 Oct 2022 14:08:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/virtio: Handle cases when page offset > PAGE_SIZE
 properly
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <20221007132736.2275574-1-olekstysh@gmail.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221007132736.2275574-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/7/22 16:27, Oleksandr Tyshchenko wrote:

Hi Oleksandr

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
> ---
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Depens on:
> https://lore.kernel.org/xen-devel/20221005174823.1800761-1-olekstysh@gmail.com/
> 
> Should go in only after that series.
> ---
>   drivers/xen/grant-dma-ops.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index c66f56d24013..1385f0e686fe 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -168,7 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>   					 unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(offset + size);
> +	unsigned long dma_offset = offset_in_page(offset),
> +			gfn_offset = PFN_DOWN(offset);
> +	unsigned int i, n_pages = PFN_UP(dma_offset + size);

IIUC, the above with a later patch will become:

dma_offset = xen_offset_in_page(offset)
gfn_offset = XEN_PFN_DOWN(offset)
n_pages = XEN_PFN_UP(dma_offset + size)

>   	grant_ref_t grant;
>   	dma_addr_t dma_handle;
>   
> @@ -187,10 +189,10 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>   
>   	for (i = 0; i < n_pages; i++) {
>   		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
> -				xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
> +				xen_page_to_gfn(page) + i + gfn_offset, dir == DMA_TO_DEVICE);

Here, why the pfn is not calculated before passing it to pfn_to_gfn()?
I mean sth like pfn_to_gfn(page_to_xen_pfn(page) + gfn_offset + i)

>   	}
>   
> -	dma_handle = grant_to_dma(grant) + offset;
> +	dma_handle = grant_to_dma(grant) + dma_offset;
>   
>   	return dma_handle;
>   }

-- 
Xenia

