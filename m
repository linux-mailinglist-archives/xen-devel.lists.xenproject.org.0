Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B566B3BB32
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 14:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101255.1454391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ury87-0000Fo-KV; Fri, 29 Aug 2025 12:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101255.1454391; Fri, 29 Aug 2025 12:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ury87-0000DZ-Hq; Fri, 29 Aug 2025 12:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1101255;
 Fri, 29 Aug 2025 12:22:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XizV=3J=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ury86-0000DR-2V
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 12:22:54 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2768d52-84d2-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 14:22:52 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3cf991e8b6aso513315f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 05:22:52 -0700 (PDT)
Received: from localhost.localdomain ([87.114.69.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276c8eccsm3162592f8f.20.2025.08.29.05.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 05:22:51 -0700 (PDT)
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
X-Inumbo-ID: e2768d52-84d2-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1756470172; x=1757074972; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxYQWD/IYD06xn30QuL9NtG24dkpw0BsAHkuY9APozY=;
        b=KsCELrMTWL+14lFc644867tAmDsQnxrCtP0sgd28EwcZRM700uTd3q8VDhjQZG1JTK
         gtONC4I9uL6coRjM7MbN+GpTyAmprW4EKrQA7dYHi8Uk9650At0Rca8BY5SuAoGgNPBr
         4yE3MPQoqHaYsIloGZorGgj8ln1DDUiSj9HoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756470172; x=1757074972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxYQWD/IYD06xn30QuL9NtG24dkpw0BsAHkuY9APozY=;
        b=d9cbRLEkonh8T9h2cSBtv62dZkS66G+EBOJAkFykiS3+NiAHxcZMFS33OzyGS+YZ5S
         3LVV4+OCH7kkP6Y37Jl87DZZbO0zmJNHbg+nMD9+Jh3LiiC/7f14x1TfwZBQH6JpqzLX
         Ytg1XD8Oeq4ZFA0SolYoKIKVxlQq0q9NrNiFqev4YXYNuNAVRjv/o+vkBLPYcaMVUNaT
         vD7Liex67xp1ABYYKSp8t5PGchHlT7f2OV2VQyvxqzMNrU7Wv7mo7Q3ODsi/G2H0yMBg
         QbLpuMTWPo/IcS5xViKyVGZrHllApozenMJhdA/UzxgcnD1QdSQdhprgMhlsSRkH9tz7
         kIfg==
X-Gm-Message-State: AOJu0YzrWLKd4AXD3Nl1vQUXkz92b4bPTtk5nW6VqEmeU3iqjy+XzB8K
	astMRyri+9++AK5BVxPcxRihBXIzOQ3eycKAVInL5aKUYxIrAGzBSX/XfIK+ITRn7LfReXDQE87
	BPCPORP8=
X-Gm-Gg: ASbGncs3EmJkr+bCyjAj0yJPV0fVNlx2O4LRKQzuXMsVeQ4AajIvknIf3FfGukSwXED
	xhV9lBRX9xX3EyZYctTy1PIlB3asj1wLjvHWJBfRd5Qsj5gwA59KHndDxpt+ndwwNmO+6mKB6Rf
	E4F9Ag+q8a3pQ5NYKC3mlbraVuIanb0FH1dEYBhU25bhK7SjDyG8HNmY+6vqMmQPJdPfJtfmej+
	JJkVVdmzbAOGnZ50Jhs1YESE813KcbgxxLWxGoGST7KwktxQoe0qtu8mS9EvfjFLt/7WAV504h7
	wTHx/VTAn/wJjf9wDbM2q/3wbLtFkoUx2/OZvWe3HFTU0qOmyNxnVsscNBE/CIhRNRWDMVVI6jU
	9sq/tqii9DkiPc9yHLtc+a2vh+PtEOv2Rs7GcFY+Vkw==
X-Google-Smtp-Source: AGHT+IEn4n66DU6nGbw029Mvex8z0e9NOO8zlPOY1L6pkdpdFt9THmLMvCDOJiadaPwZOfyccIWhPg==
X-Received: by 2002:a05:6000:2882:b0:3b8:d16a:a4a5 with SMTP id ffacd0b85a97d-3c5d7ac658emr18223671f8f.0.1756470171663;
        Fri, 29 Aug 2025 05:22:51 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] xen/efi: Fix crash with initial empty EFI options
Date: Fri, 29 Aug 2025 13:22:26 +0100
Message-ID: <20250829122227.43023-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

EFI code path split options from EFI LoadOptions fields in 2
pieces, first EFI options, second Xen options.
"get_argv" function is called first to get the number of arguments
in the LoadOptions, second, after allocating enough space, to
fill some "argc"/"argv" variable. However the first parsing could
be different from second as second is able to detect "--" argument
separator. So it was possible that "argc" was bigger than the
initialized portion of "argv" array, leading to potential
uninitialized pointer dereference, in particular a string like
"-- a b c" would lead to crashes.
Using EFI shell is possible to pass any kind of string in
LoadOptions.

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes since v2:
- updated commit message
- added Reviewed-by line

Changes since v1:
- use argc to make code more clear;
- fix commit reference;
- improve commit message.
---
 xen/common/efi/boot.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b7fdb031d0..e12fa1a7ec 100644
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
 
@@ -1355,8 +1356,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
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


