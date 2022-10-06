Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DBA5F61B9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 09:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416663.661323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogLQE-0000Ta-3Y; Thu, 06 Oct 2022 07:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416663.661323; Thu, 06 Oct 2022 07:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogLQE-0000Qa-0C; Thu, 06 Oct 2022 07:35:58 +0000
Received: by outflank-mailman (input) for mailman id 416663;
 Thu, 06 Oct 2022 07:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0w9=2H=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ogLQC-0000QS-I6
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 07:35:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83387de1-4549-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 09:35:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id u21so1561690edi.9
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 00:35:55 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a1709062f8300b0072ed9efc9dfsm9879115eji.48.2022.10.06.00.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 00:35:54 -0700 (PDT)
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
X-Inumbo-ID: 83387de1-4549-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0dtKZhkDgaoTTpO0pEO0vifhDrrgR+WBWj56fb3zUfQ=;
        b=W4RsQkzM7QFWf+K5p/TTKfFKwP/3vAkl3ikvYa4UUzVSCyQMmyAeRgkZ3zuyYZpFrb
         JUftfdmSzmLcggX6184vSHPvABJxE6t2J+YpnX6SsIFxwAwXEBZHJz1clQrA4TEcDNcp
         F/UP6XNrSQdF3jmwDZJIiY6jYzl1VG8YHYwSh7yMcsn8QpUDtktNKWLzOhO+g1b1gzji
         Tg6FCYROjaPOCYA/xMQR80QNQxx236f2KBJIjghQPZv2gcnCVr7SVO411apqJ6LQ9fgO
         NabZd8+h219Pw2vTF3RwlVmH/tLPkTLRXpj1zjUQyJLEL3s0hKi7Ed8DZP7hF1qJ73ei
         OWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dtKZhkDgaoTTpO0pEO0vifhDrrgR+WBWj56fb3zUfQ=;
        b=lpRrWgk+obpptMMKez7JdLweYCN1BUTGJY/XD8XHY8owRT+peW/ArZH1aiTq8d6ryF
         htYo4XcKypUeZjBFf9uf4VxVU3h4DJBUSM946MQe6sQ5J0iqn1OfXFekMPueGJ8GjZz3
         Apy9W+oeWYmalA+j5U6nBA4Qce6jwlau9sQxObDJ3lMK3jBWSSFCR1gT1Nm50Ygi9nCk
         1BG2QHprt0IBTm/a4L+jx9YeUZ+l0KxAuyC/JEI73zIxrNwamEoB2u4NGZdgmnEcBobw
         8kRi7AJBsiZB7jaNqtxXt5A1j07GDrsNnEHyr0YH2zjZmz+u8hi+tPpXgt3Bw9iUHHd3
         b1ug==
X-Gm-Message-State: ACrzQf2rCGAnxA0hggmFzMUlvIbGHMiqe0kNrbQCPxrizEy/hjRehqjw
	uraUYPX9SzRuEQ2pANflam0=
X-Google-Smtp-Source: AMsMyM6QWzOQBtddsT3XuWD2bke2M6zHcURtDCNzNXrWLYhFV+Elgj1HIX09GNwNyVYdtaNyQ9Kc/Q==
X-Received: by 2002:a05:6402:3550:b0:451:473a:5ca3 with SMTP id f16-20020a056402355000b00451473a5ca3mr3365421edd.48.1665041755090;
        Thu, 06 Oct 2022 00:35:55 -0700 (PDT)
Message-ID: <55a22602-3ae8-b09b-61c9-1fc7c01235fc@gmail.com>
Date: Thu, 6 Oct 2022 10:35:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] xen/virtio: Fix n_pages calculation in
 xen_grant_dma_map(unmap)_page()
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <20221005174823.1800761-1-olekstysh@gmail.com>
 <20221005174823.1800761-2-olekstysh@gmail.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221005174823.1800761-2-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/22 20:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Take page offset into the account when calculating the number of pages
> to be granted.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Fixes: d6aca3504c7d ("xen/grant-dma-ops: Add option to restrict memory access under Xen")
> ---
>   drivers/xen/grant-dma-ops.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 8973fc1e9ccc..1998d0e8ce82 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -153,7 +153,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
>   					 unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned int i, n_pages = PFN_UP(offset + size);

Here, why do we use PFN_UP and not XEN_PFN_UP?
Also, since the variable 'n_pages' seems to refer to the number of 
grants (unless I got it all entirely wrong ...), wouldn't it be more 
suitable to call explicitly gnttab_count_grant()?
If the above questions have been already answered in the past, please 
ignore.

>   	grant_ref_t grant;
>   	dma_addr_t dma_handle;
>   
> @@ -185,7 +185,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
>   				     unsigned long attrs)
>   {
>   	struct xen_grant_dma_data *data;
> -	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned long offset = dma_handle & (PAGE_SIZE - 1);
> +	unsigned int i, n_pages = PFN_UP(offset + size);
>   	grant_ref_t grant;
>   
>   	if (WARN_ON(dir == DMA_NONE))

-- 
Xenia

