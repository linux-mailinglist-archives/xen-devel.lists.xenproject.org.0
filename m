Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB13650C57
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466037.724913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fmm-0007wK-Cs; Mon, 19 Dec 2022 13:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466037.724913; Mon, 19 Dec 2022 13:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fmm-0007sO-5T; Mon, 19 Dec 2022 13:02:28 +0000
Received: by outflank-mailman (input) for mailman id 466037;
 Mon, 19 Dec 2022 13:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fa7U=4R=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1p7Fmk-0006zl-BU
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:02:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c21414-7f9d-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 14:02:25 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-mFdMVFyuMJy-tJT1BG9NhQ-1; Mon, 19 Dec 2022 08:02:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B1F887434;
 Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6669D14171B6;
 Mon, 19 Dec 2022 13:02:08 +0000 (UTC)
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
X-Inumbo-ID: 61c21414-7f9d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzWaSBpVzZ+UszDBN2auCYULSVVrv+uDnPPKe4kNt7I=;
	b=LF3xbbJ/SkQ7bH01PgPdnHP9M+kcB68fjgvj+y+6Ot2oKczoGGybNN2paO+uDRZPr60Arr
	GJ1ACsuOpm51af8IR86aZ1SDdBeiOq2VadV2WYc12xuX1a6FapaSZsD4J7v8rbsdo0r/c9
	RN+fJVzLAg2LYBiLkYahp5z5cxWRzKo=
X-MC-Unique: mFdMVFyuMJy-tJT1BG9NhQ-1
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/6] tools/virtiofsd: add G_GNUC_PRINTF for logging functions
Date: Mon, 19 Dec 2022 08:02:02 -0500
Message-Id: <20221219130205.687815-4-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tools/virtiofsd/fuse_log.c       | 1 +
 tools/virtiofsd/fuse_log.h       | 6 ++++--
 tools/virtiofsd/passthrough_ll.c | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
index 745d88cd2a..2de3f48ee7 100644
--- a/tools/virtiofsd/fuse_log.c
+++ b/tools/virtiofsd/fuse_log.c
@@ -12,6 +12,7 @@
 #include "fuse_log.h"
 
 
+G_GNUC_PRINTF(2, 0)
 static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
                              const char *fmt, va_list ap)
 {
diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
index 8d7091bd4d..e5c2967ab9 100644
--- a/tools/virtiofsd/fuse_log.h
+++ b/tools/virtiofsd/fuse_log.h
@@ -45,7 +45,8 @@ enum fuse_log_level {
  * @param ap format string arguments
  */
 typedef void (*fuse_log_func_t)(enum fuse_log_level level, const char *fmt,
-                                va_list ap);
+                                va_list ap)
+    G_GNUC_PRINTF(2, 0);
 
 /**
  * Install a custom log handler function.
@@ -68,6 +69,7 @@ void fuse_set_log_func(fuse_log_func_t func);
  * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
  * @param fmt sprintf-style format string including newline
  */
-void fuse_log(enum fuse_log_level level, const char *fmt, ...);
+void fuse_log(enum fuse_log_level level, const char *fmt, ...)
+    G_GNUC_PRINTF(2, 3);
 
 #endif /* FUSE_LOG_H_ */
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 20f0f41f99..40ea2ed27f 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -4182,6 +4182,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
     }
 }
 
+G_GNUC_PRINTF(2, 0)
 static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
 {
     g_autofree char *localfmt = NULL;
-- 
2.38.1


