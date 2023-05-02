Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CB06F47E7
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 18:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528741.822268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsUa-00033S-Sf; Tue, 02 May 2023 16:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528741.822268; Tue, 02 May 2023 16:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsUa-00031l-Os; Tue, 02 May 2023 16:04:40 +0000
Received: by outflank-mailman (input) for mailman id 528741;
 Tue, 02 May 2023 16:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dv4+=AX=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1ptsUZ-00031f-JT
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 16:04:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09774b34-e903-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 18:04:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-NtVPAAg0PAGoLecNFhMJ8Q-1; Tue, 02 May 2023 12:04:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 506A218E5380;
 Tue,  2 May 2023 16:04:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F2C1410F24;
 Tue,  2 May 2023 16:04:25 +0000 (UTC)
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
X-Inumbo-ID: 09774b34-e903-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683043477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ErZ2aQ2HUcNIqx2OSDpVI+Y5PzprxF1vRVAtic0RH4k=;
	b=KE7Bk8VEeG9NygJUkXVwLlCiYy5VWZfuL2kxlSIw6xNPU49FIyHa9ojuCT7JdUuP947y1V
	OOlUFPHTj8ZhUfksOyJpyUB0tMWWn5orR0JIQMSwydx7l2tQluaTvQF2ECAtv+nNbCgQ1F
	IUiMqApS8TFdxszmy+aRqJhcPOhkf0Y=
X-MC-Unique: NtVPAAg0PAGoLecNFhMJ8Q-1
Date: Tue, 2 May 2023 18:04:24 +0200
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
Subject: Re: [PATCH v4 07/20] block/export: stop using is_external in
 vhost-user-blk server
Message-ID: <ZFE0iFnbr2ey0A7X@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-8-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> vhost-user activity must be suspended during bdrv_drained_begin/end().
> This prevents new requests from interfering with whatever is happening
> in the drained section.
> 
> Previously this was done using aio_set_fd_handler()'s is_external
> argument. In a multi-queue block layer world the aio_disable_external()
> API cannot be used since multiple AioContext may be processing I/O, not
> just one.
> 
> Switch to BlockDevOps->drained_begin/end() callbacks.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------------
>  util/vhost-user-server.c             | 10 +++----
>  2 files changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 092b86aae4..d20f69cd74 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface = {
>      .process_msg           = vu_blk_process_msg,
>  };
>  
> -static void blk_aio_attached(AioContext *ctx, void *opaque)
> -{
> -    VuBlkExport *vexp = opaque;
> -
> -    vexp->export.ctx = ctx;
> -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> -}
> -
> -static void blk_aio_detach(void *opaque)
> -{
> -    VuBlkExport *vexp = opaque;
> -
> -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> -    vexp->export.ctx = NULL;
> -}

So for changing the AioContext, we now rely on the fact that the node to
be changed is always drained, so the drain callbacks implicitly cover
this case, too?

>  static void
>  vu_blk_initialize_config(BlockDriverState *bs,
>                           struct virtio_blk_config *config,
> @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
>      vu_config_change_msg(&vexp->vu_server.vu_dev);
>  }
>  
> +/* Called with vexp->export.ctx acquired */
> +static void vu_blk_drained_begin(void *opaque)
> +{
> +    VuBlkExport *vexp = opaque;
> +
> +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> +}

Compared to the old code, we're losing the vexp->export.ctx = NULL. This
is correct at this point because after drained_begin we still keep
processing requests until we arrive at a quiescent state.

However, if we detach the AioContext because we're deleting the
iothread, won't we end up with a dangling pointer in vexp->export.ctx?
Or can we be certain that nothing interesting happens before drained_end
updates it with a new valid pointer again?

Kevin


