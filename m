Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5986E8706A7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688435.1072516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhAtu-0007Vp-Li; Mon, 04 Mar 2024 16:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688435.1072516; Mon, 04 Mar 2024 16:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhAtu-0007Qc-Hz; Mon, 04 Mar 2024 16:10:50 +0000
Received: by outflank-mailman (input) for mailman id 688435;
 Mon, 04 Mar 2024 16:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpxf=KK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhAtt-0007OU-33
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:10:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c330c7b8-da41-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 17:10:47 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4595bd5f8cso4171366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 08:10:47 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o4-20020a17090611c400b00a458d85f9d9sm202394eja.142.2024.03.04.08.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:10:44 -0800 (PST)
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
X-Inumbo-ID: c330c7b8-da41-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709568646; x=1710173446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lXQMZ0/v8LLtfSISpT5FKIyGzrtvmnapu4SQzpeFLs=;
        b=VdfHIqjIdcwMnAem79kpnzCe6sCfXhRPD08KaXWVgevOzgobt41I0usL8C+tGpzU4o
         bXIMgBLvqWIbLvbANGQVbyXB2tRUqhg8ULCW7enKMIldTf/M1wa7V1x3xAJpQhIlMGjl
         +gKm2vcWA60tlyJD98F6d6TlVVIz68s2L5f0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709568646; x=1710173446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lXQMZ0/v8LLtfSISpT5FKIyGzrtvmnapu4SQzpeFLs=;
        b=OlZFeIkyXouLYXqMP3RlY0/6JJNuUGydAihseqMVuQmX6q4enO1jCxzNOOdFoqEoiO
         GmqmH+6A+OjoMKX5Ka1kGrgbFU5EfADLpasfSW+E33q7eOBA3UpgNl108wD0zB73Riwv
         W0dgS+zVZYhqXJedD/L6EaJJOCzoY8SEqTahh0+Da/az/TkHrTqfslv2s9Da5+GPJ1qO
         wDUDDoQArV34ivaEWXwrrNkyah6BPUHJutAenz//VOG1oZ+r4iS25KSJ5m615UTpskvb
         4sNQXywFilIYazxqj6K9g4mEmbML3G202O/eqQl83+Q+JhMm+ietrAWb+ZBBDSszcM0j
         +TDQ==
X-Gm-Message-State: AOJu0Yxzzb7gnN2kAz+s9THlpNWKv310TiRTMKzzhYUgxAuoeR9MZQqH
	HVFM5xUFI5HuNlq4dk1EujjKN3Hxz0J8sXz74RBLPZR7vsLSf+drG+MOreYopfvmjC7rucpxxkK
	X
X-Google-Smtp-Source: AGHT+IEX9lC5igf0y2ySPqdY9HDEV5TczzY9LqK+73xj+/NfgET68DSyBHDRumsVDdd1JqxDSuQt2Q==
X-Received: by 2002:a17:906:c310:b0:a45:6423:ad94 with SMTP id s16-20020a170906c31000b00a456423ad94mr1446167ejz.43.1709568646069;
        Mon, 04 Mar 2024 08:10:46 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/2] xen/*/nospec: Provide common versions of evaluate_nospec/block_speculation
Date: Mon,  4 Mar 2024 16:10:40 +0000
Message-Id: <20240304161041.3465897-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is daft to require all architectures to provide empty implementations of
this functionality.

Provide evaluate_nospec() and block_speculation() unconditionally in
xen/nospec.h with architectures able to opt in by providing suitable arch
variants.

Rename x86's implementation to the arch_*() variants.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/nospec.h   |  9 ---------
 xen/arch/ppc/include/asm/nospec.h   |  9 ---------
 xen/arch/riscv/include/asm/nospec.h |  9 ---------
 xen/arch/x86/include/asm/nospec.h   |  8 ++++----
 xen/include/xen/nospec.h            | 23 +++++++++++++++++++++++
 5 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/include/asm/nospec.h b/xen/arch/arm/include/asm/nospec.h
index efac51fc03be..05df096faab0 100644
--- a/xen/arch/arm/include/asm/nospec.h
+++ b/xen/arch/arm/include/asm/nospec.h
@@ -12,15 +12,6 @@
 # error "unknown ARM variant"
 #endif
 
-static inline bool evaluate_nospec(bool condition)
-{
-    return condition;
-}
-
-static inline void block_speculation(void)
-{
-}
-
 #endif /* _ASM_ARM_NOSPEC_H */
 
 /*
diff --git a/xen/arch/ppc/include/asm/nospec.h b/xen/arch/ppc/include/asm/nospec.h
index b97322e48d32..9b57a7e4b24d 100644
--- a/xen/arch/ppc/include/asm/nospec.h
+++ b/xen/arch/ppc/include/asm/nospec.h
@@ -3,13 +3,4 @@
 #ifndef __ASM_PPC_NOSPEC_H__
 #define __ASM_PPC_NOSPEC_H__
 
-static inline bool evaluate_nospec(bool condition)
-{
-    return condition;
-}
-
-static inline void block_speculation(void)
-{
-}
-
 #endif /* __ASM_PPC_NOSPEC_H__ */
diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
index e30f0a781b68..b227fc61ed8b 100644
--- a/xen/arch/riscv/include/asm/nospec.h
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -4,15 +4,6 @@
 #ifndef _ASM_RISCV_NOSPEC_H
 #define _ASM_RISCV_NOSPEC_H
 
-static inline bool evaluate_nospec(bool condition)
-{
-    return condition;
-}
-
-static inline void block_speculation(void)
-{
-}
-
 #endif /* _ASM_RISCV_NOSPEC_H */
 
 /*
diff --git a/xen/arch/x86/include/asm/nospec.h b/xen/arch/x86/include/asm/nospec.h
index 07606834c4c9..defc97707f03 100644
--- a/xen/arch/x86/include/asm/nospec.h
+++ b/xen/arch/x86/include/asm/nospec.h
@@ -23,20 +23,20 @@ static always_inline bool barrier_nospec_false(void)
     return false;
 }
 
-/* Allow to protect evaluation of conditionals with respect to speculation */
-static always_inline bool evaluate_nospec(bool condition)
+static always_inline bool arch_evaluate_nospec(bool condition)
 {
     if ( condition )
         return barrier_nospec_true();
     else
         return barrier_nospec_false();
 }
+#define arch_evaluate_nospec arch_evaluate_nospec
 
-/* Allow to block speculative execution in generic code */
-static always_inline void block_speculation(void)
+static always_inline void arch_block_speculation(void)
 {
     barrier_nospec_true();
 }
+#define arch_block_speculation arch_block_speculation
 
 /**
  * array_index_mask_nospec() - generate a mask that is ~0UL when the
diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
index 4c250ebbd663..a4155af08770 100644
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -9,6 +9,29 @@
 
 #include <asm/nospec.h>
 
+/*
+ * Protect a conditional branch from bad speculation.  Architectures *must*
+ * provide arch_evaluate_nospec() for this to be effective.
+ */
+static always_inline bool evaluate_nospec(bool cond)
+{
+#ifndef arch_evaluate_nospec
+#define arch_evaluate_nospec(cond) cond
+#endif
+    return arch_evaluate_nospec(cond);
+}
+
+/*
+ * Halt speculation unconditonally.  Architectures *must* provide
+ * arch_block_speculation() for this to be effective.
+ */
+static always_inline void block_speculation(void)
+{
+#ifdef arch_block_speculation
+    arch_block_speculation();
+#endif
+}
+
 /**
  * array_index_mask_nospec() - generate a ~0 mask when index < size, 0 otherwise
  * @index: array element index
-- 
2.30.2


