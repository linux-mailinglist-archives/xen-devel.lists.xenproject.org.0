Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC378D750
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593118.926055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVf-0006bL-GI; Wed, 30 Aug 2023 15:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593118.926055; Wed, 30 Aug 2023 15:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVf-0006Yx-DA; Wed, 30 Aug 2023 15:53:35 +0000
Received: by outflank-mailman (input) for mailman id 593118;
 Wed, 30 Aug 2023 15:53:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xver=EP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qbNVd-00064u-7p
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:53:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5deca6fb-474d-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 17:53:31 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40061928e5aso54622335e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 08:53:31 -0700 (PDT)
Received: from localhost.localdomain ([66.81.173.62])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff244000000b0031423a8f4f7sm17000009wrp.56.2023.08.30.08.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 08:53:29 -0700 (PDT)
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
X-Inumbo-ID: 5deca6fb-474d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693410810; x=1694015610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q1Vgbah5j3OZbYDU19ymIfaCBTb08DYofJeRBbRkrM=;
        b=G0B2RQG4t2P1zP64owJqZRN6dKqcnlasw6G1tScoC9I201LF7vaw5TMif0J4BLkPrg
         PpCgPRUEGjXKC/vYm7Yj+aC/hqNCtAoJoIMdO2yd3ujLO98IYcpmKHCPDOnq6hqpDGHY
         Ebq7QFFbP9M+DBb7K7vMRd5BEv4fBcCOjH73E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410810; x=1694015610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q1Vgbah5j3OZbYDU19ymIfaCBTb08DYofJeRBbRkrM=;
        b=efKlPD6llzCiif6ZRi2MnHWhufbFzqaI9ow+SMrOAzUT/YaIR2IorzLuMlmsb/KVCZ
         XhOUxj3pyF7Cm2XjHeQVHTmr5VX6WrJM6ZPnV0k53g94FmloVmr0dfAY3ZEGHw9oTEU8
         YeruIH6HHx4JA7Pcp6zb2N0DOeyfto3WaDLvmC1/5V9N4H8ZAP6Vi3tnhnmD6f/0ssjB
         kei9B4fFMFv9bK6wbDATnYDk7PuqTvWxGCWaQEdTuk7UrXyn+4Fs0ly9LGbKgFefgNDG
         EmpkXfBrPVOuLWAM+oiacd1xV4buaJaeKT5yYXnrt4djNeqY4+SzCetwoPhf+pjMmlsf
         25lw==
X-Gm-Message-State: AOJu0YwdU8bMRoWdQVB1qs5NhhiwojOdEt9oc/iXAr+UTAJbGTbOfspc
	lo7Zcl/hhE5Rduax65uE97efsfJnOMu7IebfpL8=
X-Google-Smtp-Source: AGHT+IH++udtn6rnwg7jTqLC0l6zaoHrTcxILOcRCJ+gQW+OK7iw7IAE7UA+Bin67m2U564hID0Hxg==
X-Received: by 2002:a05:600c:2254:b0:3fe:6199:939f with SMTP id a20-20020a05600c225400b003fe6199939fmr2290896wmm.33.1693410810395;
        Wed, 30 Aug 2023 08:53:30 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 2/4] x86/microcode: Ignore microcode loading interface for revision = -1
Date: Wed, 30 Aug 2023 16:53:24 +0100
Message-Id: <20230830155326.10199-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
References: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors report ~0 as the microcode revision to mean "don't issue
microcode updates". Ignore the microcode loading interface in that case.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v8:
  * Added missing newline in printk statement
  * Reduced indentation of second line of printk statement
  * Turned printk statement to INFO (because that's now the default)
---
 xen/arch/x86/cpu/microcode/core.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e5e03cad34..01f1dd4710 100644
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
+        printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
+               "rev = ~0");
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


