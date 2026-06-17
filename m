Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yva4DYeCMmq81AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A229E698F2A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="BNMtO/Dh";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340093.1601173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHl-0003VH-2X; Wed, 17 Jun 2026 11:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340093.1601173; Wed, 17 Jun 2026 11:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHk-0003P1-9I; Wed, 17 Jun 2026 11:18:20 +0000
Received: by outflank-mailman (input) for mailman id 1340093;
 Wed, 17 Jun 2026 11:18:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHe-0002dY-PQ
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHe-000VKU-5G
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328263-e002-0a2a0a5209dd-0a2a4507bfe6-48
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:14 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328275-229c-0a2a45070019-d155802af1d5-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:14 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so55009965e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:14 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695093; x=1782299893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHK0+oJiotjmDU6k0UIB1KR9MCUa+178QTbLj29mVA8=;
        b=BNMtO/Dhc55Zz8m0U7AOLCwnW65ZVwhw93eQbGx8CR6+NuywQMTRd10KnrN4usPiQM
         kgbPZHBbF8Psl2E/yjhLl9Wah0TCvXQ/VilvIPXxaMNb0WDRZ5MUtdoDZJ/ByEj/l4oZ
         8JSQkV+zsH2ezX5ct+DTgQA7d/CVGY5wRZONiipLGPXL9fVvepW9aYfEfaDJZKt+cr/d
         57vbjT6C/+veZpdirHiPjfMw61t9mRd6GL78LAKt8kiXFQewNFz801cYv+Gl9ZMjP0pn
         /oYS5I7xgUrF0aSydeo22cJ8UkfiteGLysEZ4aM7Z2L+m+BIZEk5QUhBvDJWgUmR71Wn
         txnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695093; x=1782299893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bHK0+oJiotjmDU6k0UIB1KR9MCUa+178QTbLj29mVA8=;
        b=dJGkAkCiendlf4NDzFlp4DIQs8wx8pVgnLboLAPmgb+G/pP/1pp4C6YfUtNYoxnr+b
         IDV25fCXxwFx34LKikosKvNXYWXiy6GDv22vHwLqlhWfsjMzLv3kadVH/8bkp236cnpo
         hoxmL6QqXlU2eg3vzr1XPirNg8DD5sKvwCM2r5PjelDroCQHtCJJUTd6umlR3HG9lBUV
         /MHyOzLKJGc1F5Xs7PTp0t1LhcQ4jf/VwL6Utk6hpu70HA8EP/GZvCjcOyZUQT8WVuLx
         3C/hx0zP3tLZAWtVwu0H9qV2fYUt1WecYC35IcBgrhnZMk2Zvrn3WmZ4FyaTdYJ1nILI
         Vrmw==
X-Gm-Message-State: AOJu0Yy4A5D9daVJ7z7Vt/6lCp/E4sBosJonDLavdIh1QSgXsof60S36
	ypyb1ftst51jArXLEj0tkW9iULMf9TDJOz5sZgU87GsEjI3cNeKjbmobX+gGFQ==
X-Gm-Gg: Acq92OHdGopVzA5pKw78A6t5g2d5k6SAnRJTTFnA0qyn3ZOiTbIu+lQNqR+Q50bXCYi
	HXD10sMeMOVSX3x/jsl+c05x4yKsncYKyBnkNwbzLzKJU6z9SVkxrpBEND1ZS1XWn2xfHxGbSDR
	IgY2VP2PaiX4XlziZ/Gbxy0vh/XfQvogzkyDDu0tjA7Z8dDvT4t+abv0psJuTsSuhH6pfncpaFL
	Uuod7pkLYe2w4/SWRutO/HR+5DMRkffS2NBiPNoEMGBuYYcxmdXmasnVRL8spALODK21T7lvTti
	/kGKD+b2ZT8Z5rPpR+qxW+jemmGqGKubOv6aYTstk+6GBQl+cFi1g4+QSmbb6aG2yfPZYZnYThk
	FgShiaSK6wLXEkd0EOW126Jh/OOOlnyMsgJWS6J3O2FyAbDoj/qWkmbxDWS5FvForUZjmHyTwTn
	L+A1oKY7XxCjCGYv9EA9WbK9wi4+POsvy39Y2zX8hJRJwjWi5lFRt+O2TAvw==
X-Received: by 2002:a05:600c:19d3:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-492333a987dmr60965425e9.10.1781695093243;
        Wed, 17 Jun 2026 04:18:13 -0700 (PDT)
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
Subject: [PATCH v3 12/23] xen/riscv: introduce aia_init() and aia_usable()
Date: Wed, 17 Jun 2026 13:17:40 +0200
Message-ID: <ce37d11730c03b0cb7e19b27c055ecea487f22b7.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781695094-0A573C48-8B43B7F2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2968
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: A229E698F2A

aia_init() is going to contain all the logic related to AIA initialization.

At the moment, it only checks whether the SSAIA extension is available,
and if so, sets is_aia_usable (which  indicates more than just the
availability of the extension) to true; it also signifies that the necessary
components (to be introduced in follow-up patches) have been initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 31e08e3a1b65..f0ce27a96c1d 100644
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


