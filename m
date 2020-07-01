Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6A211508
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 23:24:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqkCm-0002iT-Ec; Wed, 01 Jul 2020 21:23:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E/dH=AM=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jqkCl-0002iO-3i
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 21:23:43 +0000
X-Inumbo-ID: 2335f852-bbe1-11ea-8786-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2335f852-bbe1-11ea-8786-12813bfff9fa;
 Wed, 01 Jul 2020 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593638622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2r4biBmgD4usQWexXh9vBu72j/PA8sqQ6Ual1zjZVg=;
 b=Frob1QcE+rnIvaVsB8k1AiEVRY+qE9u3ThkorDAkHfQ0mG0lz2JmkYSDt5C651cZAoWaWA
 kQh8g2gRehTiVbt6jrEqSXH88vaBVuHDyCvWJj64CWz8ZMcr9xbN/neZ27wO5pwYZ9SNd3
 0UidxTkhxPfsL0eVn0tAHVmGSAhEVLk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-03hKAwVoNrmUTk_-qTHYyQ-1; Wed, 01 Jul 2020 17:23:40 -0400
X-MC-Unique: 03hKAwVoNrmUTk_-qTHYyQ-1
Received: by mail-wr1-f69.google.com with SMTP id i14so22362529wru.17
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 14:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m2r4biBmgD4usQWexXh9vBu72j/PA8sqQ6Ual1zjZVg=;
 b=Kig+qeBSZdBFbf0mZPn2ShswRAC8SwhOfduQL4bvthvOTBdUqUke7zpF1N+4ZiYQ1/
 3LwstOFjWGbS2ZM19PwfprI2gVV7TIPQhZtHAvrd2QtGdaESbL1aitwZdqahf53rgRCf
 ZuKO/9a6P9bcMGHOok34Zo0uKIEwo9i/eUHP8/B4Y+FdATE/e/w5HQtwbCUkuNJrsyme
 jM/Mh7dT8E7wzt2DxHVk4VUvHfJZ40RFeSKmd3rK/W4Vea9deFzekddh80bZji0+AhNn
 soRJeOR8q7rxCFFsvhIpm7gpJ+dUdCiIuFNvSwRWTrpP8wPnnWguqzT2ZrVZwvuAIEmJ
 BzFw==
X-Gm-Message-State: AOAM533+Uc53ROksm61AkgHwQzoOYoZ0lb7lyVimuLRQoUR3QVNQWqTt
 7qGrWMmk9lGzu98bI/CNIdHHHqFw8DAyl/XhRtM/hItTQidBUvOs3LAz5/nlnZl3eZvngas5Gm3
 oKm7uvZDy1KRjRaus2V2pYJBAgok=
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr28640728wrx.352.1593638617973; 
 Wed, 01 Jul 2020 14:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ5EOdK3/I7t3hzH2nXxlZ8gKRo3bNG63qK7yosafmw6Hvgwi6pb2IZMrXml3ZBqz0x5VNnw==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr28640715wrx.352.1593638617762; 
 Wed, 01 Jul 2020 14:23:37 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 d63sm8905146wmc.22.2020.07.01.14.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 14:23:35 -0700 (PDT)
Date: Wed, 1 Jul 2020 17:23:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200701172219-mutt-send-email-mst@kernel.org>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> Would you be in favor of a more flexible check along the lines of the
> one proposed in the patch that started this thread:
> 
>     if (xen_vring_use_dma())
>             return true;
> 
> 
> xen_vring_use_dma would be implemented so that it returns true when
> xen_swiotlb is required and false otherwise.

Just to stress - with a patch like this virtio can *still* use DMA API
if PLATFORM_ACCESS is set. So if DMA API is broken on some platforms
as you seem to be saying, you guys should fix it before doing something
like this..

-- 
MST


