Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5EA6BD288
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510650.788744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcola-0007Jb-9Y; Thu, 16 Mar 2023 14:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510650.788744; Thu, 16 Mar 2023 14:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcola-0007H1-2d; Thu, 16 Mar 2023 14:39:42 +0000
Received: by outflank-mailman (input) for mailman id 510650;
 Thu, 16 Mar 2023 14:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcolY-0006hg-6Q
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:40 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6113a9ab-c408-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 15:39:38 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id z21so8615593edb.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:38 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:37 -0700 (PDT)
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
X-Inumbo-ID: 6113a9ab-c408-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uotKGM8ahFKgf3MT0pEjvm7HDKJnl+RTbHm3nOfbQEM=;
        b=HSf9ESpnA/hZJ4sxBlL27WhTheR6Ct9DuyI+EoDvGqQ1XMVLg2MTokt1W2ys2HMH/m
         shZHveECFFwSIlwpmV2Ojk+52zEKf579YGJVqCSjtljsBd15B0NEz/9ikBkBXFEM2sJl
         asRzT266OAMg6Gw60MzBNBqaU/ZsXEKOehIthCkfMYY3g86MwmsMyTtAjb3y1W4p3meD
         h1MiBVB3cmXsaL5jwAwv807c1+ZDfPGb5NUZX8rN9RvCxtkYpaKoz5S5PosutMj53vNR
         CMPjhXF1EcQxUYQ2eHGY0aVl4oeLRpxgjX/XHG4w9YOMW1sCFUD/UW2z7H3hc9QDlm0f
         X4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uotKGM8ahFKgf3MT0pEjvm7HDKJnl+RTbHm3nOfbQEM=;
        b=z2ChNZEYkBlJVkS83Vu68V0smpvTSNm45yJmzLTk2LA9Urk3eOX0jeTyPzaYfk/LJt
         XZ+WWXLC13qkc4SYK0tdLvYAk44ELy44rT13JVOaGJDvQWFO92GRe66hTZajKHYXqNBF
         TZKGbLrohibFgHBVmLAt4JpzVbCkfMtwd7F0wWi9FRBTq8lskJHaQd9lCSl2ikLTrcKi
         Rt3HAiIiMpQ0Ud7LfW8jtWim03SNMcQh/0KCtBneMrQumjvGMw5i0CiBLoPDf/GjvdD9
         G8Zndolzf3nZ40mNYFNQK2VDbBiCjH025nvVWLYakQNYp9aIezss/+mfb1sOF9VXigf4
         orKA==
X-Gm-Message-State: AO0yUKX438lc/ImYjtCYK1vX9figZ3Y+dXHOdy6oQJuRwtPqqgJEyiZ2
	GRRXaTOBgM0pE6ILd4cT75opRXyGWkdWhg==
X-Google-Smtp-Source: AK7set8Ru4rQtVOEgpLtDmbBvbuwUibac+vfcTcMMNJ7ATqF7bTay3xanj6Hf6gEvZuRhmnQg0a5pA==
X-Received: by 2002:a17:906:d0cc:b0:84d:3403:f4f2 with SMTP id bq12-20020a170906d0cc00b0084d3403f4f2mr10321280ejb.62.1678977578043;
        Thu, 16 Mar 2023 07:39:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 3/7] xen/riscv: introduce dummy <asm/bug.h>
Date: Thu, 16 Mar 2023 16:39:25 +0200
Message-Id: <82aa35ce27ca11076bbafbb565e9c85e1ce7624d.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678976127.git.oleksii.kurochko@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<xen/lib.h> will be used in the patch "xen/riscv: introduce
decode_cause() stuff" and requires <asm/bug.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.39.2


