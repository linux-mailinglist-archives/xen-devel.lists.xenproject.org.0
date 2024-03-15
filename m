Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B187D351
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:08:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694015.1082867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlByy-0007eG-AC; Fri, 15 Mar 2024 18:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694015.1082867; Fri, 15 Mar 2024 18:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlByy-0007bT-6f; Fri, 15 Mar 2024 18:08:40 +0000
Received: by outflank-mailman (input) for mailman id 694015;
 Fri, 15 Mar 2024 18:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwz-0005yW-Jv
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:37 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3e151d9-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:37 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d2991e8c12so24710611fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:37 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:36 -0700 (PDT)
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
X-Inumbo-ID: c3e151d9-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525996; x=1711130796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGwnnOcdfjc412dCuO+CoJYBZrQqT9IXKc8hUkISo5w=;
        b=GYWiLymj8b71XsG5UDprKuxszNyOpcR5QN2LQ+qCrvjrem/Do+rbu5OSLQd0psXZUR
         CP+9NqQ3VU2jbXgeE2liy1Bd6h0pqbjtb4SBDiyKs6ZEdE+J7Mxp8xBsKXnQmSCvHb5U
         rcdXa4g9M/vO95PQ4VzVuDcy4cg4VHY5zXQKE9mgLrpG2+udvWeB+XsxIvf5kRYSyrY6
         fzZrccgChQOPSMusKbZ+8hAqadRkM1GTs1vl8yWLWWGA+m8pMIKO4JPAZUio1bUVNpND
         r170dru6Lhag0qTNTx2tZte6m2U4JuOz4Lc3XSpd0FVfJDOAtyB2rxv9GqrCd84Kj9Un
         pjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525996; x=1711130796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGwnnOcdfjc412dCuO+CoJYBZrQqT9IXKc8hUkISo5w=;
        b=GqbuQdjga1l2hcYCq+/n5nCrxBAOnUx2R9IVNkU+BX5Z+2lLCU9j78TP71uDu/gWfv
         /x1qVVkopz1CpKNfQpLo4EnWtw23FxLkLsjeJAFwCP5klhPWxZ/C+BoiIuEAL8i25uMZ
         s3M5aWT6KT/JctwkqOKPop7dkFghcnE6tf/vXT4Xepq6Xmak2kzHJuKRjgJlA+SRTAK1
         2u8v+yHuguNA1Un7x7rYOB+24JlIlPXaY4Xlu7EW6koobnTnXJj2sLYjzPzYYptHh3OG
         jKVGJo9q5Gl5ol+Zh7wcTBB8FyVAAmwtcOW1FiMtSwL3lqtPomt88HKvYELLqf2U4L6H
         gIww==
X-Gm-Message-State: AOJu0Yz6B5O+N3giOeWsPLEyc3V6InFbVGc4TMyudYj3VVxVXBzhZYXh
	75yRzY08UvxhDMEit93j5Fd97ebQ+eIiXWEPkE5Doi9zNKvhBN7dPOz/36TdU8Q=
X-Google-Smtp-Source: AGHT+IH1136Hxh9YX3kAguU8HRg8bx+XReQwyc0NeKRtp/KnUPvBeNTOzg7kdZsYU3Aibk5PrQOBug==
X-Received: by 2002:a2e:80d1:0:b0:2d4:9334:3c11 with SMTP id r17-20020a2e80d1000000b002d493343c11mr108037ljg.16.1710525996435;
        Fri, 15 Mar 2024 11:06:36 -0700 (PDT)
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
Subject: [PATCH v6 15/20] xen/riscv: add minimal stuff to processor.h to build full Xen
Date: Fri, 15 Mar 2024 19:06:11 +0100
Message-ID: <c05291c698d37ac0d6d31602fe35b2accf2d518c.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpu_relax() function, introduced in this commit, is anticipated to
support _zihintpause by the CPU.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - drop incorrect part in riscv/booting.txt and move the introduction of it to
   separate patch.
 - compiler check that __riscv_zihintpause exist was droped to separate patch.
 - minor fixes.
 - drop unnecessary comment.
 - update the commit message.
---
Changes in V5:
 - Code style fixes.
 - drop introduced TOOLCHAIN_HAS_ZIHINTPAUSE and use as-insn instead and use
   as-insn istead.
---
Changes in V4:
 - Change message -> subject in "Changes in V3"
 - Documentation about system requirement was added. In the future, it can be checked if the extension is supported
   by system __riscv_isa_extension_available() ( https://gitlab.com/xen-project/people/olkur/xen/-/commit/737998e89ed305eb92059300c374dfa53d2143fa )
 - update cpu_relax() function to check if __riscv_zihintpause is supported by a toolchain
 - add conditional _zihintpause to -march if it is supported by a toolchain
Changes in V3:
 - update the commit subject
 - rename get_processor_id to smp_processor_id
 - code style fixes
 - update the cpu_relax instruction: use pause instruction instead of div %0, %0, zero
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/processor.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6db681d805..6846151717 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,6 +12,9 @@
 
 #ifndef __ASSEMBLY__
 
+/* TODO: need to be implemeted */
+#define smp_processor_id() 0
+
 /* On stack VCPU state */
 struct cpu_user_regs
 {
@@ -53,6 +56,23 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
+/* TODO: need to implement */
+#define cpu_to_core(cpu)   0
+#define cpu_to_socket(cpu) 0
+
+static inline void cpu_relax(void)
+{
+#ifdef __riscv_zihintpause
+    /* Reduce instruction retirement. */
+    __asm__ __volatile__ ( "pause" );
+#else
+    /* Encoding of the pause instruction */
+    __asm__ __volatile__ ( ".insn 0x0100000F" );
+#endif
+
+    barrier();
+}
+
 static inline void wfi(void)
 {
     __asm__ __volatile__ ("wfi");
-- 
2.43.0


