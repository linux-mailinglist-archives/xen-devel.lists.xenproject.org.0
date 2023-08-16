Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365B77DE7C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584336.915027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdk-0007iX-2X; Wed, 16 Aug 2023 10:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584336.915027; Wed, 16 Aug 2023 10:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdj-0007VB-3e; Wed, 16 Aug 2023 10:20:35 +0000
Received: by outflank-mailman (input) for mailman id 584336;
 Wed, 16 Aug 2023 10:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDde-0003R9-2N
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:30 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8647627b-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:29 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so5414514f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:29 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:28 -0700 (PDT)
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
X-Inumbo-ID: 8647627b-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181229; x=1692786029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6/TWt8JyUliAgL0VQ9PeLBO2G1fGORJ9yn65OnmJ4U=;
        b=I+5Nqq1AycjwHVxZF/DsdtKPQOyyfDk1IyIvnOX8ulAS6SlCHGRKInO/9Ad0k+q4GL
         qqmcwYI2ZzDODWAITgGFoK+e1u1Ji+ToSOw5bvWuVzIwp2mvh38UwWngkDaWd7Zxkane
         8IBNhUs+6N9VxIVU18DUR2YxCdyKRnqvzkzm9WJTMRdFaCt/PnNda2+zjpiZw7KEboUR
         9Wt71u1Ber212slFrk3C7g1tINh25t5GPJZZPP8P1rpIL7w+RBWpew++AxeIREigKyE2
         B3ibj+rEA2gcbq3Q5jPsP9H2DVbYQVkTrqM+QhMbz9vV9LVYbzgBwxX+iPFGNpvZcQlh
         8aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181229; x=1692786029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6/TWt8JyUliAgL0VQ9PeLBO2G1fGORJ9yn65OnmJ4U=;
        b=e7gBnhD4BiHWB0gqEzh1D+siKPBWIzDTVI/VhAfhMem+dRMVBE5lcEgeUtsXOTUD8T
         E52tyOhgK7Fc+ctBdYXWUI2HTKcw9gO63rIcNu63jG7OIaBFCqi+O6g1knXR/sNiaLc2
         RUjaROuMmYKeFr+Zmguh7izUVhZ0f1C12z1VNKbL4VwelQKVP9dy8fEhOjTF++h/D78v
         IgY+72bhNTESwDBo323NSN6VP+8ep/HsLSbf8CVwO/pCGOR9sF4GC3TmI+CMkEmf30Yg
         HmxS7HxJEnLOAqwsXVwxgJMBwUNhBnaDt4FW7KZhbL4GLo8rbmdSGg/YO1/bl1hDbXID
         Gikw==
X-Gm-Message-State: AOJu0Ywv1QNpb/N2VK2uw3Lw834osfjU8nzKpLXhkPbSNAzLgc51lq56
	zYgtvKyMu6B/MZoSNKIiHiHpu9p5NX1dHXhI
X-Google-Smtp-Source: AGHT+IFAOEgWdsxQHRgM8pPlFS9Qu1nW/WAL7gnra6ITXmlqiWLCRHhCviGf4fr6QgZ3esNJb4QGiA==
X-Received: by 2002:a5d:46d2:0:b0:319:8a2f:bdf0 with SMTP id g18-20020a5d46d2000000b003198a2fbdf0mr1218455wrs.17.1692181228707;
        Wed, 16 Aug 2023 03:20:28 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 18/57] xen/riscv: introduce asm/random.h
Date: Wed, 16 Aug 2023 13:19:28 +0300
Message-ID: <93fb3701ad107c4cb772eacad215e70016ebf348.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/random.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/random.h

diff --git a/xen/arch/riscv/include/asm/random.h b/xen/arch/riscv/include/asm/random.h
new file mode 100644
index 0000000000..8d5df8a9b6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/random.h
@@ -0,0 +1,9 @@
+#ifndef __ASM_RISCV_RANDOM_H__
+#define __ASM_RISCV_RANDOM_H__
+
+static inline unsigned int arch_get_random(void)
+{
+    return 0;
+}
+
+#endif /* __ASM_RISCV_RANDOM_H__ */
-- 
2.41.0


