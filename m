Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61BB87E7F3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694588.1083440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAnV-0007Uv-OD; Mon, 18 Mar 2024 11:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694588.1083440; Mon, 18 Mar 2024 11:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAnV-0007Ri-LE; Mon, 18 Mar 2024 11:04:53 +0000
Received: by outflank-mailman (input) for mailman id 694588;
 Mon, 18 Mar 2024 11:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmAnU-0007RW-EP
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:04:52 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57c03b65-e517-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 12:04:51 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso4809912a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 04:04:51 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f22-20020aa7d856000000b0056b818544a9sm324882eds.90.2024.03.18.04.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 04:04:50 -0700 (PDT)
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
X-Inumbo-ID: 57c03b65-e517-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710759891; x=1711364691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at5KFl9nQfgpXq4Q7Iq5b9vyBtR/kiSx7kLCD84lTrQ=;
        b=lPTQZPylUVPwxdNBvHTjiD4ahw6dXqqaqzbcZPtRrLsO/9EX/ZV05Vxxtw9vBG5vEZ
         j2sZLGTEGGlpo9RZM+mwsnrt2IDTWGRP7Xszzud5opwbvhCpaW2T8rgzh241+/GXiA+0
         EiQwSKYgzNns1yCG3qF+hKfiADMhJ2gUtBj7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759891; x=1711364691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=at5KFl9nQfgpXq4Q7Iq5b9vyBtR/kiSx7kLCD84lTrQ=;
        b=G//4kVwIlUD+gO35Qr/JTkiA8Rmal1J5heQqj+rfWu6D+VBc2ywHLUgOohbjUWdxQ2
         OfCsZMjQrOb8IeW5FjSnCLv9xop7QkhT2X6Wq4x4EtglSzWsrofIgZ3p+P5mzaWhO8jb
         7uswRehFtyEVSLPrBVqI2zJn72Zx0OynyTEWqgk8JDsA6ZbujH9zoGDQKa3n0qJXR2+k
         bXv3RYq5YLudts3+uOaTMEWj7bTgaQ4U46NdPJcccmcSqlQ120hUea0keNYW43J3Vr7t
         yiCeppOukhzFcG8GzuYVEIBeVL/8pGRT7TVibossS7qacEzITT2xFsisU3vWJoyfd/Y4
         3rCw==
X-Gm-Message-State: AOJu0YxRe2kjWqtXVgKPFc/Ol5dvBFNGN0yB4yD5VB4DTmuVIZOe1uiV
	bpUFqEJs2cve2DvvL0NJTgPVld2NRs6zUwxus2fHufraiK2xHivikMwgEsEGvJLtHmtMrlZ+4FY
	7
X-Google-Smtp-Source: AGHT+IGbQXwmPyQQJOvSY/hRma7SWZ3N6q4E6jLJ4npsLQ3nMf71ZMxM4Mw8uBJpYE8qH3pUoz8dRg==
X-Received: by 2002:a05:6402:3981:b0:568:9b13:77fe with SMTP id fk1-20020a056402398100b005689b1377femr10391077edb.37.1710759890780;
        Mon, 18 Mar 2024 04:04:50 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/4] xen/link: Introduce a common BUGFRAMES definition
Date: Mon, 18 Mar 2024 11:04:39 +0000
Message-Id: <20240318110442.3653997-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugframe linkage is identical in all architectures.  This is not surprising
given that it is (now) only consumed by common/virtual_region.c

Introduce a common BUGFRAMES define in xen.lds.h ahead of rearranging their
structure.

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
index 05b6db272805..ca4d4a2b8adf 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
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
index 8930e14fc40e..fa4e608f0f97 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -131,16 +131,7 @@ SECTIONS
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
index 06b7110837a1..decd6db5fc6d 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -104,6 +104,17 @@
 
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


