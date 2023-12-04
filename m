Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5968036D9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647019.1009706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA1U-0000Cy-9h; Mon, 04 Dec 2023 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647019.1009706; Mon, 04 Dec 2023 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA1U-0000AR-5j; Mon, 04 Dec 2023 14:34:12 +0000
Received: by outflank-mailman (input) for mailman id 647019;
 Mon, 04 Dec 2023 14:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/x5/=HP=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rAA1S-0000AL-Iy
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:34:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ebf6329-92b2-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 15:34:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-j35TmjwUNKevqb14ZTIcdA-1; Mon,
 04 Dec 2023 09:34:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5A631C06535;
 Mon,  4 Dec 2023 14:34:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F2240C6EB9;
 Mon,  4 Dec 2023 14:33:58 +0000 (UTC)
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
X-Inumbo-ID: 2ebf6329-92b2-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701700447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmAAnk2hgXAxz3YwAXy2av/6HBbaMs5STpe6b+ZkGUU=;
	b=L1EXhP8/uSfY9G5tysVB+4nVjlM5xoLVVhSS0jjgIJkQzM8iltNSTo/n0BpmFEHsfjs/wa
	Xe9r4T/N9z56FobAyrEUvWRhZM8+XkonRi50xxHRhaX50HAPbrvrMaTEKN6921krX67P2C
	kROjdLIYMd8AxQeUVAOP78zb0Au+Fqw=
X-MC-Unique: j35TmjwUNKevqb14ZTIcdA-1
Date: Mon, 4 Dec 2023 15:33:57 +0100
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
Subject: Re: [PATCH 05/12] block: remove AioContext locking
Message-ID: <ZW3jVZZ_Kuf99g8O@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-6-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Am 29.11.2023 um 20:55 hat Stefan Hajnoczi geschrieben:
> This is the big patch that removes
> aio_context_acquire()/aio_context_release() from the block layer and
> affected block layer users.
> 
> There isn't a clean way to split this patch and the reviewers are likely
> the same group of people, so I decided to do it in one patch.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

> @@ -7585,29 +7433,12 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx)
>  
>  void coroutine_fn bdrv_co_lock(BlockDriverState *bs)
>  {
> -    AioContext *ctx = bdrv_get_aio_context(bs);
> -
> -    /* In the main thread, bs->aio_context won't change concurrently */
> -    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> -
> -    /*
> -     * We're in coroutine context, so we already hold the lock of the main
> -     * loop AioContext. Don't lock it twice to avoid deadlocks.
> -     */
> -    assert(qemu_in_coroutine());
> -    if (ctx != qemu_get_aio_context()) {
> -        aio_context_acquire(ctx);
> -    }
> +    /* TODO removed in next patch */
>  }

It's still there at the end of the series.

>  void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
>  {
> -    AioContext *ctx = bdrv_get_aio_context(bs);
> -
> -    assert(qemu_in_coroutine());
> -    if (ctx != qemu_get_aio_context()) {
> -        aio_context_release(ctx);
> -    }
> +    /* TODO removed in next patch */
>  }

This one, too.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


