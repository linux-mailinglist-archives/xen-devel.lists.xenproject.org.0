Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E281051F72B
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 10:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324292.546268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnz30-0005BF-Pt; Mon, 09 May 2022 08:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324292.546268; Mon, 09 May 2022 08:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnz30-00057x-Mz; Mon, 09 May 2022 08:47:18 +0000
Received: by outflank-mailman (input) for mailman id 324292;
 Mon, 09 May 2022 08:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9uc=VR=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnz2y-00057r-HZ
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 08:47:16 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a05db9b0-cf74-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 10:47:15 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id l19so16133042ljb.7
 for <xen-devel@lists.xenproject.org>; Mon, 09 May 2022 01:47:15 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a0565123f9800b0047255d210f9sm1873536lfa.40.2022.05.09.01.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 01:47:14 -0700 (PDT)
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
X-Inumbo-ID: a05db9b0-cf74-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DYNt4TBqj6ErOEIb2vmeDUEERsqugwRt+n6gRx6FEKI=;
        b=Mq5M0v2gQEeCQHi//3MX5o3RITeEaX9QoaxxaxGof+tAtKg33WpCYXYGSQvBpt6SUj
         yzHLogFl9drbImkUax0mi+oIkGKev1MF31FmpnyWawJV76w0UQGzXgiWowRaicmtwykz
         c3O2p5wqFBGTbN3z5FLz8XduhQ0dH4F8oOSvTczB124rlTXcxm+o9erIB4QIl754Kth8
         fGheBg0syAeef7GFsFvOSjdgJA0odNQZ53yMSLD4DS4DVCafwq9fkBg4Mef/xNddvhTC
         qTZpfuiF4EpLRGI982VEeiC7diU0ydRKJ+j6cDctXDUR6cd83hXaSjQgpCU5r9SNAlpM
         3nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DYNt4TBqj6ErOEIb2vmeDUEERsqugwRt+n6gRx6FEKI=;
        b=qqbqEIHWOJsbIiLaU1vasS8RTqEyLbDKlJS8G8bpEJGgC0la6ub4rkHdnEg8igkX3V
         uHPJtm4UAFVY40iRWu9H3dGvkbrmI5OmFAcz6XWLYVGh8L2bgGks3BC+0c94zeqZATcj
         wMdMC/0jwlAmPJer/B6elIrRP9kbmGy2zPyAbkeiZivKPrmI+HeYtr1tMAGxD57TZ6rN
         dtyd0WKRu06cixHa5tmhDSMu+wWbtGpgpCEcPjpdGZuwYKbTrVlWdLs3/BnldXjwzAek
         iA2/VPDEYmfm4KtgMNtMhf2/DY/aAtN8Gem/l5W0jNBIxlbjcwSFqdzx34BXAIGiY+GA
         KXjg==
X-Gm-Message-State: AOAM530rGYw4Le0bweQiderqHJwb1tetjguA9YsS9S9h+Ibkwi7cJxYj
	5//glchNQJq+tsjKS64lBAQ=
X-Google-Smtp-Source: ABdhPJyxcF3KC3PxB+4E8Fv7u5DB6AZHIdMNTboOqQO9vjVuh8yyzTf9QASCslnG2AmUu2/UwH0Mlg==
X-Received: by 2002:a2e:934b:0:b0:24f:cce:5501 with SMTP id m11-20020a2e934b000000b0024f0cce5501mr10238843ljh.443.1652086035017;
        Mon, 09 May 2022 01:47:15 -0700 (PDT)
Subject: Re: [PATCH v3 10/21] xen/shbuf: switch xen-front-pgdir-shbuf to use
 INVALID_GRANT_REF
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220505081640.17425-1-jgross@suse.com>
 <20220505081640.17425-11-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b49526cd-b4b3-c44f-4c94-9a6f51e93927@gmail.com>
Date: Mon, 9 May 2022 11:47:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220505081640.17425-11-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.05.22 11:16, Juergen Gross wrote:


Hello Juergen


> Instead of using a private macro for an invalid grant reference use
> the common one.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - terminate grant ref list with 0 (Oleksandr Tyshchenko)


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


> ---
>   drivers/xen/xen-front-pgdir-shbuf.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pgdir-shbuf.c
> index a959dee21134..b6433761d42c 100644
> --- a/drivers/xen/xen-front-pgdir-shbuf.c
> +++ b/drivers/xen/xen-front-pgdir-shbuf.c
> @@ -21,15 +21,6 @@
>   
>   #include <xen/xen-front-pgdir-shbuf.h>
>   
> -#ifndef GRANT_INVALID_REF
> -/*
> - * FIXME: usage of grant reference 0 as invalid grant reference:
> - * grant reference 0 is valid, but never exposed to a PV driver,
> - * because of the fact it is already in use/reserved by the PV console.
> - */
> -#define GRANT_INVALID_REF	0
> -#endif
> -
>   /**
>    * This structure represents the structure of a shared page
>    * that contains grant references to the pages of the shared
> @@ -38,6 +29,7 @@
>    */
>   struct xen_page_directory {
>   	grant_ref_t gref_dir_next_page;
> +#define XEN_GREF_LIST_END	0
>   	grant_ref_t gref[1]; /* Variable length */
>   };
>   
> @@ -83,7 +75,7 @@ grant_ref_t
>   xen_front_pgdir_shbuf_get_dir_start(struct xen_front_pgdir_shbuf *buf)
>   {
>   	if (!buf->grefs)
> -		return GRANT_INVALID_REF;
> +		return INVALID_GRANT_REF;
>   
>   	return buf->grefs[0];
>   }
> @@ -142,7 +134,7 @@ void xen_front_pgdir_shbuf_free(struct xen_front_pgdir_shbuf *buf)
>   		int i;
>   
>   		for (i = 0; i < buf->num_grefs; i++)
> -			if (buf->grefs[i] != GRANT_INVALID_REF)
> +			if (buf->grefs[i] != INVALID_GRANT_REF)
>   				gnttab_end_foreign_access(buf->grefs[i], 0UL);
>   	}
>   	kfree(buf->grefs);
> @@ -355,7 +347,7 @@ static void backend_fill_page_dir(struct xen_front_pgdir_shbuf *buf)
>   	}
>   	/* Last page must say there is no more pages. */
>   	page_dir = (struct xen_page_directory *)ptr;
> -	page_dir->gref_dir_next_page = GRANT_INVALID_REF;
> +	page_dir->gref_dir_next_page = XEN_GREF_LIST_END;
>   }
>   
>   /**
> @@ -384,7 +376,7 @@ static void guest_fill_page_dir(struct xen_front_pgdir_shbuf *buf)
>   
>   		if (grefs_left <= XEN_NUM_GREFS_PER_PAGE) {
>   			to_copy = grefs_left;
> -			page_dir->gref_dir_next_page = GRANT_INVALID_REF;
> +			page_dir->gref_dir_next_page = XEN_GREF_LIST_END;
>   		} else {
>   			to_copy = XEN_NUM_GREFS_PER_PAGE;
>   			page_dir->gref_dir_next_page = buf->grefs[i + 1];

-- 
Regards,

Oleksandr Tyshchenko


