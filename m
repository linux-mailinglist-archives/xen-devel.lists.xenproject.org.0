Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374458C5E3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 11:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382310.617221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzNO-00027u-VH; Mon, 08 Aug 2022 09:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382310.617221; Mon, 08 Aug 2022 09:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzNO-00025T-SZ; Mon, 08 Aug 2022 09:48:46 +0000
Received: by outflank-mailman (input) for mailman id 382310;
 Mon, 08 Aug 2022 09:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWor=YM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oKzNN-00025N-47
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 09:48:45 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a6c9a77-16ff-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 11:48:44 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id gk3so15544815ejb.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Aug 2022 02:48:44 -0700 (PDT)
Received: from uni.. ([2a02:587:ac16:4a00:e000:5de0:498c:ce14])
 by smtp.googlemail.com with ESMTPSA id
 27-20020a170906309b00b007317d1fde85sm287196ejv.89.2022.08.08.02.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 02:48:42 -0700 (PDT)
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
X-Inumbo-ID: 4a6c9a77-16ff-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=fAbvP2qffw6JPn02Gyh6ZC4rHhETkfv+Fr6KgCMMz4U=;
        b=TiT0PVwGEEod0droqvG8LTqXtWYcXMOkttkUp1jFh7eY3vNZAMHdD8Hz8wOeYeF3By
         hk1MxA1SA3x5Nn7JbDcSWj6ly4uy3EMQVX6TLTL3q2tcz7VWdmUPMM61KPo67XQtDhXR
         epcA0U0FdmfJrcdOutG+1Vc8YlMpJkXoKKqUfgfnYSJCNiqCGXqQBipAuvF6/F99LJdV
         fiXO5reMDFAsD1bscpXDnNflHEiarzSC6u3nCendQJyChzYoJYlRsCOXiJAg+8Ql5ATZ
         4GhrvDXHxw0pkvrx9I/VutFfL9TJX/pBftZY0kcNcXTf5bCfVIC0PtNBZJDkLfL+VWxC
         +kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=fAbvP2qffw6JPn02Gyh6ZC4rHhETkfv+Fr6KgCMMz4U=;
        b=liQIzX9WtEpZK2ipFpQ+x7v1CplvgPgfrJTE1fpIF82tk04Ijn3puxNzUkdHYtkAIu
         fOVY+TDhf7mtVQQnH6uiEfLpyiBHBeLEByRqMdm5LYL48J9sU8bCTQB1Op9np4H1ODbm
         niVdQb5sKic+4zYvk5xROxMv3bmjPcXH00pa0Ap44xXNb/tpS+zyiQcfW/Z+OT9lR68q
         c4jdIqPxVGnoKtIq46qjxv4V62ueT+NPtNz076Lyop8AcWUOU0fGNzb9I4KlnieFSJ5R
         81la3q2j2p/Y/yB0hCf7q6mJ9lsPAYJO8tIWYgRx8Laq+WMqRWIMRgWfKzh7/KaLL91u
         fKeQ==
X-Gm-Message-State: ACgBeo3F4jDbS+LSEw6MkMDR9JmReWBtUP/fPLGCRPTgIU36m5/KNAwn
	Vd6ljQkyycsI8SYJ8XRogJ2mc1nLOSE=
X-Google-Smtp-Source: AA6agR6ufHUL8UFQW7m2lkSfJ0KfAMJaHnx+O5sbnk49JdbVa1z4ff7ZQib/BAI9+RN1rbhMW+RubQ==
X-Received: by 2002:a17:907:87b0:b0:731:3dfd:bc8d with SMTP id qv48-20020a17090787b000b007313dfdbc8dmr5437896ejc.607.1659952123349;
        Mon, 08 Aug 2022 02:48:43 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: regs: Fix MISRA C 2012 Rule 20.7 violation
Date: Mon,  8 Aug 2022 12:48:37 +0300
Message-Id: <20220808094837.1880522-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macro psr_mode(), the macro parameter 'm' is used as expression and
therefore it is good to be enclosed in parentheses to prevent against
unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 794721a103..0693a68131 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -11,7 +11,7 @@
 #include <asm/current.h>
 #include <asm/processor.h>
 
-#define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == m)
+#define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == (m))
 
 static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
 {
-- 
2.34.1


