Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C058D2EC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 06:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382677.617679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLGrr-0007L3-B2; Tue, 09 Aug 2022 04:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382677.617679; Tue, 09 Aug 2022 04:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLGrr-0007IF-7u; Tue, 09 Aug 2022 04:29:23 +0000
Received: by outflank-mailman (input) for mailman id 382677;
 Tue, 09 Aug 2022 04:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLGrp-0007I9-H0
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 04:29:21 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5af12de-179b-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 06:29:20 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso5638155pjb.2
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 21:29:19 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a17090b08d700b001f3162e4e55sm8957064pjb.35.2022.08.08.21.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 21:29:07 -0700 (PDT)
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
X-Inumbo-ID: d5af12de-179b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=wBbhkQGuv3KTB1QKPdDHYYXWmoJFS7PIyaq22fNBfO0=;
        b=LuACcZIaTD/DaUe8ZBWs8WROt5YUIWMC2cwAAkG3KB1Rz5j7jOkOk6U4KITcNsJbKo
         KleNW4tY/AbsQxPzNuHXutCJ67w4OulSB3xNRCf3HB/7YhYVfqjaRfA6d9g1hmYGVq5x
         VIe45pKFlmbGwbdAfHEeH5/dotsahEm9omY6qkH8d/EzOAkmMkKyAFM6DAy0G90rfJAW
         Z6bUbOB6TCAFD5BS+iv/k23fzGDzh2W/w5b+URFSXhKeQrFCUTVnaQG+ZneHyBo5/GRN
         gh7hDJnhyvoMfBCr6Cjf2iij3s5p+FZPt2IV2/HaT10bgbhOKgMDHHgnv2aJb5Cahjys
         3qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=wBbhkQGuv3KTB1QKPdDHYYXWmoJFS7PIyaq22fNBfO0=;
        b=1H4PtjFM6oQcfcXlen1u4TW6RkUXY7CN4x93lbrQLVXpAh9xKLub/ihd0fc/9ZSamG
         YeOBfVrqRuGwWGjbAtWe6NDCCob1JPTWn/XLii/cZqtlL/1kYe7RkUixV1NZq1QMGvS8
         YRnDWOljdtqDG5fYBdrJ5qi8TcMG6Yjd8PXj0lbqtnNmxCTiN71Wygd7Wr+cBQjsRpGJ
         WVmGGGXB3aOo236tx6BAuLqGY6qpSWeF7rm7YbKtjCQy3eohFLNeSAQVpsfj0MEuUBcr
         rG00tjuREpA/6ytU9pnWm4/YOG8k+eLJcS+bqL/6OVG2IaQ4a0GIHgOaBEy4vHGCit28
         u0sQ==
X-Gm-Message-State: ACgBeo3XE+EMCWVBSNrxrVIgxIEnG6va8dJN+UCcdisvyu7z6VV6Jdb5
	gmeieX57qWG/ZFLz7L5kvL6RG2SvR6Nc8w==
X-Google-Smtp-Source: AA6agR7yVTqq94sfNx6I/j1IL1oSzJcZVzSE4wxxnsL2eKj4dtcbWG/sEqI/++EIC9395We8z18+yw==
X-Received: by 2002:a17:902:7c8a:b0:16f:4d4:ced8 with SMTP id y10-20020a1709027c8a00b0016f04d4ced8mr21818115pll.15.1660019348197;
        Mon, 08 Aug 2022 21:29:08 -0700 (PDT)
Date: Tue, 9 Aug 2022 09:59:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V3 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Message-ID: <20220809042905.stgxxaofmtmwwkp4@vireshk-i7>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
 <ae3e61fe687cb2d9dac17622da2ec81c4064db39.1659596139.git.viresh.kumar@linaro.org>
 <82a9d50c-58ef-1842-be7f-33a05d861f15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82a9d50c-58ef-1842-be7f-33a05d861f15@gmail.com>

On 08-08-22, 21:39, Oleksandr wrote:
> 
> On 04.08.22 10:01, Viresh Kumar wrote:
> 
> Hello Viresh
> 
> 
> > Create a separate routine to allocate base and irq for a device as the
> > same code will be required for each device type.
> > 
> > Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >   tools/libs/light/libxl_arm.c | 38 ++++++++++++++++++++++++------------
> >   1 file changed, 25 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index 1a3ac1646e94..2f64b9f0ebee 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -48,6 +48,24 @@ static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc, uint32_t *virtio_mmio_irq)
> >       return irq;
> >   }
> > +static int alloc_virtio_mmio_params(libxl__gc *gc, uint64_t *base,
> > +                                    uint32_t *irq, uint64_t *virtio_mmio_base,
> > +                                    uint32_t *virtio_mmio_irq)
> > +{
> > +    *base = alloc_virtio_mmio_base(gc, virtio_mmio_base);
> > +    if (!*base)
> > +        return ERROR_FAIL;
> > +
> > +    *irq = alloc_virtio_mmio_irq(gc, virtio_mmio_irq);
> > +    if (!*irq)
> > +        return ERROR_FAIL;
> > +
> > +    LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 0x%"PRIx64, *irq,
> > +        *base);
> > +
> > +    return 0;
> > +}
> > +
> >   static const char *gicv_to_string(libxl_gic_version gic_version)
> >   {
> >       switch (gic_version) {
> > @@ -85,20 +103,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >           libxl_device_disk *disk = &d_config->disks[i];
> >           if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> > -            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
> > -            if (!disk->base)
> > -                return ERROR_FAIL;
> > +            int rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
> > +                    &virtio_mmio_base, &virtio_mmio_irq);
> > +            if (rc)
> > +                return rc;
> > -            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
> > -            if (!disk->irq)
> > -                return ERROR_FAIL;
> > -
> > -            if (virtio_irq < disk->irq)
> > -                virtio_irq = disk->irq;
> >               virtio_enabled = true;
> 
>    I think that "virtio_enabled = true;" should be moved ...
> 
> 
> > -
> > -            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
> > -                disk->vdev, disk->irq, disk->base);
> >           }
> >       }
> > @@ -107,8 +117,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >        * present, make sure that we allocate enough SPIs for them.
> >        * The resulting "nr_spis" needs to cover the highest possible SPI.
> >        */
> > -    if (virtio_enabled)
> > +    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
> > +        virtio_irq = virtio_mmio_irq - 1;
> >           nr_spis = max(nr_spis, virtio_irq - 32 + 1);
> 
>  ... here. Otherwise after applying all patches "virtio_enabled" only gets
> set if there is a virtio disk device. So it won't be set for virtio i2c,
> etc.
> 
> I see that in V2 it was there, but in V3 is not. Or maybe there is some
> reason for doing that which I am not aware of?

There is only one use of virtio_enabled after this patch, i.e. do
check for vpl011. Maybe we can drop the variable and use
virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST ?

-- 
viresh

