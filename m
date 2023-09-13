Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C142479F2D1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601578.937618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWSh-0004fv-Kb; Wed, 13 Sep 2023 20:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601578.937618; Wed, 13 Sep 2023 20:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWSh-0004dG-Hv; Wed, 13 Sep 2023 20:27:47 +0000
Received: by outflank-mailman (input) for mailman id 601578;
 Wed, 13 Sep 2023 20:27:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ecp1=E5=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1qgWSg-0004dA-Lr
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:27:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe9ab56b-5273-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:27:45 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-QXY160A3M0-NwF4Ixj-DqA-1; Wed, 13 Sep 2023 16:27:42 -0400
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-99bebfada8cso16721366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 13:27:42 -0700 (PDT)
Received: from redhat.com ([2.52.10.100]) by smtp.gmail.com with ESMTPSA id
 si16-20020a170906ced000b00993470682e5sm8961056ejb.32.2023.09.13.13.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 13:27:40 -0700 (PDT)
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
X-Inumbo-ID: fe9ab56b-5273-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694636863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0+xEXr3h4AvyGXWBv8NYijYIzxjz19rPxVYGqrScHE=;
	b=fnvwwPmX1rjo+3iNKrVLXVAzpD4Dem9sNhfbxmkBO68tYMG6uTpuaG3mG51KGPbgaCH9cX
	pqXw2a909r6nx9EkLGrG1b9kqHB+gmENxgjY/weGUG7rr2sCdrfSeZadz8o+H5QL5iHpVi
	zFbqfhCaokY8ON83vjIqyumWHzTSveQ=
X-MC-Unique: QXY160A3M0-NwF4Ixj-DqA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694636861; x=1695241661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0+xEXr3h4AvyGXWBv8NYijYIzxjz19rPxVYGqrScHE=;
        b=krbaGmiduS28ojn03hIkNXHxTHgCM4I+LJGUGW+xNGkj7LDsWNHil9twJ7FwBD9SPl
         xK1GQ1vRB8ln0mOXietrs4ogx6GGf02m8Pv1nwkJLR1Z2GOV+w0yvTIbxi+Pb+Bqlz/v
         KCaTkuMpOlndtMNLBKA1Mtlev52ISUoVmQD8Muxi5ynC2P0Gdqqu57JYzH5R0CD2VhDM
         P4PJWieEOfVTg+m73Segn1+T5kFKDF1phDZaI7pAcNo8m6QJ086DK40hZW1tST9+KRxH
         2DVhWdEjz8MAcozf+OTonpL3MgXea/PCuvSODJCJx68hHgzBp7SAVNLtUy/2X//95ffH
         a1yQ==
X-Gm-Message-State: AOJu0YzLlyyHQ8102OcwhauLV8w6HR7mJqoMzvEmORfo7ms/tRu8ly9V
	PvI26bicUh7WJkUUAflvghA2O6rxCk5y7E+dfP19oHilSZnEE+rgP/oDPmCTZLEmaLiYrPFDzn3
	ef7zMxBXfDi1hBY84a45idU3NBTU=
X-Received: by 2002:a17:906:1091:b0:9a1:688f:cf21 with SMTP id u17-20020a170906109100b009a1688fcf21mr2861004eju.43.1694636861432;
        Wed, 13 Sep 2023 13:27:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJVsnE9rQQA+Orcn2ZNEU5oDNKnI3EEnBZORNMF9srOwP+TK/nObaTCm/lfyfW1RCu/NEDqw==
X-Received: by 2002:a17:906:1091:b0:9a1:688f:cf21 with SMTP id u17-20020a170906109100b009a1688fcf21mr2860992eju.43.1694636861066;
        Wed, 13 Sep 2023 13:27:41 -0700 (PDT)
Date: Wed, 13 Sep 2023 16:27:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
	Julia Suvorova <jusual@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, Paul Durrant <paul@xen.org>,
	Fam Zheng <fam@euphon.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 0/4] virtio-blk: use blk_io_plug_call() instead of
 notification BH
Message-ID: <20230913162606-mutt-send-email-mst@kernel.org>
References: <20230913200045.1024233-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230913200045.1024233-1-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 13, 2023 at 04:00:41PM -0400, Stefan Hajnoczi wrote:
> v3:
> - Add comment pointing to API documentation in .c file [Philippe]
> - Add virtio_notify_irqfd_deferred_fn trace event [Ilya]
> - Remove outdated #include [Ilya]
> v2:
> - Rename blk_io_plug() to defer_call() and move it to util/ so the net
>   subsystem can use it [Ilya]
> - Add defer_call_begin()/end() to thread_pool_completion_bh() to match Linux
>   AIO and io_uring completion batching
> 
> Replace the seldom-used virtio-blk notification BH mechanism with
> blk_io_plug(). This is part of an effort to enable the multi-queue block layer
> in virtio-blk. The notification BH was not multi-queue friendly.
> 
> The blk_io_plug() mechanism improves fio rw=randread bs=4k iodepth=64 numjobs=8
> IOPS by ~9% with a single IOThread and 8 vCPUs (this is not even a multi-queue
> block layer configuration) compared to no completion batching. iodepth=1
> decreases by ~1% but this could be noise. Benchmark details are available here:
> https://gitlab.com/stefanha/virt-playbooks/-/tree/blk_io_plug-irqfd


virtio things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


regression is a bit worrysome if real though - just do a bit
longer testing to make sure?



> Stefan Hajnoczi (4):
>   block: rename blk_io_plug_call() API to defer_call()
>   util/defer-call: move defer_call() to util/
>   virtio: use defer_call() in virtio_irqfd_notify()
>   virtio-blk: remove batch notification BH
> 
>  MAINTAINERS                       |   3 +-
>  include/qemu/defer-call.h         |  16 +++
>  include/sysemu/block-backend-io.h |   4 -
>  block/blkio.c                     |   9 +-
>  block/io_uring.c                  |  11 ++-
>  block/linux-aio.c                 |   9 +-
>  block/nvme.c                      |   5 +-
>  block/plug.c                      | 159 ------------------------------
>  hw/block/dataplane/virtio-blk.c   |  48 +--------
>  hw/block/dataplane/xen-block.c    |  11 ++-
>  hw/block/virtio-blk.c             |   5 +-
>  hw/scsi/virtio-scsi.c             |   7 +-
>  hw/virtio/virtio.c                |  13 ++-
>  util/defer-call.c                 | 156 +++++++++++++++++++++++++++++
>  util/thread-pool.c                |   5 +
>  block/meson.build                 |   1 -
>  hw/virtio/trace-events            |   1 +
>  util/meson.build                  |   1 +
>  18 files changed, 231 insertions(+), 233 deletions(-)
>  create mode 100644 include/qemu/defer-call.h
>  delete mode 100644 block/plug.c
>  create mode 100644 util/defer-call.c
> 
> -- 
> 2.41.0


