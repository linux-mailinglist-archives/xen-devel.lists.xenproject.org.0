Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3F98FECD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810095.1222813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVO-0008ED-Co; Fri, 04 Oct 2024 08:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810095.1222813; Fri, 04 Oct 2024 08:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVN-0007yY-RG; Fri, 04 Oct 2024 08:17:41 +0000
Received: by outflank-mailman (input) for mailman id 810095;
 Fri, 04 Oct 2024 08:17:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVK-0005Kj-Di
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:38 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d41684f-8229-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 10:17:36 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a98f6f777f1so233579666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:36 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:35 -0700 (PDT)
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
X-Inumbo-ID: 1d41684f-8229-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029856; x=1728634656; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmh1hzNwt6VpdcbBHHPmRW3VApkcv+IYe7HOfAX1NVQ=;
        b=VN68wboRaXUkwVPXT8hLw0+yyXrbWNIWjz0ShD4YUwTiEGoNVOt3RGrsBthgsJ1C92
         wiMxjg5NZGKGHflrPIISxfm9n72aJkkcSgLmA+d8Nfu01LnWQxAlch17HAvk8NdPb+bA
         tFMk/A00XY/xS2zjVp9np5VPFNnkZGwaMYQt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029856; x=1728634656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmh1hzNwt6VpdcbBHHPmRW3VApkcv+IYe7HOfAX1NVQ=;
        b=FfPVcMMDSotFzL0cCok7Ze3o9s8o0wEnKaLXR8hFsm3y26q0fjBuI11us3iZ8HHQXC
         cgjki5wFodvIpU5iv0VcVzfkZwngY5e4yj3ZOqVJegUvhkfuY5WiZeh0M/svCNQzHm1K
         VQhTopH2whw5M64zZ7okBlV8wwBUTIAY6MhoWaQ3SuIOMCQ6dbokb3iArT0B345SEma2
         F22+qK47yh5qOS1SHe+xyGUBBhSt7G3LMd3dr+dkprp3fBIJtknMMoBmbCbG2JOqHLsL
         yVjBj3bi0Y3Na7+2GV2aRm4KMQuH1g8neAOdfTtwKl5VnQVheINYs/7tw5rwtqAd/bGu
         2L+A==
X-Gm-Message-State: AOJu0YxEyzS3FdN1x6l4lltBAFmCdr5HIMKHZOR8DkjS57lznYf08C68
	P8V4+0sp51UN9uu38yz12eRM/vfX1ebs//6AU39jBWjmFGrUA0k2WypF0Qgxi1G05rcenq0I+2Q
	V
X-Google-Smtp-Source: AGHT+IHWDduvUOS3Bw0u6cO0wQcd39B5t+mMPsQDUEQpEk84KdZZpnwVt6zzQduFlxKL3v85pTk0pg==
X-Received: by 2002:a17:907:d85f:b0:a8d:5ba1:88e6 with SMTP id a640c23a62f3a-a991bd72995mr141799566b.28.1728029856063;
        Fri, 04 Oct 2024 01:17:36 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 13/19] xen: Update header guards - Live patch
Date: Fri,  4 Oct 2024 09:17:07 +0100
Message-Id: <20241004081713.749031-14-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to live patching.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/livepatch.h | 6 +++---
 xen/include/xen/livepatch.h          | 6 +++---
 xen/include/xen/livepatch_elf.h      | 6 +++---
 xen/include/xen/livepatch_payload.h  | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/livepatch.h b/xen/arch/x86/include/asm/livepatch.h
index 00aefd2d63..7f838f418d 100644
--- a/xen/arch/x86/include/asm/livepatch.h
+++ b/xen/arch/x86/include/asm/livepatch.h
@@ -3,8 +3,8 @@
  *
  */
 
-#ifndef __XEN_X86_LIVEPATCH_H__
-#define __XEN_X86_LIVEPATCH_H__
+#ifndef ASM__X86__LIVEPATCH_H
+#define ASM__X86__LIVEPATCH_H
 
 #include <xen/sizes.h> /* For SZ_* macros. */
 
@@ -12,7 +12,7 @@
 #define ARCH_LIVEPATCH_RANGE SZ_2G
 #define LIVEPATCH_FEATURE    X86_FEATURE_ALWAYS
 
-#endif /* __XEN_X86_LIVEPATCH_H__ */
+#endif /* ASM__X86__LIVEPATCH_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebe..69220ece21 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -3,8 +3,8 @@
  *
  */
 
-#ifndef __XEN_LIVEPATCH_H__
-#define __XEN_LIVEPATCH_H__
+#ifndef XEN__LIVEPATCH_H
+#define XEN__LIVEPATCH_H
 
 struct livepatch_elf;
 struct livepatch_elf_sec;
@@ -167,7 +167,7 @@ static inline bool is_patch(const void *addr)
 }
 #endif /* CONFIG_LIVEPATCH */
 
-#endif /* __XEN_LIVEPATCH_H__ */
+#endif /* XEN__LIVEPATCH_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 842111e145..bb221aeaa0 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -2,8 +2,8 @@
  * Copyright (C) 2016 Citrix Systems R&D Ltd.
  */
 
-#ifndef __XEN_LIVEPATCH_ELF_H__
-#define __XEN_LIVEPATCH_ELF_H__
+#ifndef XEN__LIVEPATCH_ELF_H
+#define XEN__LIVEPATCH_ELF_H
 
 #include <xen/types.h>
 #include <xen/elfstructs.h>
@@ -52,7 +52,7 @@ static inline bool livepatch_elf_ignore_section(const Elf_Shdr *sec)
 {
     return !(sec->sh_flags & SHF_ALLOC);
 }
-#endif /* __XEN_LIVEPATCH_ELF_H__ */
+#endif /* XEN__LIVEPATCH_ELF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepatch_payload.h
index c6dc7cb5fa..f35d8b9d83 100644
--- a/xen/include/xen/livepatch_payload.h
+++ b/xen/include/xen/livepatch_payload.h
@@ -2,8 +2,8 @@
  * Copyright (C) 2016 Citrix Systems R&D Ltd.
  */
 
-#ifndef __XEN_LIVEPATCH_PAYLOAD_H__
-#define __XEN_LIVEPATCH_PAYLOAD_H__
+#ifndef XEN__LIVEPATCH_PAYLOAD_H
+#define XEN__LIVEPATCH_PAYLOAD_H
 #include <xen/virtual_region.h>
 
 /* To contain the ELF Note header. */
@@ -140,7 +140,7 @@ struct payload {
     livepatch_actioncall_t *__attribute__((weak, used)) \
         const livepatch_revert_data_##_fn __section(".livepatch.hooks.revert") = _fn;
 
-#endif /* __XEN_LIVEPATCH_PAYLOAD_H__ */
+#endif /* XEN__LIVEPATCH_PAYLOAD_H */
 
 /*
  * Local variables:
-- 
2.34.1


