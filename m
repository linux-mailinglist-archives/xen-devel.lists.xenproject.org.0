Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BFA9677C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 13:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962488.1353702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7BsI-0004SZ-3p; Tue, 22 Apr 2025 11:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962488.1353702; Tue, 22 Apr 2025 11:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7BsI-0004Q5-0V; Tue, 22 Apr 2025 11:33:14 +0000
Received: by outflank-mailman (input) for mailman id 962488;
 Tue, 22 Apr 2025 11:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7BsG-00048Z-HN
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 11:33:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b5164c6-1f6d-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 13:32:59 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so6343041f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 04:33:11 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa420816sm15195591f8f.15.2025.04.22.04.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:33:09 -0700 (PDT)
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
X-Inumbo-ID: 8b5164c6-1f6d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745321590; x=1745926390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx+o/dQ58isqOyEG718e5dLb1KkGAs/SXDSdWo0AZ+8=;
        b=EmEyMplD1wf+ngEGqUcqp33XPUS1gVPRzZCaUah+2k5bUHzlpAQna/ZMgHaYtR6bQ1
         y52Td+0zBouNUzu6/HgSG2XrV+JweZ5BCqJ3Pvohr0csbrvlo7icMDSku5H8osUp4I6k
         vdrfVFll3WPL8KeNny16fdniqfHVB7Nfh9bmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321590; x=1745926390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx+o/dQ58isqOyEG718e5dLb1KkGAs/SXDSdWo0AZ+8=;
        b=KnPMQb7bRm3u0RIl1ZCoO+HVpmNxG5kYGyk1qnF+6fb/MQ8r64mXafC4/t323Z9X92
         54fSO/gZ2kKrq58ETQFiQaAJbw7g/cXbKGbT6oh0I1J4WcB0dnfiDx4lh8IW/Qkjwzri
         aMK1U820iMucUBdVprQxHRmmDlf9sUtflCJBA9s7cB6Lh3ndrm5do0XxbZJrIBt+EpGQ
         lGW9D19qp6xPzZCmCyl6lFrF4GL7ezfT78q8syWQx7TqTnR03eGsmU2NV34MjI1rWqHa
         Y/GjaPivxsIdhBKJ+2WjY8bpvHBrn4r7bJFFs0AJZeHxu/S6noaQU2r8EYr59lefEuTb
         fVBw==
X-Gm-Message-State: AOJu0YwLVp/bvh7fIGTFsM+M/yTWlMra9aiXJokNa06uzb/6DkSw51wk
	YwX7QEtT8EboUVDVF9TPr7z/aPdJZKk7jHHujECbUKlW9SiBu24az+HU2eINqy5PV30rI1qHoEx
	bKSmF2w==
X-Gm-Gg: ASbGncu9NoRe11c8y9SjuWrG5cuCGpSARG2CFA4icW5v6c+9w560bSgy858CzfeDj2x
	bAgJui4jzbhvEZZxU5JH6A2ig6ZKTu0BAjOPHlZ7CTcrDpXPnkcWXqeSgCx4JwpIj0ZqF5ts2Cl
	wjrWDZOcLGVqSnnidjXgMU4AsGzRIV7cYanLhg3sEI1TqUSKP0MgiMTmC3hRETLJW0x+ywO3SOQ
	kFJLp4mbSwLYj4zX73yh31lb8fwlZiH/Esh9ZDSWv55tVtzwhxURVfMiFjy5H177CckYtUCw0Nw
	5dms7yKkFhz2iVJD29koI37jiSLLLrjWBIJOXGmlrAgkVzPf5f/yywdbof2zEg==
X-Google-Smtp-Source: AGHT+IHQXe4zXh5S3iWTfzymfmpb18OE3/B48Bqywyw4taEp8wiQN1jy/yf/I/+5uvbLPr8iBrtEpg==
X-Received: by 2002:a05:6000:713:b0:39e:cbc7:ad45 with SMTP id ffacd0b85a97d-39efbaf6c2emr10858331f8f.52.1745321590230;
        Tue, 22 Apr 2025 04:33:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/alternative: Clean up headers
Date: Tue, 22 Apr 2025 12:33:07 +0100
Message-Id: <20250422113307.1285890-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

alternative.h doesn't need lib.h now that macros.h exists.  Futhermore, STR()
is already the prevailing style, so convert the final __stringify() to drop
stringify.h too.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/alternative.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 38472fb58e2d..7326ad942836 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -4,8 +4,10 @@
 #ifdef __ASSEMBLY__
 #include <asm/alternative-asm.h>
 #else
-#include <xen/lib.h>
-#include <xen/stringify.h>
+
+#include <xen/macros.h>
+#include <xen/types.h>
+
 #include <asm/asm-macros.h>
 #include <asm/cpufeatureset.h>
 
@@ -65,7 +67,7 @@ extern void alternative_branches(void);
         " .endif\n"                                                     \
         " .long .LXEN%=_orig_s - .\n"             /* label           */ \
         " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
-        " .word " __stringify(feature) "\n"       /* feature bit     */ \
+        " .word " STR(feature) "\n"               /* feature bit     */ \
         " .byte " alt_orig_len "\n"               /* source len      */ \
         " .byte " alt_repl_len(num) "\n"          /* replacement len */ \
         " .byte " alt_pad_len "\n"                /* padding len     */ \
-- 
2.39.5


