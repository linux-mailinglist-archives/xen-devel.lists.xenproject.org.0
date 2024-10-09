Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD89961CC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813818.1226878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRgp-0004j3-AA; Wed, 09 Oct 2024 08:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813818.1226878; Wed, 09 Oct 2024 08:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRgp-0004gZ-6H; Wed, 09 Oct 2024 08:04:59 +0000
Received: by outflank-mailman (input) for mailman id 813818;
 Wed, 09 Oct 2024 08:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLvJ=RF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syRgn-0004Bs-Lm
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:04:57 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c7bea15-8615-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 10:04:57 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9950d27234so456976066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:04:57 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7856bfsm624370366b.138.2024.10.09.01.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:04:55 -0700 (PDT)
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
X-Inumbo-ID: 2c7bea15-8615-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728461096; x=1729065896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zZ3wGBySbXmRtfmFQfFr7wFwdfciZzlXfjXPqq0IY4=;
        b=AmqjSA14peDLULBAsUEv10rvDQbnzAqnFD89+kjJNVCgZi8eEDM6+PnbqzotP8WVPC
         NuOZKJCi8bqgDCn2yw+2QSem95gsxoEnqJ0cMnva0hh8vZYBohvMxt7qCReylu3hJoeg
         hxMRabGyt8+S6cGrV9jXUookddw8CmRliBV3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728461096; x=1729065896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zZ3wGBySbXmRtfmFQfFr7wFwdfciZzlXfjXPqq0IY4=;
        b=M1PdhPwUVV0XM4tUBt21lzG3ygnuNTT/aroJs2Hz9e+Y84zclkPW4FJpugsFOh+6ix
         KxK7NmbByePCvGemtMHFSWpjYJhMAr8XnDgCiiHwRQV3/M2IlFKoiufyt1OfBnViJSGA
         GaxYyI1hw5U2Q3iP0lfd95E9yEq0tCPeo9cUBf0F1FZPbK3nWYEfMUXkOhSo68NvDRuA
         mh/L01mFaVAE4gT4bCQJLqucw3Ce8so7h6FEJaP6tVKZd41Kjp2xUdgdKI6SAvO15oZ5
         ccTSJ+rhXfk7k7zVYqreVAh8mj7kwYCB9wDRzKQau8Cb7d5TKK/3cLdOwnd2hHitluBm
         8aGA==
X-Gm-Message-State: AOJu0Yw0cUhsJhGV2CQlwJ1KWhDgLhJgE8zFSr0Z5Ds7ZR6NfcaLhZHV
	K3t2DzUibUZfqoATuRcYdedccYw0uix/nhZUpw8Vqw0t+tt/YtyAu2J+vRwyCWX7ygFew9AEYUI
	I
X-Google-Smtp-Source: AGHT+IF60C0IUYkjP4YU4uNeiKMgmzNm8zNbYv9vfb52kCfxP9XStTkqXGkjyWjGt1GeaE9tNy/Caw==
X-Received: by 2002:a17:907:1c96:b0:a99:6a5a:bab with SMTP id a640c23a62f3a-a998d252ef3mr114619966b.39.1728461096317;
        Wed, 09 Oct 2024 01:04:56 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 2/2] x86/boot: Improve MBI2 structure check
Date: Wed,  9 Oct 2024 09:04:39 +0100
Message-Id: <20241009080439.2411730-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
References: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

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


