Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431878014CE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645742.1008048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AR0-0000Cg-Bg; Fri, 01 Dec 2023 20:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645742.1008048; Fri, 01 Dec 2023 20:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9AR0-00009K-7f; Fri, 01 Dec 2023 20:48:26 +0000
Received: by outflank-mailman (input) for mailman id 645742;
 Fri, 01 Dec 2023 20:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVFl=HM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r9AQy-0008SX-MU
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:48:24 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6dc7b51-908a-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 21:48:22 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9c149848fso33125571fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:48:21 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i18-20020a2ea372000000b002c6ed7e546esm511142ljn.124.2023.12.01.12.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 12:48:20 -0800 (PST)
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
X-Inumbo-ID: f6dc7b51-908a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701463700; x=1702068500; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K0BYHGWC+ogJ6gBKSwmGTMdkzCbZuHLzNWf4Sj6tTQ=;
        b=Fp9CMOCPpf5JGCK4HACnzwkanlzaWMhDJiNi+mGQzTt/UGqRU9Q2VjI+yHfaH5vU6N
         39M4W1q63uyZ6qxI8tfV7crhn2Y9Z+Qmea3qFEbKbSn5fX20ZU4iW/l4Lvobz4mkBCcc
         WxU8J1ZXmn/xBT1i6EDo/o1BebstyICubvql6YU5YSyGmR56q1psmrotfSjgNv7rnVO8
         3oMFm0L35leNXilWOeAYHdYkraf8MbdMMZKOT2O5Nf+uvloynU/s59KpPvgEJPoP8DKp
         zhDZxKUF4hk1wzx3UtcFjfCnjxNO+CyDPdD+mSI5s5Tfd/8iT9TjdeelQxBXi3HP6XCG
         LN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701463700; x=1702068500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8K0BYHGWC+ogJ6gBKSwmGTMdkzCbZuHLzNWf4Sj6tTQ=;
        b=kLqPu8grBR4BoYpD5KH8qZlxN2VfxwNpxJCUH1MzCN9ZguKFu71l1ok52IlydCEgM3
         1xvqlFuquh4YWu2PlTNYAOpNRgmQ8A8PRQocRDTr0UO/5T7ZwELgxSWoZ5gUaJTlT34R
         WTroNkmht3vH5GXoa4pCTylmotSLDkerLr2JiJ8qheYjLrLA60PCPJNrea924k05bRK1
         8sZwbx0Uv1esm2wB7Iw+MGpBWzOAkOTVznebK5fQ8aRPW3nq4xs/9tz1TmgkCDRFuyS9
         s67DyjqElqmmH3m6dQJH03/YopuUSJ8D7cuPOeYnS/peuarzwInUQls0CrzUtED48Riq
         6NwA==
X-Gm-Message-State: AOJu0YxQleqQh+6DXqT/Aqy3D4c/6BrvCbSqF7WuJzM8gkYz0C78+GrW
	Mue2aSruukIKRPpV9ljq1EF+ojzHGInRoA==
X-Google-Smtp-Source: AGHT+IHwoqKK/fylcEtCmUl06UVfE5szR9Dr+PSwdTucXZKF9B4qEHFRgrM3cdOmVKbTGjFnDwKmzg==
X-Received: by 2002:a2e:9286:0:b0:2c9:c43e:8ac2 with SMTP id d6-20020a2e9286000000b002c9c43e8ac2mr1054667ljh.12.1701463700396;
        Fri, 01 Dec 2023 12:48:20 -0800 (PST)
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
Subject: [PATCH v5 4/7] xen/asm-generic: introduce stub header softirq.h
Date: Fri,  1 Dec 2023 22:48:07 +0200
Message-ID: <56ce43435f5f9be025d74503f173ef04176f4882.1701453087.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701453087.git.oleksii.kurochko@gmail.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/softirq.h> is common between Arm, PPC and RISC-V so it is
moved to asm-generic.

Drop Arm and PPC's softirq.h and use asm-generic version instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V5:
 - Strayed "Added" in commit message
 - Added Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V4:
 - Added Reviewed-by: Michal Orzel <michal.orzel@amd.com>
 - Added Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Drop Arm and PPC's softirq.h
 - Update the commit message.
---
Changes in V2:
    - update the commit message.
---
 xen/arch/arm/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/Makefile                         | 1 +
 xen/arch/ppc/include/asm/softirq.h                        | 8 --------
 .../arm/include/asm => include/asm-generic}/softirq.h     | 7 ++++---
 4 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/softirq.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/softirq.h (56%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 0c855a798a..a28cc5d1b1 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -6,4 +6,5 @@ generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index f09c5ea8a1..efd72862c8 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -8,4 +8,5 @@ generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/softirq.h b/xen/arch/ppc/include/asm/softirq.h
deleted file mode 100644
index a0b28a5e51..0000000000
--- a/xen/arch/ppc/include/asm/softirq.h
+++ /dev/null
@@ -1,8 +0,0 @@
-#ifndef __ASM_PPC_SOFTIRQ_H__
-#define __ASM_PPC_SOFTIRQ_H__
-
-#define NR_ARCH_SOFTIRQS 0
-
-#define arch_skip_send_event_check(cpu) 0
-
-#endif /* __ASM_PPC_SOFTIRQ_H__ */
diff --git a/xen/arch/arm/include/asm/softirq.h b/xen/include/asm-generic/softirq.h
similarity index 56%
rename from xen/arch/arm/include/asm/softirq.h
rename to xen/include/asm-generic/softirq.h
index 976e0ebd70..83be855e50 100644
--- a/xen/arch/arm/include/asm/softirq.h
+++ b/xen/include/asm-generic/softirq.h
@@ -1,11 +1,12 @@
-#ifndef __ASM_SOFTIRQ_H__
-#define __ASM_SOFTIRQ_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SOFTIRQ_H__
+#define __ASM_GENERIC_SOFTIRQ_H__
 
 #define NR_ARCH_SOFTIRQS       0
 
 #define arch_skip_send_event_check(cpu) 0
 
-#endif /* __ASM_SOFTIRQ_H__ */
+#endif /* __ASM_GENERIC_SOFTIRQ_H__ */
 /*
  * Local variables:
  * mode: C
-- 
2.43.0


