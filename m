Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2D70F026
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538809.839058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jVO-0003SD-GZ; Wed, 24 May 2023 08:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538809.839058; Wed, 24 May 2023 08:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jVO-0003Pr-Dr; Wed, 24 May 2023 08:05:58 +0000
Received: by outflank-mailman (input) for mailman id 538809;
 Wed, 24 May 2023 08:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCLF=BN=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q1jVN-0003Pl-Nt
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:05:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce6d8640-fa09-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:05:55 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-RErQzMsmNfyVW-OdrzZ_Jg-1; Wed, 24 May 2023 04:05:52 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f60481749eso3824565e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 May 2023 01:05:52 -0700 (PDT)
Received: from sgarzare-redhat ([134.0.5.107])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a7bcd08000000b003f17848673fsm1401647wmj.27.2023.05.24.01.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:05:50 -0700 (PDT)
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
X-Inumbo-ID: ce6d8640-fa09-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684915554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4D41eFNvy0+kPQfc9V8H+rhjCzgj7odAxqq3xoeOmEs=;
	b=I2chZDsBHaFbKQfQczOovqRmEYsc+CSiwvSxA8EoEUDcAN0S89laA8v+qSK6IXKA8Gf9w8
	inqfNXKN35GISZwrbwO1FihETqsEnmyEMadyMqJjUz+0gNACym0ZQeIbYSBYXyO9hX/45L
	h2bSTOv8yq4bAfpIaMZmCQRnIQ9RKRY=
X-MC-Unique: RErQzMsmNfyVW-OdrzZ_Jg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684915551; x=1687507551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4D41eFNvy0+kPQfc9V8H+rhjCzgj7odAxqq3xoeOmEs=;
        b=GJ086LMrgsmPFM/nMAgu/hPqYRjImqozvQCA9vUZHZI7sXcf1EcOjUV2sAKWyDKwzh
         tWi2lQp+Twmwj1cQ+oqazV18Nete2uySTuJZBV01Cj+Wly/ATIMxdnKVHq8WQnB867Gt
         ZCYQ8nIjoPnL/kyTf4QnvTxuYRcaYVzIpA8MbTL32eC8O9z82wtHLf4sQ0d0Ec2GI8k6
         5EiqYOcAChmtZqatJmiGYM2m/r9QIRRKd8Dvp7eQx2iQCTVf/FBwy8e79PidwYc/w9qD
         2e+y8n8fTQk8dysgWVbow+UNCEHseTpRu7t9Ulop1mhBkYLkHZqHePkrfpAdBXLwHZNf
         MHlQ==
X-Gm-Message-State: AC+VfDyqI7et5soky/zJf5NgMiHjhy90Pq+tVIBK8pMassxHQzBYuj/h
	aKbWh5GUiQN3optl6rKvLJaUGYpoa0mAt9TX4leZMzPk82i+Inzce/hHxEBDfep+pP5sTjpOwka
	f65ObcaJ8wE0i3oelBFOx87lNkVk=
X-Received: by 2002:a05:600c:1c0a:b0:3f6:335:d8f0 with SMTP id j10-20020a05600c1c0a00b003f60335d8f0mr7927344wms.13.1684915551656;
        Wed, 24 May 2023 01:05:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Pa3Z/4cCdCc3y6y76Di99EDzxN9dw2x4Sv4Z+LSxzGUUIHRLjgxpENvXr/pbAwQBGrYrRFg==
X-Received: by 2002:a05:600c:1c0a:b0:3f6:335:d8f0 with SMTP id j10-20020a05600c1c0a00b003f60335d8f0mr7927316wms.13.1684915551306;
        Wed, 24 May 2023 01:05:51 -0700 (PDT)
Date: Wed, 24 May 2023 10:05:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: add blk_io_plug_call() API
Message-ID: <cwgklwmov3evxbmty56vwgg2xzdpagcrguy66adrdiy43u35eb@jmamrxotsf45>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-2-stefanha@redhat.com>
 <mzxjz4d3ab3sq6grwsle6wlacysh2uffz42ojpdze3hmqimbr5@fxgkad47nnim>
 <20230523154708.GB96478@fedora>
