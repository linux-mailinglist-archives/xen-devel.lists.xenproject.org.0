Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9689FFF6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 20:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703546.1099222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructu-0002kt-PP; Wed, 10 Apr 2024 18:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703546.1099222; Wed, 10 Apr 2024 18:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructu-0002jI-ML; Wed, 10 Apr 2024 18:42:26 +0000
Received: by outflank-mailman (input) for mailman id 703546;
 Wed, 10 Apr 2024 18:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ructs-0002iK-Iv
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 18:42:24 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1158eca4-f76a-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 20:42:22 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a4715991c32so948951066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 11:42:22 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gv18-20020a170906f11200b00a4e1a9e1ab4sm7228404ejb.157.2024.04.10.11.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 11:42:20 -0700 (PDT)
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
X-Inumbo-ID: 1158eca4-f76a-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712774542; x=1713379342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsNIZ9Ks155ZkwoUu/vGrjMHW6z4GukXwUvQ1y/Pu+A=;
        b=nME0t5WNiWTaNwhi7gBn+qrdeMzNQ0qwAVr8TTVLNNBtxb1lKFqma0JqZ4UsAnF7T9
         y+J69MUl+ZrwuOJtVVnq1ECgnhwRfKy4T/A1vqldhX8OfdrUiIgWVjsvTIYpi23Uifrm
         qO4zxQEMRLD3gu+7fSdGKXWfJQZUfIzEtJj7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712774542; x=1713379342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsNIZ9Ks155ZkwoUu/vGrjMHW6z4GukXwUvQ1y/Pu+A=;
        b=wPCFIxD8uEpQmxPUqLj65IRnJJjwl9EjmllGxYw2d0/0DljworEOksdjpcYJpvjsSZ
         b7Wi2DlpE2SJoVpu6TE4/jX31+aA412kd2FVPLt+WHMALCNb+nKVK+wMzFvLY25SbnIP
         z2sk17aKVNZi5P6jTQoTXo1kt3C9ON7vHBSzCquaI7wl87FeGpG1Xs/OHHxR/Qhv5rYp
         egrpDKBo4tFZ2gyZEnQuEMNK1bBTAi1Buro9RxVk6nssNZ7I6dR0I+U/1rtO0+3o+CKA
         w2EAbFTnSDnid2t1+0+TOcrRrc5nCY0es7JR8m/zw4ABFO8XlqA17lJSentpcst9VeYi
         cf7Q==
X-Gm-Message-State: AOJu0Yy2wwGIyQWk1a+A9kxzyHRPFYjyXZ6iQGDLrU54yN0RWQQcijQv
	0/yX42hd27W1cFGMs+YxpLXXtdBTE3E7kHUzq8DFrGk6I4CydpyZFflBwj5UxJNDYbTeZZHnQpk
	3/6M=
X-Google-Smtp-Source: AGHT+IHvf+/DkK/dEiPklmW3RhoQi2EHNqyJPHqOJB+T+k6g2LGD0/+pwLJMh1zhFKIsvqQ8/KZcdg==
X-Received: by 2002:a17:906:2352:b0:a51:d7b1:daa5 with SMTP id m18-20020a170906235200b00a51d7b1daa5mr1795559eja.65.1712774541645;
        Wed, 10 Apr 2024 11:42:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 1/4] xen/link: Introduce a common BUGFRAMES definition
Date: Wed, 10 Apr 2024 19:42:14 +0100
Message-Id: <20240410184217.1482366-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugframe linkage is identical in all architectures.  This is not surprising
given that it is (now) only consumed by common/virtual_region.c

Introduce a common BUGFRAMES define in xen.lds.h ahead of rearranging their
structure.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/arm/xen.lds.S    | 13 +++----------
 xen/arch/ppc/xen.lds.S    | 13 +++----------
 xen/arch/riscv/xen.lds.S  | 13 +++----------
 xen/arch/x86/xen.lds.S    | 11 +----------
 xen/include/xen/xen.lds.h | 11 +++++++++++
 5 files changed, 21 insertions(+), 40 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2266c9536f05..bd884664adf6 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -55,16 +55,9 @@ SECTIONS
   . = ALIGN(PAGE_SIZE);
   .rodata : {
         _srodata = .;          /* Read-only data */
-        /* Bug frames table */
-       __start_bug_frames = .;
-       *(.bug_frames.0)
-       __stop_bug_frames_0 = .;
-       *(.bug_frames.1)
-       __stop_bug_frames_1 = .;
-       *(.bug_frames.2)
-       __stop_bug_frames_2 = .;
-       *(.bug_frames.3)
-       __stop_bug_frames_3 = .;
+
+        BUGFRAMES
+
        *(.rodata)
        *(.rodata.*)
        *(.data.rel.ro)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 8840a0044666..38cd857187e2 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -45,16 +45,9 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     DECL_SECTION(.rodata) {
         _srodata = .;          /* Read-only data */
-        /* Bug frames table */
-        __start_bug_frames = .;
-        *(.bug_frames.0)
-        __stop_bug_frames_0 = .;
-        *(.bug_frames.1)
-        __stop_bug_frames_1 = .;
-        *(.bug_frames.2)
-        __stop_bug_frames_2 = .;
-        *(.bug_frames.3)
-        __stop_bug_frames_3 = .;
+
+        BUGFRAMES
+
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index ace6f49c579c..070b19d91503 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -42,16 +42,9 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata = .;          /* Read-only data */
-        /* Bug frames table */
-        __start_bug_frames = .;
-        *(.bug_frames.0)
-        __stop_bug_frames_0 = .;
-        *(.bug_frames.1)
-        __stop_bug_frames_1 = .;
-        *(.bug_frames.2)
-        __stop_bug_frames_2 = .;
-        *(.bug_frames.3)
-        __stop_bug_frames_3 = .;
+
+        BUGFRAMES
+
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 1ef6645128b2..9a1dfe1b340a 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -127,16 +127,7 @@ SECTIONS
        . = ALIGN(PAGE_SIZE);
        __ro_after_init_end = .;
 
-       /* Bug frames table */
-       __start_bug_frames = .;
-       *(.bug_frames.0)
-       __stop_bug_frames_0 = .;
-       *(.bug_frames.1)
-       __stop_bug_frames_1 = .;
-       *(.bug_frames.2)
-       __stop_bug_frames_2 = .;
-       *(.bug_frames.3)
-       __stop_bug_frames_3 = .;
+       BUGFRAMES
 
        *(.rodata)
        *(.rodata.*)
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index be90f5ca0fdb..7ab7aa567872 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -114,6 +114,17 @@
 
 /* List of constructs other than *_SECTIONS in alphabetical order. */
 
+#define BUGFRAMES                               \
+    __start_bug_frames = .;                     \
+    *(.bug_frames.0)                            \
+    __stop_bug_frames_0 = .;                    \
+    *(.bug_frames.1)                            \
+    __stop_bug_frames_1 = .;                    \
+    *(.bug_frames.2)                            \
+    __stop_bug_frames_2 = .;                    \
+    *(.bug_frames.3)                            \
+    __stop_bug_frames_3 = .;
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.30.2


