Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4587D33E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693990.1082726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwp-0006ur-Jk; Fri, 15 Mar 2024 18:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693990.1082726; Fri, 15 Mar 2024 18:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwp-0006q7-GM; Fri, 15 Mar 2024 18:06:27 +0000
Received: by outflank-mailman (input) for mailman id 693990;
 Fri, 15 Mar 2024 18:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwn-0005yW-Rl
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:25 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc33c8d-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:25 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so28946081fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:22 -0700 (PDT)
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
X-Inumbo-ID: bcc33c8d-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525984; x=1711130784; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG3msNYRo0R9LmvVapMrH1VBiKyep4RKTNNpLZUcFSg=;
        b=HQMq3zyIHg6lQtWnD0cYIQ08wLZRqY3TUUoYiElXgLkso8ilRWhio7bIUUrNZug2hE
         xMhGiTJHHvVZB+RQEwTMxuMA0qF9scZZKVMdErql+FWHj0vC0X7p1zpfFndRLRDnf+xV
         WqnvR6A5A/JT7YkrNM0fXAkjoidthKVD86m3d6kmKCIP3laTJarNiVR7nn6lsFZZDoLX
         A4kIcNtPd67zZGczyP6j1TNKI/yozZlpZno05djpCZKwISxvxKi+0Kgd2MT9D69b3nzR
         Ru1E6IEegTgG412WVw0B93TcYWMgXHXaVUPbCB29t8FqToCVFbfjQfiVlCE/444BYLLL
         dMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525984; x=1711130784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG3msNYRo0R9LmvVapMrH1VBiKyep4RKTNNpLZUcFSg=;
        b=se2Yw2CV/FTAlioj41ON9jAqmaUT/bGpvkekO4YsXAiwhmq8wjOxIK9l9jqYgg4mFd
         HfoFfU9thpaHc0qWdih99iPOTmQ6GBV3to52fZSqvefdXr1Pxn706UmgmmG/7Y6dXbXz
         xhYSycd0s2s5OhjopqF12qQW5h6k/vmUbgch3mk5Shfc+1kznbQA2ZUUCQ5v9uuPJCvm
         4pudoP2w57PwIxhHWn6oW+v7YoIHbHYsfnDkh81lURUq7U1ODyAur3KogZ3G4lXrrMKy
         lShEJGnQm7c7yPq+TQ+ABwK9Wa2Zps+k76FS0v4e1UXvXvi4Toz1a5ZmfLo+tnDGiL0A
         rPwQ==
X-Gm-Message-State: AOJu0YwWTWMWgKCUl4C5UL5GIHrOS0DKujpIUuy0EFq/+opIeOQUeL14
	8wpq/rGyVLuicEPkCK/qYVs97vFdsBKQZrq3iEC684OgGvfzdsMNAT/kcfiMxws=
X-Google-Smtp-Source: AGHT+IER1qGM0C2g3OstU5cOLa+nT5EL75+B1RORH7m39YFrVWH7RrPkHs/GjfPERvRLRxUa7iHGhQ==
X-Received: by 2002:a2e:9b07:0:b0:2d3:8b2:6885 with SMTP id u7-20020a2e9b07000000b002d308b26885mr2522340lji.49.1710525984085;
        Fri, 15 Mar 2024 11:06:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 04/20] xen/asm-generic: introduce generic non-atomic test_*bit()
Date: Fri, 15 Mar 2024 19:06:00 +0100
Message-ID: <48b7dfafccc7a0ed814b5dfb0f109a0473a1b4b4.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces the following generic functions:
* test_bit
* generic___test_and_set_bit
* generic___test_and_clear_bit
* generic___test_and_change_bit

Also, the patch introduces the following generics which are
used by the functions mentioned above:
* BITOP_BITS_PER_WORD
* BITOP_MASK
* BITOP_WORD
* BITOP_TYPE

These functions and macros can be useful for architectures
that don't have corresponding arch-specific instructions.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V6:
  - Nothing changed ( only rebase )
---
 Changes in V5:
   - new patch
---
 xen/include/asm-generic/bitops/bitops-bits.h  | 21 +++++
 .../asm-generic/bitops/generic-non-atomic.h   | 89 +++++++++++++++++++
 xen/include/asm-generic/bitops/test-bit.h     | 18 ++++
 3 files changed, 128 insertions(+)
 create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
 create mode 100644 xen/include/asm-generic/bitops/generic-non-atomic.h
 create mode 100644 xen/include/asm-generic/bitops/test-bit.h

