Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD17FA219
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642121.1001335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMm-0006aG-2H; Mon, 27 Nov 2023 14:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642121.1001335; Mon, 27 Nov 2023 14:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMl-0006YD-VA; Mon, 27 Nov 2023 14:13:39 +0000
Received: by outflank-mailman (input) for mailman id 642121;
 Mon, 27 Nov 2023 14:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMk-0005in-CT
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:38 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27d2a50a-8d2f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:13:36 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507a98517f3so5768285e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:36 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:34 -0800 (PST)
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
X-Inumbo-ID: 27d2a50a-8d2f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094416; x=1701699216; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTGEtmZyvJYSvDBCU/Joet0728F83MeKuS2cE8UNmxw=;
        b=UJ+uN8vD88p81E8jSqmhNPkEeuArZG9A9wu55lFNpEC/FDw82h6tnxVrRNsOeMYfTO
         eck3KMyZi9bMvSI5QVCOJxolL2eXwxQY6R44ik1cuFyLHmu74NMBoiDLoU0CycszP03V
         kQYyR8OW8+6H7gnqCdRp43mR+MIIX4EauYXQ5p1GNVtXMqMVqFrnNG+vdWkkGQEGiKDW
         qxVwDknKC48AubDvUf78XbHeLsishQtD5uh3BP8yzVXTzjUbnYVFF3CNpRGuwKm6twMg
         4MADulmooYPmqo2NCObQP26Y7/q4JwCSLHVcPNW3gSn+jOhaQpQjumclAQ3OX1AwInsx
         XVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094416; x=1701699216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTGEtmZyvJYSvDBCU/Joet0728F83MeKuS2cE8UNmxw=;
        b=k8U7w0tHwKjGFthK+A8uOaMxftcrGUxmG3frZEwHT/61GwIa62GeTFuOOhnB4k9rnh
         J7GrxApAElwo8DUby9/WDRfhZZrQHeql7BCer18HUTLMLZ/1BeLWcQnWyWPOhOl29T2q
         rYCuOaF/pCyPBNq8o9C8c6iGx/1cdVX/FBIjJAbSu72Umi198tu6al7ooiW9wBbpwU/t
         ncv8/ZgPP/kjOMmfBcRZTzAQP/6ITJDXC3ka84Tjg/k9byy4jFl4brTQDTluT9hNXgGr
         OUADBdDv0L/t/HJbhGRY/SvP/H3sey+s6pof7JezemBSlyf2H8TBqrXYI/IM9khXrtc8
         LzuQ==
X-Gm-Message-State: AOJu0YwnGWSEgxHadaKqEn6fKwAcMjuJ+k53vfq6RdBcY8AJxpSI1vA1
	aWO2btpbyaphvt5YOCqaUKo57m0ABE6vwQ==
X-Google-Smtp-Source: AGHT+IGSEcW61mTUe4cUfkt2cJXqcXPCENoYhknpst/CAwEbU39mNrs0P0CCsyJ1SDaFNznvLWyAiw==
X-Received: by 2002:a05:6512:ea0:b0:503:1b83:e352 with SMTP id bi32-20020a0565120ea000b005031b83e352mr9955172lfb.52.1701094415582;
        Mon, 27 Nov 2023 06:13:35 -0800 (PST)
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
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 04/14] xen/asm-generic: introduce generic header iocap.h
Date: Mon, 27 Nov 2023 16:13:17 +0200
Message-ID: <855ac4ea4061fac36f24dc8b9125349c2074e1dc.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iocap.h is common for Arm, PPC and RISC-V architectures thereby
it was moved to asm-generic.

Also Arm and PPC were switched to asm-generic version of iocap.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V4:
	- Added Reviewed-by: Jan Beulich <jbeulich@suse.com>
	- Acked-by: Julien Grall <jgrall@amazon.com>
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
index df4c1ebb08..2d036045e8 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += device.h
+generic-y += iocap.h
 generic-y += paging.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index d5e369128c..209c3e74d8 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += device.h
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
2.43.0


