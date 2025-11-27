Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE6C8F813
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174223.1499194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOepD-0007wt-3v; Thu, 27 Nov 2025 16:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174223.1499194; Thu, 27 Nov 2025 16:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOepD-0007u6-0Q; Thu, 27 Nov 2025 16:26:31 +0000
Received: by outflank-mailman (input) for mailman id 1174223;
 Thu, 27 Nov 2025 16:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOepB-0007Yx-Mm
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 16:26:29 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3b73e3a-cbad-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 17:26:29 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b713c7096f9so163529866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 08:26:29 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59e8936sm195126666b.48.2025.11.27.08.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 08:26:27 -0800 (PST)
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
X-Inumbo-ID: d3b73e3a-cbad-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260788; x=1764865588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDTI5SjlxWLK35k4ON2EstoAV+lLSlfaDyeVS41KSEE=;
        b=HX+a6eLVHTbqEJ6PzchhPi6F489QE8CujB0d/8/bBdHRDW6Q6TP7bVJ2A+RwgOG3Uf
         f+R7Ynvy8yd4Yxg9DYDkvgGioXChI5ywjECMffKF3vocuwcQ+ntLeWiLHKQHlBDILD7t
         EVrZjHgjna1eyGiOEjnySHOePkb4lVKzOcJgDTyUj3sWLIeEn9/KHAyeU9Nyn88GYR6H
         Xzd2+OY6Of0uy9Q9wqBDdhK4jHcAxwRKBKGE1dBfjGVdeoDg9UxE3Wb+K/86/HN9dbyu
         LEAkom0CF13mNWm7RqvXHw5T2H/1JdCuedbUrs2U2YtY5gSZljY3aI5o0RddQ4mEjH7G
         gZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260788; x=1764865588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDTI5SjlxWLK35k4ON2EstoAV+lLSlfaDyeVS41KSEE=;
        b=NpV2WdpIS6Xbwr5kKnnxRnznOyQIGGW1MsWJeqWj4OAj9pRwz05o4+uAPtSchCWmtF
         LZq13IpERHKOBcHIGKpfElMQ1vav9QAxpS7xO+XT2GaGvCDSkBShpSTPHLxoTCi49yST
         C+dgZEb3FnSQeXbwTl9pZ1ZtP/B8psRVS+UFvxybWiWT8xqdWqLf4SKvNfVfoEtlKOma
         hOFGvQi/yBXKJWazthopcX7Ecmco0orvl5+94DRRoCIR0A9TO1ZPiI0NZXKlB7kdBKF4
         22NDmmFhvw46bWkEfanDatelWSRBjDhVPitjWLSZScJ3KBZX8zfv/9/H5LOv6q1+xHDr
         QsKQ==
X-Gm-Message-State: AOJu0YxPhDIxu+B+FDQZUQulmtADE17ZtGAQ/B9aEAVl7Zp8yIp2s7fQ
	XbkXW3IpYk6b4V3tXfeyj5XVZnOd8OR6jVPYPwY72G/0nzK6HmW5OJ5BKJ6pJCA5
X-Gm-Gg: ASbGnctrywV3iNzpIV1GC0DrMRt90RYNh6Esast5AgWEI9cC0rxXMUr5Ua3Axc8Az14
	kuDUrGopBrWWAA+c/y8UlDYXt07DQhv1yeS3N/9Ie37WYPyujTgHAMvWHj4QjNBzPWL35qmYtS6
	4ieGFNerg6DRI4Tu3CjzYAHKRUWF/AvncMKKG3LvuOPW7eQwJVNbk2UPZH3j1CPBWJOEoiQ8a4l
	n/aLMDk0Ex5rM+fj0HKkddHOEHQEEEufMH0wUrFYbXWFtnWGVM14Q1+zyZAh0km2myqoZGZ1iqI
	hEIPG9mx0lXQG0f/c4DT/RLt1pZWqov8QpsLVXkmLmrE6tEM8xdMS1ngmj7mtzwG5swCx4oE7Wi
	AHlZxDD/PWO5ulkGuvNaw4DSYdFicYOpLDr2XqZRpaQjg9HtcmK1GtyHDFQJXzmTxU+vj1II/C6
	84Or57ssHNxo1GU4Je1Z+WT2qgsKxpCsQo5HVWJuXscTOt6JxxXZv+ZqQ=
X-Google-Smtp-Source: AGHT+IHHNpjHScXYYQDy405I4Mb3pQo0I2miUu/PU0mTesLy/0CzocXa3t7WQC+stMJPxe8T6c8Y+Q==
X-Received: by 2002:a17:907:f495:b0:b6d:6d66:e8e9 with SMTP id a640c23a62f3a-b7671a494d7mr2307636566b.61.1764260788178;
        Thu, 27 Nov 2025 08:26:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] xen/dom0less: move make_chosen_node() to common code
