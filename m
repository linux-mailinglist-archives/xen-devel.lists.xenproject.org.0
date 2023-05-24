Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D6170F17E
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538897.839260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kEq-0000o4-Cd; Wed, 24 May 2023 08:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538897.839260; Wed, 24 May 2023 08:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kEq-0000kh-9o; Wed, 24 May 2023 08:52:56 +0000
Received: by outflank-mailman (input) for mailman id 538897;
 Wed, 24 May 2023 08:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCLF=BN=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q1kEo-0000hy-KT
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:52:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d4f4496-fa10-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:52:52 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-H62jd5bBNBKhJzcwknVWQg-1; Wed, 24 May 2023 04:52:09 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30a8ba2debdso196206f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 May 2023 01:52:09 -0700 (PDT)
Received: from sgarzare-redhat ([134.0.5.107])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d514a000000b003079693eff2sm13651819wrt.41.2023.05.24.01.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:52:07 -0700 (PDT)
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
X-Inumbo-ID: 5d4f4496-fa10-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684918371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hS0uvYBcWnukVOxqzspQrxWnJxsCSKpfkO34Ey+pI4g=;
	b=Ci7s6tmqxiVzQNTYA+3lF9QtD5YoVtS7HagY7nu+mzeu6da1l9zCupInQ38HIKDWPxL1YL
	ibJeZz5IlqVQRYbXptZrC5fTZbNTowk10YRijWjbEMeukzU+b4RI5JkGcssiIpB7YekGeB
	fi1OjPpNK2bAet5Wl1Y5fHKMF2mUI/I=
X-MC-Unique: H62jd5bBNBKhJzcwknVWQg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918328; x=1687510328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS0uvYBcWnukVOxqzspQrxWnJxsCSKpfkO34Ey+pI4g=;
        b=HqU2/YwC3XKYoHw+Dq3duna3dO1w2F6chAIr5RNjpkG18ke6XXcGUFG3TOXrreY4lT
         jBJT61Ym9bxXDC9LEaolz+TDRxbl379hGiS/Xm1ztEtbkxTJv5Qv6f5yqxFF5Z8vL8+q
         TGZZiFirhIy6ZxtuE1RX2fciVQo8VVPK8pGsSlab7Xl4dcl3P6/GZ2KKsFbIafnCDlW1
         Gc1w2FQk2q0awD9jJoSqGbp2+w+s5asAayd/Fd/BK9JUsrFHZkN2eAttYh0t0dPankjV
         MI1GqYq9RmOWyjfPIxoO/MGIFCgXZzZgVun7UNgFD84PuPoRps4kDJPRWv6ZmRUJr8an
         1cmQ==
X-Gm-Message-State: AC+VfDyNDMFG5FsdzStiC7IU2dmO25qsGQIgt91NR+7jXa4/1lEkXeSV
	e/6Lw3Zpzu83XzkMpyxOKKxTbI2OMmC4hZW4/m8WOkVHZzRDhDmmrbZ9CJJ6A+QhZeoQTP6MCZ/
	0gUhHAPWA4roRxeC0Yw4aZTG33lA=
X-Received: by 2002:a5d:40c4:0:b0:309:43a2:8e9f with SMTP id b4-20020a5d40c4000000b0030943a28e9fmr12034395wrq.27.1684918328470;
        Wed, 24 May 2023 01:52:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48wcBIrQ1YXKTu9Tjicy/7O8ibTJFW/CAMNgZakXBqw0/BbHdtzE9vLxgJQXPbBNkM7YHDjg==
X-Received: by 2002:a5d:40c4:0:b0:309:43a2:8e9f with SMTP id b4-20020a5d40c4000000b0030943a28e9fmr12034374wrq.27.1684918328166;
        Wed, 24 May 2023 01:52:08 -0700 (PDT)
