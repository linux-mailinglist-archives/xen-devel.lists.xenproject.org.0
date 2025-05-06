Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6377FAACB89
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977626.1364650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWZ-0006y6-Og; Tue, 06 May 2025 16:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977626.1364650; Tue, 06 May 2025 16:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWZ-0006lF-8U; Tue, 06 May 2025 16:52:07 +0000
Received: by outflank-mailman (input) for mailman id 977626;
 Tue, 06 May 2025 16:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWX-00058E-8i
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:05 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70383527-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:04 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad1e8e2ad6bso10302866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:04 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:03 -0700 (PDT)
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
X-Inumbo-ID: 70383527-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550324; x=1747155124; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/SOhxgkw308OBnI/WK3THzBCPwOXi+kerygsTpNW/c=;
        b=D4NOB6ptEIxC5npJN0Sk9fwO6z/0WMtE/RYMOvzbgeXd+iAkzP8l2xyP8YWYwaFgkW
         H8GMJaJEQ4iddQvRffS52Gc4JzYUsIedTgATvXUtGMi+x3Chr3qeK9YebVIyx2SSUslY
         2q8PEPV7vUnxstz3LONA4/3wvXEqkgadVTHeMBW4Cjs6e3UrVQWdsFZWUU138UW/Rny8
         s9+UcyK6YoxCucFPz8ZOQ5TFgE2Ik/2mzgj4j9rEoYyjLvUj/xNZ8YbCHagF+KCW3dBv
         d6fJYhFLFCNaCD6AHhZuE0JmBo5T0W6zOGceNnde2MkFjcEbhaQW/QrmN8RFl2Q1iEXe
         ow8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550324; x=1747155124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/SOhxgkw308OBnI/WK3THzBCPwOXi+kerygsTpNW/c=;
        b=arRqC/O080TUGHsM8aBTb/ftlJqPoYCP1zgwi82hJBq3WXY7TGSE2NmauzWXa4t6fi
         J534qU5CWhxC1W7gwI2VlkZF9p4gMybYbzJpPdLIha1EtYhVgD5j1R1IU1LFeAXae2BI
         NXiuiaYdv9UD8QqNoARkHeZa18ZEovdd0uthgLf8YjeltBgxNlVMIXV17eVi54flmb3h
         4U/GnHdKvevaEQxFF98CMq9HncasBfFBlXSUZHXKKAHn5bXaT79RMQzURftLkgL/6icr
         y3U+9mSwkOs9zlmD5JM95V3+4TjZcG7ofO8F/00Y5jj7MAen0MaGKjs3r51iIbYLRiVI
         m+6w==
X-Gm-Message-State: AOJu0Yyx34/xt4tpn0L0WsZxGUQ0gZ1LXh6WKpTPN7cqVHSB9A3sEomn
	NCUMh/TB50qGirgMFhbw6C4tsUFpW2L47NgSyCWBdBQSD4d3qZ6GjVPUoA==
X-Gm-Gg: ASbGncsGvQkJ+8U9pVLH5w4rXah0E8fUJLjUmZ5h+ghpN3KKqBxODK/kSTa5k5LrLuW
	q23bay797GPnOy0h9/ke4whGpyF5YpOsYHCdi/Jhueeqp8p9HKXOTgGXvWUx584timmspqMWaMu
	JB7ntrEiTkkmuMrssGPGA4yVGrKrRNKnbu5cVIFGeY3Flt1diLMGPSHfpBmVyQKdj8q3WUNMFUl
	T4dAhAFoePJCDa1gwRJ3i/wlVvthRZDTtRk5sxkHWzUgQXw7QocaTwr6BsqQreMQPDhcTKko1/5
	s7+HJEh6v6cubrJtpg+QL5UFct8s2iB/NTiQdn4dvTZKP+w99KPpaYTlo0bxk9m62rMMwyHyzsy
	JzBw6DwdJUQ==
X-Google-Smtp-Source: AGHT+IF+FS9dHY4GSxXwKN6enokBJRUqaQYv2BAPkxz/tU1ShkpWmC/odJCtGf+4FrCKRACOPu0VRg==
X-Received: by 2002:a17:907:3e9b:b0:aca:a539:be04 with SMTP id a640c23a62f3a-ad1e8c8bfecmr20744966b.4.1746550323669;
        Tue, 06 May 2025 09:52:03 -0700 (PDT)
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
Subject: [PATCH v2 08/16] xen/riscv: dt_processor_cpuid() implementation
Date: Tue,  6 May 2025 18:51:38 +0200
Message-ID: <4e4b3a018e8dacbe85cc080d9209e2ba3cdf4330.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements dt_processor_hartid() to get the hart ID of the given
device tree node and do some checks if CPU is available and given device
tree node has proper riscv,isa property.

As a helper function dt_get_cpuid() is introduced to deal specifically
with reg propery of a CPU device node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/smp.h |  3 ++
 xen/arch/riscv/smpboot.c         | 66 ++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index 5e170b57b3..9d846a1338 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -26,6 +26,9 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
 
 void setup_tp(unsigned int cpuid);
 
+struct dt_device_node;
+int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid);
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
index 0371dfa53e..0b00dd0eb2 100644
--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -1,5 +1,8 @@
 #include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/types.h>
 #include <xen/sections.h>
 
 cpumask_t __read_mostly cpu_online_map;
@@ -10,3 +13,66 @@ void __init smp_prepare_boot_cpu(void)
     cpumask_set_cpu(0, &cpu_possible_map);
     cpumask_set_cpu(0, &cpu_online_map);
 }
+
+/**
+ * dt_get_cpuid - Get the cpuid from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ *
+ * Return: The cpuid for the CPU node or ~0ULL if not found.
+ */
+static unsigned long dt_get_cpuid(const struct dt_device_node *cpun)
+{
+    const __be32 *cell;
+    int ac;
+    uint32_t len;
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &len);
+    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
+        return ~0ULL;
+
+    return dt_read_number(cell, ac);
+}
+
+/*
+ * Returns the cpuid of the given device tree node, or -ENODEV if the node
+ * isn't an enabled and valid RISC-V hart node.
+ */
+int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
+{
+    const char *isa;
+
+    if ( !dt_device_is_compatible(node, "riscv") )
+    {
+        printk("Found incompatible CPU\n");
+        return -ENODEV;
+    }
+
+    *cpuid = dt_get_cpuid(node);
+    if ( *cpuid == ~0UL )
+    {
+        printk("Found CPU without CPU ID\n");
+        return -ENODEV;
+    }
+
+    if ( !dt_device_is_available(node))
+    {
+        printk("CPU with cpuid=%lu is not available\n", *cpuid);
+        return -ENODEV;
+    }
+
+    if ( dt_property_read_string(node, "riscv,isa", &isa) )
+    {
+        printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
+        return -ENODEV;
+    }
+
+    if ( isa[0] != 'r' || isa[1] != 'v' )
+    {
+        printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
+        return -ENODEV;
+    }
+
+    return 0;
+}
-- 
2.49.0


