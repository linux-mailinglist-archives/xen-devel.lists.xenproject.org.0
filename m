Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC69A867EDC
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685698.1066890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewm-0001Th-MT; Mon, 26 Feb 2024 17:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685698.1066890; Mon, 26 Feb 2024 17:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewm-0001Kh-CP; Mon, 26 Feb 2024 17:39:24 +0000
Received: by outflank-mailman (input) for mailman id 685698;
 Mon, 26 Feb 2024 17:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewk-0007o5-TR
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:22 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f962571f-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:21 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so47697501fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:21 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:19 -0800 (PST)
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
X-Inumbo-ID: f962571f-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969160; x=1709573960; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNrkylm2yFBJDlGcN/iXxdhzHVaAgu9JHW+hLkBgjOo=;
        b=Hi21yEtrZJvjjaCloV61QKBfjsVRXDnqEMyIiEJUHA3NO4b2i144e7vR/w1fxmnUNu
         toi9WoCDWHp0Zb2mkPhxFkcxWLqkGVQNsy9XHF+eAg3jRDQdbJF20SKh9AqKxeAXjzk+
         E3bvxjZ03VBs/nUrQQn63CgeeEfjkSdWjem+zj7929zNv3LQcVM4UFf+DUd3yw8ZegTg
         FMjmmMZGpE9QjyIAH/v32EyUifjdPB2DPCOkhvkMZ4wCsy1zhZjFLkSEdfG0m90aMnK/
         isEll0uj0owgSBjPONochx35SiQ8zFV8wt9Eufyr1sx/WunOjLJDPmuaE4lRTTyVqNLQ
         tv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969160; x=1709573960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNrkylm2yFBJDlGcN/iXxdhzHVaAgu9JHW+hLkBgjOo=;
        b=K7jnBjjmSArRFlL3SGh6YZt+q9Dzac1+rLG7+GMg9kq43tAGy8D/Ds3f2tqEa/OiGN
         Pl5o6S47bDK6D5JuS2Ctk6iHiP8+4XcOrQDNLC52Cfj34pYBKy/cYaPpzUMHCdYLqlwJ
         RtrvVmkxDTN8hVOfaD7RrRIn9WIyMYZt8TAdnxxt6OpgZhmM4uKe72Nra5Xh2zT9hlJF
         LER4mO7Lp40BQoSW4/dp9qlrm001txgvboLHSqD8737C6oL/yWTkydgsNAMpi9Pr45/p
         jcyXpjah0syQ3J0deglNJ3pS7UDU+iMi0VaKni7itLV7fqo5Ig87mDCLGsASCE/YmhMb
         eSjQ==
X-Gm-Message-State: AOJu0Yxy6fTY6O8ZMjWlCSvTE0/xNozX5SMcc0pjX2NEbNHNSAl0X85O
	dLN3WRo2ISyVQmYEF1Le8pFbCUWt0prMrFrHgRiGSNF8PNUWyJQ+SNCQ6oi7
X-Google-Smtp-Source: AGHT+IHRuLqiYqHwAzLIXYX6Tjhc1JShcdSKACZaklZkja1toysaGTkLSSLcep1Bg/QWsWfPk/A67Q==
X-Received: by 2002:a05:651c:546:b0:2d2:5057:bbf4 with SMTP id q6-20020a05651c054600b002d25057bbf4mr6267478ljp.20.1708969160070;
        Mon, 26 Feb 2024 09:39:20 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 08/23] xen/asm-generic: introduce generic non-atomic test_*bit()
Date: Mon, 26 Feb 2024 18:38:50 +0100
Message-ID: <7cd2b77f2cce41a84ee7746833bb22bb99d94df1.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
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
index 0000000000..42569d0d7c
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
+#ifndef _LINUX_BITOPS_H
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


