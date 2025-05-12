Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2431AB3CC6
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981802.1368209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVV3-0001nI-33; Mon, 12 May 2025 15:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981802.1368209; Mon, 12 May 2025 15:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVV3-0001kq-0O; Mon, 12 May 2025 15:55:29 +0000
Received: by outflank-mailman (input) for mailman id 981802;
 Mon, 12 May 2025 15:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aA1K=X4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uEVV1-0001kj-UD
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:55:28 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e45d5d-2f49-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:55:25 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fbe7a65609so7558891a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:55:25 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc51276sm6050012a12.43.2025.05.12.08.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 08:55:24 -0700 (PDT)
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
X-Inumbo-ID: 84e45d5d-2f49-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747065325; x=1747670125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClXOu/z90O3dmoZ2tVyFEerAGFbkRtZ0PJmA05IgPHU=;
        b=Gms+imt5LoiH2BJzmXZYkDI1I+MDed6NFwAsm2n5ZOg/sxt9P2OIbQ4fFSecTC6Oop
         ldKAWUeMuy/65HaGDMaKkYvJn5q5H3saNcu90ZpvjHwOtD+D0KMBe2hpLGsMpoAyjMpd
         Hq9PFz/m0rQwGplgR4fiymRcURGmTMR9KVYb2FhYznx9DzzuvSYeDTz5UrtAxUzxi+EM
         NuxGzuhiDC9tOsz1aDvzzNkDvDIBG68bt2n2qZzzNNhU+ZHiaFDhyhVlCTtnMdQNXYo4
         3YYCYIePR2KPaGnC2VYGrpJgWdUunuukRluDoGsVp/8tUje0RCPX2MnLJF648QD0N6FS
         wfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065325; x=1747670125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClXOu/z90O3dmoZ2tVyFEerAGFbkRtZ0PJmA05IgPHU=;
        b=Sqlr9Irdi+lnR83eEgHXsDIwnXk44Nfdhqrhswn2Fr1MxPhHaOCFp7Y+c1Pv+fJlLD
         dsmJ8P6X0AGes9so4NU8CwGQH/wmfEHYPPmDY2qLEDj4tOgj2mqaRpx6/9PFj22t+N51
         Wd6KyZ8GB1EdqotvP4b1kV20Eydrn8xtr2Y7A1aJgHi0szrImQXuj7tt7kamw1OLY3W+
         8rHlcozN9FQuD9dMnhHgNT8jIG69iQRACJT/Y1OpGRKx5Wej4CJMuQMqYKAkN3frqfJu
         FJ7d7F7rBLBdgMeyqEj0QIXeYa4nc0V3vRbhDlRrtX1ovtW/PeHCGaVY632OF05ooHDD
         3R8Q==
X-Gm-Message-State: AOJu0YyrXbTiXiEa5T7noAHohR5nzGoiLiYxwT3/VuyRW+8kA2s5OCJm
	nPspR74XdhIPMEN/G8J3IEeNEhLanPSwAFZR5r/aDm37TuH3JsSQfjzuWQ==
X-Gm-Gg: ASbGncsjNhM9cHj5CJ8/jUn5OAOI32jhku71+HOT0m3PgLWGtq1YD8ZCOJR+ZKr2dfl
	nvDKM+CXVts0AEfhi8dWYU+RQgBq+rm8532ZrFDMgQFyjQhX8hgerIWOyE8cc/OnMb3VBD4gc4L
	umAGI7NP7WES2y6JARg/k5suwv53/DmNsMUbVKg5XB65BH57Q8RIT7M69f6JlVL1hxE9LEAWSEi
	7W12ML5Mkb/2KQObupX2yR4EuHV6Vha94a1b51XD6WvSX/eyRDe1BomSkN1ocrFT6FVsilyWgFk
	5NH4s2cUrBCLWVNRSpwAPyTmudXmQB/+xf9o2wdJghcLUXziRsJkgXzk+p5KwQ1k9H+o75DOo5l
	UeBrvFFOUsd9ykoqmjg==
