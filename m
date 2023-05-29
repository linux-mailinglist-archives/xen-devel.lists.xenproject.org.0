Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3771492E
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 14:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540606.842475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkg-0005l2-1I; Mon, 29 May 2023 12:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540606.842475; Mon, 29 May 2023 12:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkf-0005cG-Sd; Mon, 29 May 2023 12:13:29 +0000
Received: by outflank-mailman (input) for mailman id 540606;
 Mon, 29 May 2023 12:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi1m=BS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q3bke-0005DI-Ci
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 12:13:28 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 363edad5-fe1a-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 14:13:25 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af1c884b08so39784941fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 05:13:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z14-20020a2e964e000000b002ac87c15fd4sm2427762ljh.95.2023.05.29.05.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 05:13:23 -0700 (PDT)
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
X-Inumbo-ID: 363edad5-fe1a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685362404; x=1687954404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHQHWourHZby5JiDzW3SkVKPGSqK79/gkhN0T0QJ+Ak=;
        b=oR7cLdVsdieoIpYv82dgRiF9/zLzzAid/pFmpbkcUioNpbkh3/qHGt1TYm/rVl5DJx
         soBQV7eVkPDC0RIPuDv5yucnEkEcnYfnRudMEh+t68+EuLv+mttGoX1YiqDjHUsHrhEH
         lZ3sVbDL7CVDCrCl9dkg9P4qewvgQSaEh3q7feQ15eHAH3lhz/MAmDWqpl5MstytXF+J
         4TDFF2YLMwYSt4MQIeQZko4sCdaOIfmFXNa0HodxhDc48UdutIvupJGlIGz45tGNjFi5
         +iQnR4E2Fc3RAkjutsdeAKvcIUAdApps6M+YGBJlGLaYrRbNbsVKvoO6/ymWvaAxb/L+
         2OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362404; x=1687954404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHQHWourHZby5JiDzW3SkVKPGSqK79/gkhN0T0QJ+Ak=;
        b=YHxJV0JNnM7jSoKAd6xXe0fSkENQ8GrbSLUeVHXDYRW6W74GTmPTajuc09MS/siQFf
         GMJv5cIksu2mwJWhE8MsgzzRNUMam6PL+butp29skEvxrP0/W0XbtCmzjbWNhdfRDIzn
         wdRguiiZwnu3gC1EumeLmK6shD7lmBR7U2khR6D1svF1RQ48vCbEzvOK/H0TL5umiPWN
         J0AbjT+7WveMyFNwnxEw6NhjlsVUR4OsItffS/1IBiVFXUelTU82c/yDibFbNF6ELGG2
         KvzTdAxRwA2ZaTXLDYnv3mluFGoLV15bKTGgT6pGTXtZLsvWvAbe0dRR/nSrzH4ERSld
         gR9A==
X-Gm-Message-State: AC+VfDxrdW2ObdctrgE7LVoBoTIU8nsLkKB9T5ML+/+sdEsHxS0MDf43
	+4PX1CBoZ9Z7TI9bZFQrySC4yG03FYw=
X-Google-Smtp-Source: ACHHUZ43cpZFa9TVNywdOJd3rfXwSv/GypAR6BFC3btMjVEMX79QTrjh+aBZWQaeBunLSyl/B6FQUA==
X-Received: by 2002:a2e:9b0d:0:b0:2b0:248c:bc4e with SMTP id u13-20020a2e9b0d000000b002b0248cbc4emr2678913lji.19.1685362404357;
        Mon, 29 May 2023 05:13:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 2/6] xen/riscv: introduce dummy <asm/bug.h>
Date: Mon, 29 May 2023 15:13:15 +0300
Message-Id: <268eb55c4f6ff4eb9e1a2524eae7645ffc79568c.1685359848.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685359848.git.oleksii.kurochko@gmail.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<xen/lib.h> will be used in the patch "xen/riscv: introduce
decode_cause() stuff" and requires <asm/bug.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Nothing changed. Only rebase.
---
Changes in V5:
 * the patch was introduced in the current patch series (V5)
---
 xen/arch/riscv/include/asm/bug.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..e8b1e40823
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021-2023 Vates
+ *
+ */
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#endif /* _ASM_RISCV_BUG_H */
-- 
2.40.1


