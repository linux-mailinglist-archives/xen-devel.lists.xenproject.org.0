Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6155484DD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347974.574305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNb-0004Rk-Nw; Mon, 13 Jun 2022 11:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347974.574305; Mon, 13 Jun 2022 11:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNb-0004I5-Hw; Mon, 13 Jun 2022 11:37:11 +0000
Received: by outflank-mailman (input) for mailman id 347974;
 Mon, 13 Jun 2022 11:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNZ-0003eY-5m
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26bc0433-eb0d-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 13:37:06 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-d-L92S3vMnanKezqCR8Mgg-1; Mon, 13 Jun 2022 07:37:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F65929AA3B9;
 Mon, 13 Jun 2022 11:37:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9D9404E4C3;
 Mon, 13 Jun 2022 11:37:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 031B8180091C; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
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
X-Inumbo-ID: 26bc0433-eb0d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qgE0u/psF+5HbFaMEFEBF+1+y1Gn5UXWEs7HICOeN3Q=;
	b=h+S36l/LCxfuEc3Y4TeKx8GaNlE/NcuWNEUhCygKkUvXQ5I3aYCIueI8GOWwh7WPCKO8ft
	04Tje2bRNd/fCvXfM/zocp0T7KQfZ+pvR9yPD+9rjK8QXfAH9OXZoO5Ma3HDd94ehI23A8
	3O871IA9ZCOfSsBcBN5J9TmDOT+s7wQ=
X-MC-Unique: d-L92S3vMnanKezqCR8Mgg-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Canokeys.org" <contact@canokeys.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 03/16] ui/cocoa: Fix poweroff request code
Date: Mon, 13 Jun 2022 13:36:42 +0200
Message-Id: <20220613113655.3693872-4-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220529082508.89097-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 09a62817f2a9..84c84e98fc5e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -35,6 +35,7 @@
 #include "ui/kbd-state.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/cpu-throttle.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block.h"
@@ -1290,7 +1291,10 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
 
-    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
+    with_iothread_lock(^{
+        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
+    });
 
     /*
      * Sleep here, because returning will cause OSX to kill us
-- 
2.36.1


