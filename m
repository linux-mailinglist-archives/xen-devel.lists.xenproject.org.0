Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762AA97BA12
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800214.1210153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqu0-0002U9-Ac; Wed, 18 Sep 2024 09:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800214.1210153; Wed, 18 Sep 2024 09:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqu0-0002QC-6P; Wed, 18 Sep 2024 09:23:12 +0000
Received: by outflank-mailman (input) for mailman id 800214;
 Wed, 18 Sep 2024 09:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PNE=QQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqqty-0001Ui-D4
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:23:10 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e41cb69-759f-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 11:23:08 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c413cf5de5so9355136a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 02:23:08 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906109718bsm559125666b.34.2024.09.18.02.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 02:23:07 -0700 (PDT)
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
X-Inumbo-ID: 9e41cb69-759f-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726651388; x=1727256188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76bJmVRgoyuRftic5KQh8KmD08jovx2iL9DhRm4U/lo=;
        b=F2nRc1UjgFTmESZydi8vAqfSPyuCBK8F1rBh7FuuzgtWdH3LPGjPSB4uWEWhToYllt
         daBaHEEZ1qJgbgDUTebOg0ZTumsVAl7efij3yGCv9H9Tcgqax97sv19uH0zS+acvTGZ0
         1jNyVBT0JcFQHIT3ASDz86m50BZ84jKxUQiJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651388; x=1727256188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76bJmVRgoyuRftic5KQh8KmD08jovx2iL9DhRm4U/lo=;
        b=Zqw5xKVNB6500XIuyXtt/wf40APVF4wbvBoAH6icJkXvMXe1ib4Z5v1RqUFRtn2DfY
         ZmNcrS4NIx5pyxhndj/gwxCXto6wb9YNKTpimsUPHjH+ALaqw4O9c6wFw8QLfnYBO7K2
         4fjQHZXjpF5gAGMZnP7zFyFanFLaOIr2wWi836qrrSyj+sI5oYkeFnUswLzcfpMuosET
         CEJn9eu847h/PfuvO5QcivBYU3JPw28BR+VdEXSMOJdTkZ/zX8lVhyN1GbOKPkMAbcO6
         yzAY2WuCiO/zsuy54gDpIbk3cnaa0mcCYG05jUHMGEmaYfINq0YVS7by+NZ+50sMolpN
         AV4w==
X-Gm-Message-State: AOJu0YyukCVI5SNfgxCv+V0NB9kS2vX2+zAdkzvaqCtIc6CwHp/PF/5X
	sSLh3li0qKAWR4GGtVlE0KuPaMjZbv96h5TLlmTKdXpD2pqy8J1Q0x0pYnp9Z777lasmtSWewzj
	v
X-Google-Smtp-Source: AGHT+IFEp/u+VUPtxAjeVGb1u/u7pp2Nj5RBUYuw+I7Zrj1Fea0oc1XRWYT5UzIgnFUvu1BdOycgaw==
X-Received: by 2002:a17:907:f703:b0:a8a:7f08:97a6 with SMTP id a640c23a62f3a-a902943932amr2051093266b.24.1726651387902;
        Wed, 18 Sep 2024 02:23:07 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/4] x86/boot: Improve MBI2 structure check
Date: Wed, 18 Sep 2024 10:22:55 +0100
Message-Id: <20240918092255.13527-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918092255.13527-1-frediano.ziglio@cloud.com>
References: <20240918092255.13527-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/efi/parse-mbi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
index 6038f35b16..7efda8fab2 100644
--- a/xen/arch/x86/efi/parse-mbi2.c
+++ b/xen/arch/x86/efi/parse-mbi2.c
@@ -22,6 +22,7 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
     EFI_HANDLE ImageHandle = NULL;
     EFI_SYSTEM_TABLE *SystemTable = NULL;
     const char *cmdline = NULL;
+    const void *const mbi_end = (const void *)mbi + mbi->total_size;
     bool have_bs = false;
 
     if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
@@ -30,7 +31,9 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
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


