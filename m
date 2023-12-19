Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC32B81871E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 13:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656757.1025174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYwZ-0002AT-HS; Tue, 19 Dec 2023 12:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656757.1025174; Tue, 19 Dec 2023 12:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYwZ-00027M-Ec; Tue, 19 Dec 2023 12:11:27 +0000
Received: by outflank-mailman (input) for mailman id 656757;
 Tue, 19 Dec 2023 12:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dspo=H6=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rFYwY-00027E-9H
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 12:11:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8e410be-9e67-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 13:11:22 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-ToXj3wYvNs6LWgQVbZTQgw-1; Tue, 19 Dec 2023 07:11:17 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB07485A58C;
 Tue, 19 Dec 2023 12:11:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A9161C060AF;
 Tue, 19 Dec 2023 12:11:11 +0000 (UTC)
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
X-Inumbo-ID: b8e410be-9e67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702987881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uFGTvwjTibbXIkFU0K/fvsttgEJQFViTyB28RDyjN+I=;
	b=PG69qkEfGT/wGtimPGowunTaS9dvqwGB7de2NyE++1Jk1e2hzMsWCo3/7ILduDUBaaM124
	VfU6G0gJPH/WdV8mwNSXsWVKp7Ze2IJBvL9mxmCIFclvkv8d6gaGqNkcP4OdsFgI0xc8dC
	fh85KslCgzXUVaxI29nAjK/HdyVn3yc=
X-MC-Unique: ToXj3wYvNs6LWgQVbZTQgw-1
Date: Tue, 19 Dec 2023 13:11:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Paul Durrant <paul@xen.org>, Ari Sundholm <ari@tuxera.com>,
	Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Wen Congyang <wencongyang2@huawei.com>,
	Alberto Garcia <berto@igalia.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
	Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Peter Xu <peterx@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Li Zhijian <lizhijian@fujitsu.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 14/14] block: remove outdated AioContext locking
 comments
Message-ID: <ZYGIXhUVKjSqDeZT@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
 <20231205182011.1976568-15-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205182011.1976568-15-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Am 05.12.2023 um 19:20 hat Stefan Hajnoczi geschrieben:
> The AioContext lock no longer exists.
> 
> There is one noteworthy change:
> 
>   - * More specifically, these functions use BDRV_POLL_WHILE(bs), which
>   - * requires the caller to be either in the main thread and hold
>   - * the BlockdriverState (bs) AioContext lock, or directly in the
>   - * home thread that runs the bs AioContext. Calling them from
>   - * another thread in another AioContext would cause deadlocks.
>   + * More specifically, these functions use BDRV_POLL_WHILE(bs), which requires
>   + * the caller to be either in the main thread or directly in the home thread
>   + * that runs the bs AioContext. Calling them from another thread in another
>   + * AioContext would cause deadlocks.
> 
> I am not sure whether deadlocks are still possible. Maybe they have just
> moved to the fine-grained locks that have replaced the AioContext. Since
> I am not sure if the deadlocks are gone, I have kept the substance
> unchanged and just removed mention of the AioContext.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

I think the deadlock the comment refers to is that AIO_WAIT_WHILE() sits
in a blocking aio_poll() and nobody wakes it up because aio_wait_kick()
only wakes up the main thread. This deadlock still exists after removing
the AioContext lock, so the comment after your change looks right to me.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


