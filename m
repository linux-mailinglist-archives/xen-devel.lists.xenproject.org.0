Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EA7091F1
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536776.835460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvlY-0001af-64; Fri, 19 May 2023 08:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536776.835460; Fri, 19 May 2023 08:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvlY-0001YE-3J; Fri, 19 May 2023 08:47:12 +0000
Received: by outflank-mailman (input) for mailman id 536776;
 Fri, 19 May 2023 08:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qg83=BI=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1pzvlW-0000ix-IN
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:47:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd053da0-f621-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 10:47:09 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-B_QYlGeiPvWhY3_A1-Ml5w-1; Fri, 19 May 2023 04:47:05 -0400
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a355c9028so388782366b.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 May 2023 01:47:05 -0700 (PDT)
Received: from sgarzare-redhat (c-115-213.cust-q.wadsl.it. [212.43.115.213])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a170906380f00b0096165b2703asm1988689ejc.110.2023.05.19.01.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 01:47:03 -0700 (PDT)
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
X-Inumbo-ID: bd053da0-f621-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684486028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f9I0g5xFt+Bq1aRK6HzDjwahYXoeZ0017I2Bg1auWyM=;
	b=VvRA55PXB7NbHMhKMW5KTjz+F7Ng/JLhLSNLe9g5H4i80M02UL0vU9AggzZm1u49Es2+Y0
	maZ8OfNW+KGtk9IN6CYKLv/7cDbEnD0VPzG7kwKkZWWIumnvT97r9GEh+Qi9QiJJyLvol8
	0GgDhKWzzrmuJEeYDB4/ejDtoBRwkDs=
X-MC-Unique: B_QYlGeiPvWhY3_A1-Ml5w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684486024; x=1687078024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9I0g5xFt+Bq1aRK6HzDjwahYXoeZ0017I2Bg1auWyM=;
        b=awL/mfngX0ccXyCGvoIrvySMhXj8NxDqynie7XIthDbVxMrQj2AoMNFOso491oUVeU
         C9yv2GioRK+u7ylpWsOlUr1OUgbkPUEKYf8hGA/O1l/HcW2reW5hgZONexA522UiKzLC
         TRmVTSDWJ0rPMY8HCq7B5inUiBG5LVLp91OBYL+a9JKECdaZ1xQ22mFMhjqjsKVGmrTN
         DT0lC4fBFZB+24M/dYgT+bFjOeqzACIuiS9Sde8Ximy+53R2ju8urlgXjGWx3psj3oPi
         1s9n4NWAAXxk0sD01nKat2iNMwZC4irsXYNKBoJ1LzlN1AFegSFob62K/mznH0ujWRG4
         T0dQ==
X-Gm-Message-State: AC+VfDyobLy5fVH0Gt9eM1VxJIVSJ/pSh/sSHBk8MkCtFQuGCPbbSvD/
	IyLB2DaDBhU9nARZrEGVs4KSGHaz32OZOdYxYkkGh0e8rkCXowPWg1CuuGwo0mskgddTecTJuUl
	A0lfEjrEtcWiSoE1UgOHdl7mscz4=
X-Received: by 2002:a17:907:7f1d:b0:88a:1ea9:a5ea with SMTP id qf29-20020a1709077f1d00b0088a1ea9a5eamr1032502ejc.65.1684486024362;
        Fri, 19 May 2023 01:47:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6fY1cGrDo7A0FTNLr+0xW3nb/0HDfhIGyDb6BB5UI2BqcERvG/eCqnKv++kjeGQo4yNVO08Q==
X-Received: by 2002:a17:907:7f1d:b0:88a:1ea9:a5ea with SMTP id qf29-20020a1709077f1d00b0088a1ea9a5eamr1032472ejc.65.1684486023998;
        Fri, 19 May 2023 01:47:03 -0700 (PDT)
Date: Fri, 19 May 2023 10:47:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 3/6] block/blkio: convert to blk_io_plug_call() API
Message-ID: <wtyut5kd4v5vapon7fzpvi3kghvpplokcas5ovcwnjhiwyuccb@rm6eb6jjhhp5>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-4-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230517221022.325091-4-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 17, 2023 at 06:10:19PM -0400, Stefan Hajnoczi wrote:
>Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>submission instead.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/blkio.c | 40 +++++++++++++++++++++-------------------
> 1 file changed, 21 insertions(+), 19 deletions(-)

With this patch, the build fails in several places, maybe it's an old
version:

../block/blkio.c:347:5: error: implicit declaration of function 
‘blk_io_plug_call’ [-Werror=implicit-function-declaration]
   347 |     blk_io_plug_call(blkio_unplug_fn, bs);

