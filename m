Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DCCA708A5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 19:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926913.1329739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8ZP-0002x6-D3; Tue, 25 Mar 2025 18:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926913.1329739; Tue, 25 Mar 2025 18:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8ZP-0002ve-AG; Tue, 25 Mar 2025 18:00:11 +0000
Received: by outflank-mailman (input) for mailman id 926913;
 Tue, 25 Mar 2025 18:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx8ZO-0002vY-Ca
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 18:00:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd0f36be-09a2-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 19:00:08 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so4689088f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 11:00:08 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43e50sm205648275e9.12.2025.03.25.11.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 11:00:07 -0700 (PDT)
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
X-Inumbo-ID: fd0f36be-09a2-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742925608; x=1743530408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rcPxL5FrpWPsPyOJ40H3ycbUNBnd7QVyRYrcbnV5MVQ=;
        b=kSbQVv7nPKyX7tN1ItFbGUmODPULLOowkYOXCM89uTAfEOK+65pLE7f0IyyZw597O5
         YBeyLljsHja2jtm3vb9mBnzD9goYLVLZ7UXfdYcQ+c1cl+zdzlTM0qtKQX9UPD9TlWtN
         1khl1KZ50jrpBdyS/s6ZyEJZDsj2dpnxP7GdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925608; x=1743530408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcPxL5FrpWPsPyOJ40H3ycbUNBnd7QVyRYrcbnV5MVQ=;
        b=qbpADE0RIRHPLsr9mDI1kjL/n8e1AkQikBkiZ9B1WhByYWsXsDtRX4hki51gYKeOwN
         OGQzIV9M5Pyat3ly4eDRisW7YII7GL+XgvTRndKOHvb2YbcILoeFFZ46bqIc6c6wHkzj
         I2z+9Y28/2U7yQheu31rFVzMCTKzyizLfPuFYbnCZTsV9p57/TyBZAnpNl1FIjT6iEIl
         tV2nvFdsc2EABc69yBv293lESCt2ArjkGtkO1VwxH48kYD+EdgnbN0d9wpiy4QXxYF2k
         PfPbDN8yc9S0Dunqy+/gT//H+xJco4Bodw0260+2Y7dF7rrL2iaFfX30SK39TkAaMCzP
         D2dg==
X-Gm-Message-State: AOJu0Yy6CXkpA1CrrYjEl/akwHdPFv+efKetTz6LUWHpKGDgMufje2nl
	Z9anJG0ia3M3gdU/kKIXbfjW47KbvJVbUhsx164inQy7tqk5VT57vBd5ocBrV8Ne3aPXG5XyoRh
	8254=
X-Gm-Gg: ASbGncsDLg708Lq00u72q5esQanJM+rEzZbZJLdYeHPAXpieWE9djnCRM01/ay5vVnh
	d1MlTIcrSN4fNmrdOIGNsu8cEHHzG1STYClOsWca1hYZ3WPAmOZLl+0RsKNa6kScHjRnrEFXnds
	iKJHiuetJraJ10OVC5cccqL+jRoM/IBdOHsiknJn6Vvm57EjeSdwAbJWWS1mH5/emGNYiUgz3ai
	ZTc0A95T7dlM2bpQx3cyTxgXZmkdIG0MxXLUSE8X6hUnJSUqWK9Kg3YFu722hArEgixqpohb0hn
	0z0qWe+AyX2G9gcfuu1s/yHBirRn8z0gXuFd5ov1asy71jp39pngF6XKhupxezSNbdSGYJRVkYU
	HBklkhutV2Uq61wbwkA==
X-Google-Smtp-Source: AGHT+IEmJlvwdnlxeMXuQsNespF892HPwBnB558nqvThqmWLlodjDnIP/tRhbvV/DExcEFNSiKQK5g==
X-Received: by 2002:a5d:6da9:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-3997f93643dmr16029421f8f.43.1742925607621;
        Tue, 25 Mar 2025 11:00:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/elf: Remove ASM_CALL_CONSTRAINT from elf_core_save_regs()
Date: Tue, 25 Mar 2025 18:00:05 +0000
Message-Id: <20250325180005.275552-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I was mistaken about when ASM_CALL_CONSTRAINT is applicable.  It is not
applicable for plain pushes/pops, so remove it from the flags logic.

Clarify the description of ASM_CALL_CONSTRAINT to be explicit about unwinding
using framepointers.

Fixes: 0754534b8a38 ("x86/elf: Improve code generation in elf_core_save_regs()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/asm_defns.h  | 5 +++--
 xen/arch/x86/include/asm/x86_64/elf.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 92b4116a1564..689d1dcbf754 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -28,8 +28,9 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
 
 /*
  * This output constraint should be used for any inline asm which has a "call"
- * instruction.  Otherwise the asm may be inserted before the frame pointer
- * gets set up by the containing function.
+ * instruction, which forces the stack frame to be set up prior to the asm
+ * block.  This matters when unwinding using framepointers, where the asm's
+ * function can get skipped over.
  */
 #ifdef CONFIG_FRAME_POINTER
 register unsigned long current_stack_pointer asm("rsp");
diff --git a/xen/arch/x86/include/asm/x86_64/elf.h b/xen/arch/x86/include/asm/x86_64/elf.h
index f33be46ddec9..e7bec7327aa2 100644
--- a/xen/arch/x86/include/asm/x86_64/elf.h
+++ b/xen/arch/x86/include/asm/x86_64/elf.h
@@ -56,7 +56,7 @@ static inline void elf_core_save_regs(ELF_Gregset *core_regs,
     /* orig_rax not filled in for now */
     asm ( "lea (%%rip), %0" : "=r" (core_regs->rip) );
     asm ( "mov %%cs, %0" : "=m" (core_regs->cs) );
-    asm ( "pushfq; popq %0" : "=m" (core_regs->rflags) ASM_CALL_CONSTRAINT );
+    asm ( "pushfq; popq %0" : "=m" (core_regs->rflags) );
     asm ( "movq %%rsp, %0" : "=m" (core_regs->rsp) );
     asm ( "mov %%ss, %0" : "=m" (core_regs->ss) );
     rdmsrl(MSR_FS_BASE, core_regs->thread_fs);

base-commit: 28fa31d6bb7835be530c2855dd6cf4e77438ae12
-- 
2.39.5


