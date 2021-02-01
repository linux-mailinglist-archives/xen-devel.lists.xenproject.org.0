Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366830A686
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79776.145337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOm-0002xG-0d; Mon, 01 Feb 2021 11:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79776.145337; Mon, 01 Feb 2021 11:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOl-0002wZ-SK; Mon, 01 Feb 2021 11:29:39 +0000
Received: by outflank-mailman (input) for mailman id 79776;
 Mon, 01 Feb 2021 11:29:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XOj-0002vK-R1
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:37 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37583e1b-ab6b-43b0-8e0e-5006d3c89b0a;
 Mon, 01 Feb 2021 11:29:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c12so16174405wrc.7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:36 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d30sm28931639wrc.92.2021.02.01.03.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:35 -0800 (PST)
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
X-Inumbo-ID: 37583e1b-ab6b-43b0-8e0e-5006d3c89b0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RGHdflD40CpleI2qTHXo49VNZ9h44Tapyh7dWA7hgYU=;
        b=FmjS7JgVOCypovovv65rLivJnwALFuw37uvTf4RtBSvcme+5wkDBdr5zU4iNwMntrn
         Hgt/tdJZflBiPWoHmBRxbG99i1qLXeOQhLcOcdLq9qXB0TmlTxseS1ch4a/PWI2VGyNc
         KhQhMpM8iJtQ5GJSdlxU9A9hqZKd4pN6UylDzcX8C0OlBu12yLaR09B56wzP2rPTQjLP
         vVOdaRCOy8DqkeRS6zSuluHJq/mKNmWcbYvw77lsOx940Rm9a7a3DW/Tcykdz5FQtilS
         Hw5P7oc0/+gBflEG2AzBjwZyrKln8W4hxuuwJMVvRwX92wB1tr9GJV1L07lkC5+RAABP
         ywOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RGHdflD40CpleI2qTHXo49VNZ9h44Tapyh7dWA7hgYU=;
        b=NBBab+qLAE/ZEXihWRAm0NPtcHqe7fmsKmOqN/BcaW3OEfH+9PC4J9j1eOOscIo9uP
         ufWAyOqlOFvtcWDpzUfSb+b8vJEoZq5ciNDVBGs9NavcAuB1rjaaumOxqa/Cp1UGJiGG
         oSObsmMGBKbXmZSw7iW8iDMR6ST4T0RRtyU9Pi6Wp430DpUqgp7bNFwByOdiHj/9slBe
         AUoOcxuXipU/DScjOcHRTswuzRRqfRaIDgNnaaUbKomwzVlNU0yHVsUkYd/Xgc+eCNJD
         FX3IS+W8PI66Po3N74tUyHfNceQ9E6XX514qzOWElR3E+/NuL7FnhhJkbvs2ot1CuNhm
         cwDw==
X-Gm-Message-State: AOAM530GOaCjnIXO2nEGUPx53gAX5s0de+xu5mJMikr9iT2Tp7xzgMq3
	QU2s7jR1l2WrXdpg+FtWWL0=
X-Google-Smtp-Source: ABdhPJzvuBjmMW0UYZ6d5GxA8BEVDlhSDPc0KocqiT7XJMYbQPMV9DKL5NtfvrqJaptzIHmm77u+zg==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr17935101wrd.118.1612178976190;
        Mon, 01 Feb 2021 03:29:36 -0800 (PST)
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
Subject: [PATCH v3 5/7] hw/xen: Make xen_shutdown_fatal_error() available out of X86 HVM
Date: Mon,  1 Feb 2021 12:29:03 +0100
Message-Id: <20210201112905.545144-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen_shutdown_fatal_error() is also used by XEN_PV.

This fixes when XEN_PV without XEN_FV:

  /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt_config_init.c.o: in function `xen_pt_status_reg_init':
  hw/xen/xen_pt_config_init.c:281: undefined reference to `xen_shutdown_fatal_error'
  /usr/bin/ld: hw/xen/xen_pt_config_init.c:275: undefined reference to `xen_shutdown_fatal_error'
  /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_read_config':
  hw/xen/xen_pt.c:220: undefined reference to `xen_shutdown_fatal_error'
  /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_write_config':
  hw/xen/xen_pt.c:369: undefined reference to `xen_shutdown_fatal_error'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/xen/xen-hvm.c | 13 -------------
 hw/xen/xen-utils.c    | 25 +++++++++++++++++++++++++
 hw/xen/meson.build    |  1 +
 3 files changed, 26 insertions(+), 13 deletions(-)
 create mode 100644 hw/xen/xen-utils.c

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 7156ab13329..69196754a30 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -28,7 +28,6 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
-#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
 #include "trace.h"
@@ -1570,18 +1569,6 @@ void xen_register_framebuffer(MemoryRegion *mr)
     framebuffer = mr;
 }
 
-void xen_shutdown_fatal_error(const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    vfprintf(stderr, fmt, ap);
-    va_end(ap);
-    fprintf(stderr, "Will destroy the domain.\n");
-    /* destroy the domain */
-    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
-}
-
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     if (unlikely(xen_in_migration)) {
diff --git a/hw/xen/xen-utils.c b/hw/xen/xen-utils.c
new file mode 100644
index 00000000000..d6003782420
--- /dev/null
+++ b/hw/xen/xen-utils.c
@@ -0,0 +1,25 @@
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
+#include "sysemu/runstate.h"
+#include "hw/xen/xen_common.h"
+
+void xen_shutdown_fatal_error(const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vfprintf(stderr, fmt, ap);
+    va_end(ap);
+    fprintf(stderr, "Will destroy the domain.\n");
+    /* destroy the domain */
+    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
+}
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 3c2062b9b3e..6c836ae06e4 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -4,6 +4,7 @@
   'xen-bus.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
+  'xen-utils.c',
 ))
 
 xen_specific_ss = ss.source_set()
-- 
2.26.2


