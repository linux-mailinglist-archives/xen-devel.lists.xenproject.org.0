Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6CA1AD66
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876390.1286757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sA-0008Fg-5u; Thu, 23 Jan 2025 23:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876390.1286757; Thu, 23 Jan 2025 23:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sA-0008Di-2c; Thu, 23 Jan 2025 23:44:30 +0000
Received: by outflank-mailman (input) for mailman id 876390;
 Thu, 23 Jan 2025 23:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6s9-0007hN-5d
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:44:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fba857b2-d9e3-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:44:27 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385df53e559so1133687f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:44:27 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d6e2sm989811f8f.23.2025.01.23.15.44.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:26 -0800 (PST)
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
X-Inumbo-ID: fba857b2-d9e3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675867; x=1738280667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nuXtmGFXC6ord9LKCUcMBdqEKN9u5T/6Xkbf7Pq9+s=;
        b=Gm1Rwz1Ej4xWapZtJpOvUo7Vj9iGnyELUcoaRwcc47DMm3/GkikBmZue3bTmXGC/rK
         4dFoFKdsyns1G7mqGduPHFLWo42wYSyVo33PGsYTUn7cwPkftCQyvckeWjcD6TOthFtk
         mKPhFL4Fc2CtAdh8XbfWE2JpFkf0g5L7GhcwhdugoVJC/yXA00XWpN0Rc+PwWmWp1d21
         SuaR9HhhxN8PukvdGzK0JAIOm2pSQg4D2pzf/OWLwwbmqlqguf8XrmJpBCZkuh0acJPW
         JtKzVsI+6fL4STQcxxdYhT0B6tWNEMj2pwr7VLPR98+Pg5uvb+a454oIDfJ4LwgIrtVH
         VVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675867; x=1738280667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nuXtmGFXC6ord9LKCUcMBdqEKN9u5T/6Xkbf7Pq9+s=;
        b=RBZxwe+LPjZqTJ+Qx8U3LXFgN7KilptYvLS+s97iQP1PWmzQLYtTSYM0VbMpGc9/6c
         RfZ18BHiCVx+XmdRlQMzKuddiy3/SLAQujhABTC4/P1o0nB052Fa4IK+mb+R4r95CC6U
         aEFcktuDKKsb2wkMDxgorno94iyjgHsvIO2qXhLTFXGqYfjyjfvS9CDZSD9h/0VCLN9u
         lU6h8Or9yYc3Ll+jC+uhkZkn0iqeIoDeAo9KgwvH21jk7dZxMl1k+mqBreHSXBsUUm7x
         COeD+EJNCounXDhW3iRr7GDbpUxpWC4YDEuni7Mc0uLppEdmw19I6WC8AExMEQqxsMbl
         5wrA==
X-Forwarded-Encrypted: i=1; AJvYcCXOjH5ZOURC1YR031D5dyPeMC/3l6wSJ3mC1us1i/JJ3qmFCjhTsD1QjV6bSG0HbtIAAcZzqeaN+Xs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ72by1UqHzeAf1khyBGEm39P/+AphJuJYTxQDnLPfqhspuIx5
	SPe5lGeWzfItqQMqgRkfjEQaKH7/53b8Js4hXMmWnj1NvlGxMyRe2bErN3Kz5XA=
X-Gm-Gg: ASbGncuR4A3f3kTa+SuwfzL5FCoea5bKmloO4/fdxr+lWLoBS2aPNyBHnF16BGAd+Dz
	hAebmo53CubVZGz6haiy+kTSV158ALn3nyfL4pwAiegAdeetJmVhS/gmFjYr0CMEIWVkfmX0fxv
	IUt7pNqGGzNNZI8/UTI4hPhVYOG2G/yLqUAN3csbO8tRb8wOMg5K7IMldqsYF/iHEcQh4tD2e/u
	LGk8X7g5Qxxo34aJEfyWBKgrbpdOBVvLxGKiIGUpL0NVDaW8+C95cot7g3lbDlR6BAWYAs20A3s
	TSgarR5pcKUr0Ew0u0WVYlWv6rUmYTSl8tXc7uG9MDnZl23aQAx/I8s=
