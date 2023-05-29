Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F127146A0
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 10:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540576.842413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Yab-0000Kz-1f; Mon, 29 May 2023 08:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540576.842413; Mon, 29 May 2023 08:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Yaa-0000Ix-Uv; Mon, 29 May 2023 08:50:52 +0000
Received: by outflank-mailman (input) for mailman id 540576;
 Mon, 29 May 2023 08:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DxYg=BS=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q3Yaa-0000Ir-2F
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 08:50:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8da86da-fdfd-11ed-b231-6b7b168915f2;
 Mon, 29 May 2023 10:50:50 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-O6i07ewmP02_dqMZo2c01A-1; Mon, 29 May 2023 04:50:47 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f60481749eso16155415e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 01:50:47 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-16.business.telecomitalia.it.
 [87.12.25.16]) by smtp.gmail.com with ESMTPSA id
 y8-20020a7bcd88000000b003f6038faa19sm16812744wmj.19.2023.05.29.01.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 01:50:45 -0700 (PDT)
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
X-Inumbo-ID: e8da86da-fdfd-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685350249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lzKl+ULfTc+HsRslEfywwM+DpjvalmbzGtSUSdUPWng=;
	b=jVZ8PhYKvH698nV5TqP1ssPNohlGS95C2+/OIQIupA54uJWrjWQIHLypVG8qU0d59Fn2hE
	s2RvpDkoSjQgEddSOjnRiMQRsFREmGtaL0sqpK1H/Vqn+myFbKvYiTWHTUS/9C6Z80o9p2
	oxz3PCzbZd5H088u0r/TKyX06oanZK4=
X-MC-Unique: O6i07ewmP02_dqMZo2c01A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685350246; x=1687942246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzKl+ULfTc+HsRslEfywwM+DpjvalmbzGtSUSdUPWng=;
        b=e23SjBbaSDrmB+K9jAx59gkP3cMUnkq0iyXan/WwggcaKYOocp81y2v2k/nMwmnrVI
         zysbQdw018j88O5w+Eo4dpXWog6roQYxjgl4Q6piLDXR0ldrBa+VJB/43LnFGISuZS5L
         QcaukKcOGh9tk0D4WbM1AJXI0mt6b86KTNdMTd/S5PnU7/UaqfO/E1txlWzZ0R8EZCJl
         V64rfJP6fRY0CRW4PMsHKjAri7Ppy+j9M7uxTBZpYaClrjL/CaFLhl1NFlG9dTtYAWg1
         eTgiV9ryFT0qrkdo8Pi7IcCZdMDjIKy1G8A+hUl8HY+9z4dFiL4nw9mQO9tOMIEt74YQ
         22cA==
X-Gm-Message-State: AC+VfDyGShafQkSRuc54RJQnuI4MeHIuix4ZHlAq3wqeoKtArOv4/2OS
	KANJT/Xraz4iYu5CzyRisMkiilGeMcOs1PUcUfC8xpGRxfklz1M7CWuQAQNKnc1BWwZN8pqc8+G
	wAk2v03h/lEvgryLah7tct7t9J2E=
X-Received: by 2002:a05:600c:3d0d:b0:3f6:eae:7417 with SMTP id bh13-20020a05600c3d0d00b003f60eae7417mr6312397wmb.1.1685350246530;
        Mon, 29 May 2023 01:50:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7f6ydC3WQoJ5To9rb9W4gLmOML/1z0QINwg7VZr8e+1JLO+IwB0Gh6MUE4/gSFzctkGKbI+A==
X-Received: by 2002:a05:600c:3d0d:b0:3f6:eae:7417 with SMTP id bh13-20020a05600c3d0d00b003f60eae7417mr6312372wmb.1.1685350246121;
        Mon, 29 May 2023 01:50:46 -0700 (PDT)
Date: Mon, 29 May 2023 10:50:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Aarushi Mehta <mehta.aaru20@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Hanna Reitz <hreitz@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org, 
	eblake@redhat.com, Anthony Perard <anthony.perard@citrix.com>, 
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 5/6] block/linux-aio: convert to blk_io_plug_call() API
Message-ID: <63lutuyufibun4jscbjjlshbqqw6otetzfi67rfnfrxacwutnj@igewwxh4uwys>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-6-stefanha@redhat.com>
 <n6hik7dbl26lomhxvfal2kjrq6jhdiknjepb372dvxavuwiw6q@3l3mo4eywoxq>
 <20230524193634.GB17357@fedora>
