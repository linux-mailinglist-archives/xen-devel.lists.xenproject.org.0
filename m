Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC9346D1AD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242167.418917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muup8-0001wu-Fo; Wed, 08 Dec 2021 11:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242167.418917; Wed, 08 Dec 2021 11:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muup8-0001tu-CT; Wed, 08 Dec 2021 11:09:22 +0000
Received: by outflank-mailman (input) for mailman id 242167;
 Wed, 08 Dec 2021 11:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muup7-0007Ud-Dd
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:09:21 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a81ed7d-5817-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 12:09:20 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id gt5so1693916pjb.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:09:20 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id s15sm2665417pjs.51.2021.12.08.03.09.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:09:19 -0800 (PST)
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
X-Inumbo-ID: 4a81ed7d-5817-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WphTuTVslZby+oDEm50XCSesh2uHM5bzyfp9NXbgOWI=;
        b=htwdJLPu0gbuBqzNfz7sUj3efCTwW2LVgoh7ceQ0BMbkeYhPhXwXqOasG0Bd8RJnve
         XAAXE8iaSVBK6I6+t8twEOP/RHaK4mAkcL91G9J2LxApElT1FlYqrg1s/Gg2QuqLEqAt
         Xp4KqW62Iq1m5547lpOp1SrpBcM3mYOrFm91iX6Fb7OiOY1ScjdTivEC2Oy/lIyYlKLm
         gZAsMcM2ZGf8cfQoKLV6309j6vQq+DLsm0OVA24wlnmsN4Ki2w52UEmZGesy0mkRCwlx
         D6oBpssBTUieU9+0PWVIpucZ1qx6OzKjivCUNTWYSj2ChMJ0rvHeSI5cVlCD5IXjw/IB
         1w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WphTuTVslZby+oDEm50XCSesh2uHM5bzyfp9NXbgOWI=;
        b=v37213tr9wswWg62gCLkWID6Mdy3oT1EcZSpZTDzIt3QRa2LujTgOdQsl5pmXPbJwQ
         vV0kKdkhiCwixlGtwq7p9jvnxx5WdBFXs0JhKT7QqiFW89LddJqLBR+SDOlRDaazpt4W
         iJZdSPWMI+K8KpxL4RIvF298JjkbfY0WVOEPoQ1/QZXF1U/lgztS0pHb2O42DEMPs4CO
         ILS7UyFgNZDkYw5RPIDvIFW/8UXItZPkheSb1xJoWYOEuWwIeTpEtfwhfnNmEqvBdxGy
         3VfkQPT+cvhcqlsdCcmcFKR+Dj02plcWi/AQbyKUWUrgmpTnCeivZ5cslYVX9xw7pQKe
         amuQ==
X-Gm-Message-State: AOAM533h+kU09W9yYg6DOD8sBTqkOaWoi2iR7E1G8EiCgDMu+0//uPEX
	L01jru2hHdEr4e4bJplFnyhvCuhiIpQ=
X-Google-Smtp-Source: ABdhPJygiu3o+VoYWbdot6ZOwAuTCklCWFi5NzkjvztY5lMtfZYeyM7huQwfqLtMKHLX/ykwc3TFVw==
X-Received: by 2002:a17:90b:357:: with SMTP id fh23mr6446123pjb.238.1638961759479;
        Wed, 08 Dec 2021 03:09:19 -0800 (PST)
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
Subject: [PATCH 09/11] x86/entry: Convert SWAPGS to swapgs in entry_SYSENTER_compat()
Date: Wed,  8 Dec 2021 19:08:31 +0800
Message-Id: <20211208110833.65366-10-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

XENPV has its own entry point for SYSENTER, it doesn't use
entry_SYSENTER_compat.  So the pv-awared SWAPGS can be changed to
swapgs.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64_compat.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
index a4fcea0cab14..72e017c3941f 100644
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@ -49,7 +49,7 @@
 SYM_CODE_START(entry_SYSENTER_compat)
 	UNWIND_HINT_EMPTY
 	/* Interrupts are off on entry. */
-	SWAPGS
+	swapgs
 
 	pushq	%rax
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%rax
-- 
2.19.1.6.gb485710b


