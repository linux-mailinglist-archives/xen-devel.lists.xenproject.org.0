Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E59AE8A1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 16:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825348.1239570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3yno-0004du-6I; Thu, 24 Oct 2024 14:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825348.1239570; Thu, 24 Oct 2024 14:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3yno-0004az-1j; Thu, 24 Oct 2024 14:27:04 +0000
Received: by outflank-mailman (input) for mailman id 825348;
 Thu, 24 Oct 2024 14:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3ynl-00048L-UH
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 14:27:01 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0890c943-9214-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 16:27:01 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c9709c9b0cso1290425a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 07:27:01 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b4e4sm5707409a12.61.2024.10.24.07.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 07:26:58 -0700 (PDT)
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
X-Inumbo-ID: 0890c943-9214-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729780020; x=1730384820; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlxvwzJVPPnRSm1WJDmkyMNWEmqNga8e4AWKAxVxRWA=;
        b=HRCg04WwAOI2f0GqWFgij3bAYN3/FPkao2mC6HtcA5YbFMzjsQFMUDnVBBPFE3gFUO
         KrCO/NkaDkYmE07bYUB8zf5kZktKDN7jSTAFUaCnslgcVx1hT9IIAalsctT+LeY20tXm
         1mZEUC+jYh9+Tj/GrhlgBZO2q+IFHssubHh2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780020; x=1730384820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlxvwzJVPPnRSm1WJDmkyMNWEmqNga8e4AWKAxVxRWA=;
        b=l98oc41f4kldqQJHaaFP08vXNwH9oYwmab5yzH15o9nAmUAg6j34RbmolBe1vnR6LL
         IGTTQ74w42Uz5CyUIsHlqbkSzYauOaQnSofN5F1Y+rfNvqGidZ51wT1tcccVxSrTazWu
         32mpE8IgMJOfz+gXPr49dMwzt0kRjREsjDRLBkhHFxCZ6aynJQ4dE71uAbZ1UQBFiunx
         HpwCHS6eU5h5uC8eJiLCx7yzJ7GXzDVX3tfRdS0ddcZlxcbnry6QRxoKjY0/O4KKxr/1
         C4cOj/dHeX+pHziwWD6MHSwgm0GZfpkQ7OdhOCgaxPFZHuubOJj2OapROii0DnJNQoBo
         gM3w==
X-Gm-Message-State: AOJu0YzZWnUj39BwdlYJBFzi1l5jPURzeFrXlVQKyzraHny0V7GPMDZO
	vS/nXUszinkbEwVjr9O5//FRQ2jgjmE7TO37EWTfbQQiiA2O9Oryzb7ywqdVX4ry3M66/ZHYHB7
	s
X-Google-Smtp-Source: AGHT+IF9HdVMlJ7LWUwQaPIk62zIToVeIBN+RTzdkSEC2LQrfp3ljwUPiPjrJjR6BLnJNygnDlM/qA==
X-Received: by 2002:a05:6402:3510:b0:5c9:8ac6:5f11 with SMTP id 4fb4d7f45d1cf-5cb8b1cefcamr5190098a12.36.1729780020357;
        Thu, 24 Oct 2024 07:27:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/5] x86/boot: Introduce bootstrap_unmap()
Date: Thu, 24 Oct 2024 15:26:51 +0100
Message-Id: <20241024142654.989980-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024142654.989980-1-andrew.cooper3@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're about to introduce alternative mapping functions, and passing NULL was
always a slightly weird way to express unmap.  Make an explicit unmap
function, to avoid having two different valid ways of unmapping.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v7.5:
 * New
---
 xen/arch/x86/cpu/microcode/core.c |  6 +++---
 xen/arch/x86/include/asm/setup.h  |  2 ++
 xen/arch/x86/pv/dom0_build.c      |  2 +-
 xen/arch/x86/setup.c              | 10 ++++++----
 xen/xsm/xsm_core.c                |  4 ++--
 xen/xsm/xsm_policy.c              |  2 +-
 6 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1d58cb0f3bc1..cf6517293375 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -198,7 +198,7 @@ static void __init microcode_scan_module(struct boot_info *bi)
             ucode_blob.data = cd.data;
             break;
         }
-        bootstrap_map(NULL);
+        bootstrap_unmap();
     }
 }
 
@@ -763,13 +763,13 @@ static int __init cf_check microcode_init(void)
      */
     if ( ucode_blob.size )
     {
-        bootstrap_map(NULL);
+        bootstrap_unmap();
         ucode_blob.size = 0;
         ucode_blob.data = NULL;
     }
     else if ( ucode_mod.mod_end )
     {
-        bootstrap_map(NULL);
+        bootstrap_unmap();
         ucode_mod.mod_end = 0;
     }
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 811855e57478..8b7843104ff7 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -37,7 +37,9 @@ extern struct boot_info xen_boot_info;
 
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
+
 void *bootstrap_map(const module_t *mod);
+void bootstrap_unmap(void);
 
 int remove_xen_ranges(struct rangeset *r);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index ee9ecdc2abbf..cdae17b27654 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -830,7 +830,7 @@ static int __init dom0_construct(struct domain *d,
         printk("Failed to load the kernel binary\n");
         goto out;
     }
-    bootstrap_map(NULL);
+    bootstrap_unmap();
 
     if ( UNSET_ADDR != parms.virt_hypercall )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8c10fe51dfad..8e32d6c49c54 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -471,13 +471,15 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
 
 void *__init bootstrap_map(const module_t *mod)
 {
-    if ( !mod )
-        return bootstrap_map_addr(0, 0);
-
     return bootstrap_map_addr(pfn_to_paddr(mod->mod_start),
                               pfn_to_paddr(mod->mod_start) + mod->mod_end);
 }
 
+void __init bootstrap_unmap(void)
+{
+    bootstrap_map_addr(0, 0);
+}
+
 static void __init move_memory(
     uint64_t dst, uint64_t src, unsigned int size)
 {
@@ -1402,7 +1404,7 @@ void asmlinkage __init noreturn __start_xen(void)
     }
 
     modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
-    bootstrap_map(NULL);
+    bootstrap_unmap();
 
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 6e3fac68c057..f255fb63bf6f 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -153,14 +153,14 @@ int __init xsm_multiboot_init(struct boot_info *bi)
         ret = xsm_multiboot_policy_init(bi, &policy_buffer, &policy_size);
         if ( ret )
         {
-            bootstrap_map(NULL);
+            bootstrap_unmap();
             printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
             return -EINVAL;
         }
     }
 
     ret = xsm_core_init(policy_buffer, policy_size);
-    bootstrap_map(NULL);
+    bootstrap_unmap();
 
     return 0;
 }
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 6f799dd28f5b..35f36c6f2359 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -63,7 +63,7 @@ int __init xsm_multiboot_policy_init(
 
         }
 
-        bootstrap_map(NULL);
+        bootstrap_unmap();
     }
 
     return rc;
-- 
2.39.5


