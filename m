Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3DD98F5A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809692.1222235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7C-0000wq-Og; Thu, 03 Oct 2024 17:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809692.1222235; Thu, 03 Oct 2024 17:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7B-0000nl-V2; Thu, 03 Oct 2024 17:59:49 +0000
Received: by outflank-mailman (input) for mailman id 809692;
 Thu, 03 Oct 2024 17:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ78-0006hm-6G
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4605101e-81b1-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 19:59:45 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso253479166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:45 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:44 -0700 (PDT)
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
X-Inumbo-ID: 4605101e-81b1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978385; x=1728583185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmh1hzNwt6VpdcbBHHPmRW3VApkcv+IYe7HOfAX1NVQ=;
        b=CXm7rBu50VRVP3GgMJoKjetMVlTcXzvnfXUzNO9IdoJJNc9eGPNieU75xyMYvfW4L7
         3mJ2nCsAelZCjFjx+mdVRXWKHHX9LGa0w++GboYHrwAYldYyTL/w0LnVCBclSFl8WYgi
         XKAvJt90GNKaj+MU6zzaqBo3MtUgPGdjgbJYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978385; x=1728583185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmh1hzNwt6VpdcbBHHPmRW3VApkcv+IYe7HOfAX1NVQ=;
        b=BeCSb+6EHVyMWCdvxmESMebhx2a2fEPxb2h+pcbKjAPS0pMMqF9GEFyNrbOEMnadGB
         q6LDBT4DrGh7mWso1AvYu8Lk4dxC9laYMmGtlvg1RcMsNYwk3OFikecBX76HP84is5+F
         CNRo0r8LK5RTsUcWJKYYxxZGKPij50yns+O+D9mw9hTzvVU3hSqSQ3s6lm9rbCw8sVEK
         N4UFPgGgAYqX1v7OkxH/4+Usw4DU4J74ToC00Jxvpf7Co2WFNhcD6BiZXebdEQVE/Dpk
         5WzQu872QqW7Pne2U/HIeCIRcD/HSNSj7jBI8aZl54Gzc9Bygsz0iLYjDM6FloZtAQM4
         pirQ==
X-Gm-Message-State: AOJu0YzBBNqFC/8dMyNit8EBk5InqATNCIlWyqAIBKBxjzwLwHEtf/Ho
	0TZQHrDJ8/0edLp8vQHblNndxzVxD+nqtDWUKW54ltoL2boJldG+ftd4Z9pj4DyMBBpaP80quE5
	z
X-Google-Smtp-Source: AGHT+IF8E0i2pM3RnA31sXqNFXuQwlPCOEJWUNe3cd3+KwrwHyE69a8m1EeKMM+8XVB8i/otK88Nig==
X-Received: by 2002:a17:906:db0c:b0:a8d:4954:c209 with SMTP id a640c23a62f3a-a990a21d629mr428305866b.22.1727978384859;
        Thu, 03 Oct 2024 10:59:44 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 13/19] xen: Update header guards - Live patch
Date: Thu,  3 Oct 2024 18:59:13 +0100
Message-Id: <20241003175919.472774-14-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
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


