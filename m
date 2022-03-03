Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466B24CB597
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 04:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282733.481544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPcY0-0006CN-6E; Thu, 03 Mar 2022 03:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282733.481544; Thu, 03 Mar 2022 03:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPcY0-0006AX-3H; Thu, 03 Mar 2022 03:54:36 +0000
Received: by outflank-mailman (input) for mailman id 282733;
 Thu, 03 Mar 2022 03:54:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHsd=TO=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1nPcXy-0006AR-SR
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 03:54:35 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a174f243-9aa5-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 04:54:32 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so2383137pjd.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Mar 2022 19:54:31 -0800 (PST)
Received: from localhost ([47.251.4.198]) by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm537800pjb.14.2022.03.02.19.54.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Mar 2022 19:54:30 -0800 (PST)
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
X-Inumbo-ID: a174f243-9aa5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V2/ej5DrRdUXhbTtL7As/s+7H+Hg/qh6D0nKyde9b4I=;
        b=Cf6C+jFzvaQJqp+87aHDyXKn1AnopM3mxsZXXVve5nRwKAHyoEW6RWZ82BxB1/MpAs
         YBeLSbTIABdPihhCBaQaZsH8HO4BpyuxMiloaRGq75Q5JXATrMsGuFrephWtRRSjs0d0
         AP8Ob0+dxLcisk1yC6u47FptP4V+sB38bpPne1a+RruGrkn+5HAvkGofli4prSWlKBOk
         VY/TjCZNnz8fjIVkgNqx9yrwJT2Df9mWqoPIpIhEMtK4vr/RX1QVkozI+4TLCweH6z0C
         6S5+8I7OuILJGTyjV4G8zHIXKeFnGVL+oaiF5ViG74XDU5C/o5tq6C3NiluQPvx+9TjH
         10+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2/ej5DrRdUXhbTtL7As/s+7H+Hg/qh6D0nKyde9b4I=;
        b=c6uSIUARr3PpdfesYws6uJOnwhLcFMuoNilyjTXivDvypdhrCR33Ij+NUTwpfPPC5b
         7I7X1oiNnRD2D0JDmZb8Dme7KqBQkALJZZwSWHUOXv+Kc1qAXiuVCkEY64HJ2NR6idMO
         ZRT/qb4pWq9MTVfdNsHQsypIfMfTchX9TV4Ug0fyRPOIQWkLzeS77R/7IY/nw48RLKDe
         v1k7KOt3jdFpf+fG54px2orCFdd60iInDoC/zJLOlxbBKGOOzTqlDdPC8DA8pQTp7JyO
         lChztkutO+nu84eQx+4XV9ieAFnxigXfpKdEUoBqxoggpcuB+sdHpHYlYfQfizJU8Kd6
         pUrQ==
X-Gm-Message-State: AOAM531Av+6dgPTD9G0JidMbxfXIfIRVZ0Pa7gYr+JWlbzh4NZXR/9v4
	cCVo99Pzt6slsGlyImMvMik=
X-Google-Smtp-Source: ABdhPJwMqYGzS+07MgSD+XrJLZC6tb4GmJcD1c0Voe27uz+8Clqe4zPHlwkCb0iXztvSKqT4uzsfvw==
X-Received: by 2002:a17:902:e945:b0:14e:b8d9:aa07 with SMTP id b5-20020a170902e94500b0014eb8d9aa07mr33517195pll.163.1646279670545;
        Wed, 02 Mar 2022 19:54:30 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	xen-devel@lists.xenproject.org,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH V2 5/7] x86/entry: Don't call error_entry for XENPV
Date: Thu,  3 Mar 2022 11:54:32 +0800
Message-Id: <20220303035434.20471-6-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20220303035434.20471-1-jiangshanlai@gmail.com>
References: <20220303035434.20471-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <jiangshan.ljs@antgroup.com>

When in XENPV, it is already in the task stack, and it can't fault
for native_iret() nor native_load_gs_index() since XENPV uses its own
pvops for iret and load_gs_index().  And it doesn't need to switch CR3.
So there is no reason to call error_entry() in XENPV.

Cc: xen-devel@lists.xenproject.org
Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
---
 arch/x86/entry/entry_64.S | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 630bf8164a09..adc9f7619d1b 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -325,8 +325,17 @@ SYM_CODE_END(ret_from_fork)
 	PUSH_AND_CLEAR_REGS
 	ENCODE_FRAME_POINTER
 
-	call	error_entry
-	movq	%rax, %rsp			/* switch stack settled by sync_regs() */
+	/*
+	 * Call error_entry and switch stack settled by sync_regs().
+	 *
+	 * When in XENPV, it is already in the task stack, and it can't fault
+	 * for native_iret() nor native_load_gs_index() since XENPV uses its
+	 * own pvops for iret and load_gs_index().  And it doesn't need to
+	 * switch CR3.  So it can skip invoking error_entry().
+	 */
+	ALTERNATIVE "call error_entry; movq %rax, %rsp", \
+		"", X86_FEATURE_XENPV
+
 	ENCODE_FRAME_POINTER
 	UNWIND_HINT_REGS
 
-- 
2.19.1.6.gb485710b


