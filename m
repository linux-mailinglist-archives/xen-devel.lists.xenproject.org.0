Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DF49C3DF2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833639.1248823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATBC-00009r-Iq; Mon, 11 Nov 2024 12:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833639.1248823; Mon, 11 Nov 2024 12:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATBC-00006N-Fk; Mon, 11 Nov 2024 12:06:02 +0000
Received: by outflank-mailman (input) for mailman id 833639;
 Mon, 11 Nov 2024 12:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tATBB-0008V8-1v
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:06:01 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4df9003b-a025-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 13:05:55 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c9404c0d50so5450999a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:05:55 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4b5cesm590845866b.72.2024.11.11.04.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 04:05:54 -0800 (PST)
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
X-Inumbo-ID: 4df9003b-a025-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRkZjkwMDNiLWEwMjUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI2NzU1LjYwMDE1OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731326755; x=1731931555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzFyCeyD/r7MrnVyp/XD6eBAQ7GNqthgR2gAZDuS6Is=;
        b=bMFfFEeK5GkHpvSRRVklReSso9jAy0ZOK+U6MWG4GMVHNKnGmFxQHAZ0wskTV5tLng
         dC5h9woJynG0EmEOYZ/WPXBfBkz6Lz8geV5DVSFmcd1xzk6FcxNmPmO7EwkJjvyTiM5g
         7WA+QS9/e6HK+Jb2qSYBbuDdG3NwXGav5Hc6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326755; x=1731931555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzFyCeyD/r7MrnVyp/XD6eBAQ7GNqthgR2gAZDuS6Is=;
        b=AwLpUrXgZ4bwkrgbf9d8RTIoan8VD4AqclHcwi6gLzLcMrCsXVTZ8h9MeYaY6/Zek8
         y+ZR5Hm3s+ZqbTo/JKjNazvq7cw6urzKjU7NorneYTH0jifixYpXsRMMYTyyrNQO+D0L
         f3yMsXYIP9eHTPGJLPDW6XwaKHQv479Mm9LuvDkiaGOEiREdNwVmgYd7j2jdpJ3Lw7y3
         OvN0ZzoISnVQzdVK2uEBT4UYNjdWgVLK964t+41zjDlFyvQsA9xIQUFzuqYObp0TMJsK
         0ABEE8U3eFY/dvAK1XZoAe4hF749B7pTKn7NvBIlNuuXR3zQP75reRU1shvIYmcZpXcJ
         DDVQ==
X-Gm-Message-State: AOJu0Yx0+LhbynlLm7m/5G5OQ+1OqMHxZIOlpBh8DKILrLjGQp/oG4jf
	RhTCyj9kTwDXrvCQ80xqohp8nklJL+Q4DRAXgVAiDb+xztYQJkhLuUhP3f8SPxqolcT2pWk8Q+T
	C
X-Google-Smtp-Source: AGHT+IGZfZrK6ZbDTfB+qBhhZOLi8p78U/ZKEjGpuuN5ib0YwiYwEUH0kiO3JfX3UQVMI0/T75Xfiw==
X-Received: by 2002:a17:907:844:b0:a9a:a96a:e280 with SMTP id a640c23a62f3a-a9eeff0ea22mr1247352966b.20.1731326754641;
        Mon, 11 Nov 2024 04:05:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 10/10] x86: Delete mach_apic.h
Date: Mon, 11 Nov 2024 12:05:51 +0000
Message-Id: <20241111120551.987090-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-11-andrew.cooper3@citrix.com>
References: <20241108195820.789716-11-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All useful content has been moved elsewhere.

enable_apic_mode() and multi_timer_check() are empty stubs.  Remove their sole
callers and drop them.

apicid_to_node() and bios_cpu_apicid[] are entirely unused.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Adjust commit message.
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


