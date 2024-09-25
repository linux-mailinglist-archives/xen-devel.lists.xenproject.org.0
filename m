Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFF9855C1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803578.1214292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc9-0006yJ-Fm; Wed, 25 Sep 2024 08:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803578.1214292; Wed, 25 Sep 2024 08:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc9-0006u6-Bo; Wed, 25 Sep 2024 08:43:13 +0000
Received: by outflank-mailman (input) for mailman id 803578;
 Wed, 25 Sep 2024 08:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stNc8-0005cc-9Y
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:43:12 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3261813b-7b1a-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:43:11 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53655b9bbcdso7758254e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:43:11 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49dd5asm1622425a12.54.2024.09.25.01.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:43:10 -0700 (PDT)
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
X-Inumbo-ID: 3261813b-7b1a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727253790; x=1727858590; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrbFrcCzYWqGSlmqm3wvIVsZFjBZlvkit6WWzCebR78=;
        b=h5EDLLBWm3irhhH5RwI9Ay1w4no/akJzdHNv0Txoq0BOQ4Zl2ya8rNe5lpcyXmCuZx
         eVG7bYrKov7Am3LKeGYKspKLod5L+nTUIW52aBK15YKH4Lci4ben1FcRZxhVvm5M6FPo
         Harzt0sdPBn8KNN0KBtTIbzd/6eu2HTQUJ358=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253790; x=1727858590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrbFrcCzYWqGSlmqm3wvIVsZFjBZlvkit6WWzCebR78=;
        b=MFCQnAEAGWXNJEJERBmDsdWYvvcc1gxR3nLzbgPyZFom7DesaVNIY4fManGHlt8CLT
         EW9EDZL8xH1M0reXKeF9BC8C5F0zJtDUZui8EChPsSlLfFjRVy/wiknqN/oqBpvW84hS
         Vw7XEaPTyywqX0DX2EN0A0q5Zh14hTEG3hELoWELiMDxZW4arVj454h1uZTrKP5/IHsR
         AktUNpv+Ap8+qcXmAvSWqmGfxwAt9wA0xM4FOQ/GkJ4h71JVzHpFzpEc2OKE7M0uJ2A/
         XhHpJBQ8BtJjkKpWquZAfDdhyF89wR7pPJygocx9k20D97yvsUV/RVwv3mN8GGhPq7X7
         UkAQ==
X-Gm-Message-State: AOJu0YzJmqBoi6WJ6LlwBsNeYD2iqB+4NTgAVow7D1oPFLEX7CITOi54
	NZGpCU7GlNt1H+Re7MW7JmCoENd69Uo/TSVI6chNzmywC4/NPFunh3GZ9eunIxZnyBnBEuxu5sc
	D
X-Google-Smtp-Source: AGHT+IF4iBlhUrjeezjidJmN8G+fTE1LWrk+c4d+nA9SwONISctrd7n8uEp8ZsmksdKzywULm6KjSA==
X-Received: by 2002:a05:6512:318c:b0:536:542d:d7e8 with SMTP id 2adb3069b0e04-5387048ad56mr1099902e87.8.1727253790416;
        Wed, 25 Sep 2024 01:43:10 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 6/6] x86/alternative: build time check feature is in range
Date: Wed, 25 Sep 2024 10:42:39 +0200
Message-ID: <20240925084239.85649-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925084239.85649-1-roger.pau@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ensure at build time the feature(s) used for the alternative blocks are in
range of the featureset.

No functional change intended, as all current usages are correct.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/include/asm/alternative-asm.h | 3 +++
 xen/arch/x86/include/asm/alternative.h     | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/x86/include/asm/alternative-asm.h b/xen/arch/x86/include/asm/alternative-asm.h
index 4092f5ba70a6..83e8594f0eaf 100644
--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -12,6 +12,9 @@
  * instruction. See apply_alternatives().
  */
 .macro altinstruction_entry orig, repl, feature, orig_len, repl_len, pad_len
+    .if \feature >= NCAPINTS * 32
+        .error "alternative feature outside of featureset range"
+    .endif
     .long \orig - .
     .long \repl - .
     .word \feature
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 69555d781ef9..b7f155994b2c 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -7,6 +7,7 @@
 #include <xen/lib.h>
 #include <xen/stringify.h>
 #include <asm/asm-macros.h>
+#include <asm/cpufeatureset.h>
 
 struct __packed alt_instr {
     int32_t  orig_offset;   /* original instruction */
@@ -59,6 +60,9 @@ extern void alternative_branches(void);
                     alt_repl_len(n2)) "-" alt_orig_len)
 
 #define ALTINSTR_ENTRY(feature, num)                                    \
+        " .if " __stringify(feature) " >= " __stringify(NCAPINTS * 32) "\n"\
+        " .error \"alternative feature outside of featureset range\"\n" \
+        " .endif\n"                                                     \
         " .long .LXEN%=_orig_s - .\n"             /* label           */ \
         " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
         " .word " __stringify(feature) "\n"       /* feature bit     */ \
-- 
2.46.0


