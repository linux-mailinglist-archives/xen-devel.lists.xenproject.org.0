Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9281CBE2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659421.1029123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDf-00037X-33; Fri, 22 Dec 2023 15:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659421.1029123; Fri, 22 Dec 2023 15:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDe-00031Q-TJ; Fri, 22 Dec 2023 15:13:46 +0000
Received: by outflank-mailman (input) for mailman id 659421;
 Fri, 22 Dec 2023 15:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDd-0000EM-As
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:45 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b229c2ad-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:43 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e6bcca684so531491e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:43 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:42 -0800 (PST)
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
X-Inumbo-ID: b229c2ad-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258023; x=1703862823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V2ccNLv7fzBgrDA9NE+pKZEtsNt5JBlW/j5gZeAoxQ=;
        b=Bnck0/07C2dN3BfTp4TB4qV9WXuq/95rW/SU+auhAgBCWaDLS8W25gyrQOjb0mGBEe
         pCzg37AtwK4SYY2Mr874NXbKgT+wjBspWLO9K1kvyWmiL2C93bKyc7iHUIy36by62eea
         ZzMu2O+WgwUeB0eekkF4100jf4X+NDmPKA0lQWHlPb8jFI9yYVk9cLIm2BV3oBCg3Ksi
         35TZ4N/9qwfLzKC/4DUD0iuCsqnmvpa9ZXw1GdbPjjfVXwLG6QdAv5OYAUDaMAkGhf62
         kbBOO7kPSpI9YfnFiIrXmiedNeaFVHB1NxDYnZLb4pkfqkqRdD9xiB+/WurqNhgSWZJE
         5FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258023; x=1703862823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V2ccNLv7fzBgrDA9NE+pKZEtsNt5JBlW/j5gZeAoxQ=;
        b=f4Yvht0AXKxrgnXE77ZF1RmuegbY+HgHeW2YD2jOThLGzEVKLJXwsSWyRnh1/9gy0W
         tf/CMAmIgGMwhhBVuzrLoxAgTzcaY/sTjcaZSzzMR7ahrqeU7CzWiuioOzygjk9B5YcR
         UPcHldUlRRbleSGZraYNCPd1rfvex6xUOA8Dadnto0EYKAwo4r4+q2CZe8Mgs56XGQHT
         BGCSKSkNTQXeFBbm7TbywY5W/BOoV2sgMO6kBKacz7wbOBZUY1hnbkeRcRKwPRoerY3C
         vD1jPsNoEPVvvZDT+Vsqv+C5LNQiUkcb12wP/KcsK5Exo0gesMCLVibVW/OpMic/HPo6
         uuNA==
X-Gm-Message-State: AOJu0Yy6WuLH6srq1m/E3X1j9YpOVOlnEi7w2+5OdzM/DewdI0zaGu0Q
	5pptNWhGKJ52wnvkD6c+/dk+Xo5cX6s=
X-Google-Smtp-Source: AGHT+IE/3AWabe7B55/sEwLUkis+9P0Cr660xvAYN/IeOC4KxvvX9AADNDzH0XBBpHD95ttIVEky2w==
X-Received: by 2002:ac2:4259:0:b0:50e:3877:caba with SMTP id m25-20020ac24259000000b0050e3877cabamr392669lfl.52.1703258022592;
        Fri, 22 Dec 2023 07:13:42 -0800 (PST)
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
Subject: [PATCH v3 18/34] xen/riscv: introduce domain.h
Date: Fri, 22 Dec 2023 17:13:02 +0200
Message-ID: <6bec4f93bea5ae3e13ac314c59fa6b9898deb998.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add SPDX
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - update the commit message
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/domain.h | 53 +++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/domain.h

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
new file mode 100644
index 0000000000..0f5dc2be40
--- /dev/null
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_DOMAIN_H__
+#define __ASM_RISCV_DOMAIN_H__
+
+#include <xen/xmalloc.h>
+#include <public/hvm/params.h>
+
+struct hvm_domain
+{
+    uint64_t              params[HVM_NR_PARAMS];
+};
+
+#define is_domain_direct_mapped(d) ((void)(d), 0)
+
+struct arch_vcpu_io {
+};
+
+struct arch_vcpu {
+};
+
+struct arch_domain {
+    struct hvm_domain hvm;
+};
+
+#include <xen/sched.h>
+
+static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
+{
+    return xmalloc(struct vcpu_guest_context);
+}
+
+static inline void free_vcpu_guest_context(struct vcpu_guest_context *vgc)
+{
+    xfree(vgc);
+}
+
+struct guest_memory_policy {};
+static inline void update_guest_memory_policy(struct vcpu *v,
+                                              struct guest_memory_policy *gmp)
+{}
+
+static inline void arch_vcpu_block(struct vcpu *v) {}
+
+#endif /* __ASM_RISCV_DOMAIN_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