../block/blkio.c:348:22: error: passing argument 1 of ‘blk_io_plug_call’ 
from incompatible pointer type [-Werror=incompatible-pointer-types]
   348 |     blk_io_plug_call(blkio_unplug_fn, bs);

Thanks,
Stefano

>
>diff --git a/block/blkio.c b/block/blkio.c
>index 0cdc99a729..f2a1dc1fb2 100644
>--- a/block/blkio.c
>+++ b/block/blkio.c
>@@ -325,16 +325,28 @@ static void blkio_detach_aio_context(BlockDriverState *bs)
>                        false, NULL, NULL, NULL, NULL, NULL);
> }
>
>-/* Call with s->blkio_lock held to submit I/O after enqueuing a new request */
>-static void blkio_submit_io(BlockDriverState *bs)
>+/*
>+ * Called by blk_io_unplug() or immediately if not plugged. Called without
>+ * blkio_lock.
>+ */
>+static void blkio_unplug_fn(BlockDriverState *bs)
> {
>-    if (qatomic_read(&bs->io_plugged) == 0) {
>-        BDRVBlkioState *s = bs->opaque;
>+    BDRVBlkioState *s = bs->opaque;
>
>+    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
>         blkioq_do_io(s->blkioq, NULL, 0, 0, NULL);
>     }
> }
>
>+/*
>+ * Schedule I/O submission after enqueuing a new request. Called without
>+ * blkio_lock.
>+ */
>+static void blkio_submit_io(BlockDriverState *bs)
>+{
>+    blk_io_plug_call(blkio_unplug_fn, bs);
>+}
>+
> static int coroutine_fn
> blkio_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
> {
>@@ -345,9 +357,9 @@ blkio_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
>
>     WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
>         blkioq_discard(s->blkioq, offset, bytes, &cod, 0);
>-        blkio_submit_io(bs);
>     }
>
>+    blkio_submit_io(bs);
>     qemu_coroutine_yield();
>     return cod.ret;
> }
>@@ -378,9 +390,9 @@ blkio_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
>
>     WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
>         blkioq_readv(s->blkioq, offset, iov, iovcnt, &cod, 0);
>-        blkio_submit_io(bs);
>     }
>
>+    blkio_submit_io(bs);
>     qemu_coroutine_yield();
>
>     if (use_bounce_buffer) {
>@@ -423,9 +435,9 @@ static int coroutine_fn blkio_co_pwritev(BlockDriverState *bs, int64_t offset,
>
>     WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
>         blkioq_writev(s->blkioq, offset, iov, iovcnt, &cod, blkio_flags);
>-        blkio_submit_io(bs);
>     }
>
>+    blkio_submit_io(bs);
>     qemu_coroutine_yield();
>
>     if (use_bounce_buffer) {
>@@ -444,9 +456,9 @@ static int coroutine_fn blkio_co_flush(BlockDriverState *bs)
>
>     WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
>         blkioq_flush(s->blkioq, &cod, 0);
>-        blkio_submit_io(bs);
>     }
>
>+    blkio_submit_io(bs);
>     qemu_coroutine_yield();
>     return cod.ret;
> }
>@@ -472,22 +484,13 @@ static int coroutine_fn blkio_co_pwrite_zeroes(BlockDriverState *bs,
>
>     WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
>         blkioq_write_zeroes(s->blkioq, offset, bytes, &cod, blkio_flags);
>-        blkio_submit_io(bs);
>     }
>
>+    blkio_submit_io(bs);
>     qemu_coroutine_yield();
>     return cod.ret;
> }
>
>-static void coroutine_fn blkio_co_io_unplug(BlockDriverState *bs)
>-{
>-    BDRVBlkioState *s = bs->opaque;
>-
>-    WITH_QEMU_LOCK_GUARD(&s->blkio_lock) {
>-        blkio_submit_io(bs);
>-    }
>-}
>-
> typedef enum {
>     BMRR_OK,
>     BMRR_SKIP,
>@@ -1009,7 +1012,6 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
>         .bdrv_co_pwritev         = blkio_co_pwritev, \
>         .bdrv_co_flush_to_disk   = blkio_co_flush, \
>         .bdrv_co_pwrite_zeroes   = blkio_co_pwrite_zeroes, \
>-        .bdrv_co_io_unplug       = blkio_co_io_unplug, \
>         .bdrv_refresh_limits     = blkio_refresh_limits, \
>         .bdrv_register_buf       = blkio_register_buf, \
>         .bdrv_unregister_buf     = blkio_unregister_buf, \
>-- 
>2.40.1
>


