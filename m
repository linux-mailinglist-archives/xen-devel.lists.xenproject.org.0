Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C577DEC7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584494.915353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDp0-0004Oq-JN; Wed, 16 Aug 2023 10:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584494.915353; Wed, 16 Aug 2023 10:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDp0-0004Ah-5f; Wed, 16 Aug 2023 10:32:14 +0000
Received: by outflank-mailman (input) for mailman id 584494;
 Wed, 16 Aug 2023 10:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdl-0003RA-B4
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:37 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89faee4c-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:35 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-318015ade49so5634230f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:35 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:34 -0700 (PDT)
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
X-Inumbo-ID: 89faee4c-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181235; x=1692786035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYFnFWm1v7t2QjE5lipIuI038KEk0Q0YskXiN6kRjec=;
        b=byD9Zj6JJdd5OKMRYw4bmWXaB5O/UBPnbF6z8QXrjso6kW9V1/nCJJnR817vMS7pSq
         LyzZoJ/KT8wMO1/5hfDJd70fCW0ZtEw9fYVs2hEGNodBifja+fbsF2idkBQxuC2m1uT8
         5UMUIvgp87TjsUw4RioLsI+5Zif/ZeiZJNUsxjkgO7WzzLDejNSqcTW0TsryX8iG21Af
         sU14VjL22zQmd5/jKx8017pXEx3tMRT7e688hKtLLjndg3E01l3T72gbv4a/aitNRVek
         NeXYCXiJuhT0ki6ZWHmCeEvMWzOLuVjqc2JYHwi3En+04XklKHd4M2oTUgCWDKGnyFfb
         34yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181235; x=1692786035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYFnFWm1v7t2QjE5lipIuI038KEk0Q0YskXiN6kRjec=;
        b=djdkyn0c6zwB6E3c1JYMTHQDB/eL/7iLIoj4mXN2KmkNf15Y+uLgUG9VSLPi0CQyZ+
         v3NHqx9Rw55IXWERjvYJXW+guTiXQguCgd3ZwYdN0JhL9fT2pn2gjZemrzGNwUH39Aln
         qt99s+iydyPlp792lHjI+MxvbeDl/ElzsVQ+x4PL7o5vSTaIgoNKDA3j/Hm2yKufe7FK
         +x2qGcKlNaXK6GIzTOmKbwOIxF8QtL1YaMrbOLb/lkOrzv8GDLmZeyCVZzWlawWn2mn7
         EWNzzSoE8FO0DbLbZbDkXszK9VRkRzNq4ny90PP2bBazw+TvvO5ScHcS7lGymeylffeX
         uwVw==
X-Gm-Message-State: AOJu0YwvaEFN7SbQu3vsaWVE8JwxPCdl63hSnZCswdKtpUuLYPqxolUE
	kcHCMG40k9irXOeqf7cpwM6Rvv/0FL73UEwh
X-Google-Smtp-Source: AGHT+IGlPeOmgQqeylabUUUEJBTt6ehMmJk1ooeGuoa5q8qBLvYUn2gpu6ihg/Py31WN8wyacRojxA==
X-Received: by 2002:a5d:4fc1:0:b0:317:55de:d8 with SMTP id h1-20020a5d4fc1000000b0031755de00d8mr1154542wrw.14.1692181235051;
        Wed, 16 Aug 2023 03:20:35 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 25/57] xen/riscv: introduce asm/smp.h
Date: Wed, 16 Aug 2023 13:19:36 +0300
Message-ID: <3231fdcdd23bd97aab9769f97a78eaf2e718599a.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/smp.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/smp.h

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
new file mode 100644
index 0000000000..cc8dd18254
--- /dev/null
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -0,0 +1,20 @@
+#ifndef __ASM_RISCV_SMP_H
+#define __ASM_RISCV_SMP_H
+
+#ifndef __ASSEMBLY__
+#include <xen/cpumask.h>
+#include <xen/percpu.h>
+#endif
+
+DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
+DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+
+#endif
\ No newline at end of file
-- 
2.41.0


