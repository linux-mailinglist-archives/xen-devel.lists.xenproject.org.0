Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3EAB5726
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982931.1369311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdV-0004Dl-Av; Tue, 13 May 2025 14:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982931.1369311; Tue, 13 May 2025 14:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdV-00049H-3h; Tue, 13 May 2025 14:29:37 +0000
Received: by outflank-mailman (input) for mailman id 982931;
 Tue, 13 May 2025 14:29:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sqXq=X5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uEqdT-0003s1-9o
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:29:35 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0f338a9-3006-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:29:34 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5f624291db6so9681958a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:29:34 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197ca2b4sm778952466b.160.2025.05.13.07.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:29:32 -0700 (PDT)
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
X-Inumbo-ID: b0f338a9-3006-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146574; x=1747751374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mmaIut+bB6JzVtawKv0l2+/AbruT3la6NzpbEBxjqw=;
        b=LoSvhdw5nehZHzk/8Jbvg+yaSZYHJ5puIV0R+IWzpC4UF1ASRTYcLvsbR+We6J8Yew
         kRxEgt1UFlnbJKCfHnJnmqLralp1dlcyRiKpNnZlhOBMz/nUM1+uV22gFZjrh7ZNk74e
         Oh5bCZ3Y18YFnC+3zS/ElUnPBgwZggwrkZMPcNX9qsZm5XDCfKW0EcXVDZzJXKlObXYT
         /Bg0cxbBv9tbK4nzqJrNzZoVxdlWKk2zWaI5PpRTwVAXxFBNfNOeXAo/29uuZq3Puxqe
         xrU9vyu71oYAMkWvHKXXdEtudGl4uChDxOQ+BM+H7EWOlsvt5cfG6XnhlVrJZn5lIYjq
         S5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146574; x=1747751374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mmaIut+bB6JzVtawKv0l2+/AbruT3la6NzpbEBxjqw=;
        b=Myx4AHioa1TR2F9vFuDgwnjAAnTcnPtPDUErRnZsBNnajLh4fHwSf7JFeABTfOp/DY
         gT2WD0G512lEE+Tbt5DdPKAcw+NKATfmWejgdS2KZQNJiPB9wI4zc6UTCnOH0aIPZLm0
         sj+HN0GQV6TUCq8iOt26MDLOUlEGUyqEyZGWCKYjNnrZzHSOD0wsc5oxe08dPnKxvtvG
         6y8YF3cPUAVn/kaOpGCQDofPF2iymRvMgHwI/VkOqJkYHmyQGsEoOvyqttpIWXZPH0uD
         qBXihwLhDDrz5XIfpXblmk/jz6YnlWtus4OoKsZ7fyvkhJxwTawS2AVzKRlR1FDy7i9O
         itag==
X-Gm-Message-State: AOJu0YxhyZvAtD6ts61LAMgr68fNxwOx3Y4o/N58KIWgWahxxlajTWoF
	Dq4FrYiv1VyL/XXXXjuL27MAmHOkA4eg8egEh5LI2LAAD7yNrSzB0o5nxg==
X-Gm-Gg: ASbGnctOwZaKI+uBxjAZbXCCgNm7+HGHO+1LEuuqbUo0BEut50puyZU1TxISCOtbbMO
	0MFU61PzIPbN0TZNRtp8gvpampeuuUFD5SOdZz14khovWCINoV0PcIR9gPtGB5OxUd3lU2alowp
	B6v9VsD3UvQBKwf7jB/VuzbZdm4A71WxIW0pJC8lGM2e+ZuGbt5zXl02rREOfOsy93rzwmCS1hE
	idFIZZxKTqQZM+tpQXG+ZxWjd9PSJuE0MIU9pbZMDEmcIQuJ5O8A5VSUAhal0Jh/2Y4NDzNSwFP
	GyamcGo2iqULEJVXui5T/xl7NArvwKRgiF+dnKblGPfwutiZZxSYG7I/cXyQFpVgVllxf6y5BL1
	mzmx7KJFZXVJ2iNz2xA==
X-Google-Smtp-Source: AGHT+IEh0F5gqDJkUU+wGo+FupnzK7UMqX/dMJXfIaRgV/WqRtMGo+DSihPvLfiV3rLxnGcd9eWeTQ==
X-Received: by 2002:a17:907:6d12:b0:ad2:5021:bf3c with SMTP id a640c23a62f3a-ad25021dcbcmr904419866b.52.1747146572983;
        Tue, 13 May 2025 07:29:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU construction
