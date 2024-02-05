Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B5849E40
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676200.1052202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xl-0008PD-Tc; Mon, 05 Feb 2024 15:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676200.1052202; Mon, 05 Feb 2024 15:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xl-0008Il-PX; Mon, 05 Feb 2024 15:32:49 +0000
Received: by outflank-mailman (input) for mailman id 676200;
 Mon, 05 Feb 2024 15:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xk-0007I6-OC
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:48 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d028054a-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:47 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51121637524so6822970e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:45 -0800 (PST)
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
X-Inumbo-ID: d028054a-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147166; x=1707751966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6k+h8FV3d3vqiaEMlAmNrvziqvskuI2jnLZD/dQBlM=;
        b=BgVd3K+6wg0nuW7AQWKED/JY0hLQaTZzM4vXEdBNcyhSKrrMGj5hE+7FcO7sZV8eh8
         HHM0dLIx8DXOpAYL8LIybxN5VDhGh52B1NpCguA5ZngX4STh3n7zq7dS2e4wELc07Wva
         QvTBT9LFdsK/CAI+DnXilpu9bh8kUSeJrTx4epcVwTf+sfPmwItegTHJ+wCLxq2Ep3v1
         cTSfdvZ7i1GYcvYnNFxeE2NYMGb/6HGA2AFGUgf9zP4O1rcUIkpxpXfC8ttmcyIAw6nY
         2gO4DLBoWYG9ar/O4XOOw+dztC/aTIn93rSlTAu3c9aaFnTX3/ANCXF9lhIeztkbEXub
         77Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147166; x=1707751966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6k+h8FV3d3vqiaEMlAmNrvziqvskuI2jnLZD/dQBlM=;
        b=NONUKb2QKp5v0bht11wHzRBX+8CjKY82uD0hhhl12pc+mj7iumUEWLyu24b1vXc93C
         kcgcBwqmxgSYg0LREdjU8pK7OJhwLAAtw1S4aj5A4AkciMP+tJB8h9eIvgY0UmIUvylX
         rf6ys/pT2xSFvN/MVrvydNIXkAXNp4vMiRY7EGwNhFV8/WzI44bLqwVqktxkwuSHoPzR
         0+gxcOkLDm3FsRElyh0/FtoZhzxck4aSxQQ0I2jXuX38DSRh/hTXw9dm7GPizBBX+ycw
         cjsrTG7dlHTGE8/94Koeh6VR6KTmzVRVHCsIkGcJtOPEaOndhQ1JSw0k6FmUCsP4ciLC
         kJNA==
X-Gm-Message-State: AOJu0Yxu0AbUQvZ+cPuQt5gj+n7fnaHXsQgNR89O9uhiRE+VtTpQjJ7r
	MVQ61mIDKPIm+Xuq4yPbHN0WhzdZiZUNWIvwJTBbOJ0FQNf/NN7PnOCrZAFE
X-Google-Smtp-Source: AGHT+IH2pEQL4vZHR4MIEJz68fgv+P3tICF/uAeNOq4jVyksCsAdQPpNvtJllexRR5adepWtKjsiXg==
X-Received: by 2002:ac2:4141:0:b0:511:56cf:5547 with SMTP id c1-20020ac24141000000b0051156cf5547mr341802lfi.1.1707147166303;
        Mon, 05 Feb 2024 07:32:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUDAoZxLjfy7HkxTNBi3WUn1ERJyszXw4tprspv4xeX6CniIEbx62uxIUGO2bOy3eu8pVs9iyJ86O+M5hmcFSa3Dk1vJLbHMRtg/aAHExQOCR1vm999z27iGd104XrjDG/+76NqhFh11WTetvT877pp3trNF5xmkeINlC1wqnyELm4+QQdizAZiBzPsg5jMbevc53ljIAKeJ7Q3BpN0CPX8kbcRJnnB5FjZvzpz0R1NP1UalY5MgCy5ykM+Oin/gHEE+67qFCo8cj40bVDh2W39CisiC/WiYg0MoWY+OWJaLhxd0LkYTa/6KZzbWHy4DROOxq1w
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 05/30] xen/riscv: introduce guest_atomics.h
Date: Mon,  5 Feb 2024 16:32:12 +0100
Message-ID: <542c61229e1056c3fdec3a5c086136e3b5909b07.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Drop in guest_testop() and guest_bitop() casts of function arguments.
 - Change "commit message" to "commit title" in "Changes in V3" to be more precise about
   what was changed.
 - use BUG_ON("unimplemented") instead of ASSERT_UNREACHABLE
---
Changes in V3:
 - update the commit title
 - drop TODO commit.
 - add ASSERT_UNREACHABLE for stubs guest functions.
 - Add SPDX & footer
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/guest_atomics.h | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h

diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/include/asm/guest_atomics.h
new file mode 100644
index 0000000000..de54914454
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_GUEST_ATOMICS_H
+#define __ASM_RISCV_GUEST_ATOMICS_H
+
+#include <xen/bug.h>
+
+#define guest_testop(name)                                                  \
+static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
+{                                                                           \
+    BUG_ON("unimplemented");                                                \
+                                                                            \
+    return 0;                                                               \
+}
+
+#define guest_bitop(name)                                                   \
+static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
+{                                                                           \
+    BUG_ON("unimplemented");                                                \
+}
+
+guest_bitop(set_bit)
+guest_bitop(clear_bit)
+guest_bitop(change_bit)
+
+#undef guest_bitop
+
+guest_testop(test_and_set_bit)
+guest_testop(test_and_clear_bit)
+guest_testop(test_and_change_bit)
+
+#undef guest_testop
+
+#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
+
+#endif /* __ASM_RISCV_GUEST_ATOMICS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


