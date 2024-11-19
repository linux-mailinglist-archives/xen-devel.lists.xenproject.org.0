Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A389A9D3030
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 22:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840822.1256348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDWDo-0001G4-LH; Tue, 19 Nov 2024 21:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840822.1256348; Tue, 19 Nov 2024 21:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDWDo-0001ES-IO; Tue, 19 Nov 2024 21:57:20 +0000
Received: by outflank-mailman (input) for mailman id 840822;
 Tue, 19 Nov 2024 21:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDWDn-0001EM-3g
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 21:57:19 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3adda19a-a6c1-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 22:57:12 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa1e51ce601so689298966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 13:57:12 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0452a0sm692540766b.148.2024.11.19.13.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 13:57:10 -0800 (PST)
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
X-Inumbo-ID: 3adda19a-a6c1-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNhZGRhMTlhLWE2YzEtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDUzNDMyLjAxNzAzOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732053431; x=1732658231; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDB4Q6Fpgs0F21zxVvvrfRkRmnN4g+9lC2tT8CV1vyQ=;
        b=XGCOG2cYs9ZYHmMMi+vTljIRSB6Mh+rJZvvUec/sLRK5IH4OpEbINloDF+f5Z4uH1U
         QSCCPiwRGUIcV9xYA0hSXdNmh86Huz/J8H2GTgQiGCmMZYfs4hfYI6YdvHYjQtLzeNgl
         F1NyJL3GcR/8c+IxxFRxGHAMYjyghdOnr3E+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732053431; x=1732658231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDB4Q6Fpgs0F21zxVvvrfRkRmnN4g+9lC2tT8CV1vyQ=;
        b=Mz7ld/vsHD17FoO2OcElckJX+V1ovc+eabGWQpYLM/ZTBYPAHM4ohIMsvdxeZINic3
         +6kfuCf3mH/g76NG0SHgPhlQDRqN5kEKkLMt3x3tIatJFvH2+nFhwtpiR0h5O1718EC1
         1r7ap9cFzbKF1NyA/uOJBa9isu82ZzTEvED41dougUhEQAj+AKnK/McqaWkT8nfp4DNM
         WmHEI98OGw+CR3VDWOaNBZCz5/IvZDSNNEFL3VTTbpvcQ2cQNluEOBU8clm6P5tf0H9q
         QsFT0K5m4uNvBq/mvYhpiSC22ki2vUpIIut/zp/ddcSaFHLemwBlHkvmoi5cFxGwWNg9
         KQ7g==
X-Gm-Message-State: AOJu0YwalT3jFtcYUeN5lqZTU705Nyrx4sAsLOXO3jJaTJx9eZQr4aYr
	49hECGqiIhrCpzcHTP+Obz2swe58TEzxOhFyVlQjMBoIUHnwxYnhZ84EZWWstQJOlO38u10FCA+
	L
X-Google-Smtp-Source: AGHT+IEjIZPq/OqvZ+iC2d0lNSRTQ4NUy7LgaI6WLw1gR552jXEfGS/4eWq8ypIewZVkYC3c/sfeCA==
X-Received: by 2002:a17:907:dac:b0:a99:8a5c:a357 with SMTP id a640c23a62f3a-aa4dd766d81mr39252266b.58.1732053430999;
        Tue, 19 Nov 2024 13:57:10 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] x86/boot: Load microcode much earlier on boot
Date: Tue, 19 Nov 2024 21:57:08 +0000
Message-Id: <20241119215708.2890691-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following commit cd7cc5320bb2 ("x86/boot: add start and size fields to struct
boot_module"), bootstrap_map*() works as soon as boot_info is populated.

Resolve the todo, and move microcode loading to be the eariest action after
establishing a console.

A sample boot now looks like:

  (XEN) Xen version 4.20-unstable (andrew@eng.citrite.net) (gcc (Debian 12.2.0-14) 12.2.0) debug=y Tue Nov 19 21:44:46 GMT 2024
  (XEN) Latest ChangeSet: Wed Dec 6 21:54:55 2023 git:1ab612848a23
  (XEN) build-id: 52fe616d1b3a2a2cb44775815507d02cca73315d
  (XEN) CPU Vendor: AMD, Family 25 (0x19), Model 1 (0x1), Stepping 1 (raw 00a00f11)
  (XEN) BSP microcode revision: 0x0a001137
  (XEN) microcode: CPU0 updated from revision 0xa001137 to 0xa0011d7, date = 2024-09-06
  (XEN) Bootloader: GRUB 2.06

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1239e91b83b0..d8661d7ca699 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1160,6 +1160,13 @@ void asmlinkage __init noreturn __start_xen(void)
     xhci_dbc_uart_init();
     console_init_preirq();
 
+    /*
+     * Try to load microcode as early as possible, although wait until after
+     * configuring the console(s).
+     */
+    early_cpu_init(true);
+    early_microcode_init(bi);
+
     if ( pvh_boot )
         pvh_print_info();
 
@@ -1312,9 +1319,6 @@ void asmlinkage __init noreturn __start_xen(void)
     else
         panic("Bootloader provided no memory information\n");
 
-    /* This must come before e820 code because it sets paddr_bits. */
-    early_cpu_init(true);
-
     /* Choose shadow stack early, to set infrastructure up appropriately. */
     if ( !boot_cpu_has(X86_FEATURE_CET_SS) )
         opt_xen_shstk = 0;
@@ -1416,12 +1420,6 @@ void asmlinkage __init noreturn __start_xen(void)
         if ( bi->mods[i].start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
 
-    /*
-     * TODO: load ucode earlier once multiboot modules become accessible
-     * at an earlier stage.
-     */
-    early_microcode_init(bi);
-
     if ( xen_phys_start )
     {
         struct boot_module *xen = &bi->mods[bi->nr_modules];
-- 
2.39.5


