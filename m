Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337B57FA214
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642124.1001361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMp-0007Fz-LW; Mon, 27 Nov 2023 14:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642124.1001361; Mon, 27 Nov 2023 14:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMp-00077k-Eh; Mon, 27 Nov 2023 14:13:43 +0000
Received: by outflank-mailman (input) for mailman id 642124;
 Mon, 27 Nov 2023 14:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMn-0005XE-C8
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:41 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a57dcc0-8d2f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:13:40 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50aab20e828so6079842e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:40 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:39 -0800 (PST)
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
X-Inumbo-ID: 2a57dcc0-8d2f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094420; x=1701699220; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCDKszFdTZd3ubNMlRIerIQDFL6fl03ubInCKVrFPUQ=;
        b=TNMzRNwDnfKy+7xq+ZNxoEVFavEBNz6eKhw8wGt1y6okTxV9ZvSBHqVBRDsIzJQi+d
         Ro1LlcX57rN9cnzl0kv5kWSgXWGJihrRD6QMoLym28CcwtRFMDY3WUJVFthnLD0Uvo2g
         OlsyVLqFTBQualAAffLxvmHlV9nAv6Q4gDkmRQuTZGa8MgQiX9gFQXCo8bUM6GYabw06
         ErpG+02APHpYMYHwGQEigiS09PtP6DCQ9TyF3u7N5K/sjTDb7ELUcnn0b4vEAkdgBQgd
         2c++mfSlgrRDjdNDpJJjScprdAIJ0gvRC/Rji1gzinGzUOsB/zCz8BaL9eWkoeuzTwNi
         AHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094420; x=1701699220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCDKszFdTZd3ubNMlRIerIQDFL6fl03ubInCKVrFPUQ=;
        b=XnEyjjXrjjaIua1OdqA3AawxDvkPrL0j9EUsxF/gpuEQgEo3xy/ZodtDLtBoqb9gPB
         fGnK/proM5YE1FitDsJtNvgtt1TGLdE4xrzTRphLh0LzBWQtPKl1qBq3tRKLH+M5EYKQ
         RjPrpnuOwVwgiZlZW4MbtR+Uks9gu5kfW6IPqAQFNh6l/SRtcaTODoY8tAa18nN2Ib/G
         R+/6DVMeOBVw9uPYd4D+5wA8eAH+ROFZkW+WVm1hwWamtqNv4gfbbW3N4dx9ORep9q7I
         c7wrvUk3D2I7TJI226pw+G8uv/ySl/uRbWycB1Ei9PKE9w16DvpFahX8O2kmE2j8h5en
         X9Eg==
X-Gm-Message-State: AOJu0YwoA4vBB+q6EeQkSk4NF00jQN9nSvLTCj5P9tNGUv//XOJJLT1w
	l2/Lmm2Yc9c0GlnBTC+DUjBEaYYVU+iKVw==
X-Google-Smtp-Source: AGHT+IGIv7qDJm1UBS7MdqQQbNs8Vfeg3A1ypx4IfmzCjPBzEWLTSrDeeq68OF3ymgUlgnftq0yj9g==
X-Received: by 2002:a05:6512:23a7:b0:500:a66b:b189 with SMTP id c39-20020a05651223a700b00500a66bb189mr6988673lfv.51.1701094419620;
        Mon, 27 Nov 2023 06:13:39 -0800 (PST)
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
Subject: [PATCH v4 07/14] xen/asm-generic: introduce generalized hardirq.h
Date: Mon, 27 Nov 2023 16:13:20 +0200
Message-ID: <4834c3e10a0dba429edb41c340065560ccf0d942.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/hardirq.h> is common through archs thereby it is moved
to asm-generic.

Arm and PPC were switched to asm generic verstion of hardirq.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V4:
 - Added Reviewed-by: Jan Beulich <jbeulich@suse.com>.
 - Added Acked-by: Julien Grall <jgrall@amazon.com>.
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
index 60bb78fc09..f6f108bbb8 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += device.h
+generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += paging.h
 generic-y += percpu.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index edef0fab78..3241236c64 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += device.h
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
2.43.0


