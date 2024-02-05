Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB0849E42
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676203.1052231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xp-0000kL-4D; Mon, 05 Feb 2024 15:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676203.1052231; Mon, 05 Feb 2024 15:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xo-0000e6-Sk; Mon, 05 Feb 2024 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 676203;
 Mon, 05 Feb 2024 15:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xn-0007I6-6m
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:51 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1b5319b-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:49 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-51124d86022so7009589e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:49 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:47 -0800 (PST)
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
X-Inumbo-ID: d1b5319b-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147168; x=1707751968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6/hgd3PF/7Am9C/zD33wVCQ9jkwbx6B85pbrUoqBYs=;
        b=Lx6pSLZ+Eqz0S/DmldPFDmV31SHh+ri0fggp4u1dSYOIq7z/f70fcuq4iL19GDMZje
         T0Ikyq++3kezZ6sr69/+ZPcgnBt5tRA0MVMOIgREtgYPMebEmS5quTt38RYpUmdy60UB
         d9Cb7aUDotVQ9mwrvi0U8hOYHEwuDg2eSYNosfsLPsIFnkJtwROkKV7ALrs4Q5beHveC
         zK6eA3Niirm/MJ7EHNxmtbuC6VMtOqeLxtqoQyHlEozCuKEHhyevYbYEnk64e1P5mSO4
         tFxeoZ/lSWrhfWFliUWF1GsKrdguJhWr8+S18xaFfAY71Sn+78gSF7ciWWmSahJ0Q09B
         fvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147168; x=1707751968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6/hgd3PF/7Am9C/zD33wVCQ9jkwbx6B85pbrUoqBYs=;
        b=b0+ge5ycF75eQM2nAw3cjbIK52E/RLt/1u2cIyYbaojg73nMrPFlGMl4FBelY9S+vh
         cVDSrh0LbvRfRDVosJa+mm/MMJ9hwool36fY7cB7LZ8d3FeslMes//KsMENzaTFs2jg5
         B+0e1EY7XDhDJc3eQ+lW0CfH2/OOKm5rdJZcPPbSgidbzBTOmf+rQ4sm+d9tvYO/DtnM
         hBMujfEzZkNY4TXNmjgH0jwfiNbnqr7giAY7d0bR2vRynz//y8BAcak+9DHX8FExDcvS
         fbHwuh6QOtMD1oVZHiMmsS7awO1wMr6PEY7iuFbXYWYSA16MXJKzHqR2NtM6iLOC7aOo
         7BHQ==
X-Gm-Message-State: AOJu0YyH5JvK0GFKk6RO9cLuYpvN3g4dwOcq+4terPR7uIw8W4+hW6Fk
	iP3VCCh8le9qx9CZgCDOXn2NO9KQmPDnW7QZqJFQtZsEr9HvlxlczB1g/C6g
X-Google-Smtp-Source: AGHT+IGZlSaylwpgBTUq0NGkad9qCB2LeEIVcHnT9RLHaZQCbEdKHOXdIIfDxm07LHWW1ovQS5Y0mA==
X-Received: by 2002:ac2:558b:0:b0:511:4268:3a54 with SMTP id v11-20020ac2558b000000b0051142683a54mr4092626lfg.29.1707147168101;
        Mon, 05 Feb 2024 07:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXnvkWL4RaH/9B7oHf5PoxCB+1ZLi0vazkBkGHpCGWfbcELZnACjzfTr7yn7wJ5A7e3tRWl5KYe52ShsYFzlTY5k/Z18aebVItqBxW/iuzKrXX/6+fWokRe48VU9yQE3Fv+l1J91ujrTi9YqKHsDQujLWbpHwz/5l5x5nzw6yO1QMozfoWlROu948Nug46nyGhpNzXtsmLZkn2cSaj4plSbqFgRH+XzfTYWIJgCrymJDDNKqgicsO/Z4fmlRrFNIofhnvjxTE8CIlqaRdMje4GjveOzb95BLCjq2mmVYo726VbNcZmeQXOlMy8ahn3QpqohlDMoryj2VPfhqpmivG5D3qVkwtg7XcRy0TuvrJMh7jr8AApcTSChhKXoTH+Dz27kc0f/n1olOKW8GjLCe2K+5saAq+zgN7I9USsw22QXP4b1S167t8F3Z9DhY3HNNp1AV7oguXaHoKkiGPfOkL4EyNs=
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
Date: Mon,  5 Feb 2024 16:32:14 +0100
Message-ID: <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
so it has been moved to asm-generic.

Arm's nospec.h was taken as a base with updated guards:
 _ASM_ARM_NOSPEC_H -> _ASM_GENERIC_NOSPEC_H

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Rebase the patch. It was conflics in asm/include/Makefile because it doesn't contain
   numa.h in it because of the patch: [PATCH v2] NUMA: no need for asm/numa.h when !NUMA
 - Properly move/rename the Arm's nospec.h with only guards update in the header from
   _ASM_ARM_NOSPEC_H to _ASM_GENERIC_NOSPEC_H.
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - new patch.
---
 xen/arch/arm/include/asm/Makefile                 |  1 +
 xen/arch/ppc/include/asm/Makefile                 |  1 +
 xen/arch/ppc/include/asm/nospec.h                 | 15 ---------------
 xen/arch/riscv/include/asm/Makefile               |  1 +
 .../include/asm => include/asm-generic}/nospec.h  |  6 +++---
 5 files changed, 6 insertions(+), 18 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/nospec.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/nospec.h (79%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4a4036c951..41f73bf968 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -3,6 +3,7 @@ generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
+generic-y += nospec.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index ced02e26ed..2e8623bb10 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += nospec.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/nospec.h b/xen/arch/ppc/include/asm/nospec.h
deleted file mode 100644
index b97322e48d..0000000000
--- a/xen/arch/ppc/include/asm/nospec.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* From arch/arm/include/asm/nospec.h. */
-#ifndef __ASM_PPC_NOSPEC_H__
-#define __ASM_PPC_NOSPEC_H__
-
-static inline bool evaluate_nospec(bool condition)
-{
-    return condition;
-}
-
-static inline void block_speculation(void)
-{
-}
-
-#endif /* __ASM_PPC_NOSPEC_H__ */
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index ced02e26ed..2e8623bb10 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += nospec.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/arm/include/asm/nospec.h b/xen/include/asm-generic/nospec.h
similarity index 79%
rename from xen/arch/arm/include/asm/nospec.h
rename to xen/include/asm-generic/nospec.h
index 51c7aea4f4..65fd745db2 100644
--- a/xen/arch/arm/include/asm/nospec.h
+++ b/xen/include/asm-generic/nospec.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
 
-#ifndef _ASM_ARM_NOSPEC_H
-#define _ASM_ARM_NOSPEC_H
+#ifndef _ASM_GENERIC_NOSPEC_H
+#define _ASM_GENERIC_NOSPEC_H
 
 static inline bool evaluate_nospec(bool condition)
 {
@@ -13,7 +13,7 @@ static inline void block_speculation(void)
 {
 }
 
-#endif /* _ASM_ARM_NOSPEC_H */
+#endif /* _ASM_GENERIC_NOSPEC_H */
 
 /*
  * Local variables:
-- 
2.43.0


