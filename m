Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A54803452
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 14:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646930.1009605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8qe-0000EV-J4; Mon, 04 Dec 2023 13:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646930.1009605; Mon, 04 Dec 2023 13:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8qe-0000Bh-G3; Mon, 04 Dec 2023 13:18:56 +0000
Received: by outflank-mailman (input) for mailman id 646930;
 Mon, 04 Dec 2023 13:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/x5/=HP=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rA8qd-0000BZ-9j
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 13:18:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab9135d2-92a7-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 14:18:54 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-mkzkasI9PUCWPgI5RxpOKg-1; Mon, 04 Dec 2023 08:18:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B9E1101A52D;
 Mon,  4 Dec 2023 13:18:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B423140C6EB9;
 Mon,  4 Dec 2023 13:18:43 +0000 (UTC)
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
X-Inumbo-ID: ab9135d2-92a7-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701695932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VHQ4HR2B7MLC//HgFh3nAtqLerMP/Y4A9vM9X/MfQuk=;
	b=Y/yT/TrpLB5Gj9E15XhysxQkcjQEqu390dVfNjgfuiQY1BxT+pk16SpTDI8m4Wb8rqEYY0
	pcL4gi3/mFgjm4aMYomwRYeO7A32+A7FETXcSFCl8oOVWD0+shDZwThZglxzdOBGtNuqdP
	FSitNfdh0W3hiy0q7nhV1VRH73lvN6o=
X-MC-Unique: mkzkasI9PUCWPgI5RxpOKg-1
Date: Mon, 4 Dec 2023 14:18:42 +0100
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
Subject: Re: [PATCH 03/12] aio: make
 aio_context_acquire()/aio_context_release() a no-op
Message-ID: <ZW3RsnWZou44DFSE@redhat.com>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129195553.942921-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Am 29.11.2023 um 20:55 hat Stefan Hajnoczi geschrieben:
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

YOLO.

Acked-by: Kevin Wolf <kwolf@redhat.com>


