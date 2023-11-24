Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938917F7177
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640379.998535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT9-0002Fp-1J; Fri, 24 Nov 2023 10:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640379.998535; Fri, 24 Nov 2023 10:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT8-00029d-1q; Fri, 24 Nov 2023 10:31:30 +0000
Received: by outflank-mailman (input) for mailman id 640379;
 Fri, 24 Nov 2023 10:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT5-0006hx-Ma
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9efe9df1-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:26 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a002562bd8bso338517266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:26 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:24 -0800 (PST)
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
X-Inumbo-ID: 9efe9df1-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821885; x=1701426685; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGHd1eioR6HPD5JPnk3lVVgnNn+PvGtKXyao91lq60c=;
        b=S/bRg5ZbVFpD7Oiy1uCed1ltJLWbEt1Bg6qcdtsJsW0VKEghSOG0m9ded1+x8dJL2t
         KDmM/4vpBGGWKMcs2JFh68Ro3qjtrWlZL22GpmrUK7LVKRADhmRgyOYzRjOgRm71JqUC
         Q3aVlKjdMiVvMLxkixZfKE/YOoRXmyfEO8KyiIV7+fxSJjPKN9BfMTFBybR4b8xYcnmP
         eW8o/Va5NUfAtepgcMtoEhlQ0zEgtyecdG/E0AAYh+rAFHnxNFWTx0231CYYrUZiv/gT
         l+uA7tT74v3O1aC2WSBedJ+/E5S79VEa65uNljhGMHKw2mlOrhe2FiEhDrJfuWeVzCNl
         ZBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821885; x=1701426685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGHd1eioR6HPD5JPnk3lVVgnNn+PvGtKXyao91lq60c=;
        b=nOqmTiPyw2xaRJZlk23WGyZGHMWd8tGMyB+ohpdEl9xxTUQiSpVGdyGyGMv03jPi99
         aZ31j9NZYY/5N1EbgxMP+psUOVdz5hH0RVTnlt2IFtGyjyu9DSzrzw2mI4lj4OYE3i7N
         JMlX1TdryM7a5Ytp2bOk+m8KGdcq9H7GhAfNmz3nW4y1TjA9XJLlXBf9RuJitE9vVC9V
         6nzxv3EBjj79/G6TonQE2SQ1aolQY0x+0EYIbZbYlEOYqhZtj3nxZ/DVhu0uQ9i5hTll
         g7JHqsLS5aUbBnDJ6uSyxXQkYbAPPtHNgfTxpcfz+XZ5cqTyXRci8q3JcBBlWRQ9jcVZ
         jEEg==
X-Gm-Message-State: AOJu0YzSbO5GSIAY3ZpS9V2fvd1pQkdirA5n6M6z7HI3ivBoA0Zrj5kH
	EmxHU9hD9D1JeqwDE5LM4fhodTFcbvRchw==
X-Google-Smtp-Source: AGHT+IF369ssi9i4xHOn9AHxdONjbG9obh1F0ASlfG8CJ2qND7XQtQOeZTvzeo5UxLoOqe5ik7Z9bg==
X-Received: by 2002:a17:906:3ca:b0:9fe:ae1b:77bc with SMTP id c10-20020a17090603ca00b009feae1b77bcmr2106918eja.34.1700821885024;
        Fri, 24 Nov 2023 02:31:25 -0800 (PST)
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
Subject: [PATCH v2 15/39] xen/riscv: introduce flushtlb.h
Date: Fri, 24 Nov 2023 12:30:35 +0200
Message-ID: <12a698e62766be7dfdac23923d7cdcb3b9b2d52e.1700761381.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/flushtlb.h | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
new file mode 100644
index 0000000000..7059a53823
--- /dev/null
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -0,0 +1,31 @@
+#ifndef __ASM_RISCV_FLUSHTLB_H__
+#define __ASM_RISCV_FLUSHTLB_H__
+
+#include <xen/cpumask.h>
+
+/*
+ * Filter the given set of CPUs, removing those that definitely flushed their
+ * TLB since @page_timestamp.
+ */
+/* XXX lazy implementation just doesn't clear anything.... */
+static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
+
+#define tlbflush_current_time() (0)
+
+static inline void page_set_tlbflush_timestamp(struct page_info *page)
+{
+    BUG();
+}
+
+/* Flush specified CPUs' TLBs */
+void arch_flush_tlb_mask(const cpumask_t *mask);
+
+#endif /* __ASM_RISCV_FLUSHTLB_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.42.0


