Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE964AC0F37
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994168.1377228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PF-0004KI-UT; Thu, 22 May 2025 15:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994168.1377228; Thu, 22 May 2025 15:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PF-0004H5-Ps; Thu, 22 May 2025 15:00:25 +0000
Received: by outflank-mailman (input) for mailman id 994168;
 Thu, 22 May 2025 15:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI7PE-0003qi-A4
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:00:24 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c4769fb-371d-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 17:00:22 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-601a6e2e93cso1078856a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:00:22 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac32a7fsm10550119a12.56.2025.05.22.08.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 08:00:21 -0700 (PDT)
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
X-Inumbo-ID: 7c4769fb-371d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747926022; x=1748530822; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ul/tNZRZ1TlH45ain/OMZmy2A/UotZfS6GWeE2NRSQ=;
        b=qy2JAXsno9K7JStIq8vmmLp9fL6Yrq8IJSeSjDLqSt4wjW1gWm6oTmW5SxCuj/jyrH
         O7FN1N7pXdf/lGsdBzdn+yHVYe+658tL+yjM9qXQ6iAySeo6PpVJZMYvP9GdjKCyUbsG
         eyw0DLeo6cEJTPsVcHIpHfDquxtOOHPB/xsuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926022; x=1748530822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ul/tNZRZ1TlH45ain/OMZmy2A/UotZfS6GWeE2NRSQ=;
        b=Ohb2G6bDafR2nqpzwdHrjabZ06OFdHBi2wEv4VH4bmCnS8NKvN6Ya9zalEfHBtbIeG
         a5DlxC1zAK+K+QRB8hON2MDWu9cTecveIhR/FRs3awVCGiwSjdjRmlUrKHu2a0xbJUz9
         75ZzUsLynP4PLHEVCCDmZm0AKQ4OxeKj/9Jf1GsQCwVikvxKBYvd6/GU3YOcRJ+Tpe7P
         UhYt1GmCHXf4ec+RB6cPVoeY/hyUBAYlgy/cMStOAcVV6qdLcwvfHivrqA4G/TPhhX76
         0hrfl/e6Mki2U9n5DFuPKVnVQaOFsJ4euXgQZlNtwKTUsDO6zb2r5i++VL/PGtCf3HKP
         o+YQ==
X-Gm-Message-State: AOJu0Yz2P0ZCxmRThUyMDjIB1fIorKSO3CHVvgN7oN7FRsBCiPcYubYM
	WdQsqyUoyvFK0siepVp3e88KMMBuk/AeM8j3i7pz5xQtvRZhsfbtg26FTTaX97oLMjOJ4A3ua/0
	F/Zb6
X-Gm-Gg: ASbGncuD/3BlD4r/EIYAsLT/J0xEteYsdn5gs7xo/2cYTmW3ZBo0I+917ZjQvbAgZLB
	LVF3VucMK4VbQeJ4Kt4A5xBA7CfuN1+uJION92WJ8+1RoUNKvLGlaR0U5WBQJtZ9tauLvQ+dKkQ
	X/EV5WMKG69HpIXlFhOKEP/IxH9kf5JdQ5uY+z7Cae1BhsN9ftFJYzINAn/pexEymAU9iM3nEDj
	WvMaknhE6HcQqCBmvtnEqlKNAC1LjsLB5cZrsX9UHNyXmXaUPjseWdyxHnZIFryafqr/7XrFeWG
	zIdcKiflCssQuaYetB3A3p91AfQ8kH4gTphrI+lczX/4PwTtKdgZh3H7/yZ8ped4/ya0PxRPSMO
	GFSpuBLzYeSrXvlYcWnkt2V3aZgsQFyAwlxo=
X-Google-Smtp-Source: AGHT+IFASlcGlaKb1Z2UunBUZ54ibZHHQNVikl7rpE8jSvm4IynpdunZ+amUYf3dZh7NQwzlRJx06g==
X-Received: by 2002:a05:6402:2105:b0:602:d98:5d83 with SMTP id 4fb4d7f45d1cf-6020d9860bamr9635108a12.5.1747926021934;
        Thu, 22 May 2025 08:00:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/alternatives: Rework get_ideal_nops()
