Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9B81ABC5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 01:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658429.1027558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG6xs-0007VQ-7o; Thu, 21 Dec 2023 00:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658429.1027558; Thu, 21 Dec 2023 00:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG6xs-0007TM-54; Thu, 21 Dec 2023 00:31:04 +0000
Received: by outflank-mailman (input) for mailman id 658429;
 Thu, 21 Dec 2023 00:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+f=IA=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rG6xq-0007TB-6n
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 00:31:02 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3663165f-9f98-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 01:30:59 +0100 (CET)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-58d18c224c7so193299eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 16:30:59 -0800 (PST)
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
X-Inumbo-ID: 3663165f-9f98-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703118658; x=1703723458; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gsLYJg2hZc7F0qwDgzPFuWpomum0HMcuDk3P9PIyWak=;
        b=ZGgUZIdfT4xco8+dOQCsQSbcZxDVMl1t3HChUIzCZSNlEusSUbHFW07FR4suUWZ37C
         iJDjQ3KIr2T00UJOBfR5qfA4wrNdeBb1vHnMUAZDc9/QrS4poBjaUstXII/PgO8e6Jo8
         TWGMPxSHUY58+4lM1h0sRgLm5lprdKYb1Pphgb8lvkWLy3wznwgYPj4rh6yK1c2X7tM4
         4IjQJzAHv9rZgxvGacwQq9GfvNKi6oSze7y0SAa6eO71h9Y+QP3XZw8vEGB8wy2w14w3
         ZFrrNJwK7b3atIWXDY1Eh7juiuaFpkMpG9CPgG8e6K3g4y3EbWSTaesFqrv0ujH4msXL
         Qdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703118658; x=1703723458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsLYJg2hZc7F0qwDgzPFuWpomum0HMcuDk3P9PIyWak=;
        b=uQk6v56l2XxAC2k7Yw5Juo48Lb93YPKZQCkgTOy/knNpCyISTbiA54U3FP1uMI7tJ7
         /fL9q9pkGHP00OO1YphcXJqhNzqk0idvIkE6BfCjnZ9MPAsl36eGh4bykenkT4vfrN+R
         RXc7ozQ7Q8kXOBMEIN456hGCSW7/pRkxOWflJ89QaW3G9umL/Xto+pDnsmK/+Ure6cUl
         nbo4V4WhifiQsh+slxQIsyqLbLnUwFsbLnOuCTkybi8/xKJS9cwbqVka2AvjUAd1Ou2N
         flCqdxZcH362MVRrD1SG2dvSKFPCFNBwlbEjgFB9Rl927B1nN1hmJVdkyBvpaQ//LXbM
         +e/A==
X-Gm-Message-State: AOJu0YxCnzK5rMuCbwLH2GUHyrSfQPUt2aXv2K6cTF9MjlYYS8ER1HwI
	Zgvf7JEgSkLdzc2Al7T+UNnyBusFA4YnvfbNtrk=
X-Google-Smtp-Source: AGHT+IFr2kCDAuf8T/rPq/xadB+JkF67xILZSPiEQrvG9KM/GrW5v5DgiTcwvBzrMkZeS6ErYGGa4o4OCSAIOzhmuoQ=
X-Received: by 2002:a4a:4b87:0:b0:593:ef7a:b7b2 with SMTP id
 q129-20020a4a4b87000000b00593ef7ab7b2mr2266100ooa.4.1703118658652; Wed, 20
 Dec 2023 16:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20231205182011.1976568-1-stefanha@redhat.com> <20231205182011.1976568-5-stefanha@redhat.com>
 <ZYG2mSe1JWnC0tq_@redhat.com> <ZYHew2poxuJJRyhC@redhat.com>
In-Reply-To: <ZYHew2poxuJJRyhC@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 20 Dec 2023 19:30:45 -0500
Message-ID: <CAJSP0QWkT3E+Xp_E4O9oa3iDh5wd_r3hHt0jUG6E2S3DAJafCg@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] aio: make aio_context_acquire()/aio_context_release()
 a no-op
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Cleber Rosa <crosa@redhat.com>, 
	Xie Changlong <xiechanglong.d@gmail.com>, Paul Durrant <paul@xen.org>, Ari Sundholm <ari@tuxera.com>, 
	Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Wen Congyang <wencongyang2@huawei.com>, 
	Alberto Garcia <berto@igalia.com>, Anthony Perard <anthony.perard@citrix.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, 
	Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
	Fabiano Rosas <farosas@suse.de>, Hanna Reitz <hreitz@redhat.com>, Zhang Chen <chen.zhang@intel.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Peter Xu <peterx@redhat.com>, 
	Emanuele Giuseppe Esposito <eesposit@redhat.com>, Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 13:20, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 19.12.2023 um 16:28 hat Kevin Wolf geschrieben:
