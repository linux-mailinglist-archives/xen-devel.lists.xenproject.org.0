Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD957F7172
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640374.998473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSz-00008W-Rm; Fri, 24 Nov 2023 10:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640374.998473; Fri, 24 Nov 2023 10:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSz-0008Qm-D8; Fri, 24 Nov 2023 10:31:21 +0000
Received: by outflank-mailman (input) for mailman id 640374;
 Fri, 24 Nov 2023 10:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSx-0006hy-SS
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aec12ce-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:19 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a0029289b1bso245224866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:19 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:18 -0800 (PST)
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
X-Inumbo-ID: 9aec12ce-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821879; x=1701426679; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGY0g31ghso/KxGfsjMOwsolg68KHX/Ner31wPYk88Y=;
        b=Y9ivk39FGjZW6hmXNShoeBYtNvrrzAm2Wh2wh73nBoMfAgf2psssEOttsYMcXvUlWP
         5mkQ6U2Kc8v+CsDcp+FmzC1OJrjqxT6pR6M4IljFwULs1yu97tFXV7om3E/NEiXO4Phd
         yiRfE9Xr/2Ie1DPPcpWWqFjTHmPL7WchWWolsHIFVeKZj9gL70/Do40SkfLVFwDdMWpg
         8J6hLC8QTnSKwlfMcnMFgZH61fYywJr2gud6/ovWhmfyIJmyApJqUosTG1gSyHNqWYhi
         5IibDM1Jt6LlsobPN/3hKiSf1zR8VEE69Jn5q4MlO/RYgjILROlf2wlXfF1RA6w7cId5
         SOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821879; x=1701426679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGY0g31ghso/KxGfsjMOwsolg68KHX/Ner31wPYk88Y=;
        b=SY0mpL9lMy+cxPQdvKtHFRuNkGv0w00lO0IyCK5kfdpZX7zqr/h6QDSKNrsGeY+hMy
         URd76ieeMxP6oOYpVnMfZHpkI9gbX3GqImR5TdiqLQoJJt3jHhhoLPJ/+PjazuhzHNsp
         wBuH46wfEL8GjwrkP1yFE0xMDJ6bAH7wHl+H7Gyx16pQObxdj8QA1zXNXu6JgHWcK8hA
         Ex0efR1YceMrJfr84idcJbeLRCxM5VkXU1XXIwKuUpkLjnC8F7HN+GrK+o+9QoMFAe2F
         mIh7VyqhC9DLJkEHD8hQCTfrXENbnBIbzxw1RpiULLe7+RpzsaeGZ0oGMcA3k3YAxtWf
         Mmow==
X-Gm-Message-State: AOJu0Yw+ayPjnqcRZfgI0QKtY6TZJ5z2B/koegQSkZFoR7uOJagQz37Q
	q1WJOOKV7NSug8nPlSOexzCd7J5gupMvUw==
X-Google-Smtp-Source: AGHT+IFuzLG3DXwAzaIgSaVfYas85yPNgxQaj2By5voBPdrcg8Pz3hc6iNAgajliQHSRE7x1nnfnFg==
X-Received: by 2002:a17:906:f24a:b0:9e4:7b7:267d with SMTP id gy10-20020a170906f24a00b009e407b7267dmr1396467ejb.52.1700821878629;
        Fri, 24 Nov 2023 02:31:18 -0800 (PST)
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
Subject: [PATCH v2 09/39] xen/riscv: introduce asm/guest_atomics.h
Date: Fri, 24 Nov 2023 12:30:29 +0200
Message-ID: <48ecbc771d3870eee86dd11a19f0dd9029e93c01.1700761381.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/guest_atomics.h | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h

diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/include/asm/guest_atomics.h
new file mode 100644
index 0000000000..9f14f76e92
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -0,0 +1,48 @@
+#ifndef __ASM_RISCV_GUEST_ATOMICS_H
+#define __ASM_RISCV_GUEST_ATOMICS_H
+
+/*
+ * TODO: implement guest atomics
+ */
+
+#define guest_testop(name)                                                  \
+static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
+{                                                                           \
+    (void) d;                                                               \
+    (void) nr;                                                              \
+    (void) p;                                                               \
+                                                                            \
+    return 0;                                                               \
+}
+
+#define guest_bitop(name)                                                   \
+static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
+{                                                                           \
+    (void) d;                                                               \
+    (void) nr;                                                              \
+    (void) p;                                                               \
+}
+
+guest_bitop(set_bit)
+guest_bitop(clear_bit)
+guest_bitop(change_bit)
+
+#undef guest_bitop
+
+guest_testop(test_and_set_bit)
+guest_testop(test_and_clear_bit)
+guest_testop(test_and_change_bit)
+
+#undef guest_testop
+
+#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
+
+#endif /* __ASM_RISCV_GUEST_ATOMICS_H */
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