X-Google-Smtp-Source: AGHT+IETqaaXAIFXU5tt3PC+pzrwGtqnPDwvhKrb+QT17NT4XQB5T1fTVSVA1DinRpFl/yX8iRSTQg==
X-Received: by 2002:a05:6402:2710:b0:5fb:d2dc:523a with SMTP id 4fb4d7f45d1cf-5fca078eebamr11941125a12.15.1747065324421;
        Mon, 12 May 2025 08:55:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] xen/riscv: add initialization support for virtual SBI UART (vSBI UART)
Date: Mon, 12 May 2025 17:55:21 +0200
Message-ID: <1f380b7061496f999d4d60a60b58f494dae886e1.1747064551.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the first step toward supporting a vSBI UART.

The implementation checks for the presence of the "vsbi_uart" property
in the device tree. If present, the vSBI UART is initialized by:
- Allocating a structure that holds Xen console rings and character
  buffers.
- Initializing the vSBI UART spinlock.

This commit introduces the following:
- domain_vsbi_uart_init() and domain_vsbi_uart_deinit() functions.
- A new arch_kernel_info structure with a vsbi_uart member.
- A vsbi_uart structure to hold information related to the vSBI
  driver, including:
  - Whether the vSBI UART backend is in the domain or in Xen.
  - If the backend is in Xen: details such as ring buffer, ring page,
    Xen console ring indexes, and character buffers.
  - A spinlock for synchronization.

Also, introduce init_vuart() which is going to be called by dom0less
generic code during guest domain construction.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
This patch is independent from other RISC-V connected patch series, but it could
be a merge conflict with some patches of other patch series.
---
 xen/arch/riscv/Makefile                |  2 +
 xen/arch/riscv/dom0less-build.c        | 30 +++++++++++++
 xen/arch/riscv/include/asm/domain.h    |  4 ++
 xen/arch/riscv/include/asm/kernel.h    | 21 +++++++++
 xen/arch/riscv/include/asm/vsbi-uart.h | 58 ++++++++++++++++++++++++
 xen/arch/riscv/vsbi-uart.c             | 62 ++++++++++++++++++++++++++
 6 files changed, 177 insertions(+)
 create mode 100644 xen/arch/riscv/dom0less-build.c
 create mode 100644 xen/arch/riscv/include/asm/kernel.h
 create mode 100644 xen/arch/riscv/include/asm/vsbi-uart.h
 create mode 100644 xen/arch/riscv/vsbi-uart.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d882c57528..89a1897228 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += dom0less-build.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += intc.o
