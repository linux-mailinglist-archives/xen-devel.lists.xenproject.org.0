Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2F46D1A3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242142.418840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoK-0006rL-8I; Wed, 08 Dec 2021 11:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242142.418840; Wed, 08 Dec 2021 11:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoK-0006oq-5K; Wed, 08 Dec 2021 11:08:32 +0000
Received: by outflank-mailman (input) for mailman id 242142;
 Wed, 08 Dec 2021 11:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuoI-0006Yt-MZ
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:08:30 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3b62af-5817-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 12:08:30 +0100 (CET)
Received: by mail-pf1-x431.google.com with SMTP id k64so2122889pfd.11
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:08:30 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id b10sm2960927pft.179.2021.12.08.03.08.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:08:28 -0800 (PST)
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
X-Inumbo-ID: 2c3b62af-5817-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TnQefY0SqcDF3kPq8KJwIjgVaMNVB8DughUGvzU8o18=;
        b=ZkLOIb1g7XpNcLLrO2xyloqg63+eDW8c1N54mOfbRuFF15rJgWz2gE91JKdJydbYqG
         8eL+r+UhBdoKdktkRc6tlgzDzsYJ6NEY/1TBuKklxnRsWEthwhlQQghbv4vM7av0dghG
         YG6zw3TvtD0aPRSriB0gRBQvxZg2vVXXuprrdD3o0j3Qbt2CneEC83iXlxyIWawDUhZw
         D0iIjqE7yyGv7egqdw5VoqBiJosZhNCpE68DlbCNteQlDu4Axl6SfUW4B/3Jil8jexsd
         tyJwF/W/PbqJoQPqUimewZeAPGV5Cx7WcudydaUIl40hyGzVhigr/W2WRHOIV/UiSSyJ
         MqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TnQefY0SqcDF3kPq8KJwIjgVaMNVB8DughUGvzU8o18=;
        b=chaDo3jPeHj8/RyCOEgJ9dczW6Rv5/pEswDAI6O6FfYF41wg6kxr4fGEUXeknvzFAN
         p3jUc9jNqScsTgG++vxbN623aCLcD+NResC8ARmP5F5jnlMJjwiemGWZR0hrIwpyQtsf
         sbdQo/r4aM/Dx8/VFktWDWVEcDocq/q0zB2S5qMXu0oL364XdsxpGM2khQw0Ggmi73+U
         1tVf7/BX7lWoOL1SiLGCt9jLylLl1d6DMmZiSbSVd+ONuGh7CcWcD2w8zDL2cqLKXpsM
         EtY4Wf/UwamfSpCt0SKXbCM/d8eYOzbTAlw/hQG+irYiV+fYetR/zgM88soXS/q0tNgc
         8JOQ==
X-Gm-Message-State: AOAM530YBJ5V32M/Ij18vSwP0dUGogjPXQU1DaSMmLHBLzXczPFzS18G
	tNRKXX7SyaUzMc1tSCAXMX4=
X-Google-Smtp-Source: ABdhPJy9TsqtHV5JdjlSkcLb9NlmtdqMIVu0NVHyePzQqWTpNS604qrVcpVV8sNyEJaBLMfE3D+HqQ==
X-Received: by 2002:a05:6a00:a18:b0:4a7:ef65:ddfb with SMTP id p24-20020a056a000a1800b004a7ef65ddfbmr4953445pfh.17.1638961708633;
        Wed, 08 Dec 2021 03:08:28 -0800 (PST)
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
Subject: [PATCH 01/11] x86/entry: Use swapgs and native_iret directly in swapgs_restore_regs_and_return_to_usermode
Date: Wed,  8 Dec 2021 19:08:23 +0800
Message-Id: <20211208110833.65366-2-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

swapgs_restore_regs_and_return_to_usermode() is used in native code
(non-xenpv) only now, so it doesn't need the PV-aware SWAPGS and
INTERRUPT_RETURN.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 97b1f84bb53f..d95a02ecee16 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -608,8 +608,8 @@ SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
 
 	/* Restore RDI. */
 	popq	%rdi
-	SWAPGS
-	INTERRUPT_RETURN
+	swapgs
+	jmp	native_iret
 
 
 SYM_INNER_LABEL(restore_regs_and_return_to_kernel, SYM_L_GLOBAL)
-- 
2.19.1.6.gb485710b


