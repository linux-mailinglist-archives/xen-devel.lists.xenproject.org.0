Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNY3I09QsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E32554AD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250396.1547953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aF-0004H8-DG; Tue, 10 Mar 2026 17:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250396.1547953; Tue, 10 Mar 2026 17:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aF-00049J-0s; Tue, 10 Mar 2026 17:09:27 +0000
Received: by outflank-mailman (input) for mailman id 1250396;
 Tue, 10 Mar 2026 17:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aD-0001Q4-7P
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e34d6159-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:24 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so23996415e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:24 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:23 -0700 (PDT)
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
X-Inumbo-ID: e34d6159-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162564; x=1773767364; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxAqjKoB8nUBBhDPx/zv6ewxjJzbCrTIbqMHHIHK+cg=;
        b=Ehou3/FICijR4b2STcMbbQHoyIuCgt5IClHYUlmXUtuc9ZWkk89Vi1gHiNRVMHACRF
         UPuNFuy3xWozX6NR7JRspEGGh2YTrLHRpVvwiKJKclNN4nJrcdkMrND6dq5PyuILsmBu
         6clqBW7+ZiETMV4HM22coVwOM5OcwuJWGZTbXgg2/D4aZM702KuvEV1gdcOvJS6KyGqk
         SdpSECJz7g45Ck8GRaBruPjkMTr4zeWt9MnE6lh/MO9Q73Xx3c2PJl9S1ZiUWDwr9IA7
         x3d+NFy9QTwEWBcNZsPECFkTVO5pNQDMHrMowvq8i2PT2WHW/8z0Lnyos1Fbp4SGy1Et
         WZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162564; x=1773767364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxAqjKoB8nUBBhDPx/zv6ewxjJzbCrTIbqMHHIHK+cg=;
        b=P+IJwQT7h+GDoAwzZwXtUtLRuqpp2Dvnyd0NC7pcJCysPskiG/OUvHQQoeoWrz6jwf
         swzXtPSTPAo/5ZBsAechG+Ib10c8QbABYVTuGOsi8IYyhFrpDwmOcMv/yjdzWLCMZ4DW
         iSo5Xjy2AQFrJHMiTLVNkG6GN5gte3lirVp1lgUDlCvdqKGVN3aPFqHm9S+9Epe2mZYG
         scR/6qcDb7xeV+jXPxvY55PmxLHfIdE4ZldgqDdm+GGgxvMC40EvZ98WGbbnokHjYkcD
         iQmq7Y19DN9mV//6NvQ0+GJPNn2oLCP27/X7/nexalP9wTmiF4v+ADQtHr7XpWIV8rX5
         cBfA==
X-Gm-Message-State: AOJu0Yz9QAfMqrm3EvGSHHg1Wvoz31yBcokwTGf4LYAD9OiTcnJ6fqK6
	sQpHRRAYCVFGqOSyAfXQRrAKbPusrp5Lf3fptuYaMxwuP6gs6B8lB4HBZSEpRaLf
X-Gm-Gg: ATEYQzytiRDAs2892gWiPFygQzTVqkEm4aWuxcSScA44nKakzJyeK2l7N5LDayETNHg
	79sKKdUH9oytk/+RvZTELIv8md1o/eV+c3t3usDE1Bw68pj9/rnZa8C39sFB2B08cNMXYQ1GE6d
	j8uJkFjPl+z6cH6bjiZyE0em80O+rekQxLSkUB9G6PIweeCPDD+C8pn5KMZT5dRBj6Xo2PralwW
	wG2DHkRLygk7LuTj4OK0NHOy1v74FUGyPK2lRhrgIs9Vt5UjgxcvhOR5Vy01B8p+TFGxPEf6kxs
	7ILSdpVUOXBXkMEFUChPrcJxp1N/JIipuXTNWBBY6CxwECUwp48thNmhF//5Wv3T4sRcF669aN8
	oIzByQRhGNDpaHmSKPU5Y7K+30t/T3eKJoFBcFhf7YFD34/zoBvEEAblVArBhxaCJnhHDAAwnlK
	xxTGdcNQure+zEqTFMSNNFjO4GM64P9rnPdBeVkVXJh5SZAhjNRjpE7vWIjAr2nIIw24hWpQ==
X-Received: by 2002:a05:600c:4fc3:b0:485:3692:e906 with SMTP id 5b1f17b1804b1-4853692eacemr162644025e9.13.1773162563586;
        Tue, 10 Mar 2026 10:09:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v1 12/27] xen/riscv: introduce aia_init() and aia_available()
Date: Tue, 10 Mar 2026 18:08:45 +0100
Message-ID: <74f15b1db86139b36b721ef9d12b998fe4f0f348.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 457E32554AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

aia_init() is going to contain all the stuff related to AIA initialization.
At the moment, it is just Check if SSAIA extension is available and if yes
set is_aia_available to true.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/aia.c             | 25 +++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h | 10 ++++++++++
 xen/arch/riscv/intc.c            |  3 +++
 4 files changed, 39 insertions(+)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index fb04cc5a56b2..d772b42386c0 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-y += aia.o
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += dom0less-build.o
diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
new file mode 100644
index 000000000000..5e3f190e8e2c
--- /dev/null
+++ b/xen/arch/riscv/aia.c
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/types.h>
+
+#include <asm/cpufeature.h>
+
+static bool __ro_after_init is_aia_available;
+
+bool aia_available(void)
+{
+    return is_aia_available;
+}
+
+int __init aia_init(void)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return -ENODEV;
+
+    is_aia_available = true;
+
+    return 0;
+}
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
new file mode 100644
index 000000000000..039607faf685
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM__RISCV__AIA_H
+#define ASM__RISCV__AIA_H
+
+bool aia_available(void);
+
+int aia_init(void);
+
+#endif /* ASM__RISCV__ACPI_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index a6f8c30f4771..c9f12651fda1 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -8,6 +8,7 @@
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 
+#include <asm/aia.h>
 #include <asm/intc.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
@@ -27,6 +28,8 @@ void __init intc_preinit(void)
 
 void __init intc_init(void)
 {
+    aia_init();
+
     if ( intc_hw_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
 }
-- 
2.53.0


