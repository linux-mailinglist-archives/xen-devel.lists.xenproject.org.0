Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E689EFFD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 12:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703000.1098760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVKY-0004G5-KH; Wed, 10 Apr 2024 10:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703000.1098760; Wed, 10 Apr 2024 10:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVKY-0004D3-HV; Wed, 10 Apr 2024 10:37:26 +0000
Received: by outflank-mailman (input) for mailman id 703000;
 Wed, 10 Apr 2024 10:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruVKX-0004Cx-LK
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 10:37:25 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 515209ed-f726-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 12:37:24 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a519ef3054bso621672066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 03:37:24 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q26-20020a170906b29a00b00a51dd500071sm3119108ejz.169.2024.04.10.03.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 03:37:22 -0700 (PDT)
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
X-Inumbo-ID: 515209ed-f726-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712745443; x=1713350243; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RnrHsqwo8RE6VxgiL7wXAgM6cFtodAhRpuovZ8ouyQ=;
        b=WCU5F1n19eq9nPA/A1K6F0D3mtBWjczKGySI5Us5nDbFIlrp9eVkoI5rk2gTu8Jn5U
         8BmmIZCQPEXvLbMiHWpwVhwHKt6WCPVbn+18kBl6aEC0Dcws9H4gtl0gGI1rZXnc53Xp
         mnAQ37o8nKDGtx2W8nbSRha8bIx20VPPtY4kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712745443; x=1713350243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RnrHsqwo8RE6VxgiL7wXAgM6cFtodAhRpuovZ8ouyQ=;
        b=puiYW4Q5sC7UFfc9+89lbvE6YgeIMFxloelg72IaWcrCMHhcWLIGNKlpenORke27OY
         l6u4usYvuzrGvnmGyXHEwigDOgiQBsyK+c9VkZZB43BC9dj1HpogYoSw6v6HXQ0mIc02
         rS3b7A8uxCOMxbQxjmWGVLuOyIWbJijk0SDHjnpu5j7jiGrhfBjIPoECf3jZWkz4Q48c
         vr+CNJyHnStegTw2IMb38jgg9D3rNzO7F2ssCbNzF7b6m0AqkGEzTivHQ3bgOsl24FzC
         gz7D1VtH7aD4wbUeMgZrbyvb6M6Yuu1JWj7/8fM24KO5+sYFZcxT2EYGU3Y/AjkqY0m5
         K8ag==
X-Gm-Message-State: AOJu0YyfstVcEGRKhh5unN3XRVK9q3WevaQPTi6f/H49Un6vHhEcd+EG
	vmW6FpUUZa2GpEHVfVgG8sNPhWpzsyCBK4xLXawy1FQQZS+EYcUNMh8weOYDcAYSCeqKI9G8cJv
	3NDU=
X-Google-Smtp-Source: AGHT+IG8gb4DS5jcGyz6sU2P/vzuWizZhMjMNBkm9dGGQlUhdiW3iKckHTuovbDgvPPGugQbgx56RQ==
X-Received: by 2002:a17:906:3b09:b0:a51:95f1:4308 with SMTP id g9-20020a1709063b0900b00a5195f14308mr1710222ejf.51.1712745443215;
        Wed, 10 Apr 2024 03:37:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] x86/hvm: Fix Misra Rule 19.1 regression
Date: Wed, 10 Apr 2024 11:37:21 +0100
Message-Id: <20240410103721.593839-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Despite noticing an impending Rule 19.1 violation, the adjustment made (the
uint32_t cast) wasn't sufficient to avoid it.  Try again.

Fixes: 6a98383b0877 ("x86/HVM: clear upper halves of GPRs upon entry from 32-bit code")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/hvm/hvm.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 595253babeaf..899233fb257b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -575,16 +575,16 @@ static inline void hvm_sanitize_regs_fields(struct cpu_user_regs *regs,
     if ( compat )
     {
         /* Clear GPR upper halves, to counteract guests playing games. */
-        regs->rbp = (uint32_t)regs->ebp;
-        regs->rbx = (uint32_t)regs->ebx;
-        regs->rax = (uint32_t)regs->eax;
-        regs->rcx = (uint32_t)regs->ecx;
-        regs->rdx = (uint32_t)regs->edx;
-        regs->rsi = (uint32_t)regs->esi;
-        regs->rdi = (uint32_t)regs->edi;
-        regs->rip = (uint32_t)regs->eip;
-        regs->rflags = (uint32_t)regs->eflags;
-        regs->rsp = (uint32_t)regs->esp;
+        regs->rbp = (uint32_t)regs->rbp;
+        regs->rbx = (uint32_t)regs->rbx;
+        regs->rax = (uint32_t)regs->rax;
+        regs->rcx = (uint32_t)regs->rcx;
+        regs->rdx = (uint32_t)regs->rdx;
+        regs->rsi = (uint32_t)regs->rsi;
+        regs->rdi = (uint32_t)regs->rdi;
+        regs->rip = (uint32_t)regs->rip;
+        regs->rflags = (uint32_t)regs->rflags;
+        regs->rsp = (uint32_t)regs->rsp;
     }
 
 #ifndef NDEBUG

base-commit: f48299cad5c3c69fdc2c101517a6dab9c9827ea5
-- 
2.30.2


