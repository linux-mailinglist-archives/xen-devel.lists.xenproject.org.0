Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0F46D1EC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242194.418939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuwv-00057U-KF; Wed, 08 Dec 2021 11:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242194.418939; Wed, 08 Dec 2021 11:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuwv-00055z-HD; Wed, 08 Dec 2021 11:17:25 +0000
Received: by outflank-mailman (input) for mailman id 242194;
 Wed, 08 Dec 2021 11:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muupK-0006Yt-HI
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:09:34 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 524ac4a9-5817-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 12:09:33 +0100 (CET)
Received: by mail-pf1-x431.google.com with SMTP id k64so2125210pfd.11
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:09:33 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id u12sm3355395pfk.71.2021.12.08.03.09.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:09:32 -0800 (PST)
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
X-Inumbo-ID: 524ac4a9-5817-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ZAl8F0tOkzqNpxvhUmIBbQ/2XyCnM6LrThKg9k5W8s=;
        b=XewnByTcwGZ5HuWSJOktdkA8rXnpKBKFuSg0cxOJL7s3BdUvTPdODuZfLIDeepUm4V
         +UFNS5kKkZ64h2+SLoku6yR1tR/0A+eaTTMV6wH4OAgYBCykpmcbSC84xrwGT8DK5z6I
         NAwcRUWRE5xi4yleywYOHQ3Z+PAuijS3/ucoUSnX0O8roEEkMd3TMCNQi4/Nee7ynLP8
         YtGzd5gKmnV6H5WeuB2jtnHcA/FdVci05P8W9WFHdMj60WaDi0E67yIn6k7XYkXd2N/Q
         Pkh/hb3+/neA+1fwV3CX98BZZHeeXZYXum/i4O8YUwzfbt+j8AeThm8SubonZeZuOnPu
         cX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ZAl8F0tOkzqNpxvhUmIBbQ/2XyCnM6LrThKg9k5W8s=;
        b=kv374ynQI0pyIlCOzyxr+5oBLiXE81wJ3bq6fDQEQE8bx4Z7x6/3oe1kXlJLsYNDYH
         vUIH1GBIh5fqLOzVOkz0UTwlcaIHVw0evRpyesZRTBSFnQLJE1xZHgRTadlRKC7jIJx+
         cMg1z2X/Lopglqqs/glVZhs09EcPmonObNrrDoIVC/wmZzlvHQVG135HuzfyirSBouEz
         HVEXQ42nusY3dbeBMQTla0H3PgJALnkotqOOoEOduTG/4H0GVuVGxHPbMxCqAuuAMA4v
         GH9SGvUev2JwlKa31yAIHvHjJszGG5jxKPxeFj2RaaP834byw/5c2r/D/CWSP+Aa853h
         TkRQ==
X-Gm-Message-State: AOAM532T6wvRvpCrork+9Nv2pivEc6XpPv7fCgbQ9/sffqXyXIyQcG7B
	t6ateRPlL9gfTCBOiFxh/M0=
X-Google-Smtp-Source: ABdhPJw1j8OimGYb+Vk6xtTFU75lvQF/n3cAmCvhA4Lo654aq4frrTPh1GDeEbLLUScPSozJ7D8kIA==
X-Received: by 2002:a65:6a0b:: with SMTP id m11mr28632692pgu.372.1638961772554;
        Wed, 08 Dec 2021 03:09:32 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Joerg Roedel <jroedel@suse.de>,
	"Chang S. Bae" <chang.seok.bae@intel.com>
Subject: [PATCH 11/11] x86/entry: Remove the branch in sync_regs()
Date: Wed,  8 Dec 2021 19:08:33 +0800
Message-Id: <20211208110833.65366-12-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

In non-xenpv, the sp0 is the trampoline stack, and sync_regs() is
called on non-xenpv only since error_entry is not called on xenpv, so
the stack must be the trampoline stack or one of the IST stack and the
check in sync_regs() is unneeded.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/kernel/traps.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index a6c0bc9ee36f..63cdb7aedd67 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -708,13 +708,15 @@ DEFINE_IDTENTRY_RAW(exc_int3)
 /*
  * Help handler running on a per-cpu (IST or entry trampoline) stack
  * to switch to the normal thread stack if the interrupted code was in
- * user mode. The actual stack switch is done in entry_64.S
+ * user mode.  The actual stack switch is done in entry_64.S.  It is not
+ * called from XENPV and the caller has ensured it is not on the thread
+ * stack.
  */
 asmlinkage __visible noinstr struct pt_regs *sync_regs(struct pt_regs *eregs)
 {
 	struct pt_regs *regs = (struct pt_regs *)this_cpu_read(cpu_current_top_of_stack) - 1;
-	if (regs != eregs)
-		*regs = *eregs;
+
+	*regs = *eregs;
 	return regs;
 }
 
-- 
2.19.1.6.gb485710b


