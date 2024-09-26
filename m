Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF49986FEA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805090.1216134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkgd-0002St-Tl; Thu, 26 Sep 2024 09:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805090.1216134; Thu, 26 Sep 2024 09:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkgd-0002Px-PP; Thu, 26 Sep 2024 09:21:23 +0000
Received: by outflank-mailman (input) for mailman id 805090;
 Thu, 26 Sep 2024 09:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stkgc-0001w1-9I
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:21:22 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1c98281-7be8-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 11:21:21 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so317897166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 02:21:21 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f5485asm325846666b.88.2024.09.26.02.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 02:21:20 -0700 (PDT)
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
X-Inumbo-ID: b1c98281-7be8-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727342481; x=1727947281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zv+yM3lvTRJQIA1+ZYdW3e6DFoAUNOBXydVMy3hCsps=;
        b=WJE9Lm6vf3DfZDNo3BuHquUd0Y+swMlK4cNVkk9QM8YOw7k+0cGZoWmMgKVFAwJU7k
         hBCq0hmwC2ntUJBXBXcDaN7qBPWxbxXMPQ6MEI5/DBcdEvVj8/OIB2VbMf8IBTIxsY2F
         9HNvAQOY4bAVoOIFW8R5c5NEkEUwUqLkT119s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727342481; x=1727947281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zv+yM3lvTRJQIA1+ZYdW3e6DFoAUNOBXydVMy3hCsps=;
        b=JPpx7Pr0CPPk2ptydDpvmwwBtcKjFzoJM8ehw6aGX3gBYLn2PvrMer8aHBZCZLusbB
         +heWVMgFb3prUemkgOdThDxELfvxYk4p2Q5ht3cgFglMG3eXoDL57VBnqlTXkJ3YDCWL
         5jmzffkcrUFwe95ljJ7LxPvHOAIugfEJh/ZERyGCKZp6CxxZNh2vdk5hU8icEkVBDBDd
         XJZoQiH4mtwtAwGqCSLc9zaPexCthKkb3tiqXqID4/UyjO3u8tKotGf90C4TiYpqW5X9
         sDtVgGCDR5vwxzpKzUZ72Y0ncoYZDjpW3IrpawCev3sF3Wr1/xyMgRg18LXyI3WIRGaW
         5L2g==
X-Gm-Message-State: AOJu0YxucaNBXhv4gPFSsG8w5g+viACyZPI5NWO4wBuLuN6wfXOtqwf8
	Ppzeoh13U6/T9de3Z4gUIyU9PK5Qu1KxJ42c4DU09J2R5GZy+8cfy3w4mBPikaQA0JNTX2h0ra9
	8
X-Google-Smtp-Source: AGHT+IH8pM7sNRHOHPY0mSu77Jrh0ij1F71jjKeCo0sGy21bnOxVElQnJcwDqoWNpL3dlLEi4l8lrg==
X-Received: by 2002:a17:907:36c6:b0:a8a:7884:c491 with SMTP id a640c23a62f3a-a93b15f9342mr247811666b.17.1727342481006;
        Thu, 26 Sep 2024 02:21:21 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 3/3] x86/boot: Improve MBI2 structure check
Date: Thu, 26 Sep 2024 10:21:09 +0100
Message-Id: <20240926092109.475271-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926092109.475271-1-frediano.ziglio@cloud.com>
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
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


