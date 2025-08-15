Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA8B28736
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083885.1443336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Es-0005ZI-EX; Fri, 15 Aug 2025 20:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083885.1443336; Fri, 15 Aug 2025 20:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Es-0005U7-5P; Fri, 15 Aug 2025 20:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1083885;
 Fri, 15 Aug 2025 20:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Eq-0005Rl-Ma
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:24 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34576377-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:22 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b05a59fso15257325e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:22 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:21 -0700 (PDT)
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
X-Inumbo-ID: 34576377-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290482; x=1755895282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtXFDwLluZe8C/hKYY81pjsgXvMiYWUxXd7DbLa9zVQ=;
        b=CJALOHpyOti3wq0qxdR5pfZg6IFr4GeZe34MNJW4yVYDBaXQo1voImgQsntYQLsqi0
         StFAweuAwLaahP2XyZCPpK+/SMCaf56ZcLBVG+ycmj0RSoummY//VYliBmTpAOZceRjz
         r1J7VUb0Yrz30Fi2SH1rmQoke8ji9CqC7h6ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290482; x=1755895282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtXFDwLluZe8C/hKYY81pjsgXvMiYWUxXd7DbLa9zVQ=;
        b=DCaq1lHSXRsq+LBzNRgtox6jOGnk73OK3IUA3xN2IYu/Anj8BzPXBrv2it+bte5PHK
         5fAOAaNXbKS2vOosi7efl9U3i9+k57/rmTOt1Sv5Q+Xpfe4CFehlYTp2L8r4xnhylVY0
         QS/2oaLCk425sF/XokI7EdzOHFm8a0zAu4/687bVxv5yczF+rZKfwidjOaM5NhRZfHI4
         Q/oC02dof4YNcMgOlFKr5fJ8c6PNwW52KIWq7QeIkzirq33XeVn94ySKKGrNYq0fCP01
         iXNmpoDioAjxi1mLq0V/4xtXHvJk53ARpwV58j/n3ii9BYCUQOLcAMAteLvin7kq83b7
         4fIQ==
X-Gm-Message-State: AOJu0YwSi7ur2F0ZDRaIkaY/4W533rTrRube89sTfGSJgohxh6sHWDtO
	xnM41Ck8lsZ2AZAslsQQaukPlFXgsylzHV7nqO+oWtKfqgp5Sq45qasgY+i+ubqtsEKqEZqC41n
	YHnU0
X-Gm-Gg: ASbGncsowxFg3O3r5Y6c01Rn2ppbBNNkn0Y8d6lbn3rOFbfEXqw8OygUdmee5kmHFeM
	vZnX2NHiXPdUW/OK7xHiPyrsFRdv1skpCHzxn4v4ojAdtMUCWCU23cmriMoN7aM/Gl9rOOKdh7W
	/JE06AcVqxVWVuKt+xhC2K0ukltzfznj4GQUPZtorY/lSdudPllM8gb9rXB5ZbFZusA20dVD5um
	KpSx0p7VWrX7NtfU8O/P9mwwYrxdZXmucrGrf4IniMpwNucRrn5pBTrpWJPJf2X6eLbydeRyXOs
	/U2AxdntagBj6Hy2QPPSMexcvezH0vkjDEoBqJ2B/oKc9MRDsyb7dWJuyrvl/zijCRo9EC2OyVk
	nRBBhuApQGHciw31diHLztWSm/S3YC8FWMm/4DAeMpHPcTMFWSL/q9jiADdZFEAdXRzV2+Kc4dM
	Lg
X-Google-Smtp-Source: AGHT+IEWGuUvIBrWYMifHvQE9DG1hEtyvEMYFOjxojce4tUHcYXVFrPSZtIKy6FIduAlNyt1T8HclQ==
X-Received: by 2002:a05:6000:24c7:b0:3b7:7680:35d3 with SMTP id ffacd0b85a97d-3bc69cc2bdfmr304480f8f.37.1755290481764;
        Fri, 15 Aug 2025 13:41:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 02/16] x86/msr: Rework rdmsr_safe() using asm goto()
Date: Fri, 15 Aug 2025 21:41:03 +0100
Message-Id: <20250815204117.3312742-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... on capable toolchains.

This avoids needing to hold rc in a register across the RDMSR, and in most
cases removes direct testing and branching based on rc, as the fault label can
be rearranged to directly land on the out-of-line block.

There is a subtle difference in behaviour.  The old behaviour would, on fault,
still produce 0's and write to val.

The new behaviour only writes val on success, and write_msr() is the only
place where this matters.  Move temp out of switch() scope and initialise it
to 0.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/217
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Doing this safely does depend on getting GCC-14 into CI somewhere.  Debian
13/Trixie satisfies this, as does archlinux I expect.
---
 xen/arch/x86/include/asm/msr.h | 19 +++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c |  3 +--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index d2c86ddb09e9..6a97b41bae07 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -55,6 +55,24 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
 /* rdmsr with exception handling */
 static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
 {
+#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
+    uint64_t lo, hi;
+
+    asm_inline goto (
+        "1: rdmsr\n\t"
+        _ASM_EXTABLE(1b, %l[fault])
+        : "=a" (lo), "=d" (hi)
+        : "c" (msr)
+        :
+        : fault );
+
+    *val = lo | (hi << 32);
+
+    return 0;
+
+ fault:
+    return -EFAULT;
+#else
     int rc;
     uint64_t lo, hi;
 
@@ -73,6 +91,7 @@ static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
     *val = lo | (hi << 32);
 
     return rc;
+#endif
 }
 
 /* wrmsr with exception handling */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 4afbee59e53e..c3a484c50bf8 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1027,6 +1027,7 @@ static int cf_check write_msr(
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
     const struct cpu_policy *cp = currd->arch.cpu_policy;
+    uint64_t temp = 0;
     bool vpmu_msr = false;
     int ret;
 
@@ -1040,8 +1041,6 @@ static int cf_check write_msr(
 
     switch ( reg )
     {
-        uint64_t temp;
-
     case MSR_FS_BASE:
     case MSR_GS_BASE:
     case MSR_SHADOW_GS_BASE:
-- 
2.39.5


