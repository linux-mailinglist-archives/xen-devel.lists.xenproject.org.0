Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB0FA3A2B3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892012.1301049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQs-0005nb-Cs; Tue, 18 Feb 2025 16:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892012.1301049; Tue, 18 Feb 2025 16:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQs-0005kt-8D; Tue, 18 Feb 2025 16:26:50 +0000
Received: by outflank-mailman (input) for mailman id 892012;
 Tue, 18 Feb 2025 16:26:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQQr-0004Eu-5g
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26227fb8-ee15-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:26:47 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-439946a49e1so6551445e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fa2dsm15228567f8f.101.2025.02.18.08.26.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:46 -0800 (PST)
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
X-Inumbo-ID: 26227fb8-ee15-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739896007; x=1740500807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEWDgBTGZHQh8hQjrfZA2thbBnd3w2okAGpaFOGJy1M=;
        b=znvXKY1GINt8oIWo3Pmuo5lViy3vnfUzrUnnEP7BrqX/BR5+HIlr4MH9rmKTHN3YYy
         UdCNJzf3cYn84fHiB9TNItb7wZLUjo0Y/cv/YxBP9kbu8UOd1y8bvF0ILx/uhYrNRAq0
         RBlWoKekFFAr1JEyQs39+c3hFFExdroHp0O65nrZ06/3D0Lw/sDGixHuAfjZJf0o6bd/
         EvIk/AvtwJKjILEVIXXDfe94muqdNqbcG+DoYO52jHLFR286OrRP2C7YoLfCLQrV7SWv
         X5UDIpPvcKeL5ymTMXS2enK/wcZr9iUVOE7Uwoaypq1ZlnDqVnIt2h599CcaJyPomVl1
         3pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896007; x=1740500807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEWDgBTGZHQh8hQjrfZA2thbBnd3w2okAGpaFOGJy1M=;
        b=SGD5NeFHqesV5+JH0lAL3kO7Rge6K/yd1OKt+cWvy5r1Ul24ucRv6IiUObPYvSoofv
         KnxzuUVcXCRhY2Sr7I8hVXfNhHGdGVjJGsiwP0TcfiEpEnKhFW+egf0sIFOjDzrRZptX
         DabQRDPoK/GADkzzEh1ax9c821KdZR8xcOs00NFqFqIcXvnt7SgGp1FojfxgFjcUcQxs
         HHrqRYUiKBZlUkVEpaa9RrByafSrS1XQe9AWrk+jdym6rSlwVZOnP11y/vZbhb6WJ9mv
         /rTWHtwiDM9Vf9byM2gpl0gHPLNmj6slpmk8s459UFEIrhLOH+chC/TBbQ6ePjM+Tcg6
         F2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWJA8Sh+GOuSgsXbQZuIRQcl5kKmoZaS6V2BEo4e0yBx53ecXSJe3Tq1wpVsGsObcJ0pkran518AQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybzxqLVVw1HPojC+MxxMgnVgXQNAen9J4L0ISZ6xTW3KBYcUgy
	CL1mqwMneP7V/jHXVJ8JCbreCnaBq0nZFP90a+6izRljShCdrGzEhLbvJzuSKuo=
X-Gm-Gg: ASbGncscDshBPAV4uWKpbrp7dVqbxKteqHeyg2kavBWt+v2/8NpqAvk8u4gyAXofiub
	A8BuUI+0Q5Afp3EmmIQQkxoDt3k05qlLe9CC/rFhRMKiKLFrdlGqn2IkZfzXc7Yd40NgGRF+TBs
	TK4xlgtc/pCTJ5CyssZ/y0Gk8VFLEJ58Ft0BjN1sQuI+J0U9lOH7oSyrDHBIWncfb73XMvR5L//
	2NKZ7SSBK4jSL/+cBqEMRxsWj8tBO5prpAKDn2oMG0vTCPwEU0YfA5R5seFYqZyqAuaGTWSTWs0
	vj7SBKMi/pIXrAQMmQ1Z4hnffqommQNv4xS0dbM9aBfn/j5uAOYhXeXeu5Kez5i32Q==
X-Google-Smtp-Source: AGHT+IHww/aPDqevZulOoXCapDkghHuR45jCHHx4aaEIx+GvA7aWlGWPRHehkaEbIQa+py8L6fjQlQ==
X-Received: by 2002:a05:600c:4e8c:b0:439:9274:81db with SMTP id 5b1f17b1804b1-43999d76ddcmr3474325e9.5.1739896006891;
        Tue, 18 Feb 2025 08:26:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>,
	Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 5/8] hw/xen/xen-hvm: Reduce included headers
