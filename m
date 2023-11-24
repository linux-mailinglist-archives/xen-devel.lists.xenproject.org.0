Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308777F71AE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640440.998705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbI-0007Sg-Gn; Fri, 24 Nov 2023 10:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640440.998705; Fri, 24 Nov 2023 10:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbI-0007QA-Bs; Fri, 24 Nov 2023 10:39:56 +0000
Received: by outflank-mailman (input) for mailman id 640440;
 Fri, 24 Nov 2023 10:39:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTG-0006hx-AF
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:38 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4207aef-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:34 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a002562bd8bso338542166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:34 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:33 -0800 (PST)
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
X-Inumbo-ID: a4207aef-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821893; x=1701426693; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1NXcb7jdaaZuI6SEewIcUNgTZv6aenL5cTsYiy8AuM=;
        b=S51rFyc9h/8ZqbooOO74S2uhqmAeWfWtuXFMDqdDGEhxJ7yjE2/y3GlrCLAGe9CY3J
         4dMjh6CfCIBeIa0FFkW4QR9xnfzXAqbjbLM4qi1/3Po/1pq1nbn5z3VPkLJ4vSbISw5g
         9VAP52B4f4MIVquBmP8lqtFi8X+PO//oEQbib1mvxfXJW0rT6iuOZP3s7D51N2BD3El3
         MDt7aes1Qs6eiUBF0XfSlKxHuHph9209Nu8AKr/qY1KSZnAMoUjdTYQ62bLrUcrhJFZa
         HMBR1HXS8tXQqcK4lsEKy9ZLWEPEc1PY3+0u7t9QRwzyi6KGf5wSB1cnxtauvcy8W3Fc
         V7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821893; x=1701426693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1NXcb7jdaaZuI6SEewIcUNgTZv6aenL5cTsYiy8AuM=;
        b=kco5ZzssmCFKPcGgMHk7qzpsf1G9KmcYdX/XmZHbmnvdhKLkwbJuzq3RszResbb7PE
         Vycn28d0L57Wqq8JQCtoz9f6YracVJAmg23avF71lXJTO5NraCc5Msf/yvnjABHRXCwC
         /t5pppNy+p/GVggMovIMvjH/A9ozkmYQjiSekubhqzlcoVs45XSoEeglgo9sM0TRB34d
         ricsA2JorVvag9Q21RzELr1XvN5yetlMwISKkMUElkIHYDNjEemp7dWO3RRwzZ6iRxyB
         vBw0Rbgyf5598w8OzERr8DEvDglaehaLbk3ME/gBDJ7USh83upbH6YlCQvRVNpDAau7c
         KNHA==
X-Gm-Message-State: AOJu0Yzvvl5i1w5FFY71siQZf8WYeZDfXTxaZdzE1jC238iHEdEKHeEl
	JQ0bLB7vrLRafmUGVfNmlgNrOJsbnAtKDg==
X-Google-Smtp-Source: AGHT+IEpnpSVM6zekDmA0E7mtOm2rvIi+vPqePZUXFRfPofCeJaNKbtrbTJxjumOjWTHEvf70cgIxg==
X-Received: by 2002:a17:906:2088:b0:9ef:b466:abe0 with SMTP id 8-20020a170906208800b009efb466abe0mr1873955ejq.8.1700821893680;
        Fri, 24 Nov 2023 02:31:33 -0800 (PST)
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
Subject: [PATCH v2 23/39] xen/riscv: introduce asm/guest_access.h
Date: Fri, 24 Nov 2023 12:30:43 +0200
Message-ID: <7dda759b846003fcb453f1118cefbfd2eeb804d7.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - change xen/mm.h to xen/types.h
---
 xen/arch/riscv/include/asm/guest_access.h | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest_access.h

diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
new file mode 100644
index 0000000000..122ecdc048
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -0,0 +1,29 @@
+#ifndef __ASM_RISCV_GUEST_ACCESS_H__
+#define __ASM_RISCV_GUEST_ACCESS_H__
+
+#include <xen/types.h>
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
+unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
+
+#define __raw_copy_to_guest raw_copy_to_guest
+#define __raw_copy_from_guest raw_copy_from_guest
+
+#define guest_handle_okay(hnd, nr) (1)
+#define guest_handle_subrange_okay(hnd, first, last) (1)
+
+struct domain;
+unsigned long copy_to_guest_phys(struct domain *d,
+                                 paddr_t gpa,
+                                 void *buf,
+                                 unsigned int len);
+
+#endif /* __ASM_RISCV_GUEST_ACCESS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.42.0