> > Am 05.12.2023 um 19:20 hat Stefan Hajnoczi geschrieben:
> > > aio_context_acquire()/aio_context_release() has been replaced by
> > > fine-grained locking to protect state shared by multiple threads. The
> > > AioContext lock still plays the role of balancing locking in
> > > AIO_WAIT_WHILE() and many functions in QEMU either require that the
> > > AioContext lock is held or not held for this reason. In other words, the
> > > AioContext lock is purely there for consistency with itself and serves
> > > no real purpose anymore.
> > >
> > > Stop actually acquiring/releasing the lock in
> > > aio_context_acquire()/aio_context_release() so that subsequent patches
> > > can remove callers across the codebase incrementally.
> > >
> > > I have performed "make check" and qemu-iotests stress tests across
> > > x86-64, ppc64le, and aarch64 to confirm that there are no failures as a
> > > result of eliminating the lock.
> > >
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Reviewed-by: Eric Blake <eblake@redhat.com>
> > > Acked-by: Kevin Wolf <kwolf@redhat.com>
> >
> > I knew why I wasn't confident enough to give a R-b... This crashes
> > qemu-storage-daemon in the qemu-iotests case graph-changes-while-io.
> >
> > qemu-storage-daemon: ../nbd/server.c:2542: nbd_co_receive_request: Assertion `client->recv_coroutine == qemu_coroutine_self()' failed.
> >
> > (gdb) bt
> > #0  0x00007fdb00529884 in __pthread_kill_implementation () from /lib64/libc.so.6
> > #1  0x00007fdb004d8afe in raise () from /lib64/libc.so.6
> > #2  0x00007fdb004c187f in abort () from /lib64/libc.so.6
> > #3  0x00007fdb004c179b in __assert_fail_base.cold () from /lib64/libc.so.6
> > #4  0x00007fdb004d1187 in __assert_fail () from /lib64/libc.so.6
> > #5  0x0000557f9f9534eb in nbd_co_receive_request (errp=0x7fdafc25eec0, request=0x7fdafc25ef10, req=0x7fdaf00159c0) at ../nbd/server.c:2542
> > #6  nbd_trip (opaque=0x557fa0b33fa0) at ../nbd/server.c:2962
> > #7  0x0000557f9faa416b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> > #8  0x00007fdb004efe90 in ?? () from /lib64/libc.so.6
> > #9  0x00007fdafc35f680 in ?? ()
> > #10 0x0000000000000000 in ?? ()
> > (gdb) p *client
> > $2 = {refcount = 4, close_fn = 0x557f9f95dc40 <nbd_blockdev_client_closed>, exp = 0x557fa0b30590, tlscreds = 0x0, tlsauthz = 0x0, sioc = 0x557fa0b33d90, ioc = 0x557fa0b33d90,
> >   recv_coroutine = 0x7fdaf0015eb0, send_lock = {locked = 0, ctx = 0x0, from_push = {slh_first = 0x0}, to_pop = {slh_first = 0x0}, handoff = 0, sequence = 0, holder = 0x0},
> >   send_coroutine = 0x0, read_yielding = false, quiescing = false, next = {tqe_next = 0x0, tqe_circ = {tql_next = 0x0, tql_prev = 0x557fa0b305e8}}, nb_requests = 1, closing = false,
> >   check_align = 1, mode = NBD_MODE_EXTENDED, contexts = {exp = 0x557fa0b30590, count = 1, base_allocation = true, allocation_depth = false, bitmaps = 0x0}, opt = 7, optlen = 0}
> > (gdb) p co_tls_current
> > $3 = (Coroutine *) 0x7fdaf00061d0
>
> This one isn't easy to debug...
>
> The first problem here is that two nbd_trip() coroutines are scheduled
> in the same iothread, and creating the second one overwrites
> client->recv_coroutine, which triggers the assertion in the first one.
>
> This can be fixed by introducing a new mutex in NBDClient and taking it
> in nbd_client_receive_next_request() so that there is no race between
> checking client->recv_coroutine != NULL and setting it to a new
> coroutine. (Not entirely sure why two different threads are doing this,
> maybe the main thread reentering in drained_end and the iothread waiting
> for the next request?)
>
> However, I'm seeing new assertion failures when I do that:
> client->quiescing isn't set in the -EAGAIN case in nbd_trip(). I haven't
> really figured out yet where this comes from. Taking the new NBDClient
> lock in the drain functions and in nbd_trip() doesn't seem to be enough
> to fix it anyway. Or maybe I didn't quite find the right places to take
> it.

bdrv_graph_wrlock() -> bdrv_drain_all_begin_nopoll() followed by
bdrv_drain_all_end() causes this issue.

It's a race condition where nbd_trip() in the IOThread sees
client->quiescing == true for a moment but then the drained region
ends before nbd_trip() re-acquires the lock and reaches
assert(client->quiescing).

The "nopoll" part of bdrv_drain_all_begin_nopoll() seems to be the
issue. We cannot assume all requests have quiesced when .drained_end()
is called.

I'm running more tests now to be sure I have a working solution. Will
send patches soon.

Stefan

