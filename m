Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF4A1ADA9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876503.1286932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yx-00012Z-9n; Thu, 23 Jan 2025 23:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876503.1286932; Thu, 23 Jan 2025 23:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yw-0000y9-W2; Thu, 23 Jan 2025 23:51:30 +0000
Received: by outflank-mailman (input) for mailman id 876503;
 Thu, 23 Jan 2025 23:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sz-0007hN-Q1
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:21 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b02e3f4-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:45:20 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f796586so16011705e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:20 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0f7sm6499935e9.28.2025.01.23.15.45.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:18 -0800 (PST)
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
X-Inumbo-ID: 1b02e3f4-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675920; x=1738280720; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLiVQy6/uYr9fS/vE5notUMei/mcFiOsSDRea34SIY0=;
        b=d0r20FJaOP8sF53di0wK8dZgus1XplMyHR0TD5DJ6D5EjB61yFz52RClr5HgjOvLG6
         3j+J2bKR7gIvn2R57HGQAUXvkOYSwuMo8yFGWfgRoNIfmx+187E6PJXlPYfqKXvj/7ab
         OF1GBXzednkjV8+DoJAZpSLPpJAdtV93TKOvOTwnAhFtpk4gxVw5S8sVXPDXv4iZVMDH
         gTNyEFMP06JChQB2ZwqqAUw40/RyGBpWjBJUmMoYboYJIq1I1CFjZ9BDib3XeyJ+a9FJ
         u9ieZRxYEqqdKd8xaGFMo18lPRma5a3NJPuvEGC/Cm49YbPwnvYI2f9qguWEZOqb/8eO
         qrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675920; x=1738280720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLiVQy6/uYr9fS/vE5notUMei/mcFiOsSDRea34SIY0=;
        b=XwEUwY1FA6CNIapzmjMKNNMq74TB13IbK80ys0V0TfPzGK5i3zYFjg/WWOdhL4bDV9
         FBMXQ/8iPePXElQVFXRFMecaLuJoaLrT9X8z6Az8G2MNc16hqxYkSQr9IWzDet7X8CU+
         ys6B2TewxLH6izK8KhWEg+xh7ezDroJjptGWnqf1dLpQQsW97xdpgblcgx/Il+q1Hofo
         vj9J+D9uF5DFtsJf0npne7+eKJeNAvP/YnmYuKVqnfCd2kYG19G7so9/kb5DW1do9zSe
         KHwJn6rpEPFcg1Cz1SKRvQ/pBoyOmmVZS+oR5X0tef6Bovow8Qn2OtlATSf31HZfZZRK
         n8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU6cX61DFk9qK3d8jpEHIXIYsnEyzJ4oC5Hj4Vi1rASlllCjuPgcAC0prC50JQxih5k7zBQxvY2urM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ5dH5S41BKu8p7T+jyn3wAqtM8yZtAyglG6PR77sCK6pSNW6o
	HYn/BnDd3Gye5tiSiwQORKe9aGhIgmtZjFJtHIHL+dFGjuG6tKlUtbk2xUK2rkc=
X-Gm-Gg: ASbGnctHLGmw6pWPCn3q7m5198H/tn6ZD5SpQKBGamcj4CnAYWCnIh/hbJ5QDYS8goJ
	gzfBMrS72+dq8wlboLL3fa1sanuhbSIyx5gp8S/n53K/4fngHwilC7akl0rKJrlUExeaizpV8XW
	cE+e46IjrhUXQ5JeVKyQcfEh5lsr82yU2TjMlt+gWjzQRVWZzsml1wFhoJ5jcNU/xNwxZcwbZH5
	VQrYdaxUH8T8ixtIW+5A/WG6miLJ6eufIAKEr4Fxg6AqFzLDC14XEyuIi9Mddq6rr+JIL9zgVMm
	K8PjreX7uSH+/8rxW3C4E4XLe36q9cPUzr5xuuxzx76GEONy9Snlk+w=
X-Google-Smtp-Source: AGHT+IHCUhXEKn4F81kx6ZpXqs9faqGpJN5W9Mj/EUJJpXYvZE3+gYqYLTjnf0hJ5kDL6XLUxlFm9g==
X-Received: by 2002:a05:600c:1913:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-43891453fa7mr280858325e9.29.1737675919693;
        Thu, 23 Jan 2025 15:45:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/20] accel: Rename 'hw/core/accel-cpu.h' -> 'accel/accel-cpu-target.h'
