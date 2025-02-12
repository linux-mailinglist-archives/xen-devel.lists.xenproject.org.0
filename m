Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9CA32C5D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 17:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886609.1296260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwD-0007ul-6l; Wed, 12 Feb 2025 16:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886609.1296260; Wed, 12 Feb 2025 16:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwD-0007tC-3L; Wed, 12 Feb 2025 16:50:13 +0000
Received: by outflank-mailman (input) for mailman id 886609;
 Wed, 12 Feb 2025 16:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiFwC-0007h7-8Y
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 16:50:12 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6be0697a-e961-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 17:50:10 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30795988ebeso70928981fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 08:50:10 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308fcd86801sm6225931fa.40.2025.02.12.08.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 08:50:09 -0800 (PST)
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
X-Inumbo-ID: 6be0697a-e961-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739379010; x=1739983810; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSAjPzn8vd1YdEy9+KcpXcYuBrYLFaD76aBfISfpcj0=;
        b=ZTuV/mH3XeyMuh/9wjHos03imElIJPjZ+k/ib3iZRPHlxBXaIh2gCryp4hIxv2SYda
         Um5LlKreAqLVRsp0181u1tP3LzfRa7+SH50ba1kPLVdy3uDSxBBibQMTi1GwXnKMNYXr
         nCG4WP7q1Sg+mpX49p8hCjxt3NF7CPYAAOJm1W4xH4v6v5OvfBstfOFD+W093A5KyAIY
         GM3/GKHKzjeq7nbS6ci7oQEeOeYEHsjTYbOoUO0/ib0q4/BGcOnamR+idOozVaNDGsiD
         TIUZTD0XNpIUmPRbkRLVtH7iyqDvtzn7gj+t8TPDLy2jrfIsgmfkyqiDEIRmmOiM03Jf
         8OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379010; x=1739983810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSAjPzn8vd1YdEy9+KcpXcYuBrYLFaD76aBfISfpcj0=;
        b=RDgH2704HW0bu/l2JL/xkPs63r2kBIQOhiS1TbkOAqp8cXek/rwMB2te5FaLnLTGuW
         qRVvDC1QqRP73Lykf8H+5CS+prBnQ0lcujr6aI88kqmMAN7c9QDxre/tXCo79eXCn5P/
         qCC86MhvwdahQjJncpQogOaWEum/jDsW1xNEqUF8qFgkuF/Nnmjxx0Elidecex2Wb4Sd
         2/aKT5iUIfuv7DKdPedJj/cdHfgpV79sCejSgj4nkqxgQIIGjqbJaiDXG6gPsl6CqhBy
         DCHooR211Hf927q1vKYZxHa1FTVuCIKHNo7V61UKIoJJKuN++4GxCuBTiseARUszJJkH
         5QmQ==
X-Gm-Message-State: AOJu0Yy4bu84wvZRu0Fe7Y9HbVDrRBuD1Whh0FX5Ldvz0593bkIcDuZa
	6D08LQkGD8kwwpOLsWbJyvGqfnhrcytoji02QFD8rwZ0s3ukYnknPvvMfg==
X-Gm-Gg: ASbGnctsh1FPfw+UDVxA8uaX8PvPkoFJ3udv3mGcG1CAzpadc1ft1eaKm7cCco1KV5g
	Lcp9C5DOqjgYmxfXfopbT021I9fU+Rz4PKSSR5aR6Yj9FT/99sNf+AbcHAgKUatW019VZlOnjQ7
	VT4eU6LbHzddhy7Ydo0ytG74GdcjOerFeCOr56rkyA0rVYTHTlVpkHhNpC5PRIZnkAOu9OeSMZl
	rWQ1qxeKBPFU1Zs5R9KXIc1M+1icqlU6arOL5OTQsjyl/ZKj1y72wBpRrdjNg6WPBs9KOqUbnJi
	PEitrREjs1o8GI+M
X-Google-Smtp-Source: AGHT+IGvCGid0J9R02dA8IHUzFMDDDUVjzNm6VR1Y99lq9QSRFE7E13hQ2oDaBJnPWs60in2eOTTTg==
X-Received: by 2002:a2e:9a04:0:b0:302:1b18:2bfe with SMTP id 38308e7fff4ca-3090ddc035emr856371fa.25.1739379009410;
        Wed, 12 Feb 2025 08:50:09 -0800 (PST)
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
Subject: [PATCH for 4.21 v6 1/2] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
Date: Wed, 12 Feb 2025 17:50:02 +0100
Message-ID: <82c9611b923170b0525a7b76337ef067e359dc96.1739355004.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739355004.git.oleksii.kurochko@gmail.com>
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'G' stands for "imafd_zicsr_zifencei".

Extensions 'f' and 'd' aren't really needed for Xen, and allowing floating
point registers to be used can lead to crashes.

Extensions 'i', 'm', 'a', 'zicsr', and 'zifencei' are necessary for the
operation of Xen, which is why they are used explicitly (unconditionally)
in -march.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v6:
 - new patch for the patch series.
---
 xen/arch/riscv/Kconfig | 10 ----------
 xen/arch/riscv/arch.mk |  9 +++++++--
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 00f329054c..5b72937139 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -28,16 +28,6 @@ choice
 	help
 	  This selects the base ISA extensions that Xen will target.
 
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
 endchoice
 
 config RISCV_ISA_C
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 17827c302c..1819ec17eb 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -6,8 +6,13 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
 riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 
-riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
-riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_64) := rv64
+
+riscv-march-y := $(riscv-march-y)ima
+
+riscv-march-$(CONFIG_RISCV_ISA_C) := $(riscv-march-y)c
+
+riscv-march-y := $(riscv-march-y)_zicsr_zifencei
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
 
-- 
2.48.1


