Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62019852BE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 08:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803450.1214043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5a-0003gU-6x; Wed, 25 Sep 2024 06:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803450.1214043; Wed, 25 Sep 2024 06:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5a-0003dt-2W; Wed, 25 Sep 2024 06:01:26 +0000
Received: by outflank-mailman (input) for mailman id 803450;
 Wed, 25 Sep 2024 06:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N7N=QX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stL5Y-0002f5-On
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 06:01:24 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96c229ce-7b03-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 08:01:21 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so102347766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 23:01:21 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49de00sm1498937a12.55.2024.09.24.23.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 23:01:19 -0700 (PDT)
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
X-Inumbo-ID: 96c229ce-7b03-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727244080; x=1727848880; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxz4I4vyQGmSKY6Ub9yCNA7tMFmaRorNjlXLxFtjUc=;
        b=icRQhwcV9C7fgPmLZok0xPqhq5SFvUEVzCqtzXCwIs0Nuc6zQHmbBubgL3wqOrFZmn
         XMyMj+R3G93nTQgkvZ3/XnhByMbPl+j14zMWpIsFZRTFC7Hwsl6Tbc5GM859uvfDcJ0u
         4+8X7E59LLpn7bc0PTcSOf84CWd3U+yL/10wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727244080; x=1727848880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVxz4I4vyQGmSKY6Ub9yCNA7tMFmaRorNjlXLxFtjUc=;
        b=iNOM75fkBOFkbCchF2A5VsnzYBodMxdiww/ePrb4d08VCRDt4ci5I9iSqaY2EaTtzu
         9AvA88qVELfUNlUEj31Oq0FECOYJVT4tI2STHLFa0jqeW8kYMZDyZLzApfaNMs880PnO
         en07pzV2uCjnf3nksCn7MuxHH6nSmVV8VZixuwXN0d639/MrE3yaP1QYcTJQZoJ5irLR
         IOrwWefZtfSxxI7ro547DNx+9Fz3XPDSl429D6Y1xQCZqW2sQP8r7F+DZ4x+/82EpGx4
         woIydejcZUglH811925pAa+2/+tkI0U11v/LPIHSkyRh6Gh8QMSqWCpuY/DCYK3sjTHo
         rY6Q==
X-Gm-Message-State: AOJu0Yyi9RWiCwZUGZbVY8BWebFHKrGagalBfs/M4s8cElrQdbMOsAra
	SF4CWSVw1kyzE6N0y7D1KYonQ75XMrafyHMSvLrbULZ5vfjXMtdgevwaiaS5p1GvaYumAu/GQMt
	+
X-Google-Smtp-Source: AGHT+IGKaqBd9awEa1SGJvtToFN9ateo9a6+kddKbdn9a5nrY01jZMuIldAOnRilgdVuoUaZ6Ndk5w==
X-Received: by 2002:a17:907:9447:b0:a90:c4a0:9b17 with SMTP id a640c23a62f3a-a92c4810ee5mr641184766b.9.1727244080231;
        Tue, 24 Sep 2024 23:01:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 4/4] x86/boot: Improve MBI2 structure check
Date: Wed, 25 Sep 2024 07:01:01 +0100
Message-Id: <20240925060101.259244-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925060101.259244-1-frediano.ziglio@cloud.com>
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/efi/parse-mbi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
index 89c562cf6a..0b080dfa92 100644
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
 
-    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
+    for ( ; (const void *)(tag + 1) <= mbi_end
+            && tag->size >= sizeof(*tag)
+            && (const void *)tag + tag->size <= mbi_end
             && tag->type != MULTIBOOT2_TAG_TYPE_END;
           tag = _p(ROUNDUP((unsigned long)((const void *)tag + tag->size),
                    MULTIBOOT2_TAG_ALIGN)) )
-- 
2.34.1


