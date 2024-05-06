Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03848BCBBD
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717440.1119732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNm-0004He-Te; Mon, 06 May 2024 10:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717440.1119732; Mon, 06 May 2024 10:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNm-0004Cq-JK; Mon, 06 May 2024 10:15:42 +0000
Received: by outflank-mailman (input) for mailman id 717440;
 Mon, 06 May 2024 10:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNk-0001n2-GK
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95f52bdb-0b91-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:15:38 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso283056066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:37 -0700 (PDT)
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
X-Inumbo-ID: 95f52bdb-0b91-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990538; x=1715595338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9aRyETJM++e8QaOVBfsR9DXY+H55bqORXnss0g7U94=;
        b=Vj6N//DgZ6M7A5/U+cAUxc7UatQTZ7mfZg3wrzK8oxmrzK44w0Vp1aVKer3lKePuKZ
         RaLkDamDGoNew10UmxcWb+Ut0kf/kWWFWf2L8zjEG68k+ZdOwWkzkBd61/L67I1jHlLO
         NuVxb0t4as5w0Pz8VTWwxrVX5D9jLfK0nksHqGVemprxpEqr5H/mB1FPrZYceA7/y2UZ
         1IXrU83naBYK6KquA07kxzBmPQY4/5B87s3p0HLjqBvbgBHG2nKsjTGy0GAYhE07qW45
         +f/fr1Sb+SiUe/1XUG+461lTPLaRYiu4Fz1+0asrw33AfCAA1bpOzP9WNT2SAR2sM2Gb
         U2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990538; x=1715595338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9aRyETJM++e8QaOVBfsR9DXY+H55bqORXnss0g7U94=;
        b=YmWDo07/BQ6pUJaZaXNc46P4z88+rEset4+oGN0fSeShYAIbxDpdfNl8MYaGczGAis
         LUAIzw/5zA7HjAI8e0ItFRoPHzGxzIdXB5QgIyBxURSX9tAIeHcca0TjihhelLmwN7uX
         3c5Uz9O3Qb2RreWVtjZq2DGVp5f8TpWQrRvfxlVmDrcRWkFq2sTGv/1aCRIaYFBQVGE6
         JeP9HoDSkmEj+tML8948S1tZ2pUwJkZaSQwhLAHirzi3t9nz8A6CNDGfR84Kd0QsObmc
         JlLzE8UPAS2N48+4O5GTA9jLIovpqgjQs5dsgXWFr4C3F0ohppCjxGeKQPpiL/T7GalX
         mK/g==
X-Gm-Message-State: AOJu0YyPP9JNV1tHXDggXFZhQcCrfxNa4q3l/KoUmMnGtaXrhwrJ7nRY
	QiaPzPqTapafkwWaEHbnI1gCLsYjIZ/IoezSqWHlXsgexcXlRWZJv7QTnQ==
X-Google-Smtp-Source: AGHT+IHI93x4RqSFxuW56ORAdgjkjFHZj7dEuWqCEvHuMmmbdXeYP0LpN0rimu9dVLlOWXtWCB67jg==
X-Received: by 2002:a17:906:2492:b0:a59:9f4e:4e3d with SMTP id e18-20020a170906249200b00a599f4e4e3dmr4246517ejb.3.1714990537955;
        Mon, 06 May 2024 03:15:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 10/15] xen/riscv: add required things to current.h
Date: Mon,  6 May 2024 12:15:19 +0200
Message-ID: <083df7371fa500056fe160261e83b5f89236e3f8.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V9:
 - Nothing changed. Only rebase.
---
Changes in V4:
 - BUG() was changed to BUG_ON("unimplemented");
 - Change "xen/bug.h" to "xen/lib.h" as BUG_ON is defined in xen/lib.h.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add SPDX
 - drop a forward declaration of struct vcpu;
 - update guest_cpu_user_regs() macros
 - replace get_processor_id with smp_processor_id
 - update the commit message
 - code style fixes
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/current.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index d84f15dc50..aedb6dc732 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -3,6 +3,21 @@
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
+#include <xen/lib.h>
+#include <xen/percpu.h>
+#include <asm/processor.h>
+
+#ifndef __ASSEMBLY__
+
+/* Which VCPU is "current" on this PCPU. */
+DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
+
+#define current            this_cpu(curr_vcpu)
+#define set_current(vcpu)  do { current = (vcpu); } while (0)
+#define get_cpu_current(cpu)  per_cpu(curr_vcpu, cpu)
+
+#define guest_cpu_user_regs() ({ BUG_ON("unimplemented"); NULL; })
+
 #define switch_stack_and_jump(stack, fn) do {               \
     asm volatile (                                          \
             "mv sp, %0\n"                                   \
@@ -10,4 +25,8 @@
     unreachable();                                          \
 } while ( false )
 
+#define get_per_cpu_offset() __per_cpu_offset[smp_processor_id()]
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* __ASM_CURRENT_H */
-- 
2.45.0


