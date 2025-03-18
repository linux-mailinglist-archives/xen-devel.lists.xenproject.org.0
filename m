Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16773A66F87
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918729.1323374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6V-0001FX-Be; Tue, 18 Mar 2025 09:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918729.1323374; Tue, 18 Mar 2025 09:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6V-0001Ex-8i; Tue, 18 Mar 2025 09:19:19 +0000
Received: by outflank-mailman (input) for mailman id 918729;
 Tue, 18 Mar 2025 09:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuT6T-0001Er-UB
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:19:17 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b0e049-03da-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 10:19:16 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so4418508f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:19:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d393bb288sm19711245e9.29.2025.03.18.02.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:19:15 -0700 (PDT)
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
X-Inumbo-ID: 10b0e049-03da-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742289556; x=1742894356; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQyj+8gxcUxgHvEe1NNFlxycQRcd7X/ZYftV2VeVJ7c=;
        b=A9GuLNcy2g2v/24u0uujKWbjGuJy/7LYLnOvY46Tao0hii193VgLyaPgIyvPSe+a9/
         uVBNQ1ROe1L6D2/jhi4F/p7rDqeozOTyfSbW42F/EUD0ylArI74U1ij0qz29CnbqQaE5
         Yncy0zr2phUAoWz66WNlIa7haWBJ4sAgqbItI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289556; x=1742894356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQyj+8gxcUxgHvEe1NNFlxycQRcd7X/ZYftV2VeVJ7c=;
        b=ANRagqtsyheDK5tbecfLQJVrWiE7BzL38IixkxKA3G3VSb1hVzgfmwB8DlyrfxkDmS
         nUfQyw7o3b1DQCEmjLAnu2y7b8x5KMmG30ALDFGdsNdqtGPzRlHnJyTVVp/lomYl+3Mk
         /KztPALL7LvVCVRQXK7WE5ngKZjdAyqxNZbSL3MHyE6xqTl4y4IOQjuNLaBY8oZkmAwH
         ifijyck2fPbu9AXoBsv8lFN65W5Z+wPheixQoZxkPDGD2ZVxVpHCuDfYtnpL4Yso97tK
         2ZhDs94y+w+VduxhV0qIeESziwA42kpFWve0h7b5vCHmZP0A3HAE1Wmp4qjjR6Jd4Rod
         ZaRg==
X-Gm-Message-State: AOJu0YwIBF5lxcUBzirU01qCUuh8OIFA0N8fi3Cr+YhCtfMbYNGOlmVE
	KiXT6BhNQ326QenHA4WSerOiUNLWR9CwKa56RDwwFKt0ra98DB1j1n1Ky0s+GUVeq3RzHnWLUdm
	N
X-Gm-Gg: ASbGncsn88iNCTUgcnv/BRucppnerNVbA1BV7ZZQcFFmVzg9fazEMhAIhFH7pmjtxAa
	cJ8+22fCg+C5lnwerK+AyRN2RTtRs3jbDONT1hRvEY1ejm4pP3RtcnNtTrtw9rBlNyDN/8S6gc/
	1yGn/7ik7WTqinhsQbWlr5pTSxc7WVL2PjS01VKOvhnq3gweL/MfZhzUnx5jFwOp8G5MssXLfK/
	O+sdhrdHKGY5x5sFWDwVCWoxAJVOMDInshRfc5bujtJ3XHG82yZ5V7kX6lDDR9B7QGGtcfqOSTG
	7aIRg/F4NQcvrpsNj4d8NPmPzwbqkEeOavpAWVQOfdAq/7qQIQ==
X-Google-Smtp-Source: AGHT+IFsuf7KZ/j+CxSESP9fbL8OO6NYlxurqpb9EgVujHuhByPLEYUbGuBWsDeoV3CvlsEQF8UN8Q==
X-Received: by 2002:a5d:598c:0:b0:391:476f:d3b7 with SMTP id ffacd0b85a97d-3971f510ec0mr15075554f8f.49.1742289556108;
        Tue, 18 Mar 2025 02:19:16 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/5] x86/wait: prevent duplicated assembly labels
Date: Tue, 18 Mar 2025 10:19:00 +0100
Message-ID: <20250318091904.52903-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091904.52903-1-roger.pau@citrix.com>
References: <20250318091904.52903-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When enabling UBSAN with clang, the following error is triggered during the
build:

common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
  154 |         "push %%rbx; push %%rbp; push %%r12;"
      |         ^
<inline asm>:1:121: note: instantiated into assembly here
    1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
      |                                                                                                                                ^
common/wait.c:154:9: error: symbol '.L_skip' is already defined
  154 |         "push %%rbx; push %%rbp; push %%r12;"
      |         ^
<inline asm>:1:159: note: instantiated into assembly here
    1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
      |                                                                                                                                                                      ^
2 errors generated.

The inline assembly block in __prepare_to_wait() is duplicated, thus
leading to multiple definitions of the otherwise unique labels inside the
assembly block.  GCC extended-asm documentation notes the possibility of
duplicating asm blocks:

> Under certain circumstances, GCC may duplicate (or remove duplicates of)
> your assembly code when optimizing. This can lead to unexpected duplicate
> symbol errors during compilation if your asm code defines symbols or
> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.

Workaround the issue by latching esp to a local variable, this prevents
clang duplicating the inline asm blocks.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use approach suggested by Jan.
---
 xen/common/wait.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index cb6f5ff3c20a..9a11dccb5de5 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -124,6 +124,11 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
     struct cpu_info *cpu_info = get_cpu_info();
     struct vcpu *curr = current;
     unsigned long dummy;
+    /*
+     * Latch esp to a local variable to prevent clang from duplicating the
+     * inline assembly block when UBSAN is enabled.
+     */
+    void *esp = NULL;
 
     ASSERT(wqv->esp == NULL);
 
@@ -166,12 +171,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         ".L_skip:"
         "pop %%r15; pop %%r14; pop %%r13;"
         "pop %%r12; pop %%rbp; pop %%rbx"
-        : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
+        : "=&S" (esp), "=&c" (dummy), "=&D" (dummy)
         : "0" (0), "1" (cpu_info), "2" (wqv->stack),
           [sz] "i" (PAGE_SIZE)
         : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
 
-    if ( unlikely(wqv->esp == NULL) )
+    if ( unlikely(esp == NULL) )
     {
         gdprintk(XENLOG_ERR, "Stack too large in %s\n", __func__);
         domain_crash(curr->domain);
@@ -179,6 +184,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         for ( ; ; )
             do_softirq();
     }
+    wqv->esp = esp;
 }
 
 static void __finish_wait(struct waitqueue_vcpu *wqv)
-- 
2.48.1


