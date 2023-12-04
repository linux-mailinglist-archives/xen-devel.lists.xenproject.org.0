Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC8E803282
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 13:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646886.1009525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7yv-0008CK-NI; Mon, 04 Dec 2023 12:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646886.1009525; Mon, 04 Dec 2023 12:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7yv-0008A3-KU; Mon, 04 Dec 2023 12:23:25 +0000
Received: by outflank-mailman (input) for mailman id 646886;
 Mon, 04 Dec 2023 12:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/x5/=HP=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rA7yu-00089x-An
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 12:23:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9fe1830-929f-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 13:23:23 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-gbryS5XWMFajJ2gqyBp4cw-1; Mon, 04 Dec 2023 07:23:18 -0500
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 205218371C6;
 Mon,  4 Dec 2023 12:23:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 671D7492BFE;
 Mon,  4 Dec 2023 12:23:10 +0000 (UTC)
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
X-Inumbo-ID: e9fe1830-929f-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701692601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dWZu5FfP/T6893g/T7OkCWZ5TjUDQF2GRJyknmRuI+M=;
	b=YWX10rZ0s5676l67ETxhydAkNz65bip3MQPrnlerfxIFRQJSjeA7SQ4zCVwtC05dWOOtmL
	CK/bEb9FrlgYu06/xEjYEL3eQb7xvBhSoPZb7tnNHhzWgPl5aLYD5V5AQiD1MS7DreDXHM
	JXxyolVQg11PuXNja6QwICYT4DidyCs=
X-MC-Unique: gbryS5XWMFajJ2gqyBp4cw-1
Date: Mon, 4 Dec 2023 13:23:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Ari Sundholm <ari@tuxera.com>, Li Zhijian <lizhijian@fujitsu.com>,
	Cleber Rosa <crosa@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Fam Zheng <fam@euphon.net>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 06/12] scsi: remove AioContext locking
Message-ID: <ZW3ErXZ2ZOo_kX2x@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-7-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-7-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Am 29.11.2023 um 20:55 hat Stefan Hajnoczi geschrieben:
> The AioContext lock no longer has any effect. Remove it.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio-scsi.h | 14 --------------
>  hw/scsi/scsi-bus.c              |  2 --
>  hw/scsi/scsi-disk.c             | 28 ++++------------------------
>  hw/scsi/virtio-scsi.c           | 18 ------------------
>  4 files changed, 4 insertions(+), 58 deletions(-)

> @@ -2531,13 +2527,11 @@ static void scsi_unrealize(SCSIDevice *dev)
>  static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
>  {
>      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
> -    AioContext *ctx = NULL;
> +
>      /* can happen for devices without drive. The error message for missing
>       * backend will be issued in scsi_realize
>       */
>      if (s->qdev.conf.blk) {
> -        ctx = blk_get_aio_context(s->qdev.conf.blk);
> -        aio_context_acquire(ctx);
>          if (!blkconf_blocksizes(&s->qdev.conf, errp)) {
>              goto out;
>          }
> @@ -2549,15 +2543,11 @@ static void scsi_hd_realize(SCSIDevice *dev, Error **errp)
>      }
>      scsi_realize(&s->qdev, errp);
>  out:
> -    if (ctx) {
> -        aio_context_release(ctx);
> -    }
>  }

This doesn't build for me:

../hw/scsi/scsi-disk.c:2545:1: error: label at end of compound statement is a C2x extension [-Werror,-Wc2x-extensions]
}
^
1 error generated.

Kevin


