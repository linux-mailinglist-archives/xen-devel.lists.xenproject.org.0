Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1509B2B36
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826296.1240517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu3-00066N-5S; Mon, 28 Oct 2024 09:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826296.1240517; Mon, 28 Oct 2024 09:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu3-00064a-1G; Mon, 28 Oct 2024 09:19:11 +0000
Received: by outflank-mailman (input) for mailman id 826296;
 Mon, 28 Oct 2024 09:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Lu2-0005yk-42
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aec66eb1-950d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 10:19:07 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso551005066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:07 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:05 -0700 (PDT)
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
X-Inumbo-ID: aec66eb1-950d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107146; x=1730711946; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1bM8SCLj6R5IbsmBphTqHMm0oBQSGTeHlM7ro4wldk=;
        b=tGPDIzdtk9cV/uYse4W/2FzJp6OoFGsTV/e3+F4pwX1mfo8ky9WSoMp7C64U8nGkgJ
         oRGYlQCskAASLUsCfFysWBeGvI7g2E3IIKmgU+LFF5MR2IcrYHFWp7gyrOXTPOJjX/Dz
         p1VqQmxnIcTL6gljCWOBp0f8h51QmMVFBYsXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107146; x=1730711946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1bM8SCLj6R5IbsmBphTqHMm0oBQSGTeHlM7ro4wldk=;
        b=gY5EdRzZsLsNybpBmYVYcTJ+KkqhGO5OQNpd+M278u6dmGm2ZS7/UEIz21m1ibu+NQ
         VwGWaTwoboqMMsg9Zghz9/HmwUqO8B1260CoKHkdrks4KINGJ+WFI2gMp53JsK1NpdTo
         lk9oqyYOdjUP2Jy0qSdYt824REIMeLYln5+AGhxDzsaf9xhvbkOUexnsWhYUGRcK5cJ9
         0Qjixl+VPve1iYMpyF8c98Bd9dagQCFKkWEPekJqqV/T52aJ4siT4c3kc2rpqAhrj9dr
         fxRqubU5+B8NgaFLMNbQVjIZbEr4qaBbkmEHMQl+pQU4VJuOjI4zdhC8qANVZIZek8J4
         PpXg==
X-Gm-Message-State: AOJu0YzAMFzNDoZcPJanZfjhoWvlrPrXcKqx1LK8eIp+a9chD+mY+aNU
	mmZffjuMLlHWzi+4icAin45Nf9sVqSwpKM3XRbadAmOchmzXDty5NBsvZryI8uZ3z0Fg0aT0Nm8
	Y
X-Google-Smtp-Source: AGHT+IEP9KlEgbT5966fOb8YxiB5q7SRSyRaOvW6vHnzGKGD9sG85PdUM8qsnLLjc6FJETP54fbglw==
X-Received: by 2002:a17:907:1c24:b0:a9a:7f84:940b with SMTP id a640c23a62f3a-a9de5c91b71mr577280266b.10.1730107146079;
        Mon, 28 Oct 2024 02:19:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 04/10] x86/ucode: Fold early_microcode_update_cpu() into it's single caller
Date: Mon, 28 Oct 2024 09:18:50 +0000
Message-Id: <20241028091856.2151603-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Diff-wise, as early_microcode_update_cpu() is the larger function, this more
closely resembles "merge early_microcode_load() into it's single callee", but
the end result is the same.

At the same time, rename the len variable to size.  This is for better
consistency with existing logic, and to reduce churn later.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 38 +++++++++++++------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index d13f8338e4e6..0b00e70f3b07 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -819,28 +819,38 @@ static int __init cf_check microcode_init_cache(void)
 }
 presmp_initcall(microcode_init_cache);
 
-/* BSP calls this function to parse ucode blob and then apply an update. */
-static int __init early_microcode_update_cpu(void)
+/*
+ * There are several tasks:
+ * - Locate the ucode blob in the boot modules.
+ * - Parse and attempt in-place load.
+ * - Inform microcode_init_cache() of how to find the blob again.
+ */
+static int __init early_microcode_load(struct boot_info *bi)
 {
     const void *data = NULL;
-    size_t len;
+    size_t size;
     struct microcode_patch *patch;
 
+    microcode_grab_module(bi);
+
+    if ( !ucode_mod.mod_end && !ucode_blob.size )
+        return 0;
+
     if ( ucode_blob.size )
     {
-        len = ucode_blob.size;
+        size = ucode_blob.size;
         data = ucode_blob.data;
     }
     else if ( ucode_mod.mod_end )
     {
-        len = ucode_mod.mod_end;
+        size = ucode_mod.mod_end;
         data = bootstrap_map(&ucode_mod);
     }
 
     if ( !data )
         return -ENOMEM;
 
-    patch = ucode_ops.cpu_request_microcode(data, len, false);
+    patch = ucode_ops.cpu_request_microcode(data, size, false);
     if ( IS_ERR(patch) )
     {
         printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
@@ -854,22 +864,6 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch, 0);
 }
 
-/*
- * There are several tasks:
- * - Locate the ucode blob in the boot modules.
- * - Parse and attempt in-place load.
- * - Inform microcode_init_cache() of how to find the blob again.
- */
-static int __init early_microcode_load(struct boot_info *bi)
-{
-    microcode_grab_module(bi);
-
-    if ( !ucode_mod.mod_end && !ucode_blob.size )
-        return 0;
-
-    return early_microcode_update_cpu();
-}
-
 int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
-- 
2.39.5


