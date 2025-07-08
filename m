Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC5AFCCC9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036596.1408851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8or-0004mC-BF; Tue, 08 Jul 2025 13:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036596.1408851; Tue, 08 Jul 2025 13:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8or-0004jn-8U; Tue, 08 Jul 2025 13:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1036596;
 Tue, 08 Jul 2025 13:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tCx0=ZV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uZ8oq-0004jh-BQ
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:57:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f482c87-5c03-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 15:57:07 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so4182114f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:57:07 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cff6537fsm14157625e9.1.2025.07.08.06.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 06:57:05 -0700 (PDT)
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
X-Inumbo-ID: 6f482c87-5c03-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751983026; x=1752587826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHqelC2ugsK9OXtmmNGhyV5xfAqvmqJ19CD9Pav7gYw=;
        b=EgSB97whRojO3PFJtAAAY7OU+g02h5C35G3DRM34fnYbvLorHEY+6mPoN8WIdfKw60
         sUDqDyNPpSP7ab8P9ZjuqrRxXIgWi09qUM1DqpCqTnZKlPQcySZe3CNrpGysa2xouW11
         WQZi3GDsrE7CLEb75kn0vpo6JzRqFNcma6ZHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983026; x=1752587826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHqelC2ugsK9OXtmmNGhyV5xfAqvmqJ19CD9Pav7gYw=;
        b=kGC6xzuNPARdJiZkjLLru6uthKYMkOwOgky6wDC10hZat7IPewgjdCf2ixLrq5hQCR
         uODtcdniQQn7Jx0C+IG/YbeMgLIKqzDKsQ3Gv3O5bg0k46/5w+OV65GkjGEpCmBYozhV
         +eMlWl6yM8Z2bVKvqMx7k7z283LfbwTDnWQ486MCeI5sX99uWkixOJOKOLLfTG1MUEet
         4h+LL9gZvsI0wwV6+XjlOj2HahXh3gyyp6aipYT4v8Fxdd6Lj3QLfprXBrhGZfjPiOcA
         6rMtTklSu6byByL/jDYUFSA+jbJEYSHOHmXWurAMMszi9UKMRoqdlDCJmnaEbTSH/sse
         09Sw==
X-Gm-Message-State: AOJu0YwP5xyenFTQuRrUUel0QduNykh3GaUBS+IJleCw8KlCfnKxMv0m
	mt/xt23M4xfsr5t4XK3kgTmoG9IG3kV+PHHFXV8KjttWH6x6FpnkkOFwtNgRPy5CrC2Bo9Zf3ai
	M05uo3mflfQ==
X-Gm-Gg: ASbGncu+WQ8dsKPjRl5sAeYrGPTCI/YI1zGKrgpXY0WyS/80nTVQo3bd1M2bc5akqpy
	JUjrrXZYXmb3q2NBB2KQHklxP8H2HrP3HBD6G6LIDbQX4jMjg/2XRxAaFhQuR9WsPa0yiJVEpoo
	0u+TLLsHpWWQOi8RLugx1M4Xqo11uHUQ9E/WA5+J6mURHdU9KawaaJXjGxIKV7WYcGPcabmVBVO
	Li01yn3qqwOJawIPqdd9LABx+7JeQOZgtMzwhF7KeSdE6XpALlZlY9dH/9daGrz7R60JqK6F5fm
	5XEjZBv30Z8J+dxr38DtaGxmCdLpT2k8NAcllOLdITx3b0ySQs0PtNvr7ede6TRASMpG5e3q/Au
	vuyBy9CL4U29L2BKrIlTlSdDTI1d1Ig==
X-Google-Smtp-Source: AGHT+IGXPSao5JcCSSyvzCpkku6bwd76vxUNTxksm1S8FGL6SyEfULLesw8037aAt8Lwhf57gjEsVw==
X-Received: by 2002:a05:6000:2209:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3b5ddebd1a4mr2906286f8f.46.1751983026272;
        Tue, 08 Jul 2025 06:57:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
Date: Tue,  8 Jul 2025 14:56:58 +0100
Message-ID: <20250708135701.119601-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EFI code path split options from EFI LoadOptions fields in 2
pieces, first EFI options, second Xen options.
"get_argv" function is called first to get the number of arguments
in the LoadOptions, second, after allocating enough space, to
fill some "argc"/"argv" variable. However the first parsing could
be different from second as second is able to detect "--" argument
separator. So it was possible that "argc" was bigger that the "argv"
array leading to potential buffer overflows, in particular
a string like "-- a b c" would lead to buffer overflow in "argv"
resulting in crashes.
Using EFI shell is possible to pass any kind of string in
LoadOptions.

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- use argc to make code more clear;
- fix commit reference;
- improve commit message.
---
 xen/common/efi/boot.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9306dc8953..385292ad4e 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -350,10 +350,11 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
 
     if ( argc )
     {
+        argc = 0;
         cmdline = data + *offset;
         /* EFI_LOAD_OPTION does not supply an image name as first component. */
         if ( *offset )
-            *argv++ = NULL;
+            argv[argc++] = NULL;
     }
     else if ( size > sizeof(*cmdline) && !(size % sizeof(*cmdline)) &&
               (wmemchr(data, 0, size / sizeof(*cmdline)) ==
@@ -414,14 +415,14 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
                 ++argc;
             else if ( prev && wstrcmp(prev, L"--") == 0 )
             {
-                --argv;
+                --argc;
                 if ( options )
                     *options = cmdline;
                 break;
             }
             else
             {
-                *argv++ = prev = ptr;
+                argv[argc++] = prev = ptr;
                 *ptr = *cmdline;
                 *++ptr = 0;
             }
@@ -429,7 +430,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
         prev_sep = cur_sep;
     }
     if ( argv )
-        *argv = NULL;
+        argv[argc] = NULL;
     return argc;
 }
 
@@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                                   (argc + 1) * sizeof(*argv) +
                                       loaded_image->LoadOptionsSize,
                                   (void **)&argv) == EFI_SUCCESS )
-            get_argv(argc, argv, loaded_image->LoadOptions,
-                     loaded_image->LoadOptionsSize, &offset, &options);
+            argc = get_argv(argc, argv, loaded_image->LoadOptions,
+                            loaded_image->LoadOptionsSize, &offset, &options);
         else
             argc = 0;
         for ( i = 1; i < argc; ++i )
-- 
2.43.0


