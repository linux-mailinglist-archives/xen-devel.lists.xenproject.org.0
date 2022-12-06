Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81B64423F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454728.712264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WGS-0003CT-62; Tue, 06 Dec 2022 11:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454728.712264; Tue, 06 Dec 2022 11:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WGS-00039f-2u; Tue, 06 Dec 2022 11:37:32 +0000
Received: by outflank-mailman (input) for mailman id 454728;
 Tue, 06 Dec 2022 11:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjLg=4E=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1p2WGQ-00039W-Cj
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:37:30 +0000
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c3d102d-755a-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:37:27 +0100 (CET)
Received: by mail-wr1-f52.google.com with SMTP id h7so17033638wrs.6
 for <xen-devel@lists.xenproject.org>; Tue, 06 Dec 2022 03:37:29 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0024207ed4ce0sm16635553wrx.58.2022.12.06.03.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 03:37:27 -0800 (PST)
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
X-Inumbo-ID: 5c3d102d-755a-11ed-8fd2-01056ac49cbb
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dEEPgYHWLWGN87zsbE4biUqCxTkyL0Hp4s+LmxL1OA=;
        b=KsPuvk5Be9LGlHOEzAH9ky2LMwC8NnFLKOq2UzLa212RVxbMV9ZBEFYRsC7x5wFKLo
         eXmC/C0HLaQFixOUPxGfT7SdoG2hlDwFAd1UZ700ojTJV0MP0ZJ5VPc6GIXe1YSD3zfl
         JvWkLyj71ddGXZZMeWK1g383Av8g4ptqLSs+Kwzwg1VKIcLb75PS6AlRt0i10eZqX5CX
         AsAiizraB0juM4aFIJcuk7Dbq0+tgd8eHbqsATo6pi8ouT7BCOWGCEFqfOJuxjxtSp9K
         8HIeEY8rlzQ5Ael6w9T1sUDy4DJUnKt+qCDohSxgk/vFek68msGYi6xCainvkmCdDnWE
         nV0w==
X-Gm-Message-State: ANoB5pnqsTp72tYLz9T0atP17+Yzp76OmDg/XNLGR8tlhbSPrqWvH39+
	Z7ajRBQPiiz+KEgCBziynw4=
X-Google-Smtp-Source: AA0mqf5IQao7pI3S55ozIZ3UILwG0zwLXEWSh3JhE8Rsg0wuM8pdCGyXY1E8JKqEYaIaMJ9EdjlENQ==
X-Received: by 2002:a5d:5385:0:b0:242:f8d:fcee with SMTP id d5-20020a5d5385000000b002420f8dfceemr27418643wrv.86.1670326648777;
        Tue, 06 Dec 2022 03:37:28 -0800 (PST)
Date: Tue, 6 Dec 2022 11:37:26 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Dawei Li <set_pte_at@outlook.com>
Cc: gregkh@linuxfoundation.org, johannes@sipsolutions.net,
	robert.jarzmik@free.fr, jgross@suse.com, sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com, roger.pau@citrix.com,
	srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] hyperv: Make remove callback of hyperv driver void
 returned
Message-ID: <Y48pdr9DEmXShhFR@liuwe-devbox-debian-v2>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>

On Mon, Dec 05, 2022 at 11:36:39PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for hyperv bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
[...]
> -static int netvsc_remove(struct hv_device *dev)
> +static void netvsc_remove(struct hv_device *dev)
>  {
>  	struct net_device_context *ndev_ctx;
>  	struct net_device *vf_netdev, *net;
> @@ -2603,7 +2603,6 @@ static int netvsc_remove(struct hv_device *dev)
>  	net = hv_get_drvdata(dev);
>  	if (net == NULL) {
>  		dev_err(&dev->device, "No net device to remove\n");
> -		return 0;

This is wrong. You are introducing a NULL pointer dereference.

>  	}
>  
>  	ndev_ctx = netdev_priv(net);
> @@ -2637,7 +2636,6 @@ static int netvsc_remove(struct hv_device *dev)
>  
>  	free_percpu(ndev_ctx->vf_stats);
>  	free_netdev(net);
> -	return 0;
>  }
>  
>  static int netvsc_suspend(struct hv_device *dev)
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index ba64284eaf9f..3a09de70d6ea 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -3756,7 +3756,7 @@ static int hv_pci_bus_exit(struct hv_device *hdev, bool keep_devs)
>   *
>   * Return: 0 on success, -errno on failure
>   */

This comment is no longer needed in the new world.

But, are you sure you're modifying the correct piece of code?

hv_pci_remove is not a hook in the base bus type. It is used in struct
hv_driver.

The same comment applies to all other modifications.

Thanks,
Wei.

