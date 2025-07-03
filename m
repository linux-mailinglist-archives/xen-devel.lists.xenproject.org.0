Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5BAF7EFB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032338.1405999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNq6-0001XJ-3p; Thu, 03 Jul 2025 17:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032338.1405999; Thu, 03 Jul 2025 17:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNq6-0001Va-04; Thu, 03 Jul 2025 17:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1032338;
 Thu, 03 Jul 2025 17:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXNq4-0001VU-5K
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:35:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 112efdc0-5834-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 19:35:10 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4537fdec39fso408485e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:35:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1687196sm3427985e9.21.2025.07.03.10.35.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 10:35:08 -0700 (PDT)
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
X-Inumbo-ID: 112efdc0-5834-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751564109; x=1752168909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2RhrPiz7//vskyUlSGbSsu4uaU4qA0h0V9+uZJcvBs=;
        b=h3RSv9hQS4ApRwNdN3UDdddtZ0HVVRfcoufZhtPPGMBaYpLTLA0WSVclhoe5lb1wcM
         88Zjemyio/YuVnEkEagp3McbH7kPx2rGYpjfAbw11UAs1wHJKhypySMmsTNBVm2ASVO+
         8uG+wbeM1QNY6tfmb+nLVvQHqZu+l/osB1T4pJkDvZ/liwvjxHkwdHSD8Li8ZXEpzjbl
         ntOTEm6FEHtzuV9Wl/TsijL8YKqFE8iNMc3Rzl9svnQY3H2uCRRdYsciTDpcq54YLm2t
         dA1AMBBDOJywsegDXpw0TDScoyuGO0XF8WgFQa7CPZX3MAn7CAq/7StNrwyp/l1cKbXR
         B91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564109; x=1752168909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2RhrPiz7//vskyUlSGbSsu4uaU4qA0h0V9+uZJcvBs=;
        b=UXLXZwI/lnDToAkW9DEJEaqOeseHrZJiMTOVmGuDTee1Y6rzrrHJMaV1mib67RaeS5
         JU80+H6hIugv1xGJ3Z4yDvTAW3j39bv0sca5fUO7J2DhDS5VcIT51V0R59GL1xMdhwZ7
         t88AGDDngbh5ZcFgQbZCLz1hKU0andG2PgMa0Yft0iwsCeog5qNVvNpFYO6aJ91QyvQF
         ulTayK4PJCOmQzcJ9buXfAFayNRmQbCBxGC8wcE1phFO5bQpUAVAO0vVDwDkhMw/Qhib
         uFWGq2NEJcb4+mxV/NRZTWe+AONulcR2tZBAmtGcVM98o4Qqsnjgb5DTYqXpNrZjP38K
         /SLw==
X-Forwarded-Encrypted: i=1; AJvYcCVISTo3K81CqW/QSUosjHiyWGPItQM1RA9Cbx0nrBAz+E3cd5LSQpoBTnYkIZUVpoiN4zPsG0l36i4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLk/H9toJJ8TKH6mu512gut63ielk0SxWdFwJfmpML40JuN4Pg
	VvPxzJE5Aj7m7RlUY036LflXlOOA1kh6GGHsj02Xvm7mp6ga3fe415HXsZLUBiBd8d4=
X-Gm-Gg: ASbGncvdeLBmm7zLWt327zvnTbuH2B4hMA1waYhg39PkICxlCvSTzCKCrEyHsXbTnbn
	WcD/Udlm/ykbcy6j/DlVfme5p3bSyh3iPC2ZvdqgOK00t9QefX7sYhwRHiFnjwhXTyvJs6ejuRQ
	twdCzY/vc5LwRuVuQrmY5UOsmqlskNVUkJCVgNVc58smHD9AKLlaaXMpPdZzA79nyiayjFeQDDW
	7bgjgHq5XHMjK3rrSJ00YKarWQaN0mD86oT118r4LbEytGaevPe0tOr6gcPivdW5V/Ko2ieEwGI
	eTa2nGCqimy7lwkXlstyOVykObVFCT5rxyoW9Ek6f2vNwcuSRff4QM/BlTOOMPWYW/AkjqvhOhp
	sMtli23iEY581vlFqbn7/j/0jmvxhD2SVDFq7
X-Google-Smtp-Source: AGHT+IF/UA/DtD6lXjiLszACK+Pk1isaks747knolJ87gw1k/av0EcLUiE+/w969+nBtehLwL7opBQ==
X-Received: by 2002:a05:600c:3593:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-454a9c620e9mr53209265e9.2.1751564109257;
        Thu, 03 Jul 2025 10:35:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 26/39] accel/dummy: Extract 'dummy-cpus.h' header from 'system/cpus.h'
Date: Thu,  3 Jul 2025 19:32:32 +0200
Message-ID: <20250703173248.44995-27-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703173248.44995-1-philmd@linaro.org>
References: <20250703173248.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'dummy' helpers are specific to accelerator implementations,
no need to expose them via "system/cpus.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS           |  1 +
 accel/dummy-cpus.h    | 14 ++++++++++++++
 include/system/cpus.h |  5 -----
 accel/dummy-cpus.c    |  1 +
 accel/qtest/qtest.c   |  1 +
 accel/xen/xen-all.c   |  1 +
 6 files changed, 18 insertions(+), 5 deletions(-)
 create mode 100644 accel/dummy-cpus.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b1cbfe115bc..37d02b2313c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -503,6 +503,7 @@ F: include/system/accel-*.h
 F: include/system/cpus.h
 F: include/accel/accel-cpu*.h
 F: accel/accel-*.?
+F: accel/dummy-cpus.?
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
 F: cpu-common.c
diff --git a/accel/dummy-cpus.h b/accel/dummy-cpus.h
new file mode 100644
index 00000000000..d18dd0fdc51
--- /dev/null
+++ b/accel/dummy-cpus.h
@@ -0,0 +1,14 @@
+/*
+ * Dummy cpu thread code
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_DUMMY_CPUS_H
+#define ACCEL_DUMMY_CPUS_H
+
+void dummy_start_vcpu_thread(CPUState *cpu);
+
+#endif
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 3226c765d01..69be6a77a75 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -7,11 +7,6 @@ void cpus_register_accel(const AccelOpsClass *i);
 /* return registers ops */
 const AccelOpsClass *cpus_get_accel(void);
 
-/* accel/dummy-cpus.c */
-
-/* Create a dummy vcpu for AccelOpsClass->create_vcpu_thread */
-void dummy_start_vcpu_thread(CPUState *);
-
 /* interface available for cpus accelerator threads */
 
 /* For temporary buffers for forming a name */
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 867276144fa..03cfc0fa01e 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -17,6 +17,7 @@
 #include "qemu/guest-random.h"
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
+#include "accel/dummy-cpus.h"
 
 static void *dummy_cpu_thread_fn(void *arg)
 {
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 92bed9264ce..612cede160b 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -24,6 +24,7 @@
 #include "qemu/guest-random.h"
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
+#include "accel/dummy-cpus.h"
 
 static int64_t qtest_clock_counter;
 
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index de52a8f882a..c150dd43cab 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -18,6 +18,7 @@
 #include "hw/xen/xen_igd.h"
 #include "chardev/char.h"
 #include "qemu/accel.h"
+#include "accel/dummy-cpus.h"
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/xen.h"
-- 
2.49.0


