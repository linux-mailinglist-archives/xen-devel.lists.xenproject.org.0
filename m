Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88978849E9D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676289.1052423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX15s-0006nD-9D; Mon, 05 Feb 2024 15:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676289.1052423; Mon, 05 Feb 2024 15:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX15s-0006lA-4d; Mon, 05 Feb 2024 15:41:12 +0000
Received: by outflank-mailman (input) for mailman id 676289;
 Mon, 05 Feb 2024 15:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0y2-0007I6-S0
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:06 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db09ce0c-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:33:05 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51032058f17so5125718e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:05 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:04 -0800 (PST)
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
X-Inumbo-ID: db09ce0c-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147184; x=1707751984; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EpDP5Niihr1G1U8oddvxlYPXrLXztpUK4y9JjJucU0=;
        b=AN8Ihp99dtBw5I6JNYW9tD1VeVnWJhpSqUdhQusmlUkYQMXzRPizWRsdOzVWCfkFPY
         sVbR7kkOYc4KcDoH4o4EPF9HwLIansoShymgj5nZvpG1zVApQnWj4khyH7dUbmSYwjPb
         j4VYEfPTezmLtKBNC1HJluyUoE/507+riVMUNSwwaoEmE4uBE77gJ+RkNfwTclTBTGXf
         GRcRKVezLDBxVuImBadl25HCJFckJuMnOw+vsmlKMEFnpJL/onR56IQ+gfTeesONC+zK
         VEkB4Q0FAgviuLuqwmCO+Wd6sYISoE+kZWxpH6MoG629KV4n/j9EoAqo74faaEzfz9+a
         oBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147184; x=1707751984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EpDP5Niihr1G1U8oddvxlYPXrLXztpUK4y9JjJucU0=;
        b=A37pG9JcXNa8pSVWzHx0l+L7GmtvgAqYbhTC4RMH1vdIRNipyOooslq+uSAe261spc
         mJKQ1W4xGOKczMJlOqBdB3px9xuFfMJN5uzYZCXIp/mHgpAmGwQVwdF52dX5SL11Hojq
         /pTyktBn8KUmo1jJbQ2rQuNJhl46mVvidWIqakSMkUZeZ8ynMdIXpzJh/8uaLPltI2oS
         LzvS6HVTQfsLrnN3ZNXmxEPhGp0TOarv20V8vLmTKVetP6ESuzF4dd3v4ELBwCiN/zfP
         2/Lccjx160WAAFbk99H0QY1t2zWzr+DGI1VfG/BxOp6J+l1TiKqymz2yZiPWsp4RUBOu
         bVRQ==
X-Gm-Message-State: AOJu0YwzOP4X9DWWEKXAM8//wJvdlMvsWqOXN6i6ix8Rkes1+BDPxd4p
	4mdlbVb8RsllOqElZbA+IvZxDz+VDA80ijFvBWkhH5HJdtuRZMUHQ27EP3sf
X-Google-Smtp-Source: AGHT+IERUkJXhuMp6A3TCMQGfl0J9cJVgHeyC6Y/rwpGu/DjlIBSpgILDv+ywuxhQjJOp3Cp0Ta7HA==
X-Received: by 2002:ac2:4851:0:b0:511:530c:d0eb with SMTP id 17-20020ac24851000000b00511530cd0ebmr1483769lfy.46.1707147184598;
        Mon, 05 Feb 2024 07:33:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWKXyZj/KBMIs89OsXKMtwVDES+1i99zwaSRsx7gSuulzLmPt4qUpMFIoHLFRwPQ98NF+gS/TW5nF67SeRbE1DrwZLh+Pw2XEpWG91ddhub8ZOaf76QcvtzX6Urd7N7015H1+DPLqzCByJmuugNYz5/RUgcRB/zZF2Hcg1/FPzBizWrBn6+imbYIYR/lQ7mo/OWB+LUT8cUAscQBJbC9MMpBS9zMG4be2AqIF057WKoq8R+Tg3ofXQlyzDrsIJxbxtUP4qOl46izRKjw2r/U4LsFXxjSNumXYjZtJQUsmupi6+yqBC2e8WFH2RIrNXPty4qM3Ay
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 23/30] xen/riscv: add required things to current.h
Date: Mon,  5 Feb 2024 16:32:30 +0100
Message-ID: <acf0cfbd19dcc05a37ad768d4902a7a6274d64f1.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


