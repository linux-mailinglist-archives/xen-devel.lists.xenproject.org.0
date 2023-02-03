Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03A689FEE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 18:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489262.757631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVh-00036g-QV; Fri, 03 Feb 2023 17:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489262.757631; Fri, 03 Feb 2023 17:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVh-000342-MY; Fri, 03 Feb 2023 17:06:01 +0000
Received: by outflank-mailman (input) for mailman id 489262;
 Fri, 03 Feb 2023 17:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulaf=57=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pNzVg-0002ZN-A2
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 17:06:00 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0800783c-a3e5-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 18:05:59 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id r2so5229174wrv.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 09:05:59 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.104.21.nat.umts.dynamic.t-mobile.pl. [46.204.104.21])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d50d1000000b002bfe266d710sm2452191wrt.90.2023.02.03.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:05:58 -0800 (PST)
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
X-Inumbo-ID: 0800783c-a3e5-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhdHtq9aMzFDWYNNkoxwJc2rej7B4EmE4MDh7V6MGV8=;
        b=PrsImFx6GNwYGrDks8LK0i6j0eUxCe9uSTX/pH59vscdE4b4pQIKcQKwk5h9gEAs8d
         Zcu539lmdUrWAhQsfPF6A6FnZZIKe2m58J5KmXqX+om83BNeZq1jBg3ueeU0J4Kyhqv3
         LDX+SAkA6hHzZpBuOLqYYOVdzOeqSmNKtNovt3NXcSXLiK4pfPFQEOTxQumY4rPbkM27
         xUHj1a9K6U6ujGGWqIIOwMYXFG9DElZH74wkPcFD2hB3lel/xiMDdHwrxZS7NYFMD01M
         VOJJ8Dm4+/2ypPrtaCwRD8ek5LqOTluvEaUYa4LeKTs0C9vzzSidQR22u1hPY2SzQPBl
         ZR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhdHtq9aMzFDWYNNkoxwJc2rej7B4EmE4MDh7V6MGV8=;
        b=FUeUx7oWzi4e7RA2vgrhkj8eyNIQFg/HJQiiQ1zn7tT+24i12kath352c7aPJew8XU
         gz/Nxdyz23p26w5V4GjZ+r82TBhmh03+rXVElf7t7f/GrPbKu1YeGRgQ5tQSOYZO8cV2
         joSN024Tq3ABkBdVj8oIYlZhja+z5hAFC8YnRFD4rMwIvnjq9WnlgQcILsIENs23Y4M+
         eqyzk6VjuwPeBNWZGbuT2tcMhn+PBU4yp/kOebJR0r3SDRj7qJUKuOVZkFwdUlIsnRhY
         FQCyioVxPTeYRdseq5KIHF60rGDNXraoX3VZ11DE8urDQy9CfuVHfAHtGbmPHCsq1X9k
         FRmw==
X-Gm-Message-State: AO0yUKURYSb6HG7pf//Caxbb+sJIZwYfBoJ+F2z2GNOZxENHRoeJy2VZ
	wXWr/SIAR/WizwLwRlcfVe6k7+MLgyM=
X-Google-Smtp-Source: AK7set/DvDfuwgbw5Ws3sN7u/z0yuAmf14cwE4Zew3Zh9a4qOin0v9FihyMezT6NyK9hlQVeCQjT6w==
X-Received: by 2002:a5d:6309:0:b0:2c3:dc42:525d with SMTP id i9-20020a5d6309000000b002c3dc42525dmr152118wru.36.1675443958976;
        Fri, 03 Feb 2023 09:05:58 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 3/4] xen/x86: switch x86 to use generic implemetation of bug.h
Date: Fri,  3 Feb 2023 19:05:49 +0200
Message-Id: <b2f6ed2cd9f02c9f21b716595a158906499a22eb.1675441720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675441720.git.oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  2 +-
 xen/arch/x86/include/asm/asm_defns.h |  2 +-
 xen/arch/x86/include/asm/bug.h       | 32 ++--------------------------
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index c27cbb2304..18ff2a443b 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -27,6 +27,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/errno.h>
 #include <xen/delay.h>
@@ -35,7 +36,6 @@
 #include <xen/sched.h>
 #include <xen/timer.h>
 #include <xen/xmalloc.h>
-#include <asm/bug.h>
 #include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/processor.h>
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index d9431180cf..a8526cf36c 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -6,7 +6,7 @@
 /* NB. Auto-generated from arch/.../asm-offsets.c */
 #include <asm/asm-offsets.h>
 #endif
-#include <asm/bug.h>
+#include <xen/bug.h>
 #include <asm/x86-defns.h>
 #include <xen/stringify.h>
 #include <asm/cpufeature.h>
diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index b7265bdfbe..6ead21d9fe 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -1,19 +1,10 @@
 #ifndef __X86_BUG_H__
 #define __X86_BUG_H__
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
-
-#define BUGFRAME_run_fn 0
-#define BUGFRAME_warn   1
-#define BUGFRAME_bug    2
-#define BUGFRAME_assert 3
-
-#define BUGFRAME_NR     4
-
 #ifndef __ASSEMBLY__
 
+#define BUG_FRAME_STUFF
+
 struct bug_frame {
     signed int loc_disp:BUG_DISP_WIDTH;
     unsigned int line_hi:BUG_LINE_HI_WIDTH;
@@ -58,13 +49,6 @@ struct bug_frame {
                    :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
 } while (0)
 
-
-#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
-#define BUG() do {                                              \
-    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
-    unreachable();                                              \
-} while (0)
-
 /*
  * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
  * and use a real static inline here to get proper type checking of fn().
@@ -75,19 +59,7 @@ struct bug_frame {
         BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
     } while ( 0 )
 
-#define assert_failed(msg) do {                                 \
-    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
-    unreachable();                                              \
-} while (0)
-
-extern const struct bug_frame __start_bug_frames[],
-                              __stop_bug_frames_0[],
-                              __stop_bug_frames_1[],
-                              __stop_bug_frames_2[],
-                              __stop_bug_frames_3[];
-
 #else  /* !__ASSEMBLY__ */
-
 /*
  * Construct a bugframe, suitable for using in assembly code.  Should always
  * match the C version above.  One complication is having to stash the strings
-- 
2.39.0


