Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F5986C05
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 07:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804855.1215849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sth3Z-0005Ur-Jx; Thu, 26 Sep 2024 05:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804855.1215849; Thu, 26 Sep 2024 05:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sth3Z-0005PG-Fe; Thu, 26 Sep 2024 05:28:49 +0000
Received: by outflank-mailman (input) for mailman id 804855;
 Thu, 26 Sep 2024 05:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sth3X-0004tb-Vu
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 05:28:47 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 339cb1b5-7bc8-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 07:28:46 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so74315866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 22:28:46 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34086sm304441766b.41.2024.09.25.22.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 22:28:45 -0700 (PDT)
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
X-Inumbo-ID: 339cb1b5-7bc8-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727328525; x=1727933325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zv+yM3lvTRJQIA1+ZYdW3e6DFoAUNOBXydVMy3hCsps=;
        b=Tl11MasvqyMEEVNu2Zy0hY094Do6YAepu5afUC+fhRr8wLp01qMpaHaj1/Cea5XEkn
         +2DhGVBqy9RYSPP4Typ4mdywdA5i3HXINv+Xb/kX7BnCWSHZ0w7N8lDgia2BemGslwFu
         4Sax9WsHt2IwAUi3c+Ht4csndLoSf9JcOHZQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727328525; x=1727933325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zv+yM3lvTRJQIA1+ZYdW3e6DFoAUNOBXydVMy3hCsps=;
        b=sAgjK4XnPKOHov4DBGBgaUA6UCDmfqk74l+CKCRtM6Af+oYKDNjlNE+NlOqOL2OL6T
         ZkJoH/al6DRS0kd0vvkY1+gKYjpnZDShVJU/rVKlsvDGXhl2ccw+Lrt+GIsaOMCZ6eoM
         zrpQk5speOkeD0u9eJb3sDrS4O8PyQuLgqHrvnSfZHQ9QvY/M6K9J48lzsozmyBUycxx
         4yzQ7i2NVoRCuuExCeUuLPjmf69SZJ3mIAz92OkyClnLOY6tMnZuKL4bZmOo0962E2HN
         eOxaqUk5c+f6+9xCCYeve0HfB4lp2FK0OuFWPi1X7mFMtO+UwQo6HOqnkV8z3R1/cvEf
         /YoA==
X-Gm-Message-State: AOJu0Yw27xLLdBSB9y3jBidu1vVaHKJBvYvnXbYhsySaxZE1aXDjQrQH
	YVkH1vDp5J5Q9UaRwuMTIK78IwFum4GRXkOuqbUvkVZJ6I83UN24RL1TULGsiXQoV+RC5aZMBcm
	d
X-Google-Smtp-Source: AGHT+IGRWvTIxwDndToohXT5/azuh8J00Iya3wCj9TRYs6htW4NXGQDVi8fUAR+9R1599m1g32Qn9g==
X-Received: by 2002:a17:907:9411:b0:a8a:809b:14ed with SMTP id a640c23a62f3a-a93a0646977mr393119466b.44.1727328525560;
        Wed, 25 Sep 2024 22:28:45 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 3/3] x86/boot: Improve MBI2 structure check
Date: Thu, 26 Sep 2024 06:28:33 +0100
Message-Id: <20240926052833.465510-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926052833.465510-1-frediano.ziglio@cloud.com>
References: <20240926052833.465510-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/efi/parse-mbi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
index 55a1777483..cae26d5e10 100644
--- a/xen/arch/x86/efi/parse-mbi2.c
+++ b/xen/arch/x86/efi/parse-mbi2.c
@@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
     EFI_HANDLE ImageHandle = NULL;
     EFI_SYSTEM_TABLE *SystemTable = NULL;
     const char *cmdline = NULL;
+    const void *const mbi_end = (const void *)mbi + mbi->total_size;
     bool have_bs = false;
 
     if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
@@ -21,7 +22,9 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
     /* Skip Multiboot2 information fixed part. */
     tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
 
-    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
+    for ( ; (const void *)(tag + 1) <= mbi_end &&
+            tag->size >= sizeof(*tag) &&
+            (const void *)tag + tag->size <= mbi_end &&
             tag->type != MULTIBOOT2_TAG_TYPE_END;
           tag = _p(ROUNDUP((unsigned long)tag + tag->size,
                    MULTIBOOT2_TAG_ALIGN)) )
-- 
2.34.1


