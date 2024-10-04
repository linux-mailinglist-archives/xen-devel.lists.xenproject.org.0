Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7647B990873
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 18:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810518.1223232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknR-0006N8-KN; Fri, 04 Oct 2024 16:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810518.1223232; Fri, 04 Oct 2024 16:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknR-0006Kh-HA; Fri, 04 Oct 2024 16:04:49 +0000
Received: by outflank-mailman (input) for mailman id 810518;
 Fri, 04 Oct 2024 16:04:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgwL=RA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1swknP-0005bC-5M
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 16:04:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fadd88b-826a-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 18:04:45 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so295947466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 09:04:45 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5c3c8fsm10040166b.3.2024.10.04.09.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 09:04:44 -0700 (PDT)
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
X-Inumbo-ID: 5fadd88b-826a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728057885; x=1728662685; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqQSvaZsrgtTFm5v43v0hmc6KczEuWu7/bK2WOCfUo0=;
        b=I1uqN0+7U4XRv1FuZUTa8iRzSNzApVwLxkR4TxzlGURKR0FDc5hm3D2I7bQKmOD4Qv
         4KGq9ZO7SNA9V6tEJkZQ1l9MGp+fmi7dHXYN1xdAR08/dOpHbmUyXpVQzVKrwKVTiQiP
         URDKq9Yg5EisbdYO5gH2mGg3Xk36Yn+mqTHJpWJ1zf1Cw/a0czCWJ+Fq7vz27sLa0U1p
         cb+WHBNp5D3SrjHRdaEEGIq+nftFSqvkmk9N77RIzh/0e3T1wHTSvwwOxWXw0avBr25B
         nDHI5YzO+Gc8qISmta0GA3BObUVN5gYJhS7aVK8Rvpf0DQ5/o6ughM3xkrpu+2NErz+D
         b0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728057885; x=1728662685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqQSvaZsrgtTFm5v43v0hmc6KczEuWu7/bK2WOCfUo0=;
        b=lig567CISkjJunnuke3GtGFctGKwh4XmAuJEK/Yh7R1CNS0uF+o+3s+B7oXE8SshK8
         GnkIt9foHRR+Nkb/l8uq5KrLJc6AvVuwZpUXgHcS+1zX6PWfzKHyu83hAkcKJiOewm7P
         kVg1WY6PjoWGj1pS2Vsc6EpAPsfMYpkeoWYFrxq3ZAsUsV9oL855bDcWSRoJMXLlaPaI
         b+OnF9YBAzwYJE5LTGPa4Ng6F3P3bySXzohM+QDlNRG77lhDRkr6tJ0FpMDm4fQh3R36
         OB5dhDm4GMfFcsm+3yBFCxa8SwD976OC5Y3FLM6cu3d0pCwX1Bx7qV8RWgh2mXtWzFEH
         iHRg==
X-Gm-Message-State: AOJu0YwUofxRSPhO59cgIpZVSGxyw4dlZ0OXAuOPgyzLO9drIU7wYDlh
	46Oew8WfOYJOvmk0iIIn0bGe17Kwa03qbaNZqVLsUBV5sRf0BDNUD2mF3w==
X-Google-Smtp-Source: AGHT+IHefne6h1GsX+idSo9x5A6CdmGL7HYn68bBluDq/B1wb/yLqFOA130XumpBdREIy8OrwPvoXg==
X-Received: by 2002:a17:907:6d1b:b0:a90:34bf:844 with SMTP id a640c23a62f3a-a991c00f5e6mr321805766b.59.1728057884661;
        Fri, 04 Oct 2024 09:04:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] xen/riscv: register Xen's load address as a boot module
Date: Fri,  4 Oct 2024 18:04:37 +0200
Message-ID: <1850d637a9588a1b00bf07cf0e443486f3895938.1728057657.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728057657.git.oleksii.kurochko@gmail.com>
References: <cover.1728057657.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid using BOOTMOD_XEN region for other purposes or boot modules
which could result in memory corruption or undefined behaviour.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Drop local variable xen_bootmodule as it won't be used after initialization.
 - Drop unnecessary cast for the 3rd argument of add_boot_module() call in
   start_xen().
 - Change BUG_ON(!xen_bootmodule) to panic().
---
 xen/arch/riscv/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 6d156c3a40..f531ca38ee 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/bug.h>
+#include <xen/bootfdt.h>
 #include <xen/compile.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
@@ -44,6 +45,11 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
               "Please check your bootloader.\n",
               dtb_addr, BOOT_FDT_VIRT_SIZE);
 
+    /* Register Xen's load address as a boot module. */
+    if ( !add_boot_module(BOOTMOD_XEN, virt_to_maddr(_start),
+                          _end - _start, false) )
+        panic("Failed to add BOOTMOD_XEN\n");
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.2


