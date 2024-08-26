Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A095E8B0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 08:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783294.1192617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siTCc-0006Ub-Fx; Mon, 26 Aug 2024 06:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783294.1192617; Mon, 26 Aug 2024 06:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siTCc-0006SQ-DL; Mon, 26 Aug 2024 06:27:46 +0000
Received: by outflank-mailman (input) for mailman id 783294;
 Mon, 26 Aug 2024 06:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=75pI=PZ=redhat.com=jasowang@srs-se1.protection.inumbo.net>)
 id 1siTCb-0006SK-FX
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 06:27:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d0d60b5-6374-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 08:27:44 +0200 (CEST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-4zu6-BmuOWuzEIp6jAKvRw-1; Mon, 26 Aug 2024 02:27:40 -0400
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2cb5847ff53so4911377a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 25 Aug 2024 23:27:40 -0700 (PDT)
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
X-Inumbo-ID: 4d0d60b5-6374-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724653663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
	b=QUUE5btv6RfWxCyQDJ/2p9TcfOTYnP7Db37oj4pjFUN1V//urHQ7fJtRcWoikQm/qkEs/Q
	LcK/LH3bqSZvC6qolazKP1EjNt5V5gI+v8kdZZsbcZKzEwfFYV7nPj1LAfVZHkoNz5Imr4
	ysCOBykQ1lEmXMtecPrMY0vF0qTxxBU=
X-MC-Unique: 4zu6-BmuOWuzEIp6jAKvRw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653659; x=1725258459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs8AUYhSmmGXuJkf0JZ3EFqr6hWEcb9C7Q1wG4ibjBY=;
        b=V1jyQNk5svAsUQ3olMfmPiOI7zvedhKOACdlG7zGbDjlGOH3ntI7YKZWsoRcawA08h
         lNyN0tsxammH8K9u7MzOvrFRFIPJp0nblpuB5uGQYXpMPx44YgU1o7h+IqJgFMEwRlA9
         LCifEBdyNgez1a6V3oni0BDTPf9SOMQAwwlYwAhnfa1kBvn7UF2K8YO0U39G+tIZoWFI
         0OlOWj/DUL9AZMfQWOZE8OlkNmaKdw6mp40ghQY+BQJ+GVZfRh+ulFaXIk1wvV7Ei/jd
         QBkJ5WN5xZaiTQ/dvT2oPpKCpc4AHynrYJZXVgmUBcM3f+p2kbHvjB36NxQ3OD6BDUnG
         VO2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGxA99EDiotP4WY2i/BaFWOJpJ7Y4NjJzH2Ht3W7DgQC+unjp2auGBRSHiy9Qhttf/vXvesmuQ51U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYsWJQJf9Xr0WXIzr9CwfhLPeXpvcJQRELmoZsbPTfvCU/Ew5s
	bZ4Mks8EW7aEcPA/4wJL9xaSiQugXS8otKAj9u1p3RWbbLJemJ8jjIq+WwwNULB4z1u0CKq2MHV
	VGi83JYhTvTtn8ztLRM7eCXJZS4xj5m0bQ4ng9xB1ZQ2Lbyj4hVupIc6RpJY6aIKDoPliKi6y46
	CP+VHLXCGZODFO6UjW7Bs6S/rgNjFg75oa7XQtfyg=
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id 98e67ed59e1d1-2d646d4dcfbmr11272913a91.34.1724653659608;
        Sun, 25 Aug 2024 23:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP3GZqzlMhqPuuYHeWu96SGn+Tu3LWd1hDEbxpGhfc1OXWvtkUWRElPm7DPTwJzR3LmdWyUKTz2DeMu9Do6/Q=
X-Received: by 2002:a17:90b:ecd:b0:2cd:619:6826 with SMTP id
 98e67ed59e1d1-2d646d4dcfbmr11272892a91.34.1724653659123; Sun, 25 Aug 2024
 23:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
In-Reply-To: <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Aug 2024 14:27:27 +0800
Message-ID: <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
To: Christoph Hellwig <hch@lst.de>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 2:16=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Sat, Aug 24, 2024 at 11:58=E2=80=AFAM Christoph Hellwig <hch@lst.de> w=
rote:
> >
> > Hi all,
> >
> > we've had a long standing problems where drivers try to hook into the
> > DMA_OPS mechanisms to override them for something that is not DMA, or
> > to introduce additional dispatching.
> >
> > Now that we are not using DMA_OPS support for dma-iommu and can build
> > kernels without DMA_OPS support on many common setups this becomes even
> > more problematic.
> >
> > This series renames the option to ARCH_DMA_OPS and adds very explicit
> > comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
> > that abuse the mechanism are made to depend on the option instead of
> > selecting it with a big comment, but I expect this to be fixed rather
> > sooner than later (I know the ipu6 maintainers are on it based on a
> > previous discussion).
> >
>
> I will try to fix the simulator considering virtio has already had
> mapping ops now.

Actually I meant, we can extend the virtio_config_ops to allow mapping
ops there, then simulator and VDUSE can hook the map ops there.

Not sure if Michael is fine with this.

Thanks

>
> Thanks