Date: Thu, 27 Nov 2025 17:26:15 +0100
Message-ID: <84178652f3cd60303ac1e81f36f852bc685e0ba4.1764260246.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764260246.git.oleksii.kurochko@gmail.com>
References: <cover.1764260246.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of make_chosen_node() does not contain any
architecture-specific logic. Therefore, move it from arch-specific
files to common code.

At this stage, there is no need to introduce an arch_make_chosen_node(),
as no architecture-specific customization is required.

This change avoids duplication and simplifies future maintenance for
architectures like RISC-V and ARM.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Rebase the patch on top of current staging:
   s/struct bootmodule/struct boot_module
   s/kinfo->cmdline/kinfo->bd.cmdline
   s/kinfo->initrd_bootmodule/kinfo->bd.initrd
 - Update the comment above make_chosen_node:
   ... on ACPI systems (on platform where CONFIG_ACPI=y) ...
 - Move make_chosen_node() to common/domain-build.c as it could be used
   not only for dom0less.
 - Based on the previous review it should be added:
     Reviewed-by: Michal Orzel <michal.orzel@amd.com
   but I decided not to add it as I've changed a place where make_chosen_node()
   leaves.
 - Link to v1:
   https://lore.kernel.org/xen-devel/9c87738225d48bd1ee9bba6e8d4e018dfecabccd.1747145897.git.oleksii.kurochko@gmail.com/
---
 xen/arch/arm/domain_build.c           | 46 ---------------------------
 xen/common/device-tree/domain-build.c | 46 +++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb8fbb1650..6d1c9583b1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1510,52 +1510,6 @@ int __init make_timer_node(const struct kernel_info *kinfo)
     return res;
 }
 
-/*
- * This function is used as part of the device tree generation for Dom0
- * on ACPI systems, and DomUs started directly from Xen based on device
- * tree information.
- */
-int __init make_chosen_node(const struct kernel_info *kinfo)
-{
-    int res;
-    const char *bootargs = NULL;
-    const struct boot_module *initrd = kinfo->bd.initrd;
-    void *fdt = kinfo->fdt;
-
-    dt_dprintk("Create chosen node\n");
-    res = fdt_begin_node(fdt, "chosen");
-    if ( res )
-        return res;
-
-    if ( kinfo->bd.cmdline && kinfo->bd.cmdline[0] )
-    {
-        bootargs = &kinfo->bd.cmdline[0];
-        res = fdt_property(fdt, "bootargs", bootargs, strlen(bootargs) + 1);
-        if ( res )
-           return res;
-    }
-
-    /*
-     * If the bootloader provides an initrd, we must create a placeholder
-     * for the initrd properties. The values will be replaced later.
-     */
-    if ( initrd && initrd->size )
-    {
-        u64 a = 0;
-        res = fdt_property(kinfo->fdt, "linux,initrd-start", &a, sizeof(a));
-        if ( res )
-            return res;
-
-        res = fdt_property(kinfo->fdt, "linux,initrd-end", &a, sizeof(a));
-        if ( res )
-            return res;
-    }
-
-    res = fdt_end_node(fdt);
-
-    return res;
-}
-
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 95b383e00f..774790aab3 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -405,6 +405,52 @@ void __init initrd_load(struct kernel_info *kinfo,
     iounmap(initrd);
 }
 
+/*
+ * This function is used as part of the device tree generation for Dom0
+ * on ACPI systems (on platform where CONFIG_ACPI=y), and DomUs started
+ * directly from Xen based on device tree information.
+ */
+int __init make_chosen_node(const struct kernel_info *kinfo)
+{
+    int res;
+    const char *bootargs = NULL;
+    const struct boot_module *initrd = kinfo->bd.initrd;
+    void *fdt = kinfo->fdt;
+
+    dt_dprintk("Create chosen node\n");
+    res = fdt_begin_node(fdt, "chosen");
+    if ( res )
+        return res;
+
+    if ( kinfo->bd.cmdline && kinfo->bd.cmdline[0] )
+    {
+        bootargs = &kinfo->bd.cmdline[0];
+        res = fdt_property(fdt, "bootargs", bootargs, strlen(bootargs) + 1);
+        if ( res )
+           return res;
+    }
+
+    /*
+     * If the bootloader provides an initrd, we must create a placeholder
+     * for the initrd properties. The values will be replaced later.
+     */
+    if ( initrd && initrd->size )
+    {
+        u64 a = 0;
+        res = fdt_property(kinfo->fdt, "linux,initrd-start", &a, sizeof(a));
+        if ( res )
+            return res;
+
+        res = fdt_property(kinfo->fdt, "linux,initrd-end", &a, sizeof(a));
+        if ( res )
+            return res;
+    }
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.52.0


