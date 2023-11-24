Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731027F716D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640376.998505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT3-0001IJ-L3; Fri, 24 Nov 2023 10:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640376.998505; Fri, 24 Nov 2023 10:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT3-0001BW-E9; Fri, 24 Nov 2023 10:31:25 +0000
Received: by outflank-mailman (input) for mailman id 640376;
 Fri, 24 Nov 2023 10:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT0-0006hy-O8
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:22 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c8194c7-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:22 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a04196fc957so253598266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:22 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:20 -0800 (PST)
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
X-Inumbo-ID: 9c8194c7-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821881; x=1701426681; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm4dkCrJBhUIryTpKvo62q5PASNVGTgK0wPdYUeznR0=;
        b=jK/tbzkMtwhfr0Mr2yk9q5RiGWbVuXlrYvGaLtjvIgJBOZgpCWehlNiP2yQPMaR+/g
         eq1LerbGhEU+jlghA0LQvm/sujmEuPuF6V32U4q2jOS5XIDVllRw/91Ny5XlTRQQ9hVv
         XC6VmibXYW/GwMJD3YLURQcG4D1QlFbuk8u/4Y3yNOYOoIxt+8hjv1kUjIXj/BHKdJhO
         Xe04sn6rgZty87p8yrHKrZyaSpitd7ujgKVzSLzMgvzdh48qwcAk/ewRoaX62D+G/u7J
         iPxjvJ2EyRcR0V0OACtQpB9hvLdlPr62hUL5mww+8fA9nHV1pmlr1X2tgrwsUz9P6gFw
         JpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821881; x=1701426681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nm4dkCrJBhUIryTpKvo62q5PASNVGTgK0wPdYUeznR0=;
        b=ULUhuDZ2S5nrwrfH0D4u3Tt+L6G2hfi1XpO9ItOaEUkBVOecCd8rAcy/7ITHiNiRGT
         LYIdWAU3tALsl89VDTb/ZG2qzOFl5VpLUSO/QOgTZcrhzxwk44OAQGeZW9cQq+rmysyd
         DjzCB/+sNOqN8h3TtXx2fO6z/6wdv+Zq65szlHzGl1Xr9ywQqu0Bqu0SWJ4TjdHvVqXi
         WSY7uFhFGbR98/zc4SoVJEoe25UE80Jj2a/PiYQVUc70OQ6nXwCaLSIIKIIBZVjA8drN
         +s3vdgtf1SY+e88lQXHOHa/Q6nKScVHxbe5szTyJt8hXwhKU/XJivmsFGAFH8DZhGNcr
         smiA==
X-Gm-Message-State: AOJu0Yylh+RzCYhaiD8jvz1G8UkqEiyPM/DfQxcna7YeyqGWap6o3C41
	VQg5C21yXUIR4mSLRy20wL99g11VaFwRcA==
X-Google-Smtp-Source: AGHT+IEg+E+nK+Hd8xDeE38CWZul9DwP/NoUGjt+HpbA7yFZrfk3DB+2tQiPlG6eN1YR98BG3PfiuA==
X-Received: by 2002:a17:906:5302:b0:a00:231a:9520 with SMTP id h2-20020a170906530200b00a00231a9520mr1380039ejo.5.1700821881208;
        Fri, 24 Nov 2023 02:31:21 -0800 (PST)
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
Subject: [PATCH v2 11/39] xen/riscv: introduce asm/nospec.h
Date: Fri, 24 Nov 2023 12:30:31 +0200
Message-ID: <aa2ff1df494f82f7c045f913371d3b9d04962a5e.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/nospec.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/nospec.h

diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
new file mode 100644
index 0000000000..55087fa831
--- /dev/null
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
+
+#ifndef _ASM_RISCV_NOSPEC_H
+#define _ASM_RISCV_NOSPEC_H
+
+static inline bool evaluate_nospec(bool condition)
+{
+    return condition;
+}
+
+static inline void block_speculation(void)
+{
+}
+
+#endif /* _ASM_RISCV_NOSPEC_H */
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
2.42.0


