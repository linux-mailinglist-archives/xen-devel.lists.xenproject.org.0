Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E151030A687
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79777.145349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOq-000327-BL; Mon, 01 Feb 2021 11:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79777.145349; Mon, 01 Feb 2021 11:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOq-00031N-6e; Mon, 01 Feb 2021 11:29:44 +0000
Received: by outflank-mailman (input) for mailman id 79777;
 Mon, 01 Feb 2021 11:29:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XOp-00030d-41
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:43 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf559e46-822b-4443-b85f-65951a19a348;
 Mon, 01 Feb 2021 11:29:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g10so16186473wrx.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:42 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id o12sm26789769wrx.82.2021.02.01.03.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:40 -0800 (PST)
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
X-Inumbo-ID: cf559e46-822b-4443-b85f-65951a19a348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XRtUPL4N+Vif4bfdhtAFgCO/ETkuGGWOvk7Qu3281fs=;
        b=otz4MVF8iuJeP0O61dnQoLLdWj7yRHoLIPiCQts39X7Iz45omjLW6B5RPKA0Ji8grr
         TaSCvFwiR5a4nyf8A49BwsSX6wD8hGldzi9ObmoQMYTN4EcsB6LLt+JE4crwXoA/Qwkd
         +v/aCY2PpUQZdG6YBQvHtLAhEhdzr6vGVZBvJFEd3QWL7lxOeg367jIC8KtdxkJkEIGa
         bxhcoJZxJVW9PcUVwMCed91ItAi23w2JLJqvnxc4jq/89yFFL+RirWl9fRoTqM/UfJIp
         olTqK+WR7XOw/vm5aC5mEmtouWIpsAPYBPUMZAEJgGJKcfDsc2qwHnZvE6Gp86q3FH26
         Ljzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=XRtUPL4N+Vif4bfdhtAFgCO/ETkuGGWOvk7Qu3281fs=;
        b=f3NklxOpMCibNI3WyZCDCWAOxEekFK/X383VHluCRRPfWhK5uswKsmqg7H7ieWFB0L
         rDDOM5wTI26AlQ5bPPmADv2Cuv7WMoPVF0P+2xUf9DAWg2Pbe3IP7upOPkE9S2rzCqqp
         k6j3ywkTLY59Ev7TYekQiXPM2W9iep7H0iJDOEF9WlA7u9xr+o1ecxyaPWNdyHrKzELa
         5nzSDo4I5zUOUYrvVvNFmLze+rsMUS8IofGg8rAyezEga+dyaxJq8UZdXZlAgVjwFMoM
         A7KDpIBWrT6tnrI55CvH9wDKCDbaIp1JrNH7aaGEPE/TRwhVA1rTk2HvVCBgaLYwO46r
         igHw==
X-Gm-Message-State: AOAM531+GVm4HNVrPkEnTjZEbegEdDlbjlVVGScrZvniOsRTRwQvQ1HL
	uTX3b32X3TsZjnmle0It/ok=
X-Google-Smtp-Source: ABdhPJyOAdkL8yCg3T/QnJEGkqZccdLOHBM22xLPE323hR3HQAe/aPubKmDcduC4ijItMwsDSxlZ+w==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr16884630wrw.170.1612178981514;
        Mon, 01 Feb 2021 03:29:41 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 6/7] hw/xen: Make qmp_xen_set_global_dirty_log() available out of X86 HVM
Date: Mon,  1 Feb 2021 12:29:04 +0100
Message-Id: <20210201112905.545144-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qmp_xen_set_global_dirty_log() is also used by XEN_PV.

This fixes when XEN_PV without XEN_FV:

  /usr/bin/ld: libqemuutil.a(meson-generated_.._qapi_qapi-commands-migration.c.o): in function `qmp_marshal_xen_set_global_dirty_log':
  qapi/qapi-commands-migration.c:626: undefined reference to `qmp_xen_set_global_dirty_log'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/xen/xen-hvm.c  | 10 ----------
 hw/xen/xen-migration.c | 22 ++++++++++++++++++++++
 hw/xen/meson.build     |  1 +
 3 files changed, 23 insertions(+), 10 deletions(-)
 create mode 100644 hw/xen/xen-migration.c

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 69196754a30..85859ea0ba3 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -24,7 +24,6 @@
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-x86.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-migration.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
@@ -1591,12 +1590,3 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
         }
     }
 }
-
-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
-{
-    if (enable) {
-        memory_global_dirty_log_start();
-    } else {
-        memory_global_dirty_log_stop();
-    }
-}
diff --git a/hw/xen/xen-migration.c b/hw/xen/xen-migration.c
new file mode 100644
index 00000000000..1c53f1af08d
--- /dev/null
+++ b/hw/xen/xen-migration.c
@@ -0,0 +1,22 @@
+/*
+ * Copyright (C) 2010       Citrix Ltd.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/memory.h"
+#include "qapi/qapi-commands-migration.h"
+
+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
+{
+    if (enable) {
+        memory_global_dirty_log_start();
+    } else {
+        memory_global_dirty_log_stop();
+    }
+}
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 6c836ae06e4..21f94625dc7 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -4,6 +4,7 @@
   'xen-bus.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
+  'xen-migration.c',
   'xen-utils.c',
 ))
 
-- 
2.26.2


