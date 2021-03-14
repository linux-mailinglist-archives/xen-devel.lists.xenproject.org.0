Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027733A8C6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 00:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97815.185561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLaAt-0005Lt-Q2; Sun, 14 Mar 2021 23:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97815.185561; Sun, 14 Mar 2021 23:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLaAt-0005LX-Ml; Sun, 14 Mar 2021 23:29:31 +0000
Received: by outflank-mailman (input) for mailman id 97815;
 Sun, 14 Mar 2021 23:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O4ai=IM=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1lLaAr-0005LS-Rl
 for xen-devel@lists.xenproject.org; Sun, 14 Mar 2021 23:29:29 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fd255a2-82f3-47cd-b7e7-1e47b8b0cff3;
 Sun, 14 Mar 2021 23:29:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u16so7802001wrt.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Mar 2021 16:29:27 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a8sm10533573wmm.46.2021.03.14.16.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:26 -0700 (PDT)
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
X-Inumbo-ID: 7fd255a2-82f3-47cd-b7e7-1e47b8b0cff3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h5PCnHeuw663l7VaVIolY9Ne6WKSedqc+Qdhk8tXZxI=;
        b=ar+Fg8rz24oRhbuiwycxqds9OHpHo9VC298sJTVByLXIEO/y3tU2tfJ4WmjMtUal4M
         ZL+WKKcS3MIUxV4a4/O28CkNDvTihLtaN72s31DBYsOIfhfUXcn7u8fQzdGdwzjgHmY6
         eti2xAwInvH4bdixt4DSmT/jJDH2XSy5ZkjBz+Ws1gu5f/0FRfyXh5NrJbquYP/n3AUb
         XVbgGjLFVnFY2iuY3egv2lPv0dptei+bZIHX3aCmlNm8vhzNieeRxUvlkqeqg/AjuCf4
         CVi3J5MsdNZ6aqTQF3NoZZKAi5N2VgSpzmVw51iNI+Hcnyk7k2/9ml69U2I55aQVHiz+
         UixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=h5PCnHeuw663l7VaVIolY9Ne6WKSedqc+Qdhk8tXZxI=;
        b=oMD1sFz6aWVfvnmh3YtRZg/YfiKw1sM6MLfGysBP7aJwadCEQXKH7k11nr9FlO5sk/
         12kEh/q++kvCpIeMq3gStReTsPXMfXFpqJhtXDMzgaDDXlHFYGsohs4BeUtumzlobfXe
         Xmkh0dbxplnun/TVMYpFpo3WO2YYuv9m4ZzvXkznBuzqpLKOOeLlWO6e5d10owby3XiP
         7AYlUA7hwqKwM3g/wSIe0N92UfiqV5rymlEH4TLN+k0Ofe2PJJEZ9C3MyCgXpZxm8h1Q
         LKirJFwnQ3PFMgix9pE9S5yH/GXWQMbK5X+UpxugGAVaeT6Ca6DPORnylv8Hx5ZDicOd
         PZlw==
X-Gm-Message-State: AOAM53235w4TlS4/X0ny3u3hc+aNUY4JEW3BnkU2VrPvE3E4Yk4hquUy
	hQPBwX4Fd14pS0tK5tBPybQ=
X-Google-Smtp-Source: ABdhPJzIEwujHVQs/5HxbmUBLWEk5042vfAG0vNbusCoXJvUxDP6j8s8K0Uh5L5pj5Ks/wAVIwiXAQ==
X-Received: by 2002:adf:e412:: with SMTP id g18mr25206215wrm.159.1615764567139;
        Sun, 14 Mar 2021 16:29:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Bandan Das <bsd@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [RFC PATCH 2/8] exec: Extract CPU I/O instructions to "cpu-io.h"
Date: Mon, 15 Mar 2021 00:29:07 +0100
Message-Id: <20210314232913.2607360-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not all architectures use an I/O bus. Extract the CPU I/O
instruction helpers into a specific unit named cpu-io.c
(and its equivalent "cpu-io.h" header).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-io.h             | 30 +++++++++++
 include/exec/ioport.h             |  7 ---
 hw/i386/xen/xen-hvm.c             |  1 +
 monitor/misc.c                    |  2 +-
 softmmu/cpu-io.c                  | 88 +++++++++++++++++++++++++++++++
 softmmu/ioport.c                  | 60 ---------------------
 softmmu/qtest.c                   |  1 +
 tests/qtest/fuzz/qtest_wrappers.c |  3 +-
 softmmu/meson.build               |  3 +-
 9 files changed, 125 insertions(+), 70 deletions(-)
 create mode 100644 include/exec/cpu-io.h
 create mode 100644 softmmu/cpu-io.c

