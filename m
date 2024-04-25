Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B728B279F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 19:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712193.1112674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s02xP-0004bI-Bv; Thu, 25 Apr 2024 17:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712193.1112674; Thu, 25 Apr 2024 17:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s02xP-0004Tr-83; Thu, 25 Apr 2024 17:32:27 +0000
Received: by outflank-mailman (input) for mailman id 712193;
 Thu, 25 Apr 2024 17:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIz1=L6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s02xO-0004RI-6p
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 17:32:26 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6764d40-0329-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 19:32:23 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a51addddbd4so152438266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 10:32:23 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ci8-20020a170906c34800b00a587356c04csm4006477ejb.187.2024.04.25.10.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 10:32:21 -0700 (PDT)
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
X-Inumbo-ID: c6764d40-0329-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714066342; x=1714671142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g8t/wF4ZdxY0SPfZVITk0ux9PxKIO0edydKGkf+TxQ=;
        b=p37RIUPxST9+PS4/0UfaQtG/qcLTtnHzqCC5vk3vplFXJmF+9p/tTlT7PPdUwYrJIK
         ajp65vtpsQZd//AtSqYo1RXj08/4ND+AIrJo2oIDAKxMsuKluGQS6ZDAMDHmc1Vp5+gX
         RVGpP7qPCc7iam+5xwcPoowAUUYIbMhekr7F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714066342; x=1714671142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2g8t/wF4ZdxY0SPfZVITk0ux9PxKIO0edydKGkf+TxQ=;
        b=v35yIh0JrFloSTrvRBZCABGEQQ//nwjLPJ1aZXIAXWFcCReF/yOeGV5cgBpYS7d0up
         PvlrpZfoIWMwFzNkWmCCwwoY4ba6bC5f5w99LwHd5ojiwFdStWlByyPlLNcaoE9BUzX0
         T5tfqGqFNZ2pvVvZsiwtcLiPUi8y/LsPt4kvG0tfO8TDy6rzI8302LEazgpQvGppIPim
         GKhrWZK4VQFZjNLoegQ3VCeInUDENLmfbLIANM0SoOoHmYLkMK7WLPMBkLT+TN7Wd6MF
         CxJMp8m6nlPGLSbTk2zPBCz0xNc6ALu2d4dg2CxzPkO+8D1t9MVoGQKSpuIlg/ZxqnzZ
         UnSQ==
X-Gm-Message-State: AOJu0YxW3vcznBVzLtlP9L4AOCHrsLPznmwUrBgAehHl8jyaxXvMgqnl
	D1dpTBqW1ogl6bqh+PNBQQbTag+vHXWiNJqI/tuL1ALsmK6qDrI8rx+3lQgAUncXJm5mWk9h8GX
	b
X-Google-Smtp-Source: AGHT+IHVB43cnp+cLbbkrKERJDS2FM3sZyAzoNUN0K7eSLYTJeoTcaQ6iPtkWtSf/QdM6L/5szTjDg==
X-Received: by 2002:a17:906:e285:b0:a58:be32:b247 with SMTP id gg5-20020a170906e28500b00a58be32b247mr294683ejb.35.1714066341986;
        Thu, 25 Apr 2024 10:32:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
Date: Thu, 25 Apr 2024 18:32:15 +0100
Message-Id: <20240425173216.410940-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240425173216.410940-1-andrew.cooper3@citrix.com>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libsystemd is a giant dependency for one single function, but in the wake of
the xz backdoor, it turns out that even systemd leadership recommend against
linking against libsystemd for sd_notify().

Since commit 7b61011e1450 ("tools: make xenstore domain easy configurable") in
Xen 4.8, the launch-xenstore script invokes systemd-notify directly, so its
not even necessary for the xenstored's to call sd_notify() themselves.

Therefore, just drop the calls to sd_notify() and stop linking against
libsystemd.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/ocaml/xenstored/Makefile        | 12 +------
 tools/ocaml/xenstored/systemd.ml      | 15 ---------
 tools/ocaml/xenstored/systemd.mli     | 16 ---------
 tools/ocaml/xenstored/systemd_stubs.c | 47 ---------------------------
 tools/ocaml/xenstored/xenstored.ml    |  1 -
 tools/xenstored/Makefile              |  5 ---
 tools/xenstored/posix.c               |  9 -----
 7 files changed, 1 insertion(+), 104 deletions(-)
 delete mode 100644 tools/ocaml/xenstored/systemd.ml
 delete mode 100644 tools/ocaml/xenstored/systemd.mli
 delete mode 100644 tools/ocaml/xenstored/systemd_stubs.c

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index e8aaecf2e630..1e4b51cc5432 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -4,8 +4,6 @@ include $(OCAML_TOPLEVEL)/common.make
 
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
-CFLAGS-$(CONFIG_SYSTEMD)  += $(SYSTEMD_CFLAGS)
-LDFLAGS-$(CONFIG_SYSTEMD) += $(SYSTEMD_LIBS)
 
 CFLAGS  += $(CFLAGS-y)
 CFLAGS  += $(APPEND_CFLAGS)
