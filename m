Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA0A2D1DE
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 01:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884154.1293971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLM-00024N-DS; Sat, 08 Feb 2025 00:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884154.1293971; Sat, 08 Feb 2025 00:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLM-00022f-94; Sat, 08 Feb 2025 00:05:08 +0000
Received: by outflank-mailman (input) for mailman id 884154;
 Sat, 08 Feb 2025 00:05:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lbac=U7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgYLK-0001YL-Nu
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 00:05:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59589284-e5b0-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 01:05:04 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436341f575fso31348785e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 16:05:04 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9656fsm72336295e9.3.2025.02.07.16.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:05:03 -0800 (PST)
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
X-Inumbo-ID: 59589284-e5b0-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738973104; x=1739577904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTqKadIyN6sdNG1mQTo/PfPx9tGHKvwwDx2zM0f3o6c=;
        b=s8TX7GSIJOm+EZj9W2M1lMDA5zChEcW7ojw/daUjyVRQsyJ/SjT9L7fMYRjFS6HfC5
         hCbAPU009+ZiBtJXKl3t169I3ADzxxU6u+nSO+aDMymDBrT6j1EBCYx0a09r+OYr9+hF
         tZqyUBfTIWxOHRoaj0vSJIna4TbjtKKyc1Vas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738973104; x=1739577904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTqKadIyN6sdNG1mQTo/PfPx9tGHKvwwDx2zM0f3o6c=;
        b=rd2WbxVR0FgR0b9YdolQW2cFZII8WUFNgAfajL+Xb3UFnieSOJ1xl1JODhbIeaBj1/
         elOeLOYQntO4fWfOo5kfb8qxTds8wlKFHpz5YASONXxJ8baZ9CA9stip3UMa+Zcvf/hj
         nMdJdrUv4IFMABoI4R4ZLHjZtUMUGfWauSkb6zohJeNhttpDgEXXMlKU7fe1jrwk6JeD
         fP0B2BHzGz6bP9s0IOu3EG/aPYbtMot1tnPbsSassseHziPyFTGrm1s9zKmzs6WDnTHp
         JIs+wBz1Q28vfzGEAQz6+74YaIWyEtP+PbXH1Xx5lquBqqJmbSdeF+yUAFqzVqKTNviJ
         MzuQ==
X-Gm-Message-State: AOJu0YzTp/e+MIF4McQB8njo/D+bE9bjQdnc24JuDcEeJGxnJtlkXpzF
	otELJRZGR0P+nmagJnIBcYY+KhBWKD/olvSxvInIA1ByvpUceSecpouZEyC76yHZUi5GzJYClX6
	bCI0=
X-Gm-Gg: ASbGncvX3DLZg/ZhQnzSmZVBj7DOxqX3SSjBWbsje3++Ol2QbpMCg/dZu9/Jc69mpHB
	BPFj1BgMh3mtAXu+nE4u5L8v9ILudwOalBcVPB0JrPetQ6gdCKgdqM8JcBbWb2aJu+Rf+4HbDvW
	XADXgwMME0IMIfRW3HpS/wxvwVowYNnX6EWWqvm6uEPPh+5bnjVIBKHP7S83+1KrvQjded1YFHd
	2v7p/b48zj5yZdJqYc8pHlKbt6tFCeSpmKApTh8vN1oHwo0KjrHwJc6q4LoKcpF7y5Mr9ObyU8S
	53j9HmanSl4QEeJ/u8Qua3Gu9VaPSb8Mck96giEmZ8qvpiouzmzpPxV2UFWUWZ9Aan6B2hU=
X-Google-Smtp-Source: AGHT+IEI9ETemwVvAetCXftnYLIP2CDAIhNoUpO/d3c9x8BeNctPIDNzf5wh7Jsw4xt2iot2pqKZjw==
X-Received: by 2002:a5d:6c66:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38dc8da6393mr4491670f8f.11.1738973104053;
        Fri, 07 Feb 2025 16:05:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/4] ARM: Fix register constraints in run_in_exception_handler()
Date: Sat,  8 Feb 2025 00:02:54 +0000
Message-Id: <20250208000256.431883-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208000256.431883-1-andrew.cooper3@citrix.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now, run_in_exception_handler() takes an input in an arbitrary register,
and clobbers BUG_FN_REG.  This causes the compiler to calculate fn in the
wrong regsiter.

Instead, use `register asm()` which is the normal way of tying register
constraints to exact registers.

Bloat-o-meter reports:

  ARM64:
    Function                                     old     new   delta
    dump_registers                               356     348      -8

  ARM32:
    ns16550_poll                                  52      48      -4
    dump_registers                               432     428      -4

The other instruction dropped in ARM64's dump_registers() is an alignment nop.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
----
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/bug.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index cacaf014ab09..8bf71587bea1 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -59,15 +59,15 @@ struct bug_frame {
  * be called function in a fixed register.
  */
 #define  run_in_exception_handler(fn) do {                                  \
-    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
-         "1:"BUG_INSTR"\n"                                                  \
+    register unsigned long _fn asm (STR(BUG_FN_REG)) = (unsigned long)(fn); \
+    asm ("1:"BUG_INSTR"\n"                                                  \
          ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
          "             \"a\", %%progbits\n"                                 \
          "2:\n"                                                             \
          ".p2align 2\n"                                                     \
          ".long (1b - 2b)\n"                                                \
          ".long 0, 0, 0\n"                                                  \
-         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
+         ".popsection" :: "r" (_fn) );                                      \
 } while (0)
 
 #define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
-- 
2.39.5


