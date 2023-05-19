Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD467091E8
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536764.835442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvkc-0000Gu-Ik; Fri, 19 May 2023 08:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536764.835442; Fri, 19 May 2023 08:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvkc-0000DV-Ei; Fri, 19 May 2023 08:46:14 +0000
Received: by outflank-mailman (input) for mailman id 536764;
 Fri, 19 May 2023 08:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qg83=BI=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1pzvkb-0000DN-Il
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:46:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99d6db0a-f621-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 10:46:10 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-Qy-wZ0UXOZ-r82kUg5uy3w-1; Fri, 19 May 2023 04:46:04 -0400
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-96f4d917e06so85084166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 May 2023 01:46:03 -0700 (PDT)
Received: from sgarzare-redhat (c-115-213.cust-q.wadsl.it. [212.43.115.213])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a17090679d200b00965af4c7f07sm1997520ejo.20.2023.05.19.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 01:46:01 -0700 (PDT)
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
X-Inumbo-ID: 99d6db0a-f621-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684485969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgI8OJAIeNt0D4Rn40wXDXa5ZKqF4jwy77J/VpVAn4w=;
	b=acDY8iTrgE8uXIxanbvyBB8HzEQVv6qFnmhpoFdQcOVyqhM+G1CkdPQLGV+Idd0nDoUWbx
	zeg9OhBk/jTSSTfndT9ugTKs5XAhKK47gZdPmwtZsmapWdPXAeN4U+TTAuGMeqYnJRoOFe
	AfkvkSkCynqPwglwyoeQFyr5u5r5+H8=
X-MC-Unique: Qy-wZ0UXOZ-r82kUg5uy3w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684485963; x=1687077963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgI8OJAIeNt0D4Rn40wXDXa5ZKqF4jwy77J/VpVAn4w=;
        b=CuAptvjx/Cf6nQ9nf4cS9neH0Mrx1ko3F0gecm+bPPMkHhw2uG0Zmo6xWTdio16mvS
         H5ee6kYZWQ7/PXzwZ6aYQW/p1VjfE7QTH7qG0e1ooDTHr4wYz3zeFhxRw58vGsyg9FHl
         w8wvZqdvCMCOTXGp8ammRNtzv3VKOJQ50DsEkXK2o9byOFbtClO3086XDMtZSOQdb4vf
         t1dXceDaMXOxKnG8t7M9aR4TMj34puU8v4TGjg+lz5cUsatjvEd/WnN4ZBQ9vui1fECE
         fDNiHif9CbCzfwwIz7hMG6LgUDId386tWv+MyfPvtbcZUP4fJun9XiO4tYEyocNvNFTP
         cOxA==
X-Gm-Message-State: AC+VfDxuP/NodEY7MzvXebP37amyTc1wZ/ltEmabKyOyWfh901hrcF2n
	pdOpWvsDGG2dvy+gWudhwDmeJVOMkXiWLDF2uxEakY0hS0S7MKXa4D7/5W1pB5CkjXyPzZRISRy
	muionAdOc9kvuEGkhj3jd/00K5/E=
X-Received: by 2002:a17:907:3e0b:b0:967:13a3:d82c with SMTP id hp11-20020a1709073e0b00b0096713a3d82cmr1204381ejc.26.1684485962912;
        Fri, 19 May 2023 01:46:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s/YXjjycc6PLN79YkUCZyKXcyl+Pgz0v3jvliAT7csD7GqowYq044W8A3xmPDZJy18EdUeA==
X-Received: by 2002:a17:907:3e0b:b0:967:13a3:d82c with SMTP id hp11-20020a1709073e0b00b0096713a3d82cmr1204351ejc.26.1684485962534;
        Fri, 19 May 2023 01:46:02 -0700 (PDT)
Date: Fri, 19 May 2023 10:45:57 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
	Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: add blk_io_plug_call() API
