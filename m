Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8CD538BD0
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339131.563986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzk-0001Y5-Ng; Tue, 31 May 2022 07:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339131.563986; Tue, 31 May 2022 07:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzk-0001MZ-CZ; Tue, 31 May 2022 07:08:48 +0000
Received: by outflank-mailman (input) for mailman id 339131;
 Tue, 31 May 2022 06:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvvpm-00084L-Kg
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 06:58:30 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13d62d9c-e0af-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 08:58:30 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 f23-20020a7bcc17000000b003972dda143eso646639wmh.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 23:58:30 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::944:e002])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d6d81000000b0020e63ab5d78sm10704346wrs.26.2022.05.30.23.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 23:58:28 -0700 (PDT)
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
X-Inumbo-ID: 13d62d9c-e0af-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xDHqlxRoY9ROqi5ycivwmlnHxIhH5v0psmixFXh0iC8=;
        b=Chojm0gDMdUqtuSeOnMCAIdZhuxc8AKyL5wWHbln45TEaLvbQcDOaqxnQiQMN/mZd9
         BUJC+Q9J6xXKBNPH4FP/1OnCpCLeJLL6V/P5/1o0wRzVeQXYnOp1jNEmD8dpSIQN2Y7E
         yCYEekkcNahlx8MWg5vaEg0Z/mvyNID9QuBuGIx+zmDMzveUZm5Uco/Sfi4sQ1Q1e11D
         XVZh4w6LV7RELwKA9ZfRlKctjW4KXulM0wNce2gFdYBsw1TcjxGJiolOfX73mHBOHs/a
         ie/25tsgx7iYjHW8l2iRS/KxROi/E9VyGi/vc0nNU2Dkddtd7376TNaINc7Xzk0imh7d
         qzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xDHqlxRoY9ROqi5ycivwmlnHxIhH5v0psmixFXh0iC8=;
        b=lqsgDeg24AMH1/JlxzCsF09GT7mgoe12Cn7LBM/RTwQW3J5Cfv9/p4vwVWjznKc/RU
         meXQ0qbGvcQo4GFYUfyD90l5okqdekZKCA50QqGYgoKLUyoW3jR309hpF3cNMMwzlgNY
         IKIHNJMp6UGn/f3OJCOnx2IhXLJcvVkaH3/SOX92ZLyJXh+i2w4xtLL8KIzqABqgRXxR
         3kMMJIzg1SPjMkNIXBYkIt8TX0yjBon7lswYB+v0P9YJabjTEDxyR7InAAp39y1RRilC
         rb0oD2T9L58R5R3xCITzMHeD8+6UyJwkFzqEhsKbhJ+vqoIfzucrTVePQpevsxEXng6A
         9jKA==
X-Gm-Message-State: AOAM531ldz+wDko8V/4g73wGN7BccFPa0HH2Nm33h3Ugj18YhNX9p8QX
	Il5kN1nEV1vu4LPYRNOweTko68xnBiY=
X-Google-Smtp-Source: ABdhPJzVs54mi1z1fj4mznUdv/evoZpz9q8IGUNSUG42dlmjVSM+JNqMJCSdl8JCaRim1YOl0ZbdBw==
X-Received: by 2002:a7b:ce90:0:b0:397:5cb4:a2ce with SMTP id q16-20020a7bce90000000b003975cb4a2cemr22504265wmj.23.1653980309628;
        Mon, 30 May 2022 23:58:29 -0700 (PDT)
From: Xie Xun <xiexun162534@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xie Xun <xiexun162534@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [RFC PATCH 6/6] xen/riscv: Print "xen start" in start_xen using early_printk.
Date: Tue, 31 May 2022 14:57:12 +0800
Message-Id: <d73f0646ed183750842cdb49b46abbafab2232c1.1653977696.git.xiexun162534@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653977696.git.xiexun162534@gmail.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xie Xun <xiexun162534@gmail.com>
---
 xen/arch/riscv/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 79beb25ff3..ae25e4d516 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -22,6 +22,7 @@
 
 #include <xen/lib.h>
 #include <xen/init.h>
+#include <asm/early_printk.h>
 #include <asm/atomic.h>
 #include <public/version.h>
 
@@ -54,6 +55,7 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
  */
 void __init start_xen(paddr_t fdt_paddr, paddr_t boot_phys_offset)
 {
+    early_printk("xen start\n");
 }
 /*
  * Local variables:
-- 
2.30.2


