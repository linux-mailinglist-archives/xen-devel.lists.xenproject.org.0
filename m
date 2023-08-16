Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F577DE70
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584321.914898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdU-0003rr-A5; Wed, 16 Aug 2023 10:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584321.914898; Wed, 16 Aug 2023 10:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdU-0003kC-3d; Wed, 16 Aug 2023 10:20:20 +0000
Received: by outflank-mailman (input) for mailman id 584321;
 Wed, 16 Aug 2023 10:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdS-0003R9-P4
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:18 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f835c75-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:18 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso4427433f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:18 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:17 -0700 (PDT)
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
X-Inumbo-ID: 7f835c75-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181217; x=1692786017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmQE7YbBE/xqXjDY6ZyEVZBjOafIVKQhC8sYEHDqZtY=;
        b=fREV2q3U2eUUsvOYwV3L0MIz8kJLaom/+XdQX7SrRPpUJSnTYwIGpicA3dmvZq8tWa
         p/hvkJVzquvz1sMD3G5DEnly7WmZe5r6mykH5gT29Smpb6io/2T/LiTiIBLbeBfOMOCh
         Bgh3w5JRWYLAokEn+B79RK/vALiXPd4+smCRkLYhr/imPEtlva9xqGNuLMF1Ib1a+f7M
         O3dNSJ6eSqmSFJsymgSuq1NvzQ1fk4Siw54DD04QqHTfbeUMk9J7vUdJQFvcDveTlWzA
         WwfL8pDhuRbg39nRgsRouukrbmLoHtetOQzHagl/iVhJJRN82e/WxdDpeDvYymxKB6r5
         /dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181217; x=1692786017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmQE7YbBE/xqXjDY6ZyEVZBjOafIVKQhC8sYEHDqZtY=;
        b=lm40YGhPPT6G1uOw3uDy/Nacu+JM9IdNEmSDtzgRi3VxMuT//aBsR4sYnEOcQ9LvLY
         QLMKiegaYpYgbHzbBRK1L1JzrgbuhF4WeqFMglR1aXF2xPFAEBANDP+qsBcXPKW8xeHT
         wBDEDxTmCNq3S3naXBVhfOva0JvW0OBGT1jt5/2uUBFaxct1r+FT3dNNm3JidtRFPjbl
         jZW7j6Kg6nPXzG+3bXJY5GaCkByXOpj7If6MxIzT9uEn1EEmQaPIYLKxeji+0cDwMvZ9
         5Jst10BDxOb4Thaf9BNXU9QC0F+FriVXIts6yUXK5oUiCc676NAsS2UJVflCJidkIFOA
         kd6w==
X-Gm-Message-State: AOJu0YwMGeGNNW3BN6mXi11N1/uELlDeg+fzSmXdJDODo2gZQN6P2lw2
	hD/xy8eU5XxroCjcUKdzwTUubVjvHzffG7D5
X-Google-Smtp-Source: AGHT+IG3fwXVhTit235aHwBB+bduktkRGZhk3brGQEIX0aB6uLyd73Tk/uOFU6uaj/8yogUwvz4OaA==
X-Received: by 2002:a5d:67c9:0:b0:314:475:bc6b with SMTP id n9-20020a5d67c9000000b003140475bc6bmr1234111wrw.18.1692181217491;
        Wed, 16 Aug 2023 03:20:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 04/57] xen/riscv: introduce fence.h
Date: Wed, 16 Aug 2023 13:19:14 +0300
Message-ID: <3e3a0893da26eb534975c8c60f4cb3e0f2721610.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/fence.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/fence.h

diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
new file mode 100644
index 0000000000..2b443a3a48
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -0,0 +1,12 @@
+#ifndef _ASM_RISCV_FENCE_H
+#define _ASM_RISCV_FENCE_H
+
+#ifdef CONFIG_SMP
+#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
+#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
+#else
+#define RISCV_ACQUIRE_BARRIER
+#define RISCV_RELEASE_BARRIER
+#endif
+
+#endif	/* _ASM_RISCV_FENCE_H */
-- 
2.41.0


