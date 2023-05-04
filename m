Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB036F77AA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 23:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530140.825548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pug4M-0006yx-Jb; Thu, 04 May 2023 21:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530140.825548; Thu, 04 May 2023 21:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pug4M-0006wA-Gq; Thu, 04 May 2023 21:00:54 +0000
Received: by outflank-mailman (input) for mailman id 530140;
 Thu, 04 May 2023 21:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6+xu=AZ=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pug4K-0006w3-Rt
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 21:00:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde25d9b-eabe-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 23:00:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-M4XYXSG0PgOjzbjEbNZBbw-1; Thu, 04 May 2023 17:00:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B7253C0DDAA;
 Thu,  4 May 2023 21:00:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 472A510DF8;
 Thu,  4 May 2023 21:00:37 +0000 (UTC)
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
X-Inumbo-ID: bde25d9b-eabe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683234046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/tE35rOAAC2vyhAwuF/fixTME5fKR02RCLevjKZzkLM=;
	b=N8mohIMJWpdXWbC/dh7o9EA4up4B6E+0MyFGx2cKa6sSPYJaBg2W0esjDYWTchXdm8qX7+
	CtzTXruZb9t7Co48PcVSp7S/TGxf/G8hkKdvGsiahyltVB5hpWl97+5wcEnK760kekYDkB
	WYWKsqwfHnmgb5U+XWdBTQpoMRmcY9A=
X-MC-Unique: M4XYXSG0PgOjzbjEbNZBbw-1
Date: Thu, 4 May 2023 23:00:35 +0200
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
Subject: Re: [PATCH v4 16/20] virtio: make it possible to detach host
 notifier from any thread
Message-ID: <ZFQc89cFJuoGF+qI@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-17-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-17-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> virtio_queue_aio_detach_host_notifier() does two things:
> 1. It removes the fd handler from the event loop.
> 2. It processes the virtqueue one last time.
> 
> The first step can be peformed by any thread and without taking the
> AioContext lock.
> 
> The second step may need the AioContext lock (depending on the device
> implementation) and runs in the thread where request processing takes
> place. virtio-blk and virtio-scsi therefore call
> virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
> AioContext
> 
> Scheduling a BH is undesirable for .drained_begin() functions. The next
> patch will introduce a .drained_begin() function that needs to call
> virtio_queue_aio_detach_host_notifier().

Why is it undesirable? In my mental model, .drained_begin() is still
free to start as many asynchronous things as it likes. The only
important thing to take care of is that .drained_poll() returns true as
long as the BH (or other asynchronous operation) is still pending.

Of course, your way of doing things still seems to result in simpler
code because you don't have to deal with a BH at all if you only really
want the first part and not the second.

> Move the virtqueue processing out to the callers of
> virtio_queue_aio_detach_host_notifier() so that the function can be
> called from any thread. This is in preparation for the next patch.

Did you forget to remove it in virtio_queue_aio_detach_host_notifier()?
If it's unchanged, I don't think the AioContext requirement is lifted.

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 2 ++
>  hw/scsi/virtio-scsi-dataplane.c | 9 +++++++++
>  2 files changed, 11 insertions(+)
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index b28d81737e..bd7cc6e76b 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -286,8 +286,10 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
>  
>      for (i = 0; i < s->conf->num_queues; i++) {
>          VirtQueue *vq = virtio_get_queue(s->vdev, i);
> +        EventNotifier *host_notifier = virtio_queue_get_host_notifier(vq);
>  
>          virtio_queue_aio_detach_host_notifier(vq, s->ctx);
> +        virtio_queue_host_notifier_read(host_notifier);
>      }
>  }

The existing code in virtio_queue_aio_detach_host_notifier() has a
comment before the read:

    /* Test and clear notifier before after disabling event,
     * in case poll callback didn't have time to run. */

Do we want to keep it around in the new places? (And also fix the
"before after", I suppose, or replace it with a similar, but better
comment that explains why we're reading here.)

Kevin


