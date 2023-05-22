Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4336770BD68
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537882.837511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V6-0001Ps-By; Mon, 22 May 2023 12:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537882.837511; Mon, 22 May 2023 12:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V6-0001KH-5k; Mon, 22 May 2023 12:18:56 +0000
Received: by outflank-mailman (input) for mailman id 537882;
 Mon, 22 May 2023 12:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q14V5-0000XV-1F
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:18:55 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1141695-f89a-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 14:18:53 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af177f12a5so52339401fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 05:18:53 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004f26aabbd6asm961120lft.130.2023.05.22.05.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 05:18:52 -0700 (PDT)
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
X-Inumbo-ID: d1141695-f89a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757933; x=1687349933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvpxCLBBqorbQeBpQfAjag4bfazOq0BLsYa9CfgITIY=;
        b=JmHV/vqB3H+bbZAmtmj3bQEGhoH/cq5iEmr+KxT/6n1qpa67uz2QnkGfjo2rDOWPQy
         saN1tvu8jschQCn+/24IOLucNQJwun2ktIn5ga5Wh0X1681AtwZ6VwvnL+HBWkBm3K9s
         kGb0ywialknHJiwE9QTNAYrn4oZIyglxSPI7H1Dc8ohmz5KzFydOVFhUpIT4QM8NK0v4
         lbZUb4Pbh2I9oN2cuAm7xeRmB5U7qInCwxLTn4TXKH4/yJLrikuJvggK5+iVA9tWQF/k
         PyWIvjMjcQqIL6QqvHiA3ETRlAjLzfeZTOs39+2tK05eFnGzxdMIlUBNbLt3GMqdPJnA
         Gzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757933; x=1687349933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvpxCLBBqorbQeBpQfAjag4bfazOq0BLsYa9CfgITIY=;
        b=D1dI6Gv+d5AxN1sdKIVyiNmMgTWs5U50cRsnKjI2kv7+SGsKw1f7eLfAGmLnoH/61l
         1wJY7ig70atMyTVuPtBlHz/xdTQnfi9ulI9uKBydyclbfXPxyFyl1N+N/TM8NFKC+T4F
         umtQVr17a6fHbmcRvR6P6x6apbEVwivQqR0w5jkM09faM4x03B3PMvRqn/2rSMrbr9CB
         eSDsJeIJb4Gmpdvg9ew2rp7Iv4CKOkIViHG5Os8kszS0BV/njWYor+ek9RxigL+MukzW
         u2/cIJc97c5WpRiXYrLHM+cLmjMLi21DBozMU0TMec/SLHrPCyUZGKdwgck4NsoawnJW
         HblA==
X-Gm-Message-State: AC+VfDyXzxjdlTo23kQbIGMrPqdE+1fWA3u5/rlgJJjErcArdaTghpEt
	OCjqlEsc5b59VtCL6w85MqS7+4Yg2do=
X-Google-Smtp-Source: ACHHUZ4QlJ10wu0A6K9oPFNOy6NPUIvuKoMJdRlJ2MlttbxuuO/WN1L1GTDpkZHZoi3IWsUR0tTdEw==
X-Received: by 2002:a05:651c:8f:b0:2ac:598e:e946 with SMTP id 15-20020a05651c008f00b002ac598ee946mr3989905ljq.3.1684757932827;
        Mon, 22 May 2023 05:18:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 4/5] xen/riscv: setup initial pagetables
Date: Mon, 22 May 2023 15:18:45 +0300
Message-Id: <ad78ba36f408f01a8a37365865ff032b495bbb2d.1684757267.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1684757267.git.oleksii.kurochko@gmail.com>
References: <cover.1684757267.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch does two thing:
1. Setup initial pagetables.
2. Enable MMU which end up with code in
   cont_after_mmu_is_enabled()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - Nothing changed. Only rebase
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - Nothing changed. Only rebase
---
Changes in V5:
 - Nothing changed. Only rebase
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 - update the commit message that MMU is also enabled here
 - remove early_printk("All set up\n") as it was moved to
   cont_after_mmu_is_enabled() function after MMU is enabled.
---
Changes in V2:
 * Update the commit message
---
 xen/arch/riscv/setup.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 315804aa87..cf5dc5824e 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -21,7 +21,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     early_printk("Hello from C env\n");
 
-    early_printk("All set up\n");
+    setup_initial_pagetables();
+
+    enable_mmu();
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.40.1


