Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E86ABF7F4
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991979.1375760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkZ6-0008Ms-D6; Wed, 21 May 2025 14:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991979.1375760; Wed, 21 May 2025 14:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkZ6-0008KT-9s; Wed, 21 May 2025 14:37:04 +0000
Received: by outflank-mailman (input) for mailman id 991979;
 Wed, 21 May 2025 14:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHkZ4-0007cs-TQ
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:37:02 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e63b085-3651-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 16:37:01 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso55999745e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:37:01 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23c07bfsm72631465e9.23.2025.05.21.07.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 07:36:59 -0700 (PDT)
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
X-Inumbo-ID: 0e63b085-3651-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747838220; x=1748443020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SsF+xqOcNWx0UuYSVSIv0Shyn2lJXpUwn0fUWXAfkcg=;
        b=fL5iRpRkhkNScWV+N9uVrjXO13FrE1uuVDd7LNHP+rzuj86eUy3HWBcdFaTXgabye9
         bmL8XsTXqJ0XOdaWeBdKFN8DhFX34qN8wYlnMCNMAVjrJl5TJGs9UjM/BTCxyLRM38kO
         uK8iEP407icUmQaW80wuiJGIB7YeTGJHUPe5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838220; x=1748443020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsF+xqOcNWx0UuYSVSIv0Shyn2lJXpUwn0fUWXAfkcg=;
        b=SWW3F1ne8IwH74FbGsJ0p6igx86zVuyuiTk4kwUNpPVdb60zTCp/yEtLKz1lrfO8EK
         wDxbRMnU78Q0y11v4ldgsVs2O9F9v2yM85LZPzJKpLIUef55Q48HaCNyFmOsViQgfmlF
         h3J+RhRhRpgXw5f4zJRELIr7OXsmDmS2s0hAK656doo2iIUVpC9nMCCCtM4RldWAtYo5
         HBHHWayCh2n6PkpFOJ/GTHEXuF/qbjZXiu/zkyykyw+1CjCr/ywMBPhStGzmOYzWZoz9
         cxsj+EisQ8r5Z4Q0dxfU90GA7P2Mkhnwbz5AqFAnZcZV5nHxwdTwKaY3INTQ9a00CEdG
         ijag==
X-Gm-Message-State: AOJu0YyASKpUeFA+TUHioMHaLStYWyH22NcF9Ir3r79xEXsb3QCDywz9
	66xMN4b7CiuVPyToeXcFfIKp7tFwrILmuVbaN2qdZ98gq3HGdEPDYTCm2mlvQ+lwHX6+FKBmLH8
	dZztu
X-Gm-Gg: ASbGncu8pIIUz2Z7yXpHDvvT7Sc/OnHT/Y+DpuuJT58zxWcvVMA0et3Qk+D7ANv/Bu2
	WpQ1l12lU80GGr8QlDQ3cJSqBA9zz5tFexEaKaMXfXbs5jK5NyegcRbyypLnux0NUtG6XLnYbZc
	nIDu+Q4m3bHQN7HAifPX3a/hO7yXdyqa6WpcK9VigMZZD5KnEk9Qfu95bhYamUtlFJMW+7a0PpA
	6k04uJRleXoNGdSpgi/GR9FYIOaFOU3v03v0ibhOlLmAJyO62mpZ4VXT9+IB034iwjV3plOIPmc
	fwb2aBdbHm3TTQNyx6l1puSId4afyHHx6fTXA3ESKmsneATZLGNkiIN8+HueoHxruvmH8Aymoau
	GFz7vI3qhBcQlu4YBVomLQFM3
X-Google-Smtp-Source: AGHT+IFWKoCLl+DCDDowO3fNcVlFbsc0m9RWCVSkdVvh/AQWPRUY4b7Zug36saFReF2JnxDg1R9IiA==
X-Received: by 2002:a05:600c:c059:20b0:445:49e:796b with SMTP id 5b1f17b1804b1-445049e81c3mr104866955e9.17.1747838220239;
        Wed, 21 May 2025 07:37:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/msr: Rework wrmsr_safe() using asm goto()
Date: Wed, 21 May 2025 15:36:58 +0100
Message-Id: <20250521143658.312514-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This avoids needing to hold rc in a register across the WRMSR, and in most
cases removes direct testing and branching based on rc, as the fault label can
be rearranged to directly land on the out-of-line block.

No functional change.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/214
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/msr.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 0d3b1d637488..4c4f18b3a54d 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -69,20 +69,20 @@ static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
 /* wrmsr with exception handling */
 static inline int wrmsr_safe(unsigned int msr, uint64_t val)
 {
-    int rc;
-    uint32_t lo, hi;
-    lo = (uint32_t)val;
-    hi = (uint32_t)(val >> 32);
-
-    __asm__ __volatile__(
-        "1: wrmsr\n2:\n"
-        ".section .fixup,\"ax\"\n"
-        "3: movl %5,%0\n; jmp 2b\n"
-        ".previous\n"
-        _ASM_EXTABLE(1b, 3b)
-        : "=&r" (rc)
-        : "c" (msr), "a" (lo), "d" (hi), "0" (0), "i" (-EFAULT));
-    return rc;
+    uint32_t lo = val, hi = val >> 32;
+
+    asm_inline goto (
+        "1: wrmsr\n\t"
+        _ASM_EXTABLE(1b, %l[fault])
+        :
+        : "a" (lo), "c" (msr), "d" (hi)
+        :
+        : fault );
+
+    return 0;
+
+ fault:
+    return -EFAULT;
 }
 
 static inline uint64_t msr_fold(const struct cpu_user_regs *regs)
-- 
2.39.5


