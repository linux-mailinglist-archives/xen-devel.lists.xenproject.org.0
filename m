Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89526896C7E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700443.1093628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxuR-00029V-GB; Wed, 03 Apr 2024 10:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700443.1093628; Wed, 03 Apr 2024 10:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxuR-00026L-DX; Wed, 03 Apr 2024 10:31:59 +0000
Received: by outflank-mailman (input) for mailman id 700443;
 Wed, 03 Apr 2024 10:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjO-0007Ob-CO
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:34 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd8ce952-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:32 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-515a68d45faso7029561e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:31 -0700 (PDT)
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
X-Inumbo-ID: cd8ce952-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139632; x=1712744432; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBnO9yFQJm71DTw529h3h3x7yVtBkXskdtcbG0S49CI=;
        b=cnv9VVbyizjwcK/HeeHN8+DSB26Aw2mOVRe1f5PmTbOldUp6byE13xXH6qyx/FjeD6
         il7WUJi/B7xOIgwdk6DYsy0sXP5kLZzMwvGCNLng+RUVeC7AJyu5Q6HDX6+4ouk2KLsC
         mOPd97vTUH06H3jpAtK742guFzuLwaE6fhD2Nu2+qEEDcMgK2LDBhkCgMiL9icABD9zr
         TUltgt4AvhOYxh7GeXpgrLvaEJGJ+YODr9lh9AJNwAFxI/AUuBSxLGR+ztie9lX/mlYd
         NSSbfQrTUHIkOW7F25+tteGMfeQmRmcNQbKfmbqNQtI7cWewcrdPGUi8nL77swu9QkQd
         WAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139632; x=1712744432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBnO9yFQJm71DTw529h3h3x7yVtBkXskdtcbG0S49CI=;
        b=eI6FZ3EvEDijztsZI2ynOTBOsD1OfAYW534dDGto+CKXxCxJNby19TN6QXjbp4WxhK
         6izWX4zToVAybl3cqJpUWnJ9s536P5Z1hTRdOeAAz7OVOceyOPhyiJqZ5dL54r8inHyB
         YvzZ2KiCZhGHjKo6mrBqz8/XmukLFwvIlc3qQ6uhVeB2Ly3RO5bwr0sL8rvjhhN4NjGV
         01dA80QfvSkxz/JKVx9o/egoqLh0LIuWzO3nkIx976Fp9sXVVbn3/kjNOgC3juNIS7On
         2Pc3rT2Qi8y7/KcNyykHgX0w5hXKXd9J2Wcsa79OQyFFbA/c8YmgeGziihI/W9NTtMTc
         KKHQ==
X-Gm-Message-State: AOJu0YyKrzjiEZxEzB7YkyjY8bgdwh5TjNQPJJPJkzI2h93EXrZT25RW
	A93F+eUzdQFCT2KAThYUt4s+dHKj5DkMyn3S2pnVU+P/TKZEdmSzeoEkvXzJ
X-Google-Smtp-Source: AGHT+IFYH5a4QwNmIZDQu397VIYey6jJgV2rrThyVidzAQCTas+ctdNgWcwHsWJNFOJV/pciExlKnA==
X-Received: by 2002:ac2:5f86:0:b0:513:cb7a:7cf7 with SMTP id r6-20020ac25f86000000b00513cb7a7cf7mr9614247lfe.63.1712139631925;
        Wed, 03 Apr 2024 03:20:31 -0700 (PDT)
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
Subject: [PATCH v7 13/19] xen/riscv: add required things to current.h
Date: Wed,  3 Apr 2024 12:20:06 +0200
Message-ID: <322e726f1d8f8ea55a0c86c4eb3aee971ffc4253.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5/V6/V7:
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
2.43.0


