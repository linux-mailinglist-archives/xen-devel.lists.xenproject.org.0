Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA91F7EF293
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635113.990894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu0-0001SO-BM; Fri, 17 Nov 2023 12:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635113.990894; Fri, 17 Nov 2023 12:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu0-0001Ni-52; Fri, 17 Nov 2023 12:24:52 +0000
Received: by outflank-mailman (input) for mailman id 635113;
 Fri, 17 Nov 2023 12:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xty-0000ZQ-7U
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:50 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d580a64-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:24:49 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507cee17b00so2493206e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:49 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:47 -0800 (PST)
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
X-Inumbo-ID: 4d580a64-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223888; x=1700828688; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/X1l3KpVhIOhwMjT/JSPLzc+aIMz5zfKRbPaWipyYU=;
        b=SKVBfb9yRcYoAQ8W7SoziZ2RIvzPHeMhpok2vU/TEhZrfs0IITg7cKrBaFs8pJ6X10
         VGDg7GfMsojyjimgcKUXFLV7nrGklDi7xVZt0IKYPSpjrkYe1pG/SHvaAALnlV81gSwc
         rD3UDRPjv80hHFWmZnQrtYUAl0X9b/w/dCaPAQdZM8QSyinpCwaPlWmv6blShfIBz+dB
         VkH+zSWQne9xcjq+9h/qDAafY4IiTGoVZykdZpXW7t7Z582s9fOhj74/vfRPJXAoqt+L
         p9eT+cg9uBlKPd1MDB9SymSZZEdSxkz5Uk2r1vCB2Ox7mAAttb49wcqCrH9cEoycGqLv
         EOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223888; x=1700828688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/X1l3KpVhIOhwMjT/JSPLzc+aIMz5zfKRbPaWipyYU=;
        b=n36UYDyBJp5JxnHvopc2byfSBOfu1iInmrDuUujVU+8hxr+1SYjHGJcDzluHAPAywM
         W/Dr2/ENMcuRkSLW/QVDk3TOmQed2yuOG4QaVsPw06B7g2UsjnJNSKF59fOJuapHm91X
         bmmqwedOimGVo/eHRmmtXupMaJo6Ejk27+TekE3Apd8U8Z29HsTLVSbxRBDTjPUMVOna
         03qH9epuec305a2skb0K/wxJ/RbJOQa9YjceCtlloP3MyPL4tjVKPBkvg91bT6IBhVVH
         rQhqdR+7kb1v09GTBnq66uLBsw4Bp7Z+TbMtaWGbGqlmjLpvBLggjVcXWTefx942lu5R
         BXEQ==
X-Gm-Message-State: AOJu0YxZsFUl+9apITgm76+47GX6ja4bnGJcPuNBixwJzUeh+KzhyiMr
	WHsRLopJvPzyoeYRbOOoaw9COeGZtDc=
X-Google-Smtp-Source: AGHT+IEvnQCsFxKR1j7FSQT4FtnCuUD4m0o0xNiIC5Z2eweZoQod90dYu/BHi5QZdk43WRXX4IQtoA==
X-Received: by 2002:a05:6512:2303:b0:50a:2710:d207 with SMTP id o3-20020a056512230300b0050a2710d207mr17756432lfu.53.1700223888535;
        Fri, 17 Nov 2023 04:24:48 -0800 (PST)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 04/14] xen/asm-generic: introduce generic header iocap.h
Date: Fri, 17 Nov 2023 14:24:28 +0200
Message-ID: <3f6a80241a2c98477eaca5fa3bf80ff6c0df3f39.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iocap.h is common for Arm, PPC and RISC-V architectures thereby
it was moved to asm-generic.

Also Arm and PPC were switched to asm-generic version of iocap.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - Drop Arm and PPC's iocap.h and switch to asm-generic's version.
  - Update the commit message.
---
Changes in V2:
 - update the commit message
---
 xen/arch/arm/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/iocap.h                          | 8 --------
 xen/{arch/arm/include/asm => include/asm-generic}/iocap.h | 7 ++++---
 4 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/iocap.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/iocap.h (60%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index ece7fa66dd..96e3aa6b6c 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += iocap.h
 generic-y += paging.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 48d587f35d..9f5a0dfb31 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += hypercall.h
+generic-y += iocap.h
 generic-y += paging.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/iocap.h b/xen/arch/ppc/include/asm/iocap.h
deleted file mode 100644
index 76bf13a70f..0000000000
--- a/xen/arch/ppc/include/asm/iocap.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_IOCAP_H__
-#define __ASM_PPC_IOCAP_H__
-
-#define cache_flush_permitted(d)                        \
-    (!rangeset_is_empty((d)->iomem_caps))
-
-#endif /* __ASM_PPC_IOCAP_H__ */
diff --git a/xen/arch/arm/include/asm/iocap.h b/xen/include/asm-generic/iocap.h
similarity index 60%
rename from xen/arch/arm/include/asm/iocap.h
rename to xen/include/asm-generic/iocap.h
index 276fefbc59..dd7cb45488 100644
--- a/xen/arch/arm/include/asm/iocap.h
+++ b/xen/include/asm-generic/iocap.h
@@ -1,10 +1,11 @@
-#ifndef __X86_IOCAP_H__
-#define __X86_IOCAP_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_IOCAP_H__
+#define __ASM_GENERIC_IOCAP_H__
 
 #define cache_flush_permitted(d)                        \
     (!rangeset_is_empty((d)->iomem_caps))
 
-#endif
+#endif /* __ASM_GENERIC_IOCAP_H__ */
 
 /*
  * Local variables:
-- 
2.41.0


