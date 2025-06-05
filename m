Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BBACF392
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007082.1386355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzt-00073f-Cv; Thu, 05 Jun 2025 15:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007082.1386355; Thu, 05 Jun 2025 15:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzt-00071l-AO; Thu, 05 Jun 2025 15:59:17 +0000
Received: by outflank-mailman (input) for mailman id 1007082;
 Thu, 05 Jun 2025 15:59:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNCzs-00071f-8A
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:16 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06dda368-4226-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:59:14 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5fff52493e0so1418216a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:14 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:12 -0700 (PDT)
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
X-Inumbo-ID: 06dda368-4226-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139153; x=1749743953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaIQRtc9d3iSedrxQcJBg3temD5lEMJYTzMYZJj6Vlw=;
        b=QwV/na8SYaZzCLPwdlGYAhC5LxLVV5x50//XKIrK3kLnwHwckxu0G0zD/IxVpc6vOw
         3KkH0UTVhUHkS8i6JjCJ1KKK3A7Yw6T5LdZ3wytJdgrP0eb/8QmEavVtPDrCY9JOCcwH
         ir6xvMHkOz9Xn/i85CUwqkJJN0aFpsOc23oLWI34rOuDJHpyqORBYY0jzWIw0GErTqZB
         IP3kRgPigxWrY5UYkaCUNPbc3pjutUYZYnW6BCawVBEz6Fcw/mF8os+Caf8mEoz7EhRp
         WpPXzRUmdNkgE9p/lgtXQI0dP+8jAPZKHZ2/1QsMjQaSml6buTvPdKTdkTYBX0HSP3yx
         wmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139153; x=1749743953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaIQRtc9d3iSedrxQcJBg3temD5lEMJYTzMYZJj6Vlw=;
        b=H8tWz4UdxfbT8OnN2r/A5jbV9MxSZCX6I8/0No8tn7XOLUDmOA+bs3xXawt1eblgIO
         NFmd7PNT+xoV9x/s1SQYbZVCRqtF+K+CSIkS716TFH/GKZBt4+GW0XQfyWGkJ2eHitEL
         o4TI68CxU+nRwk1lO2yNwLaw/4lVAIsPZ7AJ+Om88eTeWKpNyw4nGyGLkkmIk/DyoW+l
         u8CUowGuX2816vFzNN5Q9L7xjBLAaaFu/Q+78Cqcfg6j/M60LXUQGm86z75aNqJ6mULf
         60N0l41+w+8oPN7azW1vLd+WgtRwCI3r2n91F7Y14QCaywANOhUfqpGJFT3eji8aNB2d
         foVA==
X-Gm-Message-State: AOJu0YyTbc/JimhhEVaVpJqLILpGYz9yBhVsxLuQvYqrRRWGZcxjodP5
	KNhKYGS365Hni6B5yxszusAfMsV77USjBqbjF+4rUFg0NOQNFIMkXygsszi9RQ==
X-Gm-Gg: ASbGncsblRNkMnnMLGzYQW456oaxZW+ZSqJVdle+D5Bddbo9zD4v6xAAEP3SDlHPFCH
	gkjXH0NbqlwmRWIsGF2ESaw34FCOurjxzoTBd/oVA0+FLUvZZdN2IpGlJ7GV8M/GsXjqJQ+BbMb
	N5/30y65OwouDnUM3I8uwPv3QvTu3ZMPY3ujnLzn1iJ5yTyK2Fs76Qk+7QWmp4hxGoY2CxdNBy0
	vX/TIB9XWCa7DaYDEwtuLH96Qfc+DQJzcaaeduyBL7AA0pRMSjM+DHYpE9sstI6BD+Ola/Dpo3R
	bEPPd/FTuq2LVmD1gbi2sYI3GqaH/flRtvOT7kirCCj2AMyxI7rpt7BGlbrftI0rLkuXw9I+iuN
	WfbUF9HGkGQW09ervMcCe5EMIrtjg
X-Google-Smtp-Source: AGHT+IEWPlkK/iMLYQiBhbCLgaRh59G0rEJ5K074BH6um0qrYe3P2tGlwobmKcfS7rA2jE8i4RCk1A==
X-Received: by 2002:a05:6402:350b:b0:607:32e8:652 with SMTP id 4fb4d7f45d1cf-60732e806ccmr1706776a12.19.1749139153169;
        Thu, 05 Jun 2025 08:59:13 -0700 (PDT)
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
Subject: [PATCH v4 1/9] xen/riscv: dt_processor_hartid() implementation
Date: Thu,  5 Jun 2025 17:58:57 +0200
Message-ID: <751343d295c0fa6a9a7d8f2265ece3faecd44b64.1749121437.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749121437.git.oleksii.kurochko@gmail.com>
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements dt_processor_hartid() to get the hart ID of the given
device tree node and do some checks if CPU is available and given device
tree node has proper riscv,isa property.

