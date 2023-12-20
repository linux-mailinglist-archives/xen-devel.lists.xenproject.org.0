Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBAE819B6D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657531.1026435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFswS-00037K-El; Wed, 20 Dec 2023 09:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657531.1026435; Wed, 20 Dec 2023 09:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFswS-00035S-Ak; Wed, 20 Dec 2023 09:32:40 +0000
Received: by outflank-mailman (input) for mailman id 657531;
 Wed, 20 Dec 2023 09:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1nAz=H7=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rFswR-00035M-Ah
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:32:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5dc52d7-9f1a-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:32:37 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-n_RmENl5NdCMHivcy7hjVQ-1; Wed,
 20 Dec 2023 04:32:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C4651C0515D;
 Wed, 20 Dec 2023 09:32:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91B0B51D5;
 Wed, 20 Dec 2023 09:32:25 +0000 (UTC)
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
X-Inumbo-ID: b5dc52d7-9f1a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703064756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qcrw39oMMwhNCMv0Cz5DsDKDZMtBJxelltXBxM9QUo=;
	b=djblddOF4rMbd38noC9ROdML8/R2wDmrDtcXeNFQQXC5gV1xjyWLFnF04SFWDFGli9XDNe
	6eHxmXgCg9TEgvQvnwc9ELp3YLu0kVppLExrtRppmP8ropVKzSif12ULoc6r7lJpbcyuiF
	TEOwmkuVACltUk6ry7XtfrVcymFHDTc=
X-MC-Unique: n_RmENl5NdCMHivcy7hjVQ-1
Date: Wed, 20 Dec 2023 10:32:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
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
Subject: Re: [PATCH v2 04/14] aio: make
 aio_context_acquire()/aio_context_release() a no-op
Message-ID: <ZYK0pUSPFQiU4Qs_@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
 <20231205182011.1976568-5-stefanha@redhat.com>
 <ZYG2mSe1JWnC0tq_@redhat.com>
 <ZYHew2poxuJJRyhC@redhat.com>
 <CAJSP0QX0fg0TGWuveJz6+QbF9EmY=vPiU-c99fHZMN=1jAnXkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QX0fg0TGWuveJz6+QbF9EmY=vPiU-c99fHZMN=1jAnXkw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Am 19.12.2023 um 22:23 hat Stefan Hajnoczi geschrieben:
> The following hack makes the test pass but there are larger safety
> issues that I'll need to look at on Wednesday:

I see, you're taking the same approach as in the SCSI layer: Don't make
things thread-safe, but just always access them from the same thread.

In theory this should be okay, but I'm almost sure that at least
nbd_drained_poll() must then run in the same AioContext, too.

> diff --git a/nbd/server.c b/nbd/server.c
> index 895cf0a752..cf4b7d5c6d 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -1617,7 +1617,7 @@ static void nbd_drained_begin(void *opaque)
>      }
>  }
> 
> -static void nbd_drained_end(void *opaque)
> +static void nbd_resume_clients(void *opaque)
>  {
>      NBDExport *exp = opaque;
>      NBDClient *client;
> @@ -1628,6 +1628,15 @@ static void nbd_drained_end(void *opaque)
>      }
>  }
> 
> +static void nbd_drained_end(void *opaque)
> +{
> +    NBDExport *exp = opaque;
> +
> +    /* TODO how to make sure exp doesn't go away? */

blk_exp_ref()?

> +    /* TODO what if AioContext changes before this runs? */
> +    aio_bh_schedule_oneshot(nbd_export_aio_context(exp),
> nbd_resume_clients, exp);

We could increase client->nb_requests if we change it to be accessed
atomically. Then nbd_drained_poll() will make any AioContext change wait
for the BH.

Or maybe aio_wait_bh_oneshot() would already solve both problems?

> +}
> +

Kevin


