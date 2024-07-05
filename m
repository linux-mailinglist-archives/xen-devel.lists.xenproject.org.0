Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DBF928D79
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 20:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754480.1162953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPnad-0007Ki-6v; Fri, 05 Jul 2024 18:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754480.1162953; Fri, 05 Jul 2024 18:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPnad-0007IP-43; Fri, 05 Jul 2024 18:23:23 +0000
Received: by outflank-mailman (input) for mailman id 754480;
 Fri, 05 Jul 2024 18:23:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPnab-0006of-Oi
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 18:23:21 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a01fb5-3afb-11ef-bbfb-fd08da9f4363;
 Fri, 05 Jul 2024 20:23:21 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so2534141a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 11:23:21 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58f9d3f11ffsm1084696a12.67.2024.07.05.11.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 11:23:17 -0700 (PDT)
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
X-Inumbo-ID: a8a01fb5-3afb-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720203800; x=1720808600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZYPkFHCDEyDlM2Vs4SM3zblVONXWrDP4geH0ChK1q8=;
        b=FOL4yyFKSetRe+pTWiKTCMHG4se/BaGdxyPf3tGGvFxYucdnhfzgRcrLvNDYWZn/Ns
         fKoVU4M4jtsWqk0ziH1IjW7zKBWNT1Tf0w7l1p2CQjNTLWLgPzp1hbF6eH20QDlGdTKq
         DunaSaFHwMblo7FxqwCmEjb4e4jfdp1bN35UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720203800; x=1720808600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZYPkFHCDEyDlM2Vs4SM3zblVONXWrDP4geH0ChK1q8=;
        b=Fvsiq6gQa3H88T2xns8FgN3jReKsIQe+JxE0GKR+maNLEZEhsjMtQrEjw32LoO7A+T
         w65/5DRAR6ZVXmWchHiaQacwx29RczazPiXUR/nXc8c0QCiSzo+vI+uG5DS82a08X5QQ
         06UCyxFzahIznU972aC5eMOSwceRIOx3Vjv8DrfWoJ4LUKHqtHb9wt5nJ8UtgKoSO2HJ
         iQ9O17Z/FUYkwTZ/QKPgrbGHZqAmdb4J7CKodFZti4ZideeIYiK36i1iSF8JHNU060+Y
         lUNZeIeOQIDJC5lQzSU6bX96KHky0tKH1B0pTLjZlaxJ8RFAckpc9LNTsfSzzKUrk1Gy
         9Mmg==
X-Gm-Message-State: AOJu0YxmYw3BBSnsJBhL8kfrU5MmzhV6M86aR8o1/Hz3nLdVKvDl3Okk
	I4mPcd8Wl+GZs8jNfFhqjr3n3MKClry7ZcWgCXk/T8Tjxn4M55HjOv9k9bcB6MrwMew+B/0j2O/
	O
X-Google-Smtp-Source: AGHT+IErjqI/T76XlFax33zMWxF/HpkOewu+ERWm6GTJ4+5O8H1/ktA1EECYcXrH/NOYoEFV3R9x0A==
X-Received: by 2002:a05:6402:2803:b0:57d:2c9:6494 with SMTP id 4fb4d7f45d1cf-58e5acd876cmr4199133a12.10.1720203799699;
        Fri, 05 Jul 2024 11:23:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 2/2] ppc/shutdown: Implement machine_{halt,restart}()
Date: Fri,  5 Jul 2024 19:23:11 +0100
Message-Id: <20240705182311.1968790-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705182311.1968790-1-andrew.cooper3@citrix.com>
References: <20240705182311.1968790-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OPAL has easy APIs for shutdown/reboot, so wire them up.

Then, use machine_halt() rather than an infinite loop at the end of
start_xen().  This avoids the Qemu smoke test needing to wait for the full
timeout in order to succeed.

  (XEN) 8e011600000000c0 is the result of PTE map
  Enabled radix in LPCR
  Flushed TLB
  Hello, ppc64le!
  [    6.341897656,5] OPAL: Shutdown request type 0x0...

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

