Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C5877DECA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584505.915391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpB-0006ai-J9; Wed, 16 Aug 2023 10:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584505.915391; Wed, 16 Aug 2023 10:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpB-0006TC-BC; Wed, 16 Aug 2023 10:32:25 +0000
Received: by outflank-mailman (input) for mailman id 584505;
 Wed, 16 Aug 2023 10:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe8-0003RA-2T
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92a5e942-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:50 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-319e93a1594so550858f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:50 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:49 -0700 (PDT)
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
X-Inumbo-ID: 92a5e942-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181249; x=1692786049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHCt3rIVbyvXRgwAssE3JC7jIeGq6/wtVtrQWKu19qs=;
        b=oOxinih1MvrlDtL77m6bZY+7k6RK84W2TCemn4LqrF9VnmcCmPBypZju7aVIcP2/XP
         Ee1Gg8L1Zm2Rr2y3qai/N1op+n6QUgmuO3Fa8Ne7w8L2KvK+HzDbjIDRCBiQ/LumuBrf
         KWdV+e+X+m2DXIREIPVH+MnDOavGJq4D4WLGe/FnxsCNI+3VmnTN6sf9w8/MMYO7kS9k
         palTLjSYQ0/3bhRQkKr7d1C/XWUoTt10OlCqiNoPuYjbA1QVAsT8vXj/ZV2xxyYIZHSN
         pXL1PhcrjWpVOLe9Uv8xROHpFneUoQiIxKfmzNMNHULeJF2Un1GwMqKIA+/PtNAhvrUr
         aVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181249; x=1692786049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHCt3rIVbyvXRgwAssE3JC7jIeGq6/wtVtrQWKu19qs=;
        b=QLEqHJp8kZFr39oZGSVl61WktGhi+Me7QtZwt9v8GJJ5+nyJqX8Aq2mgXrnHPmRtmH
         hJ/bRVZk/eyBV2bv+qXdEPc+zL5af7iEQtIy3oGp2ddyvXtxSJkYnNS6qXN2I5vGn878
         T1TdgYpnjwrDDlNVr8fQuKA9ZPZ8zt6q481oxuOfXOazDJneGQM818QR2YBOHj7l/jRG
         Y5S566SwO+1ACdneZNm01v0Enp7Ze6BQAcRoO8GV444DKmmZhRdpa0b8mvpVgVvZZMnv
         WG8dwr7SmepHlipIcs4cMWTYeuwD2PTam9ujAJIF6XXY6azFqkoDkPGwAEfSFsNfRgXB
         AWeA==
X-Gm-Message-State: AOJu0YxeyKQYHRQ8jnSwzb2E8Sb6zQuG1abQpaW+TbVNSL0LwW1gE0Vb
	IW/hRVSsU/ChhPlTNyT1ozwfBX6EehovjZ5W
X-Google-Smtp-Source: AGHT+IE0+2TyfHFFrR72mXBKm3+Bz9S1F94hCDTqMCfEI5yg0YAyFA3X/R+trUNJem/BQAr5FXcaOg==
X-Received: by 2002:adf:f3ce:0:b0:319:8333:9052 with SMTP id g14-20020adff3ce000000b0031983339052mr1067526wrp.26.1692181249622;
        Wed, 16 Aug 2023 03:20:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 42/57] xen/riscv: introduce asm/softirq.h
Date: Wed, 16 Aug 2023 13:19:55 +0300
Message-ID: <a818a6f55bbdd21b554134d772f11b07d8d25ce5.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/softirq.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/softirq.h

diff --git a/xen/arch/riscv/include/asm/softirq.h b/xen/arch/riscv/include/asm/softirq.h
new file mode 100644
index 0000000000..8364aa2810
--- /dev/null
+++ b/xen/arch/riscv/include/asm/softirq.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_RISCV_SOFTIRQ_H__
+#define __ASM_RISCV_SOFTIRQ_H__
+
+#define NR_ARCH_SOFTIRQS       0
+
+#define arch_skip_send_event_check(cpu) 0
+
+#endif /* __ASM_RISCV_SOFTIRQ_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


