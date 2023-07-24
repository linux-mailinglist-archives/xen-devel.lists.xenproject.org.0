Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDB75FC94
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569161.889451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyna-0000k6-Gp; Mon, 24 Jul 2023 16:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569161.889451; Mon, 24 Jul 2023 16:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyna-0000go-DK; Mon, 24 Jul 2023 16:52:42 +0000
Received: by outflank-mailman (input) for mailman id 569161;
 Mon, 24 Jul 2023 16:52:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YiG=DK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qNynY-0000Rl-Pq
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 16:52:40 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f86e7ac-2a42-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 18:52:39 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-313e742a787so2894374f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 09:52:39 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0030ada01ca78sm13480777wrt.10.2023.07.24.09.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 09:52:38 -0700 (PDT)
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
X-Inumbo-ID: 7f86e7ac-2a42-11ee-b23b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690217558; x=1690822358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OqOlHUGbYLsNw2DCYr1XfJ49MHPIApDoD89S57teGo=;
        b=Dj2sUcDZPUR8iEur6y588xckGrd7OERkp/FAE/G+DmWG/xYeCCzVaTm+Mtrmk75PSV
         DLoIf20R8RJpZHRSIzmV4rgN+ozDQYtzYw8P4vxaLGoDLd8kvmuBZVSiQPDiinqBcbo3
         MmBgWQb+4+8dXAvJWk2Mr4oV4VQ/jnvl0Z8h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217558; x=1690822358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OqOlHUGbYLsNw2DCYr1XfJ49MHPIApDoD89S57teGo=;
        b=ZYb9Piybznlz/nkgObFJ0tBs6lNlKFql/0hMNzU2H+O5GwZAqVwJ6V86+IgMPc8yy2
         7M3HA8hdB0SIOWHXlFYkzA84f7eN8dwhD8+SYoc48ymbQwwCnFaemSFNomF0O7gVZGm+
         civF1uzsHi7k45LMWj0k/vXMud3Mvv5YzQdr5Bd+prMqczaFIc52QJoOd2+n0WXxecJl
         gSshGSOdtGGCaA82zw/D9+2wCKTDkg8HWUcwqw+AWkeZFFkI/lVWVqj6IJmHoTINvIXn
         g+f96U64aZKF3T3+EXY7QwWh7TgrTFqI2BAaqvV56cqxrW+a+UchqE1+2TBJ779zeKZC
         wC5w==
X-Gm-Message-State: ABy/qLYZDUCUnG/yJYhpAFUN/jvRa2YuO2fQbEWmY6lG0ZPck7MVp+sx
	PxSM0Zf7MCoUuwJh/9ZdgLHvcfwzv7yiwY+6ktU=
X-Google-Smtp-Source: APBJJlGRi77c9zNJWYtpeiRgKRE9bFZwYBuQiSPvocOw7EHVHJnt59w7dC/XEonETQwuEP4NkaUP3g==
X-Received: by 2002:adf:e9c7:0:b0:311:360e:ea3a with SMTP id l7-20020adfe9c7000000b00311360eea3amr12406885wrn.34.1690217558475;
        Mon, 24 Jul 2023 09:52:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 1/3] x86/microcode: Ignore microcode loading interface for revision = -1
Date: Mon, 24 Jul 2023 17:52:33 +0100
Message-Id: <20230724165235.25262-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
References: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors report ~0 as the microcode revision to mean "don't issue
microcode updates". Ignore the microcode loading interface in that case.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v6:
  * Change message content and move severity WARNING -> INFO (Andrew)
      NOTE: It has a convoluted argument to simplify the last patch, that
            uses the same printk()
---
 xen/arch/x86/cpu/microcode/core.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index bec8b55db2..71e3944cf2 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
-
     ucode_ops.collect_cpu_info();
 
+    /*
+     * Some hypervisors deliberately report a microcode revision of -1 to
+     * mean that they will not accept microcode updates. We take the hint
+     * and ignore the microcode interface in that case.
+     */
+    if ( this_cpu(cpu_sig).rev == ~0 )
+    {
+        printk(XENLOG_INFO "Microcode loading disabled due to: %s",
+                           "HW toggle");
+        ucode_ops.apply_microcode = NULL;
+        return -ENODEV;
+    }
+
+    microcode_grab_module(module_map, mbi);
+
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
-- 
2.34.1


