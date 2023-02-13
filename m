Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D394C69495A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494607.764740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHM-0001Pb-Ir; Mon, 13 Feb 2023 14:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494607.764740; Mon, 13 Feb 2023 14:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHM-0001KR-Bb; Mon, 13 Feb 2023 14:58:04 +0000
Received: by outflank-mailman (input) for mailman id 494607;
 Mon, 13 Feb 2023 14:58:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHK-0001Ha-Qm
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:02 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceaf1c9c-abae-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:58:00 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id eq11so13271083edb.6
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:57:59 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:57:59 -0800 (PST)
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
X-Inumbo-ID: ceaf1c9c-abae-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADMJRcoEAWm10JX/p9S3CdQyxMC2w4XTtFoR/0gxu3M=;
        b=X1lGJBJhbDa/titkYOtiVh/LdtY8RONmn7XhmMApll5t74Nm5DTuN5PfrNMKOS3IBD
         OX5GmHus4G6QcuxoL4EtKl+0OuKMx4x1KxOcYRQu9HSpOVE05YAMg5dd1w866lxLW/64
         IivBSvMpb/HOJcc78xLpttA03H0nHBxF4MXqsLNzVW4Bd82JcPZ1R6AQD3VUnwiyAGYM
         kiu1vhwmBxDWsL4thVzG0f6uaDQW8xUEbII3NiST44OfyAoOl1ADGBpPVCWmBUC5h387
         Tq1dqKaMwWxSP3AcCI5L+vu50NBx5PYDQQOBEnTtjzQIkHBBU5oV+2XZme+6lTDWoEgj
         GHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADMJRcoEAWm10JX/p9S3CdQyxMC2w4XTtFoR/0gxu3M=;
        b=oU09j0XWtg4z9U03w1X/WiAB2wr3uQ9SO2phmCmtN3lzLrr6WN3nSTPBtDKoM/GBAh
         zNwvNQz8u/9VXFeEClBBHVlwGwVB3KyKPqR3IOtJtzyw+DR0J0GnwPQNppMpLe/xy40h
         stxiYL8OnORJfzr+/nSpFvUHaVTiRNvTsi8/2hxmWDAACaGTnfLfjDIi3N1+QNr8hSxo
         e2sPmphWLB6DNkQ0dra7rLDs3gvxy8zvA0IGfuLPqacK7yEmwLxGzf2XBUf+BgYg3gyG
         Ox5C1NEmYsG99FMGssw8jI39NHrugQ+bLsUnp/2g7bk4A1R18Qoe/AhN7DjPkUIPtJKJ
         Mb8Q==
X-Gm-Message-State: AO0yUKXi0depnXSR5dQ+kIeSvtwOljtPRT5x1PHQtSVou+MHEsLrZkpo
	6cb+qyR8hoh90u24F7x96c2Jzq0V3g8=
X-Google-Smtp-Source: AK7set9UsZcVfGy81UB7eVU5IdMA6J8v5r9Aj7wABPQloH0Ui0vkXBWyinmWtBM20hhv/+XKmmOtxA==
X-Received: by 2002:a50:d70f:0:b0:4ac:b619:80d5 with SMTP id t15-20020a50d70f000000b004acb61980d5mr8494122edi.2.1676300279322;
        Mon, 13 Feb 2023 06:57:59 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [RFC 01/10] x86: introduce AMD-V and Intel VT-x Kconfig options
Date: Mon, 13 Feb 2023 16:57:42 +0200
Message-Id: <20230213145751.1047236-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce two new Kconfig options, AMD_SVM and INTEL_VMX, to allow code
specific to each virtualization technology to be separated and, when not
required, stripped.
AMD_SVM will be used to enable virtual machine extensions on platforms that
implement the AMD Virtualization Technology (AMD-V).
INTEL_VMX will be used to enable virtual machine extensions on platforms that
implement the Intel Virtualization Technology (Intel VT-x).

Both features depend on HVM support.

Since, at this point, disabling any of them would cause Xen to not compile,
the options are enabled by default if HVM and are not selectable by the user.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/Kconfig            | 6 ++++++
 xen/arch/x86/cpu/Makefile       | 4 +++-
 xen/arch/x86/hvm/Makefile       | 4 ++--
 xen/arch/x86/mm/Makefile        | 3 ++-
 xen/arch/x86/mm/hap/Makefile    | 2 +-
 xen/drivers/passthrough/Kconfig | 2 +-
 6 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba..2a72111c23 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -117,6 +117,12 @@ config HVM
 
 	  If unsure, say Y.
 
+config AMD_SVM
+	def_bool y if HVM
+
+config INTEL_VMX
+	def_bool y if HVM
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 35561fe51d..08bdf4abb8 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -10,4 +10,6 @@ obj-y += intel.o
 obj-y += intel_cacheinfo.o
 obj-y += mwait-idle.o
 obj-y += shanghai.o
-obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
+obj-y += vpmu.o
+obj-$(CONFIG_AMD_SVM) += vpmu_amd.o
+obj-$(CONFIG_INTEL_VMX) += vpmu_intel.o
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 3464191544..4c1fa5c6c2 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,5 +1,5 @@
-obj-y += svm/
-obj-y += vmx/
+obj-$(CONFIG_AMD_SVM) += svm/
+obj-$(CONFIG_INTEL_VMX) += vmx/
 obj-y += viridian/
 
 obj-y += asid.o
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 0803ac9297..c53c94308a 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
 obj-$(CONFIG_HVM) += nested.o
 obj-$(CONFIG_HVM) += p2m.o
 obj-y += p2m-basic.o
-obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
+obj-$(CONFIG_HVM) += p2m-pod.o p2m-pt.o
+obj-$(CONFIG_INTEL_VMX) += p2m-ept.o
 obj-y += paging.o
 obj-y += physmap.o
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 8ef54b1faa..67c29b2162 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -3,4 +3,4 @@ obj-y += guest_walk_2.o
 obj-y += guest_walk_3.o
 obj-y += guest_walk_4.o
 obj-y += nested_hap.o
-obj-y += nested_ept.o
+obj-$(CONFIG_INTEL_VMX) += nested_ept.o
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 864fcf3b0c..f95e7e5902 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -51,7 +51,7 @@ config AMD_IOMMU
 
 config INTEL_IOMMU
 	bool "Intel VT-d" if EXPERT
-	depends on X86
+	depends on X86 && INTEL_VMX
 	default y
 	help
 	  Enables I/O virtualization on platforms that implement the
-- 
2.37.2


