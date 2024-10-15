Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3599E0F7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 10:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819029.1232325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0cry-0003i0-MU; Tue, 15 Oct 2024 08:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819029.1232325; Tue, 15 Oct 2024 08:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0cry-0003ew-JI; Tue, 15 Oct 2024 08:25:30 +0000
Received: by outflank-mailman (input) for mailman id 819029;
 Tue, 15 Oct 2024 08:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tju4=RL=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0crx-0003em-65
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 08:25:29 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 080b3b3c-8acf-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 10:25:27 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c97cc83832so2270007a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 01:25:27 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29749663sm41590566b.64.2024.10.15.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 01:25:25 -0700 (PDT)
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
X-Inumbo-ID: 080b3b3c-8acf-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728980726; x=1729585526; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVfzz9tu1frx+8mGc1UmEwEmJdo4wen9lvWfIRZy8KE=;
        b=XztDqHtfMwHXOFbtWmQC0gVdte+4EmONZqY0I0yfX2TnpT1g1tR0QEKNHZTWZw4Wqs
         VIvBqVe7J60ZKfTxnxGLOpfIOP/ojqPbxdryLPfO2LOJV84nerfni1FVuaeTH0obzag+
         EMqKBAl/x2G6AATDTEfGmc1iXvURVc12gFF8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980726; x=1729585526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVfzz9tu1frx+8mGc1UmEwEmJdo4wen9lvWfIRZy8KE=;
        b=nX/vnWtotpVVisxtBxVENAjN+RiMuQqMm+cSjMGG3guaXwXXFnKpvGY9Ggs6VOYPTa
         /khcHKxjfz9h+SVYMLEXRf7yzteUnBKi4C3DC1vfGWTd8NFxy57LHJxmO4T6D7wJJXQL
         S0Z3zL6HJ6Xz+X3t4tzVp/XzUlaiJhDypvD1j/Z5V6yuaUQH+8VkNuSoiPFxKlytD3W8
         Goqn5UgFzkDWFESPy6arLwFJrp9jw5XX6i4aTyHHG0qxxBT77A2Q/pdGaFcjt7xDxxPY
         aoqmpA5htjJDYQqXwI51VsK4X0maWdeWIvJtoCaf+fnqwRAHBV3oHJHwuhVVzGgbkEqc
         zmPA==
X-Gm-Message-State: AOJu0YzCOPb/1vvirc5ojL0VX7A+KGXPQEmI7M3WBa82SmVCpNBDmJKU
	pk9x+bxFOlvToUt2nkfkw+0ExMK2mpUKsjMdMNi7L+pkUK4v9wpXnVzXRKSvjr6gk33/BvmzWtK
	R
X-Google-Smtp-Source: AGHT+IGKa81QccbMlNajkjv7kazsBkfOAArMnAM0d0M/FBsLRI3BmxYrhvk67/BP07W5olX5S0nv1g==
X-Received: by 2002:a17:907:2ce6:b0:a99:ff70:3abd with SMTP id a640c23a62f3a-a99ff703c38mr594417966b.31.1728980726242;
        Tue, 15 Oct 2024 01:25:26 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 2/2] x86/boot: Improve MBI2 structure check
Date: Tue, 15 Oct 2024 09:25:13 +0100
Message-Id: <20241015082513.2477806-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015082513.2477806-1-frediano.ziglio@cloud.com>
References: <20241015082513.2477806-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v6:
- compare against total_size every time to avoid overflows.

Changes since v7:
- check for tag type being MULTIBOOT2_TAG_TYPE_END before checking
  tag size. This allows caller to not fill full tag (type field is
  before size field).

Changes since v9:
- fixed tag order.
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


