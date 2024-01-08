Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57EC827568
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663616.1033675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsdY-0004lP-H3; Mon, 08 Jan 2024 16:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663616.1033675; Mon, 08 Jan 2024 16:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsdY-0004gn-87; Mon, 08 Jan 2024 16:38:04 +0000
Received: by outflank-mailman (input) for mailman id 663616;
 Mon, 08 Jan 2024 16:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EZ8K=IS=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rMsdW-0003cg-A3
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:38:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48b72a14-ae44-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 17:38:00 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452-Z5Yk12GVOpSLz6gobTghhg-1; Mon,
 08 Jan 2024 11:37:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 207E43813BC5;
 Mon,  8 Jan 2024 16:37:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEE9540C6EB9;
 Mon,  8 Jan 2024 16:37:49 +0000 (UTC)
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
X-Inumbo-ID: 48b72a14-ae44-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704731879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+ze6ScecUWqpBL1ym3zeCBrNvLJSj4Of46u1qqP/x4=;
	b=T8qAz35+zfJSbkaJ7GfmpEvhefFJGuAtrDBQgjpiMyypjAWEv8m+p0dpF19DSm9KTDa2xl
	s39IaZQNceZAFMWpLJSAEiulsjC9A/685q7jgzn5UkHvTdY66TZ4Xxf6Dg0koJJ3PsZ+0/
	G/m8PsFz0nLZjD592miwCw1hNph24Ls=
X-MC-Unique: Z5Yk12GVOpSLz6gobTghhg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	qemu-block@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	kvm@vger.kernel.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jiri Slaby <jslaby@suse.cz>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Paul Durrant <paul@xen.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Kevin Wolf <kwolf@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-ppc@nongnu.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Song Gao <gaosong@loongson.cn>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexander Graf <agraf@csgraf.de>,
	Markus Armbruster <armbru@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Michael Roth <michael.roth@amd.com>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Cameron Esfahani <dirty@apple.com>,
	Eric Farman <farman@linux.ibm.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Fabiano Rosas <farosas@suse.de>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PULL 4/6] qemu/main-loop: rename qemu_cond_wait_iothread() to qemu_cond_wait_bql()
Date: Mon,  8 Jan 2024 11:37:33 -0500
Message-ID: <20240108163735.254732-5-stefanha@redhat.com>
In-Reply-To: <20240108163735.254732-1-stefanha@redhat.com>
References: <20240108163735.254732-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
instead, it is already widely used and unambiguous.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-id: 20240102153529.486531-4-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
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
index bae1c2a803..f8a675eb30 100644
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
index 1ede629f1f..68d161d96b 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -533,12 +533,12 @@ void bql_unlock(void)
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


