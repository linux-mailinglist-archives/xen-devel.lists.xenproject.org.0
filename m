Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A7980F149
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653213.1019646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4rB-0004kL-Bp; Tue, 12 Dec 2023 15:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653213.1019646; Tue, 12 Dec 2023 15:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4rB-0004f1-5g; Tue, 12 Dec 2023 15:39:37 +0000
Received: by outflank-mailman (input) for mailman id 653213;
 Tue, 12 Dec 2023 15:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ckot=HX=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rD4r9-0004S0-0k
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:39:35 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a56c5078-9904-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 16:39:33 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-nid3NutHOn2yfWpyd9v-ow-1; Tue, 12 Dec 2023 10:39:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F7B8101A52A;
 Tue, 12 Dec 2023 15:39:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA6D71C060AF;
 Tue, 12 Dec 2023 15:39:24 +0000 (UTC)
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
X-Inumbo-ID: a56c5078-9904-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702395572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kB/so7QFFjnkFtHtE1LEBq5orXKBbKTqYBv/2PCkoOc=;
	b=TfmFqPQ2tR5GgtDQi+L3YvTq6QHFFWx8fQv7zpMyBVLV6cfJ8Dso+S/x5PQEUPNFvNuNO+
	kImmvUY+qzV3JfIHJCOICv/ixFRhImFKm1iaFsF88g7VtRDHMhrE1rBUH7TYuk6YK8P8QG
	AKd0oP2sSI6EebiKILTmIyRXiAFdPYw=
X-MC-Unique: nid3NutHOn2yfWpyd9v-ow-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexander Graf <agraf@csgraf.de>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Fam Zheng <fam@euphon.net>,
	Song Gao <gaosong@loongson.cn>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leonardo Bras <leobras@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Cameron Esfahani <dirty@apple.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Weiwei Li <liwei1518@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Stafford Horne <shorne@gmail.com>,
	Fabiano Rosas <farosas@suse.de>,
	Juan Quintela <quintela@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Blake <eblake@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/5] Rename "QEMU global mutex" to "BQL" in comments and docs
Date: Tue, 12 Dec 2023 10:39:04 -0500
Message-ID: <20231212153905.631119-6-stefanha@redhat.com>
In-Reply-To: <20231212153905.631119-1-stefanha@redhat.com>
References: <20231212153905.631119-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

The term "QEMU global mutex" is identical to the more widely used Big
QEMU Lock ("BQL"). Update the code comments and documentation to use
"BQL" instead of "QEMU global mutex".

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/multi-thread-tcg.rst   |  7 +++----
 docs/devel/qapi-code-gen.rst      |  2 +-
 docs/devel/replay.rst             |  2 +-
 docs/devel/multiple-iothreads.txt | 16 ++++++++--------
 include/block/blockjob.h          |  6 +++---
 include/io/task.h                 |  2 +-
 include/qemu/coroutine-core.h     |  2 +-
 include/qemu/coroutine.h          |  2 +-
 hw/block/dataplane/virtio-blk.c   |  8 ++++----
 hw/block/virtio-blk.c             |  2 +-
 hw/scsi/virtio-scsi-dataplane.c   |  6 +++---
 net/tap.c                         |  2 +-
 12 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index c9541a7b20..7302c3bf53 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -226,10 +226,9 @@ instruction. This could be a future optimisation.
 Emulated hardware state
 -----------------------
 
-Currently thanks to KVM work any access to IO memory is automatically
-protected by the global iothread mutex, also known as the BQL (Big
-QEMU Lock). Any IO region that doesn't use global mutex is expected to
-do its own locking.
+Currently thanks to KVM work any access to IO memory is automatically protected
+by the BQL (Big QEMU Lock). Any IO region that doesn't use the BQL is expected
+to do its own locking.
 
 However IO memory isn't the only way emulated hardware state can be
 modified. Some architectures have model specific registers that
diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 7f78183cd4..ea8228518c 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -594,7 +594,7 @@ blocking the guest and other background operations.
 Coroutine safety can be hard to prove, similar to thread safety.  Common
 pitfalls are:
 
-- The global mutex isn't held across ``qemu_coroutine_yield()``, so
+- The BQL isn't held across ``qemu_coroutine_yield()``, so
   operations that used to assume that they execute atomically may have
   to be more careful to protect against changes in the global state.
 
