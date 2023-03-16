Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8674A6BD285
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510649.788726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolX-0006pU-RZ; Thu, 16 Mar 2023 14:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510649.788726; Thu, 16 Mar 2023 14:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolX-0006n1-MT; Thu, 16 Mar 2023 14:39:39 +0000
Received: by outflank-mailman (input) for mailman id 510649;
 Thu, 16 Mar 2023 14:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcolW-0006hg-2o
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:38 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f6f605f-c408-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 15:39:35 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id eh3so8492482edb.11
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:35 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:35 -0700 (PDT)
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
X-Inumbo-ID: 5f6f605f-c408-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQMyKbzQe0AjQ7eGyuvY7xOmw9XaxRLiNTI1dISB708=;
        b=X+Pp4vF+BjOTTI9+tC6SgbPvdbpLNSCWCd+ov2PsheNQQfqYRDWn0CPyBmaA3IwQXw
         9C2oydfDIUVrFFcTlsPwlf25PK9ycRc6vnpbRZT/HLOH4d0B4iWX0W5WfT0djQDidnwE
         FiD0b0vFb7NRnSf/68IB+aD4wwAacgZqDf1+4sBntFcJhzc6ifXpHyGean0vCoc1MxeT
         nWuib/viRD7Pczj+eiD/7X2MykirIrDL7xjJWWviE1zi1V8V1fZxVr1invQGU2RYLgB+
         qlqYtaz8Zaf+TGzdCXlEAQW+bpWTTr3gy3Hv8Q+axtz3sRJ8taTeVCJbMUMXg++rIxM2
         kC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQMyKbzQe0AjQ7eGyuvY7xOmw9XaxRLiNTI1dISB708=;
        b=1y49TxGzP5T5l+YE/Ki0BLYe/m9/SOItdYB8xXHJAGir+XsQcLqxod6JpvkNc60us1
         IgFcCtE5uuNBgGUNlXLXuUpxflzwCjRca6o5csAEo1eu00p3yjs1P5sk2ipOr3GHfinh
         CucDzxibh0gsY2Pddl/lJU1UvVkhY2oPml4j5DGnpDwZxfWc4pYP26qbIIbREzd9OZFS
         8Mpp93LuOxfv9L+6Exteg4cmNFHIPGpDPunNVgAxmuIeXHJjtokklzaeojpm2TOiIytw
         PmN375RdykJRnSgwC9fu84yCchpu5sQkDMzya6bHVWConks57Jwp1JD3mCRdBYFPgTd9
         qOnw==
X-Gm-Message-State: AO0yUKWeDbjTyjohgqX4MYWhT+wlSfPH9efcrL9Sy9nEOXjnPfzIRLGn
	bL1bS+m1ifI6KKslhZYOBBj4Z3cjUR3beg==
X-Google-Smtp-Source: AK7set9qqBVMh2bkP/3GgL0gqjIw1GS6jOmy7mvO21s2qCJ8T8i+Mz1gDMGirsCe+afTiTHnvRpd8g==
X-Received: by 2002:a17:906:fe4c:b0:931:b34:4172 with SMTP id wz12-20020a170906fe4c00b009310b344172mr1419801ejb.3.1678977575171;
        Thu, 16 Mar 2023 07:39:35 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 1/7] xen/riscv: introduce boot information structure
Date: Thu, 16 Mar 2023 16:39:23 +0200
Message-Id: <553b07e967f56b78eba2d27c9115cce707a45c08.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678976127.git.oleksii.kurochko@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure holds information about:
1. linker start/end address
2. load start/end address

Also the patch introduces offsets for boot information structure
members to access them in assembly code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 * the patch was introduced in the current patch series (V5)
---
 xen/arch/riscv/include/asm/boot-info.h | 15 +++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   |  3 +++
 2 files changed, 18 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/boot-info.h

diff --git a/xen/arch/riscv/include/asm/boot-info.h b/xen/arch/riscv/include/asm/boot-info.h
new file mode 100644
index 0000000000..cda3d278f5
--- /dev/null
+++ b/xen/arch/riscv/include/asm/boot-info.h
@@ -0,0 +1,15 @@
+#ifndef _ASM_BOOT_INFO_H
+#define _ASM_BOOT_INFO_H
+
+extern struct boot_info {
+    unsigned long linker_start;
+    unsigned long linker_end;
+    unsigned long load_start;
+    unsigned long load_end;
+} boot_info;
+
+/* LINK_TO_LOAD() and LOAD_TO_LINK() works only when MMU isn't enabled. */
+#define LINK_TO_LOAD(addr) ((addr) - boot_info.linker_start + boot_info.load_start)
+#define LOAD_TO_LINK(addr) ((addr) - boot_info.load_start + boot_info.linker_start)
+
+#endif
\ No newline at end of file
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index d632b75c2a..6b89e9a91d 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -1,5 +1,6 @@
 #define COMPILE_OFFSETS
 
+#include <asm/boot-info.h>
 #include <asm/processor.h>
 #include <xen/types.h>
 
@@ -50,4 +51,6 @@ void asm_offsets(void)
     OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_regs, sepc);
     OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
     OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
+    OFFSET(BI_LINKER_START, struct boot_info, linker_start);
+    OFFSET(BI_LOAD_START, struct boot_info, load_start);
 }
-- 
2.39.2