X-Google-Smtp-Source: AGHT+IHv5zns5zWE/8mYKYb9FdwvG4F/GC7lN2DJcXXFDd0WLjCHyuvzadU0RlDxZ5dNLmoZuF9u5A==
X-Received: by 2002:a05:6000:1887:b0:38a:87cc:fb42 with SMTP id ffacd0b85a97d-38bf56639d5mr27205303f8f.21.1737675867076;
        Thu, 23 Jan 2025 15:44:27 -0800 (PST)
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
Subject: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
Date: Fri, 24 Jan 2025 00:43:56 +0100
Message-ID: <20250123234415.59850-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keep common MMAP-related declarations in a single place.

Note, this disable ThreadSafetyAnalysis on Linux for:
- mmap_fork_start()
- mmap_fork_end().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/qemu.h        | 12 +-----------
 include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
 linux-user/user-mmap.h | 19 ++-----------------
 3 files changed, 35 insertions(+), 28 deletions(-)
 create mode 100644 include/user/mmap.h

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4e97c796318..c1c508281a8 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -32,6 +32,7 @@
 extern char **environ;
 
 #include "user/thunk.h"
+#include "user/mmap.h"
 #include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
@@ -233,19 +234,8 @@ void print_taken_signal(int target_signum, const target_siginfo_t *tinfo);
 extern int do_strace;
 
 /* mmap.c */
-int target_mprotect(abi_ulong start, abi_ulong len, int prot);
-abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, off_t offset);
-int target_munmap(abi_ulong start, abi_ulong len);
-abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
-                       abi_ulong new_size, unsigned long flags,
-                       abi_ulong new_addr);
 int target_msync(abi_ulong start, abi_ulong len, int flags);
-extern abi_ulong mmap_next_start;
-abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size);
 void mmap_reserve(abi_ulong start, abi_ulong size);
-void TSA_NO_TSA mmap_fork_start(void);
-void TSA_NO_TSA mmap_fork_end(int child);
 
 /* main.c */
 extern char qemu_proc_pathname[];
diff --git a/include/user/mmap.h b/include/user/mmap.h
new file mode 100644
index 00000000000..4d004e6b822
--- /dev/null
+++ b/include/user/mmap.h
@@ -0,0 +1,32 @@
+/*
+ * MMAP declarations for QEMU user emulation
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef USER_MMAP_H
+#define USER_MMAP_H
+
+#include "user/abitypes.h"
+
+/*
+ * mmap_next_start: The base address for the next mmap without hint,
+ * increased after each successful map, starting at task_unmapped_base.
+ * This is an optimization within QEMU and not part of ADDR_COMPAT_LAYOUT.
+ */
+extern abi_ulong mmap_next_start;
+
+int target_mprotect(abi_ulong start, abi_ulong len, int prot);
+
+abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
+                     int flags, int fd, off_t offset);
+int target_munmap(abi_ulong start, abi_ulong len);
+abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+                       abi_ulong new_size, unsigned long flags,
+                       abi_ulong new_addr);
+
+abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
+
+void TSA_NO_TSA mmap_fork_start(void);
+void TSA_NO_TSA mmap_fork_end(int child);
+
+#endif
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index b94bcdcf83c..dfc4477a720 100644
--- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -18,6 +18,8 @@
 #ifndef LINUX_USER_USER_MMAP_H
 #define LINUX_USER_USER_MMAP_H
 
+#include "user/mmap.h"
+
 /*
  * Guest parameters for the ADDR_COMPAT_LAYOUT personality
  * (at present this is the only layout supported by QEMU).
@@ -39,24 +41,7 @@
 extern abi_ulong task_unmapped_base;
 extern abi_ulong elf_et_dyn_base;
 
-/*
- * mmap_next_start: The base address for the next mmap without hint,
- * increased after each successful map, starting at task_unmapped_base.
- * This is an optimization within QEMU and not part of ADDR_COMPAT_LAYOUT.
- */
-extern abi_ulong mmap_next_start;
-
-int target_mprotect(abi_ulong start, abi_ulong len, int prot);
-abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, off_t offset);
-int target_munmap(abi_ulong start, abi_ulong len);
-abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
-                       abi_ulong new_size, unsigned long flags,
-                       abi_ulong new_addr);
 abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice);
-abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
-void mmap_fork_start(void);
-void mmap_fork_end(int child);
 
 abi_ulong target_shmat(CPUArchState *cpu_env, int shmid,
                        abi_ulong shmaddr, int shmflg);
-- 
2.47.1


