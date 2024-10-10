Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0C9982B0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 11:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815895.1230130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypjo-00041L-OF; Thu, 10 Oct 2024 09:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815895.1230130; Thu, 10 Oct 2024 09:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypjo-0003xO-Kk; Thu, 10 Oct 2024 09:45:40 +0000
Received: by outflank-mailman (input) for mailman id 815895;
 Thu, 10 Oct 2024 09:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sypjn-0003rE-Dn
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 09:45:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6778b3db-86ec-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 11:45:37 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9944c4d5d4so106023666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 02:45:37 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dcf0dsm64513266b.175.2024.10.10.02.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 02:45:36 -0700 (PDT)
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
X-Inumbo-ID: 6778b3db-86ec-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728553537; x=1729158337; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxiY7HJDcWw9szQujq2OSXUnYmKhKkJqdPaufkFtzms=;
        b=ijQg7ejLS4JccZ1C2jD8tfppdA4GxIJhS6mjPanmV/ymU36J/9x/I1Y1tttHd67+93
         VSFxdIkM2Jl1gg9kyQkWNwotIoS/GF1K5JQKIy1wmRWb/NVcalSiKzrbh1UXmj/dUamY
         rAzv2swDlqseT5SNsVrZ3s7blf3ha3fAmrilg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553537; x=1729158337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxiY7HJDcWw9szQujq2OSXUnYmKhKkJqdPaufkFtzms=;
        b=O9jujpnWO4p3L+iJ+oBhdHwxkqLqF/3u0AzrCbgy6Zviqso4+aSpjrfR00PYTOM6SZ
         xAPwZHsemwZyaW5bNy6pSXSlzcbQhAkLbqCpibYECcwczco3IUpSsP0X8DF7qG2BlqEP
         N9Q7UcSQo6Wrh8xO7fYEZ9x0ajB0kTcHnUEq6A6MH461q1z8n53YkDVmkVvFEpU35EyG
         zPQTdeeDV7DzdFn/AJhV3OPbD9BgoZz1vpD9MKf4rWfsqeK4/a9v/MkjkTJsqka61uaB
         YnY+xUk+CjgQqIcXTtY7eKrvp8CpERdTgJeejVkXyFqko3b4oQIF8wGvzkWjB6e7vQAV
         BOpQ==
X-Gm-Message-State: AOJu0YxLr0EcYY8QQ8BuUZ5asXJd27cC8CO2kWscdGOjXYehNKdnewmJ
	kYBZBNBYVKhfP3WPXiln6LADxfUs9laqWpOjoEV64iF7IYV4xGuUeyYNot8q2LD7WHLyw6FDo4/
	r
X-Google-Smtp-Source: AGHT+IErFf/rLgsssczD7bQqSqOxaRQcIiytGlo5I/JIoadnlGjMAZ/eUpI49JDiuoN7o5m25YKDPg==
X-Received: by 2002:a17:907:7e97:b0:a99:408c:6a16 with SMTP id a640c23a62f3a-a998d10ba72mr474573866b.12.1728553537075;
        Thu, 10 Oct 2024 02:45:37 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 2/2] x86/boot: Improve MBI2 structure check
Date: Thu, 10 Oct 2024 10:45:24 +0100
Message-Id: <20241010094524.1836495-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010094524.1836495-1-frediano.ziglio@cloud.com>
References: <20241010094524.1836495-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v6:
- compare against total_size every time to avoid overflows.

Changes since v7:
- check for tag type being MULTIBOOT2_TAG_TYPE_END before checking
  tag size. This allows caller to not fill full tag (type field is
  before size field).
---
 xen/arch/x86/efi/mbi2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/efi/mbi2.c b/xen/arch/x86/efi/mbi2.c
index 55a1777483..d2f0f0ee61 100644
--- a/xen/arch/x86/efi/mbi2.c
+++ b/xen/arch/x86/efi/mbi2.c
@@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
     EFI_HANDLE ImageHandle = NULL;
     EFI_SYSTEM_TABLE *SystemTable = NULL;
     const char *cmdline = NULL;
+    const void *const mbi_raw = (const void *)mbi;
     bool have_bs = false;
 
     if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
@@ -21,8 +22,10 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
     /* Skip Multiboot2 information fixed part. */
     tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
 
-    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
-            tag->type != MULTIBOOT2_TAG_TYPE_END;
+    for ( ; (const void *)(tag + 1) - mbi_raw <= mbi->total_size &&
+            tag->type != MULTIBOOT2_TAG_TYPE_END &&
+            tag->size >= sizeof(*tag) &&
+            (const void *)tag + tag->size - mbi_raw <= mbi->total_size;
           tag = _p(ROUNDUP((unsigned long)tag + tag->size,
                    MULTIBOOT2_TAG_ALIGN)) )
     {
-- 
2.34.1


