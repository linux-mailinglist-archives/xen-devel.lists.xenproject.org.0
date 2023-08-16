Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1F77DE73
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584328.914974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdb-00060Y-VK; Wed, 16 Aug 2023 10:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584328.914974; Wed, 16 Aug 2023 10:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdb-0005uQ-Jm; Wed, 16 Aug 2023 10:20:27 +0000
Received: by outflank-mailman (input) for mailman id 584328;
 Wed, 16 Aug 2023 10:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdY-0003RA-N2
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:24 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8276962a-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:23 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so5612683f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:23 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:22 -0700 (PDT)
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
X-Inumbo-ID: 8276962a-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181222; x=1692786022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhAu67sMwHty1r+zQnhkcx9wQhoHYp8AlTSR9BpKnOg=;
        b=BZK1Qbn60qwsyRjemBEVOp4EIS1rYEYdpTgey/bDNK8gMJIBURKO39gh0it5Vii+PU
         3zTYqtXEnRfpD4E4PQQSTaRvfigcslFKUgDLOzckClQSkl4xVmVAeKQcDQfnnZyPyIOs
         eIcMV3ps+xVL2abMJHSmCL0bUz4ouvRAaY+hYJyX8gPsbVvcJ/huBv3kkiKz1ShX6Ox7
         UeLZfZj3lRt/Ua9UyJpdjAPF84al5ElTQK0s4ryY44VyGNmBveLNbHqbYuj5FDkvxUB4
         LOsXzmDH8IvvF4bLllWHgFdHy6+YFwk80JErr4UK+kv85j84AEY4IoQzFT1YFzv9PirL
         Mpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181222; x=1692786022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhAu67sMwHty1r+zQnhkcx9wQhoHYp8AlTSR9BpKnOg=;
        b=g7oC0rR7r4VVMBrEx+zXdnJMDt+ZpYNF/EAhaEv3BftidJ16+CL74O5ns3U3wFP5Kp
         aaRl8HLuUnXWCNKpFlhRU4e0J/vzmJhfBd/TVl7DaGjTOOrRTpUSoryBtx7AOE4U337D
         RihhZ+MxF8V8sgBlhO5lVRB6T9xQhKQeTNGa+8mBiU2OmMidwIBM1qxGjtMdXbOYG8lw
         hLgE6hPgRam2n+p1ZBizFiTqnRQOOhOiT9vgvef3OmtmC++rODPBekT92+6QdQwmck2w
         z4sVCqbs9zLhsSI03WZab9X49MFhphtkYgRcVu/6fNHf7a7JDhVzeFN3WW4Amhu7l9Wi
         PHAA==
X-Gm-Message-State: AOJu0YyIB6IAcvh8VkW1QoVSmq33X/gb+5FpYtGdzzlg5n3UcVHptn6/
	Y2kAOnCs2/rXQM9hY70fbnU8uQFq28/UGGzf
X-Google-Smtp-Source: AGHT+IEqo1y2+vTE6x7fi404GmyxDTZnaB5k4zqpLpHzhDCJXGR1h4TK/nnO1+VMiVcp0Refwtrpow==
X-Received: by 2002:a5d:5303:0:b0:317:6348:8a9d with SMTP id e3-20020a5d5303000000b0031763488a9dmr1276628wrv.66.1692181222440;
        Wed, 16 Aug 2023 03:20:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 10/57] xen/riscv: introduce asm/grant_table.h
Date: Wed, 16 Aug 2023 13:19:20 +0300
Message-ID: <55a562f81b7bc6d308a1f2008daad6c5e0de0562.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/grant_table.h | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/grant_table.h

diff --git a/xen/arch/riscv/include/asm/grant_table.h b/xen/arch/riscv/include/asm/grant_table.h
new file mode 100644
index 0000000000..600fb10669
--- /dev/null
+++ b/xen/arch/riscv/include/asm/grant_table.h
@@ -0,0 +1,4 @@
+#ifndef __ASM_RISCV_GRANTTABLE_H__
+#define __ASM_RISCV_GRANTTABLE_H__
+
+#endif /* __ASM_RISCV_GRANTTABLE_H__ */
\ No newline at end of file
-- 
2.41.0


