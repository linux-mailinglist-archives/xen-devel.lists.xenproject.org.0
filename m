Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A6A978041
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 14:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798167.1208287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5aj-00004s-Lx; Fri, 13 Sep 2024 12:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798167.1208287; Fri, 13 Sep 2024 12:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5aj-0008UI-Ik; Fri, 13 Sep 2024 12:40:01 +0000
Received: by outflank-mailman (input) for mailman id 798167;
 Fri, 13 Sep 2024 12:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Mtl=QL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sp5ai-0008U8-5N
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 12:40:00 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49b6cddd-71cd-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 14:39:59 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9018103214so286595166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 05:39:59 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25953275sm867616966b.70.2024.09.13.05.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 05:39:57 -0700 (PDT)
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
X-Inumbo-ID: 49b6cddd-71cd-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726231198; x=1726835998; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/ueT8uW8b4tBIRnCuXFQV/WnWZs2GVaHe/kpWB77Io=;
        b=Okuf2beITFpaawzyaqwaHAhCD3uck2JGwsxdvnOHzAotCtuvdlqWXPg6ZIxo0HR9/p
         UVT7PEfEUiO2qdeWczvbygiLsf45VuupGDziQhDddWGfM33epylAOZ179oMjL4dp0Z9j
         btK36wIIpmxdru1VkOx+QVqoEmFpb/iA7iPHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726231198; x=1726835998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/ueT8uW8b4tBIRnCuXFQV/WnWZs2GVaHe/kpWB77Io=;
        b=WjuQjrg7cDeRoK+FFHgmRw+vAm7gOe4UwXW3luNwWucegA6JsAvdsJ4QZ8ZEDefK+9
         K3j3GoaFc8S/noflYUf2nwIF+6ZO0V+au8fyaJe/TIL5hVtWlseqND9eS36ehQ8r484J
         +1yZA8IzcuAPdKancWsV0JDXJopUyIn3E/MEb/EiKWdLenPzqtnl8ZxVZCnhokmO4uLS
         nnMYo/mK+X/7bKSQ6U7wT7jFRBUxEwIdn4v7AOjj4VfYNotoTwP7grQT3qj0hr2ikZEE
         b8ffXVnCvPOMYWrl54BKgnPdevcB8TEMBKioY7xae3zXuETgPHUYANBqD3ZGanNGE0tk
         Sxjw==
X-Gm-Message-State: AOJu0Yxnx5QIAUb6Rl+W45K+ouMpxSsDSSbCHNLN3fVSGOk+v7VNMJaN
	yRp2d5j3IdIz1uCFSlIszhzaX6ohAVKY322uzzF8MV8N+HqiNhGARBazwdq09rJw8vxmVkEGLfN
	q
X-Google-Smtp-Source: AGHT+IG7itZmeivfoVyIcenFYmFvTw3w4sL/abmRb1dmPISH9XJgUQeU7wjukim5YCNg9KxqfzPISQ==
X-Received: by 2002:a17:907:f752:b0:a86:a481:248c with SMTP id a640c23a62f3a-a90294465abmr529481366b.19.1726231197603;
        Fri, 13 Sep 2024 05:39:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/ucode: Improve commentary for parsing AMD containers
Date: Fri, 13 Sep 2024 13:39:54 +0100
Message-Id: <20240913123954.1907305-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Despite writing this code, it's not the easiest logic to follow.

Shorten the UCODE_EQUIV_TYPE name, and provide more of an explanation of
what's going on.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 32490c8b7d2a..35bcec643c04 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -52,11 +52,11 @@ struct microcode_patch {
 };
 
 #define UCODE_MAGIC                0x00414d44
-#define UCODE_EQUIV_CPU_TABLE_TYPE 0x00000000
+#define UCODE_EQUIV_TYPE           0x00000000
 #define UCODE_UCODE_TYPE           0x00000001
 
 struct container_equiv_table {
-    uint32_t type; /* UCODE_EQUIV_CPU_TABLE_TYPE */
+    uint32_t type; /* UCODE_EQUIV_TYPE */
     uint32_t len;
     struct equiv_cpu_entry eq[];
 };
@@ -335,10 +335,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
         buf  += 4;
         size -= 4;
 
-        if ( size < sizeof(*et) ||
-             (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
-             size - sizeof(*et) < et->len ||
-             et->len % sizeof(et->eq[0]) )
+        if ( size < sizeof(*et) ||                   /* Insufficient space for header? */
+             (et = buf)->type != UCODE_EQUIV_TYPE || /* Not an Equivalence Table? */
+             size - sizeof(*et) < et->len ||         /* Insufficient space for table? */
+             et->len % sizeof(et->eq[0]) )           /* Not a multiple of equiv_cpu_entry? */
         {
             printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
             error = -EINVAL;
@@ -351,7 +351,12 @@ static struct microcode_patch *cf_check cpu_request_microcode(
 
         error = scan_equiv_cpu_table(et);
 
-        /* -ESRCH means no applicable microcode in this container. */
+        /*
+         * -ESRCH means no applicable microcode in this container.  But, there
+         * might be subsequent containers in the blob.  Skipping to the end of
+         * this container still requires us to follow the UCODE_UCODE_TYPE/len
+         * metadata because there's no overall container length given.
+         */
         if ( error && error != -ESRCH )
             break;
         skip_ucode = error;
@@ -361,10 +366,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
         {
             const struct container_microcode *mc;
 
-            if ( size < sizeof(*mc) ||
-                 (mc = buf)->type != UCODE_UCODE_TYPE ||
-                 size - sizeof(*mc) < mc->len ||
-                 mc->len < sizeof(struct microcode_patch) )
+            if ( size < sizeof(*mc) ||                      /* Insufficient space for container header? */
+                 (mc = buf)->type != UCODE_UCODE_TYPE ||    /* Not an ucode blob? */
+                 size - sizeof(*mc) < mc->len ||            /* Insufficient space for blob? */
+                 mc->len < sizeof(struct microcode_patch) ) /* Insufficient space for patch header? */
             {
                 printk(XENLOG_ERR "microcode: Bad microcode data\n");
                 error = -EINVAL;
-- 
2.39.2


