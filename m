Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDF5AF621B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 20:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031468.1405281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2fY-0004JX-2C; Wed, 02 Jul 2025 18:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031468.1405281; Wed, 02 Jul 2025 18:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2fX-0004I5-VK; Wed, 02 Jul 2025 18:58:55 +0000
Received: by outflank-mailman (input) for mailman id 1031468;
 Wed, 02 Jul 2025 18:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2fW-0004Hv-Bm
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 18:58:54 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c60b45-5776-11f0-a314-13f23c93f187;
 Wed, 02 Jul 2025 20:58:51 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so51372495e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 11:58:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bde8c8sm5752785e9.31.2025.07.02.11.58.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 11:58:50 -0700 (PDT)
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
X-Inumbo-ID: 97c60b45-5776-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482731; x=1752087531; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uXIn8FF+VzmPqfa1+8428fM/RDSExpMjk/8h5CzpzY=;
        b=WMP1Ulw3Q+AUWOsmm6jmIeO7CTqliVar2CQJOEODqph1+s07Yt/o6GSYrJ0m1Oo83d
         Lvq545q5VOj5B84Rhp9bttCgKiPp4HASUZFX0sfVJnzaVu+ViWJ6LmKivi/aX+uRIxUN
         v/ksexD8VcqwmKNsYYzv6SAYRgM85nulouS4g1j8+9ZJTMRtM5xBbCpQnRrhrZ6M4UBR
         biDpNI/7ROhPcEGanguHlNkcGLXgQ2K4wvWUFfxL6BJqhQJ5h01H27fG5S8gEjrGP8QX
         UE+sUsS5XlJpK2ezV/iovpZsbzqq1yE8nZ1XwyCVpGN99G3PQZVrsgp/nSlMz5n3mHZT
         pTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482731; x=1752087531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uXIn8FF+VzmPqfa1+8428fM/RDSExpMjk/8h5CzpzY=;
        b=h50O39nScu8hz3sXZ97pTKvLrXuny4cjfsbPq6SWJ8jM06tJgOofpTEHsmouRzsZJt
         tx1OMGCzxHouX/6IOtrEF/XRYyjNv9syaLsmTvPUX4UvETUV37DfDTZTOUb1gTP7osxa
         nHS/BNYjQKzPn/8e3AOy+3VWkRIcIOhd+Xsc9rb9qoMYQClYUM+Mbl8iigH8Hsprj/Zd
         BK8r8TqmpZLcwdi3U3dhiVUoMUyUehswluJXG2fYKYohd3YfXLRVxLblX72xhcoeme9s
         vqTXTiz/i+otCuJNcYnhJstDLaMZjp2Z/pDs7sB87EfSKQUdNkpS4EijHur0Md5Ifo/D
         KYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDoq0oc3hchZiqSbCmQtP3lrlwfVnSSDz3sQVYwJMvALMy7AArBeoE4dAvSu+syzCasOXpJt5P/0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIc+apCcxsHv6ZmCxOmrgwU7NzL6MQwSF54gUepP2wEkBydEDl
	m0fn0dDIaG7Z6M56OK+figtVBV44EF2FHH1F+ixHCPK21mjfSjsoJtwQ2w4FEYquJSI=
X-Gm-Gg: ASbGncv5b0qiPw5x8BnuFp6+9prgFjKrTXdxO8ibIjFEdFyb3El8Ja+NFH1ggKz8Hfh
	s51EoWFuVIgjxTV57Cu1U1584wX+htcjYIC1qwAFFoK/jtV3YH642CYGSfKF9vyohnp4dX/rtyX
	97/N+S0//dDl83aEr0gU1kYSL6Bbw19E2waXC/z6HAmitBzNetclv1xY35OAb9kI9yx5WcmTD9e
	x333h467bSYiNANqQ5niwkWb1ZlWDEGJcrnj+olrOHbgssHq0dFSWkU8eCQJsKMqOC90gjy4tGQ
	IDw6TJMfqIkrGN1dcpr+mBWd8+MyyiQAAUYL0q3RS5S2r6x2pgvek7QOMOIQgMamTD5dNsIZkQ1
	aR3L4TjFXEUKJy7mpeqWkP5f8ewAQ7HuCgL2D
X-Google-Smtp-Source: AGHT+IFcMaxcXN6l1JR93v82qQ/msbA7irNVRKuh7yXLBPpeLwsnRwam4h/82zJfO73D3dwnTRf+qw==
X-Received: by 2002:a05:600c:3504:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-454a36e7842mr36633135e9.7.1751482730663;
        Wed, 02 Jul 2025 11:58:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 43/65] accel/dummy: Extract 'dummy-cpus.h' header from 'system/cpus.h'
Date: Wed,  2 Jul 2025 20:53:05 +0200
Message-ID: <20250702185332.43650-44-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
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


