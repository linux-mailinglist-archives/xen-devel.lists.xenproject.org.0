Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FA9BDA72
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 01:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830529.1245567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5Q-0007uV-8W; Wed, 06 Nov 2024 00:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830529.1245567; Wed, 06 Nov 2024 00:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5Q-0007oB-3K; Wed, 06 Nov 2024 00:39:52 +0000
Received: by outflank-mailman (input) for mailman id 830529;
 Wed, 06 Nov 2024 00:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8U5O-0007Sp-JM
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 00:39:50 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fb9a4cc-9bd7-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 01:39:47 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso968935466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 16:39:47 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d66b9sm198664166b.59.2024.11.05.16.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 16:39:45 -0800 (PST)
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
X-Inumbo-ID: 9fb9a4cc-9bd7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlmYjlhNGNjLTliZDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODUzNTg3LjM2MzczMywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730853586; x=1731458386; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bivrP7RYzPcmWMZylrkIsrDnMjF+93O+ViHtEw4ZTZ4=;
        b=uZwA4D/MQOLYrOJiuxn4FDvBVmervwYd0xhVjtwhz9OM6r+id69xS4zMu/HeG+4ie4
         eSQG92odQdWPSxBWSAd7Sa9VcNcN32cBxp9N5OLHKVWy9Iyc7SHg5cvVr4K7jGp/IbLB
         v6eH5y2qLcwf0pMtpCm50cBle3+uUD8Gi3xfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730853586; x=1731458386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bivrP7RYzPcmWMZylrkIsrDnMjF+93O+ViHtEw4ZTZ4=;
        b=BSDGN//Ilqu0jKJ0w6YMz7+ZJzmuTrSHrp+wnA1X9YcnZ65CokiiZO5BDd/bpOTjBa
         9cSiQQkAJZTGfKZifdaWQhwRzjfszCI6uzmiMuwqqYJis2CIZAaoakLbDuAFmV6p1gzy
         i98Ory579lxXSYlwcrJgTxKVJ6u0QkQgNEIK6Hc/ewJkd2tnBvMcsPVtvVbFPuL/o3Ex
         evVYhaK1Vm1serGwMEzc5xR1YV1BBqYWlRvXG2n3qi6G+VPKWugCGEdKhRbjVoe6MCxH
         xdig7FmJ8jMbgjizSctbhWaBxmwEVeuA35aVYWlSKyYiEkXTxkS1kdZ7ketzP4JjzZHD
         OfWw==
X-Gm-Message-State: AOJu0YzsHF+rUdOpJIbW8cN9m8/aK/GBkIRl2j2IENCs4u2Mr+JOiVLW
	LqapXrtQjuahvGtiGaQJfk4jYAB0tbEDHhU/FJP3NC2MBuA2dt95ilxe8CXmqfGiC5TnEljS0pz
	4
X-Google-Smtp-Source: AGHT+IHOQD+MOwX+f3K42IcDvvL+zmdwP1SdeXuzPTIppUecycbvuCScfX3pkKpFSFFCKmBZi5/5Ug==
X-Received: by 2002:a17:907:c8a0:b0:a9e:b287:2813 with SMTP id a640c23a62f3a-a9eb2875f42mr420633066b.5.1730853586157;
        Tue, 05 Nov 2024 16:39:46 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/4] x86/ucode: Fold early_update_cache() into its single caller
Date: Wed,  6 Nov 2024 00:39:38 +0000
Message-Id: <20241106003938.3453243-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
References: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 47 +++++++++++++------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 74b816a98b17..54ce1b5e2ba6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -711,33 +711,6 @@ int microcode_update_one(void)
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
@@ -748,6 +721,7 @@ static int __initdata early_mod_idx = -1;
 static int __init cf_check microcode_init_cache(void)
 {
     struct boot_info *bi = &xen_boot_info;
+    struct microcode_patch *patch;
     void *data;
     size_t size;
     int rc = 0;
@@ -778,7 +752,24 @@ static int __init cf_check microcode_init_cache(void)
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


