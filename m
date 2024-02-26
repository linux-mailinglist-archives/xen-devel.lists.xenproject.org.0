Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893C867EE2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685703.1066941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeww-0003TQ-5G; Mon, 26 Feb 2024 17:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685703.1066941; Mon, 26 Feb 2024 17:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewv-0003Mq-FL; Mon, 26 Feb 2024 17:39:33 +0000
Received: by outflank-mailman (input) for mailman id 685703;
 Mon, 26 Feb 2024 17:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reews-0007pd-4H
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:30 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6b737e-d4cd-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 18:39:29 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d21a68dd3bso45216901fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:29 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:28 -0800 (PST)
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
X-Inumbo-ID: fe6b737e-d4cd-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969169; x=1709573969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoDhsePwwepX/r5KY2WQ6UW+JdGX15fzkDHjAkqmcRc=;
        b=bZbt/OTLWtcB9bi1/HajYiz6rpc4h+T00s1ludaBa16/Jj4gH6c+UfmmdR7xa/nG9g
         bNfwTRTxYODpgaiH7/fJXsZjFIUxY30IW/OAED+TyH5TXTRDxTMgZvybfYTZdr3vE5A9
         QRLRMlXknHX0i7A9Mqcyw+0UQodGj3rpwxobRJvvxiP13c62MLNsGCPoVsFvRMvrb8XY
         MkdgZvUSVVAFaqttgI5jbxGJOS+ro9H31zeRSh5kfTm3hQCnvL3qXpSOF+ZoFjLICIXv
         qpDCleEshq2NH5sLk9/4dwNM7ffdwiays3CRlfEYkwEbvjHZr3f5VIhFBelmdz6KgB5a
         /VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969169; x=1709573969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoDhsePwwepX/r5KY2WQ6UW+JdGX15fzkDHjAkqmcRc=;
        b=rrO5+t4sc63ZrefTqKpql4AesUHgUo4VBpAWvFwckn3zIIKHGHmlniYqcXXtO7ty1Y
         jVzZGkG7kVs7JmUAyBPExMraJ011cfFbhT7DjyKTxUlKOTQxKDx7prSPbP5l0A32myRm
         96y2Y9h8PulxDMLVMroppjJ/JkTlhOeaadypfeLjtN8Y87mUPs7YijCMZCaalQKG0uoF
         2cPq6GgQ02tTbNiqdcAgHZdMs41ludMbwgMbZuBsI3dKwmBK1hwoIuAqXb+XwqIoDE5f
         lpwXVjh/YrRBC/NxC4/qYUPmM418kK4xyo1rUr+PN+su9YYEuhEWMFeZbohfLszxkX0g
         tsQg==
X-Gm-Message-State: AOJu0YzX16N8ZpC6EO0dxqElJLu6Sm3QmtRrhc7RLjztq6BVt2yO2qUT
	EA0tXCaS99hPk6uyIkqqwllpX1reEP8w7P/mj8mVJFq+TqHEYg11MCL4T6LP
X-Google-Smtp-Source: AGHT+IGurxaq8CewGzRaeGMOflWCYSSwy2LYoKIQHP54CIvRNl7MBbPlrKlyP0rswHRCHwOHQQyptQ==
X-Received: by 2002:a2e:a498:0:b0:2d2:38ff:8b6 with SMTP id h24-20020a2ea498000000b002d238ff08b6mr4136045lji.49.1708969169135;
        Mon, 26 Feb 2024 09:39:29 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 15/23] xen/riscv: add definition of __read_mostly
Date: Mon, 26 Feb 2024 18:38:57 +0100
Message-ID: <4e089eff445421192fcedc5f04fd6cee25090677.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of __read_mostly should be removed in:
https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

The patch introduces it in arch-specific header to not
block enabling of full Xen build for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
- [PATCH] move __read_mostly to xen/cache.h  [2]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
---
Changes in V4-V6:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..94bd94db53 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_RISCV_CACHE_H */
-- 
2.43.0


