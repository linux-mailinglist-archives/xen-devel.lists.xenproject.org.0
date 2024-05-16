Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BA8C7CC5
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 20:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723571.1128535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIv-0005Ur-Pz; Thu, 16 May 2024 18:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723571.1128535; Thu, 16 May 2024 18:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIv-0005TN-NC; Thu, 16 May 2024 18:58:13 +0000
Received: by outflank-mailman (input) for mailman id 723571;
 Thu, 16 May 2024 18:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7gIt-00050W-NV
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 18:58:11 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d0a2313-13b6-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 20:58:10 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-574f7c0bab4so4099333a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 11:58:10 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d9dsm1003072566b.132.2024.05.16.11.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 11:58:08 -0700 (PDT)
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
X-Inumbo-ID: 3d0a2313-13b6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715885889; x=1716490689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqlRzkVHjotj0GkagN3hJ6XGCuDGrgNSXxfSAPXzj6I=;
        b=P38v09faVcPoIOXU4vjcHZkYpHsmilKZQQWhP2jnhW6NnDNMlke1R38WIg/DTowNfe
         WdRyVnFZF1I4l6tS9LreT0kIPeybnRiWrQpHha96bbcB/yJ3+n6d40xLqH4jlZdc4OdV
         ZgQ1+GumqmOUpc5wm7aNdDfchUpxT0LIDNPsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715885889; x=1716490689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqlRzkVHjotj0GkagN3hJ6XGCuDGrgNSXxfSAPXzj6I=;
        b=cWbdrIiYqpFNR7kRlwErU4me4t3D3zbEzvdwmWAsYPMSTL7AmPE4gzl0lAdMFnnh3c
         nUyw4QDM9TV7vSuUh09aoj5uaYCwLHyWKKmDxbelRhYUDAJjsbzvNcIIiHJq5IVrAjQF
         v4QD+FZT+aCHgID86NsU9TZ8FqS7C1xim0ukV5i3QHBizRvjJITtFAMeqaLk1FAkpmYE
         4w4noqs76Uy8tt7krInS5kE0HVVCGnlkb4jkXvUihoFfjiioa7bCWgdeRdRVNKFiO62O
         1SnJ1zfpDnjt3RnCq5XkwxovgSkCdDpPiUZBinx1FeXNk5L75lStD7UJ9mEW1zmCnwcM
         XPgg==
X-Gm-Message-State: AOJu0YytiHqm6h3IaY+CK2mbtzKPTAFN42ZstOTCq239KyCoef62dBc2
	KoL8YFoy4I1ouSuu4L7UqONxrvRZC4JpfNiYRET3zEW/EUfLMN3qD4Guuu5i9QgADILzDX+2MF7
	Z
X-Google-Smtp-Source: AGHT+IEyWF6HXBnqO7J1kvSEwSr9tmQ4oJzGkpMwGHxblxwyZ36RhocSFZ8BIEIScVc6p5idf5CITQ==
X-Received: by 2002:a17:906:da8d:b0:a5a:7a1:5da3 with SMTP id a640c23a62f3a-a5a2d09e4b4mr1964968566b.0.1715885889559;
        Thu, 16 May 2024 11:58:09 -0700 (PDT)
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
Subject: [PATCH v2 2/4] tools: Import standalone sd_notify() implementation from systemd
Date: Thu, 16 May 2024 19:58:02 +0100
Message-Id: <20240516185804.3309725-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in order to avoid linking against the whole of libsystemd.

Only minimal changes to the upstream copy, to function as a drop-in
replacement for sd_notify() and as a header-only library.

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
 * New
---
 tools/include/xen-sd-notify.h | 98 +++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 tools/include/xen-sd-notify.h

diff --git a/tools/include/xen-sd-notify.h b/tools/include/xen-sd-notify.h
new file mode 100644
index 000000000000..eda9d8b22d9e
--- /dev/null
+++ b/tools/include/xen-sd-notify.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: MIT-0 */
+
+/*
+ * Implement the systemd notify protocol without external dependencies.
+ * Supports both readiness notification on startup and on reloading,
+ * according to the protocol defined at:
+ * https://www.freedesktop.org/software/systemd/man/latest/sd_notify.html
+ * This protocol is guaranteed to be stable as per:
+ * https://systemd.io/PORTABILITY_AND_STABILITY/
+ *
+ * Differences from the upstream copy:
+ * - Rename/rework as a drop-in replacement for systemd/sd-daemon.h
+ * - Only take the subset Xen cares about
+ * - Respect -Wdeclaration-after-statement
+ */
+
+#ifndef XEN_SD_NOTIFY
+#define XEN_SD_NOTIFY
+
+#include <errno.h>
+#include <stddef.h>
+#include <stdlib.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <unistd.h>
+
+static inline void xen_sd_closep(int *fd) {
+  if (!fd || *fd < 0)
+    return;
+
+  close(*fd);
+  *fd = -1;
+}
+
+static inline int xen_sd_notify(const char *message) {
+  union sockaddr_union {
+    struct sockaddr sa;
+    struct sockaddr_un sun;
+  } socket_addr = {
+    .sun.sun_family = AF_UNIX,
+  };
+  size_t path_length, message_length;
+  ssize_t written;
+  const char *socket_path;
+  int __attribute__((cleanup(sd_closep))) fd = -1;
+
+  /* Verify the argument first */
+  if (!message)
+    return -EINVAL;
+
+  message_length = strlen(message);
+  if (message_length == 0)
+    return -EINVAL;
+
+  /* If the variable is not set, the protocol is a noop */
+  socket_path = getenv("NOTIFY_SOCKET");
+  if (!socket_path)
+    return 0; /* Not set? Nothing to do */
+
+  /* Only AF_UNIX is supported, with path or abstract sockets */
+  if (socket_path[0] != '/' && socket_path[0] != '@')
+    return -EAFNOSUPPORT;
+
+  path_length = strlen(socket_path);
+  /* Ensure there is room for NUL byte */
+  if (path_length >= sizeof(socket_addr.sun.sun_path))
+    return -E2BIG;
+
+  memcpy(socket_addr.sun.sun_path, socket_path, path_length);
+
+  /* Support for abstract socket */
+  if (socket_addr.sun.sun_path[0] == '@')
+    socket_addr.sun.sun_path[0] = 0;
+
+  fd = socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0);
+  if (fd < 0)
+    return -errno;
+
+  if (connect(fd, &socket_addr.sa, offsetof(struct sockaddr_un, sun_path) + path_length) != 0)
+    return -errno;
+
+  written = write(fd, message, message_length);
+  if (written != (ssize_t) message_length)
+    return written < 0 ? -errno : -EPROTO;
+
+  return 1; /* Notified! */
+}
+
+static inline int sd_notify(int unset_environment, const char *message) {
+    int r = xen_sd_notify(message);
+
+    if (unset_environment)
+        unsetenv("NOTIFY_SOCKET");
+
+    return r;
+}
+
+#endif /* XEN_SD_NOTIFY */
-- 
2.30.2


