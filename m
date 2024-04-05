Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AC7899E00
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 15:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701294.1095649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjI0-0008Bl-Si; Fri, 05 Apr 2024 13:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701294.1095649; Fri, 05 Apr 2024 13:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjI0-0008A5-Ph; Fri, 05 Apr 2024 13:07:28 +0000
Received: by outflank-mailman (input) for mailman id 701294;
 Fri, 05 Apr 2024 13:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1z4c=LK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rsjHz-00089z-6W
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 13:07:27 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72356863-f34d-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 15:07:25 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e2b41187aso1588533a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 06:07:25 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m15-20020aa7c48f000000b0056b0af78d80sm786548edq.34.2024.04.05.06.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 06:07:23 -0700 (PDT)
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
X-Inumbo-ID: 72356863-f34d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712322444; x=1712927244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDPCDEA5I1+AdfHV/LcG5zOSYt6ak6Ppa2QlTQ1bR4U=;
        b=jLUmw7f+rOQTrn8EscybpJ2yaonVVw+0b0ztGq0iKS1iISdfhlMQQuCXv2DRs12ct2
         OT6T+MrqVCCmcpRT0/p+dviksagE4NKMW9ccdoedAfhHgRdma3G2IYQKjm/mOibD0KUq
         uC4zUYTwnfdT7zloK/j2olJl95HvkZC6l7u3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322444; x=1712927244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDPCDEA5I1+AdfHV/LcG5zOSYt6ak6Ppa2QlTQ1bR4U=;
        b=HDX+nHbaOdX3gw0p98j7WQQcelummUQjKqBrTN55szSIaBPhCn7c8RJJ1nKHCQnJlW
         Z8BOzBeEckmkzYeSmBYO5MJr5YIiH0tYZxE+cbSsJZnHSSQdRZegieQYMhksC0EXXnHz
         pHjr6HBH37oV+NIpCEiUnsQCt2HDbgH4QymB9DQ3fh8rBINp50Hh+LMqdn+bhXwMkU7X
         jnhEi2SB/60naA9LqBavKsaWtbvEyfkD4XGSrVFdijpK4EGd6xui87qiHieK5TC/XyUr
         6SEh+v1BZcKn4MU9DSC66qdyoR6YxGwgqpNdpieVIavyniNw4pSr3dhuDmFZSXnmVLKG
         FGpA==
X-Gm-Message-State: AOJu0Yy1B0fS/CE6aluUbd5fGZ+pA7j/YxNEQPEtRlw5WzSvpDxx/+v3
	1dfa2AvcF+zF6eE4fo8FxRlYyxuFkbBWjp8yk6Att1j+YHVBUhelQsjT0w7uhMqf7pyfsoTFyAV
	5Y8Q=
X-Google-Smtp-Source: AGHT+IGwPJICHcV+EabkFYzUEm9ZTYYZCRlnFA3FEVLABABPG+qrMaJk7yrekXEXKFUG+ty85HgDJw==
X-Received: by 2002:a05:6402:3716:b0:56d:c757:9379 with SMTP id ek22-20020a056402371600b0056dc7579379mr2649306edb.15.1712322444223;
        Fri, 05 Apr 2024 06:07:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
Date: Fri,  5 Apr 2024 14:07:22 +0100
Message-Id: <20240405130722.2891221-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Zg1stUacaDBkyDOn@mail-itl>
References: <Zg1stUacaDBkyDOn@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It turns out there is something wonky on some but not all CPUs with
MSR_TSX_FORCE_ABORT.  The presence of RTM_ALWAYS_ABORT causes Xen to think
it's safe to offer HLE/RTM to guests, but in this case, XBEGIN instructions
genuinely #UD.

Spot this case and try to back out as cleanly as we can.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2:
 * Adjust wording.
---
 xen/arch/x86/tsx.c | 55 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 50d8059f23a9..fbdd05971c8b 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -1,5 +1,6 @@
 #include <xen/init.h>
 #include <xen/param.h>
