Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A537EF28C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635118.990934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu6-0002cw-4O; Fri, 17 Nov 2023 12:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635118.990934; Fri, 17 Nov 2023 12:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu5-0002Xk-ST; Fri, 17 Nov 2023 12:24:57 +0000
Received: by outflank-mailman (input) for mailman id 635118;
 Fri, 17 Nov 2023 12:24:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu3-0000iK-9b
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:55 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fb95b22-8544-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:24:53 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507e85ebf50so2543375e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:52 -0800 (PST)
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
X-Inumbo-ID: 4fb95b22-8544-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223892; x=1700828692; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmhmHUWbvIjT7v8mc11Sz63FiVrJy0OUXCvMliE2Ht4=;
        b=mtREsuv4zUri87MyaDyHz0YBtzUXMgWy1t2cXNXfQVU2FjUyb3nBhKAeHDgocRQ3Xf
         mXnwmvLoRAfcCZ43lvnZoTU1mXOBvUl7zDOtGM0CbGtUgFVSVujvMSsSEECQK21O+xbN
         kFyreIBBdizNQdLK066LQleaonfSbeQZwhfEG6QJvJ+3/kLsKg7wYhEO3Uxy/JHYSXe0
         QrYvwbHGlw9gCVSgXHfB3AiL6Ne7UDOAx5s5RennU26XYUuCNqxVahCFJpuR1pePzVUF
         GhCELLUYrJqo4AcuAOEdwzLnS4AUnvtg1cWwBm3edLlpE2VvSNsDH2enHNoW5E9VPiP2
         McJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223892; x=1700828692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmhmHUWbvIjT7v8mc11Sz63FiVrJy0OUXCvMliE2Ht4=;
        b=maf2cWQoxnELcS9guWGiaiSf1KI0qXoZhaHb6SDdRgtRGwaJNEoswXqL1d0pItMcg3
         VLl6m3WCQ6P6DGjARN9AR7BCrUjiSFGfceiucTNKbBk+X9o4df0EEr750apjeY4bGUiG
         uz0nUUymqCD/25F/WfCq+WFubD6M29t805i/9Hv46oewGYjGhWHqNaMDq6LhpRz/obiz
         ZSBUV9rN811MZ1AYQ//7p54HSyBiJZ2XM5nS7mdNzyDtW6v7JGdVpGcrXOidGXXH994E
         axyywuxc1nK0o7FDshG25ExwDB8pOB+rZgnXqyDNQ2MKz67H3tKTjXNFDgEwD0PUuwOj
         beaQ==
X-Gm-Message-State: AOJu0YzMF1KxP/UgtF6ZDmoSEsSQWBN+H7yXVS3WaKfmAML1GR5p8gD3
	UMFG3xNF040HmiP+WLrE4JVn3CIjKFc=
X-Google-Smtp-Source: AGHT+IEHBboeFXfJjLbpEhMOw1rwqfVPFifgWPaWKGkc3Ns3Rd8K4df0XjjxOuDHlrOIwKkLmGP5PQ==
X-Received: by 2002:a05:6512:b8c:b0:50a:a14e:92c5 with SMTP id b12-20020a0565120b8c00b0050aa14e92c5mr1270060lfv.45.1700223892601;
        Fri, 17 Nov 2023 04:24:52 -0800 (PST)
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
Subject: [PATCH v3 07/14] xen/asm-generic: introduce generalized hardirq.h
Date: Fri, 17 Nov 2023 14:24:31 +0200
Message-ID: <3e5334809f5efa78eebe8e8ff342f10851f107f9.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/hardirq.h> is common through archs thereby it is moved
to asm-generic.

Arm and PPC were switched to asm generic verstion of hardirq.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Drop Arm and PPC's hardirq.h
 - Update the commit message.
---
Changes in V2:
	- add #include <xen/cache.h>.
	- update the commit message
---
 xen/arch/arm/include/asm/Makefile             |  1 +
 xen/arch/ppc/include/asm/Makefile             |  1 +
 xen/arch/ppc/include/asm/hardirq.h            | 19 -------------------
 .../asm => include/asm-generic}/hardirq.h     |  8 +++++---
 4 files changed, 7 insertions(+), 22 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/hardirq.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/hardirq.h (79%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 3faf1251ec..36d95d6310 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += paging.h
 generic-y += percpu.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index c0badf5717..9b38d2d381 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += paging.h
diff --git a/xen/arch/ppc/include/asm/hardirq.h b/xen/arch/ppc/include/asm/hardirq.h
deleted file mode 100644
index 343efc7e69..0000000000
--- a/xen/arch/ppc/include/asm/hardirq.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_HARDIRQ_H__
-#define __ASM_PPC_HARDIRQ_H__
-
-#include <xen/cache.h>
-
-typedef struct {
-        unsigned long __softirq_pending;
-        unsigned int __local_irq_count;
-} __cacheline_aligned irq_cpustat_t;
-
-#include <xen/irq_cpustat.h>    /* Standard mappings for irq_cpustat_t above */
-
-#define in_irq() (local_irq_count(smp_processor_id()) != 0)
-
-#define irq_enter()     (local_irq_count(smp_processor_id())++)
-#define irq_exit()      (local_irq_count(smp_processor_id())--)
-
-#endif /* __ASM_PPC_HARDIRQ_H__ */
diff --git a/xen/arch/arm/include/asm/hardirq.h b/xen/include/asm-generic/hardirq.h
similarity index 79%
rename from xen/arch/arm/include/asm/hardirq.h
rename to xen/include/asm-generic/hardirq.h
index 67b6a673db..ddccf460b9 100644
--- a/xen/arch/arm/include/asm/hardirq.h
+++ b/xen/include/asm-generic/hardirq.h
@@ -1,5 +1,6 @@
-#ifndef __ASM_HARDIRQ_H
-#define __ASM_HARDIRQ_H
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_HARDIRQ_H
+#define __ASM_GENERIC_HARDIRQ_H
 
 #include <xen/cache.h>
 #include <xen/smp.h>
@@ -16,7 +17,8 @@ typedef struct {
 #define irq_enter()     (local_irq_count(smp_processor_id())++)
 #define irq_exit()      (local_irq_count(smp_processor_id())--)
 
-#endif /* __ASM_HARDIRQ_H */
+#endif /* __ASM_GENERIC_HARDIRQ_H */
+
 /*
  * Local variables:
  * mode: C
-- 
2.41.0


