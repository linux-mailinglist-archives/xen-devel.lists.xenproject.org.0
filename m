Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA55A4A37F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899111.1307576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ee-0006eH-Sb; Fri, 28 Feb 2025 20:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899111.1307576; Fri, 28 Feb 2025 20:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ee-0006bY-P6; Fri, 28 Feb 2025 20:08:16 +0000
Received: by outflank-mailman (input) for mailman id 899111;
 Fri, 28 Feb 2025 20:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6ed-0005OT-Fm
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:08:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda37603-f60f-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 21:08:14 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-abbec6a0bfeso391566366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 12:08:14 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf1d1a84b7sm267586566b.19.2025.02.28.12.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 12:08:12 -0800 (PST)
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
X-Inumbo-ID: bda37603-f60f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773293; x=1741378093; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Jop1hBaJ3pnNk3H9uIqCEBRmmCVkB6BdhpXsgr1UDY=;
        b=IlDiEQcZE9nhIsrQPQ01U/Wg/zkm2p7DKLm1mZ1Z8Ns3DRRl8L7lPrdHJnyP1Yz5V3
         yuXDS00tT8HPJX5N/XspE1K6/7TUAwH9bvVBKJd6JYE2fr5YSqy+MKNT+jUbo/xJfW2k
         7Qn1tzuNvCtbFt6VldOymtJGVT+5InNcp0H1FTggNVmD39ThmTSZIPHXdWhi2tf5odq/
         fzIElhZCvxszReQ58q0vexTvkMZi1eoMyivmmFZ83GcSALhCqwG3UKofaCLZzNRYq/qp
         vSGQ0IfqgdZv2s+WYNT4aghCLK3kr5AWSy14hrzT0ueG1nmiEtaqcM8YBAwW3KFl9o3M
         sTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773293; x=1741378093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Jop1hBaJ3pnNk3H9uIqCEBRmmCVkB6BdhpXsgr1UDY=;
        b=Knp997cJw1GZMVR4w/6UBCROkTdrluIbZ4fGmBjNJOH5KxQ9FiHwAk0yS6sfumjbCF
         4GTCqxDAlDNXlXy3AG/07dvHV4ntnxNeK3piViKAfNfI4L6GyCYCwvUaVzFu7w3aSD7r
         QuXnZmaml97RVRyY7Ok37mS0D7pj18FRNihrOPtimiFEV4oI8XUVvtnevyzL7m2sOH96
         B2WfZVCGPKUhd5IMJva1tPEwb9AplGF17lZnTM/wfQSRlL7wprQc1Iya5GOSXo6fKehx
         z8MfDoYGOHMLnJwNycFEIVfLvzcLcIfnQvYPdtFjR39KGbkgqara6BQMRISLrlPdOXQW
         uwEQ==
X-Gm-Message-State: AOJu0YxN1N8MjwT24IQNTBip3HrLT990zSxcHa0rZPwoj+s5ulw9TDx7
	n1ordv12HmEecEra+8Lp/K0Bl/e9UIhb1myd9dhRoTbIfL5vCpftcQoF2A==
X-Gm-Gg: ASbGncvVmw/tGYZzohKrdXd0l2afXr/URZAmf/hYsAUH+BGPle+m6BIvyGlQedsS2yy
	wpLLn8tMivUpTfbi0Jx+wANI0A3B9Qj8ONkcGnQdgP+tYBpvaahwOSB9FAKFm1ivdD7GZ8g9saA
	CGj7udadnlOAUlp/F5L4Ppe8st87uy5q864hSQb3pT/Wpi+B9qtnITRMWxycD2sNbpHX8Fiys0/
	YZLDg9IzFKwjctm80KHlPyw2zsv5F0Zopa9e1/posySzFe3CvAP9iEX2EMRU6nsk021t1hhnRz+
	cREAKni8juenFBdx61epGcq1Wsc=
X-Google-Smtp-Source: AGHT+IGZJUtBwtWiR5R7fDgmYa24CEBFv5BD0O0AC7XrGL+dNTz4PtKsfMCvms3phO+qDJ/5vcQQvA==
X-Received: by 2002:a17:907:3d88:b0:abc:919:a989 with SMTP id a640c23a62f3a-abf2682e053mr475604166b.48.1740773292936;
        Fri, 28 Feb 2025 12:08:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 3/6] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
Date: Fri, 28 Feb 2025 21:07:41 +0100
Message-ID: <335dcb9923a06631cbfb6656e262a560f17a4522.1740764258.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740764258.git.oleksii.kurochko@gmail.com>
References: <cover.1740764258.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'G' stands for "imafd_zicsr_zifencei".

Extensions 'f' and 'd' aren't really needed for Xen, and allowing floating
point registers to be used can lead to crashes.

Extensions 'i', 'm', 'a', 'zicsr', and 'zifencei' are necessary for the
operation of Xen, which is why they are used explicitly (unconditionally)
in -march.

Drop "Base ISA" choice from riscv/Kconfig as it is always empty.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V8:
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V7:
 - For better readability use += instead of := for riscv-march-* in arch.mk.
 - Drop spaces from riscv-march-y by usage of subst macros.
 - Drop "Base ISA" choice as it is empty now.
 - Update the commit message.
---
Changes in V6:
 - new patch.
---
 xen/arch/riscv/Kconfig | 18 ------------------
 xen/arch/riscv/arch.mk |  8 +++++---
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index fa95cd0a42..d882e0a059 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -23,24 +23,6 @@ endmenu
 
 menu "ISA Selection"
 
-choice
-	prompt "Base ISA"
-	default RISCV_ISA_RV64G if RISCV_64
-	help
-	  This selects the base ISA extensions that Xen will target.
-
-config RISCV_ISA_RV64G
-	bool "RV64G"
-	help
-	  Use the RV64I base ISA, plus
-	  "M" for multiply/divide,
-	  "A" for atomic instructions,
-	  “F”/"D" for  {single/double}-precision floating-point instructions,
-	  "Zicsr" for control and status register access,
-	  "Zifencei" for instruction-fetch fence.
-
-endchoice
-
 config RISCV_ISA_C
 	bool "Compressed extension"
 	default y
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 17827c302c..3034da76cb 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -6,10 +6,12 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
 riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 
-riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
-riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_64) := rv64
+riscv-march-y += ima
+riscv-march-$(CONFIG_RISCV_ISA_C) += c
+riscv-march-y += _zicsr_zifencei
 
-riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
+riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
 
 # check-extension: Check whether extenstion is supported by a compiler and
 #                  an assembler.
-- 
2.48.1


