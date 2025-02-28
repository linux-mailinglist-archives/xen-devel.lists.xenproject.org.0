Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A39A49CA8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 16:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898789.1307281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to1rI-00015Y-Ca; Fri, 28 Feb 2025 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898789.1307281; Fri, 28 Feb 2025 15:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to1rI-00013v-8b; Fri, 28 Feb 2025 15:01:00 +0000
Received: by outflank-mailman (input) for mailman id 898789;
 Fri, 28 Feb 2025 15:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwVv=VT=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1to1rG-0000wA-Fy
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 15:00:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d006ed47-f5e4-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 16:00:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso14381905e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 07:00:56 -0800 (PST)
Received: from RTRKN418-LIN.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f839asm59370115e9.2.2025.02.28.07.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 07:00:54 -0800 (PST)
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
X-Inumbo-ID: d006ed47-f5e4-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740754856; x=1741359656; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dq+HUrggqpXUNWXZqph7nU6yugYpqHj47PsEymDiN0A=;
        b=GpNLKLfrbC9L+LGuivmbW0ewHGrn5WfIP5NvG/+dWji4pFShaGUl4FG3QnX/CNciVd
         zk1EnMMTCZzxHUO6A6kZb6J+54x2vPV1JojAFd6VvjZcxPWJq1EylhZ435VbRLqlP5V7
         RzfJKTrmQc7rm0afDCbBmrBjOWv1ACE4KvKtH8ikbEGDvADmEzxBhcc+oZRhhmjfNW/+
         PG6JhUmn98xD+Ixz21ZKUgvLioKtUfr9ecvt9wtvK2/XHtFYwkQOV08/hR6N6uTDFKOT
         eQTqRbqp5sytf9Cv0+OpQ9cWuW7EgB6t0VHka+FvW6As4sA/cai/HkG+yn5t3Q67WK7S
         T0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754856; x=1741359656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq+HUrggqpXUNWXZqph7nU6yugYpqHj47PsEymDiN0A=;
        b=BBnBu2LO3qo4t1rj67es3AgpJP2X4oanxUXSQELnygNCrvgsVOLpuK0hBJkc0N89LG
         Vz9b/LTIyTk9gBc6tNRuSp2ciGdze8cErSGXIsWt8etBgd9TtQ6QmAPIrlkyzDrXPibr
         7MFlg+VY487duRg2TU5Vhb94yPeCOiXmNW31yZdCi0ksJNS7UBmOHsgNs+KNCLqtpi+K
         xNmTvAODtLcV6ETNqSDixe/lHbVqmSS/AhDeX3t8OxKmpKSbmxrJiXp+HEiuqEhzV8Ie
         3sPMyqw8jWM+D+19gnaHB/+iiznUdUuXP40zPhU1gxnat7IGuiTzYiE7grsojDdFJiSD
         x3fw==
X-Gm-Message-State: AOJu0YxlutDZxz/ok28G67arzgY/nas+m6DD+KmsDULhTe2UOlc3fvXx
	2jDbgBQz7X9Yx+ykYAmluGxAN+L1F5j66F7n5z/c6ZhhPdDQWN0nkUOeyLGAgjM=
X-Gm-Gg: ASbGncuzRUbj6ASQljGK9cyWUngCVpu16FWWKxAUeCspHb1NrWk5/wlc/ovsIbvCIW1
	ttwcB6UqERdaCmGKFnw/DKR2rDbul78e37Pp4w7XFUxiXFEvH3uZXZ+CXhpWyMCtn2Xvzil5bEX
	IcS2eXyTFD81mhK9yuV/JZsdtNxifU0KUE5X3Pv64iaR7CsTURtyHBIg1XOBYipHzVG6bGPXwhc
	vd9NprnzhCJQRIfWzfJIW+OtIUTBa6sQMsH3QxKZcdX0gs585E0sFDOUQ5krovSxRKi7fk3uO58
	0Rh+albgteqQ8Yk3rgyMqkJgy8mRcKJl6f9x/1AQoiW/8QJ3xJE=
X-Google-Smtp-Source: AGHT+IGbXKjhng8IhBdOmoetcjOAzddu5BEVvTKWcsK2BPJtzP+p375bKUncVzakx8Mgcgd9P6fNUQ==
X-Received: by 2002:a05:600c:511e:b0:439:6017:6689 with SMTP id 5b1f17b1804b1-43ba66e0bf5mr30630575e9.9.1740754854889;
        Fri, 28 Feb 2025 07:00:54 -0800 (PST)
From: Milan Djokic <milandjokic1995@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Milan Djokic <Milan.Djokic@rt-rk.com>
Subject: [PATCH] xen/riscv: copy_to_guest/copy_from_guest functionality.
Date: Fri, 28 Feb 2025 15:59:22 +0100
Message-ID: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>