@@ -25,13 +23,6 @@ poll_OBJS = poll
 poll_C_OBJS = select_stubs
 OCAML_LIBRARY = syslog poll
 
-LIBS += systemd.cma systemd.cmxa
-systemd_OBJS = systemd
-systemd_C_OBJS = systemd_stubs
-OCAML_LIBRARY += systemd
-
-LIBS_systemd += $(LDFLAGS-y)
-
 OBJS = paths \
 	define \
 	stdext \
@@ -56,12 +47,11 @@ OBJS = paths \
 	process \
 	xenstored
 
-INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
+INTF = symbol.cmi trie.cmi syslog.cmi poll.cmi
 
 XENSTOREDLIBS = \
 	unix.cmxa \
 	-ccopt -L -ccopt . syslog.cmxa \
-	-ccopt -L -ccopt . systemd.cmxa \
 	-ccopt -L -ccopt . poll.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
diff --git a/tools/ocaml/xenstored/systemd.ml b/tools/ocaml/xenstored/systemd.ml
deleted file mode 100644
index 39127f712d72..000000000000
--- a/tools/ocaml/xenstored/systemd.ml
+++ /dev/null
@@ -1,15 +0,0 @@
-(*
- * Copyright (C) 2014 Luis R. Rodriguez <mcgrof@suse.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
- *)
-
-external sd_notify_ready: unit -> unit = "ocaml_sd_notify_ready"
diff --git a/tools/ocaml/xenstored/systemd.mli b/tools/ocaml/xenstored/systemd.mli
deleted file mode 100644
index 18b9331031f9..000000000000
--- a/tools/ocaml/xenstored/systemd.mli
+++ /dev/null
@@ -1,16 +0,0 @@
-(*
- * Copyright (C) 2014 Luis R. Rodriguez <mcgrof@suse.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
- *)
-
-(** Tells systemd we're ready *)
-external sd_notify_ready: unit -> unit = "ocaml_sd_notify_ready"
diff --git a/tools/ocaml/xenstored/systemd_stubs.c b/tools/ocaml/xenstored/systemd_stubs.c
deleted file mode 100644
index f4c875075abe..000000000000
--- a/tools/ocaml/xenstored/systemd_stubs.c
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- * Copyright (C) 2014 Luis R. Rodriguez <mcgrof@suse.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
- */
-
-#include <string.h>
-#include <stdio.h>
-#include <stdbool.h>
-#include <errno.h>
-#include <caml/mlvalues.h>
-#include <caml/memory.h>
-#include <caml/alloc.h>
-#include <caml/custom.h>
-#include <caml/signals.h>
-#include <caml/fail.h>
-
-#if defined(HAVE_SYSTEMD)
-
-#include <systemd/sd-daemon.h>
-
-CAMLprim value ocaml_sd_notify_ready(value ignore)
-{
-	CAMLparam1(ignore);
-
-	sd_notify(1, "READY=1");
-
-	CAMLreturn(Val_unit);
-}
-
-#else
-
-CAMLprim value ocaml_sd_notify_ready(value ignore)
-{
-	CAMLparam1(ignore);
-
-	CAMLreturn(Val_unit);
-}
-#endif
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 1aaa3e995e1f..6bcd6d11da55 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -621,7 +621,6 @@ let () =
     process_domains store cons domains
   in
 
-  Systemd.sd_notify_ready ();
   let live_update = ref false in
   while not (!quit && Connections.prevents_quit cons = [])
   do
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
index d88c82d972d7..dc4ed8db591f 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -26,9 +26,6 @@
 #include <sys/mman.h>
 #include <sys/socket.h>
 #include <sys/un.h>
-#if defined(HAVE_SYSTEMD)
-#include <systemd/sd-daemon.h>
-#endif
 #include <xen-tools/xenstore-common.h>
 
 #include "utils.h"
@@ -390,12 +387,6 @@ void handle_special_fds(void)
 
 void late_init(bool live_update)
 {
-#if defined(HAVE_SYSTEMD)
-	if (!live_update) {
-		sd_notify(1, "READY=1");
-		fprintf(stderr, SD_NOTICE "xenstored is ready\n");
-	}
-#endif
 }
 
 int get_socket_fd(void)
-- 
2.30.2


