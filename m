Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A3206FB1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 11:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo1Mx-0004o2-IY; Wed, 24 Jun 2020 09:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JaeF=AF=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jo1Mv-0004nx-I5
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 09:06:57 +0000
X-Inumbo-ID: 0d7bce02-b5fa-11ea-8496-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0d7bce02-b5fa-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592989615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWweQzpvz5qRvsYocQLFZ/CEELAJfUtNzgc7NW2oHMc=;
 b=CGhN7dyV+qMddUF4oBDwNhIkVao2HbnxaoePCr1VSfgO7bHrW/RfIy1dolC+IMQoYJpN/F
 xTj/RKsjY1TxQiMhxaj8IoJZ1zmGBJ4RwuOdkshKlKvtM5M3Qc5cxCTEUTPWUbMeHiJcDk
 ptgr8/KgF45U0nr2HI0tuFwQDy/wLFA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-qxNUxnGHObmsdMbvfjqgcw-1; Wed, 24 Jun 2020 05:06:54 -0400
X-MC-Unique: qxNUxnGHObmsdMbvfjqgcw-1
Received: by mail-wr1-f72.google.com with SMTP id a6so2292773wrq.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 02:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BWweQzpvz5qRvsYocQLFZ/CEELAJfUtNzgc7NW2oHMc=;
 b=M5dtTT2qu3QgcuCMr15YR8RTlZ/FpqLZcjTrvn6kdmNMfNyXTvNv60s8nw5hCqlsZn
 MrL7s6FnntBYqmrpQPlhJ0tOKv1o81OpgPGRT5uz92+e3aiD+eygSefLsj+9OIFJmOR+
 JUX8TS8ZmWZ12oWfA6O9jy7dBhlXftl8jXdk/soZTn53dsvqHW4CbU58g6X0DDbWqEir
 8D8UNzVc3i4NS0QmMYZ/o5nD3fpXA/97Sd5lQPeSYlKySglM6/3M7tUgOrdENkcpGOAG
 BoH0pAajinsO6zAIbElvph6MKJPJMEusDQ1vVu6MkSlSJX0B0q5Bgg7aHLxW+Gq5mpgV
 fB2Q==
X-Gm-Message-State: AOAM533a2Hw0HbOzStfZM71edmHNhHEf6iZO9stTItppGbYkqJZuue5i
 bwdIKPX4knIl2Zwg2rjLCaHcsT1REkieF85Cq2/n+XAqdkVzViUjSdJ07G8MQrWAvJbi2CsEcTk
 ROg2lvE+Q00DJLRxoBy1voNnikCE=
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr276000wmk.170.1592989612933; 
 Wed, 24 Jun 2020 02:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCjnIRq0GLGlJ0yYJ0oEVhHQJi+H1TnyLeWn06GTYZrPy1eSbfHNnWW2xTl+/KbPsMMBv1Rw==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr275986wmk.170.1592989612754; 
 Wed, 24 Jun 2020 02:06:52 -0700 (PDT)
Received: from redhat.com ([82.166.20.53])
 by smtp.gmail.com with ESMTPSA id n189sm7181712wmb.43.2020.06.24.02.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 02:06:51 -0700 (PDT)
Date: Wed, 24 Jun 2020 05:06:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200624050355-mutt-send-email-mst@kernel.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20200624091732.23944-1-peng.fan@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, sstabellini@kernel.org, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> Export xen_swiotlb for all platforms using xen swiotlb
> 
> Use xen_swiotlb to determine when vring should use dma APIs to map the
> ring: when xen_swiotlb is enabled the dma API is required. When it is
> disabled, it is not required.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
Xen was there first, but everyone else is using that now.


> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index a2de775801af..768afd79f67a 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -252,7 +252,7 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
>  	 * the DMA API if we're a Xen guest, which at least allows
>  	 * all of the sensible Xen configurations to work correctly.
>  	 */
> -	if (xen_domain())
> +	if (xen_vring_use_dma())
>  		return true;
>  
>  	return false;


The comment above this should probably be fixed.

-- 
MST


