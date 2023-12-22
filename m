Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4381CBE3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659418.1029105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDX-0001vk-NS; Fri, 22 Dec 2023 15:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659418.1029105; Fri, 22 Dec 2023 15:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDX-0001o8-E1; Fri, 22 Dec 2023 15:13:39 +0000
Received: by outflank-mailman (input) for mailman id 659418;
 Fri, 22 Dec 2023 15:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDV-0007Ie-CR
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:37 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adcc1087-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:36 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e23a4df33so2371452e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:36 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:35 -0800 (PST)
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
X-Inumbo-ID: adcc1087-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258015; x=1703862815; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHMk6Oxp121rk9ty7tSxLKXI3fAoLJtgO5MBH3moim0=;
        b=RV4QUaSifNc7bdSBDuoXnutuXVM25j2YttpcVRqbE1PbtVxQR9ulann6lToSSm0Chy
         qSye2d0xokUX1Gk2xwuy6t8zMrCEIzjuhPmNOIly4dsUEcygAkJgo9J0rsQ9v+G3zrpE
         PfbD6UFS7QOrKi6m429Io8PE2RfWIf1V920Kp5xt9Jr2vg8h7qJNSGHLURFdfsbXB4Qr
         20htjoKCwsCdiNJ+Iqv1v4HCA4MedRWmrC1qhDBynSnlHolb01YzW5BRL9aqkI5pmWHO
         gBHqOWqlsTOrcyPbZ+IKs8lV7amakAQ5rx0LuXEPZeqYi2krz1jFteXyqGjddqBZlK+H
         ZFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258015; x=1703862815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHMk6Oxp121rk9ty7tSxLKXI3fAoLJtgO5MBH3moim0=;
        b=tjGHKJnxznPRnRR8+XyU//VdMU3gs02D7osmt0SOqv6a1/Iq0ovqPf+pt+dDZRdgDo
         qyr8/cA1hEmlusIOEPz9HSgHq7MsUmbGtHcl1zOW/aJ+bEN/jBX+0NR5cULrwWZwVOhn
         bQgkDjP1K/jgYSosdIwEPZvKgxojL2GB0msPIwl9IUX0jeYP6qbxpfM8Irah0mCj6e/f
         vb/BQInZRpe5MMWGd+eFGqBre8/jflo4mz7L7CLSXbyJjbkKOcZDo94ab8eWV9fUtLo9
         lixbfBge8nvOfkILUlHtHm1EVa+vTcfcfY1F6YGtY2Z5npfXYRb2NZ+JxcZ3iVIm6sOf
         LuEw==
X-Gm-Message-State: AOJu0YzsKdqul2Gi2Wg67CBZ345zVvKB5OkPrbjrJmlGrzdSeHyNjvrN
	6xIBrqyZIfna37OWZOoR6v2+Yom+jKk=
X-Google-Smtp-Source: AGHT+IG4xiVypcezjRCOaZjdji0NmXKM+zHGowlAc7vBD2GNFzyrN1WKOQDQ3FTqTCVL+oc8kzJLXw==
X-Received: by 2002:ac2:4c18:0:b0:50e:7045:687 with SMTP id t24-20020ac24c18000000b0050e70450687mr62742lfq.77.1703258015258;
        Fri, 22 Dec 2023 07:13:35 -0800 (PST)
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
Subject: [PATCH v3 12/34] xen/riscv: introduce smp.h
Date: Fri, 22 Dec 2023 17:12:56 +0200
Message-ID: <7fd0c7bdc14ac2544a568e66387df21eee892523.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - drop cpu_is_offline() as it was moved to xen/smp.h.
 - add SPDX.
 - drop unnessary #ifdef.
 - fix "No new line"
 - update the commit message
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/smp.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/smp.h

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
new file mode 100644
index 0000000000..336db5906e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_SMP_H
+#define __ASM_RISCV_SMP_H
+
+#include <xen/cpumask.h>
+#include <xen/percpu.h>
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
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