diff --git a/docs/devel/replay.rst b/docs/devel/replay.rst
index 0244be8b9c..effd856f0c 100644
--- a/docs/devel/replay.rst
+++ b/docs/devel/replay.rst
@@ -184,7 +184,7 @@ modes.
 Reading and writing requests are created by CPU thread of QEMU. Later these
 requests proceed to block layer which creates "bottom halves". Bottom
 halves consist of callback and its parameters. They are processed when
-main loop locks the global mutex. These locks are not synchronized with
+main loop locks the BQL. These locks are not synchronized with
 replaying process because main loop also processes the events that do not
 affect the virtual machine state (like user interaction with monitor).
 
diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iothreads.txt
index a3e949f6b3..828e5527a3 100644
--- a/docs/devel/multiple-iothreads.txt
+++ b/docs/devel/multiple-iothreads.txt
@@ -5,7 +5,7 @@ the COPYING file in the top-level directory.
 
 
 This document explains the IOThread feature and how to write code that runs
-outside the QEMU global mutex.
+outside the BQL.
 
 The main loop and IOThreads
 ---------------------------
@@ -29,13 +29,13 @@ scalability bottleneck on hosts with many CPUs.  Work can be spread across
 several IOThreads instead of just one main loop.  When set up correctly this
 can improve I/O latency and reduce jitter seen by the guest.
 
-The main loop is also deeply associated with the QEMU global mutex, which is a
-scalability bottleneck in itself.  vCPU threads and the main loop use the QEMU
-global mutex to serialize execution of QEMU code.  This mutex is necessary
-because a lot of QEMU's code historically was not thread-safe.
+The main loop is also deeply associated with the BQL, which is a
+scalability bottleneck in itself.  vCPU threads and the main loop use the BQL
+to serialize execution of QEMU code.  This mutex is necessary because a lot of
+QEMU's code historically was not thread-safe.
 
 The fact that all I/O processing is done in a single main loop and that the
-QEMU global mutex is contended by all vCPU threads and the main loop explain
+BQL is contended by all vCPU threads and the main loop explain
 why it is desirable to place work into IOThreads.
 
 The experimental virtio-blk data-plane implementation has been benchmarked and
@@ -66,7 +66,7 @@ There are several old APIs that use the main loop AioContext:
 
 Since they implicitly work on the main loop they cannot be used in code that
 runs in an IOThread.  They might cause a crash or deadlock if called from an
-IOThread since the QEMU global mutex is not held.
+IOThread since the BQL is not held.
 
 Instead, use the AioContext functions directly (see include/block/aio.h):
  * aio_set_fd_handler() - monitor a file descriptor
@@ -105,7 +105,7 @@ used in the block layer and can lead to hangs.
 
 There is currently no lock ordering rule if a thread needs to acquire multiple
 AioContexts simultaneously.  Therefore, it is only safe for code holding the