Date: Wed, 24 May 2023 10:52:03 +0200
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
Message-ID: <n6hik7dbl26lomhxvfal2kjrq6jhdiknjepb372dvxavuwiw6q@3l3mo4eywoxq>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-6-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523171300.132347-6-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 23, 2023 at 01:12:59PM -0400, Stefan Hajnoczi wrote:
>Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>submission instead.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Reviewed-by: Eric Blake <eblake@redhat.com>
>---
> include/block/raw-aio.h |  7 -------
> block/file-posix.c      | 28 ----------------------------
> block/linux-aio.c       | 41 +++++++++++------------------------------
> 3 files changed, 11 insertions(+), 65 deletions(-)
>
>diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
>index da60ca13ef..0f63c2800c 100644
>--- a/include/block/raw-aio.h
>+++ b/include/block/raw-aio.h
>@@ -62,13 +62,6 @@ int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *qiov,
>
> void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
> void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
>-
>-/*
>- * laio_io_plug/unplug work in the thread's current AioContext, therefore the
>- * caller must ensure that they are paired in the same IOThread.
>- */
>-void laio_io_plug(void);
>-void laio_io_unplug(uint64_t dev_max_batch);
> #endif
> /* io_uring.c - Linux io_uring implementation */
> #ifdef CONFIG_LINUX_IO_URING
>diff --git a/block/file-posix.c b/block/file-posix.c
>index 7baa8491dd..ac1ed54811 100644
>--- a/block/file-posix.c
>+++ b/block/file-posix.c
>@@ -2550,26 +2550,6 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
>     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
> }
>
>-static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
>-{
>-    BDRVRawState __attribute__((unused)) *s = bs->opaque;
>-#ifdef CONFIG_LINUX_AIO
>-    if (s->use_linux_aio) {
>-        laio_io_plug();
>-    }
>-#endif
>-}
>-
>-static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
>-{
>-    BDRVRawState __attribute__((unused)) *s = bs->opaque;
>-#ifdef CONFIG_LINUX_AIO
>-    if (s->use_linux_aio) {
>-        laio_io_unplug(s->aio_max_batch);
>-    }
>-#endif
>-}
>-
> static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
> {
>     BDRVRawState *s = bs->opaque;
>@@ -3914,8 +3894,6 @@ BlockDriver bdrv_file = {
>     .bdrv_co_copy_range_from = raw_co_copy_range_from,
>     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
>     .bdrv_refresh_limits = raw_refresh_limits,
>-    .bdrv_co_io_plug        = raw_co_io_plug,
>-    .bdrv_co_io_unplug      = raw_co_io_unplug,
>     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>
>     .bdrv_co_truncate                   = raw_co_truncate,
>@@ -4286,8 +4264,6 @@ static BlockDriver bdrv_host_device = {
>     .bdrv_co_copy_range_from = raw_co_copy_range_from,
>     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
>     .bdrv_refresh_limits = raw_refresh_limits,
>-    .bdrv_co_io_plug        = raw_co_io_plug,
>-    .bdrv_co_io_unplug      = raw_co_io_unplug,
>     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>
>     .bdrv_co_truncate                   = raw_co_truncate,
>@@ -4424,8 +4400,6 @@ static BlockDriver bdrv_host_cdrom = {
>     .bdrv_co_pwritev        = raw_co_pwritev,
>     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
>     .bdrv_refresh_limits    = cdrom_refresh_limits,
>-    .bdrv_co_io_plug        = raw_co_io_plug,
>-    .bdrv_co_io_unplug      = raw_co_io_unplug,
>     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>
>     .bdrv_co_truncate                   = raw_co_truncate,
>@@ -4552,8 +4526,6 @@ static BlockDriver bdrv_host_cdrom = {
>     .bdrv_co_pwritev        = raw_co_pwritev,
>     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
>     .bdrv_refresh_limits    = cdrom_refresh_limits,
>-    .bdrv_co_io_plug        = raw_co_io_plug,
>-    .bdrv_co_io_unplug      = raw_co_io_unplug,
>     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>
>     .bdrv_co_truncate                   = raw_co_truncate,
>diff --git a/block/linux-aio.c b/block/linux-aio.c
>index 442c86209b..5021aed68f 100644
>--- a/block/linux-aio.c
>+++ b/block/linux-aio.c
>@@ -15,6 +15,7 @@
> #include "qemu/event_notifier.h"
> #include "qemu/coroutine.h"
> #include "qapi/error.h"
>+#include "sysemu/block-backend.h"
>
> /* Only used for assertions.  */
> #include "qemu/coroutine_int.h"
>@@ -46,7 +47,6 @@ struct qemu_laiocb {
> };
>
> typedef struct {
>-    int plugged;
>     unsigned int in_queue;
>     unsigned int in_flight;
>     bool blocked;
>@@ -236,7 +236,7 @@ static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
> {
>     qemu_laio_process_completions(s);
>
>-    if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>+    if (!QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>         ioq_submit(s);
>     }
> }
>@@ -277,7 +277,6 @@ static void qemu_laio_poll_ready(EventNotifier *opaque)
> static void ioq_init(LaioQueue *io_q)
> {
>     QSIMPLEQ_INIT(&io_q->pending);
>-    io_q->plugged = 0;
>     io_q->in_queue = 0;
>     io_q->in_flight = 0;
>     io_q->blocked = false;
>@@ -354,31 +353,11 @@ static uint64_t laio_max_batch(LinuxAioState *s, uint64_t dev_max_batch)
>     return max_batch;
> }
>
>-void laio_io_plug(void)
>+static void laio_unplug_fn(void *opaque)
> {
>-    AioContext *ctx = qemu_get_current_aio_context();
>-    LinuxAioState *s = aio_get_linux_aio(ctx);
>+    LinuxAioState *s = opaque;
>
>-    s->io_q.plugged++;
>-}
>-
>-void laio_io_unplug(uint64_t dev_max_batch)
>-{
>-    AioContext *ctx = qemu_get_current_aio_context();
>-    LinuxAioState *s = aio_get_linux_aio(ctx);
>-
>-    assert(s->io_q.plugged);
>-    s->io_q.plugged--;
>-
>-    /*
>-     * Why max batch checking is performed here:
>-     * Another BDS may have queued requests with a higher dev_max_batch and
>-     * therefore in_queue could now exceed our dev_max_batch. Re-check the max
>-     * batch so we can honor our device's dev_max_batch.
>-     */
>-    if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||

Why are we removing this condition?
Could the same situation occur with the new API?

Thanks,
Stefano

>-        (!s->io_q.plugged &&
>-         !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
>+    if (!s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>         ioq_submit(s);
>     }
> }
>@@ -410,10 +389,12 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
>
>     QSIMPLEQ_INSERT_TAIL(&s->io_q.pending, laiocb, next);
>     s->io_q.in_queue++;
>-    if (!s->io_q.blocked &&
>-        (!s->io_q.plugged ||
>-         s->io_q.in_queue >= laio_max_batch(s, dev_max_batch))) {
>-        ioq_submit(s);
>+    if (!s->io_q.blocked) {
>+        if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch)) {
>+            ioq_submit(s);
>+        } else {
>+            blk_io_plug_call(laio_unplug_fn, s);
>+        }
>     }
>
>     return 0;
>-- 
>2.40.1
>


