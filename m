Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2109B2B31
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826301.1240564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu8-0007Hh-0Y; Mon, 28 Oct 2024 09:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826301.1240564; Mon, 28 Oct 2024 09:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu7-0007Au-SI; Mon, 28 Oct 2024 09:19:15 +0000
Received: by outflank-mailman (input) for mailman id 826301;
 Mon, 28 Oct 2024 09:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Lu6-0005yk-JW
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:14 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b239fedf-950d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 10:19:13 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso572799566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:13 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:11 -0700 (PDT)
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
X-Inumbo-ID: b239fedf-950d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107152; x=1730711952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0bQWwaJpgsfZHiC3o/SG7G/jAI+5h9RvIivMx1nt38=;
        b=Az2RTmn5ff2Ct6zz41gAjJZB9XfpGMD9+o0qlhKVrw/1Cl7EAbJ2POE30l4BTXmsS0
         /nf56CIcfRsC7xGptB/dbR/MkShPTEIY4lRiLz0l4c0avCLNVj1HNh5dmix+HBhOgFuP
         drfSrqMLm5pln0F8TPAgv3uWgWuU1yRDLoWTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107152; x=1730711952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0bQWwaJpgsfZHiC3o/SG7G/jAI+5h9RvIivMx1nt38=;
        b=aroNsNC1vxSkDGCqvdZ6nGa/+HHkdLs85Q4e6Q7PkCXQ27G9qKv74JCIyF5W9cNGMt
         m+I8eY57H78HjIzHbH9qYw05qmMTecfFVcVWl7DJP3b+p+Cbbj9exVaQGHh1+Cp3rk/X
         nR7wuJfs+4jJieBWtP6UN+zwylnmyO+uJZsP5xIi0qR36FOCgboK1w2hXxr8WbYhyXXx
         NcCXbLTsWkkLcZLt5SpGvS3pA2Z696G4mtxcs1kljMX3NLfErYqG010mtEQQx2vqekyc
         H10iB0HsRjdSZVh0EwbJ6g+pI0UytF9YLcP1UbcHkqTwx/GNjbJeG8hLNAePKfq48xyg
         Kwaw==
X-Gm-Message-State: AOJu0YyqzzmctjgmPzrRmQ4HDdILNIvbmFrOBQXLhwUpihBZYww3b7XT
	OkvmfIARTopcQHAtG6RrF+n3HFObS/UEE1x8qCEkhMSUboANffKmQ+Phn9WKp1tpZ/EOQsmtBmQ
	C
X-Google-Smtp-Source: AGHT+IHUScjwHs+SIRSiBfF67ypzxxtUffXbIKI8gWWL9LwAwdGM1fnb3VoqaEvFjPGPmyn4qCNscQ==
X-Received: by 2002:a17:906:f59b:b0:a99:f975:2e6 with SMTP id a640c23a62f3a-a9de5f6ddcbmr788105366b.35.1730107151905;
        Mon, 28 Oct 2024 02:19:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 08/10] x86/ucode: Use bootstrap_unmap() in early_microcode_load()
Date: Mon, 28 Oct 2024 09:18:54 +0000
Message-Id: <20241028091856.2151603-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 6a87390ab770..28cfeab75a81 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -823,6 +823,7 @@ static int __init early_microcode_load(struct boot_info *bi)
     size_t size;
     struct microcode_patch *patch;
     int idx = opt_mod_idx;
+    int rc = 0;
 
     /*
      * Cmdline parsing ensures this invariant holds, so that we don't end up
@@ -878,15 +879,24 @@ static int __init early_microcode_load(struct boot_info *bi)
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


