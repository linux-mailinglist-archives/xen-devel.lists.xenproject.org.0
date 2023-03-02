Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1BD6A8375
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 14:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504924.777402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuD-0000mM-1B; Thu, 02 Mar 2023 13:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504924.777402; Thu, 02 Mar 2023 13:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuC-0000jI-Ug; Thu, 02 Mar 2023 13:23:32 +0000
Received: by outflank-mailman (input) for mailman id 504924;
 Thu, 02 Mar 2023 13:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXiuB-0008Qd-F8
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 13:23:31 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c241d3d-b8fd-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 14:23:29 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id j17so17539071ljq.11
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 05:23:30 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05651c048800b00290679ebac1sm2109551ljc.9.2023.03.02.05.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:23:29 -0800 (PST)
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
X-Inumbo-ID: 6c241d3d-b8fd-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677763409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8MaW6bU1cbVIh9lyUx2jnADjWazCTCDdecZrd3onsY=;
        b=N2oonot0HbSfj0KLZHIlG8/Ef4uXJfhbDIqmYh6UQhCqZFQfjlCq1+l8hsMV5gyb0T
         PqCrc3dHg7seaDgB5Kwz0diWaMzEy+F/tAOV03lZyR7cZpKRRAZmMXxn0x4Vo7n8EXmp
         JBeomU3BM9IOulJD6e5ncwg5OXQUJnOKWqAcJ5fUIBLabSZYF5/XJ/qfq0IEG7t77CHr
         ecfv07jzC5DGS7W+s6FhY5zzaXqH/S4YKtQnMpZhistDtbvdCxhrbEvVMLqrqoqJX1mH
         jrBh6J+FRXSFE+iwJlb+3OYV65Z2g8Ce1cjBsPAPJNSXhXrYYVgad4gM6XB0Rb3U2NZm
         4sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8MaW6bU1cbVIh9lyUx2jnADjWazCTCDdecZrd3onsY=;
        b=aBoCo2fM/PH43DvVeozQ6rr9TictXdoxXpMV/pS1pIhmIJWzaKy60AiLegcKgBZ+Qd
         zK2wdaCm5S+9IKOKKCKMowvoFYRKB3pjmXnW8Vr812fdzbu+czWitVacxl6fnyxjc9DH
         5dGfJzkBJFPfwIda7AS838+MylmmTxto4/Sl4+tlq/pkWdRPbRug2KgTF8eir/Gty43X
         X3R116sZKwLx3DjE1LkhbOpx+rjLOikFY8HqutTeTuxvKaAGWDEn9GTEJvJP7i1XTqr/
         I9SF82NFmlXGzkqaW9poJZVnZ0jUOzLImelRZ36G53OUx/0DRb1rqAkAFImt7BnJS7Je
         sGXQ==
X-Gm-Message-State: AO0yUKU4NkIR4+6wE8BMCeOoSOfxzqLG2VciLFgYw+tDTmUaifBb3hYQ
	ctSMAMpl93l6njPZcbTiESbAO3YJTD4=
X-Google-Smtp-Source: AK7set+Pl1tPpShibOMgKeLVaLNrRDdLBx4Hz7FkN7FO99uaWL2VCOe8CKd0uFc1W14fnXWEfXw0Zg==
X-Received: by 2002:a05:651c:cb:b0:290:6d3b:79dd with SMTP id 11-20020a05651c00cb00b002906d3b79ddmr2945347ljr.20.1677763409433;
        Thu, 02 Mar 2023 05:23:29 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 3/3] xen/riscv: disable fpu
Date: Thu,  2 Mar 2023 15:23:20 +0200
Message-Id: <f9bed949656462e9eb9554dc5e0dcccdd722b9cd.1677762812.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677762812.git.oleksii.kurochko@gmail.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable FPU to detect illegal usage of floating point in kernel
space.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v1:
 * Rebase on top of two previous patches.
---
 xen/arch/riscv/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index d9723fe1c0..23d60ed7f0 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,15 +1,23 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/csr.h>
 #include <asm/early_printk.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+static void __init disable_fpu(void)
+{
+    csr_write(CSR_SSTATUS, SSTATUS_FS);
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                unsigned long dtb_base)
 {
+    disable_fpu();
+
     early_printk("Hello from C env\n");
 
     early_printk("All set up\n");
-- 
2.39.0


