Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441BA2A8692
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20059.45698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRn-00070k-IE; Thu, 05 Nov 2020 18:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20059.45698; Thu, 05 Nov 2020 18:57:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRn-000700-Ai; Thu, 05 Nov 2020 18:57:23 +0000
Received: by outflank-mailman (input) for mailman id 20059;
 Thu, 05 Nov 2020 18:57:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kakRl-0006gr-OE
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:21 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d9dd261-a20c-4b3f-8692-e58e969fd50c;
 Thu, 05 Nov 2020 18:57:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a3so2839263wrx.13
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:11 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:57:09 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kakRl-0006gr-OE
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:21 +0000
X-Inumbo-ID: 8d9dd261-a20c-4b3f-8692-e58e969fd50c
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8d9dd261-a20c-4b3f-8692-e58e969fd50c;
	Thu, 05 Nov 2020 18:57:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a3so2839263wrx.13
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2hblBpQBBS5NdLsTqWg42/ulV6RYw8DM4ijUkOSDxmc=;
        b=N2AqB3IxmclD0OoUcdMw5I5yPLH0O1tzCMCPXYTvw2C6YidmBN9/7/K637M0WhYwRx
         jkn5WD0jD+CbaX3RhodOzYUrkvC9OVeaP2sj3QrnP6EQ/DLMcH+eaynPhRDiBZvM4U4g
         G18mWhEuTn1xJSnM+3vLxQ9+ohhxHmo7xLBHHqsjEhTX5JPwUyPUI5+1f9sFkEbiXkIM
         jsoJY0c7kgxkyeC51HfsFiyd9vNFMUJxaCWsV9EUwBBfhy0CfudlBH4PlLcDlQTmO46n
         IskCQs12U919VbMP2GvrfJj/cfmmUoP+JqkOFjAnecxnJqxTCN2yqqWr4D2QgKXqVo8C
         Ntig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2hblBpQBBS5NdLsTqWg42/ulV6RYw8DM4ijUkOSDxmc=;
        b=XDHE0aXw2y9XYx2HynmyOlrNIrf1vToOyPQ6kxiGOv3t/a82bJ/Q4qzRe5vr+kE9rB
         HI2hp32vNHfmiovvag2OSwcdenl3Dxn+hm4nA1Aun/I5nzJFYzM22CLnF6j8ISYB1XTG
         L96NsW+DxSl7u0UiQ4CKO9y/vrbJzW7pP0ZN7r3GWndZGXVBiMbOoq9TQ6pJzzcVt4iN
         954/pOMQtF7am1lHcUWkyuoCzwcKlhmqxMLedvKHZpQNJqvnyodT5+TJARbI1CS3IUM7
         tqIX6GqSF+xvybkSUDgxslHg0MoX0A0rjhOEOZX4NR6YN8aZVosVi+r8//480WpWInNh
         mVmw==
X-Gm-Message-State: AOAM5312RtVlGY9Sr4rdF3anuPp7Sf3yUN6aGM+jryQN55Nx6DN0fNYN
	W9ceWwRW/4qc0thiYOrWLP2Jk8Cc5cY=
X-Google-Smtp-Source: ABdhPJzB6BSFEs1paVwMgXDuTbnRDHer5g36E3+ncp6SJksPOa8l52hgblR3dJfJV6G4xUQdVvNp1A==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr4579092wrv.75.1604602630143;
        Thu, 05 Nov 2020 10:57:10 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:57:09 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Ash Wilding <ash.j.wilding@gmail.com>
Subject: [RFC PATCH 6/6] xen/arm: Remove dependency on gcc builtin __sync_fetch_and_add()
Date: Thu,  5 Nov 2020 18:56:03 +0000
Message-Id: <20201105185603.24149-7-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-1-ash.j.wilding@gmail.com>
References: <20201105185603.24149-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have explicit implementations of LL/SC and LSE atomics
helpers after porting Linux's versions to Xen, we can drop the reference
to gcc's builtin __sync_fetch_and_add().

This requires some fudging using container_of() because the users of
__sync_fetch_and_add(), namely xen/spinlock.c, expect the ptr to be
directly to the u32 being modified while the atomics helpers expect the
ptr to be to an atomic_t and then access that atomic_t's counter member.

NOTE: spinlock.c is using u32 for the value being added while the atomics
helpers use int for their counter member. This shouldn't actually matter
because we do the addition in assembly and the compiler isn't smart enough
to detect signed integer overflow in inline assembly, but I thought it worth
calling out in the commit message.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm32/atomic.h |  2 +-
 xen/include/asm-arm/system.h       | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/arm32/atomic.h b/xen/include/asm-arm/arm32/atomic.h
index 544a4ba492..5cf13cc8fa 100644
--- a/xen/include/asm-arm/arm32/atomic.h
+++ b/xen/include/asm-arm/arm32/atomic.h
@@ -200,6 +200,7 @@ static inline int atomic_add_return(int i, atomic_t *v)
 
 	return ret;
 }
+#define atomic_fetch_add(i, v) atomic_add_return(i, v)
 
 static inline int atomic_sub_return(int i, atomic_t *v)
 {
@@ -212,5 +213,4 @@ static inline int atomic_sub_return(int i, atomic_t *v)
 	return ret;
 }
 
-
 #endif /* __ASM_ARM_ARM32_ATOMIC_H */
diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
index 65d5c8e423..86c50915d9 100644
--- a/xen/include/asm-arm/system.h
+++ b/xen/include/asm-arm/system.h
@@ -3,6 +3,7 @@
 #define __ASM_SYSTEM_H
 
 #include <xen/lib.h>
+#include <xen/kernel.h>
 #include <public/arch-arm.h>
 
 #define sev()           asm volatile("sev" : : : "memory")
@@ -58,7 +59,14 @@ static inline int local_abort_is_enabled(void)
     return !(flags & PSR_ABT_MASK);
 }
 
-#define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
+#define arch_fetch_and_add(ptr, x) ({                                   \
+    int ret;                                                            \
+                                                                        \
+    atomic_t * tmp = container_of((int *)(&(x)), atomic_t, counter);    \
+    ret = atomic_fetch_add(x, tmp);                                     \
+                                                                        \
+    ret;                                                                \
+})
 
 extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
 
-- 
2.24.3 (Apple Git-128)


