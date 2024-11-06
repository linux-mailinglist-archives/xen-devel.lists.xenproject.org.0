Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53379BDA74
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 01:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830528.1245558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5P-0007iO-Of; Wed, 06 Nov 2024 00:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830528.1245558; Wed, 06 Nov 2024 00:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5P-0007aQ-JW; Wed, 06 Nov 2024 00:39:51 +0000
Received: by outflank-mailman (input) for mailman id 830528;
 Wed, 06 Nov 2024 00:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8U5N-0007Sp-HU
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 00:39:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e5a7052-9bd7-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 01:39:45 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ceca7df7f0so4365063a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 16:39:45 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d66b9sm198664166b.59.2024.11.05.16.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 16:39:42 -0800 (PST)
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
X-Inumbo-ID: 9e5a7052-9bd7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjllNWE3MDUyLTliZDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODUzNTg1LjA2MzE0Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730853584; x=1731458384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z05R7l9VYc7ghmXmXZQCFu9nX1F+8KLNBANLsMWOZCI=;
        b=KffKs29uychKMbgg7ifA/VKIrhEwz7ZX0VffCM7WyOPZAP/VuKw6RjDX5GGufNWIbC
         K/tbYfLs9AVTkBakwjWiat6Z2XNOSvAHnsKO+D5CPJw6tkUFoQohNkXhJ1OE6klgfeRh
         tXvKZHKkMqc2OwejonhKqFy88f8krMiNtPNPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730853584; x=1731458384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z05R7l9VYc7ghmXmXZQCFu9nX1F+8KLNBANLsMWOZCI=;
        b=lYrI1ZYR1MMTh37AVHrtRf8EMmR6tBNfRSeWNjd64pTrXHeiOKLkaRWc5glH+eTjGt
         cEmP3HU6hBgwYapFLTjsTdo8Q84V7ImhWXPaPYFIjLE1pUtwLbcx2y6gHC91vWlC+wLz
         WXGs3dRwmUPmkl0U986VqpFagK81rlQYdigwvMojRagHUlC+S2wyIKd+6RYV9+KQqsKM
         6AjYtGFAwumA6Nbd7mVIhgYrY19bh6m22luHOnx+qfE+9PfAT6/L/WOJlS0S/UHwzTar
         6FHc0gFn+OCeBbyfi4a3KDY2FLYjbdIcdl+JXrbljAU7mdx8mZYYHp45mtpQide7ZWUL
         +zyw==
X-Gm-Message-State: AOJu0YwHRLTdwHkhxgyA0EA1h7ZxEVSnZojDyecKtxEFsiT4c3/8ezPo
	XCNETNfpIcQvuPxhDAhWJT3kFBULH4+WV6xaW/BAEfQBvYqpNvKPdwhf3VWaOJus+VtRKF7qro5
	u
X-Google-Smtp-Source: AGHT+IELiNk3d6+2EJT1O40P42H11PctsxY7oR3mNu8I1PiWpljSzKyQ7AGvIYC1PSQ2nfqyg69CTA==
X-Received: by 2002:a17:907:2d10:b0:a9a:1115:486e with SMTP id a640c23a62f3a-a9e655b9327mr1752185166b.45.1730853583709;
        Tue, 05 Nov 2024 16:39:43 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/4] x86/ucode: Use bootstrap_unmap() in early_microcode_load()
Date: Wed,  6 Nov 2024 00:39:36 +0000
Message-Id: <20241106003938.3453243-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
References: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If bootstrap_map() has provided a mapping, we must free it when done.  Failing
to do so may cause a spurious failure for unrelated logic later.

Inserting a bootstrap_unmap() here does not break the use of ucode_{blob,mod}
any more than they already are.

Add a printk noting when we didn't find a microcode patch.  It's at debug
level, because this is the expected case on AMD Client systems, and SDPs, but
for people trying to figure out why microcode loading isn't work, it might be
helpful.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v2:
 * Drop initialisation for rc.
---
 xen/arch/x86/cpu/microcode/core.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 97ed1f11588a..a2b03c52e86a 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -849,6 +849,7 @@ static int __init early_microcode_load(struct boot_info *bi)
     size_t size;
     struct microcode_patch *patch;
     int idx = opt_mod_idx;
+    int rc;
 
     /*
      * Cmdline parsing ensures this invariant holds, so that we don't end up
@@ -904,15 +905,24 @@ static int __init early_microcode_load(struct boot_info *bi)
     patch = ucode_ops.cpu_request_microcode(data, size, false);
     if ( IS_ERR(patch) )
     {
-        printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
-               PTR_ERR(patch));
-        return PTR_ERR(patch);
+        rc = PTR_ERR(patch);
+        printk(XENLOG_WARNING "Microcode: Parse error %d\n", rc);
+        goto unmap;
     }
 
     if ( !patch )
-        return -ENOENT;
+    {
+        printk(XENLOG_DEBUG "Microcode: No suitable patch found\n");
+        rc = -ENOENT;
+        goto unmap;
+    }
+
+    rc = microcode_update_cpu(patch, 0);
 
-    return microcode_update_cpu(patch, 0);
+ unmap:
+    bootstrap_unmap();
+
+    return rc;
 }
 
 int __init early_microcode_init(struct boot_info *bi)
-- 
2.39.5


