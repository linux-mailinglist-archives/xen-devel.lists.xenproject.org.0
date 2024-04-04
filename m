Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E189853C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 12:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700804.1094498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsKXA-00017o-RI; Thu, 04 Apr 2024 10:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700804.1094498; Thu, 04 Apr 2024 10:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsKXA-00015N-OJ; Thu, 04 Apr 2024 10:41:28 +0000
Received: by outflank-mailman (input) for mailman id 700804;
 Thu, 04 Apr 2024 10:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxIL=LJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rsKX9-00015H-2b
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 10:41:27 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2dd6d4c-f26f-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 12:41:25 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516c116f480so982924e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 03:41:25 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 eg49-20020a05640228b100b0056e0a5e713bsm1660387edb.93.2024.04.04.03.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:41:23 -0700 (PDT)
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
X-Inumbo-ID: e2dd6d4c-f26f-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712227284; x=1712832084; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b856P1WpNjFZtoUruDU6tKHFRtenQoNRPl7rkOX9bvE=;
        b=c5PgRJxJdGl5licxoClpUSLTRPzmtUk9oXeyYj60qmcfvNVrspKi0rYS2HJcrMJoFq
         h2NGSXBKyFLxbxKwfSyaR0AQ+ZLVLHeKndRO1SicVEc3sFsyKfLiq1TG5H4BY9SBZPpA
         zufVRHY83QlOoaNicCT5YwccgXQIDnW81nLi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712227284; x=1712832084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b856P1WpNjFZtoUruDU6tKHFRtenQoNRPl7rkOX9bvE=;
        b=EUHvSAcZjtn38AMUfwGMzTj05w8C3/jQsV7QZTfJ/ap1BqeA8ZCDkteRvpt316rH5r
         fftg175ulg71Sr8ytkckvENdN+MjWj+sRtV+94O2uJ/DZoi1SW00Jww1b48HLhXE5N+g
         3DUi+78V23IyA/8UkjRib8vc2RusOWR6HSFvzQRVSY0MA08JeMMhsr6ToFqHX5hxOz0F
         P6p1cU6UyS78pboGc0SHfE+HbwATP+4W/zavGFPP/8Xp40FDCBv4Odeo9Qu/s4jfSujs
         4B8dyIYp3i1hKHPZkhS7CyamDmxa0FDUMokl1QqSYeWxdUpevrJ7v9BBR8rsya5C7PZL
         3DxQ==
X-Gm-Message-State: AOJu0YzAeUyWEu2LgWwnocrj1tofwHY2/0AJG2kj/lXeo0xmZzibmit2
	q3rnRS3Wp53NlJ3Du+g0l/iVRPllrOHHghSFm5t8r/x1noZj9BL4LPwtK153qmn4BcOdv4wPu05
	7038=
X-Google-Smtp-Source: AGHT+IEdjFRdHcK8RY8SyQS8zUsOxxbxqPy2qUUNJ0ovrzCSvgzIb55ex1BiV5Gj7oGNGgbF58j8Yg==
X-Received: by 2002:a05:6512:715:b0:515:8159:788d with SMTP id b21-20020a056512071500b005158159788dmr1311481lfs.64.1712227284327;
        Thu, 04 Apr 2024 03:41:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
Date: Thu,  4 Apr 2024 11:41:22 +0100
Message-Id: <20240404104122.2870129-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

In the meantime, I'll see if anyone at Intel knows what's going on.  Because
these parts are fully out of support now, it's very unlikely that we're going
to get a fix.
---
 xen/arch/x86/tsx.c | 55 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 50d8059f23a9..41bb39d10074 100644
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
+             *  - MSR_TSX_FORCE_ABORT is write-discard and fails to hold its
+             *    value.
+             *  - HLE and RTM are not enumerated, despite
+             *    MSR_TSX_FORCE_ABORT.TSX_CPUID_CLEAR being clear.
+             *
+             * Spot this case, and treat it as if no TSX is available at all.
+             * This will prevent Xen from thinking it's safe to offer HLE/RTM
+             * to VMs.
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
+                goto done_setup;
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
+ done_setup:
 
     /*
      * Note: MSR_TSX_CTRL is enumerated on TSX-enabled MDS_NO and later parts.

base-commit: 6117179dd99958e4ef2687617d12c9b15bdbae24
-- 
2.30.2


