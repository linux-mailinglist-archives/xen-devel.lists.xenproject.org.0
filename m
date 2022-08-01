Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD13586AB3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 14:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378728.612086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIUQH-0003P4-PW; Mon, 01 Aug 2022 12:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378728.612086; Mon, 01 Aug 2022 12:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIUQH-0003Mg-Lc; Mon, 01 Aug 2022 12:21:25 +0000
Received: by outflank-mailman (input) for mailman id 378728;
 Mon, 01 Aug 2022 12:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g61G=YF=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oIUQG-0003Ma-FR
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 12:21:24 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74f7386e-1194-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 14:21:23 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id ss3so19942149ejc.11
 for <xen-devel@lists.xenproject.org>; Mon, 01 Aug 2022 05:21:23 -0700 (PDT)
Received: from uni.. ([2a02:587:ac0b:7a00:1b9e:a344:414e:dad7])
 by smtp.googlemail.com with ESMTPSA id
 w7-20020aa7d287000000b0043bc19efc15sm6689559edq.28.2022.08.01.05.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 05:21:22 -0700 (PDT)
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
X-Inumbo-ID: 74f7386e-1194-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=7XSD+8EhA1uKBi/nCXW+oNfci4M5oOn56Y+83soX83U=;
        b=jlgx+HkGXZ7Dg+2dx8hRjhJN718Y5fVqbtZe7j+0fUaYxvOGRbrt35Nj3iXII1HJlw
         DKJNNYvZaRESrZhpxu8eyOu/Jh15kFCpFrzwITPvonJxVuIg5xoJt+VCG4GJPgWxeU/s
         UUlZJtb2dbzOrPFr8ZtP0moAUEALuk9PZrUtzXAF0KCq1eZ0SWA6NVLBYap4CwQlEBop
         LDLxifQVlcFvo1M7uiviV/w7K8X18+sWhHCoM95u5Ibkqup7Gr+HbP1HQWyS3+SNlVez
         RK2ueAwrFr+n3Av4Anbhbo+cZlyPgq2XYY0oE/KP3yVvIUji+NgC3Q1yBzyPg2DsQ0hN
         e2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=7XSD+8EhA1uKBi/nCXW+oNfci4M5oOn56Y+83soX83U=;
        b=TuJFncSR/E7eF2GTV1LdComoVqfEwVgcFCpGQqwNA0cphGVF4jCKbQn1t87ccAbBJU
         q3CKzn4nq3eWSBr6tENMBgAyzftVAgS7jOBpXKF6zBIN8xtCPwFMJc12Ww0gcW7EagDk
         fy7Q/6KQ4HAVyqqJnKOLrM263Rex7ZjMvxEuJkFLEbBVGGqbor+yUu1dBFJ/5e5ZycHk
         cm9qJSb12itmUriOZJzGHD+hrmobr2puVCbr7K906rlYWjv95EL0w/yuZl9fSlVQH7ig
         L0MnYw0qiouGiC30KBY5/f4p9pnxofAZvJT06ZW6ncslstT0Aki0I2x7G1m5oyqKPyKf
         7tiQ==
X-Gm-Message-State: AJIora9ZogUq/gs6FMdzpYUPeRYNz/TvHb+h5wZlv1biNqdnmWbHUDMo
	AuiqnsU2AwnKUshuz9KE4ONoFuz5Sx8=
X-Google-Smtp-Source: AGRyM1t7mHt5dRuZFVZpQv8g3fwlLywHaKnOub3wde/68VLPnxuoQSUOXwH+eYwsl4aZRq8uV02YYQ==
X-Received: by 2002:a17:906:e9b:b0:72d:ec31:b037 with SMTP id p27-20020a1709060e9b00b0072dec31b037mr12324343ejf.595.1659356482771;
        Mon, 01 Aug 2022 05:21:22 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/efi: efibind: fix MISRA C 2012 Directive 4.10 violation
Date: Mon,  1 Aug 2022 15:21:18 +0300
Message-Id: <20220801122118.1673349-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent header file from being included more than once by adding ifndef guard.

In order to be close to gnu-efi code
- for x86_64, use the same guard
- for arm64, that there is no guard in gnu-efi, for consistency,
use a similar format and position to the x86_64 guard

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- import efibind.h guard from gnu-efi for x86_64
- add a guard for arm64 in a similar, to x86_64, way
- change commit message accordingly

 xen/arch/arm/include/asm/arm64/efibind.h  | 5 ++++-
 xen/arch/x86/include/asm/x86_64/efibind.h | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
index 2b0bf40bf2..8b43bb8495 100644
--- a/xen/arch/arm/include/asm/arm64/efibind.h
+++ b/xen/arch/arm/include/asm/arm64/efibind.h
@@ -16,7 +16,8 @@ Abstract:
 Revision History
 
 --*/
-
+#ifndef AARCH64_EFI_BIND
+#define AARCH64_EFI_BIND
 #ifndef __GNUC__
 #pragma pack()
 #endif
@@ -205,6 +206,8 @@ typedef uint64_t   UINTN;
 
 #endif
 
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
index ddcfae07ec..e23cd16cb6 100644
--- a/xen/arch/x86/include/asm/x86_64/efibind.h
+++ b/xen/arch/x86/include/asm/x86_64/efibind.h
@@ -16,7 +16,8 @@ Abstract:
 Revision History
 
 --*/
-
+#ifndef X86_64_EFI_BIND
+#define X86_64_EFI_BIND
 #ifndef __GNUC__
 #pragma pack()
 #endif
@@ -278,3 +279,4 @@ typedef uint64_t   UINTN;
 #pragma warning ( disable : 4731 )  // Suppress warnings about modification of EBP
 #endif
 
+#endif
-- 
2.34.1


