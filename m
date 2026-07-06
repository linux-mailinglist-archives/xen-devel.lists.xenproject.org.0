Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oiqrE7vQS2orawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCC712EE2
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G5BuSYH2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355515.1610393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliU-000236-Rn; Mon, 06 Jul 2026 15:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355515.1610393; Mon, 06 Jul 2026 15:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliU-0001uu-D0; Mon, 06 Jul 2026 15:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1355515;
 Mon, 06 Jul 2026 15:58:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliS-0001WN-6d
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliR-003COz-JC
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09f-2eae-0a2a0a5409dd-0a2a450ce8e8-28
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:39 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0af-f399-0a2a450c0019-d1558030bcbc-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:39 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so22318155e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:39 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353519; x=1783958319; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw1hrTkQ2ATB1SLL0iu4tNbNK40JrBmaLHXXypeFp0c=;
        b=G5BuSYH2B8KrqFyPfTYjy63tfVs3pGADWoimSOdjh3AevIvD8e6lhtuBZYuCloIqrf
         uDHIQDacN9OXPSxwZvC1N3v5UrjE+wAPY7uIQBcCS3jm4+KKAZ9sB9Qhn9X4GaqTI97t
         TaDAOnkC5aPU6k7+5lzOCfypPFjui0fSx8Ch4HpRAFFNY9rRUBduxmETzFN9/6fBIzhI
         P/ojgGXwdZIYvDBbOHSZbQuGHgAKbwRUzq24/WxRpP1EAHTNdHnnJ/CCfMNlKcYAEQGN
         C7lxK9hPQ6nghICaQwebfmFcExA4/5vLxLKnpt+lVC64w3E5XPlUwh2uAhn9AkUUA/aU
         CPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353519; x=1783958319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bw1hrTkQ2ATB1SLL0iu4tNbNK40JrBmaLHXXypeFp0c=;
        b=cdfI12epNHLYRusUlle/NU+vzMU4NG+3btMwkqsFIrTA3Tm+sToPFikcHbRlYNhmJb
         CHH3jBshvcRhhEMNXErJvIs2AnUYUdpMKuaQRymB5OKOIErqaGpXYdDWCtZ406bVS5JE
         uv1wXkQ7ciFwAeZjnyCdASo4GJdMBZog3xP31mtfda1cVW/B6OS9ecp8nzDCF2surNsv
         QB6MKoRKnPAbfJSrYpUuRvc3bL/KMS+kpmAV92rpZ1krCQ/dJ/y4VEk/7OO7++qQD/tH
         RDNtiV6bDApyDioAu+Hp+VjRuedTXG340yfFOsrETQUZNOs+27OnaQrr7guFzhFIRooH
         FCLQ==
X-Gm-Message-State: AOJu0Yx9Tzs1jJ8ptDXuILADxBTeNpaXTiBQbjFS/NpHNHM/C1UF9wJf
	0kjJyDwflFPUvvTwIzGrLgP3dXxABhWsfWWt0Yzw0agI0IXiy0vn2bp05il79A==
X-Gm-Gg: AfdE7cmp2x6UgYnfG7R7ECb5+a1cOIsiEPkqE3HgsS2Xmnp2F/5/dq5m8793YB/mm84
	WMFEEm2AnBFDzu2/nvvdX0qdVP0jqZ6MLJsnLDdxvCpFhuyNwgikXHB7CQOS+eWYKnft9CuG96P
	LqWpnoRcowIO5/O/FSZfsXTHMLrHtTrBboJD1yhW2ds9kGAgGXQHyb1PWOjFRnVx3TETqxDjNGo
	o/IBSUSxSjDd334wtktbqyi4jPMsRteDJWioTR0Xg/443EEIfypwjLw4ZC9cXxguC/giOFjZUv5
	vnH59P7fJiNZm9KndxeO5couzAvokf7UngbSs3q7ekTW1AJsMhpp0mZcwyxArczAw650NEdcLs3
	T9NZRzPR7bF+TgjTBE/ripR4M+JMua1xTUPHILV74QlPOG2O0an1gKiLE8U6XLf4lrzKpLufRbR
	YlBZu7HyoP4ncItwom6F1UuoVL3KpXGzheuFWsS2buvU66b9w/TTlwOSyiG2ZNP9egfvTF
X-Received: by 2002:a05:600c:6385:b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-493df4af8d1mr4920195e9.9.1783353518979;
        Mon, 06 Jul 2026 08:58:38 -0700 (PDT)
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
Subject: [PATCH v5 15/26] xen/riscv: introduce aia_init() and aia_usable()
Date: Mon,  6 Jul 2026 17:57:56 +0200
Message-ID: <c19523e3ea4dda45205202c7a90ae272103526af.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783353519-0D727D51-0199B8CA/10/73395122804
X-purgate-type: spam
X-purgate-size: 3183
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: EDCCC712EE2

aia_init() is going to contain all the logic related to AIA initialization.

At the moment, it only checks whether the SSAIA extension is available,
and if so, sets is_aia_usable (which  indicates more than just the
availability of the extension) to true; it also signifies that the necessary
components (to be introduced in follow-up patches) have been initialized.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Update the guards in asm/aia.h according to CODING_STYLE:
   s/ASM__RISCV__AIA_H/RISCV_AIA_H.
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
index 000000000000..aaa4bf91fc75
--- /dev/null
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef RISCV_AIA_H
+#define RISCV_AIA_H
+
+bool aia_usable(void);
+
+void aia_init(void);
+
+#endif /* RISCV_AIA_H */
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


