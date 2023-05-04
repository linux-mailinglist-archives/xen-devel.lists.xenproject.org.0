Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F406F783C
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 23:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530155.825589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugat-0003cq-TS; Thu, 04 May 2023 21:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530155.825589; Thu, 04 May 2023 21:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugat-0003aL-Pc; Thu, 04 May 2023 21:34:31 +0000
Received: by outflank-mailman (input) for mailman id 530155;
 Thu, 04 May 2023 21:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6+xu=AZ=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pugar-0003aF-Le
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 21:34:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c1c72b-eac3-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 23:34:27 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-oftBbWKyPpm5UhTcIWwpiQ-1; Thu, 04 May 2023 17:34:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20351185A7A2;
 Thu,  4 May 2023 21:34:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F7E82166B30;
 Thu,  4 May 2023 21:34:18 +0000 (UTC)
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
X-Inumbo-ID: 71c1c72b-eac3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683236066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gi2dujXyOOsp2C2GzNI9fp0qtTuAHfyKycpA+LfupIY=;
	b=f+D9eg0FBnB1NY3jV8V1yvq9MIp96rcHolYq2LK3paPVShitP/PJbMWk7d/aryHjHdDbk/
	ZWjNHOW00lPpaMmoiQJWS44Ak8nyghDEe0FwUB4udGtF2iZjQv5Mn4YX6I6Lng0p0DF4pQ
	EozO1CzqHwF0pcqw4bRXQy2yEc1CLQI=
X-MC-Unique: oftBbWKyPpm5UhTcIWwpiQ-1
Date: Thu, 4 May 2023 23:34:17 +0200
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
Subject: Re: [PATCH v4 20/20] aio: remove aio_disable_external() API
Message-ID: <ZFQk2TdhZ6DiwM4t@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-21-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425172716.1033562-21-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> All callers now pass is_external=false to aio_set_fd_handler() and
> aio_set_event_notifier(). The aio_disable_external() API that
> temporarily disables fd handlers that were registered is_external=true
> is therefore dead code.
> 
> Remove aio_disable_external(), aio_enable_external(), and the
> is_external arguments to aio_set_fd_handler() and
> aio_set_event_notifier().
> 
> The entire test-fdmon-epoll test is removed because its sole purpose was
> testing aio_disable_external().
> 
> Parts of this patch were generated using the following coccinelle
> (https://coccinelle.lip6.fr/) semantic patch:
> 
>   @@
>   expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque;
>   @@
>   - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque)
>   + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_ready, opaque)
> 
>   @@
>   expression ctx, notifier, is_external, io_read, io_poll, io_poll_ready;
>   @@
>   - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll, io_poll_ready)
>   + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_ready)
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

> diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
> index 1683aa1105..6b6a1a91f8 100644
> --- a/util/fdmon-epoll.c
> +++ b/util/fdmon-epoll.c
> @@ -133,13 +128,12 @@ bool fdmon_epoll_try_upgrade(AioContext *ctx, unsigned npfd)
>          return false;
>      }
>  
> -    /* Do not upgrade while external clients are disabled */
> -    if (qatomic_read(&ctx->external_disable_cnt)) {
> -        return false;
> -    }
> -
> -    if (npfd < EPOLL_ENABLE_THRESHOLD) {
> -        return false;
> +    if (npfd >= EPOLL_ENABLE_THRESHOLD) {
> +        if (fdmon_epoll_try_enable(ctx)) {
> +            return true;
> +        } else {
> +            fdmon_epoll_disable(ctx);
> +        }
>      }
>  
>      /* The list must not change while we add fds to epoll */

I don't understand this hunk. Why are you changing more than just
deleting the external_disable_cnt check?

Is this a mismerge with your own commit e62da985?

Kevin


