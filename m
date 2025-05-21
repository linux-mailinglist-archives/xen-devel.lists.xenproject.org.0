Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1317ABFAA4
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992144.1375986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvO-0006AX-AE; Wed, 21 May 2025 16:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992144.1375986; Wed, 21 May 2025 16:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvO-00064B-4j; Wed, 21 May 2025 16:04:10 +0000
Received: by outflank-mailman (input) for mailman id 992144;
 Wed, 21 May 2025 16:04:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvL-0004Wm-LB
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:07 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38a72137-365d-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:04:06 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6023cf146d3so1699237a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:06 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:04 -0700 (PDT)
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
X-Inumbo-ID: 38a72137-365d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843445; x=1748448245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Emu0YizvdQs9hLvUx13eJRnhsUQuOpHcWfHxBTfGWM=;
        b=db5PTxCfdZ19nUZSMnwF5G4ApBqDy1KWg/wW1UimOAi+U3daRR2LPW/wPJPcZCJs6R
         PBZXuiqIf1o+G9EFK8EBD+qKCouJBBJxgJskeGn4viIMc44TOhsqqlMBOZSV9VFDRdM6
         APuLdFvugHIMyVkXaLXY2cnf05LZVSnSPVILZV7RUA34Zh6fHmjFvh0mmBJAuaqLGGGm
         jJCgsSLdfvqSf4oNb0jkR0f8oewG6SxM5a/dxqe2pt0OHuvWeNnirk7LbLTlK/4wGVtI
         Nww8+M/XH/iIa6dF40sY55to3zDrq81ekATyfjLIMdHMRVlT0t9Orm5OCEF4tJnU6bGq
         O0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843445; x=1748448245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Emu0YizvdQs9hLvUx13eJRnhsUQuOpHcWfHxBTfGWM=;
        b=NC4GEaLJUMgqTS9NMWli2K+Uh485mQIhmAI4hYMFD5MyYu7FAgDc+a7TUCJIILIGjr
         JU08wDw80KvxvXYV/+qhu3Aa6EqmCcM0OWraT/DIlBfaaux+RKqbRF0sZKil9mkpM/KR
         zRNbc431x3R0HHiHFwi9Mxk0ydz/+TzZjkAgCX/OzDv4fPHlR4wT07oBGpdqLQEZduxa
         09Zx29JYMmUQFXbFtiPWmv5LjLw0oW42yh/Wu6UQ76MKWEImo2ojEPMW5VFJHcmtJQLN
         ZKwfFimNoPh7crXkf8RcottxGlwPPkY2qR6RMQe5t4RdPzU5EKsdDN+umXNCxiEpnxxu
         Pa5A==
X-Gm-Message-State: AOJu0YxCjy5Ljw3lmZ9ftUr4uO9fFxJcQAXq5+m5P8UWfOXVcLdwx6nt
	r1KDInYdND2E7MHoYPF/y9IGkf2IMXzjJrJcpBewWuKCe90zutpxut4csFE9BQ==
X-Gm-Gg: ASbGncuPB1varSPc1xGZ2z9PjnYrvHb+H9C7wlwj7TrmymldAXweP8Lvi+FiUwDiZxJ
	7d0NqLbaQCKc9JzhPOFc4D+7ovKAzNXUtZok8O9W4pSU3TjZA37UXI2WdpSPxIkiiMKDidTOK08
	AsAmIbYBZaeKY+DfOedxeVmqOmAUBL73AV5Solaj2wnb1P1Mv+3Q8NJ/PImlbHkKEIQO1Gvk2+X
	bbf4ir2PztjufsP2W0blRURkYB/43V4ZxsMgE72t8UXTvzlVgw6obKQB+kuCXIrzX19gThHpCeo
	wwKawCm9t2FpITFBqXJ2f7guS46bXpfRDmuDTHyHKpxVWSAwCjW9l/wo65dQARB9/XCsSqgqKD4
	yoH4ndMrM1uUnaX1kbA==
X-Google-Smtp-Source: AGHT+IHHhP/LsIguqgN6zsA0Jjn44n4Zs/ziLAUhK8pM5XA6DUuNDWtu1jFotLN++2Ql7i2mBzKu3A==
X-Received: by 2002:a05:6402:280c:b0:600:1167:7329 with SMTP id 4fb4d7f45d1cf-6008a392452mr18561851a12.5.1747843445031;
        Wed, 21 May 2025 09:04:05 -0700 (PDT)
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
Subject: [PATCH v3 06/14] xen/riscv: dt_processor_hartid() implementation
Date: Wed, 21 May 2025 18:03:46 +0200
Message-ID: <5aec324c04c67ba88336244358542f3faa6726b2.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements dt_processor_hartid() to get the hart ID of the given
device tree node and do some checks if CPU is available and given device
tree node has proper riscv,isa property.

As a helper function dt_get_hartid() is introduced to deal specifically
with reg propery of a CPU device node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/smpboot.c         | 69 ++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

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
index 0f9c2cc54a..b8d18fc3ea 100644
--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -1,5 +1,8 @@
 #include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/types.h>
 #include <xen/sections.h>
 
 #include <asm/current.h>
@@ -14,3 +17,69 @@ void __init smp_prepare_boot_cpu(void)
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
+        printk("CPU with hartid=%lu is not available\n", *hartid);
+        return -ENODEV;
+    }
+
+    if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
+    {
+        printk("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hartid);
+        return ret;
+    }
+
+    if ( isa[0] != 'r' || isa[1] != 'v' )
+    {
+        printk("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hartid,
+               isa);
+        return -EINVAL;
+    }
+
+    return 0;
+}
-- 
2.49.0


