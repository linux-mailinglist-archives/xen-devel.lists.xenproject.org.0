Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC596E598
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 00:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791412.1201270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeL-000189-GZ; Thu, 05 Sep 2024 22:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791412.1201270; Thu, 05 Sep 2024 22:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeL-00015w-Bd; Thu, 05 Sep 2024 22:08:21 +0000
Received: by outflank-mailman (input) for mailman id 791412;
 Thu, 05 Sep 2024 22:08:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smKeK-0000fY-7d
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 22:08:20 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bb43f38-6bd3-11ef-a0b3-8be0dac302b0;
 Fri, 06 Sep 2024 00:08:19 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so183368466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 15:08:19 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d020sm187525166b.127.2024.09.05.15.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:08:17 -0700 (PDT)
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
X-Inumbo-ID: 5bb43f38-6bd3-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725574098; x=1726178898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+OQc0atbyoTq9OoM9RHvS+NplIzx6wUPK2piuypKDw=;
        b=ZD8NigYG6MHT+P+lXgbSK/rHZYp6pTMYY5nZIMli3O43Gk6n+q/J3kUrHIdAV7wr+j
         E2QIQX29CvoFRiF+wJUPi4CDPKnxI95d0OeTqFFXofo2o/Nzm+Lf+SZWuatbCG0xRiNb
         wncaXdL3E7clRiGCTaBomZDdT6PxxFFDqCaR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725574098; x=1726178898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+OQc0atbyoTq9OoM9RHvS+NplIzx6wUPK2piuypKDw=;
        b=Ai8lAi7C1EE6X3W2Cz03bGSAnyhV5OC4Pxw7ACY+VDweOaejeeMHqK0ULzWUMjJW7a
         r0JBW7D4bsUt9Z5FahOuTLYvETBpJTO091DtBDI5q7rjyOTipRMPAux41Vdll9h4l6Sr
         usgynQNCFbEVzHOLpRLKQAbu+NuPVvsDxFaIsmd4wsnG5k3+c/OOrJGfoAQn0lESdMaX
         1MIWiMVKvchwKVU5ua4LkQYXyUfapHSWmGeCLs8UY5ca+KQFg/QgG5RkwPZUN8s61mJN
         qjixjC/0oFQB1EV3xPE97sQM2VzSCMhIWc3w3lxDCjYAtnhTa30+VrfBvcLn/Sy9/f4p
         6Phw==
X-Gm-Message-State: AOJu0YxLmlhG+T6dP00uhnSGrVSvv7FVHrkUuLr6Nxn/1KAmWHScQA3w
	4A/gZbhMJnFcjT/DZCm9jM1kxQsyUK7bpDhekx5n/1EYiZ1Doi06WLggQsQj8Uy92sHcSz9KV5b
	d
X-Google-Smtp-Source: AGHT+IGgPq6dEZPy5CtqDYGLKFSqBkWkIUQfcNpz5A+6oQVKXCctHQSJ3uEBp72hMqvPxEToDH/42w==
X-Received: by 2002:a17:907:1c1b:b0:a7a:af5d:f312 with SMTP id a640c23a62f3a-a8a887e60c8mr32081466b.46.1725574098288;
        Thu, 05 Sep 2024 15:08:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 3/5] x86/build: Swap cache.h includes for xen/sections.h
Date: Thu,  5 Sep 2024 23:08:04 +0100
Message-Id: <20240905220806.141300-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905220806.141300-1-andrew.cooper3@citrix.com>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These include {xen/asm}/cache.h but only want xen/sections.h.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/x86/acpi/cpu_idle.c    | 3 ++-
 xen/arch/x86/cpu-policy.c       | 2 +-
 xen/arch/x86/guest/hypervisor.c | 2 +-
 xen/common/efi/runtime.c        | 3 ++-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index f175e4d7d370..876317fad059 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -40,7 +40,8 @@
 #include <xen/param.h>
 #include <xen/trace.h>
 #include <xen/irq.h>
-#include <asm/cache.h>
+#include <xen/sections.h>
+
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/hpet.h>
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 888e7ac4d4dc..2524c1c7a60d 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#include <xen/cache.h>
 #include <xen/kernel.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+#include <xen/sections.h>
 
 #include <xen/lib/x86/cpu-policy.h>
 
diff --git a/xen/arch/x86/guest/hypervisor.c b/xen/arch/x86/guest/hypervisor.c
index ac80e8324599..7afc5038b4e4 100644
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -8,9 +8,9 @@
  */
 #include <xen/cpumask.h>
 #include <xen/init.h>
+#include <xen/sections.h>
 #include <xen/types.h>
 
-#include <asm/cache.h>
 #include <asm/guest.h>
 
 static struct hypervisor_ops __ro_after_init ops;
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d952c3ba785e..d03e5c90ce9f 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -1,9 +1,10 @@
 #include "efi.h"
 #include "runtime.h"
-#include <xen/cache.h>
+
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/irq.h>
+#include <xen/sections.h>
 #include <xen/time.h>
 
 DEFINE_XEN_GUEST_HANDLE(CHAR16);
-- 
2.39.2


