Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432029B2B2D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826295.1240508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu0-0005r0-U4; Mon, 28 Oct 2024 09:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826295.1240508; Mon, 28 Oct 2024 09:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu0-0005p4-Qr; Mon, 28 Oct 2024 09:19:08 +0000
Received: by outflank-mailman (input) for mailman id 826295;
 Mon, 28 Oct 2024 09:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Ltz-0005MP-9c
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae750aa8-950d-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 10:19:06 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c95a962c2bso5078113a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:06 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:04 -0700 (PDT)
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
X-Inumbo-ID: ae750aa8-950d-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107145; x=1730711945; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MqNUkwecighwf5ZEZecpwf+J1DakAlBwf9uooe4i8Q=;
        b=R+0EG1Iz2Bv+mCOOj/zP225x2HUDJb5XSfacmOG70pXO56IT6FV/cLqucT1oHqMrmc
         +edG3SknidfsK5xi0DQB6K5y/btBgXFqUtjIMXzfssadWruNLyZKqfQEw/Kv5WOWLxs0
         9KEW9moedmof1C0vwJS6HZMxdZF3VyPNXliuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107145; x=1730711945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MqNUkwecighwf5ZEZecpwf+J1DakAlBwf9uooe4i8Q=;
        b=VyFK/oJ0mGnTDy7BKryy3WOFyvUMIYWcz6LfL5VPp0M5tWHysSSonhLlsFuchXEZ7M
         0Pq1fC5kvFtWzqyb1j/+Kl9GBkEgJqSoIkf5pJx9RWFNBeC1rPqInSbpJ5B7gFmNiaY4
         rVS2AdTMhfuVtPhPBULTMOqZHv68z4FVI2NRCJgBl5KScrxnBIDrth0sWdwPOZkqVV9/
         I5FfRosTYsWg569wvPlU/pIVYIDOC0NJ3PYmIQ5dR+1BkMKG3YI6XZ72zj4gBjPLYmn3
         SupSJM69CKz6EZOkiED2/m31F1WOci7UW9Xo8HmbaZfL1xSAEU/2jTlSuEwkCUd2Ljjw
         OMig==
X-Gm-Message-State: AOJu0YzkCz8EEkkpuLHArwJbKK8QKrQpORitkJWmCghLQs4v4ljpcqmP
	F0aqFH6kEoHuBnQC1auKdBba0OGEoFqX3NpFRAPbR1tp6DaWtd1GFWAmzsZgiJ5UbpimNhLTb6h
	M
X-Google-Smtp-Source: AGHT+IH5tcFhm3dopPSqg6B3iTWtDz1h4rBWC3w9u+K5IL4SIE7v2kpqaJ0KZfV49ENmGsyWmEA79Q==
X-Received: by 2002:a17:907:e87:b0:a99:5cd5:5b9c with SMTP id a640c23a62f3a-a9de5ee1155mr665254766b.36.1730107145339;
        Mon, 28 Oct 2024 02:19:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 03/10] x86/ucode: Break early_microcode_load() out of early_microcode_init()
Date: Mon, 28 Oct 2024 09:18:49 +0000
Message-Id: <20241028091856.2151603-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

microcode_grab_module() and early_microcode_update_cpu() are logically one
task that passes state via static variables.

We intend to delete said static variables, so start by moving these functions
out of early_microcode_init().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 3e815f1880af..d13f8338e4e6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -854,6 +854,22 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch, 0);
 }
 
+/*
+ * There are several tasks:
+ * - Locate the ucode blob in the boot modules.
+ * - Parse and attempt in-place load.
+ * - Inform microcode_init_cache() of how to find the blob again.
+ */
+static int __init early_microcode_load(struct boot_info *bi)
+{
+    microcode_grab_module(bi);
+
+    if ( !ucode_mod.mod_end && !ucode_blob.size )
+        return 0;
+
+    return early_microcode_update_cpu();
+}
+
 int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
@@ -897,10 +913,7 @@ int __init early_microcode_init(struct boot_info *bi)
         return -ENODEV;
     }
 
-    microcode_grab_module(bi);
-
-    if ( ucode_mod.mod_end || ucode_blob.size )
-        rc = early_microcode_update_cpu();
+    rc = early_microcode_load(bi);
 
     /*
      * Some CPUID leaves and MSRs are only present after microcode updates
-- 
2.39.5


