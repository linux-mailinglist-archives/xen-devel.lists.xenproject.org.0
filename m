Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CE6849E47
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676198.1052180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xj-0007n1-6q; Mon, 05 Feb 2024 15:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676198.1052180; Mon, 05 Feb 2024 15:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xj-0007e8-0S; Mon, 05 Feb 2024 15:32:47 +0000
Received: by outflank-mailman (input) for mailman id 676198;
 Mon, 05 Feb 2024 15:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xh-0007Hv-NS
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:45 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf13b1bf-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:32:45 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51124d86022so7009478e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:45 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:43 -0800 (PST)
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
X-Inumbo-ID: cf13b1bf-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147164; x=1707751964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iky23uGR3BS6IkxuYzRpFhihZCpnB/wevBTC5pwq7kA=;
        b=O8Sc/2420TVqmHcErK7mxEFulRKLw+KUufdjoVf7+Klsa7nJRT3kBWPhKnr6eLWyyI
         er9P6akeT2WPCeHvVRTrMzTuJDXRDCdjSca/ZWJzCkXuhWvrJNAz+qbmxlxEE1gISHNy
         RyrmtXdbBr+USdjaX9wm3yBD8HCotCUIZPcBP5FaNpkm5jPI3eLPm95WEewoCXJ9B+TT
         JGtWhV2vjgmA97WXL2q7ND5je0Z0KtRMZCu3ywJl9rAMZ1WRT0mwEw0LuuV6he+o2sMz
         zjfiJ9mhr1Th4OanzZWPbcoA6vnJFICBb07MTfUrz5n0HWwKtcyY5M0tbCGKzEVbF97+
         dwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147164; x=1707751964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iky23uGR3BS6IkxuYzRpFhihZCpnB/wevBTC5pwq7kA=;
        b=BhPsfVUOufGKJAeH8C3lXqG13LWL0SMUmsKrZvwbTspmYbJ6BrxY8oZSGazHwaSfy/
         pHdQa29M+OyRXpTRjrlEzFEm2wx3y09Pyp+a4gkSXtf5bxN399bMqLCQi4KyDrX/kbqe
         mulkWhgicHEJr6zIdPh1W1nBYkYr0rzgkjrU+xa3anKg1jcxtvet3SZMn85+JZHmh3lH
         TNUqgyNE2UGE4uC6qh0Rb4nWqM+RQS0520jc80CzkfGQ2LHAgSOc60akZwxCEHQgSMf8
         yAmgx39WpmzWz7R5PC/oobvROd48CSpx3s8gHhTSb/DOPqM5CKGnZ0ouwbDgao+0mAhU
         uexA==
X-Gm-Message-State: AOJu0YyNKUhzzgX9SPBOFBIaavTUK1eXkMBcdHv8l0Pk4MUCzI5XgK3t
	DGL2MX0dvoWeh/cTh1d86QtmWRjkJD/6b1c9ic/XrbGL7QyqatNWJcBrhLKs
X-Google-Smtp-Source: AGHT+IFtASMyTmydnnfzuUhde2FJ4NxmjxoapaSKIh+dcYVoPZ6lxtpErVslZIDRXWdTgdn1F7bmFQ==
X-Received: by 2002:ac2:5969:0:b0:511:4caf:5fe1 with SMTP id h9-20020ac25969000000b005114caf5fe1mr2478560lfp.37.1707147163897;
        Mon, 05 Feb 2024 07:32:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX8EdkfnzPl4qrey/3AsNj1w0K59JWx765bJQm1AJiSw/nckbZIPn+PdTX0AAN77ZPpLQSyoLMTZMbNkeprio06FBzeew7sjLlY8dl6zc3/eZi6cvql9IrjissCHtgM1SGixmiakbGBUEDQf0B0t3Laj4BYWNM8ceugiGICJOjwNtNdqMsu1Ucaidn50E9C8fhPV1gZy9Om6MuUqORbzEVbRIopy0XCBKIV2w==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 03/30] xen: add support in public/hvm/save.h for PPC and RISC-V
Date: Mon,  5 Feb 2024 16:32:10 +0100
Message-ID: <c929f784466e1ba57c19663e88f22c598d961709.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No specific header is needed to include in public/hvm/save.h for
PPC and RISC-V for now.

Code related to PPC was changed based on the comment:
https://lore.kernel.org/xen-devel/c2f3280e-2208-496b-a0b5-fda1a2076b3a@raptorengineering.com/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
- Updated the commit message
---
Changes in V3:
 - update the commit message.
 - For PPC and RISC-V nothing to include in public/hvm/save.h, so just comment was
   added.
---
Changes in V2:
 - remove copyright an the top of hvm/save.h as the header write now is a newly
   introduced empty header.
---
 xen/include/public/hvm/save.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index 5561495b27..72e16ab5bc 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -89,8 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
 #include "../arch-x86/hvm/save.h"
 #elif defined(__arm__) || defined(__aarch64__)
 #include "../arch-arm/hvm/save.h"
-#elif defined(__powerpc64__)
-#include "../arch-ppc.h"
+#elif defined(__powerpc64__) || defined(__riscv)
+/* no specific header to include */
 #else
 #error "unsupported architecture"
 #endif
-- 
2.43.0