Message-ID: <mzxjz4d3ab3sq6grwsle6wlacysh2uffz42ojpdze3hmqimbr5@fxgkad47nnim>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230517221022.325091-2-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, May 17, 2023 at 06:10:17PM -0400, Stefan Hajnoczi wrote:
>Introduce a new API for thread-local blk_io_plug() that does not
>traverse the block graph. The goal is to make blk_io_plug() multi-queue
>friendly.
>
>Instead of having block drivers track whether or not we're in a plugged
>section, provide an API that allows them to defer a function call until
>we're unplugged: blk_io_plug_call(fn, opaque). If blk_io_plug_call() is
>called multiple times with the same fn/opaque pair, then fn() is only
>called once at the end of the function - resulting in batching.
>
>This patch introduces the API and changes blk_io_plug()/blk_io_unplug().
>blk_io_plug()/blk_io_unplug() no longer require a BlockBackend argument
>because the plug state is now thread-local.
>
>Later patches convert block drivers to blk_io_plug_call() and then we
>can finally remove .bdrv_co_io_plug() once all block drivers have been
>converted.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> MAINTAINERS                       |   1 +
> include/sysemu/block-backend-io.h |  13 +--
> block/block-backend.c             |  22 -----
> block/plug.c                      | 159 ++++++++++++++++++++++++++++++
> hw/block/dataplane/xen-block.c    |   8 +-
> hw/block/virtio-blk.c             |   4 +-
> hw/scsi/virtio-scsi.c             |   6 +-
> block/meson.build                 |   1 +
> 8 files changed, 173 insertions(+), 41 deletions(-)
> create mode 100644 block/plug.c
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 50585117a0..574202295c 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -2644,6 +2644,7 @@ F: util/aio-*.c
> F: util/aio-*.h
> F: util/fdmon-*.c
> F: block/io.c
>+F: block/plug.c
> F: migration/block*
> F: include/block/aio.h
> F: include/block/aio-wait.h
>diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
>index d62a7ee773..be4dcef59d 100644
>--- a/include/sysemu/block-backend-io.h
>+++ b/include/sysemu/block-backend-io.h
>@@ -100,16 +100,9 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
> int blk_get_max_iov(BlockBackend *blk);
> int blk_get_max_hw_iov(BlockBackend *blk);
>
>-/*
>- * blk_io_plug/unplug are thread-local operations. This means that multiple
>- * IOThreads can simultaneously call plug/unplug, but the caller must ensure
>- * that each unplug() is called in the same IOThread of the matching plug().
>- */
>-void coroutine_fn blk_co_io_plug(BlockBackend *blk);
>-void co_wrapper blk_io_plug(BlockBackend *blk);
>-
>-void coroutine_fn blk_co_io_unplug(BlockBackend *blk);
>-void co_wrapper blk_io_unplug(BlockBackend *blk);
>+void blk_io_plug(void);
>+void blk_io_unplug(void);
>+void blk_io_plug_call(void (*fn)(void *), void *opaque);
>
> AioContext *blk_get_aio_context(BlockBackend *blk);
> BlockAcctStats *blk_get_stats(BlockBackend *blk);
>diff --git a/block/block-backend.c b/block/block-backend.c
>index ca537cd0ad..1f1d226ba6 100644
>--- a/block/block-backend.c
>+++ b/block/block-backend.c
>@@ -2568,28 +2568,6 @@ void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
>     notifier_list_add(&blk->insert_bs_notifiers, notify);
> }
>
>-void coroutine_fn blk_co_io_plug(BlockBackend *blk)
>-{
>-    BlockDriverState *bs = blk_bs(blk);
>-    IO_CODE();
>-    GRAPH_RDLOCK_GUARD();
>-
>-    if (bs) {
>-        bdrv_co_io_plug(bs);
>-    }
>-}
>-
>-void coroutine_fn blk_co_io_unplug(BlockBackend *blk)
>-{
>-    BlockDriverState *bs = blk_bs(blk);
>-    IO_CODE();
>-    GRAPH_RDLOCK_GUARD();
>-
>-    if (bs) {
>-        bdrv_co_io_unplug(bs);
>-    }
>-}
>-
> BlockAcctStats *blk_get_stats(BlockBackend *blk)
> {
>     IO_CODE();
>diff --git a/block/plug.c b/block/plug.c
>new file mode 100644
>index 0000000000..6738a568ba
>--- /dev/null
>+++ b/block/plug.c
>@@ -0,0 +1,159 @@
>+/* SPDX-License-Identifier: GPL-2.0-or-later */
>+/*
>+ * Block I/O plugging
>+ *
>+ * Copyright Red Hat.
>+ *
>+ * This API defers a function call within a blk_io_plug()/blk_io_unplug()
>+ * section, allowing multiple calls to batch up. This is a performance
>+ * optimization that is used in the block layer to submit several I/O requests
>+ * at once instead of individually:
>+ *
>+ *   blk_io_plug(); <-- start of plugged region
>+ *   ...
>+ *   blk_io_plug_call(my_func, my_obj); <-- deferred my_func(my_obj) call
>+ *   blk_io_plug_call(my_func, my_obj); <-- another
>+ *   blk_io_plug_call(my_func, my_obj); <-- another
>+ *   ...
>+ *   blk_io_unplug(); <-- end of plugged region, my_func(my_obj) is called once
>+ *
>+ * This code is actually generic and not tied to the block layer. If another
>+ * subsystem needs this functionality, it could be renamed.
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "qemu/coroutine-tls.h"
>+#include "qemu/notify.h"
>+#include "qemu/thread.h"
>+#include "sysemu/block-backend.h"
>+
>+/* A function call that has been deferred until unplug() */
>+typedef struct {
>+    void (*fn)(void *);
>+    void *opaque;
>+} UnplugFn;
>+
>+/* Per-thread state */
>+typedef struct {
>+    unsigned count;       /* how many times has plug() been called? */
>+    GArray *unplug_fns;   /* functions to call at unplug time */
>+} Plug;
>+
>+/* Use get_ptr_plug() to fetch this thread-local value */
>+QEMU_DEFINE_STATIC_CO_TLS(Plug, plug);
>+
>+/* Called at thread cleanup time */
>+static void blk_io_plug_atexit(Notifier *n, void *value)
>+{
>+    Plug *plug = get_ptr_plug();
>+    g_array_free(plug->unplug_fns, TRUE);
>+}
>+
>+/* This won't involve coroutines, so use __thread */
>+static __thread Notifier blk_io_plug_atexit_notifier;
>+
>+/**
>+ * blk_io_plug_call:
>+ * @fn: a function pointer to be invoked
>+ * @opaque: a user-defined argument to @fn()
>+ *
>+ * Call @fn(@opaque) immediately if not within a blk_io_plug()/blk_io_unplug()
>+ * section.

Just to understand better, what if two BlockDrivers share the same
iothread but one calls blk_io_plug()/blk_io_unplug(), while the other
calls this function not in a blk_io_plug()/blk_io_unplug() section?

If the call is in the middle of the other BlockDriver's section, it is
deferred, right?

Is this situation possible?
Or should we prevent blk_io_plug_call() from being called out of a
blk_io_plug()/blk_io_unplug() section?

Thanks,
Stefano

>+ *
>+ * Otherwise defer the call until the end of the outermost
>+ * blk_io_plug()/blk_io_unplug() section in this thread. If the same
>+ * @fn/@opaque pair has already been deferred, it will only be called once upon
>+ * blk_io_unplug() so that accumulated calls are batched into a single call.
>+ *
>+ * The caller must ensure that @opaque is not be freed before @fn() is invoked.
>+ */
>+void blk_io_plug_call(void (*fn)(void *), void *opaque)
>+{
>+    Plug *plug = get_ptr_plug();
>+
>+    /* Call immediately if we're not plugged */
>+    if (plug->count == 0) {
>+        fn(opaque);
>+        return;
>+    }
>+
>+    GArray *array = plug->unplug_fns;
>+    if (!array) {
>+        array = g_array_new(FALSE, FALSE, sizeof(UnplugFn));
>+        plug->unplug_fns = array;
>+        blk_io_plug_atexit_notifier.notify = blk_io_plug_atexit;
>+        qemu_thread_atexit_add(&blk_io_plug_atexit_notifier);
>+    }
>+
>+    UnplugFn *fns = (UnplugFn *)array->data;
>+    UnplugFn new_fn = {
>+        .fn = fn,
>+        .opaque = opaque,
>+    };
>+
>+    /*
>+     * There won't be many, so do a linear search. If this becomes a bottleneck
>+     * then a binary search (glib 2.62+) or different data structure could be
>+     * used.
>+     */
>+    for (guint i = 0; i < array->len; i++) {
>+        if (memcmp(&fns[i], &new_fn, sizeof(new_fn)) == 0) {
>+            return; /* already exists */
>+        }
>+    }
>+
>+    g_array_append_val(array, new_fn);
>+}
>+
>+/**
>+ * blk_io_plug: Defer blk_io_plug_call() functions until blk_io_unplug()
>+ *
>+ * blk_io_plug/unplug are thread-local operations. This means that multiple
>+ * threads can simultaneously call plug/unplug, but the caller must ensure that
>+ * each unplug() is called in the same thread of the matching plug().
>+ *
>+ * Nesting is supported. blk_io_plug_call() functions are only called at the
>+ * outermost blk_io_unplug().
>+ */
>+void blk_io_plug(void)
>+{
>+    Plug *plug = get_ptr_plug();
>+
>+    assert(plug->count < UINT32_MAX);
>+
>+    plug->count++;
>+}
>+
>+/**
>+ * blk_io_unplug: Run any pending blk_io_plug_call() functions
>+ *
>+ * There must have been a matching blk_io_plug() call in the same thread prior
>+ * to this blk_io_unplug() call.
>+ */
>+void blk_io_unplug(void)
>+{
>+    Plug *plug = get_ptr_plug();
>+
>+    assert(plug->count > 0);
>+
>+    if (--plug->count > 0) {
>+        return;
>+    }
>+
>+    GArray *array = plug->unplug_fns;
>+    if (!array) {
>+        return;
>+    }
>+
>+    UnplugFn *fns = (UnplugFn *)array->data;
>+
>+    for (guint i = 0; i < array->len; i++) {
>+        fns[i].fn(fns[i].opaque);
>+    }
>+
>+    /*
>+     * This resets the array without freeing memory so that appending is cheap
>+     * in the future.
>+     */
>+    g_array_set_size(array, 0);
>+}
>diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
>index d8bc39d359..e49c24f63d 100644
>--- a/hw/block/dataplane/xen-block.c
>+++ b/hw/block/dataplane/xen-block.c
>@@ -537,7 +537,7 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>      * is below us.
>      */
>     if (inflight_atstart > IO_PLUG_THRESHOLD) {
>-        blk_io_plug(dataplane->blk);
>+        blk_io_plug();
>     }
>     while (rc != rp) {
>         /* pull request from ring */
>@@ -577,12 +577,12 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>
>         if (inflight_atstart > IO_PLUG_THRESHOLD &&
>             batched >= inflight_atstart) {
>-            blk_io_unplug(dataplane->blk);
>+            blk_io_unplug();
>         }
>         xen_block_do_aio(request);
>         if (inflight_atstart > IO_PLUG_THRESHOLD) {
>             if (batched >= inflight_atstart) {
>-                blk_io_plug(dataplane->blk);
>+                blk_io_plug();
>                 batched = 0;
>             } else {
>                 batched++;
>@@ -590,7 +590,7 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>         }
>     }
>     if (inflight_atstart > IO_PLUG_THRESHOLD) {
>-        blk_io_unplug(dataplane->blk);
>+        blk_io_unplug();
>     }
>
>     return done_something;
>diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>index 8f65ea4659..b4286424c1 100644
>--- a/hw/block/virtio-blk.c
>+++ b/hw/block/virtio-blk.c
>@@ -1134,7 +1134,7 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
>     bool suppress_notifications = virtio_queue_get_notification(vq);
>
>     aio_context_acquire(blk_get_aio_context(s->blk));
>-    blk_io_plug(s->blk);
>+    blk_io_plug();
>
>     do {
>         if (suppress_notifications) {
>@@ -1158,7 +1158,7 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
>         virtio_blk_submit_multireq(s, &mrb);
>     }
>
>-    blk_io_unplug(s->blk);
>+    blk_io_unplug();
>     aio_context_release(blk_get_aio_context(s->blk));
> }
>
>diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
>index 612c525d9d..534a44ee07 100644
>--- a/hw/scsi/virtio-scsi.c
>+++ b/hw/scsi/virtio-scsi.c
>@@ -799,7 +799,7 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
>         return -ENOBUFS;
>     }
>     scsi_req_ref(req->sreq);
>-    blk_io_plug(d->conf.blk);
>+    blk_io_plug();
>     object_unref(OBJECT(d));
>     return 0;
> }
>@@ -810,7 +810,7 @@ static void virtio_scsi_handle_cmd_req_submit(VirtIOSCSI *s, VirtIOSCSIReq *req)
>     if (scsi_req_enqueue(sreq)) {
>         scsi_req_continue(sreq);
>     }
>-    blk_io_unplug(sreq->dev->conf.blk);
>+    blk_io_unplug();
>     scsi_req_unref(sreq);
> }
>
>@@ -836,7 +836,7 @@ static void virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq)
>                 while (!QTAILQ_EMPTY(&reqs)) {
>                     req = QTAILQ_FIRST(&reqs);
>                     QTAILQ_REMOVE(&reqs, req, next);
>-                    blk_io_unplug(req->sreq->dev->conf.blk);
>+                    blk_io_unplug();
>                     scsi_req_unref(req->sreq);
>                     virtqueue_detach_element(req->vq, &req->elem, 0);
>                     virtio_scsi_free_req(req);
>diff --git a/block/meson.build b/block/meson.build
>index 486dda8b85..fb4332bd66 100644
>--- a/block/meson.build
>+++ b/block/meson.build
>@@ -23,6 +23,7 @@ block_ss.add(files(
>   'mirror.c',
>   'nbd.c',
>   'null.c',
>+  'plug.c',
>   'qapi.c',
>   'qcow2-bitmap.c',
>   'qcow2-cache.c',
>-- 
>2.40.1
>


