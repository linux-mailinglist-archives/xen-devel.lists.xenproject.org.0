Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A39C25FD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832783.1248160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V81-0002mu-Gk; Fri, 08 Nov 2024 19:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832783.1248160; Fri, 08 Nov 2024 19:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V81-0002kA-9M; Fri, 08 Nov 2024 19:58:45 +0000
Received: by outflank-mailman (input) for mailman id 832783;
 Fri, 08 Nov 2024 19:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7z-0008TY-60
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92719ef-9e0b-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:58:39 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso428872266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:39 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:36 -0800 (PST)
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
X-Inumbo-ID: d92719ef-9e0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ5MjcxOWVmLTllMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk1OTE5Ljg3MjY1NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095919; x=1731700719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7/2tyrjO+foQHdsyFkn3cPeL3RHFRZuXllVwsi5Vtc=;
        b=CkARgPquSLI8bUur+u8lLxcr6PPOnZ8vFsAupUvc40a2okHHbS84epkYTOJqC9sbwV
         xNV+vu/ZXQh4zWM/BF9NmB6QN5OjwZQdvCHYni7CJtLyIFTs0T9yar8nKTuvFEy5muhA
         HC1z3b6ptTx3POuJQiwW3W6ll4cafkJ2tHULo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095919; x=1731700719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7/2tyrjO+foQHdsyFkn3cPeL3RHFRZuXllVwsi5Vtc=;
        b=Zgj0arYIocY9j+P2DZ5HiCor8FCrAAGLMMcRD7wLEVM5CC/vIrf6rUudi/Sl+FtOhb
         tm+F2nxv1UI9CV3S6f6H5AOBEUKyyI5H4IzaO1SW/Q7sW9xOWxKCYBCHByNezCQr2wX5
         BZhdkL9yK44hrwuadhZaEEJOXxQY4YUDc7QmdYRs8eS9DKObiuJw+ndhEcw/tsFQ4eJM
         1chhH47jMIvCfQINhIP8ycCbSajTahHAqFQUGaNldDdocfss6asVS8FmQ12a9IX2d7m9
         cY/KWbd+pD2F034EC5E7NjRst8aU/N4W1b8HcEC4MlMvBN+Ag8ZOjbPbbhNFm4rxnfGF
         Krsg==
X-Gm-Message-State: AOJu0YxNPI6jwBf0v4AkhX8reGFkIRbZXXqM3ajYPXT8Hopa69zSAFHN
	1GgCp7lC/a8WtIA/eOpamn7U0szzXWiMAK+LS/fEUWZZUTCzXUbX1ffu+8DRlZJvzMS/mJFzAUh
	6
X-Google-Smtp-Source: AGHT+IH/oI66KdDWXrvpJYzMBjtAQSbLS30PUxc/CQOomyFvs4Uyw/JRJcbEoLqDDY/Ktm/JcrdwtA==
X-Received: by 2002:a17:906:dc8a:b0:a9e:b090:e65d with SMTP id a640c23a62f3a-a9eeff383eemr334778266b.32.1731095918858;
        Fri, 08 Nov 2024 11:58:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 10/10] x86: Delete mach_apic.h
Date: Fri,  8 Nov 2024 19:58:20 +0000
Message-Id: <20241108195820.789716-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All useful content has been moved elsewhere.

Clean up the dregs, and remove the entire mach-generic include path.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/apic.c                           |  4 ++--
 xen/arch/x86/arch.mk                          |  1 -
 .../x86/include/asm/mach-generic/mach_apic.h  | 24 -------------------
 xen/arch/x86/io_apic.c                        | 15 +++++-------
 4 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/mach-generic/mach_apic.h

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 9f3a374e9581..8f192f80b852 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -35,7 +35,8 @@
 #include <asm/hardirq.h>
 #include <asm/apic.h>
 #include <asm/io_apic.h>
-#include <mach_apic.h>
+#include <asm/genapic.h>
+
 #include <io_ports.h>
 #include <irq_vectors.h>
 #include <xen/kexec.h>
@@ -230,7 +231,6 @@ void __init connect_bsp_APIC(void)
     }
 
     printk("Enabling APIC mode.  Using %d I/O APICs\n", nr_ioapics);
-    enable_apic_mode();
 }
 
 void disconnect_bsp_APIC(int virt_wire_setup)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 1460ecf30b9a..8f8aeda679d8 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,7 +3,6 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
-CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
 CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
deleted file mode 100644
index 3e17c271d9ac..000000000000
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ /dev/null
@@ -1,24 +0,0 @@
-#ifndef __ASM_MACH_APIC_H
-#define __ASM_MACH_APIC_H
-
-#include <asm/apic.h>
-#include <asm/io_apic.h>
-#include <asm/genapic.h>
-#include <asm/smp.h>
-
-static inline void enable_apic_mode(void)
-{
-	/* Not needed for modern ES7000 which boot in Virtual Wire mode. */
-	/*es7000_sw_apic();*/
-}
-
-#define apicid_to_node(apicid) ((int)apicid_to_node[(u32)apicid])
-
-extern u32 bios_cpu_apicid[];
-
-static inline int multi_timer_check(int apic, int irq)
-{
-	return 0;
-}
-
-#endif /* __ASM_MACH_APIC_H */
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 2774cd45c091..13daebc10a97 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -31,13 +31,16 @@
 #include <xen/softirq.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/apic.h>
+#include <asm/genapic.h>
 #include <asm/hpet.h>
+#include <asm/io_apic.h>
 #include <asm/mc146818rtc.h>
 #include <asm/smp.h>
 #include <asm/desc.h>
 #include <asm/msi.h>
 #include <asm/setup.h>
-#include <mach_apic.h>
+
 #include <io_ports.h>
 #include <irq_vectors.h>
 #include <public/physdev.h>
@@ -1104,14 +1107,8 @@ static void __init setup_IO_APIC_irqs(void)
             }
 
             irq = pin_2_irq(idx, apic, pin);
-            /*
-             * skip adding the timer int on secondary nodes, which causes
-             * a small but painful rift in the time-space continuum
-             */
-            if (multi_timer_check(apic, irq))
-                continue;
-            else
-                add_pin_to_irq(irq, apic, pin);
+
+            add_pin_to_irq(irq, apic, pin);
 
             if (!IO_APIC_IRQ(irq))
                 continue;
-- 
2.39.5