+#include <asm/microcode.h>
 #include <asm/msr.h>
 
 /*
@@ -9,6 +10,7 @@
  *  -1 => Default, altered to 0/1 (if unspecified) by:
  *                 - TAA heuristics/settings for speculative safety
  *                 - "TSX vs PCR3" select for TSX memory ordering safety
+ *  -2 => Implicit tsx=0 (from RTM_ALWAYS_ABORT vs RTM mismatch)
  *  -3 => Implicit tsx=1 (feed-through from spec-ctrl=0)
  *
  * This is arranged such that the bottom bit encodes whether TSX is actually
@@ -114,11 +116,50 @@ void tsx_init(void)
 
         if ( cpu_has_tsx_force_abort )
         {
+            uint64_t val;
+
             /*
-             * On an early TSX-enable Skylake part subject to the memory
+             * On an early TSX-enabled Skylake part subject to the memory
              * ordering erratum, with at least the March 2019 microcode.
              */
 
+            rdmsrl(MSR_TSX_FORCE_ABORT, val);
+
+            /*
+             * At the time of writing (April 2024), it was discovered that
+             * some parts (e.g. CoffeeLake 8th Gen, 06-9e-0a, ucode 0xf6)
+             * advertise RTM_ALWAYS_ABORT, but XBEGIN instructions #UD.  Other
+             * similar parts (e.g. KabyLake Xeon-E3, 06-9e-09, ucode 0xf8)
+             * operate as expected.
+             *
+             * In this case:
+             *  - RTM_ALWAYS_ABORT and MSR_TSX_FORCE_ABORT are enumerated.
+             *  - XBEGIN instructions genuinely #UD.
+             *  - MSR_TSX_FORCE_ABORT appears to be write-discard and fails to
+             *    hold its value.
+             *  - HLE and RTM are not enumerated, despite
+             *    MSR_TSX_FORCE_ABORT.TSX_CPUID_CLEAR being clear.
+             *
+             * Spot RTM being unavailable without CLEAR_CPUID being set, and
+             * treat it as if no TSX is available at all.  This will prevent
+             * Xen from thinking it's safe to offer HLE/RTM to VMs.
+             */
+            if ( val == 0 && cpu_has_rtm_always_abort && !cpu_has_rtm )
+            {
+                printk(XENLOG_ERR
+                       "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",
+                       boot_cpu_data.x86, boot_cpu_data.x86_model,
+                       boot_cpu_data.x86_mask, this_cpu(cpu_sig).rev);
+
+                setup_clear_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
+                setup_clear_cpu_cap(X86_FEATURE_TSX_FORCE_ABORT);
+
+                if ( opt_tsx < 0 )
+                    opt_tsx = -2;
+
+                goto done_probe;
+            }
+
             /*
              * Probe for the June 2021 microcode which de-features TSX on
              * client parts.  (Note - this is a subset of parts impacted by
@@ -128,15 +169,8 @@ void tsx_init(void)
              * read as zero if TSX_FORCE_ABORT.ENABLE_RTM has been set before
              * we run.
              */
-            if ( !has_rtm_always_abort )
-            {
-                uint64_t val;
-
-                rdmsrl(MSR_TSX_FORCE_ABORT, val);
-
-                if ( val & TSX_ENABLE_RTM )
-                    has_rtm_always_abort = true;
-            }
+            if ( val & TSX_ENABLE_RTM )
+                has_rtm_always_abort = true;
 
             /*
              * If no explicit tsx= option is provided, pick a default.
@@ -191,6 +225,7 @@ void tsx_init(void)
             setup_force_cpu_cap(X86_FEATURE_RTM);
         }
     }
+ done_probe:
 
     /*
      * Note: MSR_TSX_CTRL is enumerated on TSX-enabled MDS_NO and later parts.

base-commit: 270588b9b2b751b0bb6b36f4853cb13005e4706f
-- 
2.30.2


