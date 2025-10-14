Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B7BD98D4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 15:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142788.1476714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ejv-0006Qx-Ex; Tue, 14 Oct 2025 13:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142788.1476714; Tue, 14 Oct 2025 13:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ejv-0006P3-CB; Tue, 14 Oct 2025 13:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1142788;
 Tue, 14 Oct 2025 13:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xUX=4X=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v8ejt-0006Ox-I8
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 13:06:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6d1deeb-a8fe-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 15:06:52 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so42966745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 06:06:52 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49c3e49sm238835695e9.16.2025.10.14.06.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 06:06:51 -0700 (PDT)
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
X-Inumbo-ID: a6d1deeb-a8fe-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760447211; x=1761052011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFSmz0jo8S6OUUUQXmXesAUdqUQlqtsfHm8XtU8aum0=;
        b=JCC3kTOhEshj1foEUzMrUJSZSbdFN2JPaMZmeN+bo5jrnaXQ3i64mV43a4kPbb022m
         hb8p7/Lhi0m7B8r2//XH3uTIMF+7XCj7YvkrEMLbxshPcC/jUoHpIuz/FaYz6CJvlnmf
         zp/spTuHlsWiJsBS8BBvG7RhknYlFz9uBHiI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760447211; x=1761052011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFSmz0jo8S6OUUUQXmXesAUdqUQlqtsfHm8XtU8aum0=;
        b=QcUx/J7mLn3bnEFAkp3tUiyu2B7cNdiFcppTHlus+2n8CBV7NNXV2788KuwgAzSoM6
         ZTpPp6LLJXh4i70eu9lGzrumVuS8idkowdx9fluj48QIRwIlWyw9uwnG+M5O3Cq5LI+u
         zY/xwI8FADZbnfFDON39hEHfonUJzKeOwOovEIswBx/oDgoODEwSjXZagtpQABs0lMiu
         +luSJ/02SQ0HpNGnDZGhMXtQLLCkCJL2CYhBCozGQ+jQa6LxQT01qRIO/NlOHWS3sXi5
         iYTOh9pPWmEokfbPxKdCvw2+HqpIfoDCIyfO9ZIy4O5GRBdcj3ScX2sdzSYUgrrzJa3Z
         eQQw==
X-Gm-Message-State: AOJu0Yyi2Gj31Vdu/iveVjcoEphGemYUTEQBi0yUF8f2d957WdMUyOh9
	SN4Eq76wf4SrJ3YVAxKqdV/r3i2kvYsARXUuneYa2heieHabIj+w3urtW+JOQvsqi/pFeMJdyBf
	RFp9EcsD8pw==
X-Gm-Gg: ASbGncu8clPwY6FmD6qK3zgGnBCHfiFPchGN9cwwCIKVlSi3467paQY1GhSD9vNoerV
	L/yZcfThSwj9IQYfjQkH+9kSyZHLm4JYEkObKzO82i4JqG+CaE5hCrF62abx6WNy4Pfv6ZUZaBU
	c9jsqEgXTXs7VVuqYpleSKT6MnrvmEo+K313USJUvxqvKPPc1SDbo1BrfBuNg9PTdbBP3euLWJx
	9nMXvYp2GX4NN3T7DcawMTahilCOxTKSEFzd8dtrUCYMVH3MynyQO5aAgHr6oM/YXfNOPU3O7c0
	VjbGIbhvrHJ3AygiaF473qmNOAMBLrhAzBeOBFcwba/cpTceEiFeLk+S7NnEAI66qa6FXByVmrz
	LZ8T8WbzyQQrFGJQuHXVYpC9TNyTEXzESGz8edstOPgPbcLdOXdqCt0L2L48j4fo8MUKoQc/mPx
	fXpHZU788WyHYUDKtbVBNLOw==
X-Google-Smtp-Source: AGHT+IHmlXQbjzgs5ATTnQ3K4D7CW70EKfEIqjDdnvR/EeBzWU3lox0ECpq9YGPgdbmoZ4+yYusSnQ==
X-Received: by 2002:a05:600c:3b11:b0:46e:4c7c:515c with SMTP id 5b1f17b1804b1-46fa9b182e2mr207040165e9.34.1760447211546;
        Tue, 14 Oct 2025 06:06:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21 v2] efi: Protect against unnecessary image unloading
Date: Tue, 14 Oct 2025 14:06:48 +0100
Message-Id: <20251014130648.2540082-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>

Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
image after loading it (for verification purposes) regardless of the
returned status. The protocol API implies this is the correct behaviour
but we should add a check to protect against the unlikely case this
frees any memory in use.

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Gerald is OoO and time is tight on Xen 4.21, so I've picked the patch up.

Oleksii: This addresses follow-on feedback for a new feature in Xen 4.21, so
really does want fixing before the release.  I forgot to put it on the
tracking list, sorry.

v2:
 * Apply feedback as Marek wants it.
---
 xen/common/efi/boot.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5b84dbf26e5e..3a78e7571a5e 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1062,7 +1062,7 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
     static EFI_GUID __initdata shim_image_guid = SHIM_IMAGE_LOADER_GUID;
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     SHIM_IMAGE_LOADER *shim_loader;
-    EFI_HANDLE loaded_kernel;
+    EFI_HANDLE loaded_kernel = NULL;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_STATUS status;
     bool verified = false;
@@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
             verified = true;
 
         /*
-         * Always unload the image.  We only needed LoadImage() to perform
-         * verification anyway, and in the case of a failure there may still
-         * be cleanup needing to be performed.
+         * If the kernel was loaded, unload it. We only needed LoadImage() to
+         * perform verification anyway, and in the case of a failure there may
+         * still be cleanup needing to be performed.
          */
-        shim_loader->UnloadImage(loaded_kernel);
+        if ( !EFI_ERROR(status) || (status == EFI_SECURITY_VIOLATION) )
+            shim_loader->UnloadImage(loaded_kernel);
     }
 
     /* Otherwise, fall back to SHIM_LOCK. */

base-commit: 53859596c0d34dbca776ec1e47bac8dd90552530
-- 
2.39.5