MIME-Version: 1.0
In-Reply-To: <20230524193634.GB17357@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, May 24, 2023 at 03:36:34PM -0400, Stefan Hajnoczi wrote:
>On Wed, May 24, 2023 at 10:52:03AM +0200, Stefano Garzarella wrote:
>> On Tue, May 23, 2023 at 01:12:59PM -0400, Stefan Hajnoczi wrote:
>> > Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>> > block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>> > submission instead.
>> >
>> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> > Reviewed-by: Eric Blake <eblake@redhat.com>
>> > ---
>> > include/block/raw-aio.h |  7 -------
>> > block/file-posix.c      | 28 ----------------------------
>> > block/linux-aio.c       | 41 +++++++++++------------------------------
>> > 3 files changed, 11 insertions(+), 65 deletions(-)
>> >
>> > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
>> > index da60ca13ef..0f63c2800c 100644
>> > --- a/include/block/raw-aio.h
>> > +++ b/include/block/raw-aio.h
>> > @@ -62,13 +62,6 @@ int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *qiov,
>> >
>> > void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
>> > void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
>> > -
>> > -/*
>> > - * laio_io_plug/unplug work in the thread's current AioContext, therefore the
>> > - * caller must ensure that they are paired in the same IOThread.
>> > - */
>> > -void laio_io_plug(void);
>> > -void laio_io_unplug(uint64_t dev_max_batch);
>> > #endif
>> > /* io_uring.c - Linux io_uring implementation */
>> > #ifdef CONFIG_LINUX_IO_URING
>> > diff --git a/block/file-posix.c b/block/file-posix.c
>> > index 7baa8491dd..ac1ed54811 100644
>> > --- a/block/file-posix.c
>> > +++ b/block/file-posix.c
>> > @@ -2550,26 +2550,6 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
>> >     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
>> > }
>> >
>> > -static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
>> > -{
>> > -    BDRVRawState __attribute__((unused)) *s = bs->opaque;
>> > -#ifdef CONFIG_LINUX_AIO
>> > -    if (s->use_linux_aio) {
>> > -        laio_io_plug();
>> > -    }
>> > -#endif
>> > -}
>> > -
>> > -static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
>> > -{
>> > -    BDRVRawState __attribute__((unused)) *s = bs->opaque;
>> > -#ifdef CONFIG_LINUX_AIO
>> > -    if (s->use_linux_aio) {
>> > -        laio_io_unplug(s->aio_max_batch);
>> > -    }
>> > -#endif
>> > -}
>> > -
>> > static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
>> > {
>> >     BDRVRawState *s = bs->opaque;
>> > @@ -3914,8 +3894,6 @@ BlockDriver bdrv_file = {
>> >     .bdrv_co_copy_range_from = raw_co_copy_range_from,
>> >     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
>> >     .bdrv_refresh_limits = raw_refresh_limits,
>> > -    .bdrv_co_io_plug        = raw_co_io_plug,
>> > -    .bdrv_co_io_unplug      = raw_co_io_unplug,
>> >     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>> >
>> >     .bdrv_co_truncate                   = raw_co_truncate,
>> > @@ -4286,8 +4264,6 @@ static BlockDriver bdrv_host_device = {
>> >     .bdrv_co_copy_range_from = raw_co_copy_range_from,
>> >     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
>> >     .bdrv_refresh_limits = raw_refresh_limits,
>> > -    .bdrv_co_io_plug        = raw_co_io_plug,
>> > -    .bdrv_co_io_unplug      = raw_co_io_unplug,
>> >     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>> >
>> >     .bdrv_co_truncate                   = raw_co_truncate,
>> > @@ -4424,8 +4400,6 @@ static BlockDriver bdrv_host_cdrom = {
>> >     .bdrv_co_pwritev        = raw_co_pwritev,
>> >     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
>> >     .bdrv_refresh_limits    = cdrom_refresh_limits,
>> > -    .bdrv_co_io_plug        = raw_co_io_plug,
>> > -    .bdrv_co_io_unplug      = raw_co_io_unplug,
>> >     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>> >
>> >     .bdrv_co_truncate                   = raw_co_truncate,
>> > @@ -4552,8 +4526,6 @@ static BlockDriver bdrv_host_cdrom = {
>> >     .bdrv_co_pwritev        = raw_co_pwritev,
>> >     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
>> >     .bdrv_refresh_limits    = cdrom_refresh_limits,
>> > -    .bdrv_co_io_plug        = raw_co_io_plug,
>> > -    .bdrv_co_io_unplug      = raw_co_io_unplug,
>> >     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>> >
>> >     .bdrv_co_truncate                   = raw_co_truncate,
>> > diff --git a/block/linux-aio.c b/block/linux-aio.c
>> > index 442c86209b..5021aed68f 100644
>> > --- a/block/linux-aio.c
>> > +++ b/block/linux-aio.c
>> > @@ -15,6 +15,7 @@
>> > #include "qemu/event_notifier.h"
>> > #include "qemu/coroutine.h"
>> > #include "qapi/error.h"
>> > +#include "sysemu/block-backend.h"
>> >
>> > /* Only used for assertions.  */
>> > #include "qemu/coroutine_int.h"
>> > @@ -46,7 +47,6 @@ struct qemu_laiocb {
>> > };
>> >
>> > typedef struct {
>> > -    int plugged;
>> >     unsigned int in_queue;
>> >     unsigned int in_flight;
>> >     bool blocked;
>> > @@ -236,7 +236,7 @@ static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
>> > {
>> >     qemu_laio_process_completions(s);
>> >
>> > -    if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>> > +    if (!QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>> >         ioq_submit(s);
>> >     }
>> > }
>> > @@ -277,7 +277,6 @@ static void qemu_laio_poll_ready(EventNotifier *opaque)
>> > static void ioq_init(LaioQueue *io_q)
>> > {
>> >     QSIMPLEQ_INIT(&io_q->pending);
>> > -    io_q->plugged = 0;
>> >     io_q->in_queue = 0;
>> >     io_q->in_flight = 0;
>> >     io_q->blocked = false;
>> > @@ -354,31 +353,11 @@ static uint64_t laio_max_batch(LinuxAioState *s, uint64_t dev_max_batch)
>> >     return max_batch;
>> > }
>> >
>> > -void laio_io_plug(void)
>> > +static void laio_unplug_fn(void *opaque)
>> > {
>> > -    AioContext *ctx = qemu_get_current_aio_context();
>> > -    LinuxAioState *s = aio_get_linux_aio(ctx);
>> > +    LinuxAioState *s = opaque;
>> >
>> > -    s->io_q.plugged++;
>> > -}
>> > -
>> > -void laio_io_unplug(uint64_t dev_max_batch)
>> > -{
>> > -    AioContext *ctx = qemu_get_current_aio_context();
>> > -    LinuxAioState *s = aio_get_linux_aio(ctx);
>> > -
>> > -    assert(s->io_q.plugged);
>> > -    s->io_q.plugged--;
>> > -
>> > -    /*
>> > -     * Why max batch checking is performed here:
>> > -     * Another BDS may have queued requests with a higher dev_max_batch and
>> > -     * therefore in_queue could now exceed our dev_max_batch. Re-check the max
>> > -     * batch so we can honor our device's dev_max_batch.
>> > -     */
>> > -    if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
>>
>> Why are we removing this condition?
>> Could the same situation occur with the new API?
>
>The semantics of unplug_fn() are different from .bdrv_co_unplug():
>1. unplug_fn() is only called when the last blk_io_unplug() call occurs,
>   not every time blk_io_unplug() is called.
>2. unplug_fn() is per-thread, not per-BlockDriverState, so there is no
>   way to get per-BlockDriverState fields like dev_max_batch.
>
>Therefore this condition cannot be moved to laio_unplug_fn().

I see now.

>
>How important is this condition? I believe that dropping it does not
>have much of an effect but maybe I missed something.

With Kevin we agreed to add it to avoid extra latency in some devices,
but we didn't do much testing on this.

IIRC what solved the performance degradation was the check in
laio_do_submit() that we still have after this changes.

So it may not have much effect, but maybe it's worth mentioning in
the commit description.

>
>Also, does it make sense to define per-BlockDriverState batching limits
>when the AIO engine (Linux AIO or io_uring) is thread-local and shared
>between all BlockDriverStates? I believe the fundamental reason (that we
>discovered later) why dev_max_batch is effective is because the Linux
>kernel processes 32 I/O request submissions at a time. Anything above 32
>adds latency without a batching benefit.

This is a good point, maybe we should confirm it with some tests though.

Thanks,
Stefano


