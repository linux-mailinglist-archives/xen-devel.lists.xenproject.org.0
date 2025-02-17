Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C173A38CA4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 20:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890812.1299945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72c-0005aQ-8V; Mon, 17 Feb 2025 19:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890812.1299945; Mon, 17 Feb 2025 19:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72c-0005XI-5G; Mon, 17 Feb 2025 19:44:30 +0000
Received: by outflank-mailman (input) for mailman id 890812;
 Mon, 17 Feb 2025 19:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk72a-0005X7-M3
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 19:44:28 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985421e8-ed67-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 20:44:26 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43962f7b0e4so28820075e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 11:44:26 -0800 (PST)
Received: from andrewcoop.. (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06d22csm161547025e9.22.2025.02.17.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:44:25 -0800 (PST)
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
X-Inumbo-ID: 985421e8-ed67-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739821466; x=1740426266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CN5/qCk+SO0dX8OyCK46+nuUpSM22Pu0EYMaFmXRRY=;
        b=fm1WlqaFl+htvDrjeFEYj7H8MRbVV6KzMtW/PuiVlIBRmwkEUbkIvn8fuIekNpoAvP
         Fbby+wS4ucAxXPSCtHz1exhPKkvaxaAnlhQ/WBx5MfZPljobKXwTI4lvOpwzy+1+Lyvo
         12AwjcJtA0SzJ0OZen+uimGWp1SBZRz0UTVWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821466; x=1740426266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CN5/qCk+SO0dX8OyCK46+nuUpSM22Pu0EYMaFmXRRY=;
        b=Gp05G3nRALk+0npin39FrEHmSyMutrU7650LCtCr2O+Cg+crhuTSyV1MT40oGk9zY8
         v8MSOqW0jdsuockRK6sEhdBg7Iv+ow1yj/22g37FyHaDtQK6sQLPUos8RnBEsVcNOAu1
         6VT4/7+bh2xIDcup3QuAgdm9Gxo5s4abXVLyJIkjb1jjCh1PZ/0UxEXVYG8y0Mwml0t4
         czB+TmOPOKuzXQzUo46cOurJx23SaOlyPp5X7LmQwr9jXb10GHhcEzMuF7vMWpoBCaqG
         WZjMpm7LgAMf4rYriKCIcuK3RekSwLaF8NWS4zTkAejr/thh2Q7lCJy70nyEgsNoITpz
         /o4A==
X-Gm-Message-State: AOJu0YxZfhGu01jaPAIQ+wiUXQrDnh5mieSi3gnJpcv5/VLSJfCGDW55
	Gd8S0toD3oA+kGiiTCfjkkSTgM1+RjeFDepYyAOJ8zIUgzfXl/7DMNDiVdxW3yzud7CLuZ6V4jp
	a
X-Gm-Gg: ASbGnctPsVK8/AJKUCn1WbK4uW2Tv3ufdyZjyTcrIgvygxzsNqW93RU+uwys+NjU3sH
	7ZCJkEHDxZ/WAbct5ltIqD5hpCDFbHQGjBf6hD/9QNIeJTU65WpetJCVCysq/+BFheO5lqAtqHY
	of9RVTTNEqBeMLfTR0XAwsLdR5iPe4BYoewC+EPkbg4l1RWmMmuA63jCxJLi0vnxmyHgvoOiCue
	whGXwYOqUn0PMIB1m1HU0WlvQaUwqp4GajW4qUTE1UYtYwI7+KlZbCmX/ho7QX6cOPpPyO58MTR
	N+aPcCvExuY/jcComnvIdNPuh3mW0lv7osyligqD1BYzmtkNUC0c
X-Google-Smtp-Source: AGHT+IF8HqJOJt9V5Kn9NLXie7ZsAgvaU8cmCgSKkWj6WqzngR/dStu1tFuLNCDZWB5gTZIgLH0tFQ==
X-Received: by 2002:a05:600c:5487:b0:439:8a8c:d3d8 with SMTP id 5b1f17b1804b1-4398a8cd568mr31235075e9.29.1739821465597;
        Mon, 17 Feb 2025 11:44:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20(?) 1/3] xen/console: Fix truncation of panic() messages
Date: Mon, 17 Feb 2025 19:44:19 +0000
Message-Id: <20250217194421.601813-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217194421.601813-1-andrew.cooper3@citrix.com>
References: <20250217194421.601813-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The panic() function uses a static buffer to format its arguments into, simply
to emit the result via printk("%s", buf).  This buffer is not large enough for
some existing users in Xen.  e.g.:

  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Invalid device tree blob at physical address 0x46a00000.
  (XEN) The DTB must be 8-byte aligned and must not exceed 2 MB in size.
  (XEN)
  (XEN) Plea****************************************

The remainder of this particular message is 'e check your bootloader.', but
has been inherited by RISC-V from ARM.

It is also pointless double buffering.  Implement vprintk() beside printk(),
and use it directly rather than rendering into a local buffer, removing it as
one source of message limitation.

This marginally simplifies panic(), and drops a global used-once buffer.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This taken from a security series (hence partially reviewed already), and
thought it only applied to a forthcoming selftest, but then Ayan posted a
truncated example to Matrix.

Therefore this needs backporting, and might be wanted for 4.20 at this point.
It's low risk and easy to test.
---
 xen/drivers/char/console.c | 21 +++++++++++++--------
 xen/include/xen/lib.h      |  2 ++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f3b..2926c97df9a4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -962,11 +962,17 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
     local_irq_restore(flags);
 }
 
+void vprintk(const char *fmt, va_list args)
+{
+    vprintk_common("(XEN) ", fmt, args);
+}
+
 void printk(const char *fmt, ...)
 {
     va_list args;
+
     va_start(args, fmt);
-    vprintk_common("(XEN) ", fmt, args);
+    vprintk(fmt, args);
     va_end(args);
 }
 
@@ -1268,23 +1274,22 @@ void panic(const char *fmt, ...)
     va_list args;
     unsigned long flags;
     static DEFINE_SPINLOCK(lock);
-    static char buf[128];
 
     spin_debug_disable();
     spinlock_profile_printall('\0');
     debugtrace_dump();
 
-    /* Protects buf[] and ensure multi-line message prints atomically. */
+    /* Ensure multi-line message prints atomically. */
     spin_lock_irqsave(&lock, flags);
 
-    va_start(args, fmt);
-    (void)vsnprintf(buf, sizeof(buf), fmt, args);
-    va_end(args);
-
     console_start_sync();
     printk("\n****************************************\n");
     printk("Panic on CPU %d:\n", smp_processor_id());
-    printk("%s", buf);
+
+    va_start(args, fmt);
+    vprintk(fmt, args);
+    va_end(args);
+
     printk("****************************************\n\n");
     if ( opt_noreboot )
         printk("Manual reset required ('noreboot' specified)\n");
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 81b722ea3e80..130f96791f75 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -60,6 +60,8 @@ debugtrace_printk(const char *fmt, ...) {}
 
 extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2), cold));
+void vprintk(const char *fmt, va_list args)
+    __attribute__ ((format (printf, 1, 0), cold));
 
 #define printk_once(fmt, args...)               \
 ({                                              \
-- 
2.39.5


