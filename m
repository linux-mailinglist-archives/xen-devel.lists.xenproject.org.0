Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D99AE8A2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 16:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825349.1239579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynq-0004td-H6; Thu, 24 Oct 2024 14:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825349.1239579; Thu, 24 Oct 2024 14:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynq-0004rL-Cw; Thu, 24 Oct 2024 14:27:06 +0000
Received: by outflank-mailman (input) for mailman id 825349;
 Thu, 24 Oct 2024 14:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3yno-00048O-Th
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 14:27:04 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09bc6782-9214-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 16:27:03 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c948c41edeso1127887a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 07:27:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b4e4sm5707409a12.61.2024.10.24.07.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 07:27:00 -0700 (PDT)
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
X-Inumbo-ID: 09bc6782-9214-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729780022; x=1730384822; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/1V36zu8pl8T7xYRf9La+mccrttDt5v1Zny77BeDlA=;
        b=oLJXcoQ2tWqUqHnNg+vTYDB7AFRbqlJHm0KRL/prGZ71CjRDGlpbhv9jXIRYnmv4OC
         UUr7wpjePTYUoEg7p+0REsrFv1WlcMwFSvg5DgZx9SIqdxayY/L3lj30pFt1zmWtAA4B
         4baywjGUwXtAKogEvcGJ2ljfkphOhC5pU5vSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780022; x=1730384822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/1V36zu8pl8T7xYRf9La+mccrttDt5v1Zny77BeDlA=;
        b=UZCl0vN4CjEAPsHHRwy3izVJbS7/FwXeTsuY3PGkFV56eSSgKVCbyE8Yez8NsaMW9n
         2axhFktbQARLQ7tsvY0DxNA7jBSSIvg2onxhSK45ASgsPpjTKC6LKJc1HcqRJjwbPqkJ
         +wjI+QbB2oyMZDDli0F4Og1dkLIHTxM2QU9dEXsjOA+zbMszECceSRLAYM6Gf2elL4EA
         UGzsF4/FMvt2vr/55EkJ60PgknIv7bU096NHqiCzPCGsObtal4QC8WVsXUUgrcy1Jzbn
         iDDUaEjvaR+LFsz6MgGLg2JItOqJev8McFk/DIle0Q76GBjBaEK2UPH+XqrO2WhGAk8u
         pwEA==
X-Gm-Message-State: AOJu0YwnLaVWKU/WhSr82VXShwK9vKcToHETQiCf7rEyoD4uEcGuLZAE
	zN4Y8dqivOwCt18PB0aFoXkdTpiJwPS1i7wM6T9QZuWYQ79Bl7OzDmsKU93kZy02T62QLwFMLEL
	l
X-Google-Smtp-Source: AGHT+IH6p9gdO0AX6mLGCwEkRJD/oDfxz+x/AJPocHh/3hD6qDzdaNJNyDPqbrO7R32Qwdz4y9sHdg==
X-Received: by 2002:a05:6402:254b:b0:5ca:da2:b2ca with SMTP id 4fb4d7f45d1cf-5cb8acba591mr6178431a12.19.1729780021899;
        Thu, 24 Oct 2024 07:27:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/5] x86/boot: Introduce bootstrap_map_bm() to map boot_module's
Date: Thu, 24 Oct 2024 15:26:52 +0100
Message-Id: <20241024142654.989980-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024142654.989980-1-andrew.cooper3@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Convert converting the call to bzimage_headroom(), as well as using
bi->mod[0].  It will be used externally by later changes.

No functional change.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v7.5:
 * Refectored/extracted from later in the series.
---
 xen/arch/x86/include/asm/setup.h | 2 ++
 xen/arch/x86/setup.c             | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 8b7843104ff7..4874ee8936fc 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -38,6 +38,8 @@ extern struct boot_info xen_boot_info;
 unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
 
+struct boot_module;
+void *bootstrap_map_bm(const struct boot_module *bm);
 void *bootstrap_map(const module_t *mod);
 void bootstrap_unmap(void);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8e32d6c49c54..ee03725af380 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -475,6 +475,11 @@ void *__init bootstrap_map(const module_t *mod)
                               pfn_to_paddr(mod->mod_start) + mod->mod_end);
 }
 
+void *__init bootstrap_map_bm(const struct boot_module *bm)
+{
+    return bootstrap_map(bm->mod);
+}
+
 void __init bootstrap_unmap(void)
 {
     bootstrap_map_addr(0, 0);
@@ -1403,7 +1408,9 @@ void asmlinkage __init noreturn __start_xen(void)
         mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
     }
 
-    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
+    modules_headroom =
+        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
+                         bi->mods[0].mod->mod_end);
     bootstrap_unmap();
 
 #ifndef highmem_start
-- 
2.39.5


