Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74298EF0F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809337.1221689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKny-00077W-IY; Thu, 03 Oct 2024 12:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809337.1221689; Thu, 03 Oct 2024 12:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKny-00070b-0D; Thu, 03 Oct 2024 12:19:38 +0000
Received: by outflank-mailman (input) for mailman id 809337;
 Thu, 03 Oct 2024 12:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnu-00043u-VA
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1f19c6-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:33 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so106769366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:33 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:31 -0700 (PDT)
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
X-Inumbo-ID: bf1f19c6-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957972; x=1728562772; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmh1hzNwt6VpdcbBHHPmRW3VApkcv+IYe7HOfAX1NVQ=;
        b=KKKEk97g6DDw6RwXmfdBy9VlmdyWJizI1qNwrjwhyQuovpIopbjXPoDxBl5cwzWK7b
         37a4yubnMSZlWgF3KRIzAB3LvRRHRwiEksZOefcx+kNWYWz88wB04MyspzuIUQRnftan
         wJD3qmq9IFu/+mPZtya4RThvTFxZqsdDwCS38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957972; x=1728562772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmh1hzNwt6VpdcbBHHPmRW3VApkcv+IYe7HOfAX1NVQ=;
        b=xVFrQ7jK0vpV+c+wZBW2AguwT2dBqei4XH6Ae5zirf4Qfn4KYIFOx2x5bcPzfZoyJ0
         w9XyVEUBwoiuHoGuc7Y6NjFfJLR3E0crPfQB39MWKkvZKDEeOahKZrIkGxDd4jurb0ZR
         c+3t/Ro1CUmvgecdlabrvPUcemoXp5cqY2cLglKMvmelwh+x+IFkgwRcEib2QmxROOOb
         Oxll7ADvCeHdOTyEYP0baPygTOJ34tuAYDy5zHd5KQCCZHoGKoN8HyIEaqRmHSuNiTkl
         SbnpWfMm+2pUd4Ob5+8zGko7fdx+i9+P7Xv2/fRTAMLw7PyYjHkdBqBMMf8bWiX55QWw
         +Htg==
X-Gm-Message-State: AOJu0Yzok6dEGSb3CzsQp7WCsbVOe2akYL0cE8pK9M6qgTMcFCx/ZWOA
	gESrLFJUbNTIwL1S+4td2FVdB0GSdOL9/NyObI5RwsboFJrPmqUj11gsMs3s9RewO/j/j+J+muk
	u
X-Google-Smtp-Source: AGHT+IEdGHOCMwruRO3RFvoh0Dm/Pgnu/ic/KapmaTnR1Qd9BbgLwzjpr+PhC/BCNyRBD/eyK+CvPA==
X-Received: by 2002:a17:906:6a04:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a98f825a9famr650030666b.29.1727957972159;
        Thu, 03 Oct 2024 05:19:32 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 13/20] xen: Update header guards - Live patch
Date: Thu,  3 Oct 2024 13:19:01 +0100
Message-Id: <20241003121908.362888-14-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
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


