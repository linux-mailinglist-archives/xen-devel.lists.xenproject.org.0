Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088087EF82
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 19:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695113.1084659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmHUP-00032B-UX; Mon, 18 Mar 2024 18:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695113.1084659; Mon, 18 Mar 2024 18:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmHUP-0002zf-RU; Mon, 18 Mar 2024 18:13:37 +0000
Received: by outflank-mailman (input) for mailman id 695113;
 Mon, 18 Mar 2024 18:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmHUO-0002se-Ng
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 18:13:36 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c251899-e553-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 19:13:35 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5684ea117a3so6916759a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 11:13:35 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p8-20020a50cd88000000b0056851310a04sm5102928edi.16.2024.03.18.11.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 11:13:33 -0700 (PDT)
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
X-Inumbo-ID: 3c251899-e553-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710785614; x=1711390414; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I5jTcKsMsCqCrjNyG868pQQ+v3sQiSH8rAadw9EdKLI=;
        b=qUMzjBoyHaQjCDvWJWi+MWSfRY4U0n1+QgNRo4JZ8eSIEoyQRP/gkwRm9FTEvYjKBG
         vbYrdwetX6RcL2Whh3NFy5Rf83ADmzX2zvpkV7hLxx10tjCNh6oUBMC12VwKDW/yTv6A
         +4xmCWzIp1+9weIN/kIPzSB9n7iqRFgXk+TsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710785614; x=1711390414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5jTcKsMsCqCrjNyG868pQQ+v3sQiSH8rAadw9EdKLI=;
        b=Xf/rjTEi1Gwbpr4yOGAv81mNE22Ea6NQY9knupjXVdGGAwDguryhgSO7zzGeHP+8jZ
         MBsLgCyKJmxopiKdSOtoq9Ul8i/PW8lo6lSfsdOoOdvMOYG52MM9HZ3PEI3UI3CEG/63
         w9Zne5ck13p6xbR5orZdr65D3wIdLtKb1hcNVOfDjtWiYdggXqZzALkatYJ61Dhog8x7
         Z458+StFfZob4yOD0EQ9HksRHys3bLqVTho1ZNwpVptGLGTuQWgYKYylxTUvaMCeHrQ7
         W80IpDkXOY1zqjIDlIGesHspiXxamedgapSZfQuZBbjm8noOjDTWT+RC70tYKQjlQjQM
         VG7A==
X-Gm-Message-State: AOJu0YzZS9IuwUQFI73Y2wu8k79hcCOZgnh5wc1QVTSfxl6JWnypvkig
	IuDHmOTxMW/pVLrCLcw0cOZSM8t6aYezJpP0tJDh39H5pKne8VyVZIWKzzIVfOzYgoejronwnw/
	I
X-Google-Smtp-Source: AGHT+IEVqkAVuUC43xKqBKiq9ZHbnwtpWzUTfk/Doj61qI9uNVeWzsOT41KaFLXz0MpWEdazflWPbQ==
X-Received: by 2002:a05:6402:3706:b0:56a:2b6b:42cd with SMTP id ek6-20020a056402370600b0056a2b6b42cdmr2456495edb.3.1710785613674;
        Mon, 18 Mar 2024 11:13:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/features: More AMD features
Date: Mon, 18 Mar 2024 18:13:32 +0000
Message-Id: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All of these are informational and require no further logic changes in Xen to
support.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I'm not sure about FSRSC as a name, but it definitely beats AMD's longhand
name of FAST_REP_SCASB.
---
 tools/misc/xen-cpuid.c                      | 5 +++++
 xen/include/public/arch-x86/cpufeatureset.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 51efbff579e6..b562ee839d38 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -91,6 +91,7 @@ static const char *const str_e1c[32] =
     [24] = "perfctr-nb", /* [25] */
     [26] = "dbx",        [27] = "perftsc",
     [28] = "pcx-l2i",    [29] = "monitorx",
+    [30] = "dbext2",
 };
 
 static const char *const str_7b0[32] =
@@ -199,11 +200,15 @@ static const char *const str_7a1[32] =
 
 static const char *const str_e21a[32] =
 {
+    [ 0] = "no-nest-bp",    [ 1] = "fs-gs-ns",
     [ 2] = "lfence+",
     [ 6] = "nscb",
     [ 8] = "auto-ibrs",
+    [10] = "amd-fsrs",      [11] = "amd-fsrc",
 
     /* 16 */                [17] = "cpuid-user-dis",
+    [18] = "epsf",          [19] = "fsrsc",
+    [20] = "amd-prefetchi",
 
     /* 26 */                [27] = "sbpb",
     [28] = "ibpb-brtype",   [29] = "srso-no",
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index eb9f552948be..11287aaabe43 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -168,6 +168,7 @@ XEN_CPUFEATURE(TBM,           3*32+21) /*A  trailing bit manipulations */
 XEN_CPUFEATURE(TOPOEXT,       3*32+22) /*   topology extensions CPUID leafs */
 XEN_CPUFEATURE(DBEXT,         3*32+26) /*A  data breakpoint extension */
 XEN_CPUFEATURE(MONITORX,      3*32+29) /*   MONITOR extension (MONITORX/MWAITX) */
+XEN_CPUFEATURE(DBEXT2,        3*32+30) /*A  Address Mask Extentions */
 
 /* Intel-defined CPU features, CPUID level 0x0000000D:1.eax, word 4 */
 XEN_CPUFEATURE(XSAVEOPT,      4*32+ 0) /*A  XSAVEOPT instruction */
@@ -290,10 +291,17 @@ XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
+XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
+XEN_CPUFEATURE(FS_GS_NS,           11*32+ 1) /*S  FS/GS base MSRs non-serialising */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
 XEN_CPUFEATURE(AUTO_IBRS,          11*32+ 8) /*S  Automatic IBRS */
+XEN_CPUFEATURE(AMD_FSRS,           11*32+10) /*A  Fast Short REP STOSB */
+XEN_CPUFEATURE(AMD_FSRC,           11*32+11) /*A  Fast Short REP CMPSB */
 XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for CPL > 0 software */
+XEN_CPUFEATURE(EPSF,               11*32+18) /*A  Enhanced Predictive Store Forwarding */
+XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
+XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
 XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
 XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */

base-commit: 62018f08708a5ff6ef8fc8ff2aaaac46e5a60430
-- 
2.30.2


