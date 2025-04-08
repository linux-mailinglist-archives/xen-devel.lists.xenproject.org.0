Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F88A810E1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942502.1341661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKL-00059Q-5X; Tue, 08 Apr 2025 15:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942502.1341661; Tue, 08 Apr 2025 15:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKK-00054C-Va; Tue, 08 Apr 2025 15:57:28 +0000
Received: by outflank-mailman (input) for mailman id 942502;
 Tue, 08 Apr 2025 15:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKK-0004Yq-2s
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abb371a-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:26 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so1115126066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:26 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:24 -0700 (PDT)
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
X-Inumbo-ID: 2abb371a-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127846; x=1744732646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hi1xjODCV/sXPERE+O05f5Q95fvnC5BVyDMZVpi670=;
        b=X/Pk5RkKEXtsxMOxRQrqB/hhe2XGq7K5S6nOokSU4rNfzYgH3lNUvC7uZbsFQ8MniX
         H8Gd9gjKhPWhCZDydOV5tfT7AYmsMiCCXwcRByo4uexz7I7W6ntqIKilbUQ1DcS6OTXy
         xX3bBxYm4eJf2I3Hw1B1zEb0w0Mm8sB/WJ7rxrHja5Sa3q55UIr0CzHhtmOo46M8Q3D5
         pGj8zEaUvea5MUPoVLRns3Mu5jHVjKcJxZAo4sPoep5aPSKPq59BcFYa9eMNZ6EisnZK
         zjHQnptWgbPHcxSROGP9AZZRQMi7PwhzkezCPBwHZ6BmLxqxBpzKG/FVJLbeaoF9A1pc
         nuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127846; x=1744732646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hi1xjODCV/sXPERE+O05f5Q95fvnC5BVyDMZVpi670=;
        b=K5Dq8RpMjdHSkrwPWsCFt9OB+mWgwlB3G8GETyacMqCdorlHnrDtD3RSCkIyhzWy0w
         9+ZBH3MhNj+iFEheDxfdBJoxVp1gp6+pVnB/LCQEPltfthAMnTMODFwQCscxMHPqCCFJ
         r2ZjDgMNST4S0OcWCpplKRl+sg5V+BgMPCSWrmGn25YYNcDghJGAQQxM8KBOVyC0sJn0
         ww+UiLLHUuebzWyV8iyp/tNgMk2WonLtze/VMbj4r2SaPliIV1cQDNGXWWCnLG2v0nqB
         I4+vXzNTYryfT8fefVoVJJLt/7BTSNDczrpEegPN6WjBxXZHmZFfRUF8C/EtFLdBbO1L
         G5KQ==
X-Gm-Message-State: AOJu0Yyhe1U2+gbxjZI85+pKZf7d5hndaqKcpz4GKWziMz+QDP04J1KE
	ncLqzS6+CNcwoImBVFEuBKsfMkWT9Ng5JMnaatU+B4yDXmSJ8AILU+fgJA==
X-Gm-Gg: ASbGncvx1+FvwLShhn6V1J97guv8p4IPgRbp7h2PPXQj4KbN259JBF9mxl9E+1FYVKZ
	nInMPEp4/C2hVYHU022rVwa8FXu9oNPvwV+YYcGc3KQtQEf4MiUJDnODFfP+0ap5cRP5PmXtt3x
	uQftVtf08Hj8k7gtWnICN83QapJoGDOEhRg/C77EGn2+wQszZECorVEZ1O82g2DrMoiRCBckHbX
	bvWn6/yI6og6r9PkDq6bOAhwnQP3iryrWQuFbn3TlcsMVokJVRbKOfMv+s7HwgewgvZ/aQcPKSx
	mtl3vnBm7PfQ6L1dFfREF5VwZQTzMznxMMfvWZCXQwSWuqqFDptgiXBoAx0usoL7cafd05PZINi
	QGKmMnHXZKIzJTg==
X-Google-Smtp-Source: AGHT+IGPZLQUmzRVvlQPHpMLUPk5BR/JAj1Ppc1lOSe7dGvIQ+x4G3kqQ5tkLmaV6Dmf0Dg7h9DOjQ==
X-Received: by 2002:a17:907:7e88:b0:ac6:bf3d:bf45 with SMTP id a640c23a62f3a-ac7d19671efmr1737640366b.36.1744127845398;
        Tue, 08 Apr 2025 08:57:25 -0700 (PDT)
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
Subject: [PATCH v1 02/14] xen/riscv: introduce smp_clear_cpu_maps()
Date: Tue,  8 Apr 2025 17:57:06 +0200
Message-ID: <ce3460b3857cca9e6f3072a8ddd50b31cb46b855.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize cpu_{possible, online, present}_map by using smp_clear_cpu_maps().

Drop DEFINE_PER_CPU(unsigned int, cpu_id) from stubs.c as this variable isn't
expected to be used in RISC-V at all.

Move declaration of cpu_{possible,online,present}_map from stubs.c to smpboot.c
as now smpboot.c is now introduced.
Other defintions keep in stubs.c as they are not initialized and not needed, at
the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/smp.h |  2 ++
 xen/arch/riscv/setup.c           |  2 ++
 xen/arch/riscv/smpboot.c         | 15 +++++++++++++++
 xen/arch/riscv/stubs.c           |  6 ------
 5 files changed, 20 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/riscv/smpboot.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 0c6c4a38a3..f551bf32a2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -10,6 +10,7 @@ obj-y += sbi.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
+obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index 5e170b57b3..188c033718 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -26,6 +26,8 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
 
 void setup_tp(unsigned int cpuid);
 
+void smp_clear_cpu_maps(void);
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 4e416f6e44..7f68f3f5b7 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     remove_identity_mapping();
 
+    smp_clear_cpu_maps();
+
     set_processor_id(0);
 
     set_cpuid_to_hartid(0, bootcpu_id);
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..0f4dcc28e1
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,15 @@
+#include <xen/cpumask.h>
+#include <xen/init.h>
+
+cpumask_t cpu_online_map;
+cpumask_t cpu_present_map;
+cpumask_t cpu_possible_map;
+
+void __init smp_clear_cpu_maps(void)
+{
+    cpumask_clear(&cpu_possible_map);
+    cpumask_clear(&cpu_online_map);
+    cpumask_set_cpu(0, &cpu_possible_map);
+    cpumask_set_cpu(0, &cpu_online_map);
+    cpumask_copy(&cpu_present_map, &cpu_possible_map);
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 83416d3350..fdcf91054e 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -11,12 +11,6 @@
 
 /* smpboot.c */
 
-cpumask_t cpu_online_map;
-cpumask_t cpu_present_map;
-cpumask_t cpu_possible_map;
-
-/* ID of the PCPU we're running on */
-DEFINE_PER_CPU(unsigned int, cpu_id);
 /* XXX these seem awfully x86ish... */
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
-- 
2.49.0


