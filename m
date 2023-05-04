Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749F86F77DA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 23:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530148.825568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugGz-0000bw-00; Thu, 04 May 2023 21:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530148.825568; Thu, 04 May 2023 21:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugGy-0000Zh-TZ; Thu, 04 May 2023 21:13:56 +0000
Received: by outflank-mailman (input) for mailman id 530148;
 Thu, 04 May 2023 21:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6+xu=AZ=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pugGy-0000Zb-4U
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 21:13:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 926bdd0f-eac0-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 23:13:53 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-0jJU1yuvPWyStda8F5r-dw-1; Thu, 04 May 2023 17:13:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E11857F81;
 Thu,  4 May 2023 21:13:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4B891410F24;
 Thu,  4 May 2023 21:13:43 +0000 (UTC)
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
X-Inumbo-ID: 926bdd0f-eac0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683234832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PbtQd0T/eOvB2WwyzniyotLqfkl9lge5PBzlNU6yYaw=;
	b=UvzW2MQyUUInuBe+/PfgDFvELzIMm4LnxpFmgSHxl4cECgNgGrYnKvJTX41mwWSOwnW3nk
	yIYpo3wW5e2qWDHDcjHU1vqhuAIpgQx2GcWrp3V9VyOdr2PtfVfTuAkayUbZmJ/q8cxJcW
	45qXT3LDRIuJhNVhnABR3z+dVpXfbNQ=
X-MC-Unique: 0jJU1yuvPWyStda8F5r-dw-1
Date: Thu, 4 May 2023 23:13:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 17/20] virtio-blk: implement
 BlockDevOps->drained_begin()
Message-ID: <ZFQgBvWShB4NCymj@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-18-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-18-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> Detach ioeventfds during drained sections to stop I/O submission from
> the guest. virtio-blk is no longer reliant on aio_disable_external()
> after this patch. This will allow us to remove the
> aio_disable_external() API once all other code that relies on it is
> converted.
> 
> Take extra care to avoid attaching/detaching ioeventfds if the data
> plane is started/stopped during a drained section. This should be rare,
> but maybe the mirror block job can trigger it.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 17 +++++++++------
>  hw/block/virtio-blk.c           | 38 ++++++++++++++++++++++++++++++++-
>  2 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index bd7cc6e76b..d77fc6028c 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -245,13 +245,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>      }
>  
>      /* Get this show started by hooking up our callbacks */
> -    aio_context_acquire(s->ctx);
> -    for (i = 0; i < nvqs; i++) {
> -        VirtQueue *vq = virtio_get_queue(s->vdev, i);
> +    if (!blk_in_drain(s->conf->conf.blk)) {
> +        aio_context_acquire(s->ctx);
> +        for (i = 0; i < nvqs; i++) {
> +            VirtQueue *vq = virtio_get_queue(s->vdev, i);
>  
> -        virtio_queue_aio_attach_host_notifier(vq, s->ctx);
> +            virtio_queue_aio_attach_host_notifier(vq, s->ctx);
> +        }
> +        aio_context_release(s->ctx);
>      }
> -    aio_context_release(s->ctx);
>      return 0;
>  
>    fail_aio_context:
> @@ -317,7 +319,10 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
>      trace_virtio_blk_data_plane_stop(s);
>  
>      aio_context_acquire(s->ctx);
> -    aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
> +
> +    if (!blk_in_drain(s->conf->conf.blk)) {
> +        aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
> +    }

So here we actually get a semantic change: What you described as the
second part in the previous patch, processing the virtqueue one last
time, isn't done any more if the device is drained.

If it's okay to just skip this during drain, why do we need to do it
outside of drain?

Kevin


