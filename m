Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E3818FB1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 19:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657071.1025734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFehN-0006oh-3b; Tue, 19 Dec 2023 18:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657071.1025734; Tue, 19 Dec 2023 18:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFehM-0006lg-WE; Tue, 19 Dec 2023 18:20:09 +0000
Received: by outflank-mailman (input) for mailman id 657071;
 Tue, 19 Dec 2023 18:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dspo=H6=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1rFehL-0006cR-CJ
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 18:20:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39f8db44-9e9b-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 19:20:03 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-ng6tSX5TO9q6N0AkdP052Q-1; Tue, 19 Dec 2023 13:19:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9391184B04B;
 Tue, 19 Dec 2023 18:19:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81F601121306;
 Tue, 19 Dec 2023 18:19:48 +0000 (UTC)
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
X-Inumbo-ID: 39f8db44-9e9b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703010002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kdHrCBh+aFwerdanskMZMdWR+mM1k+MIbCkQXlcqavA=;
	b=YUzEEySBxcELbNg2caIEBGbXo1YJnCd4+VMKq/hxIgtYu/AO5v1qTcQUzzyeo6WM89UuYQ
	68rHFSIGHAtjX7SF3uC/yzLJArla9GFtWnpPYx2KMP6QWHadUmWQKN3qxWWLd6DY2fbtEb
	f3DNBL9RSzQtmLo9s8iuPGAWf7/deyw=
X-MC-Unique: ng6tSX5TO9q6N0AkdP052Q-1
Date: Tue, 19 Dec 2023 19:19:47 +0100
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
Subject: Re: [PATCH v2 04/14] aio: make
 aio_context_acquire()/aio_context_release() a no-op
Message-ID: <ZYHew2poxuJJRyhC@redhat.com>
References: <20231205182011.1976568-1-stefanha@redhat.com>
 <20231205182011.1976568-5-stefanha@redhat.com>
 <ZYG2mSe1JWnC0tq_@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYG2mSe1JWnC0tq_@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Am 19.12.2023 um 16:28 hat Kevin Wolf geschrieben:
> Am 05.12.2023 um 19:20 hat Stefan Hajnoczi geschrieben:
> > aio_context_acquire()/aio_context_release() has been replaced by
> > fine-grained locking to protect state shared by multiple threads. The
> > AioContext lock still plays the role of balancing locking in
> > AIO_WAIT_WHILE() and many functions in QEMU either require that the
> > AioContext lock is held or not held for this reason. In other words, the
> > AioContext lock is purely there for consistency with itself and serves
> > no real purpose anymore.
> > 
> > Stop actually acquiring/releasing the lock in
> > aio_context_acquire()/aio_context_release() so that subsequent patches
> > can remove callers across the codebase incrementally.
> > 
> > I have performed "make check" and qemu-iotests stress tests across
> > x86-64, ppc64le, and aarch64 to confirm that there are no failures as a
> > result of eliminating the lock.
> > 
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Acked-by: Kevin Wolf <kwolf@redhat.com>
> 
> I knew why I wasn't confident enough to give a R-b... This crashes
> qemu-storage-daemon in the qemu-iotests case graph-changes-while-io.
> 
> qemu-storage-daemon: ../nbd/server.c:2542: nbd_co_receive_request: Assertion `client->recv_coroutine == qemu_coroutine_self()' failed.
> 
> (gdb) bt
> #0  0x00007fdb00529884 in __pthread_kill_implementation () from /lib64/libc.so.6
> #1  0x00007fdb004d8afe in raise () from /lib64/libc.so.6
> #2  0x00007fdb004c187f in abort () from /lib64/libc.so.6
> #3  0x00007fdb004c179b in __assert_fail_base.cold () from /lib64/libc.so.6
> #4  0x00007fdb004d1187 in __assert_fail () from /lib64/libc.so.6
> #5  0x0000557f9f9534eb in nbd_co_receive_request (errp=0x7fdafc25eec0, request=0x7fdafc25ef10, req=0x7fdaf00159c0) at ../nbd/server.c:2542
> #6  nbd_trip (opaque=0x557fa0b33fa0) at ../nbd/server.c:2962
> #7  0x0000557f9faa416b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #8  0x00007fdb004efe90 in ?? () from /lib64/libc.so.6
> #9  0x00007fdafc35f680 in ?? ()
> #10 0x0000000000000000 in ?? ()
> (gdb) p *client
> $2 = {refcount = 4, close_fn = 0x557f9f95dc40 <nbd_blockdev_client_closed>, exp = 0x557fa0b30590, tlscreds = 0x0, tlsauthz = 0x0, sioc = 0x557fa0b33d90, ioc = 0x557fa0b33d90,
>   recv_coroutine = 0x7fdaf0015eb0, send_lock = {locked = 0, ctx = 0x0, from_push = {slh_first = 0x0}, to_pop = {slh_first = 0x0}, handoff = 0, sequence = 0, holder = 0x0},
>   send_coroutine = 0x0, read_yielding = false, quiescing = false, next = {tqe_next = 0x0, tqe_circ = {tql_next = 0x0, tql_prev = 0x557fa0b305e8}}, nb_requests = 1, closing = false,
>   check_align = 1, mode = NBD_MODE_EXTENDED, contexts = {exp = 0x557fa0b30590, count = 1, base_allocation = true, allocation_depth = false, bitmaps = 0x0}, opt = 7, optlen = 0}
> (gdb) p co_tls_current
> $3 = (Coroutine *) 0x7fdaf00061d0

This one isn't easy to debug...

The first problem here is that two nbd_trip() coroutines are scheduled
in the same iothread, and creating the second one overwrites
client->recv_coroutine, which triggers the assertion in the first one.

This can be fixed by introducing a new mutex in NBDClient and taking it
in nbd_client_receive_next_request() so that there is no race between
checking client->recv_coroutine != NULL and setting it to a new
coroutine. (Not entirely sure why two different threads are doing this,
maybe the main thread reentering in drained_end and the iothread waiting
for the next request?)

However, I'm seeing new assertion failures when I do that:
client->quiescing isn't set in the -EAGAIN case in nbd_trip(). I haven't
really figured out yet where this comes from. Taking the new NBDClient
lock in the drain functions and in nbd_trip() doesn't seem to be enough
to fix it anyway. Or maybe I didn't quite find the right places to take
it.

I'm not sure if the list of NBD clients needs a lock, too, or if it is
only ever accessed in the main thread, but that should be unrelated to
the assertion failures I'm seeing.

Kevin


