Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAE9415DF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 17:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767943.1178649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpA6-0006Ap-SE; Tue, 30 Jul 2024 15:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767943.1178649; Tue, 30 Jul 2024 15:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpA6-00068n-P9; Tue, 30 Jul 2024 15:53:18 +0000
Received: by outflank-mailman (input) for mailman id 767943;
 Tue, 30 Jul 2024 15:53:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/bP=O6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYpA4-00068f-U4
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 15:53:16 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d45a0a4d-4e8b-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 17:53:14 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7a1dac7f0b7so294669085a.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 08:53:14 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73f02c3sm650988685a.65.2024.07.30.08.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 08:53:12 -0700 (PDT)
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
X-Inumbo-ID: d45a0a4d-4e8b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722354793; x=1722959593; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x26zs6CcCUyr+tPboAGAeAUd3pUjBBOwMMI7r116+WM=;
        b=PoSjQwE/5MPbE4n+dB85GaoVk+xWdlRzDSCwFXGo30kQkghUTeFSyWHVKv8ZeYXFvs
         rf7N/scWGPhYi9D41PbFmmlYg1S7XGxJKbe6bh7NemL9qEQGG6F95hCX8FLL/R1n6Aob
         edDrPqS4xVZZBPOoBO+Da4O9PB/Kbi8EF9UGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354793; x=1722959593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x26zs6CcCUyr+tPboAGAeAUd3pUjBBOwMMI7r116+WM=;
        b=WVECc7Ofzy8c8Xkn8plDIpHAXfZlkYUhbmwZMXshgIuGtpc/xqYMTcKRLzKyhYoXOZ
         IG+TP50IOI9kBaFiZOz2p++wDXFc+CbeShlB0RulFEFUwkpeDCDxoZOYmhTZPNPZQLiJ
         7/otAADVoQXFV9OZ0VyLBMCJHfdErDmmoXVlg8d7rw8CwJadBW4d3bWLYcVXQ17gs6k/
         mZjUqTn2lDM46T4G4lv3xBsGAxn3AL+ywnQy4ysihB2SvWxzidSXh0lETZLFUUDLnOk1
         zRJ2wSdukpYgASG+auJiF9OO+4DNsCDFrF/scPjDozQa8D3HKiZXn9ZQLGAS/TeT/C5k
         bBfw==
X-Gm-Message-State: AOJu0YydD9jG6GnrmfXJeVeJnRXUf2SoQssRLgbGkfeCEc/nMFwi0Evy
	cRLPKMH2WYUeK4BeCkAC9A/bkfPKObnN96ZI6GBXfFCMjQIG39MpKCf0YOuZP2vLEHGutqCdxdx
	t
X-Google-Smtp-Source: AGHT+IHubYDM1jWP1FzmnMgVKszWkQ06DP81wrJB5eS3p+W/05GelQVrROvze/bdNo0U5zN2GtHEdw==
X-Received: by 2002:a05:620a:4721:b0:79f:1f6:ab9f with SMTP id af79cd13be357-7a1e525e6bamr1102989485a.29.1722354793040;
        Tue, 30 Jul 2024 08:53:13 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v3] x86/altcall: further refine clang workaround
Date: Tue, 30 Jul 2024 17:53:05 +0200
Message-ID: <20240730155305.49172-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code in ALT_CALL_ARG() won't successfully workaround the clang
code-generation issue if the arg parameter has a size that's not a power of 2.
While there are no such sized parameters at the moment, improve the workaround
to also be effective when such sizes are used.

Instead of using a union with a long use an unsigned long that's first
initialized to 0 and afterwards set to the argument value.

Reported-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Suggested-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Fix indentation and style issues.
 - Adjust comment to match the new workaround.
---
 xen/arch/x86/include/asm/alternative.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index e63b45927643..c5fa242e76b3 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -169,27 +169,25 @@ extern void alternative_branches(void);
 
 #ifdef CONFIG_CC_IS_CLANG
 /*
- * Use a union with an unsigned long in order to prevent clang from
- * skipping a possible truncation of the value.  By using the union any
- * truncation is carried before the call instruction, in turn covering
- * for ABI-non-compliance in that the necessary clipping / extension of
- * the value is supposed to be carried out in the callee.
+ * Clang doesn't follow the psABI and doesn't truncate parameter values at the
+ * callee.  This can lead to bad code being generated when using alternative
+ * calls.
  *
- * Note this behavior is not mandated by the standard, and hence could
- * stop being a viable workaround, or worse, could cause a different set
- * of code-generation issues in future clang versions.
+ * Workaround it by using a temporary intermediate variable that's zeroed
+ * before being assigned the parameter value, as that forces clang to zero the
+ * register at the caller.
  *
  * This has been reported upstream:
  * https://github.com/llvm/llvm-project/issues/12579
  * https://github.com/llvm/llvm-project/issues/82598
  */
 #define ALT_CALL_ARG(arg, n)                                            \
-    register union {                                                    \
-        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
-        unsigned long r;                                                \
-    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
-        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
-    }
+    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
+        unsigned long tmp = 0;                                          \
+        *(typeof(arg) *)&tmp = (arg);                                   \
+        BUILD_BUG_ON(sizeof(arg) > sizeof(unsigned long));              \
+        tmp;                                                            \
+    })
 #else
 #define ALT_CALL_ARG(arg, n) \
     register typeof(arg) a ## n ## _ asm ( ALT_CALL_arg ## n ) = \
-- 
2.45.2


