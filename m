Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DEAF713F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031991.1405751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHfc-0003yH-9E; Thu, 03 Jul 2025 11:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031991.1405751; Thu, 03 Jul 2025 11:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHfc-0003uj-6R; Thu, 03 Jul 2025 11:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1031991;
 Thu, 03 Jul 2025 10:59:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXHfa-0003ud-VW
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:59:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daf9f58c-57fc-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 12:59:56 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a522224582so4093008f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:59:56 -0700 (PDT)
Received: from localhost.localdomain ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fadf3sm18662688f8f.34.2025.07.03.03.59.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 03:59:55 -0700 (PDT)
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
X-Inumbo-ID: daf9f58c-57fc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540396; x=1752145196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uXIn8FF+VzmPqfa1+8428fM/RDSExpMjk/8h5CzpzY=;
        b=zriLINqYOnqt7FyQuBfEZLt8TXG9XXSpAS/vtioCF1sYF0H/vIZ+NTDhJhM1tp0Ezg
         I8GS3sC/kDc12ki9HVW/z/b5Ss3JexdfcLhZq7PLaAxQtFd70FMyLH//PCabQ9Os21dg
         630zCIUfel5XkKj5ZJgUidwQaZ2l9uQAHMWELcmrawWg3vRCXK3gdJTxMOHrGkw1qirt
         R2yGbTbBROjmlSCsk9+zo0zj1o5dynVMzyaEbZrTD5HgDaSgM+n3jX68bAdPyiIdrAg8
         OD5917eX4GX6mpkXajZXCaidjPKaF9grXo/t9u0kVQQKrE5xPDP2b2mdQ+35P4JQ/XkI
         w33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540396; x=1752145196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uXIn8FF+VzmPqfa1+8428fM/RDSExpMjk/8h5CzpzY=;
        b=q28wg7ih8vYZJ8KiVzGifXgrsr6PcWl/6WJb2r0m7wcQ6c+TdaW70JkL+FBUjB12Jp
         lDc64iv8DqKC2XIyJlLXd4x/xlawEPrPN4+5IBReDN/U0xEiMSPnx8pM6iNEd+bPzdxG
         AzJrP++HEbeQXErXK2kOjXLcP5hCW/6p/m5mGwiBoXtNW4E1jt0XDU3bWRNsaAEnHXJD
         PZ9cjXi4Q9XMUv5Kdv1FhO4QkbiqUjfdoQx+dQWUvNZolbHHt8kt3B+wjuGyc+bl2FaJ
         9L/Fg5L8SoD0MyZD7sOl/07uecNpRt3fMfN567Nyk89yzW5YeyLbuvZczseajknDRu1e
         xJSw==
X-Forwarded-Encrypted: i=1; AJvYcCXpBL2CIy2IMoVuAF33SjHrJ2elGnaiERyPz3KTfugY+S5PoNyWtDn6xMpSQfoHLY6noFaP8yCZL6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydHEXZ0k1188S6bThdpj2MqBEuVYBraCe81zG+91NhWeLO0TiX
	F1I3yuKLIjTmYov0Z5dNFwHuxmJcjW7Pd9Ur8mBsmP19qRaqV+ELRPl8/3DOwgYpjts=
X-Gm-Gg: ASbGncvDbe9Pm6sx6S0upY6nsP4qAjH4G7PGkfZYRJI4XWob4mvnObj31Sj5a0SqxFG
	lZ8XxUnIbf1iCk0oFel47x9mswrZ0ZC+NXeIc1SGWlGh8dEB8KrA3MKlkGCPp+YMv9wLY6axl/i
	9tY4MvN1RywI6q1VgEAO2f6thvg4w9fCnG6HXwXFjkuN/ALZ0JD+FaSMJe0Vt1E+SKltpB/603N
	chgTr4izhd8KGH5ZwZhw9W34bMP7G90eXILnMgvKAuN54r60OOnsrZf5J7ecTV5Hh7B1GBJ5SQf
	6K46x80GOyacwD5lnXqRZQKd7cXbfx+RUCZ3nRd4QDHDAwnKfkhaasuNlSua+nmHnynhOkmEZ3g
	N+NgafzdBD/A=
X-Google-Smtp-Source: AGHT+IGkl7DBEVSrsarAakeoJRDOUyErzjUrrwRi8jgXThFkNvPPbLQTGnxMgTtTTTxzMt5tQq0f5g==
X-Received: by 2002:a5d:6f02:0:b0:3a5:2575:6b45 with SMTP id ffacd0b85a97d-3b32f666124mr2129038f8f.48.1751540396119;
        Thu, 03 Jul 2025 03:59:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 48/69] accel/dummy: Extract 'dummy-cpus.h' header from 'system/cpus.h'
Date: Thu,  3 Jul 2025 12:55:14 +0200
Message-ID: <20250703105540.67664-49-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'dummy' helpers are specific to accelerator implementations,
no need to expose them via "system/cpus.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/dummy-cpus.h    | 14 ++++++++++++++
 include/system/cpus.h |  5 -----
 accel/dummy-cpus.c    |  1 +
 accel/qtest/qtest.c   |  1 +
 accel/xen/xen-all.c   |  1 +
 5 files changed, 17 insertions(+), 5 deletions(-)
 create mode 100644 accel/dummy-cpus.h

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
index 8b109d4c03b..2606fe97b49 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -24,6 +24,7 @@
 #include "qemu/guest-random.h"
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
+#include "accel/dummy-cpus.h"
 
 static int64_t qtest_clock_counter;
 
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index ba752bbe5de..f412ea346bb 100644
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


