Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC19987145
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805205.1216290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stldB-0002TK-6t; Thu, 26 Sep 2024 10:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805205.1216290; Thu, 26 Sep 2024 10:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stldB-0002P3-15; Thu, 26 Sep 2024 10:21:53 +0000
Received: by outflank-mailman (input) for mailman id 805205;
 Thu, 26 Sep 2024 10:21:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stld9-0001Nm-9o
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:21:51 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24352dd8-7bf1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:21:49 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c5c3a1f474so794922a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:21:49 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c2e1sm2934235a12.16.2024.09.26.03.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 03:21:48 -0700 (PDT)
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
X-Inumbo-ID: 24352dd8-7bf1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727346109; x=1727950909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywZGPtsIfa0h17GkvBRUIsYKnFHzO/XQjadqj7/ZxH8=;
        b=SX+gbVyyzHlceh4E64MVs2KN4rNoUvL+XcaAdOoqqOrY2l9jPZlcBh1QKUD+mQmzRh
         /+/0sTOgZhWIbs2FKpRXRJqUD0l3w9VXAsgIPwdI1vcIb+He6HUWeO33/p8xBbFB68yp
         JKYVtvpYxZSE2OEtopgh18zkQfkDXVMN7tJeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346109; x=1727950909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywZGPtsIfa0h17GkvBRUIsYKnFHzO/XQjadqj7/ZxH8=;
        b=CfV31MWnc8DaRSK6BkFqHz8sN1/zC7zeOgz3yXYe3U9uCV6S4HwVOPzCvHlinc2IwO
         Za2zpCe7Jq0MyWDJq9mBPeYaOVFqdZAdQ6CsgWAMA/5whtJyGn30PvK5aO29Vk1+sKHc
         2VGxhWQOiGja5SI4HFzLpH8rSAdZ7CgLs/zW2pFlf3sL2Qeqs8KD7la1q9aceikqnE5Q
         aUdD+7H5PYEMECrdetLtjz4ivzEF9C9C82jT/SteFRwfZomQhFt+MBRIYmtlbeEY4NcE
         4mcUrjn7RQKmJLNCWTT8zhhczIglpH1eQd434/vSMZmgVKPopoS+3432vYNKHnEBHnBU
         bgqQ==
X-Gm-Message-State: AOJu0YyeqdY7yQCOQeIMlUsjKuABoQK2t3iI4dzQBkTIv+MVVtrAK5IQ
	SEOQOkG5YdoKZtHBcLxwy1HUf6JxaIQSSU9UNiZort1qIvulcfj/8hc9tPDYhY4ZCQ6KKtsFKj7
	C
X-Google-Smtp-Source: AGHT+IGnFTZi2ZuHArJb2u9Y1LXrvap6o8KJDZdB8pC7pVyxINPY0snPdKghJfyCQIj5P7u4QlTU0A==
X-Received: by 2002:a05:6402:2788:b0:5c7:2131:5d3 with SMTP id 4fb4d7f45d1cf-5c721310723mr3896532a12.12.1727346108796;
        Thu, 26 Sep 2024 03:21:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 5/5] x86/alternative: build time check feature is in range
Date: Thu, 26 Sep 2024 12:14:31 +0200
Message-ID: <20240926101431.97444-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926101431.97444-1-roger.pau@citrix.com>
References: <20240926101431.97444-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ensure at build time the feature(s) used for the alternative blocks are in
range of the featureset.

No functional change intended, as all current usages are correct.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v2:
 - s/__stringify/STR/.

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
index 69555d781ef9..38472fb58e2d 100644
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
+        " .if " STR(feature) " >= " STR(NCAPINTS * 32) "\n"             \
+        " .error \"alternative feature outside of featureset range\"\n" \
+        " .endif\n"                                                     \
         " .long .LXEN%=_orig_s - .\n"             /* label           */ \
         " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
         " .word " __stringify(feature) "\n"       /* feature bit     */ \
-- 
2.46.0


