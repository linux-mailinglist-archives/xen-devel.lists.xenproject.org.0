Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C20A46D1A2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242148.418874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuod-00080i-9s; Wed, 08 Dec 2021 11:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242148.418874; Wed, 08 Dec 2021 11:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuod-0007xG-6Z; Wed, 08 Dec 2021 11:08:51 +0000
Received: by outflank-mailman (input) for mailman id 242148;
 Wed, 08 Dec 2021 11:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuoc-0007Ud-3S
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:08:50 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c10856-5817-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 12:08:49 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id r130so2188747pfc.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:08:49 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id p17sm3404857pfh.86.2021.12.08.03.08.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:08:47 -0800 (PST)
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
X-Inumbo-ID: 37c10856-5817-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcBSE4oPibzeIhyf2Qp5YqTgR/bF+VmAeF/brxTC5FU=;
        b=D0KfkWiPHhKhRJUZdR5kq7I4HpNBJdRwa55sv9BMfhZ3vbJVIPNqKGnE1ONGnrlI34
         2uQvzZB8c1W/Hzmk9lJIBvPuBZIZBDzlhZ6uIuU9VZOKqWnOAHB9aMyyXNK8KcmbcQV/
         bQjVtI9HtkySFmOwWp9onHdlvBxih0vvgFOJHMQjs9U8tAoDeS0Tt29U9Ye6sau5kAxz
         J/DeQH5dwbfQl7bRYn+aIrOkMti5RoJtWalneYj8OgUE/4cpA9PctgdhPmFe30GA+AfV
         HgbSnUq6EfLPRCS7X+q0+QvEnT3ZXqXLMRNwgKgKcUcvvo/VDdu5ix0k/Mo8225S/GHA
         bJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcBSE4oPibzeIhyf2Qp5YqTgR/bF+VmAeF/brxTC5FU=;
        b=yVkxtcDkw60pEpnnd0QuPE42u9tz9HgBIn7a0JMf/GLEAJwksZge6oNRNwdS0lJvI5
         84BhDOXz2mts7Ej2jfXoq+8QNv3zNP3wmgx1CZd9R7BYCRpcKmtnnMpcLXFZwheN1ff6
         xh01oYtzzRFJ7ChlbMO0B5zA0n4eh7GJBw7QlSax5b9N3QfViLiIosEZXXwTQvdgbDiZ
         S33LrbwVlyb9dSttozh8IZJGXLrHfFiy5ASiWcEAcpQHIWFF4cBxMSeCFmacbu3XGfRa
         jCk705/7qcOMgz1Q/X4himD8Y+BTlA/jH10b/0nAh5s8I71w1yhfi2hsbW6snYi9mT/e
         2tPA==
X-Gm-Message-State: AOAM533c8HwJFY7qXd7coz/XScI2uV6/v+xWtWKxbgULXc3oJfkfthba
	WgHOyAEBjycDZNuQWSQTaOQ=
X-Google-Smtp-Source: ABdhPJwB9xEYc6yaPMgbaAjXzRhRbjCMiDT7xaBXucJ4jA6rNMMEh2pDhUz6bzCHuWkJVnkpO7Wxhg==
X-Received: by 2002:a05:6a00:1a8e:b0:49f:a4a9:8f1e with SMTP id e14-20020a056a001a8e00b0049fa4a98f1emr4890452pfv.67.1638961727985;
        Wed, 08 Dec 2021 03:08:47 -0800 (PST)
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
Subject: [PATCH 04/11] x86/entry: move PUSH_AND_CLEAR_REGS out of error_entry
Date: Wed,  8 Dec 2021 19:08:26 +0800
Message-Id: <20211208110833.65366-5-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

Moving PUSH_AND_CLEAR_REGS out of error_entry doesn't change any
functionality.  It will enlarge the size:

size arch/x86/entry/entry_64.o.before:
   text	   data	    bss	    dec	    hex	filename
  17916	    384	      0	  18300	   477c	arch/x86/entry/entry_64.o

size --format=SysV arch/x86/entry/entry_64.o.before:
.entry.text                      5528      0
.orc_unwind                      6456      0
.orc_unwind_ip                   4304      0

size arch/x86/entry/entry_64.o.after:
   text	   data	    bss	    dec	    hex	filename
  26868	    384	      0	  27252	   6a74	arch/x86/entry/entry_64.o

size --format=SysV arch/x86/entry/entry_64.o.after:
.entry.text                      8200      0
.orc_unwind                     10224      0
.orc_unwind_ip                   6816      0

But .entry.text in x86_64 is 2M aligned, enlarging it to 8.2k doesn't
enlarge the final text size.

The tables .orc_unwind[_ip] are enlarged due to it adds many pushes.

It is prepared for not calling error_entry() from XENPV in later patch
and for future converting the whole error_entry into C code.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 6baa7413f7eb..72ceb4b70822 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -322,6 +322,9 @@ SYM_CODE_END(ret_from_fork)
  */
 .macro idtentry_body cfunc has_error_code:req
 
+	PUSH_AND_CLEAR_REGS
+	ENCODE_FRAME_POINTER
+
 	call	error_entry
 	movq	%rax, %rsp			/* switch stack settled by sync_regs() */
 	ENCODE_FRAME_POINTER
@@ -969,8 +972,6 @@ SYM_CODE_END(paranoid_exit)
 SYM_CODE_START_LOCAL(error_entry)
 	UNWIND_HINT_FUNC
 	cld
-	PUSH_AND_CLEAR_REGS save_ret=1
-	ENCODE_FRAME_POINTER 8
 	testb	$3, CS+8(%rsp)
 	jz	.Lerror_kernelspace
 
-- 
2.19.1.6.gb485710b


