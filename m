Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203084FB60
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678784.1056331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBM-0007xD-N6; Fri, 09 Feb 2024 18:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678784.1056331; Fri, 09 Feb 2024 18:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBM-0007mT-FN; Fri, 09 Feb 2024 18:01:00 +0000
Received: by outflank-mailman (input) for mailman id 678784;
 Fri, 09 Feb 2024 18:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYVBL-0007U9-6Q
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:00:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d6343f5-c775-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 19:00:58 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-561519f8698so603693a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 10:00:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 fd1-20020a056402388100b00561103f29fbsm984503edb.75.2024.02.09.10.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:00:56 -0800 (PST)
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
X-Inumbo-ID: 2d6343f5-c775-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501657; x=1708106457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enFGeu4zcdTjkPATANnCevJL8MNitOguXGYXr6w8aDE=;
        b=lWzkJE1/eBHbrk0JVrrYzlB1xrw/XxdQapp+y5EQvqxEd0mAf8LG3A8FS2kgfG5Cgl
         bnL+Dsetmn+1YXbRYTbDAQWaSYGryAkS16pNiTi8tihKp3pdAwFI+B6x5GW5Ohk+k5AD
         roOZqBJJJ/CcGs+P2BcT8A1Wz+wm2Gb6bdQfOd9Mkk9NHAufGmEsMwxp6x9cm187haQ3
         Oqpi9Xw+M+mDdTsIAxgVAPUQZSPs6M/D0z0XeV7MpeDk2+1f9dSbDd0WRhAXsffUUFaA
         r1UBZzirKlpQ3ASTZW8P2f7Z4aTvpFDsPcvi67P2hOesghVDfavvfe83n7rp1txlFdDD
         cPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501657; x=1708106457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enFGeu4zcdTjkPATANnCevJL8MNitOguXGYXr6w8aDE=;
        b=OOE7/phfUcHi4HBqoS5K4AePa7q2ndB/1Bkv5M3RLP0OsRP/NcJcFw6lRFuMiaztY8
         ZuTs64A5NuqJNl7AoSBj+S1Ce4aEK2+UuvMVmmw0o7t6EdmIJrwXBDKVoq14azlHM6g0
         mjmgMeia+gWwYpYVht8k4FifJKz4VakdWkGwKfKk4F15kE+Kuy04pdqwsSiBisw6mNWe
         dVITSgohStnCxA3XYYbORbg2GOTIal7tY9NchKZc06ETSg8q8ZhbziJwdzI/N/Fq+R1w
         G1g1PlvuT4rUe82vVBXZkniz1ZZdttTFwwwDu/xUn08RoRBJ4bZChKnWAqEN2WKO4BPe
         IQ4w==
X-Gm-Message-State: AOJu0Ywfj0md9IaZeQEN5DJIrLArrYqo++/KRgCgi2YdqCU2tqBef2oo
	RG+SKKKWWnvixQOYh8ZvH9IhSMlAkDcRkx+JeghWm/lY/FhHUus/WKp6p6fY