As a helper function dt_get_hartid() is introduced to deal specifically
with reg propery of a CPU device node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Sort properly inculsion of xen/types.h in riscv/smpboot.c.
 - Add overflow check of got address cell value in dt_get_hartid().
 - Use "%#lx" for loging recieved hartid from DTB.
 - s/-EINVAL/-ENODEV for recieved isa string from DTB.
---
Changes in V3:
 - s/dt_processor_cpuid/dt_processor_hartid.
 - s/dt_get_cpuid/dt_get_hartid.
 - use ~0UL in dt_get_cpuid() and in the comment above it.
 - change type for local variable ac in dt_get_cpuid() to unsigned int.
 - Update the return errors for dt_processor_cpuid().
 - Update the commit message + subject: s/cpuid/hartid.
---
Changes in V2:
 - s/of_get_cpu_hwid()/dt_get_cpu_id().
 - Update prototype of dt_get_cpu_hwid(), use pointer-to-const for cpun arg.
 - Add empty line before last return in dt_get_cpu_hwid().
 - s/riscv_of_processor_hartid/dt_processor_cpuid().
 - Use pointer-to_const for node argument of dt_processor_cpuid().
 - Use for hart_id unsigned long type as according to the spec for RV128
   mhartid register will be 128 bit long.
 - Update commit message and subject.
 - use 'CPU' instead of 'HART'.
 - Drop thread argument of dt_get_cpu_id() (of_get_cpu_hwid) as it is
   expected to be always 0 according to RISC-V's DTS binding.
---
 xen/arch/riscv/include/asm/smp.h |  4 ++
 xen/arch/riscv/smpboot.c         | 77 ++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index 5e170b57b3..eb58b6576b 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -26,6 +26,10 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
 
 void setup_tp(unsigned int cpuid);
 
+struct dt_device_node;
+int dt_processor_hartid(const struct dt_device_node *node,
+                        unsigned long *hartid);
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
index 0f9c2cc54a..8011876372 100644
--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -1,6 +1,9 @@
 #include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/sections.h>
+#include <xen/types.h>
 
 #include <asm/current.h>
 
@@ -14,3 +17,77 @@ void __init smp_prepare_boot_cpu(void)
     cpumask_set_cpu(0, &cpu_possible_map);
     cpumask_set_cpu(0, &cpu_online_map);
 }
+
+/**
+ * dt_get_hartid - Get the hartid from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ *
+ * Return: The hartid for the CPU node or ~0UL if not found.
+ */
+static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
+{
+    const __be32 *cell;
+    unsigned int ac;
+    uint32_t len;
+    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &len);
+
+    if (ac > max_cells) {
+        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
+               max_cells);
+        return ~0UL;
+    }
+
+    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
+        return ~0UL;
+
+    return dt_read_number(cell, ac);
+}
+
+/*
+ * Returns the hartid of the given device tree node, or -ENODEV if the node
+ * isn't an enabled and valid RISC-V hart node.
+ */
+int dt_processor_hartid(const struct dt_device_node *node,
+                        unsigned long *hartid)
+{
+    const char *isa;
+    int ret;
+
+    if ( !dt_device_is_compatible(node, "riscv") )
+    {
+        printk("Found incompatible CPU\n");
+        return -ENODEV;
+    }
+
+    *hartid = dt_get_hartid(node);
+    if ( *hartid == ~0UL )
+    {
+        printk("Found CPU without CPU ID\n");
+        return -ENODATA;
+    }
+
+    if ( !dt_device_is_available(node))
+    {
+        printk("CPU with hartid=%#lx is not available\n", *hartid);
+        return -ENODEV;
+    }
+
+    if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
+    {
+        printk("CPU with hartid=%#lx has no \"riscv,isa\" property\n", *hartid);
+        return ret;
+    }
+
+    if ( isa[0] != 'r' || isa[1] != 'v' )
+    {
+        printk("CPU with hartid=%#lx has an invalid ISA of \"%s\"\n", *hartid,
+               isa);
+        return -ENODEV;
+    }
+
+    return 0;
+}
-- 
2.49.0


