Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58AAD002F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008361.1387658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU3D-0005n5-T4; Fri, 06 Jun 2025 10:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008361.1387658; Fri, 06 Jun 2025 10:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU3D-0005iC-PZ; Fri, 06 Jun 2025 10:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1008361;
 Fri, 06 Jun 2025 10:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdQj=YV=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uNU3B-0005Rs-KU
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:11:49 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7f2526a-42be-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 12:11:47 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-32ac52f78c1so20381081fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 03:11:47 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677389d5sm143592e87.259.2025.06.06.03.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 03:11:46 -0700 (PDT)
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
X-Inumbo-ID: a7f2526a-42be-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749204707; x=1749809507; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hPQ4VxBdVLnFqUBMXQnHxRKZBnEmnRXk//zaua6W64=;
        b=G2rmIWx4KAYDgvDdM626qRTYuIsOZJIiY9y6odYDCBRI1emvvtPv49LxKuanablqjk
         wYjbIAvigMtjNheuq2KMbhFfiDWfsR49Z4HB+i2LzBCtIC4pW5dog+mu08gKax8zsEoX
         ReYz1PwqZ2sW3Y3XGokyjMCAOFV6iqPmee5ZINIGgIf0mE2/uIz4081aaLjiJ/3lcpw0
         xr94sbtGUKyQbf6OYZhRulBOQ9Y606W6u8VR392ZMxFEGednYSUzJVtwI0W8TAbYMkNX
         lWl4nmMcENvUu1n4Yf9ssbKV7Tt7moFYigFEWvVpgsLInw1Ivst1RrMUPSNUXD9I3Oq+
         CHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204707; x=1749809507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hPQ4VxBdVLnFqUBMXQnHxRKZBnEmnRXk//zaua6W64=;
        b=JvXBGoCtamkGRMmiCAVE3TSFOAZd3i+PQLkf7NBBAG8imFgl4GdYIgZg9u8aVmRmy6
         woTjsqIRv4MWLmJ//3GpFQsp3J1sVDzAYc1nWC2VSO/WTjS+m+m4TGRPhx/gS264aHOy
         hclN/HDO8awPTs8cGlqvoiybc+bH9BGa/S9xAo8rkdfA8LANY5TCa2L0rUNaXNi723Zx
         T6HtbiUz0vhPDTNl1bPlVe9EaWBS0d8LJAWdZKTxZDodiX8QSSs3wiZjJMDdAWWUAio0
         hSxpFKdgBVbJSGzfzbbXgHfu3x5+LAC5OXgF4YCe7nlHAVUk+9wZs5q0f5NipxeeVt95
         JjIA==
X-Gm-Message-State: AOJu0YxtIzpxspIT4cPdROwMd7K8g0MtUjSj1hNa5D6NAZFfCPJw6jMp
	dEstY2xhGeBTkHxE6YF3LX3zeKChK76PpDz6QgkblWTopvVbGQ8lp6qy33bndNMF
X-Gm-Gg: ASbGnctR/7dIh3dQRnjUvlpXjMa7KbCBp1GAxdn3nc3GVQVN5cvt3odw7g1yCYD39r1
	ZYiB4DccrLy8uLlSWdyRBrmAVucqGHgBqad2NihducWgUiJrtYHs0FrOLQIwqf1eh3RMyNPDi1G
	iBPcOLduQihqyQpHPA1meX/djqcYJtVk6aqZWXF0y6T4a5MXJz9J0wOuZ2LGZoGxwxuhsafcNbj
	Wm2fIMgExwPQJI468eI9JkIzzG33qkKYRjYB+3tawoY/pOZkHNzONa6f7G3HrfwuiWw3ZjnAsQ5
	Olm77dw5y8O+7npg0Xzc4xZ1UrHLV1gfcQ/sxyjH2b8fVXLKQk4kQXFJWkYwq+WNvIMs+rryL0g
	/yiZJmlViA0Saund+UNvPrW/ENg==
X-Google-Smtp-Source: AGHT+IHcPVMXpXDFxKZ1ggDEsOO/oqjCw4oEwbGk6ItH8L5RwFF1woqnv9iCGDdBGtqaQdLse2gqFg==
X-Received: by 2002:a05:6512:ba7:b0:553:27cb:b84e with SMTP id 2adb3069b0e04-55366c2ff7amr779327e87.41.1749204706738;
        Fri, 06 Jun 2025 03:11:46 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykyta Poturai <mykyta_poturai@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v3 1/2] xen: Introduce system suspend config option
Date: Fri,  6 Jun 2025 13:11:41 +0300
Message-ID: <412d2b68741182fe0528cb85c0af2a29a2ebec3a.1749204282.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1749204282.git.mykola_kvach@epam.com>
References: <cover.1749204282.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykyta Poturai <mykyta_poturai@epam.com>

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
Changes introduced in v3:
- select HAS_SYSTEM_SUSPEND from SYSTEM_SUSPEND_ALWAYS_ON
- drop selecting HAS_SYSTEM_SUSPEND from X86
- simplify default setting in SYSTEM_SUSPEND
- hide prompt of SYSTEM_SUSPEND when SYSTEM_SUSPEND_ALWAYS_ON is enabled
- move HAS_SYSTEM_SUSPEND alongside other HAS_* configs

Discussion on adding the SYSTEM_SUSPEND config can be found here:
https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg00169.html
---
 xen/arch/x86/Kconfig |  1 +
 xen/common/Kconfig   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7afe879710..752d5141bb 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -33,6 +33,7 @@ config X86
 	select HAS_VMAP
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
+	select SYSTEM_SUSPEND_ALWAYS_ON
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index eece1370a3..867710134a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -122,6 +122,9 @@ config HAS_SCHED_GRANULARITY
 config HAS_STACK_PROTECTOR
 	bool
 
+config HAS_SYSTEM_SUSPEND
+	bool
+
 config HAS_UBSAN
 	bool
 
@@ -593,4 +596,19 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+config SYSTEM_SUSPEND_ALWAYS_ON
+	bool
+	select HAS_SYSTEM_SUSPEND
+
+config SYSTEM_SUSPEND
+	bool "System suspend support" if !SYSTEM_SUSPEND_ALWAYS_ON
+	depends on HAS_SYSTEM_SUSPEND
+	default SYSTEM_SUSPEND_ALWAYS_ON
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


