Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157BA9E173B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847534.1262651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6w-0005NS-I1; Tue, 03 Dec 2024 09:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847534.1262651; Tue, 03 Dec 2024 09:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6w-0005Is-EK; Tue, 03 Dec 2024 09:22:26 +0000
Received: by outflank-mailman (input) for mailman id 847534;
 Tue, 03 Dec 2024 09:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP6u-0003Be-Tf
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:24 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aff5178-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:22:24 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso749760466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:22:24 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d5646sm594152766b.62.2024.12.03.01.22.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:23 -0800 (PST)
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
X-Inumbo-ID: 1aff5178-b158-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217744; x=1733822544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PERYJEjYxWhdPat57HCXQqDRHV3hL1ijs4gpAo4T2SI=;
        b=OAPp2F7CGPnbKaxNH77iXorhXZARMk94mid2A7Vi+u3xwQfyqnUX7yKIyiKu+WbXSV
         9d2V/hZEq/uudkefH8QFhysyuA1AXMSHPU3/bKySLtlOj5psf2Zl84RXSaSM0HeRvAW9
         TWqqYWaCY4o6J4xAlhCozWy/nETadKT3yw2mIdSnLueBxtFbS8Es02PzK9M+UFybAeW0
         9zwbqNTTwdvpUicXWCkz5DmxjxGa2dXVbXihkpFtEjFT5kT3czax/Cy/cG1vzfDJWmav
         ulU3yXFDcCvecNpf5+Ey+/WSuw4MKnzUgX15oXzbbptIdrmaGrdVBp0C5Msfxae7mOGC
         Y/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217744; x=1733822544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PERYJEjYxWhdPat57HCXQqDRHV3hL1ijs4gpAo4T2SI=;
        b=vu1sD6pMYt/bQdL4t5C5mgThgT5LUJ9JbpViHNzEDDDrENtqhzRDW7Pdmb9FxcddrS
         Pi7ba6Knu4ah5ZWSIHX4h9ob9dqJG3/er6zdKCe5xxtfIt8NAIRg7wOqZIyWUx0revH7
         L+AZy28u7ltTMTUuAICyGiHwgRX2hQXu1FShi+bdQMjiBtO7ItrHKTFSc3u4H+G8zvhF
         Pw8Pp3j5bicbHays7qiK8bZVL/x9n/aZZ0NX7OD0Yty4wipb3MgmyUmfUTIU01I7Jset
         HgnscYvJoSPJbhqPgQcQmw3jWz183BpRTb2svl0OxiEwG4yh0K+K7eNCG5Jly5zUDm30
         OHvg==
X-Forwarded-Encrypted: i=1; AJvYcCUuP4SJznzeoHDM7t/PLY88junkOe4la8e4bSES/rZzXOO2PDnP9ylUM3FwllRdtOg//W5f41VUU5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYn2fewyGqjHirBg52hbZTcrDXoP3ACsQWrLsFXrmMnq5oLKki
	ZZzFKwSdHaKl1ir+8kwO1cRw478r2rg3FDkaouZMzkLRU2X+UZm5IDs3qQQCxCI=
X-Gm-Gg: ASbGncufnFMG9WW50iB4UNKuY0i/wAwJJPSS0g3kIwaQl7PQMRbS7xNlu2Im0/AVcpc
	S2W3ve9fnVWdgdzjsaGR/JB/IRjhlf0rkRu4laqXPU140f5LCJb04LarFqT2LMEBeRxPXfP9dmh
	u6lveScG1OStmO/Ws/1clkIbm3aAJ34CPxaV+XWinWCV5X61hocK00uNS/oR6rp/TsCa/+YNflz
	5d8KA78UsStiDpMyvwkjO/wnINIuCqp9HKfgj2YQAvzWdPfNUcc+duyltMnod8YuhRS7zMa
X-Google-Smtp-Source: AGHT+IG/10KRcSJmHbz27onCyU5ZPCzMEQmMKXxzXO8/y/6O5dpHc4TRW51Ux3lkFGHoBQyD1B/v6w==
X-Received: by 2002:a17:907:7623:b0:a9e:26ad:d0a with SMTP id a640c23a62f3a-aa5f7f18ec8mr118492466b.58.1733217743897;
        Tue, 03 Dec 2024 01:22:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/7] accel/tcg: Remove mentions of legacy '-machine foo,accel=bar'
Date: Tue,  3 Dec 2024 10:21:51 +0100
Message-ID: <20241203092153.60590-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

Update the documentation when TCG is referred to.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/removed-features.rst | 2 +-
 linux-user/s390x/target_proc.h  | 2 +-
 accel/tcg/monitor.c             | 4 ++--
 system/vl.c                     | 2 +-
 tests/qtest/qmp-cmd-test.c      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index ee6455aeeeb..d96dc5e80bc 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -216,7 +216,7 @@ The ``enforce-config-section`` property was replaced by the
 ``-no-kvm`` (removed in 5.2)
 ''''''''''''''''''''''''''''
 
-The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
+The ``-no-kvm`` argument was a synonym for setting ``-accel tcg``.
 
 ``-realtime`` (removed in 6.0)
 ''''''''''''''''''''''''''''''
diff --git a/linux-user/s390x/target_proc.h b/linux-user/s390x/target_proc.h
index a4a4821ea5c..f443d8f8080 100644
--- a/linux-user/s390x/target_proc.h
+++ b/linux-user/s390x/target_proc.h
@@ -7,7 +7,7 @@
 #define S390X_TARGET_PROC_H
 
 /*
- * Emulate what a Linux kernel running in qemu-system-s390x -M accel=tcg would
+ * Emulate what a Linux kernel running in 'qemu-system-s390x -accel tcg' would
  * show in /proc/cpuinfo.
  *
  * Skip the following in order to match the missing support in op_ecag():
diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index 093efe97144..0430b6e1514 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -204,7 +204,7 @@ HumanReadableText *qmp_x_query_jit(Error **errp)
     g_autoptr(GString) buf = g_string_new("");
 
     if (!tcg_enabled()) {
-        error_setg(errp, "JIT information is only available with accel=tcg");
+        error_setg(errp, "JIT information is only available with TCG");
         return NULL;
     }
 
@@ -226,7 +226,7 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
 
     if (!tcg_enabled()) {
         error_setg(errp,
-                   "Opcode count information is only available with accel=tcg");
+                   "Opcode count information is only available with TCG");
         return NULL;
     }
 
diff --git a/system/vl.c b/system/vl.c
index 54998fdbc7e..c056fcb740c 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2385,7 +2385,7 @@ static void configure_accelerators(const char *progname)
         for (tmp = accel_list; *tmp; tmp++) {
             /*
              * Filter invalid accelerators here, to prevent obscenities
-             * such as "-machine accel=tcg,,thread=single".
+             * such as "-accel tcg,,thread=single".
              */
             if (accel_find(*tmp)) {
                 qemu_opts_parse_noisily(qemu_find_opts("accel"), *tmp, true);
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 2c15f609584..83f4a2b451b 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -49,7 +49,7 @@ static int query_error_class(const char *cmd)
         { "query-vm-generation-id", ERROR_CLASS_GENERIC_ERROR },
         /* Only valid with a USB bus added */
         { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
-        /* Only valid with accel=tcg */
+        /* Only valid with TCG */
         { "x-query-jit", ERROR_CLASS_GENERIC_ERROR },
         { "x-query-opcount", ERROR_CLASS_GENERIC_ERROR },
         { "xen-event-list", ERROR_CLASS_GENERIC_ERROR },
-- 
2.45.2


