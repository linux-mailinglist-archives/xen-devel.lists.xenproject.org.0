Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30BC9B2B2F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826303.1240584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5LuC-0007yO-45; Mon, 28 Oct 2024 09:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826303.1240584; Mon, 28 Oct 2024 09:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5LuB-0007tF-RF; Mon, 28 Oct 2024 09:19:19 +0000
Received: by outflank-mailman (input) for mailman id 826303;
 Mon, 28 Oct 2024 09:19:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5LuA-0005yk-C6
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:18 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ffc1e0-950d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 10:19:16 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a16b310f5so631781666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:16 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:13 -0700 (PDT)
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
X-Inumbo-ID: b3ffc1e0-950d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107154; x=1730711954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3hciQ8Ka+dHVzkGgN9t9G2Trm/MbifcubSrtXUCw+M=;
        b=IXwUuC1xzv8NPdzys5H0aWul5/OF4Xv76JNr0xYLz/ufgtv8SREikhHlS6ztVUWaZc
         n9P+0WoGgN8Y6+fLzsbOZsj0VGKkSrfgbaq4udZUwIAAm/HKMCFWuUyUeT73cEEaFHIK
         LxMhfHYDjNPp1+6iai6n+VBFf/fp7u9vsiw5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107154; x=1730711954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3hciQ8Ka+dHVzkGgN9t9G2Trm/MbifcubSrtXUCw+M=;
        b=gJDgzEDKgaOAEzc6kqNAe0z+VG4CpaXNYRaq+WMwtgh9PshtDJ/9CzhqIE6e6yQTiG
         WcwqpK+lSlwjUgod+4R23UUypRzXW0/yqGTZ+3gOBF/dK8UOrJaT0OZELgmheYp5HY/m
         FYwBBSxbWkztc3WIZmxy/CKXQuxspc6yxmVzaTUPYxSSPPSP6/DuAGAyPqNN0gAuvsLU
         RHlw0QUEWsKZHkuskdgqb3AlDY3Dxn1GovvprD03hg8o9rb3wMdiMd8sv4RdEEK+Dbo4
         1qy5TrLAtR7dgy2w/F2/7qsm/Gfd5IUzoLroCfG2Q4ZLsrzy2m7eBPff5FQNwZbecKyJ
         +HuA==
X-Gm-Message-State: AOJu0YxXvluYhcvfdjYydUZvqD+nJ8HsEXbSiAPcX37lJTTquGqNljpZ
	xn/5vsOjcz2dhBOSe1fLmG3RAAFyhUieN/7kfj/CtWtjjGhJ1nULyfoHh4n729Abtm4VkjaTviT
	Y
X-Google-Smtp-Source: AGHT+IHDTU7KYy6C7gkSIvfD0SXzraoTh+peLzg0SM8iNtvWnEKHnonHgd6RuBE5i3u2p+RDyGorCQ==
X-Received: by 2002:a17:907:7284:b0:a9a:6ab:c93b with SMTP id a640c23a62f3a-a9de62ec47fmr687812466b.62.1730107154586;
        Mon, 28 Oct 2024 02:19:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 10/10] x86/ucode: Fold early_update_cache() into its single caller
Date: Mon, 28 Oct 2024 09:18:56 +0000
Message-Id: <20241028091856.2151603-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The data pointer is known good, so the -ENOMEM path is unnecessary.  However,
if we find no patch, something's wrong seeing as early_microcode_init()
indicated it was happy.

We are the entity initialising the cache, so we don't need the complexity of
using microcode_update_cache().  Just assert the cache is empty, and populate
it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 47 +++++++++++++------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 591c13ad91fb..90a6f2bd87ae 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -707,33 +707,6 @@ int microcode_update_one(void)
     return microcode_update_cpu(NULL, 0);
 }
 
-static int __init early_update_cache(const void *data, size_t len)
-{
-    int rc = 0;
-    struct microcode_patch *patch;
-
-    if ( !data )
-        return -ENOMEM;
-
-    patch = parse_blob(data, len);
-    if ( IS_ERR(patch) )
-    {
-        printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
-               PTR_ERR(patch));
-        return PTR_ERR(patch);
-    }
-
-    if ( !patch )
-        return -ENOENT;
-
-    spin_lock(&microcode_mutex);
-    rc = microcode_update_cache(patch);
-    spin_unlock(&microcode_mutex);
-    ASSERT(rc);
-
-    return rc;
-}
-
 /*
  * Set by early_microcode_load() to indicate where it found microcode, so
  * microcode_init_cache() can find it again and initalise the cache.  opt_scan
@@ -744,6 +717,7 @@ static int __initdata early_mod_idx = -1;
 static int __init cf_check microcode_init_cache(void)
 {
     struct boot_info *bi = &xen_boot_info;
+    struct microcode_patch *patch;
     void *data;
     size_t size;
     int rc = 0;
@@ -774,7 +748,24 @@ static int __init cf_check microcode_init_cache(void)
         size = cd.size;
     }
 
-    rc = early_update_cache(data, size);
+    patch = parse_blob(data, size);
+    if ( IS_ERR(patch) )
+    {
+        rc = PTR_ERR(patch);
+        printk(XENLOG_WARNING "Microcode: Parse error %d\n", rc);
+        return rc;
+    }
+
+    if ( !patch )
+    {
+        printk(XENLOG_WARNING "Microcode: No suitable patch found\n");
+        return -ENOENT;
+    }
+
+    spin_lock(&microcode_mutex);
+    ASSERT(microcode_cache == NULL);
+    microcode_cache = patch;
+    spin_unlock(&microcode_mutex);
 
     return rc;
 }
-- 
2.39.5


