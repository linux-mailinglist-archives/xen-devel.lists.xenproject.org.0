Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BA9AE89D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 16:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825346.1239548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynm-0004Ac-MJ; Thu, 24 Oct 2024 14:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825346.1239548; Thu, 24 Oct 2024 14:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynm-00048m-JJ; Thu, 24 Oct 2024 14:27:02 +0000
Received: by outflank-mailman (input) for mailman id 825346;
 Thu, 24 Oct 2024 14:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3ynl-00048L-6M
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 14:27:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07b73ecc-9214-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 16:27:00 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9362c26d8so3732613a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 07:27:00 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b4e4sm5707409a12.61.2024.10.24.07.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 07:26:58 -0700 (PDT)
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
X-Inumbo-ID: 07b73ecc-9214-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729780019; x=1730384819; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVXd7SoQfi1YRwuP/bchb8oFe7nMu7FPsr69BeMQRRM=;
        b=h/zWW9hfot0jC6bq1GDu4wIZadz8TduqHvPgF9xie0DvIp+FPMlG1oh9qJfmRkqNkx
         NG2znVzaCjZpfLy5QUysl2SPcp0pJ9QnN4mH4U+SAVNys3mtYmt41X9BAs1znEvQmjYj
         wAcfDIHmR7ItKlNeX75M50WCBeoWJsyAvGIsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780019; x=1730384819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVXd7SoQfi1YRwuP/bchb8oFe7nMu7FPsr69BeMQRRM=;
        b=ho+VXHkrhCsD0JE+40wtqz+gDAEAqGAI4zSU/aT/qaNUIrWSB4piCro2kndT2kf7jf
         N5TOJenNubGKhhXxRAx61R7LZ5jtYQHWqx7lqRNZUhtnxuf4gdkR6fTsnmmbFCtoeSJy
         q/SrzT50sVsBvWtNiHgcPCOS8ZxYFv36qWIrXa2Jgjb7nfsfb9N3RCHXGNFx23qpE/Yr
         zXQZ/Yzv+NHFj9Ucg1jHsOKpz4wKSSFdi1bhMW+3UymQhvZBBoc1TZE7oT8z/31XaYks
         iSj5RkkbKZQLXtjmfH9TIbPayJlmrf+jIMWQ+wpGMEE2aPZjJY6nHWigOIJ+zFQJMh2M
         jLvA==
X-Gm-Message-State: AOJu0Yxb85EVYcKTG6u7TmdhJ2aPZ0tmkh6OLeVQ+XxGA5SusJ8dHfBa
	YoCJtRQJ7jL1Rxr+7/Eb7OA6vPJ46qBW99PCY6LwRu3OFefv2XJoirT3/Es5JajGI1BS/qrP9cK
	d
X-Google-Smtp-Source: AGHT+IFdW0kax42rLgItyEEOWYAkOto/YtbLa80UVJKfCn0MH9m2V6QJhdd1EQujAwwV3XZEmg7iFA==
X-Received: by 2002:a05:6402:538d:b0:5c5:c2a7:d535 with SMTP id 4fb4d7f45d1cf-5cba208256bmr2588565a12.16.1729780018684;
        Thu, 24 Oct 2024 07:26:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/5] x86/boot: Drop initial_images pointer
Date: Thu, 24 Oct 2024 15:26:50 +0100
Message-Id: <20241024142654.989980-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024142654.989980-1-andrew.cooper3@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Now that the module list is encapsulated inside boot_info, we can do away with
the initial_images pointer.

No functional change.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v7.5:
 * Rearranged from several later patches
---
 xen/arch/x86/setup.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index fc18ba3e35b5..8c10fe51dfad 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,8 +276,6 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
-static const module_t *__initdata initial_images;
-
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
@@ -332,8 +330,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = initial_images[i].mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
+        unsigned long start = bi->mods[i].mod->mod_start;
+        unsigned long end   = start + PFN_UP(bi->mods[i].mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -349,14 +347,13 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
+        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
 
         init_domheap_pages(start,
-                           start + PAGE_ALIGN(initial_images[i].mod_end));
+                           start + PAGE_ALIGN(bi->mods[i].mod->mod_end));
     }
 
     bi->nr_modules = 0;
-    initial_images = NULL;
 }
 
 static void __init init_idle_domain(void)
@@ -1376,8 +1373,6 @@ void asmlinkage __init noreturn __start_xen(void)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = mod;
-
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
         if ( mod[i].mod_start & (PAGE_SIZE - 1) )
-- 
2.39.5


