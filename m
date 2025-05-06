Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E230AACB85
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977619.1364593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWS-0005VX-N3; Tue, 06 May 2025 16:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977619.1364593; Tue, 06 May 2025 16:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWS-0005Py-H9; Tue, 06 May 2025 16:52:00 +0000
Received: by outflank-mailman (input) for mailman id 977619;
 Tue, 06 May 2025 16:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWR-00058E-HQ
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:51:59 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ce27762-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:51:59 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso262713666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:51:59 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:51:57 -0700 (PDT)
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
X-Inumbo-ID: 6ce27762-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550318; x=1747155118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8le7vZakEngLNFsWoDo29Hu279LBR8cdaIyUujlRsQ=;
        b=d4PbMPo0sYUKhPtKk9Q6BsPDLD7mbTesm1fipeL7HH4Si+eC0HriH7SIa1+vK2FVj6
         NMAMSIKfWDxMy5RoTg0NA9v3jKo6Z5DCj+u1ZeSRSimJ8ZH4RpTpfr3ZkiIyQO0zYVoA
         PkAA4bQzFWJIDEC+s9axXHHYWQfhh59jtJ9WsbiIWKG4z3AKelvpV85XgLCtlVnCEvez
         QGdu2jwtTdRizvZBGVR1JPUUb7LX0ZCFiTWfbinea2UVjcLffKe3L/PJroJa4Axojnlc
         jYw3mmb+z8v8e+h9MhS4SKu0sgztCHcGic+cEXLI4a4ie2s2zliJiDWi7Rh8BAuvYTay
         GV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550318; x=1747155118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8le7vZakEngLNFsWoDo29Hu279LBR8cdaIyUujlRsQ=;
        b=KVd9IPmRRMbKs0C8jaartlKqgqUVHvQjknC8xkK4xWFvrVITPBWUDeyBMYKjBhhao3
         w3vfvbD/xNvgyLZeHYAM0UbqS9nddVruZxZsvB+WFgB0cS9G6rRfTyEWCjDF4jgldDfE
         BIYLVoD7M+IjwAhvTZTraqBuSR40gffvuVLvUV9VWDboDiwS+cTPPafNWx0WrdJe8Cd9
         iHzIxOUOuxrgEUwyaSsHEZTakvlYtme49RTUeuHwRAHQXR7NuzFbAXLXOg/kU850Tzo6
         iaJp8NQ8wJC7rbmJYq7+QlhC9eRkrkOGHhsVVL/ytFdGZy6dtLGiQgdpzs14ZCjri2cp
         8hJQ==
X-Gm-Message-State: AOJu0YxNJktn/CMJ8NCe3J32jq2i+CMIdG+OgWfwb3pZcKRsmmUwnjbf
	WrZ8fMX6RFb1EzO2D330l6gIgRduW7qkFl+GJPS8dVg/psV1O3Ok5NNmbw==
X-Gm-Gg: ASbGncvavRPMwt5d4dCsmgrDcroMC5UBGiPya4cGu2qxhsIKx7/+A+8Ofa7fUZXbvk1
	NtTcSvWkCf2/wz76ZxWNnuJbgYMvtWMa78rKXDXo7Z0dyQ/7DZW/l46cyPozm7ujP3KYHos6ENE
	E8e35AT+z2P9wEv0xPqpFclO4Mn4mnDKpADEWHoPWrjkEByA81D/8LXhfwzt3o0h0VvQzgk4FX7
	06rcSGXZ+KeK+vRPRkwhL1rjlAzy+qUVPL+wb1wsxGYWbG09+xWbU6Ydn1nPwpx3vuTOk7GiR5H
	o8bo3TOYRgQ4hqRY0JTR4AStQVvP1H/gNNF5/+4bWDwQkDdhk+A1guRTW/iX+EMUdqZJ8vM9tpI
	fxOMNFUASIg==
X-Google-Smtp-Source: AGHT+IHO/Fo4tlE/KU7nbSnaumhBbp2s/ZDjX7acHYn6sWOydJxlNhuhT1vfDdpqT+aAvZwBra8qdg==
X-Received: by 2002:a17:906:dc8b:b0:ac7:3911:35e6 with SMTP id a640c23a62f3a-ad1e8d0c9b3mr16799266b.58.1746550317709;
        Tue, 06 May 2025 09:51:57 -0700 (PDT)
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
Subject: [PATCH v2 02/16] xen/riscv: introduce smp_prepare_boot_cpu()
Date: Tue,  6 May 2025 18:51:32 +0200
Message-ID: <704550ffbb34c94bfe85be928b2fcc0105552e82.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize cpu_{possible, online}_map by using smp_prepare_boot_cpu().

Drop DEFINE_PER_CPU(unsigned int, cpu_id) from stubs.c as this variable isn't
expected to be used in RISC-V at all.

Move declaration of cpu_{possible,online}_map from stubs.c to smpboot.c
as now smpboot.c is now introduced.
Other defintions keep in stubs.c as they are not initialized and not needed, at
the moment.

Drop cpu_present_map as it is enough to have cpu_possible_map. Also, ask
linker to provide symbol for cpu_present_map as common code references it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Add __read_mostly for cpu_online_map.
 - Add __ro_after_init for cpu_possible_map.
 - Drop cpu_present_map and cpumask_copy(&cpu_present_map, &cpu_possible_map);
 - Drop cpumask_clear() for cpu_{possible,online}_map.
 - Ask the linker provide the symbol for cpu_present_map as common code uses
   it.
 - s/smp_clear_cpu_maps/smp_prepare_boot_cpu.
 - Include <xen/smp.h> in setup.c as smp_prepare_boot_cpu() is declare in that
   header now.
   Also, drop inclusion of asm/smp.h in setup.c asm xen/smp.h has inclusion of
   asm/smp.h.
 - Update the commit message.
---
 xen/arch/riscv/Makefile  |  1 +
 xen/arch/riscv/setup.c   |  4 +++-
 xen/arch/riscv/smpboot.c | 12 ++++++++++++
 xen/arch/riscv/stubs.c   |  6 ------
 xen/arch/riscv/xen.lds.S |  2 ++
 5 files changed, 18 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/riscv/smpboot.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d882c57528..f42cf3dfa6 100644
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
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 4e416f6e44..2a564512d7 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
+#include <xen/smp.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
 
@@ -19,7 +20,6 @@
 #include <asm/intc.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
-#include <asm/smp.h>
 #include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
@@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     remove_identity_mapping();
 
+    smp_prepare_boot_cpu();
+
     set_processor_id(0);
 
     set_cpuid_to_hartid(0, bootcpu_id);
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..0371dfa53e
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,12 @@
+#include <xen/cpumask.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+
+cpumask_t __read_mostly cpu_online_map;
+cpumask_t __ro_after_init cpu_possible_map;
+
+void __init smp_prepare_boot_cpu(void)
+{
+    cpumask_set_cpu(0, &cpu_possible_map);
+    cpumask_set_cpu(0, &cpu_online_map);
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
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 818aa43669..8c3c06de01 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -165,6 +165,8 @@ SECTIONS
     ELF_DETAILS_SECTIONS
 }
 
+PROVIDE(cpu_present_map = cpu_possible_map);
+
 ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
 ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 
-- 
2.49.0


