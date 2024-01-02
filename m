Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B76821ED2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 16:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660742.1030339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgo4-0008MV-Ai; Tue, 02 Jan 2024 15:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660742.1030339; Tue, 02 Jan 2024 15:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgo4-0008JP-3W; Tue, 02 Jan 2024 15:35:52 +0000
Received: by outflank-mailman (input) for mailman id 660742;
 Tue, 02 Jan 2024 15:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JX1x=IM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rKgo1-0007fS-UV
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 15:35:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a362117-a984-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 16:35:49 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-1PB8t8t1Oum-Zc_LQMCeiA-1; Tue, 02 Jan 2024 10:35:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48BBC1019DE2;
 Tue,  2 Jan 2024 15:35:41 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0B151C060AF;
 Tue,  2 Jan 2024 15:35:39 +0000 (UTC)
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
X-Inumbo-ID: 9a362117-a984-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704209748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwajIiXGKStV/z0IMsU+Fr0XyTy0YZLrRynkJ5gSOmo=;
	b=ERMBnmfTM7XPAGNNV5Aeguj58lOnhz1oyFAwarZAdO6EC79ubZki2C956JXpF9aVd0vRWI
	3JegJVkLhO55S6wP8zLlirefROnImI8d3KWNG7W8RMRw2yoLf0RSHxhxI6guX/ZO8aYJC3
	RDGxhvMaRWULd/cbhRxBmBmVVSZZDgM=
X-MC-Unique: 1PB8t8t1Oum-Zc_LQMCeiA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	qemu-riscv@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Cameron Esfahani <dirty@apple.com>,
	Alexander Graf <agraf@csgraf.de>,
	David Hildenbrand <david@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Jiri Slaby <jslaby@suse.cz>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Eric Blake <eblake@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Michael Roth <michael.roth@amd.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Song Gao <gaosong@loongson.cn>,
	Kevin Wolf <kwolf@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-ppc@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bin Meng <bin.meng@windriver.com>,
	qemu-arm@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Farman <farman@linux.ibm.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 3/5] qemu/main-loop: rename qemu_cond_wait_iothread() to qemu_cond_wait_bql()
Date: Tue,  2 Jan 2024 10:35:27 -0500
Message-ID: <20240102153529.486531-4-stefanha@redhat.com>
In-Reply-To: <20240102153529.486531-1-stefanha@redhat.com>
References: <20240102153529.486531-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
instead, it is already widely used and unambiguous.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/main-loop.h          | 10 +++++-----
 accel/tcg/tcg-accel-ops-rr.c      |  4 ++--
 hw/display/virtio-gpu.c           |  2 +-
 hw/ppc/spapr_events.c             |  2 +-
 system/cpu-throttle.c             |  2 +-
 system/cpus.c                     |  4 ++--
 target/i386/nvmm/nvmm-accel-ops.c |  2 +-
 target/i386/whpx/whpx-accel-ops.c |  2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index c26ad2a029..5764db157c 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -371,17 +371,17 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(BQLLockAuto, bql_auto_unlock)
         = bql_auto_lock(__FILE__, __LINE__)
 
 /*
- * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
+ * qemu_cond_wait_bql: Wait on condition for the Big QEMU Lock (BQL)
  *
- * This function atomically releases the main loop mutex and causes
+ * This function atomically releases the Big QEMU Lock (BQL) and causes
  * the calling thread to block on the condition.
  */
-void qemu_cond_wait_iothread(QemuCond *cond);
+void qemu_cond_wait_bql(QemuCond *cond);
 
 /*
- * qemu_cond_timedwait_iothread: like the previous, but with timeout
+ * qemu_cond_timedwait_bql: like the previous, but with timeout
  */
-void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
+void qemu_cond_timedwait_bql(QemuCond *cond, int ms);
 
 /* internal interfaces */
 
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index c4ea372a3f..5794e5a9ce 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -111,7 +111,7 @@ static void rr_wait_io_event(void)
 
     while (all_cpu_threads_idle()) {
         rr_stop_kick_timer();
-        qemu_cond_wait_iothread(first_cpu->halt_cond);
+        qemu_cond_wait_bql(first_cpu->halt_cond);
     }
 
     rr_start_kick_timer();
@@ -198,7 +198,7 @@ static void *rr_cpu_thread_fn(void *arg)
 
     /* wait for initial kick-off after machine start */
     while (first_cpu->stopped) {
-        qemu_cond_wait_iothread(first_cpu->halt_cond);
+        qemu_cond_wait_bql(first_cpu->halt_cond);
 
         /* process any pending work */
         CPU_FOREACH(cpu) {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index b016d3bac8..67c5be1a4e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1512,7 +1512,7 @@ void virtio_gpu_reset(VirtIODevice *vdev)
         g->reset_finished = false;
         qemu_bh_schedule(g->reset_bh);
         while (!g->reset_finished) {
-            qemu_cond_wait_iothread(&g->reset_cond);
+            qemu_cond_wait_bql(&g->reset_cond);
         }
     } else {
         virtio_gpu_reset_bh(g);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index deb4641505..cb0eeee587 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -899,7 +899,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
             }
             return;
         }
-        qemu_cond_wait_iothread(&spapr->fwnmi_machine_check_interlock_cond);
+        qemu_cond_wait_bql(&spapr->fwnmi_machine_check_interlock_cond);
         if (spapr->fwnmi_machine_check_addr == -1) {
             /*
              * If the machine was reset while waiting for the interlock,
diff --git a/system/cpu-throttle.c b/system/cpu-throttle.c
index 786a9a5639..c951a6c65e 100644
--- a/system/cpu-throttle.c
+++ b/system/cpu-throttle.c
@@ -54,7 +54,7 @@ static void cpu_throttle_thread(CPUState *cpu, run_on_cpu_data opaque)
     endtime_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + sleeptime_ns;
     while (sleeptime_ns > 0 && !cpu->stop) {
         if (sleeptime_ns > SCALE_MS) {
-            qemu_cond_timedwait_iothread(cpu->halt_cond,
+            qemu_cond_timedwait_bql(cpu->halt_cond,
                                          sleeptime_ns / SCALE_MS);
         } else {
             bql_unlock();
diff --git a/system/cpus.c b/system/cpus.c
index 9b68dc9c7c..c8e2772b5f 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -514,12 +514,12 @@ void bql_unlock(void)
     qemu_mutex_unlock(&bql);
 }
 
-void qemu_cond_wait_iothread(QemuCond *cond)
+void qemu_cond_wait_bql(QemuCond *cond)
 {
     qemu_cond_wait(cond, &bql);
 }
 
-void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
+void qemu_cond_timedwait_bql(QemuCond *cond, int ms)
 {
     qemu_cond_timedwait(cond, &bql, ms);
 }
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f9d5e9a37a..6b2bfd9b9c 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -48,7 +48,7 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)
             }
         }
         while (cpu_thread_is_idle(cpu)) {
-            qemu_cond_wait_iothread(cpu->halt_cond);
+            qemu_cond_wait_bql(cpu->halt_cond);
         }
         qemu_wait_io_event_common(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index e783a760a7..189ae0f140 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -48,7 +48,7 @@ static void *whpx_cpu_thread_fn(void *arg)
             }
         }
         while (cpu_thread_is_idle(cpu)) {
-            qemu_cond_wait_iothread(cpu->halt_cond);
+            qemu_cond_wait_bql(cpu->halt_cond);
         }
         qemu_wait_io_event_common(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
-- 
2.43.0


