Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B59A810DE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942506.1341690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKQ-00060Y-Bu; Tue, 08 Apr 2025 15:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942506.1341690; Tue, 08 Apr 2025 15:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKQ-0005vT-4F; Tue, 08 Apr 2025 15:57:34 +0000
Received: by outflank-mailman (input) for mailman id 942506;
 Tue, 08 Apr 2025 15:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKO-0004Yq-Ih
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d6a55dd-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:30 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abf3d64849dso966383466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:30 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:29 -0700 (PDT)
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
X-Inumbo-ID: 2d6a55dd-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127850; x=1744732650; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpeQYUWMQ0EnXPhGUr9CwT2CGE1bPu9ktFLlbeAAZLE=;
        b=EnztfdtDE76uFITi52RB2yffM3YmtgRORIfEZMJPVShuAj9PM5kqiqCdiBcFbzWyeD
         2xZef6gnRIeaY8XsIEch64pBCAjxAxRyxO9/ts6N3FgvtWmirU/2txCagM5UgbamOWRc
         KrGCFBd2sFdaeNpSTtcCKNCc7Yd+C8oVzioYCvoezAQt4gHH3DOvAE2FzBXfblW1MMlY
         3EUPkSURAS478wqIlF7dRNp9ofNxGvjDRbJxDBCg1XxjoM+kvoaPqP1H6FujMJ/vFvPB
         tI+pYfqY6okGCNmxZEY+Qq0xaBgQDtvf0JU/QhAxGDq0UFG7S+yvoXOt0Xyo6EPP0qwL
         /yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127850; x=1744732650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpeQYUWMQ0EnXPhGUr9CwT2CGE1bPu9ktFLlbeAAZLE=;
        b=sF7rMK0iRkOk0ePdto/DMFPe2l5vIqZfChIMLW8xOkxbx3IPslhXoy0oQT5g8kwNor
         7ssZ49atMxwBkyNFSkDUOPFhtZWQSz+Ut4zVriVhB0tO2dnPH4soRNCrIYtNBx4Yf/+A
         v6OL75wF+DFVWViXWOWo58QTrRHTZvYNg9C/eXgmDAKXpnbma92pewMjxsMKHB3qkIfk
         GT+ZaqxlhFM9ZJ87nVDTmgQX1sYJ+aV7lEh+lilRsF6AEgPg0NyqimknnUYb040jfG6T
         aj0HcTss/Cy01TwxCt4U2mg/RoI+c6mxWzSqVUDWiF7nFhdQwN5ketGVpBYdqSXbp/k1
         rCWg==
X-Gm-Message-State: AOJu0YwZomf5I32b+fBpUBwOBnWUgNY/wCIkw+CD0uGU5vb522/x+4Az
	Rj4eZuPBIqwDLNBUlAjj9RFmmFlazGauxVQOzpNzmouMaMsTshOr4n1uMw==
X-Gm-Gg: ASbGncsVIWn9x5SPi3bxUBftXXgIiGE1uPj2hFAdqrtGJpl3246RIfNCEBGAZOvwJKi
	pffPaQLFNzh5uya/FUi1ACmx082mm3x13nlGu11bc7lZjpTYsOntFqdMGZ3QKSMm0sfMb1HPzOE
	PoalE/9ozZg514FXAyhFq1WCfGJDh2SwD0nLzEkNgUIlDeWsv6+udk8Cpb4fZTpU92JxJyUu7pl
	C76Mn3M2AShWe6zjQhKfvfVoMVXjjelmF9zmhLFyBZTwA3Nd1EAaP6kbUwMh8XpGM4EAtRuvRI7
	B+BmcSxB1qxVj/IuoX4hSfWn7MM+BzyGDXLb9gwnoWOk9t5bcqKcbQ3n0z45b8eSpovXSxzVrT8
	68HU94Mi/xyMzzBJKypZD923t
X-Google-Smtp-Source: AGHT+IEn04y7KC86eE2BNh70/HPXwqPH/Y/Yt0uP5OBEdcsZQ7+/Gzni+H8MI0kgZ0n6U3pjDLL+rQ==
X-Received: by 2002:a17:907:1ca7:b0:ac4:85b:f973 with SMTP id a640c23a62f3a-ac7d1819306mr1292149166b.34.1744127849988;
        Tue, 08 Apr 2025 08:57:29 -0700 (PDT)
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
Subject: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid() implementation
Date: Tue,  8 Apr 2025 17:57:10 +0200
Message-ID: <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements riscv_of_processor_hartid() to get the hart ID of the given
device tree node and do some checks if CPU is available and given device
tree node has proper riscv,isa property.

As a helper function of_get_cpu_hwid() is introduced to deal specifically
with reg propery of a CPU device node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/smp.h |  3 ++
 xen/arch/riscv/smpboot.c         | 68 ++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index 188c033718..9b68f1e27a 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -26,6 +26,9 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
 
 void setup_tp(unsigned int cpuid);
 
+struct dt_device_node;
+int riscv_of_processor_hartid(struct dt_device_node *node, unsigned long *hart);
+
 void smp_clear_cpu_maps(void);
 
 #endif
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
index 0f4dcc28e1..3193639f00 100644
--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -1,5 +1,8 @@
 #include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/types.h>
 
 cpumask_t cpu_online_map;
 cpumask_t cpu_present_map;
@@ -13,3 +16,68 @@ void __init smp_clear_cpu_maps(void)
     cpumask_set_cpu(0, &cpu_online_map);
     cpumask_copy(&cpu_present_map, &cpu_possible_map);
 }
+
+/**
+ * of_get_cpu_hwid - Get the hardware ID from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ * @thread: The local thread number to get the hardware ID for.
+ *
+ * Return: The hardware ID for the CPU node or ~0ULL if not found.
+ */
+static uint64_t of_get_cpu_hwid(struct dt_device_node *cpun, unsigned int thread)
+{
+    const __be32 *cell;
+    int ac;
+    uint32_t len;
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &len);
+    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
+        return ~0ULL;
+
+    cell += ac * thread;
+    return dt_read_number(cell, ac);
+}
+
+/*
+ * Returns the hart ID of the given device tree node, or -ENODEV if the node
+ * isn't an enabled and valid RISC-V hart node.
+ */
+int riscv_of_processor_hartid(struct dt_device_node *node, unsigned long *hart)
+{
+    const char *isa;
+
+    if ( !dt_device_is_compatible(node, "riscv") )
+    {
+        printk("Found incompatible CPU\n");
+        return -ENODEV;
+    }
+
+    *hart = (unsigned long) of_get_cpu_hwid(node, 0);
+    if ( *hart == ~0UL )
+    {
+        printk("Found CPU without hart ID\n");
+        return -ENODEV;
+    }
+
+    if ( !dt_device_is_available(node))
+    {
+        printk("CPU with hartid=%lu is not available\n", *hart);
+        return -ENODEV;
+    }
+
+    if ( dt_property_read_string(node, "riscv,isa", &isa) )
+    {
+        printk("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
+        return -ENODEV;
+    }
+
+    if ( isa[0] != 'r' || isa[1] != 'v' )
+    {
+        printk("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
+        return -ENODEV;
+    }
+
+    return 0;
+}
-- 
2.49.0


