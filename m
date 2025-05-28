Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C722BAC63A8
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 10:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998971.1379645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKBnX-0003Eh-AH; Wed, 28 May 2025 08:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998971.1379645; Wed, 28 May 2025 08:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKBnX-0003Cp-6Q; Wed, 28 May 2025 08:06:03 +0000
Received: by outflank-mailman (input) for mailman id 998971;
 Wed, 28 May 2025 08:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ct5H=YM=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uKBnV-0002zC-NW
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 08:06:01 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 981d18a0-3b9a-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 10:06:01 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55324e35f49so3038485e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 01:06:01 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a79f5478asm1437671fa.78.2025.05.28.01.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 01:05:58 -0700 (PDT)
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
X-Inumbo-ID: 981d18a0-3b9a-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748419560; x=1749024360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWHKDiY0thxryffwYCZVKNiFBLA5cr2n5GezmHVCMtI=;
        b=Rclji4/C+2uqJ/fusqYMZk9ouBX+bg+tNoTI6XS+4KHW45d4Se5q7HldrzNztUoUp0
         rbxgFw/MuunS3+LJdHpUNH8RqIyOqLjw0kdGzjzY2Os4WW6l+LMYxlm1pMaRObadu0EO
         lYqg3o+7JJvu2tRHPSbEvLtA8jkCphiEP1Q568squberN754C9WViIbF42BH7SsbblHQ
         nytKffHcXjUgIxY93Ayalpa2yC/rK2DE/R1MWWa0ZatXm7qzguF0ePFE2/hoPV3WQRUz
         3ucWYOf0q5e+anBVXfmRJMrZWiBRNOakmu2KB/2kMDWrPt4AeNyMjqOS7Rng4EK8ZQ73
         v3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419560; x=1749024360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWHKDiY0thxryffwYCZVKNiFBLA5cr2n5GezmHVCMtI=;
        b=gnHSPs1ZudQmG662oCjQNVcNDK+KGnWz8MTOGBxhJT7fqRRxjqJ9bHw8wGpDCCCA5M
         19A6sigk5472ZFwcEU3m9/dzthf+3WpnW/4Jkq+eJkFZsAzapM6fYaQzKkWCWkfGeHAr
         uKl/VL6ieH+YyPfH+g9MxSXmUAbQo4I2Y+BC2llhDiYOQYEjbpUr8ImH7GQ4tF1N0D+T
         mrk3mCYxvaQZIxBYjTfCtjUYGrhqB0VjjYDKRMNZzezw4kvrTWX0u/0OrHE4AWm6O0aA
         Fn+2sj4Jwm/zJJ0NieP/Fom17Mo/itn6gAF1ZlR/Dcn/FdcWD1z3SILWpJ5kFHaYi+Sv
         jQmA==
X-Gm-Message-State: AOJu0Yzu8wd/NIoHCx+p08RJ6JIh8x/yoZhh9QDSHpYA2rt0X2OXg/DM
	sGYNp5JWyZrg1oRAdhrfqcUrw7QMoqjs3RT4h8eQR/kgMVHV+OaXJ6gp0eMyug==
X-Gm-Gg: ASbGncs/YcuQzLEBSYxnhx/XgJwoKqiWV1FLYXUNIYv8xwUiuwNTugl6+KzuJ0sJcll
	g4M+np3MFST6Qu8HO7m7KvWokZq719HiRMu5WP+qtoLp7YF26YS27IFLuAJZoW7DSLbGXw8yvyY
	PeDhwQgUWLr6D9HyopR5mcYFWaALr9vKzqX/vVHpZJP1fRFOAN/Ai2OzmFu5qpv55v5mtMXvaWx
	mnDqo4KOhUAhiFBZu4BcJDxdXJcFJ1AIjf+fGEyNB+wil5MR0YrUCkiBxPPkpMymu8XnyABsYly
	cvSHspA7oxA62zbVmqTLS+DXgZFxnjFAqt7lmy3CRlKoLnufEF/eJ1vxztFDwaP4EN0fm53YUXh
	q/KM609U52LYDo+s=
X-Google-Smtp-Source: AGHT+IG46T1yCCola3jKBu0pKLJ9cYvzD+gAljJzZ9ZT8ZgrW91kJLWoq9Jcu3TK0gWyfe9oQp50dg==
X-Received: by 2002:a2e:ae0c:0:b0:30b:b908:ce06 with SMTP id 38308e7fff4ca-32a79accc61mr2898571fa.19.1748419559953;
        Wed, 28 May 2025 01:05:59 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v2 1/2] xen: Introduce system suspend config option
Date: Wed, 28 May 2025 11:05:18 +0300
Message-ID: <eb586049ef5180bb33e9414c4754ee2621a772bc.1748381788.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748381788.git.mykola_kvach@epam.com>
References: <cover.1748381788.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This option enables the system suspend support. This is the mechanism that
allows the system to be suspended to RAM and later resumed.

The patch introduces three options:
- HAS_SYSTEM_SUSPEND: indicates suspend support is available on the platform.
- SYSTEM_SUSPEND_ALWAYS_ON: used for architectures where suspend must always
  be enabled.
- SYSTEM_SUSPEND: user-facing option to enable/disable suspend if supported.
  Defaults to enabled if SYSTEM_SUSPEND_ALWAYS_ON is set and depends on
  HAS_SYSTEM_SUSPEND.

On x86, both HAS_SYSTEM_SUSPEND and SYSTEM_SUSPEND_ALWAYS_ON are selected by
default, making suspend support always enabled. The options are designed to
be easily extensible to other architectures (e.g., PPC, RISC-V) as future
support is added.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Discussion on adding the SYSTEM_SUSPEND config can be found here:
https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg00169.html
---
 xen/arch/x86/Kconfig |  2 ++
 xen/common/Kconfig   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7afe879710..f7c026b0aa 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -33,6 +33,8 @@ config X86
 	select HAS_VMAP
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
+	select HAS_SYSTEM_SUSPEND
+	select SYSTEM_SUSPEND_ALWAYS_ON
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3d66d09397..3886a77e46 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -579,4 +579,21 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+config HAS_SYSTEM_SUSPEND
+	bool
+
+config SYSTEM_SUSPEND_ALWAYS_ON
+	bool
+
+config SYSTEM_SUSPEND
+	bool "System suspend support"
+	depends on HAS_SYSTEM_SUSPEND
+	default y if SYSTEM_SUSPEND_ALWAYS_ON
+	help
+	  This option enables the system suspend support. This is the
+	  mechanism that allows the system to be suspended to RAM and
+	  later resumed.
+
+	  If unsure, say N.
+
 endmenu
-- 
2.48.1


