Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B597CBE9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 17:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800818.1210830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJZB-0007an-Ll; Thu, 19 Sep 2024 15:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800818.1210830; Thu, 19 Sep 2024 15:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJZB-0007Xz-IZ; Thu, 19 Sep 2024 15:59:37 +0000
Received: by outflank-mailman (input) for mailman id 800818;
 Thu, 19 Sep 2024 15:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hDEZ=QR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1srJZA-0007Xh-Bu
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 15:59:36 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e35b9e-76a0-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 17:59:34 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53660856a21so997071e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 08:59:34 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5369fa5ceb3sm631423e87.32.2024.09.19.08.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 08:59:32 -0700 (PDT)
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
X-Inumbo-ID: 29e35b9e-76a0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726761573; x=1727366373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKAfkZ7wyQ029mmkdNEAuODIEACdmHMLY1z97j/M+8w=;
        b=Uo7awTxOY4X2Bvez/0gpcbu4UxCmdSMxVkaLYUA4NUQ23AAQ9C3gcSGhvDFU6QDZh5
         hSbL1xijCPxqVQWABHvSDG1N6gwFqNDdq7ZjmItzHbjqRbHCMk+ugOb6oYfwhbRLncoV
         lNus3QOQqLaSmrpvmOgjg60170RKk7c19aqnN0hZrfdcThD1B17TC53JANOmZqhup3A3
         vwjvZYkAfHllw7+F03GEKPVXXxslqIjlDSu9nCzGD124RyG7XzQ0W+VQc1MW/HEmsR8X
         Yt1Nv/MbhDwAj55Ik3W/IGhPVEv1jNpkcRAWtidqYARGTWInSewfbXs8VCX7SClajDl3
         9K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726761573; x=1727366373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKAfkZ7wyQ029mmkdNEAuODIEACdmHMLY1z97j/M+8w=;
        b=J8I6y4ek70uRX4DaA3NsFKUJ5KlQR1K3coDl5JAQaSDWhGqW9h0VbUP6kUOCR/rUuF
         a9NBkrKupG/wEyD1XLU8+ouoiqQWpHqtZa0Zl1r+OHqA6YJDvdIhTC3kd2N3U/KZiZcN
         iTBUfLxZLGwbxt5uCmFQ8FUNIU0BL1DiXMmuVfAdNVlgVHdVdr5BJgUsUaWrH1MRG7wQ
         QpcOZOJzoWwNI/qKvx/MNBTxlYRQZhtvA/Te+VScGabf0Kz94cydFpH2rIZele7skZs6
         EFZV66ZosFHYK+0mWBujqBmsv5wYq0dPdAiW0PA8Zu8mzaIfQT1OUYBC1LrG2CeAODUv
         4feg==
X-Gm-Message-State: AOJu0YxpfJv7kCyvv85SjmSuvEYj/FWzFVj9LsmQWN1/gc0udXThVzFA
	EyTOAEIQzBJk59AQRZhzwazhshr3Vhx+i1L/arfVuvI5tmHKFvWPYYC+Ug==
X-Google-Smtp-Source: AGHT+IETsTQkWVYYKpKyErxKhsJ63imj/xKAaMLA0cSW0RdhCmBp8itNhvSNH2aAJyT9gMAOjyiTRg==
X-Received: by 2002:a05:6512:130f:b0:532:ec7d:9c58 with SMTP id 2adb3069b0e04-5367ff338edmr11902128e87.56.1726761573269;
        Thu, 19 Sep 2024 08:59:33 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 1/2] xen: introduce common macros for per-CPU sections defintion
Date: Thu, 19 Sep 2024 17:59:27 +0200
Message-ID: <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726746877.git.oleksii.kurochko@gmail.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce PERCPU_SECTION macro which manages:
 * Alignment of the section start
 * Insertion of per-CPU data sections
 * Alignment and start/end markers for per-CPU data
This change simplifies the linker script maintenance and ensures a unified
approach for per-CPU sections across different architectures.

Refactor the linker scripts for Arm, PPC, and x86 architectures by using
the common macro PERCPU_SECTION defined in xen/xen.lds.h to handle
per-CPU data sections.

No functional changes.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/xen.lds.S    |  9 +--------
 xen/arch/ppc/xen.lds.S    |  9 +--------
 xen/arch/x86/xen.lds.S    |  9 +--------
 xen/include/xen/xen.lds.h | 10 ++++++++++
 4 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index bd884664ad..669a882455 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -198,14 +198,7 @@ SECTIONS
        __bss_start = .;
        *(.bss.stack_aligned)
        *(.bss.page_aligned)
-       . = ALIGN(PAGE_SIZE);
-       __per_cpu_start = .;
-       *(.bss.percpu.page_aligned)
-       *(.bss.percpu)
-       . = ALIGN(SMP_CACHE_BYTES);
-       *(.bss.percpu.read_mostly)
-       . = ALIGN(SMP_CACHE_BYTES);
-       __per_cpu_data_end = .;
+       PERCPU_SECTION
        *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 38cd857187..0833d80479 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -148,14 +148,7 @@ SECTIONS
         __bss_start = .;
         *(.bss.stack_aligned)
         *(.bss.page_aligned)
-        . = ALIGN(PAGE_SIZE);
-        __per_cpu_start = .;
-        *(.bss.percpu.page_aligned)
-        *(.bss.percpu)
-        . = ALIGN(SMP_CACHE_BYTES);
-        *(.bss.percpu.read_mostly)
-        . = ALIGN(SMP_CACHE_BYTES);
-        __per_cpu_data_end = .;
+        PERCPU_SECTION
         *(.bss .bss.*)
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d48de67cfd..eea8edc02b 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -321,14 +321,7 @@ SECTIONS
   DECL_SECTION(.bss) {
        __bss_start = .;
        *(.bss.page_aligned*)
-       . = ALIGN(PAGE_SIZE);
-       __per_cpu_start = .;
-       *(.bss.percpu.page_aligned)
-       *(.bss.percpu)
-       . = ALIGN(SMP_CACHE_BYTES);
-       *(.bss.percpu.read_mostly)
-       . = ALIGN(SMP_CACHE_BYTES);
-       __per_cpu_data_end = .;
+       PERCPU_SECTION
        *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index a17810bb28..f043c7b6c0 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -151,6 +151,16 @@
 #define LOCK_PROFILE_DATA
 #endif
 
+#define PERCPU_SECTION              \
+       . = ALIGN(PAGE_SIZE);        \
+       __per_cpu_start = .;         \
+       *(.bss.percpu.page_aligned)  \
+       *(.bss.percpu)               \
+       . = ALIGN(SMP_CACHE_BYTES);  \
+       *(.bss.percpu.read_mostly)   \
+       . = ALIGN(SMP_CACHE_BYTES);  \
+       __per_cpu_data_end = .;      \
+
 #ifdef CONFIG_HAS_VPCI
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.46.0