Date: Fri, 24 Jan 2025 00:44:05 +0100
Message-ID: <20250123234415.59850-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AccelCPUClass is for accelerator to initialize target specific
features of a vCPU. Not really related to hardware emulation,
rename "hw/core/accel-cpu.h" as "accel/accel-cpu-target.h"
(using the explicit -target suffix).

More importantly, target specific header often access the
target specific definitions which are in each target/FOO/cpu.h
header, usually included generically as "cpu.h" relative to
target/FOO/. However, there is already a "cpu.h" in hw/core/
which takes precedence. This change allows "accel-cpu-target.h"
to include a target "cpu.h".

Mechanical change doing:

 $  git mv include/hw/core/accel-cpu.h \
           include/accel/accel-cpu-target.h
 $  sed -i -e 's,hw/core/accel-cpu.h,accel/accel-cpu-target.h,' \
   $(git grep -l hw/core/accel-cpu.h)

and renaming header guard 'ACCEL_CPU_TARGET_H'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                                               | 2 +-
 include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} | 4 ++--
 accel/accel-target.c                                      | 2 +-
 cpu-target.c                                              | 2 +-
 target/i386/hvf/hvf-cpu.c                                 | 2 +-
 target/i386/kvm/kvm-cpu.c                                 | 2 +-
 target/i386/tcg/tcg-cpu.c                                 | 2 +-
 target/ppc/kvm.c                                          | 2 +-
 target/riscv/kvm/kvm-cpu.c                                | 2 +-
 target/riscv/tcg/tcg-cpu.c                                | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)
 rename include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} (95%)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa46d077d30..e4521852519 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -499,7 +499,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/accel.h
 F: include/system/accel-*.h
-F: include/hw/core/accel-cpu.h
+F: include/accel/accel-cpu-target.h
 F: accel/accel-*.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
diff --git a/include/hw/core/accel-cpu.h b/include/accel/accel-cpu-target.h
similarity index 95%
rename from include/hw/core/accel-cpu.h
rename to include/accel/accel-cpu-target.h
index 24dad45ab9e..0a8e518600d 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/accel/accel-cpu-target.h
@@ -8,8 +8,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef ACCEL_CPU_H
-#define ACCEL_CPU_H
+#ifndef ACCEL_CPU_TARGET_H
+#define ACCEL_CPU_TARGET_H
 
 /*
  * This header is used to define new accelerator-specific target-specific
diff --git a/accel/accel-target.c b/accel/accel-target.c
index 08626c00c2d..09c1e1053e0 100644
--- a/accel/accel-target.c
+++ b/accel/accel-target.c
@@ -27,7 +27,7 @@
 #include "qemu/accel.h"
 
 #include "cpu.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 
 #ifndef CONFIG_USER_ONLY
 #include "accel-system.h"
diff --git a/cpu-target.c b/cpu-target.c
index 75501a909df..f97f3a14751 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -44,7 +44,7 @@
 #include "exec/tb-flush.h"
 #include "exec/translation-block.h"
 #include "exec/log.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
 
diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
index 560b5a05940..b5f4c80028f 100644
--- a/target/i386/hvf/hvf-cpu.c
+++ b/target/i386/hvf/hvf-cpu.c
@@ -14,7 +14,7 @@
 #include "system/system.h"
 #include "hw/boards.h"
 #include "system/hvf.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "hvf-i386.h"
 
 static void hvf_cpu_max_instance_init(X86CPU *cpu)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 1bda403f88b..6269fa80452 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -15,7 +15,7 @@
 #include "hw/boards.h"
 
 #include "kvm_i386.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 
 static void kvm_set_guest_phys_bits(CPUState *cs)
 {
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index f09ee813ac9..b8aff825eec 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "helper-tcg.h"
 #include "qemu/accel.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "exec/translation-block.h"
 
 #include "tcg-cpu.h"
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 966c2c65723..216638dee40 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -49,7 +49,7 @@
 #include "elf.h"
 #include "system/kvm_int.h"
 #include "system/kvm.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 
 #include CONFIG_DEVICES
 
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 23ce7793594..7e4443c5bda 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -32,7 +32,7 @@
 #include "system/kvm_int.h"
 #include "cpu.h"
 #include "trace.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index e40c8e85b26..79345e4b89d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -30,7 +30,7 @@
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "hw/core/accel-cpu.h"
+#include "accel/accel-cpu-target.h"
 #include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg.h"
 #ifndef CONFIG_USER_ONLY
-- 
2.47.1


