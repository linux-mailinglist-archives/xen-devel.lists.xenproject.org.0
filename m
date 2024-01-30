Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1652D84213A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 11:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673290.1047625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUlKx-0007BC-KF; Tue, 30 Jan 2024 10:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673290.1047625; Tue, 30 Jan 2024 10:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUlKx-00078N-HG; Tue, 30 Jan 2024 10:27:27 +0000
Received: by outflank-mailman (input) for mailman id 673290;
 Tue, 30 Jan 2024 10:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUlKw-00075d-HD
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 10:27:26 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28d72c99-bf5a-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 11:27:25 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e8fec0968so44914335e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 02:27:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0040faf3df118sm494063wmq.32.2024.01.30.02.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:27:23 -0800 (PST)
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
X-Inumbo-ID: 28d72c99-bf5a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706610444; x=1707215244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ygxe54Oc/vFuzE6cnM13pQ0IrBJU0/x6Xb08+E2WI5A=;
        b=mxpQrlV3MdTW3Qoy4/u8I3AsH1lIocVaPt9IOX3cUnBVGpAA7sed7X2SFFZV4qQ5ML
         GFlXL9gEgCcB8kUXClh2mXCRQMB3lOxaT6EjT7aFgqKDesnIAVsvDH3ZE0ZfbnGJZT4+
         XG2ZZK1aMdtGvuaSr6jhMgCFl/wPIws/43X1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610444; x=1707215244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ygxe54Oc/vFuzE6cnM13pQ0IrBJU0/x6Xb08+E2WI5A=;
        b=H3u+jvrOUTfAR8l5jLKyF4J0VFf24HRKZx508hY8IbqvX9xF3iZ18e5fziEo/9Aab8
         Yr0ok0griKn0JE/cgwWYLghcWOB7anic5w3NzoU7T5/KS8jD7SOcfbB31l04DnBiYBU1
         OqztxZxDYR9+CC+2qcREWHLQSUhXDjelGD5K2gjY3zxZ0ojOsjwq7p1NLsVblBbt/0uD
         tqMzMxY/RcRJb4acf4guQk0C1ZP6XO8yvxhcp/sFafVLl61XbgshgCT4NRWGBz7/Kc+p
         j3Ox4fE5H/gUNGroM22YLCPvCi4RhIRuG78n0sA/JKEnLVUttigRGd/yKVzSiGE9Yj7t
         vNWA==
X-Gm-Message-State: AOJu0YwbADb3WVEyPP7TxrXwGeHjFUD4SxiGAwKibzEwR5K2m8w7EPud
	i+qOFSTJZgH6/teFwm+CGyt2uzngmc++4DeMpr/ePL0FJJ+Kzg6gqTHMcrMVT4+Xvsu5+CSLLEF
	6
X-Google-Smtp-Source: AGHT+IH/y21ecbbJBQGgnFww+l9ax8d5rBE56KK6xIIDCWEN5QIrQqzBH/oHfulTGwUB+HKYOtRIvA==
X-Received: by 2002:a05:600c:468d:b0:40f:4b78:7d4b with SMTP id p13-20020a05600c468d00b0040f4b787d4bmr600767wmo.41.1706610444127;
        Tue, 30 Jan 2024 02:27:24 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] XTF: tests SPEC_CTRL added bits
Date: Tue, 30 Jan 2024 11:27:19 +0100
Message-ID: <20240130102719.51150-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130091400.50622-1-roger.pau@citrix.com>
References: <20240130091400.50622-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dummy set/clear tests for additional spec_ctrl bits.
---
 docs/all-tests.dox  |   2 +
 tests/test/Makefile |   9 ++++
 tests/test/main.c   | 100 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 tests/test/Makefile
 create mode 100644 tests/test/main.c

diff --git a/docs/all-tests.dox b/docs/all-tests.dox
index 892a9e474743..5a66ac252ea5 100644
--- a/docs/all-tests.dox
+++ b/docs/all-tests.dox
@@ -187,3 +187,5 @@ states.
 
 @subpage test-nested-vmx - Nested VT-x tests.
 */