Date: Tue, 18 Feb 2025 17:26:15 +0100
Message-ID: <20250218162618.46167-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have "hw/xen/xen-hvm-common.h" include the bare minimal set
of headers. Adapt sources to avoid errors when refactoring
unrelated headers such:

  include/hw/xen/xen-hvm-common.h:71:5: error: unknown type name ‘xenevtchn_handle’
     71 |     xenevtchn_handle *xce_handle;
        |     ^~~~~~~~~~~~~~~~
  hw/xen/xen-hvm-common.c: In function ‘cpu_get_ioreq’:
  hw/xen/xen-hvm-common.c:227:13: error: implicit declaration of function ‘hw_error’
    227 |             hw_error("Fatal error while trying to get io event!\n");
        |             ^~~~~~~~
        |             herror
  hw/xen/xen-hvm-common.c: In function ‘handle_ioreq’:
  hw/xen/xen-hvm-common.c:446:34: error: ‘target_ulong’ undeclared (first use in this function)
    446 |             (req->size < sizeof (target_ulong))) {
        |                                  ^~~~~~~~~~~~
  hw/i386/xen/xen-hvm.c: In function ‘xen_add_to_physmap’:
  hw/i386/xen/xen-hvm.c:298:22: error: implicit declaration of function ‘xen_replace_cache_entry’
    298 |         uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
        |                      ^~~~~~~~~~~~~~~~~~~~~~~
  hw/i386/xen/xen-hvm.c: In function ‘xen_log_global_start’:
  hw/i386/xen/xen-hvm.c:465:9: error: implicit declaration of function ‘xen_enabled’
    465 |     if (xen_enabled()) {
        |         ^~~~~~~~~~~
  hw/i386/xen/xen-hvm.c: In function ‘regs_to_cpu’:
  hw/i386/xen/xen-hvm.c:487:5: error: unknown type name ‘X86CPU’
    487 |     X86CPU *cpu;
        |     ^~~~~~
  hw/i386/xen/xen-hvm.c:492:15: error: ‘R_EAX’ undeclared (first use in this function)
    492 |     env->regs[R_EAX] = req->data;
        |               ^~~~~
        |               REG_RAX

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 14 +++-----------
 hw/arm/xen-stubs.c              |  5 ++---
 hw/i386/xen/xen-hvm.c           |  5 +++++
 hw/xen/xen-hvm-common.c         |  6 ++++++
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index c1ea2c0d787..19df5600a39 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -1,18 +1,10 @@
 #ifndef HW_XEN_HVM_COMMON_H
 #define HW_XEN_HVM_COMMON_H
 
-#include "qemu/units.h"
-
-#include "cpu.h"
-#include "hw/pci/pci.h"
-#include "hw/hw.h"
+#include "qemu/queue.h"
+#include "exec/hwaddr.h"
 #include "hw/xen/xen_native.h"
-#include "hw/xen/xen-legacy-backend.h"
-#include "system/runstate.h"
-#include "system/system.h"
-#include "system/xen.h"
-#include "system/xen-mapcache.h"
-#include "qemu/error-report.h"
+#include "hw/xen/xen_backend_ops.h"
 #include <xen/hvm/ioreq.h>
 
 extern MemoryRegion xen_memory;
diff --git a/hw/arm/xen-stubs.c b/hw/arm/xen-stubs.c
index 34beb8b08cb..5551584dc20 100644
--- a/hw/arm/xen-stubs.c
+++ b/hw/arm/xen-stubs.c
@@ -5,10 +5,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/error-report.h"
 #include "qapi/qapi-commands-migration.h"
-#include "hw/boards.h"
-#include "system/system.h"
+#include "system/xen.h"
+#include "hw/hw.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/arch_hvm.h"
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index d3df488c483..67b7c223aee 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -14,6 +14,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "trace.h"
 
+#include "hw/hw.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
 #include "hw/i386/apic-msidef.h"
@@ -24,6 +25,10 @@
 #include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 #include "exec/target_page.h"
+#include "target/i386/cpu.h"
+#include "system/runstate.h"
+#include "system/xen-mapcache.h"
+#include "system/xen.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
 static MemoryRegion *framebuffer;
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 7ffbbfea23b..3828105c95e 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,14 +1,20 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "exec/target_long.h"
 #include "exec/target_page.h"
 #include "trace.h"
 
+#include "hw/hw.h"
 #include "hw/pci/pci_host.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
+#include "system/runstate.h"
+#include "system/system.h"
+#include "system/xen.h"
+#include "system/xen-mapcache.h"
 
 MemoryRegion xen_memory, xen_grants;
 
-- 
2.47.1


