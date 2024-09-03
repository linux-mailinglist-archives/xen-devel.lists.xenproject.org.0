Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2B969954
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 11:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788903.1198404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQ0M-0002Gc-Sn; Tue, 03 Sep 2024 09:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788903.1198404; Tue, 03 Sep 2024 09:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQ0M-0002E1-QH; Tue, 03 Sep 2024 09:39:18 +0000
Received: by outflank-mailman (input) for mailman id 788903;
 Tue, 03 Sep 2024 09:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u+Iv=QB=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1slQ0L-0002Dt-FY
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 09:39:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61f13b70-69d8-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 11:39:15 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-4xk_P4o9Pjy4VlWQpXznhQ-1; Tue, 03 Sep 2024 05:39:11 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42bbd062ac1so37185255e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 02:39:11 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bba57bb20sm142356975e9.4.2024.09.03.02.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 02:39:08 -0700 (PDT)
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
X-Inumbo-ID: 61f13b70-69d8-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
	b=IwA87VLU+B12aZLCohRZrPV2pic9PLha3G0m5T5TWCcH3QKKC/vMrXUPMlbTsT2neoVRnX
	wOchTASGIpXfEAO4QV67XpxWCZYXTB7HXJRa4AeAXitSpTuMhluM0QA2GBhKVcULC4ZAG1
	etPzDYBqId3NBfUj3zhBQDpJp6A5/VQ=
X-MC-Unique: 4xk_P4o9Pjy4VlWQpXznhQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356350; x=1725961150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
        b=mMWiqIuU7E+6KRT9ko6NO7h840U67vb+XXxsL9v7+YqG0QumeR37gGDUWcOhcoYsqG
         rQXQaQeWFTxg6gL7FVBp60D9q2i0Q+QqyxkctbDxFWkXq+70RRBBAq10Bqqe9Cr2f5Ff
         hZhpxqtrGgUfqxyflhfMUO3pkll2uIy4AWsv4SWPyP+4pfFTSCS5dIPc0goi1We8rI5t
         K5k/E9fZnsQ0m2vEPnsx2+LzwepxWECVCcW+uGlDW0AXAYOAdqlLvCvXM5fgncWmzxMc
         DMVrm1DVjxWiW5Vit6rHyRM9IM/5sLvfdJVXDWCXs2fJmdkTTih6xvLBahWlJD8zlvmB
         N+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXVw5fkZNt/QsGyfDT/nQbNCKaGNC35pOPMUZvJYWzPX7MCUNRGv6PNMcCoLtZh011w88F1NNtbRAQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yynhbnw8ltMwcyfzH7FH94xHu082PVR/vBTRDK8qdO4QTKlyZDw
	5Y0mk1SJjOwVhPN6yrCdia0zOTo1zIPrCqgqK4/9GO3A8z1ci1k6ax580Wa/Nbjl2Hln/i87i2h
	JGysMOAD6SCZkhPY6T4YzSc0IOzpnUITJscIp5A07dBqOR/FygW5oZd7rJFM53WPO
X-Received: by 2002:a05:600c:3d0d:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-42bdc6375abmr66533025e9.19.1725356350122;
        Tue, 03 Sep 2024 02:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmeosf/mJIf4OuBVOC1FXDQtaN47WobnVUFS/lrBzspPK+LAJFhvAiwYTR4QIKkjIzV+Hhfw==
X-Received: by 2002:a05:600c:3d0d:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-42bdc6375abmr66532735e9.19.1725356349385;
        Tue, 03 Sep 2024 02:39:09 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:39:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] vdpa_sim: don't select DMA_OPS
Message-ID: <20240903053857-mutt-send-email-mst@kernel.org>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240828061104.1925127-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20240828061104.1925127-2-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 28, 2024 at 09:10:28AM +0300, Christoph Hellwig wrote:
> vdpa_sim has been fixed to not override the dma_map_ops in commit
> 6c3d329e6486 ("vdpa_sim: get rid of DMA ops"), so don't select the
> symbol and don't depend on HAS_DMA.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/vdpa/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> index 5265d09fc1c409..b08de3b7706109 100644
> --- a/drivers/vdpa/Kconfig
> +++ b/drivers/vdpa/Kconfig
> @@ -11,8 +11,7 @@ if VDPA
>  
>  config VDPA_SIM
>  	tristate "vDPA device simulator core"
> -	depends on RUNTIME_TESTING_MENU && HAS_DMA
> -	select DMA_OPS
> +	depends on RUNTIME_TESTING_MENU
>  	select VHOST_RING
>  	select IOMMU_IOVA
>  	help
> -- 
> 2.43.0


