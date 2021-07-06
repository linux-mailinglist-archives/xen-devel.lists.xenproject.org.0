Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDBC3BE1CB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 06:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151732.280633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0yma-0007VW-Tz; Wed, 07 Jul 2021 04:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151732.280633; Wed, 07 Jul 2021 04:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0yma-0007OB-Ny; Wed, 07 Jul 2021 04:03:32 +0000
Received: by outflank-mailman (input) for mailman id 151732;
 Tue, 06 Jul 2021 20:43:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lytm=L6=linaro.org=bjorn.andersson@srs-us1.protection.inumbo.net>)
 id 1m0rug-00086e-0R
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 20:43:26 +0000
Received: from mail-oo1-xc36.google.com (unknown [2607:f8b0:4864:20::c36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fef6214a-9c35-48ae-b0f7-70f294bd6364;
 Tue, 06 Jul 2021 20:43:24 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 o23-20020a4a2c170000b029025469ad0e4aso2476998ooo.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 13:43:24 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x130sm1332892oix.22.2021.07.06.13.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 13:43:23 -0700 (PDT)
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
X-Inumbo-ID: fef6214a-9c35-48ae-b0f7-70f294bd6364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pxMY07o9eA6SvMdwqfO/Cy/RP18zRy8WHvKUzTEaaNE=;
        b=cMEULcwqLZ1Wut54PhoGe8eWn9DWOkTBGefRRfl5OdVDl+rs626G5wMaH28cgDjzcy
         C3SrxS4IBWN9GT87WmK8g47N1LXQplCWDOfx8int0/GS3k/x/nkilLmTHNlFEJRG7MNd
         XBIkEEXZ1pU0eRvjS1TRSvA1B76ydqAA34SpYmKB2ihzHjiFB86o3rkOkpvBUwbSv3hH
         SAJ7sWW3535WnApBT/aqgm8mqOlZd3rAIlZ18pf5XSKHOT2S+byWJIp1xZIbcvBH0etl
         zsjB18jSpkL6JUn2+voD9bKAbUaWuj/V1AbjBFUkZHMHiCqgtvfqmj4sQqDjclnu51kM
         rRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pxMY07o9eA6SvMdwqfO/Cy/RP18zRy8WHvKUzTEaaNE=;
        b=tEHS6tMctvNVwRmeUVSF3z60OHvMvlUcBpigRXZ5gz4/nUaNOXxVgKqlTkprnAXzrK
         Oz6eQSOfJEnBI5u11XdPuLzS6pnLcnDz9qDjJ1+pGfbORsKY8sXcKo3N08ClcrfRq/K/
         xr9TL9tik/Uc/V4kAJezFftKvhWChh6p66b7209LwDYzOgWEBBZsK5FVyg4ocaupUwOn
         0QcnFrmRtsdMYF6LqPPm6vBtmcLVM8nXLaE8RpcgOTECMDhmy3QmkQ8Bn3wbMMMeS2C4
         JUCEZiTL+SYoHCipZkIMFkMdhdElToRfoi43BLJm4QYr7HTxOOkV4j6ueLcorsCOkNEE
         6G2g==
X-Gm-Message-State: AOAM531YTWSYexnIF3y1VaQ26rOuyM5UBc5scNGuk1Ge+M8sysp8EVVA
	EAMz8sy3EaOHyB+KB0v9tHXpgQ==
X-Google-Smtp-Source: ABdhPJxDvDPv3ADYsyyhWPVlnzb7CaqMGlOMdSkFiej4dUoXbTCedb2luVlDDH/zGyqw6KpVymfMhg==
X-Received: by 2002:a4a:d6cc:: with SMTP id j12mr2894172oot.0.1625604204373;
        Tue, 06 Jul 2021 13:43:24 -0700 (PDT)
Date: Tue, 6 Jul 2021 15:43:21 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Cc: nvdimm@lists.linux.dev, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-cxl@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, target-devel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-scsi@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org,
	industrypack-devel@lists.sourceforge.net,
	linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, greybus-dev@lists.linaro.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-spi@vger.kernel.org, kernel@pengutronix.de,
	dmaengine@vger.kernel.org, linux-ntb@googlegroups.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
Message-ID: <YOTAaQ7AnkCvRQaS@yoga>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
 <YOSb1+yeVeLxiSRc@yoga>
 <20210706184323.fudcbsiu4i34dojs@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706184323.fudcbsiu4i34dojs@pengutronix.de>

On Tue 06 Jul 13:43 CDT 2021, Uwe Kleine-K?nig wrote:

> Hello Bjorn,
> 
> On Tue, Jul 06, 2021 at 01:08:18PM -0500, Bjorn Andersson wrote:
> > On Tue 06 Jul 10:48 CDT 2021, Uwe Kleine-K?nig wrote:
> > > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > > index c1404d3dae2c..7f6fac618ab2 100644
> > > --- a/drivers/rpmsg/rpmsg_core.c
> > > +++ b/drivers/rpmsg/rpmsg_core.c
> > > @@ -530,7 +530,7 @@ static int rpmsg_dev_probe(struct device *dev)
> > >  	return err;
> > >  }
> > >  
> > > -static int rpmsg_dev_remove(struct device *dev)
> > > +static void rpmsg_dev_remove(struct device *dev)
> > >  {
> > >  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> > >  	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
> > > @@ -546,8 +546,6 @@ static int rpmsg_dev_remove(struct device *dev)
> > >  
> > >  	if (rpdev->ept)
> > >  		rpmsg_destroy_ept(rpdev->ept);
> > > -
> > > -	return err;
> > 
> > This leaves err assigned but never used, but I don't mind following up
> > with a patch cleaning that up after this has landed.
> 
> Ah, good catch. If I send out a v3 I will fold the following into this
> patch:
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 7f6fac618ab2..9151836190ce 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -534,10 +534,9 @@ static void rpmsg_dev_remove(struct device *dev)
>  {
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
> -	int err = 0;
>  
>  	if (rpdev->ops->announce_destroy)
> -		err = rpdev->ops->announce_destroy(rpdev);
> +		rpdev->ops->announce_destroy(rpdev);
>  
>  	if (rpdrv->remove)
>  		rpdrv->remove(rpdev);
> 

Sounds good, feel free to keep my ack on this.

> Maybe .announce_destroy() should then be changed to return void, too?
> Something like:
> 

Yes, I saw this opportunity as well. But that will fan out further, so
let's postpone that until your series has landed and we can follow up
with such changes through the remoteproc tree.

> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..d5204756714c 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -40,7 +40,7 @@ struct rpmsg_device_ops {
>  					    struct rpmsg_channel_info chinfo);
>  
>  	int (*announce_create)(struct rpmsg_device *ept);
> -	int (*announce_destroy)(struct rpmsg_device *ept);
> +	void (*announce_destroy)(struct rpmsg_device *ept);
>  };
>  
>  /**
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8e49a3bacfc7..4e05994634f8 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -340,7 +340,7 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>  	return err;
>  }
>  
> -static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> +static void virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  {
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  	struct virtproc_info *vrp = vch->vrp;
> @@ -360,8 +360,6 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  		if (err)
>  			dev_err(dev, "failed to announce service %d\n", err);
>  	}
> -
> -	return err;
>  }
>  
>  static const struct rpmsg_device_ops virtio_rpmsg_ops = {
> 
> though it's not obvious for me that the last hunk is sensible. (OTOH the
> return code is ignored anyhow as rpmsg_dev_remove() is the only caller.
> 

I need to backtrack a little bit more to figure out why we ended up with
this...

Thanks,
Bjorn