diff --git a/include/exec/cpu-io.h b/include/exec/cpu-io.h
new file mode 100644
index 00000000000..6538c451177
--- /dev/null
+++ b/include/exec/cpu-io.h
@@ -0,0 +1,30 @@
+/*
+ * QEMU CPU I/O instructions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_IO_H
+#define CPU_IO_H
+
+void cpu_outb(uint32_t addr, uint8_t val);
+void cpu_outw(uint32_t addr, uint16_t val);
+void cpu_outl(uint32_t addr, uint32_t val);
+uint8_t cpu_inb(uint32_t addr);
+uint16_t cpu_inw(uint32_t addr);
+uint32_t cpu_inl(uint32_t addr);
+
+#endif /* CPU_IO_H */
diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index e34f668998d..e58f475a7f0 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -44,13 +44,6 @@ typedef struct MemoryRegionPortio {
 extern const MemoryRegionOps unassigned_io_ops;
 #endif
 
-void cpu_outb(uint32_t addr, uint8_t val);
-void cpu_outw(uint32_t addr, uint16_t val);
-void cpu_outl(uint32_t addr, uint32_t val);
-uint8_t cpu_inb(uint32_t addr);
-uint16_t cpu_inw(uint32_t addr);
-uint32_t cpu_inl(uint32_t addr);
-
 typedef struct PortioList {
     const struct MemoryRegionPortio *ports;
     Object *owner;
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 7ce672e5a5c..56e0018a50e 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -34,6 +34,7 @@
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
+#include "exec/cpu-io.h"
 
 #include <xen/hvm/ioreq.h>
 #include <xen/hvm/e820.h>
diff --git a/monitor/misc.c b/monitor/misc.c
index a7650ed7470..d40c7d5afc0 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -77,7 +77,7 @@
 #include "qapi/qmp-event.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
-
+#include "exec/cpu-io.h"
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
 #include "hw/s390x/storage-attributes.h"
diff --git a/softmmu/cpu-io.c b/softmmu/cpu-io.c
new file mode 100644
index 00000000000..6ee03555f2c
--- /dev/null
+++ b/softmmu/cpu-io.c
@@ -0,0 +1,88 @@
+/*
+ * QEMU CPU I/O instructions
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/address-spaces.h"
+#include "exec/cpu-io.h"
+#include "cpu.h"
+#include "trace.h"
+
+void cpu_outb(uint32_t addr, uint8_t val)
+{
+    trace_cpu_out(addr, 'b', val);
+    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                        &val, 1);
+}
+
+void cpu_outw(uint32_t addr, uint16_t val)
+{
+    uint8_t buf[2];
+
+    trace_cpu_out(addr, 'w', val);
+    stw_p(buf, val);
+    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                        buf, 2);
+}
+
+void cpu_outl(uint32_t addr, uint32_t val)
+{
+    uint8_t buf[4];
+
+    trace_cpu_out(addr, 'l', val);
+    stl_p(buf, val);
+    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                        buf, 4);
+}
+
+uint8_t cpu_inb(uint32_t addr)
+{
+    uint8_t val;
+
+    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
+                       &val, 1);
+    trace_cpu_in(addr, 'b', val);
+    return val;
+}
+
+uint16_t cpu_inw(uint32_t addr)
+{
+    uint8_t buf[2];
+    uint16_t val;
+
+    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 2);
+    val = lduw_p(buf);
+    trace_cpu_in(addr, 'w', val);
+    return val;
+}
+
+uint32_t cpu_inl(uint32_t addr)
+{
+    uint8_t buf[4];
+    uint32_t val;
+
+    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 4);
+    val = ldl_p(buf);
+    trace_cpu_in(addr, 'l', val);
+    return val;
+}
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index cb8adb0b936..69b13eed5e6 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
@@ -54,65 +53,6 @@ const MemoryRegionOps unassigned_io_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void cpu_outb(uint32_t addr, uint8_t val)
-{
-    trace_cpu_out(addr, 'b', val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        &val, 1);
-}
-
-void cpu_outw(uint32_t addr, uint16_t val)
-{
-    uint8_t buf[2];
-
-    trace_cpu_out(addr, 'w', val);
-    stw_p(buf, val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        buf, 2);
-}
-
-void cpu_outl(uint32_t addr, uint32_t val)
-{
-    uint8_t buf[4];
-
-    trace_cpu_out(addr, 'l', val);
-    stl_p(buf, val);
-    address_space_write(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                        buf, 4);
-}
-
-uint8_t cpu_inb(uint32_t addr)
-{
-    uint8_t val;
-
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED,
-                       &val, 1);
-    trace_cpu_in(addr, 'b', val);
-    return val;
-}
-
-uint16_t cpu_inw(uint32_t addr)
-{
-    uint8_t buf[2];
-    uint16_t val;
-
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 2);
-    val = lduw_p(buf);
-    trace_cpu_in(addr, 'w', val);
-    return val;
-}
-
-uint32_t cpu_inl(uint32_t addr)
-{
-    uint8_t buf[4];
-    uint32_t val;
-
-    address_space_read(&address_space_io, addr, MEMTXATTRS_UNSPECIFIED, buf, 4);
-    val = ldl_p(buf);
-    trace_cpu_in(addr, 'l', val);
-    return val;
-}
-
 void portio_list_init(PortioList *piolist,
                       Object *owner,
                       const MemoryRegionPortio *callbacks,
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 130c3666154..ff253068657 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -31,6 +31,7 @@
 #ifdef CONFIG_PSERIES
 #include "hw/ppc/spapr_rtas.h"
 #endif
+#include "exec/cpu-io.h"
 
 #define MAX_IRQ 256
 
diff --git a/tests/qtest/fuzz/qtest_wrappers.c b/tests/qtest/fuzz/qtest_wrappers.c
index 0580f8df860..921d1e5ed3a 100644
--- a/tests/qtest/fuzz/qtest_wrappers.c
+++ b/tests/qtest/fuzz/qtest_wrappers.c
@@ -12,8 +12,9 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/address-spaces.h"
+#include "exec/cpu-io.h"
 #include "hw/core/cpu.h"
-#include "exec/ioport.h"
 
 #include "fuzz.h"
 
diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e03018abf..ebf063b8990 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -2,11 +2,11 @@
   'arch_init.c',
   'balloon.c',
   'cpus.c',
+  'cpu-io.c',
   'cpu-throttle.c',
   'datadir.c',
   'globals.c',
   'physmem.c',
-  'ioport.c',
   'rtc.c',
   'runstate.c',
   'memory.c',
@@ -24,6 +24,7 @@
 softmmu_ss.add(files(
   'bootdevice.c',
   'dma-helpers.c',
+  'ioport.c',
   'qdev-monitor.c',
 ), sdl, libpmem, libdaxctl)
 
-- 
2.26.2


