Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE29CAFB6EC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035648.1407992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnVF-0008NY-4o; Mon, 07 Jul 2025 15:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035648.1407992; Mon, 07 Jul 2025 15:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnVF-0008Lq-1u; Mon, 07 Jul 2025 15:11:33 +0000
Received: by outflank-mailman (input) for mailman id 1035648;
 Mon, 07 Jul 2025 15:11:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lsf8=ZU=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uYnVD-0008Lk-NV
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:11:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9326441-5b44-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 17:11:30 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4530921461aso22566295e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 08:11:30 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285e236sm10478588f8f.100.2025.07.07.08.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 08:11:29 -0700 (PDT)
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
X-Inumbo-ID: a9326441-5b44-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751901089; x=1752505889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iex8W48YLVKUkaQluIUUlIeUX5lZz42gBdKK/ZGvSFU=;
        b=KgFACa4GN7uM1lJG55Q+QI74c7CZqMIBudkriQI2oBpCW850SqHdiM3HdBglO1eyKx
         /WpMYVdJP/jydd3Zq7V4HTfLTaTTw2qvIeasYE7xox6l/g3UnZzMrSTblyJTFat6dFsF
         IZ9DSR+2bw/5ZpsK2N+LJRWzbSOjeraK66clg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901089; x=1752505889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iex8W48YLVKUkaQluIUUlIeUX5lZz42gBdKK/ZGvSFU=;
        b=fPzlb2IZyDa88KpQwRu2yzqbyuZmHYJpLvMF8DCD6aCwY9gxloQ2CgjW0YVyevwA+9
         HN5rjPdV0HgfOXyk9Ey+GXxa42K7MzS+acYsTH0URSH092yHs0H5ZEjK6CbkCXwmhgK1
         yYBqMnxhvq7MwbQ86frYBEInj8X/OrFinZSSd+64Vxm7z1vNu7YS7Lpdqzw37ZO5QR3y
         9K3NZ32++xLCmYKmeZPatFpkzch0/w8TxXT1BHNcdlNMRbr037QFn9DluwxNHd7FeiVu
         m6+dlJnbOojPrjV9/vjqpxfUYlRuEgJFr7yTwcTJdizi5ANOpriVs5eLReob/fM0zqEG
         qtdg==
X-Gm-Message-State: AOJu0Ywh63z7X5rNRX20IJmOPq3nJ8ZD6tNYfsLeFwdntwCqH8g8AR2d
	7e8YiCs1MlHuyNdANOT3lt3Rd2YNkcJmLRmQx7gbRTG5aQSlKWvTWrrCSCt2GIbmmAeisAD/rXq
	UCzkQQPRYeA==
X-Gm-Gg: ASbGncuLgi3qMt4er9FZ8ZohrkoseuFriFp2xUTN/aL3GN4V/197IZLkovSwl3xDI0y
	+DUTcxU7oVu/xTtPwVBWrQg3UquDbfcKk2BlwgzFX8xWZ0fDQb3+2fKyU+wML3C9WGFoFV+TTQX
	lcp1obdsKsT/AWm+XJUiY1ln3ba0nTPsmCDJgv7OPS92SZwK22JXw9+KaxbHX2GoR0UMmdDbnyP
	gU9G6yXuB6PmxRxPmiZkXaCLUZlxONGkojBiH3zrizOaEM0VoVGdQpGfyRyvP8pNVLSLhAR0eND
	FbTRnKFr+Wwrh9kIZ0cO1CbPN62R3HEKhhVZOddcCYggVnR1GIJFMYU0qKUmAsuWWLlNtztj053
	2KQqEA6P5XBlym6AaseAhL4/F2rbCXw==
X-Google-Smtp-Source: AGHT+IFLsCA81jD2qC5qAXFIYhvErg7TZEycubiVnpNV0rMHM2A0mUdTVP9jZ0gOTUUO/smD9/4Y5w==
X-Received: by 2002:a05:600c:a06:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-454bb7e777emr76737055e9.1.1751901089477;
        Mon, 07 Jul 2025 08:11:29 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/efi: Fix crash with initial empty EFI options
Date: Mon,  7 Jul 2025 16:11:19 +0100
Message-ID: <20250707151122.292272-1-frediano.ziglio@cloud.com>
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

Fixes: 201f261e859e ("EFI: move x86 boot/runtime code to common/efi")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9306dc8953..597252cfc4 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -345,6 +345,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
                                     VOID *data, UINTN size, UINTN *offset,
                                     CHAR16 **options)
 {
+    CHAR16 **const orig_argv = argv;
     CHAR16 *ptr = (CHAR16 *)(argv + argc + 1), *prev = NULL, *cmdline = NULL;
     bool prev_sep = true;
 
@@ -384,7 +385,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
                 {
                     cmdline = data + *offset;
                     /* Cater for the image name as first component. */
-                    ++argc;
+                    ++argv;
                 }
             }
         }
@@ -402,7 +403,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
         {
             if ( cur_sep )
                 ++ptr;
-            else if ( argv )
+            else if ( orig_argv )
             {
                 *ptr = *cmdline;
                 *++ptr = 0;
@@ -410,8 +411,8 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
         }
         else if ( !cur_sep )
         {
-            if ( !argv )
-                ++argc;
+            if ( !orig_argv )
+                ++argv;
             else if ( prev && wstrcmp(prev, L"--") == 0 )
             {
                 --argv;
@@ -428,9 +429,9 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
         }
         prev_sep = cur_sep;
     }
-    if ( argv )
+    if ( orig_argv )
         *argv = NULL;
-    return argc;
+    return argv - orig_argv;
 }
 
 static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_image,
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


