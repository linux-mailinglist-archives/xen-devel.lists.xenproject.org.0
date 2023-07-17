Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079587568A0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564731.882411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh6-0002zg-Ss; Mon, 17 Jul 2023 16:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564731.882411; Mon, 17 Jul 2023 16:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh6-0002v1-NW; Mon, 17 Jul 2023 16:03:28 +0000
Received: by outflank-mailman (input) for mailman id 564731;
 Mon, 17 Jul 2023 16:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh4-0002Zo-LD
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:26 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75af6146-24bb-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 18:03:24 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso7599782e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:24 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:23 -0700 (PDT)
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
X-Inumbo-ID: 75af6146-24bb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609804; x=1692201804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0IhxmE72AYW3LaZbJhXXAiAR4Fd8XXkCy6sjFZ0aFM=;
        b=FtvKo5PCq617lmKRFyV0zgLNB30iOSu8auC6E2SOys3Xyqd1Rucss97XPbNM20PqXT
         SPQfBQbbQObshwWPAkZzbmIPg7N436jBLf7+3WQ6DXGTXHjCtYZmCRrZvig/7frXOgdI
         M+3JpXTV8FmMP83cXmg0nAcyJtUv1ZZtuwFNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609804; x=1692201804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0IhxmE72AYW3LaZbJhXXAiAR4Fd8XXkCy6sjFZ0aFM=;
        b=kAxBWSDNE5fv6w2AE3R8M8A1mWUG2Z3t1OkRZnGz5Lo+Uxp3mLSdOMpUcrIfdR9o1J
         QgfaKZWCw3EFUS+OUSEPFR1MlwUNwj0e8KtyxPPDwifmKYpgrrIYIl3QEXzJOKP99/9e
         bhtI0hJG5cMvFwhHjicZdMsuko6FOxVxU7JHbUeuWeTT0/yehL+UWCLOROwmI/8M9TtI
         WkXjy2P7QAez7W4J9WLUT70n+LIyQW7YrgUO2Y9qG+H8eSOcnt2iThPmMDGth4ASLMvE
         7tf4EicvigZawKi6E1QhmZi4+gNurGt38rBp+ja72qdZxXdzm1Thv1enRGrpdBQIrPiE
         oBwQ==
X-Gm-Message-State: ABy/qLZx+Ob8gHrCSWaT1GcWIlyOEATiV3b6w/DqNjkBKrOrHynawk/i
	CPevNMJCwyLDPN6pb5fwoNf8AYF2HPavChTT/Yw=
X-Google-Smtp-Source: APBJJlGlOoLPXXCdptae0m4OTaZqL/bcr7BbXfoZ/2PlFQ6YxvMLg3XpFG5LN6Zp4BtfhPEDporJiw==
X-Received: by 2002:a05:6512:3194:b0:4f9:586b:dba6 with SMTP id i20-20020a056512319400b004f9586bdba6mr10059097lfe.10.1689609804064;
        Mon, 17 Jul 2023 09:03:24 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/8] build: Remove CONFIG_HAS_PDX
Date: Mon, 17 Jul 2023 17:03:14 +0100
Message-Id: <20230717160318.2113-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's set everywhere and can't be turned off because it's presence is
assumed in several parts of the codebase. This is an initial patch towards
adding a more fine-grained CONFIG_HAS_PDX_COMPRESSION that can actually be
disabled on systems that don't typically benefit from it.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/arm/Kconfig  | 1 -
 xen/arch/x86/Kconfig  | 1 -
 xen/common/Kconfig    | 3 ---
 xen/common/Makefile   | 2 +-
 xen/include/xen/pdx.h | 3 ---
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 439cc94f33..ea1949fbaa 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,7 +14,6 @@ config ARM
 	select HAS_ALTERNATIVE
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
-	select HAS_PDX
 	select HAS_PMAP
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 92f3a627da..30df085d96 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -24,7 +24,6 @@ config X86
 	select HAS_PASSTHROUGH
 	select HAS_PCI
 	select HAS_PCI_MSI
-	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index dd8d7c3f1c..40ec63c4b2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -53,9 +53,6 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
-config HAS_PDX
-	bool
-
 config HAS_PMAP
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 46049eac35..0020cafb8a 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -29,7 +29,7 @@ obj-y += multicall.o
 obj-y += notifier.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
-obj-$(CONFIG_HAS_PDX) += pdx.o
+obj-y += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
 obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
 obj-y += preempt.o
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index de5439a5e5..67ae20e89c 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -67,8 +67,6 @@
  * region involved.
  */
 
-#ifdef CONFIG_HAS_PDX
-
 extern unsigned long max_pdx;
 extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
 extern unsigned int pfn_pdx_hole_shift;
@@ -171,7 +169,6 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
  */
 void pfn_pdx_hole_setup(unsigned long mask);
 
-#endif /* HAS_PDX */
 #endif /* __XEN_PDX_H__ */
 
 /*
-- 
2.34.1