Date: Tue, 13 May 2025 16:29:27 +0200
Message-ID: <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747145897.git.oleksii.kurochko@gmail.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor construct_domU() to improve architecture separation and reduce
reliance on ARM-specific logic in common code:
- Drop set_domain_type() from generic code. This function is specific
  to ARM and serves no purpose on other architectures like RISC-V,
  which lack the arch.type field in kernel_info.
- Introduce arch_construct_domU() to encapsulate architecture-specific
  DomU construction steps.
- Implement arch_construct_domU() for ARM. This includes:
  - Setting the domain type for CONFIG_ARM64.
  - Handling static memory allocation if xen,static-mem is present in
    the device tree.
  - Processing static shared memory.
- Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
  this call is specific to CONFIG_STATIC_SHM which is ARM specific,
  at least, now.

This cleanup avoids empty stubs on other architectures and moves
ARM-specific logic into arch code where it belongs.

Also, don't loose  a return value of functions called in
Arm's make_arch_nodes().

Suggested-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/dom0less-build.c            | 42 +++++++++++++++++-------
 xen/common/device-tree/dom0less-build.c  | 30 ++---------------
 xen/include/asm-generic/dom0less-build.h |  3 +-
 3 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a49764f0ad..592173268f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -220,9 +220,14 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     int ret;
 
+    ret = make_resv_memory_node(kinfo, GUEST_ROOT_ADDRESS_CELLS,
+                                GUEST_ROOT_SIZE_CELLS);
+    if ( ret )
+        return ret;
+
     ret = make_psci_node(kinfo->fdt);
     if ( ret )
-        return -EINVAL;
+        return ret;
 
     if ( kinfo->arch.vpl011 )
     {
@@ -230,26 +235,41 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
         ret = make_vpl011_uart_node(kinfo);
 #endif
         if ( ret )
-            return -EINVAL;
+            return ret;
     }
 
     return 0;
 }
 
-/* TODO: make arch.type generic ? */
-#ifdef CONFIG_ARM_64
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+int __init arch_construct_domU(struct kernel_info *kinfo,
+                               const struct dt_device_node *node)
 {
+    int rc = 0;
+    struct domain *d = kinfo->d;
+
+#ifdef CONFIG_ARM_64
     /* type must be set before allocate memory */
     d->arch.type = kinfo->arch.type;
-}
-#else
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* Nothing to do */
-}
 #endif
 
+    if ( !is_hardware_domain(d) )
+    {
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+        {
+            if ( !is_domain_direct_mapped(d) )
+                allocate_static_memory(d, kinfo, node);
+            else
+                assign_static_memory_11(d, kinfo, node);
+        }
+
+        rc = process_shm(d, kinfo, node);
+        if ( rc < 0 )
+            return rc;
+    }
+
+    return rc;
+}
+
 int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
                       const struct dt_device_node *node)
 {
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 2c56f13771..f6aabc2093 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -28,14 +28,6 @@
 #include <asm/dom0less-build.h>
 #include <asm/setup.h>
 
-#if __has_include(<asm/static-memory.h>)
-#   include <asm/static-memory.h>
-#endif
-
-#if __has_include(<asm/static-shmem.h>)
-#   include <asm/static-shmem.h>
-#endif
-
 #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
 
 static domid_t __initdata xs_domid = DOMID_INVALID;
@@ -507,12 +499,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-#ifdef CONFIG_STATIC_SHM
-    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
-    if ( ret )
-        goto err;
-#endif
-
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
@@ -787,7 +773,9 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    set_domain_type(d, &kinfo);
+    rc = arch_construct_domU(&kinfo, node);
+    if ( rc )
+        return rc;
 
     if ( is_hardware_domain(d) )
     {
@@ -799,18 +787,6 @@ static int __init construct_domU(struct domain *d,
     {
         if ( !dt_find_property(node, "xen,static-mem", NULL) )
             allocate_memory(d, &kinfo);
-#ifdef CONFIG_STATIC_MEMORY
-        else if ( !is_domain_direct_mapped(d) )
-            allocate_static_memory(d, &kinfo, node);
-        else
-            assign_static_memory_11(d, &kinfo, node);
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-        rc = process_shm(d, &kinfo, node);
-        if ( rc < 0 )
-            return rc;
-#endif
 
         rc = init_vuart(d, &kinfo, node);
         if ( rc < 0 )
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
index e0ad0429ec..78142e71ca 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -56,7 +56,8 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
 int make_intc_domU_node(struct kernel_info *kinfo);
 int make_arch_nodes(struct kernel_info *kinfo);
 
-void set_domain_type(struct domain *d, struct kernel_info *kinfo);
+int arch_construct_domU(struct kernel_info *kinfo,
+                        const struct dt_device_node *node);
 
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
-- 
2.49.0


