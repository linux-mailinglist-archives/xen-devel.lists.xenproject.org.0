Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4508A5461BB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346078.571823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzapR-0005ah-32; Fri, 10 Jun 2022 09:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346078.571823; Fri, 10 Jun 2022 09:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzapQ-0005Y0-V4; Fri, 10 Jun 2022 09:21:16 +0000
Received: by outflank-mailman (input) for mailman id 346078;
 Fri, 10 Jun 2022 09:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HR3=WR=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzapP-0005HE-NT
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:21:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abd153a6-e89e-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:21:14 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-7e0wnkN_M06CRWN5m6J7UQ-1; Fri, 10 Jun 2022 05:21:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C6438149A2;
 Fri, 10 Jun 2022 09:21:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F6E52026D64;
 Fri, 10 Jun 2022 09:21:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 08DD818003BA; Fri, 10 Jun 2022 11:20:44 +0200 (CEST)
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
X-Inumbo-ID: abd153a6-e89e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654852872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qgE0u/psF+5HbFaMEFEBF+1+y1Gn5UXWEs7HICOeN3Q=;
	b=Bzpi+YnN2GH1XcdOhcem911qfpf67Z0BoCv+aJl0L6atMbT614KQxxsSyYPc1XQCXo+U36
	TJyi0t50p5zDw5MLY0yCfhrIqUfPgGl6MNrYOajH01TeSdzzNkJ2xKpgyfJspLqHYRiQJx
	JV/6ZOL9jM/cDFxEETOzjBpb3VTeXUY=
X-MC-Unique: 7e0wnkN_M06CRWN5m6J7UQ-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	xen-devel@lists.xenproject.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 03/17] ui/cocoa: Fix poweroff request code
Date: Fri, 10 Jun 2022 11:20:29 +0200
Message-Id: <20220610092043.1874654-4-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4

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