Date: Thu, 22 May 2025 16:00:14 +0100
Message-Id: <20250522150015.555492-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522150015.555492-1-andrew.cooper3@citrix.com>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The {k8,p6}_nops[] arrays are both 80-byte structures indexing 45-byte
structures.  Furthermore, perhaps unusually for C, the source layout is an
obvious hint about the trangular nature of the structure.

Therefore, we can replace the pointer chase with some simple arithmatic.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

The implemenation of get_ideal_nops() changes from:

    mov    0x19bc41(%rip),%rax        # <ideal_nops>
    mov    %edi,%edi
    mov    (%rax,%rdi,8),%rax
    jmp    <__x86_return_thunk>

to:

    lea    -0x1(%rdi),%eax
    imul   %edi,%eax
    shr    %eax
    add    0x67fc1(%rip),%rax        # <ideal_nops>
    jmp    <__x86_return_thunk>

The imul has a latency of 3 cycles on all CPUs back to the K8 and Nehalem.
It's better than an extra deference on all CPUs, even the older ones.
---
 xen/arch/x86/alternative.c | 40 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index cc2d0c89aca3..ff7d83c0ddbd 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -20,7 +20,7 @@
 #define MAX_PATCH_LEN (255-1)
 
 #ifdef K8_NOP1
-static const unsigned char k8nops[] init_or_livepatch_const = {
+static const unsigned char k8_nops[] init_or_livepatch_const = {
     K8_NOP1,
     K8_NOP2,
     K8_NOP3,
@@ -31,22 +31,10 @@ static const unsigned char k8nops[] init_or_livepatch_const = {
     K8_NOP8,
     K8_NOP9,
 };
-static const unsigned char * const k8_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
-    NULL,
-    k8nops,
-    k8nops + 1,
-    k8nops + 1 + 2,
-    k8nops + 1 + 2 + 3,
-    k8nops + 1 + 2 + 3 + 4,
-    k8nops + 1 + 2 + 3 + 4 + 5,
-    k8nops + 1 + 2 + 3 + 4 + 5 + 6,
-    k8nops + 1 + 2 + 3 + 4 + 5 + 6 + 7,
-    k8nops + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8,
-};
 #endif
 
 #ifdef P6_NOP1
-static const unsigned char p6nops[] init_or_livepatch_const = {
+static const unsigned char p6_nops[] init_or_livepatch_const = {
     P6_NOP1,
     P6_NOP2,
     P6_NOP3,
@@ -57,21 +45,9 @@ static const unsigned char p6nops[] init_or_livepatch_const = {
     P6_NOP8,
     P6_NOP9,
 };
-static const unsigned char * const p6_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
-    NULL,
-    p6nops,
-    p6nops + 1,
-    p6nops + 1 + 2,
-    p6nops + 1 + 2 + 3,
-    p6nops + 1 + 2 + 3 + 4,
-    p6nops + 1 + 2 + 3 + 4 + 5,
-    p6nops + 1 + 2 + 3 + 4 + 5 + 6,
-    p6nops + 1 + 2 + 3 + 4 + 5 + 6 + 7,
-    p6nops + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8,
-};
 #endif
 
-static const unsigned char * const *ideal_nops init_or_livepatch_data = p6_nops;
+static const unsigned char *ideal_nops init_or_livepatch_data = p6_nops;
 
 #ifdef HAVE_AS_NOPS_DIRECTIVE
 
@@ -86,9 +62,17 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
 # define toolchain_nops_are_ideal false
 #endif
 
+/*
+ * Both k8_nops[] and p6_nops[] are flattened triangular data structures,
+ * making the offsets easy to calculate.
+ *
+ * To get the start of NOP $N, we want to calculate T($N - 1)
+ */
 static const unsigned char *get_ideal_nops(unsigned int noplen)
 {
-    return ideal_nops[noplen];
+    unsigned int offset = ((noplen - 1) * noplen) / 2;
+
+    return &ideal_nops[offset];
 }
 
 static void __init arch_init_ideal_nops(void)
-- 
2.39.5


