Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81F7358B6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551091.860432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF1z-0001SL-BE; Mon, 19 Jun 2023 13:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551091.860432; Mon, 19 Jun 2023 13:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF1z-0001QQ-79; Mon, 19 Jun 2023 13:34:55 +0000
Received: by outflank-mailman (input) for mailman id 551091;
 Mon, 19 Jun 2023 13:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnRR=CH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBF1y-0000wG-2C
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:34:54 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1202d6e3-0ea6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:34:52 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b46b11051aso26899771fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 06:34:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f26-20020a2e9e9a000000b002adb0164258sm5222236ljk.112.2023.06.19.06.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:34:51 -0700 (PDT)
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
X-Inumbo-ID: 1202d6e3-0ea6-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181692; x=1689773692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D79BErD46lr9bA2msM28xOF0IDn3VryLu7dildSZSiQ=;
        b=CiU8FgdpglJH1B2wDzox9elNXnPOGHvSmx8ag4Iu0woaTXZ9X/ui3yu0i8QrlR0mPw
         o3/0Bd8Uw5YS43cMK1jGN0Wx5m9lQWPaw/yhNlBWTFCbn/F040pn7WW+IiC/mfRIdtNM
         M9NDGNV2gVysWaXytZyMewSd0IFSmNNbTOZu2QjMxJci68N8Ssisnz8LHxKU4sxRO4jH
         GOJmUf0fA9m0cbr94B43Lo/TmTjStbg2Mpxelv7FXUoSnXs6TdaXLERWSpz9nV3eVdMh
         uH2Ut5vF6en9pVMsKRVK/x8L6OMs8XZXQYLYw28mqG5yan1FNs4hzjFUJy4YtLPThz1F
         F4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181692; x=1689773692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D79BErD46lr9bA2msM28xOF0IDn3VryLu7dildSZSiQ=;
        b=A925MmXB+bWA5sTrHvNlPcx3A/Iyss0VcU5FQDuHYsOtBlkKCfCCM3Wd/wp02p6NzQ
         JZ96u/I1YolHoywCB+VnCudYtY3Fw3NlvkZ2Y03WfXN2RNJF1iFWuyFPBuud/DyqQW7M
         qCRRXGb+1o1KIVxUW0rH+EpEEmkKMaBZdItHRbdYBzMmoupsOfkvvy3DHrBWxiozB6HE
         pXIuakInLUB+8NL+YNT5YqYhNomQzICB3VR19yJhxRrrr1a5tqDsPwqX1vJTuLjRL/vE
         WIro+sqwUzjmjXAGxcMqCFDN1v17ppqODn9VrfT+6ZmZtvI/lICx62TqiN6+vN2OjxOE
         9qMQ==
X-Gm-Message-State: AC+VfDzWLJWfMRW2//6HnMBv6AvJlaByoCw3z2MjP2f1BZjg1W1c0suD
	qkyARpcgIFvhNwQ8gzid6CqUU6K3PY8=
X-Google-Smtp-Source: ACHHUZ5KWo1WLQnAxG/Ix18faBmCWyG6Ft5VzG7rhfuLO4ZVwOJ/WBt520ZwTZj7Kv88Gh3hr40WjQ==
X-Received: by 2002:a2e:9e07:0:b0:2b4:5fdd:f588 with SMTP id e7-20020a2e9e07000000b002b45fddf588mr4174106ljk.43.1687181691633;
        Mon, 19 Jun 2023 06:34:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 2/6] xen/riscv: introduce reset_stack() function
Date: Mon, 19 Jun 2023 16:34:43 +0300
Message-Id: <6024617719467cd2da8ae03b81ddc899f2ba4311.1687178053.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687178053.git.oleksii.kurochko@gmail.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reason for reset_stack() introduction is that stack should be
reset twice:
1. Before jumping to C world at the start of _start() function.
2. After jumping from 1:1 mapping world.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2:
  - update the commit message.
  - move out reset_stack() from .text.header to .text.
  - add Reviewed-by: Alistair Francis <alistair.francis@wdc.com>.
---
 xen/arch/riscv/riscv64/head.S | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 8887f0cbd4..2c0304646a 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -27,8 +27,16 @@ ENTRY(start)
         add     t3, t3, __SIZEOF_POINTER__
         bltu    t3, t4, .L_clear_bss
 
+        jal     reset_stack
+
+        tail    start_xen
+
+        .section .text, "ax", %progbits
+
+ENTRY(reset_stack)
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
 
-        tail    start_xen
+        ret
+
-- 
2.40.1


