Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AEC77DEC9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584492.915339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoz-00043W-C0; Wed, 16 Aug 2023 10:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584492.915339; Wed, 16 Aug 2023 10:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoy-0003sy-Sy; Wed, 16 Aug 2023 10:32:12 +0000
Received: by outflank-mailman (input) for mailman id 584492;
 Wed, 16 Aug 2023 10:32:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdz-0003R9-IM
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:51 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93183e84-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:51 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31781e15a0cso5582003f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:51 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:50 -0700 (PDT)
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
X-Inumbo-ID: 93183e84-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181250; x=1692786050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SF7OVOTmigZhIs9vssENJwo3IkB2uaOOvzBSsICPv8I=;
        b=DpjGZYvtWP/YCm4a76tVKBr9FWGhXDpyIYU/VyUN5AglaNMFFRz4a0Inlk3M1ToFqc
         fTi7fnAJ8CYgIHIKTI1V3CvsK0Jr+lNbOy4JmSews1BK0Rj2NZmdhGCVygiVmPt3o9PA
         pPuf+pGsicZW4UlQzzkPScoROvoS9rjPQc3VC5UegRuhqg+PFXlpk1Sy6yvSC95iYCAm
         Rj8wp+xsH6GpKpyJdcvLo6QSHLDG1heg/gjTmlviG6WShhocAyUn7hUmYkcmEVwILJL7
         kvt+XYnRbdxXM8vnaQlJDzbSV9akeeHRZyoHVYOhpscMvZzK5yKtGbSubbFRh1BUtc/7
         bjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181250; x=1692786050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF7OVOTmigZhIs9vssENJwo3IkB2uaOOvzBSsICPv8I=;
        b=jQfHN13qUULtbun8BqQpYyvuyTASUPXAOLyyELfRYyNKQjEOd2N44/+m91IerP/XHV
         FXvb0CnnR28kc/aYXcIP7B/A8vF0ei19K+v5Ii9aNt0qRzcrTRrC5k3nMtvbw7kInEaR
         JVzhdwHTwjby1xvD/wZ1uQzXnrzoqbnF8f2aBNr+z3vJuSK5CZcvuQB91dDF8j9ztY/n
         SnVpi16vqdV7ymEgfEOAbFSIEYqON619Bh2cWBYuF6XsMfCjfl7vOQeBLYUS+mFhcOeG
         ZfCUw/NhMbWJhRwj3zIFcGKWzKjJShqQ3o6xCdUxW+LWo+r601eIkR8F+93j11OCavfm
         hd4A==
X-Gm-Message-State: AOJu0Yx6kMNYQCWxSIZrgGvZpXL68iA1DZPsS1gt+IRyIk8BgyIZcqER
	5kt5wwR+xs5BkQ+lqgdaX3BmhWjibTODiPKE
X-Google-Smtp-Source: AGHT+IGazQZMkft1T7Al+zJ2euxFGerpnbuXlc/IVgLoVXNwrKHnuAY9/2ApWpkWU/LPvpCyRbQG1A==
X-Received: by 2002:a5d:574a:0:b0:319:7c7d:8d9 with SMTP id q10-20020a5d574a000000b003197c7d08d9mr1001410wrw.42.1692181250355;
        Wed, 16 Aug 2023 03:20:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 43/57] xen/riscv: introduce asm/time.h
Date: Wed, 16 Aug 2023 13:19:56 +0300
Message-ID: <0b92dfba18dd8de27e2e65ab072c491ffd17cb5d.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/time.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/time.h

diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
new file mode 100644
index 0000000000..d0571cdf32
--- /dev/null
+++ b/xen/arch/riscv/include/asm/time.h
@@ -0,0 +1,20 @@
+#ifndef __ASM_RISCV_TIME_H__
+#define __ASM_RISCV_TIME_H__
+
+#include <xen/lib.h>
+#include <asm/csr.h>
+#include <asm/processor.h>
+
+struct vcpu;
+
+/* TODO: implement */
+static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG(); }
+
+typedef unsigned long cycles_t;
+
+static inline cycles_t get_cycles(void)
+{
+	return csr_read(CSR_TIME);
+}
+
+#endif /* __ASM_RISCV_TIME_H__ */
\ No newline at end of file
-- 
2.41.0


