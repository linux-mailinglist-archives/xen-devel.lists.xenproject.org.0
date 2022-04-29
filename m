Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A986A514EC0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 17:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317448.536776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSGg-0006Gn-N3; Fri, 29 Apr 2022 15:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317448.536776; Fri, 29 Apr 2022 15:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSGg-0006Dz-J4; Fri, 29 Apr 2022 15:10:50 +0000
Received: by outflank-mailman (input) for mailman id 317448;
 Fri, 29 Apr 2022 15:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1X1=VH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nkSGf-0006Dt-B2
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 15:10:49 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca95f61-c7ce-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 17:10:48 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id y19so10889768ljd.4
 for <xen-devel@lists.xenproject.org>; Fri, 29 Apr 2022 08:10:47 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a198c4e000000b0044a279d25d2sm258572lfj.244.2022.04.29.08.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 08:10:46 -0700 (PDT)
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
X-Inumbo-ID: 8ca95f61-c7ce-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pBiFdJVBK7XJGcpZMBcNpezNa6QIqErstaAn3kJpmDo=;
        b=dZwSRZ2uUt8/WpZywemY6gH9zX1bSy62uuhUOu5pOWQT+dn18k2SDQQu6GJeCR1fmI
         B9i/eUnvM463HnUn9gPQ4mIHvkU2iyDkHZb6gVT4C6czaSHmrvBGn8LgplqbU9XWyyGU
         J4w9GZKmjIVcfqj51GhpnuXtNWhRwHVmfxq8rrhs2c+yKxtv/p5YTOUohXke7TESuHwl
         ngFhgzPPHRJotN6GR9+KG4f0FM0F+tyMW9UsJtBUtKHgKcdM7uXUD7PlGvKOFStGFvkC
         ZRhqVMfg6QSxwiqmYL54PQdkBEtWRtax0cv5wzeGjGXGRBFFqty9gQWjVObdZ5Jwma+l
         W+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pBiFdJVBK7XJGcpZMBcNpezNa6QIqErstaAn3kJpmDo=;
        b=fVmAtgogCXBZtrGUTA3Uh76gguBh8+ucm9Yzj4jRvNmDfPke5ZfUvTTQ5+NZkiwgF6
         XNY4pcEgRs85ebCrbh3mOZVYDx3OVWrhr6kltPfWCVjUBWKOVYprzA3zJzZAoaNomtgv
         3TP4ZNUbVekAo56SQfgqB8ppbZNr8oSdIyVIFRiQ7vyqYBwCjJeUWCi293KZCt7julUf
         weQPC1O7hmWqNd4rljJwa2FT3I01BVvT9HOXSmGrXmariwXcxy2OeEzTXryNmhV8qpWM
         gdcIw+9OF8ZAhFYNRxkkmW2LqfUyj7Jmajm20B5DwVOjgiP93tGJNIENWSYDnTNtf5ng
         U46g==
X-Gm-Message-State: AOAM531+6BdLPT7KNPtEjJZ/3eV41/LXtXQAsEplWicREPPrW8RWqvEB
	srYeeARDNpI+Nbrio6mtVlc=
X-Google-Smtp-Source: ABdhPJwIjn/TgfjiVJ+PFQMmSwVNO9odm3G/qZjzSdU0Ck0X7LMwl8OoTfIdYYrpdzx9s+oxgWnlKg==
X-Received: by 2002:a2e:9e8e:0:b0:24a:d2d4:4509 with SMTP id f14-20020a2e9e8e000000b0024ad2d44509mr24544459ljk.69.1651245047368;
        Fri, 29 Apr 2022 08:10:47 -0700 (PDT)
Subject: Re: [PATCH v2 19/19] xen/xenbus: eliminate xenbus_grant_ring()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220428082743.16593-1-jgross@suse.com>
 <20220428082743.16593-20-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bf14e3e1-fc4d-1eee-1dfb-1ba3423f0b6f@gmail.com>
Date: Fri, 29 Apr 2022 18:10:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220428082743.16593-20-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 28.04.22 11:27, Juergen Gross wrote:


Hello Juergen


