Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CDA5D6AD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 07:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909968.1316783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsG0U-0008D9-Uv; Wed, 12 Mar 2025 06:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909968.1316783; Wed, 12 Mar 2025 06:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsG0U-0008BX-S0; Wed, 12 Mar 2025 06:55:58 +0000
Received: by outflank-mailman (input) for mailman id 909968;
 Wed, 12 Mar 2025 06:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hgYX=V7=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tsG0S-0008BI-St
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 06:55:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ac24e71-ff0f-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 07:55:55 +0100 (CET)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-iGj6mRDAM-uRs9NeWS5Xog-1; Wed, 12 Mar 2025 02:55:52 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39141ffa913so2101690f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 23:55:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-394a8a5a304sm565705f8f.40.2025.03.11.23.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 23:55:50 -0700 (PDT)
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
X-Inumbo-ID: 0ac24e71-ff0f-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741762554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M5urNoJLNtNizXgsJBqJ+K7FyEmcih4A00lRbzK+XcU=;
	b=cfdx6bEWMVEBpVOc4NpurOqLnfNg7n19bwbGRKkrpjDH3074vULp6OLn9vhJvRZTdQF7fl
	mO7/bMTDhImiG0F/D1FmhnuqKs9xOQfh/Ahzlzz4mZrcABORLGW3ZOdNYhAPreSWijm4Ye
	mMia4Ypnq01hUkZw4t1tMk3xE5cCZWg=
X-MC-Unique: iGj6mRDAM-uRs9NeWS5Xog-1
X-Mimecast-MFC-AGG-ID: iGj6mRDAM-uRs9NeWS5Xog_1741762551
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741762551; x=1742367351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5urNoJLNtNizXgsJBqJ+K7FyEmcih4A00lRbzK+XcU=;
        b=iSZVAQrPEZxIM5bp6MKMP7lT4eTXkjkJu6yBIyUMuxivBZPbZ/gEWqdQea/R3t6RcB
         XQxsh/dNGUEIkW4ux1Wht7tZ52C0SH8vEY7BeZwNRzwYJz3C4nXqM9eBwywtmYPJHren
         OOAyWfgRezjJYoKH+hN1UYtYQNkfFCKVsrxpMHRkObkJjTlxu/0aZ4gAe7WP4vREHoxK
         cHUjgXot2Z8Xfs/TlC5SZMvQjuiAeIrW78WJGQuBUuFIcIawVeiq9x+luukTXOzQCRBW
         qzczlpB9yWOVeIsoIvGwH9eNQ46kkePIVcuWgR6bolstw6gnktYR2vo2TXv8kbSRkSlI
         6O7g==
X-Forwarded-Encrypted: i=1; AJvYcCUeysXAV3lzx41Kg1dR5XP//MNzfuv/BIS/Lr/4jfjJlGzT+uYaiPuizCzWMeX8DWebSCNf0C//bSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwX19RGPE5jHGfBgmF5znmuxvmAu9Gj3XAmiTPfap3p3WkOkXbJ
	h2w2oNT2wrY9NU7d5HX240l+HcpbbB1kBZrJ7DcXeM7vGwOoelp8Vy2AUFI3DNk35aBhQ4Mf4LB
	1hIN2i22wsdbcorB17O3yjIKnhGPWHf1NV015CUhxuY8Pt+8v6wNl+6CZo1nnOK93
X-Gm-Gg: ASbGncsxS+KxGkIy2OP9xMH6dCJF1KtjLtCW/BP4UlfnI2dKo+frDsxN86shk/KV1o7
	3JHVc+u4P9EBYpQr+2AlnAWgWyyNwwapReJvEQxQeIye428aXZ1nbaAy9hp5lbEnFJOtVphw6UD
	IGib6PL5OlimXQmrTqP5lDYaaqzX36Oc1IKEsdLjdJn7ufXM3hXvhnH9eJx4+GNQzOy66bUfi0M
	t6v3ZyZA1JGMICLxg21g4MTk0Fxk49tQqxfKpkyPJfhy7uWXnUf0dmcb82R4kKGqqvwrIA9CYdu
	/RkakJVtsQ==
X-Received: by 2002:a05:6000:402a:b0:390:ed05:aa26 with SMTP id ffacd0b85a97d-39132d30c22mr15005786f8f.5.1741762551530;
        Tue, 11 Mar 2025 23:55:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDerobH2f/muGrjnyAjilHqba0+0kowFg3s8AIPcyJb001SG0K4ObuoiA+X/VxHvC5d0rDfQ==
X-Received: by 2002:a05:6000:402a:b0:390:ed05:aa26 with SMTP id ffacd0b85a97d-39132d30c22mr15005774f8f.5.1741762551189;
        Tue, 11 Mar 2025 23:55:51 -0700 (PDT)
Date: Wed, 12 Mar 2025 02:55:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nico Pache <npache@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com,
	jerrin.shaji-george@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, david@redhat.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, nphamcs@gmail.com, yosry.ahmed@linux.dev,
	kanchana.p.sridhar@intel.com, alexander.atanasov@virtuozzo.com
Subject: Re: [RFC 2/5] virtio_balloon: update the NR_BALLOON_PAGES state
Message-ID: <20250312025331-mutt-send-email-mst@kernel.org>
References: <20250312000700.184573-1-npache@redhat.com>
 <20250312000700.184573-3-npache@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250312000700.184573-3-npache@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DdcSdQQIm5qA_0WsLwgU6JOh6rs-bhvHI5YPXZSI7F4_1741762551
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 06:06:57PM -0600, Nico Pache wrote:
> Update the NR_BALLOON_PAGES counter when pages are added to or
> removed from the virtio balloon.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  drivers/virtio/virtio_balloon.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 89da052f4f68..406414dbb477 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -274,6 +274,8 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  
>  		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
>  		vb->num_pages += VIRTIO_BALLOON_PAGES_PER_PAGE;
> +		mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
> +			VIRTIO_BALLOON_PAGES_PER_PAGE);
>  		if (!virtio_has_feature(vb->vdev,
>  					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
>  			adjust_managed_page_count(page, -1);


This means the counter is in virtio balloon page units, which
runs counter to the declared goal of making the interface
hypervisor-agnostic.


> @@ -324,6 +326,8 @@ static unsigned int leak_balloon(struct virtio_balloon *vb, size_t num)
>  		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
>  		list_add(&page->lru, &pages);
>  		vb->num_pages -= VIRTIO_BALLOON_PAGES_PER_PAGE;
> +		mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
> +			-VIRTIO_BALLOON_PAGES_PER_PAGE);


Same.

Thanks,

>  	}
>  
>  	num_freed_pages = vb->num_pfns;
> -- 
> 2.48.1