I got bored testing fixes to the containers...
---
 xen/arch/ppc/Makefile           |  1 +
 xen/arch/ppc/ppc64/opal-calls.S |  4 +++
 xen/arch/ppc/setup.c            |  8 +++---
 xen/arch/ppc/shutdown.c         | 43 +++++++++++++++++++++++++++++++++
 xen/arch/ppc/stubs.c            | 12 ---------
 5 files changed, 51 insertions(+), 17 deletions(-)
 create mode 100644 xen/arch/ppc/shutdown.c

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 71feb5e2c41f..655d212f6687 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_EARLY_PRINTK) += early_printk.init.o
 obj-y += mm-radix.o
 obj-y += opal.o
 obj-y += setup.o
+obj-y += shutdown.o
 obj-y += stubs.o
 obj-y += tlb-radix.o
 
diff --git a/xen/arch/ppc/ppc64/opal-calls.S b/xen/arch/ppc/ppc64/opal-calls.S
index cc5de75c8af4..69d07909d108 100644
--- a/xen/arch/ppc/ppc64/opal-calls.S
+++ b/xen/arch/ppc/ppc64/opal-calls.S
@@ -79,3 +79,7 @@ opal_return_mmu:
 OPAL_CALL(opal_console_write, OPAL_CONSOLE_WRITE)
 OPAL_CALL(opal_console_flush, OPAL_CONSOLE_FLUSH)
 OPAL_CALL(opal_reinit_cpus, OPAL_REINIT_CPUS)
+
+OPAL_CALL(opal_cec_power_down, OPAL_CEC_POWER_DOWN)
+OPAL_CALL(opal_cec_reboot, OPAL_CEC_REBOOT)
+OPAL_CALL(opal_poll_events, OPAL_POLL_EVENTS)
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 7fe06aa4bfb0..5fb5ab64e323 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -2,6 +2,8 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
+#include <xen/shutdown.h>
+
 #include <public/version.h>
 #include <asm/boot.h>
 #include <asm/early_printk.h>
@@ -43,11 +45,7 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
 
     early_printk("Hello, ppc64le!\n");
 
-    for ( ; ; )
-        /* Set current hardware thread to very low priority */
-        HMT_very_low();
-
-    unreachable();
+    machine_halt();
 }
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
diff --git a/xen/arch/ppc/shutdown.c b/xen/arch/ppc/shutdown.c
new file mode 100644
index 000000000000..c4b00e57b13a
--- /dev/null
+++ b/xen/arch/ppc/shutdown.c
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/shutdown.h>
+
+#include <asm/opal-api.h>
+
+int64_t opal_cec_power_down(uint64_t request);
+int64_t opal_cec_reboot(void);
+int64_t opal_poll_events(uint64_t *outstanding_event_mask);
+
+void machine_halt(void)
+{
+    int rc;
+
+    do {
+        rc = opal_cec_power_down(0);
+
+        if ( rc == OPAL_BUSY_EVENT )
+            opal_poll_events(NULL);
+
+    } while ( rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT );
+
+    for ( ;; )
+        opal_poll_events(NULL);
+}
+
+void machine_restart(unsigned int delay_millisecs)
+{
+    int rc;
+
+    /* TODO: mdelay(delay_millisecs); */
+
+    do {
+        rc = opal_cec_reboot();
+
+        if ( rc == OPAL_BUSY_EVENT )
+            opal_poll_events(NULL);
+
+    } while ( rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT );
+
+    for ( ;; )
+        opal_poll_events(NULL);
+}
+
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 923f0e7b2095..41e7a7d2130b 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -59,18 +59,6 @@ void vcpu_show_execution_state(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-/* shutdown.c */
-
-void machine_restart(unsigned int delay_millisecs)
-{
-    BUG_ON("unimplemented");
-}
-
-void machine_halt(void)
-{
-    BUG_ON("unimplemented");
-}
-
 /* vm_event.c */
 
 void vm_event_fill_regs(vm_event_request_t *req)
-- 
2.39.2