@@ -14,6 +15,7 @@ obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vm_event.o
+obj-y += vsbi-uart.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
new file mode 100644
index 0000000000..afce2f606d
--- /dev/null
+++ b/xen/arch/riscv/dom0less-build.c
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+
+#include <asm/vsbi-uart.h>
+
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
+{
+    int rc = -EINVAL;
+
+    kinfo->arch.vsbi_uart = dt_property_read_bool(node, "vsbi_uart");
+
+    if ( kinfo->arch.vsbi_uart )
+    {
+        rc = domain_vsbi_uart_init(d, NULL);
+        if ( rc < 0 )
+            return rc;
+    }
+
+    if ( rc )
+        panic("%s: what a domain should use as an UART?\n", __func__);
+
+    return rc;
+}
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index c3d965a559..c312827d18 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -5,6 +5,8 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/vsbi-uart.h>
+
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
@@ -18,6 +20,8 @@ struct arch_vcpu {
 
 struct arch_domain {
     struct hvm_domain hvm;
+
+    struct vsbi_uart vsbi_uart;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/kernel.h b/xen/arch/riscv/include/asm/kernel.h
new file mode 100644
index 0000000000..15c13da158
--- /dev/null
+++ b/xen/arch/riscv/include/asm/kernel.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM__RISCV__KERNEL_H
+#define ASM__RISCV__KERNEL_H
+
+struct arch_kernel_info
+{
+    /* Enable vsbi_uart emulation */
+    bool vsbi_uart;
+};
+
+#endif /* #ifdef ASM__RISCV__KERNEL_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/vsbi-uart.h b/xen/arch/riscv/include/asm/vsbi-uart.h
new file mode 100644
index 0000000000..144e3191ff
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vsbi-uart.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM__RISCV__VSBI_UART_H
+#define ASM__RISCV__VSBI_UART_H
+
+#include <xen/spinlock.h>
+#include <xen/stdbool.h>
+
+#include <public/io/console.h>
+
+struct domain;
+struct page_info;
+
+#define VSBI_UART_FIFO_SIZE 32
+#define VSBI_UART_OUT_BUF_SIZE 128
+
+struct vsbi_uart_xen_backend {
+    char in[VSBI_UART_FIFO_SIZE];
+    char out[VSBI_UART_OUT_BUF_SIZE];
+    XENCONS_RING_IDX in_cons, in_prod;
+    XENCONS_RING_IDX out_prod;
+};
+
+struct vsbi_uart {
+    bool backend_in_domain;
+    union {
+        struct {
+            void *ring_buf;
+            struct page_info *ring_page;
+        } dom;
+        struct vsbi_uart_xen_backend *xen;
+    } backend;
+
+    spinlock_t lock;
+};
+
+/*
+ * TODO: we don't support an option that backend is in a domain.
+ *       At the moment, backend is ib Xen.
+ *       This structure should be implemented in the case if backend
+ *       is in a domain.
+ */
+struct vsbi_uart_init_info {
+};
+
+int domain_vsbi_uart_init(struct domain *d , struct vsbi_uart_init_info *info);
+void domain_vsbi_uart_deinit(struct domain *d);
+
+#endif /* ASM__RISCV__VSBI_UART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/vsbi-uart.c b/xen/arch/riscv/vsbi-uart.c
new file mode 100644
index 0000000000..5fe617ae30
--- /dev/null
+++ b/xen/arch/riscv/vsbi-uart.c
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+#include <xen/xmalloc.h>
+
+#include <asm/vsbi-uart.h>
+
+int domain_vsbi_uart_init(struct domain *d, struct vsbi_uart_init_info *info)
+{
+    int rc;
+    struct vsbi_uart *vsbi_uart = &d->arch.vsbi_uart;
+
+    if ( vsbi_uart->backend.dom.ring_buf )
+    {
+        printk("%s: ring_buf != 0\n", __func__);
+        return -EINVAL;
+    }
+
+    /*
+     * info is NULL when the backend is in Xen.
+     * info is != NULL when the backend is in a domain.
+     */
+    if ( info != NULL )
+    {
+        printk("%s: vsbi_uart backend in a domain isn't supported\n", __func__);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+    else
+    {
+        vsbi_uart->backend_in_domain = false;
+
+        vsbi_uart->backend.xen = xzalloc(struct vsbi_uart_xen_backend);
+        if ( vsbi_uart->backend.xen == NULL )
+        {
+            rc = -ENOMEM;
+            goto out;
+        }
+    }
+
+    spin_lock_init(&vsbi_uart->lock);
+
+    return 0;
+
+out:
+    domain_vsbi_uart_deinit(d);
+
+    return rc;
+}
+
+void domain_vsbi_uart_deinit(struct domain *d)
+{
+    struct vsbi_uart *vsbi_uart = &d->arch.vsbi_uart;
+
+    if ( vsbi_uart->backend_in_domain )
+        printk("%s: backed in a domain isn't supported\n", __func__);
+    else
+        XFREE(vsbi_uart->backend.xen);
+}
-- 
2.49.0


