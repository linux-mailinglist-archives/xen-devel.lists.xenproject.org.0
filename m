Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9D30A684
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79773.145312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOa-0002jT-9l; Mon, 01 Feb 2021 11:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79773.145312; Mon, 01 Feb 2021 11:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOa-0002io-68; Mon, 01 Feb 2021 11:29:28 +0000
Received: by outflank-mailman (input) for mailman id 79773;
 Mon, 01 Feb 2021 11:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XOY-0002hn-EF
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:26 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cc4cb1c-3b29-4634-bc0a-6dfffa42d20c;
 Mon, 01 Feb 2021 11:29:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id y187so12868892wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:25 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id s23sm20324467wmc.35.2021.02.01.03.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:24 -0800 (PST)
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
X-Inumbo-ID: 5cc4cb1c-3b29-4634-bc0a-6dfffa42d20c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=86kgWxqaVQ459jB6Z+UlH8D45KqeOXWfxBT1ho7ZaU4=;
        b=OvgFBK6bmxqweSp3L77Aj8WaAxT1RQK0LtEk3i36jsBBT/QaFtswrGEa72xZLMd4Yb
         HIUhY+oLNPcVTx0grppbuToABViBp+iIgP1lhjj7VUfVrYskRS511GA7hnokxOH0+1hl
         Llq6UzcwQZKox5D1iLDy4JUoVe9v7MvTlaPAwPhQGGDyHg/dG4Y7wUG4nevlaACcQCNa
         OGhW/bC2jrKwZhFOXWeH02rHFHQET1ePy5uJIr09AQTtEe/LqnRUMrCDsUr7yNukAjNX
         KfV/ZLVI7sFYmKWV4CFTTIr/ggz3eMOkgOHARcOO5pOvHUgqxm9ZDMwGiTNoRja/YO0o
         FkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=86kgWxqaVQ459jB6Z+UlH8D45KqeOXWfxBT1ho7ZaU4=;
        b=FAuKnR2pvYsvQUFztPtDtY9FcUAiTWAuSmhxqI1IdrHCFB2prtLkck4eLyrC+VP5F5
         gG1D6QY3bT79qZHwcVUNOH0+NusDtAbh8ZTiTF/7Pu3mVJQKof11r9ikbHLLz7G7L5U7
         WrQBsEq3t3xVsvNghbFeW2C6rlbEYZudX+7NbKr7cdmBFv5WQiH0H54OTElmzIEJ+6Vi
         cRwczpKPpt4cuIMyiw7UldvXV2Z64sEQZnIS5VNcJNDX5p/pPHR+aZKCHxTWeNsp3oJq
         D1e4oolEa9Jbf62zpNxkFjy/SYQ46SjnOQnEu6Ueb8NQ3hlJ/i6Ptlb43oi1wC69vG/M
         McQQ==
X-Gm-Message-State: AOAM533/Q20nBD6/cguvOgiYMg/UJzy7sYawFcSaY+gxfsVzevm/WowF
	8ovr/v9FvQ2WmR4/VeV+XiY=
X-Google-Smtp-Source: ABdhPJxcRgfDMwb1tHeCu3Tj2p4+drVJi66+iJFM6aft3sJqiy4qEUbcRAahN2gmhZHZ8T/I+s19pw==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr14727242wma.114.1612178964810;
        Mon, 01 Feb 2021 03:29:24 -0800 (PST)
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
Subject: [PATCH v3 3/7] accel/xen: Incorporate xen-mapcache.c
Date: Mon,  1 Feb 2021 12:29:01 +0100
Message-Id: <20210201112905.545144-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen-mapcache.c contains accelerator related routines,
not particular to the X86 HVM machine. Move this file
to accel/xen/ (adapting the buildsys machinery).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                           |  3 +++
 accel/xen/trace.h                     |  1 +
 {hw/i386 => accel}/xen/xen-mapcache.c |  0
 hw/i386/xen/xen-hvm.c                 |  1 -
 accel/xen/meson.build                 |  5 ++++-
 accel/xen/trace-events                | 10 ++++++++++
 hw/i386/xen/meson.build               |  1 -
 hw/i386/xen/trace-events              |  6 ------
 8 files changed, 18 insertions(+), 9 deletions(-)
 create mode 100644 accel/xen/trace.h
 rename {hw/i386 => accel}/xen/xen-mapcache.c (100%)
 create mode 100644 accel/xen/trace-events

diff --git a/meson.build b/meson.build
index 97a577a7743..f2e778f22cd 100644
--- a/meson.build
+++ b/meson.build
@@ -1706,6 +1706,9 @@
   'crypto',
   'monitor',
 ]
+if 'CONFIG_XEN' in accelerators
+  trace_events_subdirs += [ 'accel/xen' ]
+endif
 if have_user
   trace_events_subdirs += [ 'linux-user' ]
 endif
diff --git a/accel/xen/trace.h b/accel/xen/trace.h
new file mode 100644
index 00000000000..f6be599b187
--- /dev/null
+++ b/accel/xen/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-accel_xen.h"
diff --git a/hw/i386/xen/xen-mapcache.c b/accel/xen/xen-mapcache.c
similarity index 100%
rename from hw/i386/xen/xen-mapcache.c
rename to accel/xen/xen-mapcache.c
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 68821d90f52..7156ab13329 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -31,7 +31,6 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
-#include "sysemu/xen-mapcache.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
 
diff --git a/accel/xen/meson.build b/accel/xen/meson.build
index 002bdb03c62..45671e4bdbf 100644
--- a/accel/xen/meson.build
+++ b/accel/xen/meson.build
@@ -1 +1,4 @@
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
+specific_ss.add(when: 'CONFIG_XEN', if_true: files(
+  'xen-all.c',
+  'xen-mapcache.c',
+))
diff --git a/accel/xen/trace-events b/accel/xen/trace-events
new file mode 100644
index 00000000000..30bf4f42283
--- /dev/null
+++ b/accel/xen/trace-events
@@ -0,0 +1,10 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# xen-hvm.c
+xen_ram_alloc(unsigned long ram_addr, unsigned long size) "requested: 0x%lx, size 0x%lx"
+
+# xen-mapcache.c
+xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
+xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
+xen_map_cache_return(void* ptr) "%p"
+
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300c..2fcc46e6ca1 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,6 +1,5 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
-  'xen-mapcache.c',
   'xen_apic.c',
   'xen_platform.c',
   'xen_pvdevice.c',
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index ca3a4948baa..f1b36d164d9 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -20,9 +20,3 @@ cpu_ioreq_move(void *req, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint6
 xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
 cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
-
-# xen-mapcache.c
-xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
-xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
-xen_map_cache_return(void* ptr) "%p"
-
-- 
2.26.2