MIME-Version: 1.0
In-Reply-To: <20230523154708.GB96478@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 23, 2023 at 11:47:08AM -0400, Stefan Hajnoczi wrote:
>On Fri, May 19, 2023 at 10:45:57AM +0200, Stefano Garzarella wrote:
>> On Wed, May 17, 2023 at 06:10:17PM -0400, Stefan Hajnoczi wrote:
>> > Introduce a new API for thread-local blk_io_plug() that does not
>> > traverse the block graph. The goal is to make blk_io_plug() multi-queue
>> > friendly.
>> >
>> > Instead of having block drivers track whether or not we're in a plugged
>> > section, provide an API that allows them to defer a function call until
>> > we're unplugged: blk_io_plug_call(fn, opaque). If blk_io_plug_call() is
>> > called multiple times with the same fn/opaque pair, then fn() is only
>> > called once at the end of the function - resulting in batching.
>> >
>> > This patch introduces the API and changes blk_io_plug()/blk_io_unplug().
>> > blk_io_plug()/blk_io_unplug() no longer require a BlockBackend argument
>> > because the plug state is now thread-local.
>> >
>> > Later patches convert block drivers to blk_io_plug_call() and then we
>> > can finally remove .bdrv_co_io_plug() once all block drivers have been
>> > converted.
>> >
>> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> > ---
>> > MAINTAINERS                       |   1 +
>> > include/sysemu/block-backend-io.h |  13 +--
>> > block/block-backend.c             |  22 -----
>> > block/plug.c                      | 159 ++++++++++++++++++++++++++++++
>> > hw/block/dataplane/xen-block.c    |   8 +-
>> > hw/block/virtio-blk.c             |   4 +-
>> > hw/scsi/virtio-scsi.c             |   6 +-
>> > block/meson.build                 |   1 +
>> > 8 files changed, 173 insertions(+), 41 deletions(-)
>> > create mode 100644 block/plug.c
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index 50585117a0..574202295c 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -2644,6 +2644,7 @@ F: util/aio-*.c
>> > F: util/aio-*.h
>> > F: util/fdmon-*.c
>> > F: block/io.c
>> > +F: block/plug.c
>> > F: migration/block*
>> > F: include/block/aio.h
>> > F: include/block/aio-wait.h
>> > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
>> > index d62a7ee773..be4dcef59d 100644
>> > --- a/include/sysemu/block-backend-io.h
>> > +++ b/include/sysemu/block-backend-io.h
>> > @@ -100,16 +100,9 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
>> > int blk_get_max_iov(BlockBackend *blk);
>> > int blk_get_max_hw_iov(BlockBackend *blk);
>> >
>> > -/*
>> > - * blk_io_plug/unplug are thread-local operations. This means that multiple
>> > - * IOThreads can simultaneously call plug/unplug, but the caller must ensure
>> > - * that each unplug() is called in the same IOThread of the matching plug().
>> > - */
>> > -void coroutine_fn blk_co_io_plug(BlockBackend *blk);
>> > -void co_wrapper blk_io_plug(BlockBackend *blk);
>> > -
>> > -void coroutine_fn blk_co_io_unplug(BlockBackend *blk);
>> > -void co_wrapper blk_io_unplug(BlockBackend *blk);
>> > +void blk_io_plug(void);
>> > +void blk_io_unplug(void);
>> > +void blk_io_plug_call(void (*fn)(void *), void *opaque);
>> >
>> > AioContext *blk_get_aio_context(BlockBackend *blk);
>> > BlockAcctStats *blk_get_stats(BlockBackend *blk);
>> > diff --git a/block/block-backend.c b/block/block-backend.c
>> > index ca537cd0ad..1f1d226ba6 100644
>> > --- a/block/block-backend.c
>> > +++ b/block/block-backend.c
>> > @@ -2568,28 +2568,6 @@ void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
>> >     notifier_list_add(&blk->insert_bs_notifiers, notify);
>> > }
>> >
>> > -void coroutine_fn blk_co_io_plug(BlockBackend *blk)
>> > -{
>> > -    BlockDriverState *bs = blk_bs(blk);
>> > -    IO_CODE();
>> > -    GRAPH_RDLOCK_GUARD();
>> > -
>> > -    if (bs) {
>> > -        bdrv_co_io_plug(bs);
>> > -    }
>> > -}
>> > -
>> > -void coroutine_fn blk_co_io_unplug(BlockBackend *blk)
>> > -{
>> > -    BlockDriverState *bs = blk_bs(blk);
>> > -    IO_CODE();
>> > -    GRAPH_RDLOCK_GUARD();
>> > -
>> > -    if (bs) {
>> > -        bdrv_co_io_unplug(bs);
>> > -    }
>> > -}
>> > -
>> > BlockAcctStats *blk_get_stats(BlockBackend *blk)
>> > {
>> >     IO_CODE();
>> > diff --git a/block/plug.c b/block/plug.c
>> > new file mode 100644
>> > index 0000000000..6738a568ba
>> > --- /dev/null
>> > +++ b/block/plug.c
>> > @@ -0,0 +1,159 @@
>> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> > +/*
>> > + * Block I/O plugging
>> > + *
>> > + * Copyright Red Hat.
>> > + *
>> > + * This API defers a function call within a blk_io_plug()/blk_io_unplug()
>> > + * section, allowing multiple calls to batch up. This is a performance
>> > + * optimization that is used in the block layer to submit several I/O requests
>> > + * at once instead of individually:
>> > + *
>> > + *   blk_io_plug(); <-- start of plugged region
>> > + *   ...
>> > + *   blk_io_plug_call(my_func, my_obj); <-- deferred my_func(my_obj) call
>> > + *   blk_io_plug_call(my_func, my_obj); <-- another
>> > + *   blk_io_plug_call(my_func, my_obj); <-- another
>> > + *   ...
>> > + *   blk_io_unplug(); <-- end of plugged region, my_func(my_obj) is called once
>> > + *
>> > + * This code is actually generic and not tied to the block layer. If another
>> > + * subsystem needs this functionality, it could be renamed.
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qemu/coroutine-tls.h"
>> > +#include "qemu/notify.h"
>> > +#include "qemu/thread.h"
>> > +#include "sysemu/block-backend.h"
>> > +
>> > +/* A function call that has been deferred until unplug() */
>> > +typedef struct {
>> > +    void (*fn)(void *);
>> > +    void *opaque;
>> > +} UnplugFn;
>> > +
>> > +/* Per-thread state */
>> > +typedef struct {
>> > +    unsigned count;       /* how many times has plug() been called? */
>> > +    GArray *unplug_fns;   /* functions to call at unplug time */
>> > +} Plug;
>> > +
>> > +/* Use get_ptr_plug() to fetch this thread-local value */
>> > +QEMU_DEFINE_STATIC_CO_TLS(Plug, plug);
>> > +
>> > +/* Called at thread cleanup time */
>> > +static void blk_io_plug_atexit(Notifier *n, void *value)
>> > +{
>> > +    Plug *plug = get_ptr_plug();
>> > +    g_array_free(plug->unplug_fns, TRUE);
>> > +}
>> > +
>> > +/* This won't involve coroutines, so use __thread */
>> > +static __thread Notifier blk_io_plug_atexit_notifier;
>> > +
>> > +/**
>> > + * blk_io_plug_call:
>> > + * @fn: a function pointer to be invoked
>> > + * @opaque: a user-defined argument to @fn()
>> > + *
>> > + * Call @fn(@opaque) immediately if not within a blk_io_plug()/blk_io_unplug()
>> > + * section.
>>
>> Just to understand better, what if two BlockDrivers share the same
>> iothread but one calls blk_io_plug()/blk_io_unplug(), while the other
>> calls this function not in a blk_io_plug()/blk_io_unplug() section?
>>
>> If the call is in the middle of the other BlockDriver's section, it is
>> deferred, right?
>
>Yes, the call is deferred until blk_io_unplug().
>
>> Is this situation possible?
>
>One scenario I can think of is when aio_poll() is called between
>plug/unplug. In that case, some I/O associated with device B might
>happen while device A is with plug/unplug.
>
>> Or should we prevent blk_io_plug_call() from being called out of a
>> blk_io_plug()/blk_io_unplug() section?
>
>blk_io_plug_call() is called outside blk_io_plug()/blk_io_unplug() when
>device emulation doesn't use plug/unplug. For example, IDE doesn't use
>it but still calls down into the same Linux AIO or io_uring code that
>invokes blk_io_plug_call(). This is why blk_io_plug_call() calls fn()
>immediately when invoked outside plug/unplug.

Got it, so it seems that everything should work properly.

Thanks,
Stefano