diff --git a/xen/include/asm-generic/bitops/bitops-bits.h b/xen/include/asm-generic/bitops/bitops-bits.h
new file mode 100644
index 0000000000..4ece2affd6
--- /dev/null
+++ b/xen/include/asm-generic/bitops/bitops-bits.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_BITS_H_
+#define _ASM_GENERIC_BITOPS_BITS_H_
+
+#ifndef BITOP_BITS_PER_WORD
+#define BITOP_BITS_PER_WORD     32
+#endif
+
+#ifndef BITOP_MASK
+#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
+#endif
+
+#ifndef BITOP_WORD
+#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
+#endif
+
+#ifndef BITOP_TYPE
+typedef uint32_t bitops_uint_t;
+#endif
+
+#endif /* _ASM_GENERIC_BITOPS_BITS_H_ */
diff --git a/xen/include/asm-generic/bitops/generic-non-atomic.h b/xen/include/asm-generic/bitops/generic-non-atomic.h
new file mode 100644
index 0000000000..02d5721bfe
--- /dev/null
+++ b/xen/include/asm-generic/bitops/generic-non-atomic.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * The file is based on Linux ( 6.4.0 ) header:
+ *   include/asm-generic/bitops/generic-non-atomic.h
+ * 
+ * Only functions that can be reused in Xen were left; others were removed.
+ * 
+ * Also, the following changes were done:
+ *  - it was updated the message inside #ifndef ... #endif.
+ *  - __always_inline -> always_inline to be align with definition in
+ *    xen/compiler.h.
+ *  - update function prototypes from
+ *    generic___test_and_*(unsigned long nr nr, volatile unsigned long *addr) to
+ *    generic___test_and_*(unsigned long nr, volatile void *addr) to be
+ *    consistent with other related macros/defines.
+ *  - convert identations from tabs to spaces.
+ *  - inside generic__test_and_* use 'bitops_uint_t' instead of 'unsigned long'
+ *    to be generic.
+ */
+
+#ifndef __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
+#define __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
+
+#include <xen/compiler.h>
+
+#include <asm-generic/bitops/bitops-bits.h>
+
+#ifndef XEN_BITOPS_H
+#error only <xen/bitops.h> can be included directly
+#endif
+
+/*
+ * Generic definitions for bit operations, should not be used in regular code
+ * directly.
+ */
+
+/**
+ * generic___test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+generic___test_and_set_bit(unsigned long nr, volatile void *addr)
+{
+    bitops_uint_t mask = BITOP_MASK(nr);
+    bitops_uint_t *p = ((bitops_uint_t *)addr) + BITOP_WORD(nr);
+    bitops_uint_t old = *p;
+
+    *p = old | mask;
+    return (old & mask) != 0;
+}
+
+/**
+ * generic___test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+generic___test_and_clear_bit(bitops_uint_t nr, volatile void *addr)
+{
+    bitops_uint_t mask = BITOP_MASK(nr);
+    bitops_uint_t *p = ((bitops_uint_t *)addr) + BITOP_WORD(nr);
+    bitops_uint_t old = *p;
+
+    *p = old & ~mask;
+    return (old & mask) != 0;
+}
+
+/* WARNING: non atomic and it can be reordered! */
+static always_inline bool
+generic___test_and_change_bit(unsigned long nr, volatile void *addr)
+{
+    bitops_uint_t mask = BITOP_MASK(nr);
+    bitops_uint_t *p = ((bitops_uint_t *)addr) + BITOP_WORD(nr);
+    bitops_uint_t old = *p;
+
+    *p = old ^ mask;
+    return (old & mask) != 0;
+}
+
+#endif /* __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H */
diff --git a/xen/include/asm-generic/bitops/test-bit.h b/xen/include/asm-generic/bitops/test-bit.h
new file mode 100644
index 0000000000..6fb414d808
--- /dev/null
+++ b/xen/include/asm-generic/bitops/test-bit.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
+#define _ASM_GENERIC_BITOPS_TESTBIT_H_
+
+#include <asm-generic/bitops/bitops-bits.h>
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline int test_bit(int nr, const volatile void *addr)
+{
+    const volatile bitops_uint_t *p = addr;
+    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_TESTBIT_H_ */
-- 
2.43.0


