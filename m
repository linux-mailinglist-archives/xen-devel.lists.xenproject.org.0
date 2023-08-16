Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688DC77DEC3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584487.915318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDou-0003Q4-Ry; Wed, 16 Aug 2023 10:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584487.915318; Wed, 16 Aug 2023 10:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDou-0003MU-NY; Wed, 16 Aug 2023 10:32:08 +0000
Received: by outflank-mailman (input) for mailman id 584487;
 Wed, 16 Aug 2023 10:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdg-0003R9-5G
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:32 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87917aa9-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:31 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31969580797so3568989f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:31 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:30 -0700 (PDT)
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
X-Inumbo-ID: 87917aa9-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181231; x=1692786031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to9zcOK1uQRDwQjF/M/tIQG/U0cMxLKxzsy4fRBRfDU=;
        b=Z/CI5IF4vUdEc9lFMshBHxayi5NPOfff3DQlbSiTpYLs+WhTlbUJhLpCNY5J4Gnwiz
         DFBh1eIEHtQMWuRF/gn2byxVlJtYbT4Kz7Lan/3NxYmgNd4vfpWlyAEIDY2iw6p5TmHy
         Il7SX6F/1ALIULJzMAk/gPt6wGDqlvvPB7ZdVRQT9+ykQ8U9VLoCe3E04iLsRyse5gUq
         bh0BMRgjTnMcPTBPRrZkYDMFVDVy4g9tLbMzEp7OFqaNBproxP5VCax8EQG187MdPM37
         iH3hWctTXLZLLlldBoLVWvIX1s2skYhLONKZNR6QLSOM5Hzck2JaqY/i6NrmhOPl7X9M
         M3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181231; x=1692786031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=to9zcOK1uQRDwQjF/M/tIQG/U0cMxLKxzsy4fRBRfDU=;
        b=icEvd/knVH87kOfAHc0b1TNTm10R22R9JocQi9yzm9JtaWKugeFpOXb+Ly0uTXAeyc
         3W7lOc6IuLFom59aCtNoG6QQHsQrL62qTId7U235HbDbkAa05vsrUjwjZHFt7Sl8+jKc
         X60g/RQ+LnZVZHEpDKzgxnt7MAo3rAUEr3ZsMN7Jk4rrD+yBNFjThYrQPq7b3My9uok8
         BFtD57g6p+9AbAa3njkd9s2P9mVFkKd/BFdbyXRxAkKzr5oJzGTktDzQ1heey7iA1nGj
         sGq9veyLWUpyZl+eExtwv/hAUaHKXTMKaaosvr+EfVohvNwwoLfUY9BEvJxw9LAGIvGr
         GG9A==
X-Gm-Message-State: AOJu0YzeFBCoE2tJj6au1GJrSSAr1CQuUYptknjCtOnW4bnZwskpJR5J
	Swy/C2MaUZNvrCWiGdyLtOIEQNCh0JUIxWGq
X-Google-Smtp-Source: AGHT+IECQ58HxC/6US1BLJIoAjxJv6sqZXWyk6YQPoXEYLCzkTk2HrrMwO+TpWpTbOGlyZM+OwM40A==
X-Received: by 2002:adf:ed8f:0:b0:317:60c9:e826 with SMTP id c15-20020adfed8f000000b0031760c9e826mr1215971wro.45.1692181230960;
        Wed, 16 Aug 2023 03:20:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 21/57] xen/riscv: introduce asm/xenoprof.h
Date: Wed, 16 Aug 2023 13:19:31 +0300
Message-ID: <79e1d38ed9245de51e3c3441ed464db61d3b95f9.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/xenoprof.h | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/xenoprof.h

diff --git a/xen/arch/riscv/include/asm/xenoprof.h b/xen/arch/riscv/include/asm/xenoprof.h
new file mode 100644
index 0000000000..e3fc625932
--- /dev/null
+++ b/xen/arch/riscv/include/asm/xenoprof.h
@@ -0,0 +1,4 @@
+#ifndef __ASM_RISCV_XENOPROF_H__
+#define __ASM_RISCV_XENOPROF_H__
+
+#endif /* __ASM_RISCV_XENOPROF_H__ */
\ No newline at end of file
-- 
2.41.0


