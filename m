Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476D27FF91A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 19:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645105.1006966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8lUf-0005Ey-9K; Thu, 30 Nov 2023 18:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645105.1006966; Thu, 30 Nov 2023 18:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8lUf-0005D3-6a; Thu, 30 Nov 2023 18:10:33 +0000
Received: by outflank-mailman (input) for mailman id 645105;
 Thu, 30 Nov 2023 18:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Itg=HL=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1r8lUd-00055y-ST
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 18:10:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bce6c2bc-8fab-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 19:10:27 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-fuNyjow6N2-4hfmq0K7BLA-1; Thu, 30 Nov 2023 13:10:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25F32101A53B;
 Thu, 30 Nov 2023 18:10:22 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC4CC1596F;
 Thu, 30 Nov 2023 18:10:18 +0000 (UTC)
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
X-Inumbo-ID: bce6c2bc-8fab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701367826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2m4n11NBDxbZslbtUPldbmQwBb2fr/Ruvx5gsmdokXk=;
	b=Rfri5n3OhAvZbr7OqKr3RYPE8yPiEPrq15M+6xZq4F6xmnL6naY7EdYQ+chSpl0kX7Hbth
	E9bx2A11c1XNzXYT0ISITMNzSXLD4NicyXKW8JIIvuL6wIJ7qU9ZIWBPYBgPENgenGZ2qw
	LkjguZW61KfmBxQMnvdzepzd/V05kbQ=
X-MC-Unique: fuNyjow6N2-4hfmq0K7BLA-1
Date: Thu, 30 Nov 2023 12:10:16 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alberto Garcia <berto@igalia.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
	John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Wen Congyang <wencongyang2@huawei.com>, qemu-block@nongnu.org, xen-devel@lists.xenproject.org, 
	Coiby Xu <Coiby.Xu@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Xie Changlong <xiechanglong.d@gmail.com>, Ari Sundholm <ari@tuxera.com>, 
	Li Zhijian <lizhijian@fujitsu.com>, Cleber Rosa <crosa@redhat.com>, 
	Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Leonardo Bras <leobras@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Fam Zheng <fam@euphon.net>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 03/12] aio: make
 aio_context_acquire()/aio_context_release() a no-op
Message-ID: <ytopmeusq6nnzmjwssczinmksegntgiuei3favjvecf2kmlanb@zgewhe3t3alz>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-4-stefanha@redhat.com>
User-Agent: NeoMutt/20231103
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

On Wed, Nov 29, 2023 at 02:55:44PM -0500, Stefan Hajnoczi wrote:
> aio_context_acquire()/aio_context_release() has been replaced by
> fine-grained locking to protect state shared by multiple threads. The
> AioContext lock still plays the role of balancing locking in
> AIO_WAIT_WHILE() and many functions in QEMU either require that the
> AioContext lock is held or not held for this reason. In other words, the
> AioContext lock is purely there for consistency with itself and serves
> no real purpose anymore.
> 
> Stop actually acquiring/releasing the lock in
> aio_context_acquire()/aio_context_release() so that subsequent patches
> can remove callers across the codebase incrementally.
> 
> I have performed "make check" and qemu-iotests stress tests across
> x86-64, ppc64le, and aarch64 to confirm that there are no failures as a
> result of eliminating the lock.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  util/async.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/util/async.c b/util/async.c
> index 8f90ddc304..04ee83d220 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -725,12 +725,12 @@ void aio_context_unref(AioContext *ctx)
>  
>  void aio_context_acquire(AioContext *ctx)
>  {
> -    qemu_rec_mutex_lock(&ctx->lock);
> +    /* TODO remove this function */
>  }
>  
>  void aio_context_release(AioContext *ctx)
>  {
> -    qemu_rec_mutex_unlock(&ctx->lock);
> +    /* TODO remove this function */
>  }
>  
>  QEMU_DEFINE_STATIC_CO_TLS(AioContext *, my_aiocontext)
> -- 
> 2.42.0

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


