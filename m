Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F893BE1CA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 06:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151608.280628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0yma-0007Nm-Ht; Wed, 07 Jul 2021 04:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151608.280628; Wed, 07 Jul 2021 04:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0yma-0007L7-AR; Wed, 07 Jul 2021 04:03:32 +0000
Received: by outflank-mailman (input) for mailman id 151608;
 Tue, 06 Jul 2021 18:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lytm=L6=linaro.org=bjorn.andersson@srs-us1.protection.inumbo.net>)
 id 1m0pUd-0006Be-JG
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 18:08:23 +0000
Received: from mail-ot1-x331.google.com (unknown [2607:f8b0:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08e87094-677b-4ee8-9554-efdf7dd1128e;
 Tue, 06 Jul 2021 18:08:22 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 f12-20020a056830204cb029048bcf4c6bd9so10394211otp.8
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 11:08:22 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 68sm497113otd.74.2021.07.06.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 11:08:21 -0700 (PDT)
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
X-Inumbo-ID: 08e87094-677b-4ee8-9554-efdf7dd1128e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rFh4HQBpaw9ewOD7eKuJ7KI9YAzHhN8tlxJ6LopMKHs=;
        b=Sz6rE6fIxKghlltcLCE+UXPsQefAUgPvTMscjeRzq2kl6NTGV49umux5xM0XcDuF3f
         KuSKKfkZ8nSISGEXHz3w1v+CP9bxuRJkim+LBmkXAMBhskBSVWy4R8UYC7L1pwY+g7hz
         Zg3WKG3mRVhsusU5VFmdXh5UPocqhZf4lahEU95r9tDGNbsVfHF1Q4HkA+YZfm/i81fd
         v0xNi9dJEaEvf856OdG6fjSc31APYItT+IUiPzbg0w9QbfcYoXqLRo58SwLlUHuXr/Qb
         gjgu5RAVRwk/bKL57rYJjqGIxVt7qPeDusZUEamQ36NdV7/ZYwdc/uo7wSJkJLcpf0tD
         jOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rFh4HQBpaw9ewOD7eKuJ7KI9YAzHhN8tlxJ6LopMKHs=;
        b=b1fx3YtImkEU8dMJ+MRkYzXF/ESAdcP+6QzX8TSZfmcU0WDsV2u1gNRgcKvXpPI07f
         VvsrkMOYXMlPjrkmt+95Pp8tJr6ABAvkvbTwLcs3y2MRDs/w71zhB/9KfzaOLeid/xQM
         n6OLpfoY1besM9zsXo6nhcpQRCrTHNdjZskqedwvng3o0wJrisMcA7u+tzHvemvtoytL
         Qbn5rGp2drAmTbFa4cFkWgDHkhQvN1iBxFs4WNbhJOa2TGI8KSIGWKCcMUJrjzSQ91H5
         V9z9vOBx7svDkCYd4yfIqoKTecsy1tBvPGHGMH7Nx2VLVHbxCQWKq4rV81k5BDLjwO5r
         bARQ==
X-Gm-Message-State: AOAM530R31SJ2LpLb/53R9xnTweIB9jBrTfmVHEZT0jWeNe8xjsIrwPV
	v+vOqHOW9JQISZm6xm7Ubha25Q==
X-Google-Smtp-Source: ABdhPJwwC8pa+wbm0v5SSaX+DFJoQ7jJmXTjdD3iH0933Y2rw8Y2+zYlxp2w0qjcBNkHXGnjSvRJ6w==
X-Received: by 2002:a9d:3d3:: with SMTP id f77mr16276146otf.43.1625594902170;
        Tue, 06 Jul 2021 11:08:22 -0700 (PDT)
Date: Tue, 6 Jul 2021 13:08:18 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	industrypack-devel@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-ntb@googlegroups.com,
	linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
Message-ID: <YOSb1+yeVeLxiSRc@yoga>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>

On Tue 06 Jul 10:48 CDT 2021, Uwe Kleine-K?nig wrote:

> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 

Thanks for doing this!

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org> (rpmsg and apr)

[..]
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index c1404d3dae2c..7f6fac618ab2 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -530,7 +530,7 @@ static int rpmsg_dev_probe(struct device *dev)
>  	return err;
>  }
>  
> -static int rpmsg_dev_remove(struct device *dev)
> +static void rpmsg_dev_remove(struct device *dev)
>  {
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
> @@ -546,8 +546,6 @@ static int rpmsg_dev_remove(struct device *dev)
>  
>  	if (rpdev->ept)
>  		rpmsg_destroy_ept(rpdev->ept);
> -
> -	return err;

This leaves err assigned but never used, but I don't mind following up
with a patch cleaning that up after this has landed.

>  }
>  
>  static struct bus_type rpmsg_bus = {

Regards,
Bjorn

