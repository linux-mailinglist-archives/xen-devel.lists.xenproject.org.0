Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4670B2873C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083890.1443385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ew-0006qq-Jh; Fri, 15 Aug 2025 20:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083890.1443385; Fri, 15 Aug 2025 20:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ew-0006lR-CN; Fri, 15 Aug 2025 20:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1083890;
 Fri, 15 Aug 2025 20:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Eu-0005Rl-D1
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36da42d3-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:26 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b0becf5so11025885e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:26 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:25 -0700 (PDT)
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
X-Inumbo-ID: 36da42d3-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290486; x=1755895286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxRXdg9UPt8dkHi8B3FuNiEDbj6Vs8SSKaXVlL6xJiM=;
        b=opFI7NfD6VFf4BuIdOy6CZrbe4Ddc/qfxXUMhrYK5GLXYf3ayeOH43yo/GkN7oIFBP
         d8rsOvZURZ80a0hU03HL8I3M7US8jF2zQKJvmy6s5/yGQ+leUOTYpyXqdni38qcBtiXJ
         qH8MTyFEmYre+LRl2BanBBSh6NOmzFwkz2uQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290486; x=1755895286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxRXdg9UPt8dkHi8B3FuNiEDbj6Vs8SSKaXVlL6xJiM=;
        b=LcqUesCQleNjTbH0AKziPA9Redf4HsEEbzrN2ldPXOwUd4WMFRNcRtEiyUzOBlQPXT
         gxmS1Mhq54HGTQjMTLBKeStFMbJXPBn3RBWJwzcaXcxyWH/nHzVtjbpsGztMS1reBncK
         vodTSi7HiDr5c4l4/R/BVYYjcJq6Hg25Z0ouL+STExoDBVYtOCdV9DNJSmBzvKkaszhx
         Mhkr8cJL99zQUoRAluyd7EqTN0lJy9t0JdVc2LHJ/ed5q/XZSO0EPpyalZCyJZxXdvte
         ajEeiBCMXqvYAIHPVSh1MnkkFm0IJM44LfPjLIPcsOT+3z3mKcdXrmnu3bxp0I0D/0kO
         nnzA==
X-Gm-Message-State: AOJu0YzQy4TzZh+iWswO7nrg2pT+c9lpbC5wAFhTrIs58+KHoOTMa4bc
	6ajLfhHnFSuKCxwXapiX2VjHJxfeoN/QyPj1iszRPPmo28LXtv3/MkUHl4fHEcg3BY1Ubgw9ove
	i087+
X-Gm-Gg: ASbGnctzzvGVlJDOwoGxrNcdGM646Upbb60zm+//wPsEzxFinJOlfxJiIKKCNZzsgHr
	xReRr3z6kZ5TQP7n6EneHoe2tf8eoHx8WQ2RjxKQc94InkVW5JM6cN51qsxWgDsTe/Xrgnl/csb
	xyTum1TuTDMKI/cCfKsonecYyd+vDjbswsNmZXkfOhHDx4mhJAhkdt0GkrvpX8wqkvSknaelWP+
	2JDTsXaPh3Y2gJWPsPvW6XXb5UIOIXRrNEjrZRAFW15v3MxBhXn1UrUw6jXwEgY04k6g/WBgTY3
	MSftYbLElfeKmzBZ3xCOp6NN4VNjAPtxOK1yyGgjaqUJ4mbyjIH6q/nvHPtMVdcq8utSexqXq38
	P4tiSAY1UcpwhU73ViaQ8iK0Ohl4QW/mXnckQzHdTViLu4bu1zgv9mL1VV54KYCLuIdXnoamoob
	Pj
X-Google-Smtp-Source: AGHT+IFiZFIFWk7O6XDfdO/dJOYAueyeHWg2xRt6N9IJ5+HDhJCMvOXCZfA7ZpFMp4D+kZkeHUGRzA==
X-Received: by 2002:a05:6000:2004:b0:3b8:d15f:1d4a with SMTP id ffacd0b85a97d-3bb68fdd5famr2814365f8f.41.1755290485935;
        Fri, 15 Aug 2025 13:41:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 07/16] x86/msr: Move msr_{split,fold}() into asm/cpu-user-regs.h
Date: Fri, 15 Aug 2025 21:41:08 +0100
Message-Id: <20250815204117.3312742-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now there is a local header, asm/cpu-user-regs.h is a far better place for
these to live.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/cpu-user-regs.h | 11 +++++++++++
 xen/arch/x86/include/asm/msr.h           | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpu-user-regs.h b/xen/arch/x86/include/asm/cpu-user-regs.h
index d700a3ef3447..5b283a2f6d02 100644
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -55,4 +55,15 @@ struct cpu_user_regs
      */
 };
 
+static inline uint64_t msr_fold(const struct cpu_user_regs *regs)
+{
+    return (regs->rdx << 32) | regs->eax;
+}
+
+static inline void msr_split(struct cpu_user_regs *regs, uint64_t val)
+{
+    regs->rdx = val >> 32;
+    regs->rax = (uint32_t)val;
+}
+
 #endif /* X86_CPU_USER_REGS_H */
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1c0e768d9123..4aeb06f6524d 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -113,17 +113,6 @@ static inline int wrmsr_safe(unsigned int msr, uint64_t val)
     return -EFAULT;
 }
 
-static inline uint64_t msr_fold(const struct cpu_user_regs *regs)
-{
-    return (regs->rdx << 32) | regs->eax;
-}
-
-static inline void msr_split(struct cpu_user_regs *regs, uint64_t val)
-{
-    regs->rdx = val >> 32;
-    regs->rax = (uint32_t)val;
-}
-
 #define rdpmc(counter,low,high) \
      __asm__ __volatile__("rdpmc" \
 			  : "=a" (low), "=d" (high) \
-- 
2.39.5