+# Placeholder: Merge into the appropriate location above
+@subpage test-test - @todo title
diff --git a/tests/test/Makefile b/tests/test/Makefile
new file mode 100644
index 000000000000..19bc4b6a4639
--- /dev/null
+++ b/tests/test/Makefile
@@ -0,0 +1,9 @@
+include $(ROOT)/build/common.mk
+
+NAME      := test
+CATEGORY  := utility
+TEST-ENVS := hvm32 pv64
+
+obj-perenv += main.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/test/main.c b/tests/test/main.c
new file mode 100644
index 000000000000..9a25e95d91b7
--- /dev/null
+++ b/tests/test/main.c
@@ -0,0 +1,100 @@
+/**
+ * @file tests/test/main.c
+ * @ref test-test
+ *
+ * @page test-test test
+ *
+ * @todo Docs for test-test
+ *
+ * @see tests/test/main.c
+ */
+#include <xtf.h>
+
+#define MSR_SPEC_CTRL                       0x00000048
+#define  SPEC_CTRL_IPRED_DIS_U              (_AC(1, ULL) <<  3)
+#define  SPEC_CTRL_IPRED_DIS_S              (_AC(1, ULL) <<  4)
+#define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
+#define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
+#define  SPEC_CTRL_DDP_DIS_U                (_AC(1, ULL) <<  8)
+#define  SPEC_CTRL_BHI_DIS_S                (_AC(1, ULL) << 10)
+
+const char test_title[] = "SPEC_CTRL";
+
+static void update_spec_ctrl(uint64_t mask, bool set)
+{
+    uint64_t spec_ctrl = rdmsr(MSR_SPEC_CTRL);
+
+    if ( set )
+        spec_ctrl |= mask;
+    else
+        spec_ctrl &= ~mask;
+
+    wrmsr(MSR_SPEC_CTRL, spec_ctrl);
+}
+
+static void assert_spec_ctrl(uint64_t mask, bool set)
+{
+    uint64_t spec_ctrl = rdmsr(MSR_SPEC_CTRL);
+
+    if ( (spec_ctrl & mask) != (set ? mask : 0) )
+    {
+        xtf_failure("SPEC_CTRL expected: %#" PRIx64 " got: %#" PRIx64 "\n",
+                    set ? (spec_ctrl | mask) : (spec_ctrl & ~mask),
+                    spec_ctrl);
+        xtf_exit();
+    }
+}
+
+static void test_loop(uint64_t mask)
+{
+    update_spec_ctrl(mask, true);
+    assert_spec_ctrl(mask, true);
+    /* Ensure context switch to Xen. */
+    hypercall_yield();
+    assert_spec_ctrl(mask, true);
+
+    update_spec_ctrl(mask, false);
+    assert_spec_ctrl(mask, false);
+    /* Ensure context switch to Xen. */
+    hypercall_yield();
+    assert_spec_ctrl(mask, false);
+}
+
+void test_main(void)
+{
+    static const struct {
+        const char *name;
+        unsigned int feat;
+        uint64_t mask;
+    } tests[] = {
+        { "IPRED CTRL", 1, SPEC_CTRL_IPRED_DIS_U | SPEC_CTRL_IPRED_DIS_S },
+        { "RRSBA CTRL", 2, SPEC_CTRL_RRSBA_DIS_U | SPEC_CTRL_RRSBA_DIS_S },
+        { "DDP DIS", 3, SPEC_CTRL_DDP_DIS_U },
+        { "BHI DIS", 4, SPEC_CTRL_BHI_DIS_S },
+    };
+    unsigned int i;
+    uint32_t regs[4];
+
+    cpuid_count(7, 2, &regs[0], &regs[1], &regs[2], &regs[3]);
+
+    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
+    {
+        if ( !test_bit(tests[i].feat, &regs[3]) )
+            continue;
+
+        printk("Testing %s\n", tests[i].name);
+        test_loop(tests[i].mask);
+    }
+
+    xtf_success(NULL);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


