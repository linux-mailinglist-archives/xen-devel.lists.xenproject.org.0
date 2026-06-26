Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ra1eCwmfPmoRJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0186CEA2F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ALaYxdSd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346285.1604829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lj-00034t-9r; Fri, 26 Jun 2026 15:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346285.1604829; Fri, 26 Jun 2026 15:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8li-00030L-I7; Fri, 26 Jun 2026 15:47:02 +0000
Received: by outflank-mailman (input) for mailman id 1346285;
 Fri, 26 Jun 2026 15:47:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lg-0002aG-5E
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lf-004aSr-IV
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef2-bab6-0a2a0a5309dd-0a2a450adae0-16
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:59 +0200
Received: from [209.85.208.180] (helo=mail-lj1-f180.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef3-e40e-0a2a450a0019-d155d0b4edad-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:59 +0200
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3996c9eeebeso9996361fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:59 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:58 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488819; x=1783093619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmaOim7BZjYCiN1zoPRNC/AZ0NqzABJMaudwwqKrFuA=;
        b=ALaYxdSd6SwoGzdXZr3j6TCxhDRwLnoqTpScFeE6I08CRDNS4mLWfySBMuukmd4qEq
         JuNIFBVDmHpDk1IQ4Rpuc4WlO1QptfPpIe7jb2e0xBr9jYCchWASp+iD16bPjMuxIf99
         zG2QzilsEoMM1uFVt7wBu+b05HKkDKM67blCm71UEI2oRVlwA0TL6gb5XN7W4lpA9nUd
         85aBGedR2unY5llaKxamb/L36IGu5Uc+3/a40Gt0yK3mxMfGivFCwOmxrm6Ny2jyZbTT
         2zct+wEIrtySjKwSRxWZtoEkYDNzXyExyJIySFpDudanjgIftGrXH4Ur5hJ20Lzi4qVw
         I2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488819; x=1783093619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmaOim7BZjYCiN1zoPRNC/AZ0NqzABJMaudwwqKrFuA=;
        b=SGoV1xkm/yi3LEm/W3o1C9q8paigdtc8+X8TafdsdGU6SfJY1FOe37QEVSMM1uzJRP
         XhcqhhZz4OB8Sb5xEtEK7ujDuamw2RVA0btpN0hg7TY7Fv+kcuwPtIwPOKMEtLfwp9S3
         LTTEGRiAeiZ9ONBS2DisUv0hav6AAP3SkKw4BUzG48RYZJZsuvtzX2hIM9OPYv85kV/v
         1bihsoRX14aFyAzvOUScUKiSuBUT7jaeiviElE0D8/b65QLkngGYGN8QqlMiOLcqcOwI
         NEsYyxhonM+CYVNKCrwq3x4vuhwjWPSUg4LywvfG96peFJr0No2nz3yJTkJZHshy+hAx
         IVqA==
X-Gm-Message-State: AOJu0YyUDnsCZPydr94NOfK1HwNjZTX6OULJymiDZ+mjj84K8FR89QDh
	ypS6n41BI4P9YD5L2hKpSEgZodFn7AmtMyfwP8+4q+oVkjz+PgmIaqiH9/O2Ow==
X-Gm-Gg: AfdE7ck3nkkYUdibqnGM9Kf91qegNtaRUVExbLK2M3Jpt0vH94VYgH4dHjHxxy8zuQC
	k5ynjcXE3qPMAiNkf9sbOmvO19Y22qGqnD3jviRkBX1+QcT0YmVyzmb/CWxAzYfN0u+JE2pcpF4
	MGZX5jVbjgFNDwmPfXeP2S8Rnv2o8hhM0sBzCdndHc43RJPpq5ru59zzuGXmg/RMxWgz9NkDrJF
	kN/7oqgXhHOTVfQcTiv0tsf3rvA3cRjUEn2c/oK7Snj2c82LhX4ZNd1C0PZngRuXpEGdQwSDYyb
	+9TJx6tUaMjUcF0p9kNXSHJw5NXr4v1BdvlpF3KPCI/DE+U5+nFjLHVFrw0djc+3oDhWtbug88r
	/GTsltUkk7BeNuiMXxybgcBfPQzC41zfc1LYtK/ckXOBrpU6F1gu1UoE0Hf0bdPbhImmm/QFwgP
	J/rQJ7mMLSJ91j6AhwprpfpYNzJhCqGdBhF91wbL1xW3/4dFVvppsAsciJbA==
X-Received: by 2002:a05:6512:64ed:b0:5ad:5b38:2690 with SMTP id 2adb3069b0e04-5aea1f60e9cmr2054615e87.42.1782488818729;
        Fri, 26 Jun 2026 08:46:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 14/25] xen/riscv: introduce aia_init() and aia_usable()
Date: Fri, 26 Jun 2026 17:46:23 +0200
Message-ID: <709f4f1d9d593501819fa3d579b2cef0a108b48e.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782488819-D5B24DDE-689BC773/10/73395122804
X-purgate-type: spam
X-purgate-size: 3082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF0186CEA2F

aia_init() is going to contain all the logic related to AIA initialization.

At the moment, it only checks whether the SSAIA extension is available,
and if so, sets is_aia_usable (which  indicates more than just the
availability of the extension) to true; it also signifies that the necessary
components (to be introduced in follow-up patches) have been initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - s/is_aia_usable/_aia_usable to drop the is_ prefix while avoiding
   conflict with the aia_usable() function name.
---
Changes in v2:
 - s/is_aia_available/is_aia_usable.
 - Drop return value for aia_init().
 - s/aia_available()/aia_usable().
---
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/aia.c             | 23 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h | 10 ++++++++++
 xen/arch/riscv/intc.c            |  3 +++
 4 files changed, 37 insertions(+)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index fd5e499eb4b9..9df8b72b5494 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-y += aia.o
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
new file mode 100644
index 000000000000..e31c9c2d24b6
--- /dev/null
+++ b/xen/arch/riscv/aia.c
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/types.h>
+
+#include <asm/cpufeature.h>
+
+static bool __ro_after_init _aia_usable;
+
+bool aia_usable(void)
+{
+    return _aia_usable;
+}
+
+void __init aia_init(void)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return;
+
+    _aia_usable = true;
+}
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
new file mode 100644
index 000000000000..ca42c3086126
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM__RISCV__AIA_H
+#define ASM__RISCV__AIA_H
+
+bool aia_usable(void);
+
+void aia_init(void);
+
+#endif /* ASM__RISCV__ACPI_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index e63da5e22efc..2864a896b677 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -9,6 +9,7 @@
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 
+#include <asm/aia.h>
 #include <asm/intc.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
@@ -33,6 +34,8 @@ void __init intc_init(void)
 {
     ASSERT(intc_hw_init_ops && intc_hw_init_ops->init);
 
+    aia_init();
+
     if ( intc_hw_init_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
 }
-- 
2.54.0


