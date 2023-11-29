Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6AF7FE1D4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 22:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644250.1005079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8S56-0000rZ-KY; Wed, 29 Nov 2023 21:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644250.1005079; Wed, 29 Nov 2023 21:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8S56-0000op-Fi; Wed, 29 Nov 2023 21:26:52 +0000
Received: by outflank-mailman (input) for mailman id 644250;
 Wed, 29 Nov 2023 21:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7nN=HK=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8S55-00008d-C2
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 21:26:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01b267cf-8efe-11ee-98e4-6d05b1d4d9a1;
 Wed, 29 Nov 2023 22:26:50 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-yAhr-UrSN4qD-XoM_Pt1Aw-1; Wed,
 29 Nov 2023 16:26:46 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBD3F1E441DC;
 Wed, 29 Nov 2023 21:26:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C9BA2026D4C;
 Wed, 29 Nov 2023 21:26:42 +0000 (UTC)
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
X-Inumbo-ID: 01b267cf-8efe-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701293209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnTMhuYWY4rKexdgAFG5bYrl78FXKUVZK+idLclmJ2E=;
	b=BjnmLQapKIUOutu3xmOlymOKKbUvpgx9ZhlujCr6TU2hEpSjYTwkypttx+uYuTHijeIzSs
	IS/SgmCNzdNLTHiybQ0QmAdk4oo2+xjb2lWVJMumhX4FjANF8rz/gFXhf6adllizLye8Cw
	DZLhDCjhhdVRSlZPLR/8PLo9llYmlGE=
X-MC-Unique: yAhr-UrSN4qD-XoM_Pt1Aw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>,
	Alexander Graf <agraf@csgraf.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Eric Farman <farman@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Cameron Esfahani <dirty@apple.com>,
	xen-devel@lists.xenproject.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	John Snow <jsnow@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Michael Roth <michael.roth@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	kvm@vger.kernel.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/6] system/cpus: rename qemu_global_mutex to qemu_bql
Date: Wed, 29 Nov 2023 16:26:23 -0500
Message-ID: <20231129212625.1051502-5-stefanha@redhat.com>
In-Reply-To: <20231129212625.1051502-1-stefanha@redhat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

The APIs using qemu_global_mutex now follow the Big QEMU Lock (BQL)
nomenclature. It's a little strange that the actual QemuMutex variable
that embodies the BQL is called qemu_global_mutex instead of qemu_bql.
Rename it for consistency.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 system/cpus.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/system/cpus.c b/system/cpus.c
index eb24a4db8e..138720a540 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -65,7 +65,7 @@
 
 #endif /* CONFIG_LINUX */
 
-static QemuMutex qemu_global_mutex;
+static QemuMutex qemu_bql;
 
 /*
  * The chosen accelerator is supposed to register this.
@@ -389,14 +389,14 @@ void qemu_init_cpu_loop(void)
     qemu_init_sigbus();
     qemu_cond_init(&qemu_cpu_cond);
     qemu_cond_init(&qemu_pause_cond);
-    qemu_mutex_init(&qemu_global_mutex);
+    qemu_mutex_init(&qemu_bql);
 
     qemu_thread_get_self(&io_thread);
 }
 
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
-    do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
+    do_run_on_cpu(cpu, func, data, &qemu_bql);
 }
 
 static void qemu_cpu_stop(CPUState *cpu, bool exit)
@@ -428,7 +428,7 @@ void qemu_wait_io_event(CPUState *cpu)
             slept = true;
             qemu_plugin_vcpu_idle_cb(cpu);
         }
-        qemu_cond_wait(cpu->halt_cond, &qemu_global_mutex);
+        qemu_cond_wait(cpu->halt_cond, &qemu_bql);
     }
     if (slept) {
         qemu_plugin_vcpu_resume_cb(cpu);
@@ -502,7 +502,7 @@ void qemu_bql_lock_impl(const char *file, int line)
     QemuMutexLockFunc bql_lock = qatomic_read(&qemu_bql_mutex_lock_func);
 
     g_assert(!qemu_bql_locked());
-    bql_lock(&qemu_global_mutex, file, line);
+    bql_lock(&qemu_bql, file, line);
     set_bql_locked(true);
 }
 
@@ -510,17 +510,17 @@ void qemu_bql_unlock(void)
 {
     g_assert(qemu_bql_locked());
     set_bql_locked(false);
-    qemu_mutex_unlock(&qemu_global_mutex);
+    qemu_mutex_unlock(&qemu_bql);
 }
 
 void qemu_cond_wait_bql(QemuCond *cond)
 {
-    qemu_cond_wait(cond, &qemu_global_mutex);
+    qemu_cond_wait(cond, &qemu_bql);
 }
 
 void qemu_cond_timedwait_bql(QemuCond *cond, int ms)
 {
-    qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
+    qemu_cond_timedwait(cond, &qemu_bql, ms);
 }
 
 /* signal CPU creation */
@@ -571,7 +571,7 @@ void pause_all_vcpus(void)
     replay_mutex_unlock();
 
     while (!all_vcpus_paused()) {
-        qemu_cond_wait(&qemu_pause_cond, &qemu_global_mutex);
+        qemu_cond_wait(&qemu_pause_cond, &qemu_bql);
         CPU_FOREACH(cpu) {
             qemu_cpu_kick(cpu);
         }
@@ -649,7 +649,7 @@ void qemu_init_vcpu(CPUState *cpu)
     cpus_accel->create_vcpu_thread(cpu);
 
     while (!cpu->created) {
-        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
+        qemu_cond_wait(&qemu_cpu_cond, &qemu_bql);
     }
 }
 
-- 
2.42.0


