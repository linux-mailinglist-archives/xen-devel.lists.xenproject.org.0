Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E1D46D1A9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242155.418895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoo-0000Y7-Rc; Wed, 08 Dec 2021 11:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242155.418895; Wed, 08 Dec 2021 11:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoo-0000Uu-OQ; Wed, 08 Dec 2021 11:09:02 +0000
Received: by outflank-mailman (input) for mailman id 242155;
 Wed, 08 Dec 2021 11:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuon-0007Ud-0I
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:09:01 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e5084b6-5817-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 12:09:00 +0100 (CET)
Received: by mail-pf1-x42f.google.com with SMTP id i12so2152989pfd.6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:09:00 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id gc22sm5791712pjb.57.2021.12.08.03.08.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:08:58 -0800 (PST)
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
X-Inumbo-ID: 3e5084b6-5817-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GTzYOcv7GXMsuudeRCCVKvQE4p4RTznbhZKVu0xYKUU=;
        b=km30WDN3p/x6O1LN4IM4fy77QF1NVRUPK5sP06Gal6+QGtjqpUUYFI0ArnBEImqtBx
         AuUANxaE5TNvqfzwlIxrjFaBsxfD6p1eT/U6KemlwxP4SBJRnkOXwocKlRobPiXwphiK
         nnKNx8a17oUYe1aBF9xVYjEfT0JHyVlsyWpuNHWRttKft7eHMogyjA4hHEpDixYozui/
         Yp9HWHVmMbUx0pUgEzC7X+43ukc3qPqWPrcwKNA92/m1IkWkKcYC2169qQXVTznVDh9C
         8FdQ3N0QnfLfiyMM1qnRw3/LhI95W2mPf5Ae8J85boc7Vk+qIFVR2qqDY1HLZcu21xTg
         Tx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GTzYOcv7GXMsuudeRCCVKvQE4p4RTznbhZKVu0xYKUU=;
        b=ygSohSlCfvG7LQhGRAIs7IFPZ0Ye6C6+oFRnaZVHZCqchFjPO2CI1F7p98Jb5lXGxh
         3y8eCocAKpr3t8duCMdKyOgPLtfGThZ5bJyCkg3tWjsUPUpb+jwI0gXjAMI0y/Ow4XAQ
         3fMejLW6MiidNGJeFiWaPKlVqpi0IC3D5UKSWgphUIcmIYMK1QpBb7ichbS5RWcuUfjR
         aD/lPQzzI+XF0iAmCnl365aYpN4cFPwV9ccUp3ULaC30oQ2JlKt9hgWU+Q4mOcuX0SnP
         HIW9NMzhOkTvQEBSt7Vm15tLtWcRDJ60F1+cO33qH/L3WiotgcEGrfbkHBY39XP79yxw
         VycA==
X-Gm-Message-State: AOAM532kDaHDOUM/0Fewub5NNBSQ8EZujuNIwdNgpHeMZMdQe0o2MchW
	5tYTgVgQLhH8UqxE9FFL2qE=
X-Google-Smtp-Source: ABdhPJyG8RspzExM0YLJHIGBovB6b/ZNv9oPLLxl7bIY/uiUpBpyPdvWlt/3qAb05wwKy/zxp0w/Lw==
X-Received: by 2002:a05:6a00:ad0:b0:4a3:1056:e2ae with SMTP id c16-20020a056a000ad000b004a31056e2aemr4931125pfl.2.1638961739024;
        Wed, 08 Dec 2021 03:08:59 -0800 (PST)
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
Subject: [PATCH 06/11] x86/entry: Don't call error_entry for XENPV
Date: Wed,  8 Dec 2021 19:08:28 +0800
Message-Id: <20211208110833.65366-7-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

When in XENPV, it is already in the task stack, and it can't fault
for native_iret() nor native_load_gs_index() since XENPV uses its own
pvops for iret and load_gs_index().  And it doesn't need to switch CR3.
So there is no reason to call error_entry() in XENPV.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index ee1d4adcdab0..383070aa9272 100644
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


