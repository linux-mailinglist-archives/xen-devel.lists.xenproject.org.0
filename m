Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0689C2648
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832904.1248229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VKx-0003LT-WA; Fri, 08 Nov 2024 20:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832904.1248229; Fri, 08 Nov 2024 20:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VKx-0003Jj-TM; Fri, 08 Nov 2024 20:12:07 +0000
Received: by outflank-mailman (input) for mailman id 832904;
 Fri, 08 Nov 2024 20:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9VKw-0002pM-FS
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:12:06 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8ae5d35-9e0d-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 21:12:04 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cacb76e924so3676047a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 12:12:04 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d7e6sm2334739a12.14.2024.11.08.12.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:12:00 -0800 (PST)
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
X-Inumbo-ID: b8ae5d35-9e0d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI4YWU1ZDM1LTllMGQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk2NzI0LjM3MjQwNCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731096723; x=1731701523; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90OoYiFeZ5rMxk+cdK/xirLCI8U4EbCancSqXIxcb6s=;
        b=fHHlrgHOgis8Tq3by1YpR8QUm8PvqvSecKL/zDhMqj/t1yN2yD68kCEnY77y2B+AXN
         45W8zjtIxwvrLiWGgt1aXfhcbyXCRWG72wfitbLqyANsg6SYkvjGsz3+BeW4T8VM8kJi
         TP10XK5mMb0qr7Bvlk51wJm5C5vsHB77Yd0Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096723; x=1731701523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90OoYiFeZ5rMxk+cdK/xirLCI8U4EbCancSqXIxcb6s=;
        b=cWdIYwYZlt8kbezquOk44RJgNsmNovmWflj6JJlc9Rs7KK8WGR5sbgu6e+xaKM4DF+
         uMog3L6wr0RMVaMjAQle3Mu4OWPjhH+1YUmZ/gzxi0kwMY2cFYSBXOf/b+jgK+KpTE6L
         Dhi/QjfEHpc2eEtsJJgSffe4MgNu2wI3WL6Yrlz/+eR7qTRKvmTaAiUAWVPxQYYYPByW
         CyHgRqmL3Mroe8+kJpLKqwsOyLsc8Efz63hrwcikdoXYIlJHaNNORZ97v4t/e++m5ti5
         jstVIs4OO0wlZTd22kvRz6s8yLQMk5S/gSxW4DnrU7dqFiKmLWgJAggAEhuc+f4sIttz
         yIHg==
X-Gm-Message-State: AOJu0Yz0qMFaLiW5lW2kM8FgqWIwrZSsZHMIjL3DE+R/qZ+B0JiEFxYa
	qTt/40vt7/CYAzNvwohWq4tHSqGOSxNPkOpbKy6WNJ4jOU55IsrdLeFU8nthcarkXAv+eFHDbBW
	u
X-Google-Smtp-Source: AGHT+IFKIlWbL97/gpKNq8zVpa0Fzo1LE/X0eiolV45FBf4cIPPR1IZTZALCEkK/TS0ZU8Tz4N9xtw==
X-Received: by 2002:a05:6402:3510:b0:5cf:9f6:1c01 with SMTP id 4fb4d7f45d1cf-5cf0a44744bmr3451673a12.25.1731096722763;
        Fri, 08 Nov 2024 12:12:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86: Move mach-default/io_ports.h to asm/io-ports.h
Date: Fri,  8 Nov 2024 20:11:45 +0000
Message-Id: <20241108201147.812036-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108201147.812036-1-andrew.cooper3@citrix.com>
References: <20241108201147.812036-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

intercept.c and msi.c don't even need this header.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/apic.c                                             | 2 +-
 xen/arch/x86/dom0_build.c                                       | 2 +-
 xen/arch/x86/hvm/intercept.c                                    | 1 -
 xen/arch/x86/i8259.c                                            | 2 +-
 .../x86/include/asm/{mach-default/io_ports.h => io-ports.h}     | 0
 xen/arch/x86/io_apic.c                                          | 2 +-
 xen/arch/x86/msi.c                                              | 1 -
 xen/arch/x86/time.c                                             | 2 +-
 8 files changed, 5 insertions(+), 7 deletions(-)
 rename xen/arch/x86/include/asm/{mach-default/io_ports.h => io-ports.h} (100%)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 8e8ff4d155ff..bb86a1c161b3 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -27,6 +27,7 @@
 #include <xen/smp.h>
 #include <xen/softirq.h>
 
+#include <asm/io-ports.h>
 #include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
 #include <asm/microcode.h>
@@ -39,7 +40,6 @@
 #include <asm/io_apic.h>
 #include <asm/genapic.h>
 
-#include <io_ports.h>
 #include <xen/kexec.h>
 #include <asm/guest.h>
 #include <asm/nmi.h>
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8d56705a0861..72747b92475a 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -16,11 +16,11 @@
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
 #include <asm/hpet.h>
+#include <asm/io-ports.h>
 #include <asm/io_apic.h>
 #include <asm/p2m.h>
 #include <asm/setup.h>
 #include <asm/spec_ctrl.h>
-#include <io_ports.h>
 
 struct memsize {
     long nr_pages;
diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index 8f82b82b0723..da22c386763e 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -17,7 +17,6 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <asm/current.h>
-#include <io_ports.h>
 #include <xen/event.h>
 #include <xen/iommu.h>
 
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index a14f20bdf676..5c7e21a7515c 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -19,9 +19,9 @@
 #include <xen/delay.h>
 #include <asm/apic.h>
 #include <asm/asm_defns.h>
+#include <asm/io-ports.h>
 #include <asm/irq-vectors.h>
 #include <asm/setup.h>
-#include <io_ports.h>
 
 /*
  * This is the 'legacy' 8259A Programmable Interrupt Controller,
diff --git a/xen/arch/x86/include/asm/mach-default/io_ports.h b/xen/arch/x86/include/asm/io-ports.h
similarity index 100%
rename from xen/arch/x86/include/asm/mach-default/io_ports.h
rename to xen/arch/x86/include/asm/io-ports.h
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 12cc4a561d14..d44d2c9a4173 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -34,6 +34,7 @@
 #include <asm/apic.h>
 #include <asm/genapic.h>
 #include <asm/hpet.h>
+#include <asm/io-ports.h>
 #include <asm/io_apic.h>
 #include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
@@ -42,7 +43,6 @@
 #include <asm/msi.h>
 #include <asm/setup.h>
 
-#include <io_ports.h>
 #include <public/physdev.h>
 #include <xen/trace.h>
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index be5ef99e088f..fa724911928e 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -33,7 +33,6 @@
 #include <asm/fixmap.h>
 #include <asm/p2m.h>
 
-#include <io_ports.h>
 #include <public/physdev.h>
 #include <xen/iommu.h>
 #include <xsm/xsm.h>
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index bc9f26594103..a9aa335d7c9f 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -39,7 +39,7 @@
 #include <asm/div64.h>
 #include <asm/acpi.h>
 #include <asm/hpet.h>
-#include <io_ports.h>
+#include <asm/io-ports.h>
 #include <asm/setup.h> /* for early_time_init */
 #include <public/arch-x86/cpuid.h>
 
-- 
2.39.5


