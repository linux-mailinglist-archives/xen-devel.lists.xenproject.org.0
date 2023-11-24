Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240407F716E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640380.998538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT9-0002PO-Oq; Fri, 24 Nov 2023 10:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640380.998538; Fri, 24 Nov 2023 10:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT8-0002Es-VR; Fri, 24 Nov 2023 10:31:30 +0000
Received: by outflank-mailman (input) for mailman id 640380;
 Fri, 24 Nov 2023 10:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT6-0006hx-En
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f72588c-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:27 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a04196fc957so253609766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:27 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:25 -0800 (PST)
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
X-Inumbo-ID: 9f72588c-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821886; x=1701426686; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVbhwiQ/unWzyHVSdx4EzfEooDOrHeGKuFCA4y0CqRg=;
        b=Fzbt1w63rfXNuApmwGtl6JwLYQECR+Ek6tOmcEeHY360ErfEc7NF91hNyTmo6++Oeo
         sHdtwtF1ZM8EpDastm7dCJvjplie9CucJ6dYY1lzAQCj7xyBNS919HLxKWljz3ZwqS0J
         S58U5TWZ9wlEbH41vWzyzM083sGjmdA9dAfZTLL8UA26DP9zqUhN8GCKBdVcXwwxp0RO
         zb8ODFqDwES1wF7ttw5+a09OwkAO4GIz81vF5R32JC7l4gkmiCKLHnusC44muIVsTsbW
         kd6ESwn7XI/7Az+sDc8KHm/wcbI+EmqXyhypHLiMA1YczH2bO4xHCm3mHMQPNf2bPlEZ
         HuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821886; x=1701426686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVbhwiQ/unWzyHVSdx4EzfEooDOrHeGKuFCA4y0CqRg=;
        b=Kwt0emUtXVp8xnb0z+71nHXkim1RiSKS+wefxAoVMZQ0+sJbSkhXqZ/y7/skBkTEvT
         9pjhMsl95XSrw4fTaHvjyTvFt2SZvHSIlcdEbgMl1xTOuaUJu7FvVr7Hz2sSLgb9WgG2
         NkskHIeM/bzN4FjvIj03SL+LXhFWRGMcOTKiLDU3jCd/wI4DorVOH97b3/mNIITPeA9r
         e1MZ+LMROCaoIMWk/Zp8//Z4owQIF4bHw1YxhKKh2bQLEGLG2GS72ewMrYIstx/0/m67
         6we/ta/mk6VWoGTh6Q6Z1uUpGlrIWCBgBxPhNwdponP6ZY+4Fp16m41BhontkUsZDTdM
         ffnw==
X-Gm-Message-State: AOJu0Ywl1j+yJeuJGt4EgqL4NYDYj5kuwqjGJuPi9dOa9i73YOTaYOaV
	bnRO0o6/a3KXji5/Q5Xsbak7iDfMN3aSqQ==
X-Google-Smtp-Source: AGHT+IHlfIyaQh9t2h5OyFv+9tIIx+Yy3omR/VDqvHjqcwI1Z2EYKSeV86u2mUn0/tBPeldyfKwZYA==
X-Received: by 2002:a17:906:17c7:b0:a03:9aa8:166f with SMTP id u7-20020a17090617c700b00a039aa8166fmr1623036eje.37.1700821886248;
        Fri, 24 Nov 2023 02:31:26 -0800 (PST)
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
Subject: [PATCH v2 16/39] xen/riscv: introduce asm/smp.h
Date: Fri, 24 Nov 2023 12:30:36 +0200
Message-ID: <39cc57e443d2df432f90361204c9edd802fcc320.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/smp.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/smp.h

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
new file mode 100644
index 0000000000..a7b4f94ce4
--- /dev/null
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -0,0 +1,23 @@
+#ifndef __ASM_RISCV_SMP_H
+#define __ASM_RISCV_SMP_H
+
+#ifndef __ASSEMBLY__
+#include <xen/cpumask.h>
+#include <xen/percpu.h>
+#endif
+
+DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
+DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+
+/* TODO: need to be implemeted */
+#define smp_processor_id() (0)
+
+#endif
\ No newline at end of file
-- 
2.42.0