-QEMU global mutex to acquire other AioContexts.
+BQL to acquire other AioContexts.
 
 Side note: the best way to schedule a function call across threads is to call
 aio_bh_schedule_oneshot().  No acquire/release or locking is needed.
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index e594c10d23..7061ab7201 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -54,7 +54,7 @@ typedef struct BlockJob {
 
     /**
      * Speed that was set with @block_job_set_speed.
-     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
+     * Always modified and read under the BQL (GLOBAL_STATE_CODE).
      */
     int64_t speed;
 
@@ -66,7 +66,7 @@ typedef struct BlockJob {
 
     /**
      * Block other operations when block job is running.
-     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
+     * Always modified and read under the BQL (GLOBAL_STATE_CODE).
      */
     Error *blocker;
 
@@ -89,7 +89,7 @@ typedef struct BlockJob {
 
     /**
      * BlockDriverStates that are involved in this block job.
-     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
+     * Always modified and read under the BQL (GLOBAL_STATE_CODE).
      */
     GSList *nodes;
 } BlockJob;
diff --git a/include/io/task.h b/include/io/task.h
index dc7d32ebd0..0b5342ee84 100644
--- a/include/io/task.h
+++ b/include/io/task.h
@@ -149,7 +149,7 @@ typedef void (*QIOTaskWorker)(QIOTask *task,
  * lookups) to be easily run non-blocking. Reporting the
  * results in the main thread context means that the caller
  * typically does not need to be concerned about thread
- * safety wrt the QEMU global mutex.
+ * safety wrt the BQL.
  *
  * For example, the socket_listen() method will block the caller
  * while DNS lookups take place if given a name, instead of IP
diff --git a/include/qemu/coroutine-core.h b/include/qemu/coroutine-core.h
index 230bb56517..503bad6e0e 100644
--- a/include/qemu/coroutine-core.h
+++ b/include/qemu/coroutine-core.h
@@ -22,7 +22,7 @@
  * rather than callbacks, for operations that need to give up control while
  * waiting for events to complete.
  *
- * These functions are re-entrant and may be used outside the global mutex.
+ * These functions are re-entrant and may be used outside the BQL.
  *
  * Functions that execute in coroutine context cannot be called
  * directly from normal functions.  Use @coroutine_fn to mark such
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index a65be6697f..e6aff45301 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -26,7 +26,7 @@
  * rather than callbacks, for operations that need to give up control while
  * waiting for events to complete.
  *
- * These functions are re-entrant and may be used outside the global mutex.
+ * These functions are re-entrant and may be used outside the BQL.
  *
  * Functions that execute in coroutine context cannot be called
  * directly from normal functions.  Use @coroutine_fn to mark such
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index f83bb0f116..eafc573407 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -47,7 +47,7 @@ void virtio_blk_data_plane_notify(VirtIOBlockDataPlane *s, VirtQueue *vq)
     virtio_notify_irqfd(s->vdev, vq);
 }
 
-/* Context: QEMU global mutex held */
+/* Context: BQL held */
 bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
                                   VirtIOBlockDataPlane **dataplane,
                                   Error **errp)
@@ -100,7 +100,7 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
     return true;
 }
 
-/* Context: QEMU global mutex held */
+/* Context: BQL held */
 void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
 {
     VirtIOBlock *vblk;
@@ -117,7 +117,7 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
     g_free(s);
 }
 
-/* Context: QEMU global mutex held */
+/* Context: BQL held */
 int virtio_blk_data_plane_start(VirtIODevice *vdev)
 {
     VirtIOBlock *vblk = VIRTIO_BLK(vdev);
@@ -261,7 +261,7 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
     }
 }
 
-/* Context: QEMU global mutex held */
+/* Context: BQL held */
 void virtio_blk_data_plane_stop(VirtIODevice *vdev)
 {
     VirtIOBlock *vblk = VIRTIO_BLK(vdev);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index a1f8e15522..2a5f6544cc 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1500,7 +1500,7 @@ static void virtio_blk_resize(void *opaque)
     VirtIODevice *vdev = VIRTIO_DEVICE(opaque);
 
     /*
-     * virtio_notify_config() needs to acquire the global mutex,
+     * virtio_notify_config() needs to acquire the BQL,
      * so it can't be called from an iothread. Instead, schedule
      * it to be run in the main context BH.
      */
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 1e684beebe..56ecc5b12e 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -20,7 +20,7 @@
 #include "scsi/constants.h"
 #include "hw/virtio/virtio-bus.h"
 
-/* Context: QEMU global mutex held */
+/* Context: BQL held */
 void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp)
 {
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
@@ -93,7 +93,7 @@ static void virtio_scsi_dataplane_stop_bh(void *opaque)
     }
 }
 
-/* Context: QEMU global mutex held */
+/* Context: BQL held */
 int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 {
     int i;
@@ -191,7 +191,7 @@ fail_guest_notifiers:
     return -ENOSYS;
 }
 
-/* Context: QEMU global mutex held */
+/* Context: BQL held */
 void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
diff --git a/net/tap.c b/net/tap.c
index c23d0323c2..c698b70475 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -219,7 +219,7 @@ static void tap_send(void *opaque)
 
         /*
          * When the host keeps receiving more packets while tap_send() is
-         * running we can hog the QEMU global mutex.  Limit the number of
+         * running we can hog the BQL.  Limit the number of
          * packets that are processed per tap_send() callback to prevent
          * stalling the guest.
          */
-- 
2.43.0