> There is no external user of xenbus_grant_ring() left, so merge it into
> the only caller xenbus_setup_ring().
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - make error message more precise (Andrew Cooper)
> ---
>   drivers/xen/xenbus/xenbus_client.c | 65 +++++++++---------------------
>   include/xen/xenbus.h               |  2 -
>   2 files changed, 19 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
> index 1a2e0d94ccd1..d6fdd2d209d3 100644
> --- a/drivers/xen/xenbus/xenbus_client.c
> +++ b/drivers/xen/xenbus/xenbus_client.c
> @@ -363,50 +363,6 @@ static void xenbus_switch_fatal(struct xenbus_device *dev, int depth, int err,
>   		__xenbus_switch_state(dev, XenbusStateClosing, 1);
>   }
>   
> -/**
> - * xenbus_grant_ring
> - * @dev: xenbus device
> - * @vaddr: starting virtual address of the ring
> - * @nr_pages: number of pages to be granted
> - * @grefs: grant reference array to be filled in
> - *
> - * Grant access to the given @vaddr to the peer of the given device.
> - * Then fill in @grefs with grant references.  Return 0 on success, or
> - * -errno on error.  On error, the device will switch to
> - * XenbusStateClosing, and the error will be saved in the store.
> - */
> -int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
> -		      unsigned int nr_pages, grant_ref_t *grefs)
> -{
> -	int err;
> -	unsigned int i;
> -	grant_ref_t gref_head;
> -
> -	err = gnttab_alloc_grant_references(nr_pages, &gref_head);
> -	if (err) {
> -		xenbus_dev_fatal(dev, err, "granting access to ring page");
> -		return err;
> -	}
> -
> -	for (i = 0; i < nr_pages; i++) {
> -		unsigned long gfn;
> -
> -		if (is_vmalloc_addr(vaddr))
> -			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr));
> -		else
> -			gfn = virt_to_gfn(vaddr);
> -
> -		grefs[i] = gnttab_claim_grant_reference(&gref_head);
> -		gnttab_grant_foreign_access_ref(grefs[i], dev->otherend_id,
> -						gfn, 0);
> -
> -		vaddr = vaddr + XEN_PAGE_SIZE;
> -	}
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(xenbus_grant_ring);
> -
>   /*
>    * xenbus_setup_ring
>    * @dev: xenbus device
> @@ -424,6 +380,7 @@ int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
>   		      unsigned int nr_pages, grant_ref_t *grefs)
>   {
>   	unsigned long ring_size = nr_pages * XEN_PAGE_SIZE;
> +	grant_ref_t gref_head;
>   	unsigned int i;
>   	int ret;
>   
> @@ -433,9 +390,25 @@ int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
>   		goto err;
>   	}
>   
> -	ret = xenbus_grant_ring(dev, *vaddr, nr_pages, grefs);
> -	if (ret)
> +	ret = gnttab_alloc_grant_references(nr_pages, &gref_head);
> +	if (ret) {
> +		xenbus_dev_fatal(dev, ret, "granting access to %u ring pages",
> +				 nr_pages);
>   		goto err;
> +	}
> +
> +	for (i = 0; i < nr_pages; i++) {
> +		unsigned long gfn;
> +
> +		if (is_vmalloc_addr(*vaddr))
> +			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr[i]));
> +		else
> +			gfn = virt_to_gfn(vaddr[i]);
> +
> +		grefs[i] = gnttab_claim_grant_reference(&gref_head);

gnttab_claim_grant_reference() can return error if no free grant 
reference remains.

I understand this patch only moves the code, but probably it would be 
better to add a missing check here (and likely rollback already 
processed grants if any?).



> +		gnttab_grant_foreign_access_ref(grefs[i], dev->otherend_id,
> +						gfn, 0);
> +	}
>   
>   	return 0;
>   
> diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> index b533b4adc835..eaa932b99d8a 100644
> --- a/include/xen/xenbus.h
> +++ b/include/xen/xenbus.h
> @@ -224,8 +224,6 @@ int xenbus_watch_pathfmt(struct xenbus_device *dev, struct xenbus_watch *watch,
>   			 const char *pathfmt, ...);
>   
>   int xenbus_switch_state(struct xenbus_device *dev, enum xenbus_state new_state);
> -int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
> -		      unsigned int nr_pages, grant_ref_t *grefs);
>   int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
>   		      unsigned int nr_pages, grant_ref_t *grefs);
>   void xenbus_teardown_ring(void **vaddr, unsigned int nr_pages,

-- 
Regards,

Oleksandr Tyshchenko


