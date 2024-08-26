Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0D95E85E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 08:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783289.1192606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siT2A-0004JH-IA; Mon, 26 Aug 2024 06:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783289.1192606; Mon, 26 Aug 2024 06:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siT2A-0004GA-FV; Mon, 26 Aug 2024 06:16:58 +0000
Received: by outflank-mailman (input) for mailman id 783289;
 Mon, 26 Aug 2024 06:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=75pI=PZ=redhat.com=jasowang@srs-se1.protection.inumbo.net>)
 id 1siT29-0004G4-H5
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 06:16:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9f64558-6372-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 08:16:55 +0200 (CEST)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-z7E8bMVvOYmK8bKIRP2CpA-1; Mon, 26 Aug 2024 02:16:50 -0400
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2d3d68d032fso4660907a91.3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Aug 2024 23:16:49 -0700 (PDT)
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
X-Inumbo-ID: c9f64558-6372-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dB1NfwLF4sboQ9oAiJsmEAd6cRRc4sOW3f5DA5Z/91g=;
	b=h5erD15GfJ4+04rSjlqJg8SocqzQ6ttg/ib1zQOa5uRqSZ6v6BWBcK5JYBH/QPMjfJVzEJ
	uA01hyjlUExPnAw0H6A8GVPmX8FPlJ5VE+DQP7szgyxyT4ty0fLhCgiNWo6EPbxKB8mMPd
	gtqudkCm1QiIY/5kYKN7B/J8c6HE7vc=
X-MC-Unique: z7E8bMVvOYmK8bKIRP2CpA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653009; x=1725257809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB1NfwLF4sboQ9oAiJsmEAd6cRRc4sOW3f5DA5Z/91g=;
        b=qh9y1F3kC9eDfHOO0slqcOYW1LAfAMygY8eNna8Vv4u//pYGZeig+rAtI+USiWRSBs
         IUveeVo2iulaGIaImR4kDdQPW6xRwPyBwkXfeTQ+qJXyjycvTlg5tdERcFBFQkqtrJa+
         aqBkQjWyRo3ZtSzrk685b2KGvko0HSZvx51TnFSxPyxQyGF/hnML6mn4abbMamtRcgoj
         ZOsTF3fOcf0ugya+NaqY3SYzBMtvbTFX3v2L6PqP2AfJBEKy2Sc7hN0z6oNRcq64HBjV
         sAJUyHKvqmlgTahOlLGlybwm9bwTqsMxs6bb4UlqwFGMr+SRRxrtCZ+THdmSCDAexd9S
         p6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgqt8danf8fpG2Fhp1KTMcyqXPp5v6ZciZxNKanzfrfsFVWfkRKedLFAYla2OFwGv4+MbhgiWz7tQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVhbuC/LOo/heGdCoeQFPdwWDte4oC0B1vB+NwJNTALVfiMD6G
	MBHTBGPbVEtdTvjJtQwKIpoFBNIpFdpW2J8IQ65oPIicX0paZVwldeMFoGlSGAISt647cE4E6F3
	ses4vxk8+pcKnCKStEBTwSeXOfAh9Y3YDmbJIR1k8+yOHIfeQVejcWIvELSLwIVHHiRhagiHDmd
	DfnplmKtmSM1NPJq0c4MbD5IAYBuYPjkPKV9/QoSg=
X-Received: by 2002:a17:90a:6287:b0:2d3:cd27:c480 with SMTP id 98e67ed59e1d1-2d646d247f9mr9809276a91.33.1724653008872;
        Sun, 25 Aug 2024 23:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0WjIzDYmdUX7OY9EeJBLH76SMB2mi2zdVZl4NauXJ/eBoNO23zRck1BCKv7ZS6PzenwJTH61bASpm1vxRFd8=
X-Received: by 2002:a17:90a:6287:b0:2d3:cd27:c480 with SMTP id
 98e67ed59e1d1-2d646d247f9mr9809253a91.33.1724653008351; Sun, 25 Aug 2024
 23:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de>
In-Reply-To: <20240824035817.1163502-1-hch@lst.de>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:16:36 +0800
Message-ID: <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 11:58=E2=80=AFAM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Hi all,
>
> we've had a long standing problems where drivers try to hook into the
> DMA_OPS mechanisms to override them for something that is not DMA, or
> to introduce additional dispatching.
>
> Now that we are not using DMA_OPS support for dma-iommu and can build
> kernels without DMA_OPS support on many common setups this becomes even
> more problematic.
>
> This series renames the option to ARCH_DMA_OPS and adds very explicit
> comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
> that abuse the mechanism are made to depend on the option instead of
> selecting it with a big comment, but I expect this to be fixed rather
> sooner than later (I know the ipu6 maintainers are on it based on a
> previous discussion).
>

I will try to fix the simulator considering virtio has already had
mapping ops now.

Thanks


