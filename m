Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716EF8C7CC1
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 20:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723572.1128541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIw-0005aX-5M; Thu, 16 May 2024 18:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723572.1128541; Thu, 16 May 2024 18:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIv-0005V3-Vd; Thu, 16 May 2024 18:58:13 +0000
Received: by outflank-mailman (input) for mailman id 723572;
 Thu, 16 May 2024 18:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7gIt-00057x-QT
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 18:58:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d75aad3-13b6-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 20:58:10 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso373774066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 11:58:10 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d9dsm1003072566b.132.2024.05.16.11.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 11:58:09 -0700 (PDT)
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
X-Inumbo-ID: 3d75aad3-13b6-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715885890; x=1716490690; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRpXVcdvZAYil4Irc1oaRVZc77Zx6hRkAA/T1NmAPk=;
        b=OqR99uHbYpRJqUdjk4Rv0b9dYEz4uiLCSlVq4J+V6HqrdtvZqz2vDTl2tXRj/n5ahi
         LRpLIVj9gTQowy/ubjFNov2eITWWCL+Aw2JyRslY+ibSLQRWAPK5G4jWzzP5Yg9P9ND4
         xcl8XC83tBdoPcwEgzRj+vG1PMH4J5DZvPkg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715885890; x=1716490690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRpXVcdvZAYil4Irc1oaRVZc77Zx6hRkAA/T1NmAPk=;
        b=PyE6MGkAQeBV0inKbQ/1qli6ZAhlCjZjNMdNElsius0a5dcQClD6APsZeGdC06ClEd
         J8I/T0Wm97dRWh4wIKAbkVWp41e64dvkX+CdrmjNX6Nr9BxMTTPOiu32Oj9dEOHpJeY1
         uMfwJ7c3Aq0GuFTOma7BwfVQnieL3v5CMbLLvsFUmLcgGHj8H0LX8Q10OgeKKfKTbFxZ
         nvv1XpCJZ5eXmq0yewtJ6tJPlL5kbQXo2/M2rvC42CwYLyyZpR6/Ykq/nj6liygpKilk
         CyFvcFhfV63fV2AZUJ1XcWRgYErcKdgdwsWBagDHEDIhkX4WlzaUqXYxrDqi9SN2hFLz
         vaIA==
X-Gm-Message-State: AOJu0YyY3notNXiM2y4ZVkj6h/ntWY3geq1MICF3ptQXv5IlxXn8JlG4
	U4totogfFUrnm+pxrR/WCYtRiedc+pGPdAuIcc7d3R7ZcTKAR8b2bpdG8voUScYJE3DQXoKecFB
	b
X-Google-Smtp-Source: AGHT+IHHDTG9ObchtcVV/jVsqnfEynMKD2ibsufesvRXQQvkctYIHq8TbMcia1ICMivvqlAwStUKYQ==
X-Received: by 2002:a17:906:ecb4:b0:a5a:2d30:b8c5 with SMTP id a640c23a62f3a-a5a2d5356f5mr1471090766b.16.1715885890249;
        Thu, 16 May 2024 11:58:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [PATCH v2 3/4] tools/{c,o}xenstored: Don't link against libsystemd
Date: Thu, 16 May 2024 19:58:03 +0100
Message-Id: <20240516185804.3309725-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the local freestanding wrapper instead.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>

v2:
 * Redo almost from scratch, using the freestanding wrapper instead.
---
 tools/ocaml/xenstored/Makefile        | 2 --
 tools/ocaml/xenstored/systemd_stubs.c | 2 +-
 tools/xenstored/Makefile              | 5 -----
 tools/xenstored/posix.c               | 4 ++--
 4 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index e8aaecf2e630..a8b8bb64698e 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -4,8 +4,6 @@ include $(OCAML_TOPLEVEL)/common.make
 
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
-CFLAGS-$(CONFIG_SYSTEMD)  += $(SYSTEMD_CFLAGS)
-LDFLAGS-$(CONFIG_SYSTEMD) += $(SYSTEMD_LIBS)
 
 CFLAGS  += $(CFLAGS-y)
 CFLAGS  += $(APPEND_CFLAGS)
diff --git a/tools/ocaml/xenstored/systemd_stubs.c b/tools/ocaml/xenstored/systemd_stubs.c
index f4c875075abe..7dbbdd35bf30 100644
--- a/tools/ocaml/xenstored/systemd_stubs.c
+++ b/tools/ocaml/xenstored/systemd_stubs.c
@@ -25,7 +25,7 @@
 
 #if defined(HAVE_SYSTEMD)
 
-#include <systemd/sd-daemon.h>
+#include <xen-sd-notify.h>
 
 CAMLprim value ocaml_sd_notify_ready(value ignore)
 {
diff --git a/tools/xenstored/Makefile b/tools/xenstored/Makefile
index e0897ed1ba30..09adfe1d5064 100644
--- a/tools/xenstored/Makefile
+++ b/tools/xenstored/Makefile
@@ -9,11 +9,6 @@ xenstored: LDLIBS += $(LDLIBS_libxenctrl)
 xenstored: LDLIBS += -lrt
 xenstored: LDLIBS += $(SOCKET_LIBS)
 
-ifeq ($(CONFIG_SYSTEMD),y)
-$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
-xenstored: LDLIBS += $(SYSTEMD_LIBS)
-endif
-
 TARGETS := xenstored
 
 .PHONY: all
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index d88c82d972d7..6037d739d013 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -27,7 +27,7 @@
 #include <sys/socket.h>
 #include <sys/un.h>
 #if defined(HAVE_SYSTEMD)
-#include <systemd/sd-daemon.h>
+#include <xen-sd-notify.h>
 #endif
 #include <xen-tools/xenstore-common.h>
 
@@ -393,7 +393,7 @@ void late_init(bool live_update)
 #if defined(HAVE_SYSTEMD)
 	if (!live_update) {
 		sd_notify(1, "READY=1");
-		fprintf(stderr, SD_NOTICE "xenstored is ready\n");
+		fprintf(stderr, "xenstored is ready\n");
 	}
 #endif
 }
-- 
2.30.2


