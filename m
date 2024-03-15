Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3887D346
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693999.1082810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBx1-0000yu-1J; Fri, 15 Mar 2024 18:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693999.1082810; Fri, 15 Mar 2024 18:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBx0-0000lw-JI; Fri, 15 Mar 2024 18:06:38 +0000
Received: by outflank-mailman (input) for mailman id 693999;
 Fri, 15 Mar 2024 18:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwx-0005yW-Tu
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:35 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2e1cc86-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:35 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d4541bf57eso31469891fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:35 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:34 -0700 (PDT)
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
X-Inumbo-ID: c2e1cc86-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525995; x=1711130795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BniKWGYPbeiPbe87yny1VU0OUUHSQ613GEG/PFydHOE=;
        b=itv8IcP+YjsW51ghx2/psu7Lv1WOHpOPhW5Otl6ZQetsgS/O8NHQy77r3UyIS0RlI2
         DukQVbnMs/T87idD+KGC7xYK85gHhPd68WN2nbR7yF/P8Fj2ZQo+KXFoonLfmvqm3XxQ
         fKURLX89mUnl8sqNvdbja4PdKHdBG2RtkymIb3sjvvSHo1HWtr1nAhRaNcMdwzzAs5A6
         wKwl1BjsCwi3MAehoge7GJEeQ68NorJ1UfK77nxo/dhyX2sBqW7kVQI+l1UOQvPBY93F
         y/EsQEq2qxRz7WuP5b/7aO/vnaz4LIvyjWsQhnxZysvtUUeDwGlLX3f2E1PhUeIyAHpf
         MkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525995; x=1711130795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BniKWGYPbeiPbe87yny1VU0OUUHSQ613GEG/PFydHOE=;
        b=M1kze4guZdRtY8OWsKvWTUU4X974TWm7W2WY1iBfmWclg+wcyUhNGBAWYooMuOFFPN
         olBjskun4pRmNwzJqDpJV4r0j3OcJKDFCpq6a1ySYV0t8uklDOqfEzdmbNMRKxzsgVpg
         pPzX2c9fETb8fPoHxMJ6ubnYLtdRtQGhIpz3XNfKFIl8KMqDCxv60xDqJKquF92f5WGc
         FB2tK6k2PJA8Is0f+KD0/M2clGfAtY4DTVAS8BAUeTvwe0J2N6Z5L6sdaGhpDZDMXmsW
         ouTRscoFvZ70l+IihFQBXSydYa8stOREsxemNPJF4txCFXzV6DRUOOfOGIsn/DWTfUeW
         fm1Q==
X-Gm-Message-State: AOJu0YwJxQFE+x7UR436W0OGY7Egw+Fi0DBz2rcQGgf9JE20pANFVqun
	ZuikzSSfpnj83UQ+cVJfSk9WoxMbu28YnSvvjZETn89dsyCuQVCPJOUeLekNEWQ=
X-Google-Smtp-Source: AGHT+IGA98oEzc5+hDzsjLGyoNfpm+Kj1QtNxE8WwYFQFfSSAdopDSh+QzESkCRsrUFzZ1HCT8cdRQ==
X-Received: by 2002:a05:651c:32a:b0:2d4:3c64:53f5 with SMTP id b10-20020a05651c032a00b002d43c6453f5mr3217155ljp.19.1710525994655;
        Fri, 15 Mar 2024 11:06:34 -0700 (PDT)
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
Subject: [PATCH v6 13/20] xen/riscv: add required things to current.h
Date: Fri, 15 Mar 2024 19:06:09 +0100
Message-ID: <7691cf03f61348d368e33200962c3fa73f7a47b1.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5/V6:
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