X-Google-Smtp-Source: AGHT+IFYFhz9toHU1yUGZQf/W/6R7wMN3qe/PwM2zpmugwrVd6BkNnTFjWyNy6TK0+lm/sJAdQDYyw==
X-Received: by 2002:aa7:d4d5:0:b0:560:269c:214f with SMTP id t21-20020aa7d4d5000000b00560269c214fmr2020823edr.19.1707501657084;
        Fri, 09 Feb 2024 10:00:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW020EtyrHen7sM4ysquTcqWN2lu/YXqgBtqrhn12PZMbnUApXKGPJoyceKy8+JP5xggN32sxpKIJEa2WEjmkXghB8tQrmvNfk97NjuvDlc9sUsFrW5TqpIekjRRltkgJANojZC+d/M8AFo7eCqEP5CwWt9BJSswaDSGtiy7ZxV6eHW8XMYJzlw5Y+K29XngggJQlay437ulOOnMxbnPqZt7N6NgIWwAq7MJqo7tBZBy7VjXwYOlB0h8pepc391WS6ErYNyBZkaDkquAGt6bYOm21mabVakYwSLfGsrz+2/z/8K776zOaf2+BZPDZvwlHGr+uyyVcGC83tTnSxGxPVKHCp3mphuyUm1Ikiu8OQyQG//CtSndxmzts1LTJUJh1lcpCvATu4zNFESpWU/d54AB99fnRbwPZk/1Dhc68hDUChAvrKotRg4xBzyjmEm0tzNZHarxgMGXm7tz6BIur6wxNng4O+2Qv8JMpY=
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 4/7] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Fri,  9 Feb 2024 19:00:46 +0100
Message-ID: <e1927bde3fa27a934e8ccaa8969b38e8a5dff52e.1707499278.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707499278.git.oleksii.kurochko@gmail.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
allows to avoid generation of empty <asm/mem_access.h> header
for the case when !CONFIG_MEM_ACCESS.

For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
and traps.c because they require some functions from <asm/mem_access.h> which
aren't available in case of !CONFIG_MEM_ACCESS.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
Changes in V8:
 - Add Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - Remove the way how CONFIG_MEM_ACCESS is disabled for PPC and RISC-V.
 - Disable the config in ppc64_defconfig and tiny64_defconfig (RISC-V).
---
Changes in V5:
 - Added dependencies for "Config MEM_ACCESS" to be sure that randconfig will not
   turn on the config.
---
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/p2m.c                      | 1 +
 xen/arch/arm/traps.c                    | 1 +
 xen/arch/ppc/configs/ppc64_defconfig    | 1 +
 xen/arch/ppc/include/asm/mem_access.h   | 5 -----
 xen/arch/riscv/configs/tiny64_defconfig | 1 +
 xen/include/xen/mem_access.h            | 2 ++
 6 files changed, 6 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index b991b76ce4..2465c266e9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -7,6 +7,7 @@
 #include <asm/event.h>
 #include <asm/flushtlb.h>
 #include <asm/guest_walk.h>
+#include <asm/mem_access.h>
 #include <asm/page.h>
 #include <asm/traps.h>
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9c10e8f78c..8ddca643d4 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -35,6 +35,7 @@
 #include <asm/cpufeature.h>
 #include <asm/event.h>
 #include <asm/hsr.h>
+#include <asm/mem_access.h>
 #include <asm/mmio.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
diff --git a/xen/arch/ppc/configs/ppc64_defconfig b/xen/arch/ppc/configs/ppc64_defconfig
index f7cc075e45..48a053237a 100644
--- a/xen/arch/ppc/configs/ppc64_defconfig
+++ b/xen/arch/ppc/configs/ppc64_defconfig
@@ -6,6 +6,7 @@
 # CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+# CONFIG_MEM_ACCESS is not set
 
 CONFIG_PPC64=y
 CONFIG_DEBUG=y
diff --git a/xen/arch/ppc/include/asm/mem_access.h b/xen/arch/ppc/include/asm/mem_access.h
deleted file mode 100644
index e7986dfdbd..0000000000
--- a/xen/arch/ppc/include/asm/mem_access.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_MEM_ACCESS_H__
-#define __ASM_PPC_MEM_ACCESS_H__
-
-#endif /* __ASM_PPC_MEM_ACCESS_H__ */
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 3c9a2ff941..09defe236b 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -6,6 +6,7 @@
 # CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+# CONFIG_MEM_ACCESS is not set
 
 CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4e4811680d..87d93b31f6 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,7 +33,9 @@
  */
 struct vm_event_st;
 
+#ifdef CONFIG_MEM_ACCESS
 #include <asm/mem_access.h>
+#endif
 
 /*
  * Additional access types, which are used to further restrict
-- 
2.43.0


