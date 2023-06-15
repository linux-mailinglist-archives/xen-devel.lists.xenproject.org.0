Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09394731D01
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549717.858415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDH-0006iR-Dd; Thu, 15 Jun 2023 15:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549717.858415; Thu, 15 Jun 2023 15:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDH-0006a1-8a; Thu, 15 Jun 2023 15:48:43 +0000
Received: by outflank-mailman (input) for mailman id 549717;
 Thu, 15 Jun 2023 15:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9pDG-0006RY-29
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:48:42 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 194a138e-0b94-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 17:48:40 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d20548adso5971786f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:48:40 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b0030497b3224bsm21374699wry.64.2023.06.15.08.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:48:39 -0700 (PDT)
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
X-Inumbo-ID: 194a138e-0b94-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686844119; x=1689436119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW/Gx0/gWuVvgcbydVmma7SPTfd/FqCS3V8cKgHysUU=;
        b=euaZ9xVkCiDKzfJx4HtgNdKwXIAAMf/7Yr0O8yib05CeCA4cKaMQ3innKj8xLI5li+
         oggIbJRLorHhk910Vnv6+EjP36br8jWjjeYd6ZO8SskaPuOrRtq4lZwcnPxs2KA84vt5
         gKsv/9J8B04YWqs3b4wLLKnuw4QD6bln6oL+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844119; x=1689436119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hW/Gx0/gWuVvgcbydVmma7SPTfd/FqCS3V8cKgHysUU=;
        b=UbrIV8S/Dr/CKWZ4Xwsia0aR05tevhdYoe/4HikpyX6yHHwLUdW9TDpkzUUmb7FS8s
         V/gUW6b6GK2inP9Aff03SbEzyqtTA2yHHtGTCCUjtaSf5h/v6UOo66mIoaqSOtKoKsbL
         7/Dano0JChBvjPeMPRNq3B7rQtZG9ASfoObGe1zSbGUiacPjXyTCjWrPyxoZZlVLvZFu
         2ZAofYiec0hz/n/8Vd6pShqeA/1CL25vVISu1xv7VZfgotBXZtMeVwzju4rYUdNL5yj9
         mcr3FpmhY8cG+wrgyrjK85BmG1VkuOZ5xojirzpR6i0i/wZd46grPf9q+19F9AKLCGbq
         /rFA==
X-Gm-Message-State: AC+VfDyDaSb6mjwLJ1yvWK4FfizmwFEB1U8u1doQTKfVk8TpstpDuOxa
	+ImzMbenyKkRFWbjNn7cYLf7luJLSxmNsRI9uTI=
X-Google-Smtp-Source: ACHHUZ4Z9FQLS5JRGxg0W/2DYdAKIjM0uoPCaHcxYEAGtC3t9TVrbUiMZmdnhBXDUnQSiJpPEC+6eQ==
X-Received: by 2002:a5d:4e05:0:b0:304:8149:239b with SMTP id p5-20020a5d4e05000000b003048149239bmr10956632wrt.50.1686844119748;
        Thu, 15 Jun 2023 08:48:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/5] x86/microcode: Create per-vendor microcode_ops builders
Date: Thu, 15 Jun 2023 16:48:31 +0100
Message-Id: <20230615154834.959-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615154834.959-1-alejandro.vallejo@cloud.com>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ucode_ops assignments in core.c for per-vendor calls.
This is in preparation for another patch that adds Intel-specific
conditions.

While moving the code around, also remove the family check on Intel, as
microcode loading is present on every Intel 64 machine.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Subsumes v2/patch1
  * Removes previous long comment on rationale for skipping family checks (Jan/Andrew)
  * Isolates vendor-specific code in ${VENDOR}.c (Jan, from v2/patch4)
---
 xen/arch/x86/cpu/microcode/amd.c     | 16 ++++++++++------
 xen/arch/x86/cpu/microcode/core.c    | 10 +++-------
 xen/arch/x86/cpu/microcode/intel.c   | 13 +++++++------
 xen/arch/x86/cpu/microcode/private.h | 19 ++++++++++++++++++-
 4 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index a9a5557835..7c9f311454 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -432,9 +432,13 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
-    .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare_patch                    = compare_patch,
-};
+void __init amd_get_ucode_ops(struct microcode_ops *ops)
+{
+    if ( boot_cpu_data.x86 < 0x10 )
+        return;
+
+    ops->cpu_request_microcode = cpu_request_microcode;
+    ops->collect_cpu_info      = collect_cpu_info;
+    ops->apply_microcode       = apply_microcode;
+    ops->compare_patch         = compare_patch;
+}
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index df7e1df870..530e3e8267 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -845,19 +845,15 @@ static int __init early_microcode_update_cpu(void)
 int __init early_microcode_init(unsigned long *module_map,
                                 const struct multiboot_info *mbi)
 {
-    const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
 
-    switch ( c->x86_vendor )
+    switch ( boot_cpu_data.x86_vendor )
     {
     case X86_VENDOR_AMD:
-        if ( c->x86 >= 0x10 )
-            ucode_ops = amd_ucode_ops;
+        amd_get_ucode_ops(&ucode_ops);
         break;
-
     case X86_VENDOR_INTEL:
-        if ( c->x86 >= 6 )
-            ucode_ops = intel_ucode_ops;
+        intel_get_ucode_ops(&ucode_ops);
         break;
     }
 
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 8d4d6574aa..a99e402b98 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -385,9 +385,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
-    .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
-    .compare_patch                    = compare_patch,
-};
+void __init intel_get_ucode_ops(struct microcode_ops *ops)
+{
+    ops->cpu_request_microcode = cpu_request_microcode;
+    ops->collect_cpu_info      = collect_cpu_info;
+    ops->apply_microcode       = apply_microcode;
+    ops->compare_patch         = compare_patch;
+}
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 626aeb4d08..13f0c7fb8e 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -60,6 +60,23 @@ struct microcode_ops {
         const struct microcode_patch *new, const struct microcode_patch *old);
 };
 
-extern const struct microcode_ops amd_ucode_ops, intel_ucode_ops;
+/**
+ * Retrieve the vendor-specific microcode management handlers
+ *
+ * Note that this is not an static set of handlers and may change from
+ * system to system depending on the presence of certain runtime features.
+ * even for the same 
+ *
+ *   - If the system has no microcode facilities, no handler is set.
+ *   - If the system has unrestricted microcode facilities, all handlers
+ *     are set
+ *   - If the system has microcode facilities, but they can't be used to
+ *     update the revision, then all handlers except for apply_microcode()
+ *     are set
+ *
+ * @param[out] ops Set of vendor-specific microcode handlers to overwrite
+ */
+void intel_get_ucode_ops(struct microcode_ops *ops);
+void amd_get_ucode_ops(struct microcode_ops *ops);
 
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
-- 
2.34.1


