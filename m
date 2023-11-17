Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477827EF297
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635122.990969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuB-0003jb-Js; Fri, 17 Nov 2023 12:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635122.990969; Fri, 17 Nov 2023 12:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuA-0003by-Vw; Fri, 17 Nov 2023 12:25:02 +0000
Received: by outflank-mailman (input) for mailman id 635122;
 Fri, 17 Nov 2023 12:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xu9-0000ZQ-5s
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:25:01 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53c9b3de-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:25:00 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5099184f8a3so2802956e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:25:00 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:59 -0800 (PST)
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
X-Inumbo-ID: 53c9b3de-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223900; x=1700828700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QonSCuwrPbZ3BVwuT3NYP06ZPrDraLB08reCatd0+0o=;
        b=f1Ep8rIcvbGcb9Fjj970a1jKtLJac5VoyeQTx8bGV0k+BT+wD0GXFAomeMJ8GZs2sM
         Nzr9WLnTvxF05z3G29Q5il3ctdivpNhXtbsjxfLl9uPv9Zr9fNTst8sCnxCoZDXn7hyQ
         ZekWHYaRdEPn2zQwwybI++A2DOOcfgO2+OOlkwoKprIJ92FOXLsTFETEjyDOjwlemUAw
         SNUDN1bXxBd2bVwFxeyH47Yktni/6e7CpV7Rf4kv7ZemMNpKvp5xqFP0Frub6ttKni2D
         xp/HrW/Z4RSK+O0itcevW05K70FC0d1nBAe7KggTjsytODMOMwH9tT7ax9AlSyd0abwM
         NrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223900; x=1700828700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QonSCuwrPbZ3BVwuT3NYP06ZPrDraLB08reCatd0+0o=;
        b=njRtpVYBNuvdisYFxfFB2cO0V/zHj2E/VVW9XHQJGenhot+xJM+6/bc+JRnyyd2kh9
         6X83DA6AmXl9C5HFIX4dCyTMpo+N7l/vA3ssSyH6yf+dovbZPng8heebyXCcWlQeht9e
         gWgpUzNSlGsqe0TH6PU65Itxk058dsiF9BKFyTVIZrUrWrM9DrCuoX1r2MtgnoHbpptJ
         U1WRcWn56Ca7bjh7zNNKnFBalPyApyW9YQakWQGfBaArq/6FF6yhJB36O9qLA/aFqQYx
         ZLkuVFFhRwz/xougQ2wldC9ZymM5XFwpxfTQvAWEK0sL+L01Rr4RmxAbrtecd4geoBXT
         ZqVA==
X-Gm-Message-State: AOJu0YxgxPNgDpixrLyvC0DwWtOPDTkDTASMcxvb0IR9u2oumZhW3S+a
	ziiyn0Ua4Zgxu+FmeiNtXgGS4Z6x5xk=
X-Google-Smtp-Source: AGHT+IHaKfR3Y7LwzJZtrA7bo685nqeXeJgJYC6v47j0WKICBp9bTY3uHYYadaEnYydLC2spdIQiVQ==
X-Received: by 2002:a05:6512:2382:b0:509:1368:ddc1 with SMTP id c2-20020a056512238200b005091368ddc1mr18620572lfv.53.1700223899936;
        Fri, 17 Nov 2023 04:24:59 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 12/14] xen/asm-generic: introduce stub header softirq.h
Date: Fri, 17 Nov 2023 14:24:36 +0200
Message-ID: <8b1969350a4f05758969058d47ac3ec10d80db50.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/softirq.h> is common between Arm, PPC and RISC-V so it is
moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index d5a94bc718..a3f44baa34 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -9,4 +9,5 @@ generic-y += numa.h
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
2.41.0


