Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCY5NuSL5mmmyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D357A433B2C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286470.1567536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBJ-00027D-0r; Mon, 20 Apr 2026 20:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286470.1567536; Mon, 20 Apr 2026 20:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBI-00022Z-QX; Mon, 20 Apr 2026 20:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1286470;
 Mon, 20 Apr 2026 19:50:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEudv-0006GM-Os
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEudv-00EW0U-5e
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6835b-e002-0a2a0a5209dd-0a2a45099984-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:51 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6839a-2497-0a2a45090019-22cac1c5af54-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:51 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:49 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=BUWViz1HX1BBqALyZx+7NkZJniZ89w3OKNPE8ISNw+sIMhTi8LW/OkdsUfen+redgW4BaE1sPJPuSclmSl14wSKVVqUPCUU8AI9UN4wKdJmWsXT7h5W/Aq7reLYLxdlotCQ3QmdRxskqppq7/q718B6v/7s/9SeMOo9J3H7FiiBzbdfdz9rTdqCzzEeTnAiCMzRtJiqk5/m7Yrv6+JlVCa924NwRw93Gq2JLW1eYSaXViKJC17bZtup4P/Yjd1ZslZL5RItn3ekihAk6LiqCIQmQu91pUyOcs/ht6PgYL3m3VECQ2ttJlLQLGsW4uYodXPAuEfG31iik4cC3EqnN/Q==; s=purelymail1; d=purelymail.com; v=1; bh=FUGBLopHINZhG1l1iHXBX4rky0Br+fp5HvqRUDdfpzM=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Aqib Javaid <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 06/43] arm/altp2m: Add template arch-specific altp2m.c/altp2m.h
Date: Mon, 20 Apr 2026 15:50:05 -0400
Message-Id: <20260420195042.207624-7-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-bad1c0/1776714651-92D77A53-40B251C1/0/0
X-purgate-type: clean
X-purgate-size: 3304
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.893];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D357A433B2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

Similarly to the earlier common altp2m.c/altp2m.h commit, this commit adds
a template altp2m.c and altp2m.h file for ARM to be added to in later
commits.  Creating a commit with just the template file additions makes it
easier to reorder later commits which add to these files.

This commit can be squashed into the first commit which actually adds
something to altp2m.c/altp2m.h for the actual submission if that would be
preferred.

This is commit 6/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/Makefile             |  1 +
 xen/arch/arm/altp2m.c             | 16 +++++++++++++
 xen/arch/arm/include/asm/Makefile |  1 -
 xen/arch/arm/include/asm/altp2m.h | 37 +++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/altp2m.c
 create mode 100644 xen/arch/arm/include/asm/altp2m.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 69200b27280d..d995d4ff7aa1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
 obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
+obj-$(CONFIG_ALTP2M) +=3D altp2m.o
 obj-y +=3D cpuerrata.o
 obj-y +=3D cpufeature.o
 obj-y +=3D decode.o
diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
new file mode 100644
index 000000000000..2bd1ff4df223
--- /dev/null
+++ b/xen/arch/arm/altp2m.c
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * altp2m.c: Alternate p2m
+ *
+ * Copyright (c) 2016 Sergej Proskurin <proskurin@sec.in.tum.de>
+ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/M=
akefile
index 4565baca6a4d..fef4dd42b6cb 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-generic-y +=3D altp2m.h
 generic-y +=3D device.h
 generic-y +=3D hardirq.h
 generic-y +=3D iocap.h
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
new file mode 100644
index 000000000000..ca836bae7330
--- /dev/null
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * altp2m.h: Alternate p2m
+ *
+ * Copyright (c) 2014, Intel Corporation.
+ * Copyright (c) 2016, Sergej Proskurin <proskurin@sec.in.tum.de>.
+ */
+
+#ifndef __ASM_ARM_ALTP2M_H
+#define __ASM_ARM_ALTP2M_H
+
+#include <xen/sched.h>
+
+static inline bool altp2m_supported(void)
+{
+    /* Not implemented yet */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented yet */
+    BUG();
+    return 0;
+}
+
+#endif /* __ASM_ARM_ALTP2M_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.34.1