This patch implements copy_to_guest/copy_from_guest functions for RISC-V.
These functions are designed to facilitate data exchange between guest and hypervisor.

Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
---
Tested on qemu with xcp-ng latest branch https://gitlab.com/xen-project/people/olkur/xen/-/merge_requests/6
Full description on how to setup test environment can be found in attached PR link (Linux kernel patching to support copy_from_guest/copy_to_guest for RISC-V).
Linux kernel patch shall be upstreamed after these changes are merged.
---
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/addr_translation.S         | 63 +++++++++++++++++++++++
 xen/arch/riscv/arch.mk                    |  6 ++-
 xen/arch/riscv/guestcopy.c                | 43 ++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h |  5 ++
 5 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/addr_translation.S
 create mode 100644 xen/arch/riscv/guestcopy.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index a5eb2aed4b..1bd61cc993 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -10,6 +10,7 @@ obj-y += smp.o
 obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
+obj-y += addr_translation.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/addr_translation.S b/xen/arch/riscv/addr_translation.S
new file mode 100644
index 0000000000..7e94774b47
--- /dev/null
+++ b/xen/arch/riscv/addr_translation.S
@@ -0,0 +1,63 @@
+#include <asm/riscv_encoding.h>
+#include <asm/asm.h>
+
+.macro add_extable lbl
+.pushsection .extable, "a"     /* Start .extable section */
+.balign      8                 /* Align to 8 bytes */
+.quad        \lbl              /* Add label address to extable */
+.popsection                    /* End section */
+.endm
+
+.section .text
+
+/*
+ * size_t _copy_to(uint64_t dest, const void *src, size_t len)
+ *
+ * a0 - dest
+ * a1 - src
+ * a2 - len
+ *
+ */
+
+.global _copy_to
+_copy_to:
+    la    t0, copy_done             /* Load address of return label */
+    mv    t2, zero                  /* Initialize counter to zero */
+loop_check:
+    beq   t2, a2, copy_done         /* Check if all bytes are copied */
+    lb    t3, (a1)                  /* Load byte from source (guest address) */
+store_byte:
+    hsv.b t3, (a0)                  /* Store byte to destination (host address) */
+    add_extable store_byte          /* Add exception table for this location */
+    addi  a0, a0, 1                 /* Increment destination pointer */
+    addi  a1, a1, 1                 /* Increment source pointer */
+    addi  t2, t2, 1                 /* Increment byte counter */
+    j     loop_check                /* Loop back if not done */
+
+/*
+ * size_t _copy_from(void *dest, uint64_t src, size_t len)
+ *
+ * a0 - dest
+ * a1 - src
+ * a2 - len
+ *
+ */
+
+.global _copy_from
+_copy_from:
+    la    t0, copy_done
+    mv    t2, zero
+loop_check_from:
+    beq   t2, a2, copy_done
+load_byte:
+    hlv.b t3, (a1)                  /* Load byte from guest address */
+    add_extable load_byte
+    sb    t3, (a0)
+    addi  a0, a0, 1
+    addi  a1, a1, 1
+    addi  t2, t2, 1
+    j     loop_check_from
+
+copy_done:
+    mv    a0, t2                    /* Return number of bytes copied */
+    ret
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 17827c302c..f4098f5b5e 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -23,13 +23,17 @@ $(eval $(1) := \
 	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
+h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
+$(h-extension-name)-insn := "hfence.gvma"
+$(call check-extension,$(h-extension-name))
+
 zbb-insn := "andn t0$(comma)t0$(comma)t0"
 $(call check-extension,zbb)
 
 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)
 
-extensions := $(zbb) $(zihintpause)
+extensions := $(value $(h-extension-name)) $(zbb) $(zihintpause)
 
 extensions := $(subst $(space),,$(extensions))
 
diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
new file mode 100644
index 0000000000..0325956845
--- /dev/null
+++ b/xen/arch/riscv/guestcopy.c
@@ -0,0 +1,43 @@
+#include <xen/bug.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+
+#include <asm/csr.h>
+#include <asm/guest_access.h>
+#include <asm/system.h>
+#include <asm/traps.h>
+
+unsigned long copy_to(uint64_t dest, void* src, size_t len)
+{
+    size_t bytes;
+
+    bytes = _copy_to(dest, src, len);
+
+    if (bytes == len)
+        return 0;
+    else
+        return -ENOSYS;
+}
+
+unsigned long copy_from(void *dest, uint64_t src, size_t len)
+{
+    size_t bytes;
+
+    bytes = _copy_from(dest, src, len);
+
+    if (bytes == len)
+        return 0;
+    else
+        return -ENOSYS;
+}
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len)
+{
+    return copy_to((vaddr_t)to, (void *)from, len);
+}
+
+unsigned long raw_copy_from_guest(void *to, const void __user *from, unsigned len)
+{
+    return copy_from((void *)to, (vaddr_t)from, len);
+}
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 7cd51fbbde..4fcf3fbf68 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -2,6 +2,11 @@
 #ifndef ASM__RISCV__GUEST_ACCESS_H
 #define ASM__RISCV__GUEST_ACCESS_H
 
+#include <xen/types.h>
+
+extern size_t _copy_to(uint64_t dest, const void *src, size_t len);
+extern size_t _copy_from(void *dest, uint64_t src, size_t len);
+
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
 unsigned long raw_clear_guest(void *to, unsigned int len);
-- 
2.43.0


