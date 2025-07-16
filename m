Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DB4B07C17
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 19:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045518.1415650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5ym-0002uT-RZ; Wed, 16 Jul 2025 17:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045518.1415650; Wed, 16 Jul 2025 17:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5ym-0002p7-Nz; Wed, 16 Jul 2025 17:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1045518;
 Wed, 16 Jul 2025 17:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc5yl-0002mM-63
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 17:31:39 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba0b5d5a-626a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 19:31:38 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so69784f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 10:31:38 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e68sm27048625e9.1.2025.07.16.10.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 10:31:36 -0700 (PDT)
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
X-Inumbo-ID: ba0b5d5a-626a-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752687097; x=1753291897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAO19gQnBoE7WVDxwvzlfnGuot/raaFCcBTWgczKVJ0=;
        b=Vz5VegGqRfsadbzjFPEHlCmhYsYA9/6f3yRpZcxeIuTrRP9z002y2kP5u8gaynTjQ8
         2oWMhoJ6zNaVPpUoYRHYc53pZkvh9yVb8fSauuorqLXq98jQI1qORUyKmiMa0v3GzfiA
         ku90CpDkBqaHy5iBFWuovfXvA/uHaMK8xGnpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752687097; x=1753291897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO19gQnBoE7WVDxwvzlfnGuot/raaFCcBTWgczKVJ0=;
        b=WmFolAbFOld9N3gdq+cbjuRt/q1PvpiIPjhEGhjl8fThrg9ZK4WTk6vuJlDH53+u4m
         v+t558dWO53ftKuDN42QlKYOCzdH6fN+5QlPie4Il8GVq1R60H44KzNUY5y2SIa9CZlu
         Q2XLoTJ7SE+1iQ+CgtVG/FTH25CeFEAK2hqbltv4XWVjiXSc8SGVqL5BFk7pqDcJpjfx
         C0gNhPkS0rpYirGf3RCwa2ko/LPhP0B3BDSofWOEOY9Wut+fbORGB8qVWtvTeQErrq2o
         CRdNgYFipuhIB4mstqZnQkWe2SZkCscfzdIo/KsgqRPQdNzXq1gq/l+uTdWIsLRFDwz3
         SrJw==
X-Gm-Message-State: AOJu0YzOVjWZ4Vm9y6GnEOcCPUZbpq4kNzo4D756E/cvYRxqutBFFo9s
	6khLpKfcBDZ4G6GRBpecvXkidcTE0nJJbDYNjVR9csUKVmARhD9Fc2o16NIIbbs96f/ghH8Erra
	qYIt7oIrDOQ==
X-Gm-Gg: ASbGncvXZ27fJ1/MsnLgeOrNz/PT+uE45lCDpdYofQ6jflYG5mNVLT8k+s09IVYW55N
	BZNn4RAtREB3M6guBbVzrQyW1QxZpgnW+Nf6fW90L19kXDzI4ZrLRFdmGmCoj9EkMG7kPph6m0a
	txGBJ5iAvPQ+4K9YX4JxVEHj4p4ipbF1KCv/McDEmjh7po1zC0cMVxF1ZRHGSfiNsmWauGAatXV
	QpvEopjg/3+kQq+MK0DxHMiAyDxwVPkYdCjpT7GV8JhRE3sAQ86XBiODmeHPyrCP8sqTG6R/QIg
	jS8VCi1fpjC3MKgVdhDM8a27WESIWg0mrgwmGVBQU7k87Ow7tBPfESrqLeN/rkw0K4fXv9iP5lA
	uSacJiRPL1egG/lBvTz1TZfmqeLrE7Ey6Z8Xc/M6sJXwR2h9FLUvMNzA6ow4AHwyRNlScSh8XR3
	9P
X-Google-Smtp-Source: AGHT+IE28/BnNOqiTvyAPZDQPuefbHWwadyUthjYXtd92J+8k3IwF4PxnXW3XlJUj3sSa4Hf9kiA7Q==
X-Received: by 2002:a05:6000:4404:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3b60dd54165mr2329935f8f.21.1752687096867;
        Wed, 16 Jul 2025 10:31:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/6] x86: Sort headers
Date: Wed, 16 Jul 2025 18:31:27 +0100
Message-Id: <20250716173132.2213891-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In intel.c, drop asm/mwait.h and asm/uaccess.h, neither of which are used.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c  |  3 ++-
 xen/arch/x86/apic.c           | 25 ++++++++++++-------------
 xen/arch/x86/cpu/intel.c      | 14 ++++++--------
 xen/arch/x86/cpu/mwait-idle.c |  6 ++++--
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 19f710f0dd9d..86f32fd9a6f0 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -45,7 +45,6 @@
 #include <xen/softirq.h>
 #include <xen/trace.h>
 
-#include <acpi/cpufreq/cpufreq.h>
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
 #include <asm/hpet.h>
@@ -55,6 +54,8 @@
 #include <asm/processor.h>
 #include <asm/spec_ctrl.h>
 
+#include <acpi/cpufreq/cpufreq.h>
+
 #include <public/platform.h>
 #include <public/sysctl.h>
 
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index bb86a1c161b3..a058c435878a 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -16,32 +16,31 @@
  *    Mikael Pettersson    :    PM converted to driver model.
  */
 
-#include <xen/perfc.h>
+#include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/kexec.h>
 #include <xen/mm.h>
 #include <xen/param.h>
+#include <xen/perfc.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
-#include <xen/delay.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
 
+#include <asm/apic.h>
+#include <asm/atomic.h>
+#include <asm/flushtlb.h>
+#include <asm/genapic.h>
+#include <asm/guest.h>
+#include <asm/hardirq.h>
 #include <asm/io-ports.h>
+#include <asm/io_apic.h>
 #include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
 #include <asm/microcode.h>
-#include <asm/msr.h>
-#include <asm/atomic.h>
 #include <asm/mpspec.h>
-#include <asm/flushtlb.h>
-#include <asm/hardirq.h>
-#include <asm/apic.h>
-#include <asm/io_apic.h>
-#include <asm/genapic.h>
-
-#include <xen/kexec.h>
-#include <asm/guest.h>
+#include <asm/msr.h>
 #include <asm/nmi.h>
 #include <asm/time.h>
 
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index f7bd0d777289..59b5828fa9e9 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -1,18 +1,16 @@
+#include <xen/bitops.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/sched.h>
-#include <xen/string.h>
-#include <xen/bitops.h>
 #include <xen/smp.h>
+#include <xen/string.h>
 
-#include <asm/intel-family.h>
-#include <asm/processor.h>
-#include <asm/msr.h>
-#include <asm/mwait.h>
-#include <asm/uaccess.h>
-#include <asm/mpspec.h>
 #include <asm/apic.h>
 #include <asm/i387.h>
+#include <asm/intel-family.h>
+#include <asm/mpspec.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
 #include <asm/trampoline.h>
 
 #include "cpu.h"
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 9ee54c625a90..c733a672d1e0 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -42,18 +42,20 @@
 /* un-comment DEBUG to enable pr_debug() statements */
 #define DEBUG
 
-#include <xen/lib.h>
 #include <xen/cpu.h>
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <xen/param.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+
 #include <asm/cpuidle.h>
 #include <asm/hpet.h>
 #include <asm/intel-family.h>
-#include <asm/mwait.h>
 #include <asm/msr.h>
+#include <asm/mwait.h>
 #include <asm/spec_ctrl.h>
+
 #include <acpi/cpufreq/cpufreq.h>
 
 #define MWAIT_IDLE_VERSION "0.4.1"
-- 
2.39.5


