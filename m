Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A41928D7B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 20:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754479.1162938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPnaa-0006w2-Ol; Fri, 05 Jul 2024 18:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754479.1162938; Fri, 05 Jul 2024 18:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPnaa-0006rG-M0; Fri, 05 Jul 2024 18:23:20 +0000
Received: by outflank-mailman (input) for mailman id 754479;
 Fri, 05 Jul 2024 18:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPnaZ-0006of-7K
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 18:23:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a71c3c14-3afb-11ef-bbfb-fd08da9f4363;
 Fri, 05 Jul 2024 20:23:18 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f3f9so2598661a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 11:23:18 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58f9d3f11ffsm1084696a12.67.2024.07.05.11.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 11:23:15 -0700 (PDT)
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
X-Inumbo-ID: a71c3c14-3afb-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720203797; x=1720808597; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIylfhAbepjTkMUCr/P9og/lT2rzth5HYxn+smuFSr0=;
        b=qfYUzcDRuCml6rY07VUbDNwYc6alFbhTAb9TzJ1r5oYJcd/baBzk4eYtZsPX81ktoM
         qmpUuon3ITbuWKXFY3tIpsTgjtd5ucTefOSktJdN99pBCnNLu6SMYT7W2xiwdJtnxZMW
         KSjieB4yc+ckovwh4OyCz+bSpN9KwBicw3zmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720203797; x=1720808597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIylfhAbepjTkMUCr/P9og/lT2rzth5HYxn+smuFSr0=;
        b=CPdPu0cbTmTDoPrmV/Z1RInsiKcphFJoj6TmMdD2bCpX36AHwiQaEw/xo+qpS6LcTo
         Fo+zSd652IYL0PGXTpswEgmtFAi9D0HgtJclW+n1sUBqgEolzVl4kc3BFcfdst3z6uWx
         YQOqAz4kutR0VD0WV//f5VsEEN/uEQQp9PaHmbbIO5x6LpQx+hKkSICfZDmShFOdj3pN
         X718jAy6oXy6xbbb85Ahy3ZwNkDCWo/V7fqW/gHQF7FkGs1NOQ1fNfUQRATSJFaFXkhi
         TIj9GvpG5yK+X3QRHgAhg17nEUZWCFmgcZTt3blDzZs6zyyDVrCLvRv19btPWf8GS2nf
         GcTQ==
X-Gm-Message-State: AOJu0YyDhfm0Xhj6DuFHx5A+SX2Poba3J4Z22Wi6ZtRW//e/DWXUm+Jq
	CttLhJxHNK2F2VO0kCZ34TaJQTl8hYtf7wNVme7Oiw1XhEDjaAoyP26PDHHgTicvXAeeAbWWN9R
	k
X-Google-Smtp-Source: AGHT+IFYsCFTQiwmGYeg5rzqqahJ2noyRC/8ErATorfKxPdrffVkEorQorfllpz+Zudf4bVSyHNwcA==
X-Received: by 2002:aa7:d5d6:0:b0:579:e7c5:1001 with SMTP id 4fb4d7f45d1cf-58e5b3ab677mr2859518a12.23.1720203797383;
        Fri, 05 Jul 2024 11:23:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 1/2] xen/shutdown: Fix build issue with shutdown.h on PPC
Date: Fri,  5 Jul 2024 19:23:10 +0100
Message-Id: <20240705182311.1968790-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705182311.1968790-1-andrew.cooper3@citrix.com>
References: <20240705182311.1968790-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of bool needs xen/types.h, which shutdown.h picks up by chance in all
other architectures.

While fixing this, swap u8 for unsigned char in hwdom_shutdown(), and move
opt_noreboot into __ro_after_init.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/shutdown.c      | 4 ++--
 xen/include/xen/shutdown.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index 5f8141edc6b2..cb9c830bbc1d 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -11,7 +11,7 @@
 #include <public/sched.h>
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
-bool __read_mostly opt_noreboot;
+bool __ro_after_init opt_noreboot;
 boolean_param("noreboot", opt_noreboot);
 
 static void noreturn reboot_or_halt(void)
@@ -29,7 +29,7 @@ static void noreturn reboot_or_halt(void)
     }
 }
 
-void hwdom_shutdown(u8 reason)
+void hwdom_shutdown(unsigned char reason)
 {
     switch ( reason )
     {
diff --git a/xen/include/xen/shutdown.h b/xen/include/xen/shutdown.h
index 668aed0be580..c7fa23aec1fe 100644
--- a/xen/include/xen/shutdown.h
+++ b/xen/include/xen/shutdown.h
@@ -2,11 +2,12 @@
 #define __XEN_SHUTDOWN_H__
 
 #include <xen/compiler.h>
+#include <xen/types.h>
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
 extern bool opt_noreboot;
 
-void noreturn hwdom_shutdown(u8 reason);
+void noreturn hwdom_shutdown(unsigned char reason);
 
 void noreturn machine_restart(unsigned int delay_millisecs);
 void noreturn machine_halt(void);
-- 
2.39.2


