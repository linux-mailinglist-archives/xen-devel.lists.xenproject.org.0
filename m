Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1A4575F36
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 12:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368084.599267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIMF-0002PN-GS; Fri, 15 Jul 2022 10:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368084.599267; Fri, 15 Jul 2022 10:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIMF-0002Mb-DJ; Fri, 15 Jul 2022 10:15:39 +0000
Received: by outflank-mailman (input) for mailman id 368084;
 Fri, 15 Jul 2022 10:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oCIME-0001pF-D4
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 10:15:38 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 123b98fa-0427-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 12:15:37 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id o7so7058791lfq.9
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jul 2022 03:15:37 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a19674a000000b00483f8c40c14sm835123lfj.243.2022.07.15.03.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 03:15:36 -0700 (PDT)
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
X-Inumbo-ID: 123b98fa-0427-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3jL/lfoMTvA3SObDpy7W+GRYeEbbVoydVSs+VhMSyQ8=;
        b=LKqUeJAhYet/E4+FOjDCJ0dKq4cDW2x4E+rfQdu83sWKvClZdCu1e1M0E0f3NVLWeY
         RXqHP7rrV4Gy0UvBJZ6Bv4RiaH1MNOZ0zYRfjZ35s6KLeY6hYXQcra7SL8Bs6qETPdr5
         dYYLgG48qse3A1sQodtQrzuSaIVuhSnWYGOCsfY5B7tL5JDS6Z3SbspiTM2N6zT81LBz
         GrmAOEmVMPpU117asGxfbCJUPK8r1VAAGAELjEv0s/Ph5p+GAAYDP5wadDJdkdPE4Jv9
         Ebcy0Ity1RZ3igPwXdeAet2+5VSr+p+LL13YixBvp19SsNp9YpNMvk/gnMMrJ07RuCcm
         55Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3jL/lfoMTvA3SObDpy7W+GRYeEbbVoydVSs+VhMSyQ8=;
        b=fSrqG5G6Y61cMj7F7GOOBux7EZPNnqMCjPs56aQuCtPXON+7B3/zTTAJ0s2UEBakzX
         pW4mH9ciMgIjwYdKuAdQI4gbIYPDh1oeAesgjynEmS5gLxM/T3XdwtsE2xaD0uBceWZ3
         UkfV1wSljbZVDoC5bRw5lRdN8F438/6kP8s03WXlK+Mdubj6fMmjVBnR5mZz0YlUqaYO
         FjLtcYccJjneSXuEacE7vsM9zE22wrNDYsao2EfhE3eGKEyb8cguhKx3jl/5Y4G3sKU1
         MG/JPPsb61gx266K7U3q3FGVtUI+HljUyPOEYzRIyFXBiVSV/jF4NPNQdJ6d/NGeKKtu
         Plpg==
X-Gm-Message-State: AJIora+qHz+mEw3Owny3lE/KB/tf+xrVucK/wO2Yk+TjGoy8rZ+1XhlM
	8bjbQjfJR6TT+WsEtbL3QS4=
X-Google-Smtp-Source: AGRyM1t48mlwdtZzT1aWp5fHW0tldYcGnnIY2KtrlB80elovY46YP+G88J/+IMfODsBiDN0SPqzLiA==
X-Received: by 2002:a19:4f0b:0:b0:489:c753:5c1d with SMTP id d11-20020a194f0b000000b00489c7535c1dmr7473118lfb.339.1657880136897;
        Fri, 15 Jul 2022 03:15:36 -0700 (PDT)
Message-ID: <41207539-f621-1bb2-2f43-0b2b9e3f6866@gmail.com>
Date: Fri, 15 Jul 2022 13:15:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] xen-blkback: fix persistent grants negotiation
Content-Language: en-US
To: SeongJae Park <sj@kernel.org>, roger.pau@citrix.com, jgross@suse.com
Cc: axboe@kernel.dk, boris.ostrovsky@oracle.com, mheyne@amazon.de,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 andrii.chepurnyi82@gmail.com
References: <20220714224410.51147-1-sj@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <20220714224410.51147-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 15.07.22 01:44, SeongJae Park wrote:


Hello all.

Adding Andrii Chepurnyi to CC who have played with the use-case which 
required reconnect recently and faced some issues with 
feature_persistent handling.




> Persistent grants feature can be used only when both backend and the
> frontend supports the feature.  The feature was always supported by
> 'blkback', but commit aac8a70db24b ("xen-blkback: add a parameter for
> disabling of persistent grants") has introduced a parameter for
> disabling it runtime.
>
> To avoid the parameter be updated while being used by 'blkback', the
> commit caches the parameter into 'vbd->feature_gnt_persistent' in
> 'xen_vbd_create()', and then check if the guest also supports the
> feature and finally updates the field in 'connect_ring()'.
>
> However, 'connect_ring()' could be called before 'xen_vbd_create()', so
> later execution of 'xen_vbd_create()' can wrongly overwrite 'true' to
> 'vbd->feature_gnt_persistent'.  As a result, 'blkback' could try to use
> 'persistent grants' feature even if the guest doesn't support the
> feature.
>
> This commit fixes the issue by moving the parameter value caching to
> 'xen_blkif_alloc()', which allocates the 'blkif'.  Because the struct
> embeds 'vbd' object, which will be used by 'connect_ring()' later, this
> should be called before 'connect_ring()' and therefore this should be
> the right and safe place to do the caching.
>
> Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>
> Changes from v1[1]
> - Avoid the behavioral change[2]
> - Rebase on latest xen/tip/linux-next
> - Re-work by SeongJae Park <sj@kernel.org>
> - Cc stable@
>
> [1] https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/
> [2] https://lore.kernel.org/xen-devel/20220121102309.27802-1-sj@kernel.org/
>
>   drivers/block/xen-blkback/xenbus.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index 97de13b14175..16c6785d260c 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -157,6 +157,11 @@ static int xen_blkif_alloc_rings(struct xen_blkif *blkif)
>   	return 0;
>   }
>   
> +/* Enable the persistent grants feature. */
> +static bool feature_persistent = true;
> +module_param(feature_persistent, bool, 0644);
> +MODULE_PARM_DESC(feature_persistent, "Enables the persistent grants feature");
> +
>   static struct xen_blkif *xen_blkif_alloc(domid_t domid)
>   {
>   	struct xen_blkif *blkif;
> @@ -181,6 +186,8 @@ static struct xen_blkif *xen_blkif_alloc(domid_t domid)
>   	__module_get(THIS_MODULE);
>   	INIT_WORK(&blkif->free_work, xen_blkif_deferred_free);
>   
> +	blkif->vbd.feature_gnt_persistent = feature_persistent;
> +
>   	return blkif;
>   }
>   
> @@ -472,12 +479,6 @@ static void xen_vbd_free(struct xen_vbd *vbd)
>   	vbd->bdev = NULL;
>   }
>   
> -/* Enable the persistent grants feature. */
> -static bool feature_persistent = true;
> -module_param(feature_persistent, bool, 0644);
> -MODULE_PARM_DESC(feature_persistent,
> -		"Enables the persistent grants feature");
> -
>   static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
>   			  unsigned major, unsigned minor, int readonly,
>   			  int cdrom)
> @@ -520,8 +521,6 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
>   	if (bdev_max_secure_erase_sectors(bdev))
>   		vbd->discard_secure = true;
>   
> -	vbd->feature_gnt_persistent = feature_persistent;
> -
>   	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
>   		handle, blkif->domid);
>   	return 0;

-- 
Regards,

Oleksandr Tyshchenko


