Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C57877DEB4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584431.915177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnl-00033c-DY; Wed, 16 Aug 2023 10:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584431.915177; Wed, 16 Aug 2023 10:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnl-0002uL-2s; Wed, 16 Aug 2023 10:30:57 +0000
Received: by outflank-mailman (input) for mailman id 584431;
 Wed, 16 Aug 2023 10:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe6-0003RA-2G
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c316f0-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:48 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fea0640d88so23016605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:48 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:47 -0700 (PDT)
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
X-Inumbo-ID: 91c316f0-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181248; x=1692786048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhVaJsx3fNfOUNl1yWvqQESfQK08auimEtxKys9/b3Y=;
        b=F0mCLXOjCd55gqe/q67GkQU9xB/piI6P744u1P+IppM2eavq5KKioxfsdD37bQM/lE
         mSIrekF4x8RMKWqKhGJ8pP0ClXdy53TyFCd0aHR7GoR9DifNopHiaRuBg3+o7vA9JEJA
         fiQU/1aD4P2X+nyHxfKgw6kfIVKEYYg13V3XNMZ6j5xw06v2h4aZcP6YvBvuMeuzhUgK
         E1xnQEz3SVNq5q1YzBUHhdhAUIA1W6AtRdfWv2xAiec9YHeVpfi/w+aylNcGKkREnFc7
         NjvDP9Jlonhp/2YC26KiwtZ/Z5sV2S/Y8qGA5sCKZ16X6o1BxUJPn+tMxsV5xGetzogO
         txMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181248; x=1692786048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhVaJsx3fNfOUNl1yWvqQESfQK08auimEtxKys9/b3Y=;
        b=DpFNLHqprWioAHeHSl1Y2i1TqSuKMJdudEwJn2C09hPkVMeex5YwHSv2lzEY9ozfy/
         79b9iDMTwd4YJc6AXW/r42IscztPGCw7CCYHNLq+4wx6PKz6hauIiEdGp+va4+Vae61V
         zBXhAfra5DJmZB+X590UAVzXgNtobcx9gALyAbueHDwIx94CQEOM/KP7ofZsFAA1n9S2
         PPGCkU/EsY62WO+HJXM1pf9xPHby+0LFz7/OzGLlyEAlIIXHJMRYFhLryZ8XVvAYflri
         UJL1Oo/mLufXij63AoM5m3vkK6Z69fp4coe10Eh9Nh6fD3vSCdSVU2q70fIl3+6vARMx
         skwA==
X-Gm-Message-State: AOJu0Yzy8htlqx02PrHAS7ECuMdZGgUPLpk8V1ORvwRRjh1lWjppfgl5
	ql9G2g/r+MiKJAvRlZZlhn1nHGfOn2Ojha3R
X-Google-Smtp-Source: AGHT+IEypaiMJLfzmYcUJiOQe1UM42LxjtcnuxB11o2Ulgr2121fbYp93v/G6OxinXQgHy2psd99wg==
X-Received: by 2002:a05:6000:1c9:b0:319:74b5:b67d with SMTP id t9-20020a05600001c900b0031974b5b67dmr1163452wrx.66.1692181248115;
        Wed, 16 Aug 2023 03:20:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 41/57] xen/riscv: introduce asm/regs.h
Date: Wed, 16 Aug 2023 13:19:53 +0300
Message-ID: <af19410cd289ac5962e40cf165ac23fa1214a89e.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/regs.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/regs.h

diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
new file mode 100644
index 0000000000..33ae759a3e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -0,0 +1,27 @@
+#ifndef __ARM_RISCV_REGS_H__
+#define __ARM_RISCV_REGS_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/lib.h>
+#include <asm/current.h>
+
+#define hyp_mode(r)     (0)
+
+static inline bool guest_mode(const struct cpu_user_regs *r)
+{
+    BUG();
+}
+
+#endif
+
+
+#endif /* __ARM_RISCV_REGS_H__ */
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


