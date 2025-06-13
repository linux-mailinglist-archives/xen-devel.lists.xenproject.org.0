Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23893AD91DA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014625.1392726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eJ-0006jU-VN; Fri, 13 Jun 2025 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014625.1392726; Fri, 13 Jun 2025 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eJ-0006fB-S2; Fri, 13 Jun 2025 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 1014625;
 Fri, 13 Jun 2025 15:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eI-0006cn-HP
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:48:58 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea11d7e5-486d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:48:56 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-606ddbda275so4520020a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:48:56 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:48:55 -0700 (PDT)
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
X-Inumbo-ID: ea11d7e5-486d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829736; x=1750434536; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0jov675Ch52OlGerP1rZFs8+ZLJQY6S/aZdq380T/c=;
        b=Vcs2sGd1mUH/mGtkiCh2/Vx96CoP/TPelPcxkf6BUToVbUMdm8zm4l3gM3S+wH2XI0
         0wH1yMZa5550GYrszuBtOJfjxGkrFkNNUZGfdE+BRCzwJ2yu0yp34+Uz9Ttg44kS1qjW
         uIdpZylFLtl2+zsdlM94yiac/3l0nO6tYt9abTZXnCcu3a8knRybh51lIZnbhPlvnDo2
         p4qZkpv8QV/vVBPn39NlD2DYecP60HIl6z6nZ6ixh2QSIRnopZJL24lmQTUFUAZ2EwNk
         Rqk4ExbmesYHSEKJ/CFH/w/zMItS934L8IXRgnm+Pc52evBInxp7LN+JycIpa+TUSsXC
         rsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829736; x=1750434536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0jov675Ch52OlGerP1rZFs8+ZLJQY6S/aZdq380T/c=;
        b=Q4I5EIHO25n2XKjcPUrslnwjmbu27Qf/7nA6/ws/EskgvNLLlv01IDvN5xFOgnMCvi
         u6GG6AwQUDwih8Nfaob1s4eg1/lLMotG8s0CCj6lqiUcBCUCemBabCGqwB3QFyDQs5Wl
         g+HxxiMwiUGvXH2rCmzTqWoD8xxDwZFkvrVSWJzm1SvjZciTo5N+F2IRZE+R7f6E44B9
         /yTq+Ar520B5nDk/qz5PbpGKbof0V5b7x2VSHgv1aKASpxoV9OeTqkjl4i+LONm1or9N
         M59dZWFQG4pn9AY/ghnaS7n/OsxAciOSOWH5Tclsi2rrY/361sA0fx8fPk5H5ibpHLli
         RIRQ==
X-Gm-Message-State: AOJu0Yw2GZyNfYOKjKbJKTp0KwjdkE1Xg0ALzqcZ7EF+dniVcEAjGCSm
	5bC/q5AAyEc2gSvqIf1w4zP3KpS+sGtMRHCigA4Six3r6PoK9Kfd8T1NABZNcQ==
X-Gm-Gg: ASbGncsxd4/6n9yBZHLVNB05x5RrT56Scpfj7c930PNwZa0Na/W8tA2WinRNHK8IFmG
	+x70ZuBV5FK16GunijGS2sdUs+IS3YXQOJkAhE4rF8TGZCHJLkjkcgJkugLWf1XxpDyPB9xzKD5
	2N9oTGPwetqCMVupoBFeoz17L16/NeZpW1J8wX9Qv4OLD6fnVMcSHNg3UBt7LKwDOHHIYqbVOG1
	RsCSDkvTmibw6Qse8OWbx4POa568CzQ9jvBGiUbM82Y+qCrHmaiZY0w+C49/y/KBWDVE6vkyEoy
	s3LZXJKCbkYV9xkqzqijAyiJg6iVHWIWSDPXw7zz9MAdaDvfy/PAQr4VZjf94TUR5R/CSt8eDpR
	SPxcZOTo8zLJdWXWRmQO5q+05MT29
X-Google-Smtp-Source: AGHT+IHNp2n+N2zSNwO1LYUnzX+dMDQhBgZi6TUsUHFgaKGAmAn5lMRdwaXrTiO0SGtTXsd8a+l96g==
X-Received: by 2002:a17:907:7241:b0:ad8:9428:6a27 with SMTP id a640c23a62f3a-adec5c7721dmr382814866b.50.1749829735525;
        Fri, 13 Jun 2025 08:48:55 -0700 (PDT)
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
Subject: [PATCH v5 1/9] xen/riscv: dt_processor_hartid() implementation
Date: Fri, 13 Jun 2025 17:48:40 +0200
Message-ID: <c76d79ed590988850fd3db0c79fc7a2ec1f7f078.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements dt_processor_hartid() to get the hart ID of the given
device tree node and do some checks if CPU is available and given device
tree node has proper riscv,isa property.

As a helper function dt_get_hartid() is introduced to deal specifically
with reg propery of a CPU device node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Rework ac overflow check in dt_get_hartid().
 - Update if check with (ac > 2) before dt_read_number() as it return uin64_t, so
   with ac > 2 it will return incorrect results. In case (ac > 2) return ~0UL,
   so this hartid will be skipped.
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
index 0f9c2cc54a..470f6d1311 100644
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
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &len);
+
+    /*
+     * If ac > 2, the result may be truncated or meaningless unless
+     * dt_read_number() supports wider integers.
+     *
+     * TODO: drop (ac > 2) when dt_read_number() will support wider
+     *       integers.
+     */
+    if ( !cell || !ac || (ac > 2) || (ac > len / sizeof(*cell)) )
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


