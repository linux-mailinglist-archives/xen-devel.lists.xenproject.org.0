Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B96F77DEC4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584489.915327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoy-0003ma-4B; Wed, 16 Aug 2023 10:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584489.915327; Wed, 16 Aug 2023 10:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDox-0003lC-V3; Wed, 16 Aug 2023 10:32:11 +0000
Received: by outflank-mailman (input) for mailman id 584489;
 Wed, 16 Aug 2023 10:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdf-0003RA-S7
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:31 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86ae2aca-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:30 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e57d2so57793825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:30 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:29 -0700 (PDT)
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
X-Inumbo-ID: 86ae2aca-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181229; x=1692786029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JObOAsE/aE44QEnQc1GjFcKOPxntIWUTpYQMbgiTZRc=;
        b=KMX11LR/JyNOhPuCz9uMpHEGhyPfb0SA+eSzg5UC55QLlsc0L3g+LJrTuAgW2TcOgP
         m8BYR1d2QJ6Tp2i8NB6aA2nRuEx22tYUNnxZyIhjjAu9CSgqDUytmGxs7IVO0cHNpB8y
         qtyoPRRt8Qdg5yELf1Kmt1thlu02RkOGz+T44lEb/jUeObogX7HqBtbXWfnuZWzmIVeH
         2Cw0nkbKzugfhOFRnI93VWgroeavxn4I22mG+SQ1vZUORRL+ojrxWt98xLNADpKIzoij
         JGe90jOA1NUm36VvoH5wq6E/u1asy7F3irpTeJAtsjniOxCJuuAz1wJewZcdAkzM94RT
         nO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181229; x=1692786029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JObOAsE/aE44QEnQc1GjFcKOPxntIWUTpYQMbgiTZRc=;
        b=TXzTMZGVUZm2MdNu7ft0ffcrnvMdKawsSX3pSCWsXpDOjWKc3lQLuxIZj6gZD0EJtm
         1fVLoDoUXD4lS24sS3rakjkhsy9TT2m59lTpG6C92GGTYeGfCp9fl347S64npl+DAWIf
         giXGZ9pgO0skGBUW5xOAnv9NH1RxeuMMdXzWBcBgK6HdZoSPJwrDO1T8Pi1UHfJ8fmZ1
         d3hBZ7xEfmYxzvWuNu1tGH6IPfvtdTQc3zsytLvyMyY1n0HTjzImfGKWOToW14pifVoT
         U/FXhdRxIhuW5GPiylQ73CfVnC/GvGQNKVOOAz4moegwkwd1c6gg7IcjNqk3FnZZ36OW
         Mj1A==
X-Gm-Message-State: AOJu0Yxe5NZDzlshUbu9d7GkIiU1R+FcJOpP/yAsLxYOyMZgiBr3FOo+
	8jQjKL3uu3V3YCEMxQqDvyNo15bjwou/S1Oc
X-Google-Smtp-Source: AGHT+IH5L2LbtkLRrXB5iB4m9ffBWKrNIsWnkd1KL9FI+IfP0m3wYgxXgsguEmBATMK2ndsNyKnHcQ==
X-Received: by 2002:a7b:cd07:0:b0:3fb:be7c:d58a with SMTP id f7-20020a7bcd07000000b003fbbe7cd58amr974621wmj.26.1692181229570;
        Wed, 16 Aug 2023 03:20:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 19/57] xen/riscv: introduce asm/setup.h
Date: Wed, 16 Aug 2023 13:19:29 +0300
Message-ID: <20012803bf6a630f3dc2f78cfc8524b7a89e6ec4.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/setup.h | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/setup.h

diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
new file mode 100644
index 0000000000..9b3f8c6416
--- /dev/null
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -0,0 +1,6 @@
+#ifndef __ASM_RISCV_SETUP_H__
+#define __ASM_RISCV_SETUP_H__
+
+#define max_init_domid (0)
+
+#endif /* __ASM_RISCV_SETUP_H__ */
\ No newline at end of file
-- 
2.41.0


