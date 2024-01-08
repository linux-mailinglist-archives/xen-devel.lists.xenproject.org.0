Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24B827562
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663613.1033649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsdK-0003va-5l; Mon, 08 Jan 2024 16:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663613.1033649; Mon, 08 Jan 2024 16:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsdK-0003tt-2U; Mon, 08 Jan 2024 16:37:50 +0000
Received: by outflank-mailman (input) for mailman id 663613;
 Mon, 08 Jan 2024 16:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EZ8K=IS=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rMsdJ-0003cg-Bw
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:37:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4119f31c-ae44-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 17:37:47 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-xwrQBWUfPzqlTw3k0NIoCA-1; Mon,
 08 Jan 2024 11:37:43 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 514A83C025AC;
 Mon,  8 Jan 2024 16:37:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14E8B2026F95;
 Mon,  8 Jan 2024 16:37:40 +0000 (UTC)
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
X-Inumbo-ID: 4119f31c-ae44-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704731866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JyAVituzHKzz/zXpAv4OyXDfgV7BDAfn1K6NqR7fpw=;
	b=gR0J0DJ3wPfFEWY18k72JlBsyAW9W0Sn6sjEIU2DeT69HKIPSPHvWhuR6y3kyVmYgelE4c
	FE7v79Wg/mcHqRKhqOa6H2+tZQ0zBg3bQ7+K7gIfywxulLTEE1caVjB3Qdm2OORBjmPzmg
	HS3y8rS1fs4BvYW1WwhObKD8/ynLK8M=
X-MC-Unique: xwrQBWUfPzqlTw3k0NIoCA-1
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
Subject: [PULL 1/6] iothread: Remove unused Error** argument in aio_context_set_aio_params
Date: Mon,  8 Jan 2024 11:37:30 -0500
Message-ID: <20240108163735.254732-2-stefanha@redhat.com>
In-Reply-To: <20240108163735.254732-1-stefanha@redhat.com>
References: <20240108163735.254732-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

From: Philippe Mathieu-Daudé <philmd@linaro.org>

aio_context_set_aio_params() doesn't use its undocumented
Error** argument. Remove it to simplify.

Note this removes a use of "unchecked Error**" in
iothread_set_aio_context_params().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20231120171806.19361-1-philmd@linaro.org>
---
 include/block/aio.h | 3 +--
 iothread.c          | 3 +--
 util/aio-posix.c    | 3 +--
 util/aio-win32.c    | 3 +--
 util/main-loop.c    | 5 +----
 5 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index af05512a7d..c802a392e5 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -699,8 +699,7 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
  * @max_batch: maximum number of requests in a batch, 0 means that the
  *             engine will use its default
  */
-void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
-                                Error **errp);
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch);
 
 /**
  * aio_context_set_thread_pool_params:
diff --git a/iothread.c b/iothread.c
index b753286414..6c1fc8c856 100644
--- a/iothread.c
+++ b/iothread.c
@@ -170,8 +170,7 @@ static void iothread_set_aio_context_params(EventLoopBase *base, Error **errp)
     }
 
     aio_context_set_aio_params(iothread->ctx,
-                               iothread->parent_obj.aio_max_batch,
-                               errp);
+                               iothread->parent_obj.aio_max_batch);
 
     aio_context_set_thread_pool_params(iothread->ctx, base->thread_pool_min,
                                        base->thread_pool_max, errp);
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 7f2c99729d..266c9dd35f 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -777,8 +777,7 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
     aio_notify(ctx);
 }
 
-void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
-                                Error **errp)
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch)
 {
     /*
      * No thread synchronization here, it doesn't matter if an incorrect value
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 948ef47a4d..d144f9391f 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -438,7 +438,6 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
     }
 }
 
-void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
-                                Error **errp)
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch)
 {
 }
diff --git a/util/main-loop.c b/util/main-loop.c
index 797b640c41..63b4cda84a 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -192,10 +192,7 @@ static void main_loop_update_params(EventLoopBase *base, Error **errp)
         return;
     }
 
-    aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch, errp);
-    if (*errp) {
-        return;
-    }
+    aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch);
 
     aio_context_set_thread_pool_params(qemu_aio_context, base->thread_pool_min,
                                        base->thread_pool_max, errp);
-- 
2.43.0


