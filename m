Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DB46D1A0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242149.418884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoj-0008Pu-Iv; Wed, 08 Dec 2021 11:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242149.418884; Wed, 08 Dec 2021 11:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoj-0008NB-FX; Wed, 08 Dec 2021 11:08:57 +0000
Received: by outflank-mailman (input) for mailman id 242149;
 Wed, 08 Dec 2021 11:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuoh-0006Yt-KY
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:08:55 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b13cd72-5817-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 12:08:55 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id x131so2117615pfc.12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:08:54 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id d3sm3454696pfv.57.2021.12.08.03.08.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:08:53 -0800 (PST)
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
X-Inumbo-ID: 3b13cd72-5817-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=94qtwsHdBUcVzdr14fQH4QqeaELVSejvb9k+dDp4o2k=;
        b=gdJwJexPSIx1/o0kGlFH/3siK2BWmqN/Qya2wWAwRpJBABJCf7cZVPY1vV9uKphzCM
         wDiL42S9zLojg/9rYkV+8Gcyug0bNkhyprI3HL5IVv6FPdbDYpG0Q+9f1fcLvsLyHqlJ
         6d+3RCpxWxTSvIGQUyD3iKktmbGyZSKRYFR81PlrbYQogKQmi6fZOJTId9b93ecmVF2Q
         eT3UjTw/vZKqvqEL/qGLIrdAM1QDCdiqpnZVGVu3jSXv5teHhN5/T/g/zvUjMZ6G722x
         jjKFxOz0lcm/NslZErC/EI4Yi0rOzfoSzQ5g0N+HuIY4WjIjEBS0MHTo4NO9TZ3LRbFW
         TNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=94qtwsHdBUcVzdr14fQH4QqeaELVSejvb9k+dDp4o2k=;
        b=Ba7keV8NGEKXsNX4HoGD1ZSQNQWw0OLkR6TS2sZO8Z0KYRMCxSm5Ug3Goqwa0ExRXT
         QZhDEB0L1Y4GIJoV5NpwTD9aGFVvIN7eopFEa6EhitcJHlswX2OGTFrC3e/pmI4NhVdL
         elr3jYrvyVn/5apmJ++5hc4Epk7lxaAE/jhosQ8LYN0D3P61DdEfdyxfzCFxrY/fYZu6
         9XEDFS/3Uv/WTN/ziJeBdKj1wB9PVQkkyVTryAQFMnz9fMeLA+JIXpjNYDsKvTzYmZ79
         RZdmhjlPkryQ12VsFO3j/cXXNDGD8jQjXc+Et1bvQYOIo2zGaZds4hWDDrRpjmUqioSg
         /34w==
X-Gm-Message-State: AOAM533o7E3HBoiYfvbbNMPSPFDNVHglCpBIsE9NzdhQkwf0x9jC98Ms
	45t9WdWIKok6oYiSFOfjxMw=
X-Google-Smtp-Source: ABdhPJzMp2m1CIOe5Z9utqdinpuLznocfHk1h5+AWYqs9CoFg7FElyyIpiFD9TM9L0u194BTWXvhUw==
X-Received: by 2002:a62:8449:0:b0:4ad:56ba:2f1d with SMTP id k70-20020a628449000000b004ad56ba2f1dmr4928492pfd.37.1638961733585;
        Wed, 08 Dec 2021 03:08:53 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 05/11] x86/entry: Move cld to the start of idtentry
Date: Wed,  8 Dec 2021 19:08:27 +0800
Message-Id: <20211208110833.65366-6-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

Make it next to CLAC

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 72ceb4b70822..ee1d4adcdab0 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -356,6 +356,7 @@ SYM_CODE_END(ret_from_fork)
 SYM_CODE_START(\asmsym)
 	UNWIND_HINT_IRET_REGS offset=\has_error_code*8
 	ASM_CLAC
+	cld
 
 	.if \has_error_code == 0
 		pushq	$-1			/* ORIG_RAX: no syscall to restart */
@@ -423,6 +424,7 @@ SYM_CODE_END(\asmsym)
 SYM_CODE_START(\asmsym)
 	UNWIND_HINT_IRET_REGS
 	ASM_CLAC
+	cld
 
 	pushq	$-1			/* ORIG_RAX: no syscall to restart */
 
@@ -478,6 +480,7 @@ SYM_CODE_END(\asmsym)
 SYM_CODE_START(\asmsym)
 	UNWIND_HINT_IRET_REGS
 	ASM_CLAC
+	cld
 
 	/*
 	 * If the entry is from userspace, switch stacks and treat it as
@@ -539,6 +542,7 @@ SYM_CODE_END(\asmsym)
 SYM_CODE_START(\asmsym)
 	UNWIND_HINT_IRET_REGS offset=8
 	ASM_CLAC
+	cld
 
 	/* paranoid_entry returns GS information for paranoid_exit in EBX. */
 	call	paranoid_entry
@@ -853,7 +857,6 @@ SYM_CODE_END(xen_failsafe_callback)
  */
 SYM_CODE_START_LOCAL(paranoid_entry)
 	UNWIND_HINT_FUNC
-	cld
 	PUSH_AND_CLEAR_REGS save_ret=1
 	ENCODE_FRAME_POINTER 8
 
@@ -971,7 +974,6 @@ SYM_CODE_END(paranoid_exit)
  */
 SYM_CODE_START_LOCAL(error_entry)
 	UNWIND_HINT_FUNC
-	cld
 	testb	$3, CS+8(%rsp)
 	jz	.Lerror_kernelspace
 
@@ -1104,6 +1106,7 @@ SYM_CODE_START(asm_exc_nmi)
 	 */
 
 	ASM_CLAC
+	cld
 
 	/* Use %rdx as our temp variable throughout */
 	pushq	%rdx
@@ -1123,7 +1126,6 @@ SYM_CODE_START(asm_exc_nmi)
 	 */
 
 	swapgs
-	cld
 	FENCE_SWAPGS_USER_ENTRY
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%rdx
 	movq	%rsp, %rdx
-- 
2.19.1.6.gb485710b


