Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677F8ADF634
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 20:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019414.1396172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRxo4-0005W3-I0; Wed, 18 Jun 2025 18:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019414.1396172; Wed, 18 Jun 2025 18:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRxo4-0005Td-ES; Wed, 18 Jun 2025 18:46:44 +0000
Received: by outflank-mailman (input) for mailman id 1019414;
 Wed, 18 Jun 2025 18:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1LN=ZB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uRxo2-0005TX-Bw
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 18:46:42 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92b4bba5-4c74-11f0-a30b-13f23c93f187;
 Wed, 18 Jun 2025 20:46:41 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so80843765e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 11:46:41 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e97a908sm5006575e9.4.2025.06.18.11.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 11:46:39 -0700 (PDT)
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
X-Inumbo-ID: 92b4bba5-4c74-11f0-a30b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750272400; x=1750877200; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcqH3k8zjSFrQGMmoyr07/3rVkK+y+EfDXKcgz6xL+Q=;
        b=bT25kaTqfo8heRjloKlrz2HJC+p+x69HRQSQh+vs+Vb1xYVJCUm58NmP/jtlTZs0Wz
         cosAqxMLGj4Z1LfaJOYUowU1CjmY8vHMsxERLPwwiRXoqe4Q+zaFFKoazxwgd5rgtneB
         dB/U69av2arKuPCcaqGPGF/MBmRpEUceIyKKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750272400; x=1750877200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcqH3k8zjSFrQGMmoyr07/3rVkK+y+EfDXKcgz6xL+Q=;
        b=X1mqymSginC4EcI5Iaz2LoxJjDIKw9ESQflzQMz62KO4ZwRDReZGuM3xfGxyL6MsUv
         Hm/Z8EhqbMpG6QEKcYFivuSaPQj6YiEqgSqeX653cxUjE8nc5jzXbyH+8U7At2kCY1Zd
         ohd29Zv0HZ0kBdr1PE432/MrgR2HAwSGx6hB4sOtiDCS80SQR1QFIIYuMT/gTaPBIYaZ
         h+fD5nK+4VQ/zoy8JmJtdlRK43lyFlUo2twvFnoJQwRXnB5OPkB+oOrz2BYtlyrLpwLh
         Dvm2wkgD4WYpF3JTx88FjBU0hwiykw8uegKdSbc//JgeBmRLDmY2X0l0+KIn8AacwpoA
         uDqQ==
X-Gm-Message-State: AOJu0Yyubpsw8zMvW6SjhZsKeIfzwyiFKQ898Ad0OnfDjHlOe05jHZmN
	b4U7dTA5lGQXgbbOAeWpVFD4oDEYxNLozuetPus9iHO902+zPnA7rklGpyBQv63DYEFOH7sC8se
	1NyCY/aNKYg==
X-Gm-Gg: ASbGncsBjvlqmuq/xw9WppM4fvqx1N+pBWrNP/WCUb5iPo0I0gZ05VWBfMZuGVV0VkS
	e9We2MOc8gFOYw2bsfTxRPVeaDOtzfOfNPbyZ5cH93eOFUtGWpbMCf35jzsmUE1Lgm6DBz1yQyO
	CyVUo+C7mqgoQBhPmC/V27ZHb99hd71ibeZIk8o3kCvKqviiJEsL/FMiQq1jMnxEUKACZE6L50Y
	UA4+IvcXyR7JI8QxeBdiU+FodZV0GTQkpvXWBtfET8+rGsOIwyntvA0qQ+qAkrCdwROSP+SYL80
	SyBNVO8/CgRUANvzvDpmGLVROw1hi/1+RE0z2ND6KqCZB3sfjWhMP/BRejKuixZ015xDkiZtLuo
	27yAWyxZGyDahAyJpTjaOgmvEKe5rlw==
X-Google-Smtp-Source: AGHT+IEc/jZxYa+Aek0eFvpZ+XrPQ7Hx6SKGW7SUdJoiaO8ulO/MqOd3iQjmyJJJPIOMpURg0t2aXg==
X-Received: by 2002:a05:600c:5490:b0:453:8a6:d8de with SMTP id 5b1f17b1804b1-4533ca5e5a3mr153635145e9.1.1750272400286;
        Wed, 18 Jun 2025 11:46:40 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/efi: Do not check kernel signature if it was embedded
Date: Wed, 18 Jun 2025 19:46:28 +0100
Message-ID: <20250618184631.15489-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using UKI it's possible to embed Linux kernel into xen.efi file.
In this case the signature for Secure Boot is applied to the
whole xen.efi, including the kernel.
So checking for specific signature for the kernel is not
needed.
In case Secure Boot is not enabled there's no reason to check
kernel signature.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e39fbc3529..7077af3f5d 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1291,6 +1291,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
     bool base_video = false;
     const char *option_str;
     bool use_cfg_file;
+    bool kernel_was_verified = false;
     int dt_modules_found;
 
     __set_bit(EFI_BOOT, &efi_flags);
@@ -1461,6 +1462,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
         }
+        else
+        {
+            /*
+             * As kernel was embedded it was either verified for Secure Boot
+             * or Secure Boot is not enabled.
+             */
+            kernel_was_verified = true;
+        }
 
         if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
         {
@@ -1534,6 +1543,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
      * verify it.
      */
     if ( kernel.ptr &&
+         !kernel_was_verified &&
          !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
                                            (void **)&shim_lock)) &&
          (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
-- 
2.43.0


