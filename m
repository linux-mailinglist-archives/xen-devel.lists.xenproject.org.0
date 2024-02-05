Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251C3849E3D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676207.1052272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xv-00025F-OY; Mon, 05 Feb 2024 15:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676207.1052272; Mon, 05 Feb 2024 15:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xv-0001wZ-BP; Mon, 05 Feb 2024 15:32:59 +0000
Received: by outflank-mailman (input) for mailman id 676207;
 Mon, 05 Feb 2024 15:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xr-0007I6-V7
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:55 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d440b2ba-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:53 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51147d0abd1so1854784e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:51 -0800 (PST)
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
X-Inumbo-ID: d440b2ba-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147173; x=1707751973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPYTkHhSwzrOZRp3wpcoqlNmpQs+KVtpWBOtoJhORF4=;
        b=N6fQ3arj9uzaWfCGCZg9oxvOC+ecricw435eFs+3HwhzgFXcBAbXGd8qWURFqt/WHH
         AyZOVFesv/DX5ipZluk4Pol7jJdRHrK2uD31YdYuF2eCK7OteaJmnBV6LXYO06wdXudo
         QASlFY1ObNbSqsth3IpaEwyW4p/OBh6DV77xU9yY9p/FrciLr19orUjzypMvqG8UmLUn
         DeP+bzdB0xhpB+U9X6LDaaQrgyOwb4ItPIPblkeLW9PZwrLU4Foem/dnEBVx4JPPYUp1
         GtjZAFJhgDV6lCh6VeVHrX9IoXqiN6WWzBVLX+VjsQwwdOmUteY1BDyId3o3Ea/TrUAO
         1+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147173; x=1707751973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPYTkHhSwzrOZRp3wpcoqlNmpQs+KVtpWBOtoJhORF4=;
        b=oyV+d+CmVPIR1YmDAPbsdswPapOBtJR58O2KPoMA3cjAWssC3MzseeWDGvWsbd4e1t
         4GOWowixQXftNY3kp0B+xVxWy4HobZ2VYzOKPs9YszcwaHuu6JD2dElX6w0OIYrn9Ufe
         5RUseyuTt9XCrrnDzFbH/hndLb/6uP/IBfioHCBnRPk8GQMPJbf57EwNxcVOYQ8Byhab
         Y0J061FOUA6nbHJorgTyxC57026lY9GXXWNnZCqmKNvEexFH4YhAoXONHbxuc2Tei7OI
         17NJdbADlz1qTGrBJ0ao8tJFJ342qwHxhj0+HDmSCHSFH5Z7rftEU4K+zx3zzwvnK93J
         4EjA==
X-Gm-Message-State: AOJu0YzGaKjmP//3Ql009M2OG6GDBYbwzSZ+EjHXsyUVT+BkOm/wrzhb
	nKOXykoRCYRqLeVP6J+nHkQpgdvemn+AVQAoqCU27PA/TG7OEdbJNpumr1BR
X-Google-Smtp-Source: AGHT+IGFYaDPh3Bv0AIiC3KgkB0bgdwRX0YdJQs0WkC9q94Zv4C6VfrE0rJG5h6jmqfIamIONInRog==
X-Received: by 2002:ac2:5f5c:0:b0:511:4cd7:7181 with SMTP id 28-20020ac25f5c000000b005114cd77181mr2387902lfz.62.1707147172499;
        Mon, 05 Feb 2024 07:32:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWcT4n+QS3hhrZlKic82jv8g/SG5vZmY9sJlP9nnVMuAUN3iu1r0Orngmm5IcQslrCiFY9o1cG3mXeYojZQfkIhSksNcZgI+tjn9iHyvMgSsYKX2lo98E/breUMlpZaMEpjiRgdUjMnH9tyDtsu/VLkf0jgMrOegLN9zUXa4D2zTWarEY0OqpPORTm/XYObE/tlj78Im+3iR3JIMHR3UmPRpQEV+9VJVs5ggw5g2ISqoy0fujuGFye9RMpHuXclW2ZD4PQRdN6cg+VIjFhjBtkwel9zRauTfTeTpH1RBIzAA/QXGE9/rllhQOnkYoTP8hDh0wNx
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
Subject: [PATCH v4 11/30] xen/riscv: introduce smp.h
Date: Mon,  5 Feb 2024 16:32:18 +0100
Message-ID: <4d0a8aba3ec17fa428f8d18f0008f863481b1f67.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - update the V3 changes ( remove that cpu_is_offline() was droped and instead of message
   used subject )
 - drop cpu_is_offline() as it was moved to xen/smp.h.
---
Changes in V3:
 - add SPDX.
 - drop unnessary #ifdef.
 - fix "No new line"
 - update the commit subject
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/smp.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/smp.h

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
new file mode 100644
index 0000000000..b1ea91b1eb
--- /dev/null
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -0,0 +1,26 @@
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


