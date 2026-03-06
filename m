Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIaqLPUBq2msZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF66224F95
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247976.1546358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7Z-0004C5-VS; Fri, 06 Mar 2026 16:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247976.1546358; Fri, 06 Mar 2026 16:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7Z-00048W-RU; Fri, 06 Mar 2026 16:33:49 +0000
Received: by outflank-mailman (input) for mailman id 1247976;
 Fri, 06 Mar 2026 16:33:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7X-00030j-P4
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:47 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f8e7791-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:47 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso5226444f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:46 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:45 -0800 (PST)
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
X-Inumbo-ID: 3f8e7791-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814826; x=1773419626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8+NHmV9aIJTBlEGWlUzdypWZU3A1Zs5nOLXPSleeHM=;
        b=Qhw2PZU2IC64OpoScHVRrZSlZ6ttFMUGpheJjgUx/3f1BCboaFvG8E7t4isPSIWN8W
         5vo/5H+trb1ekJqUP//y71RC9dWS3+2VWCUnARr74G6C2Xl2oh9cAdelZQdiBZSQvem7
         EExQ28YBKMUVaMRzkA3k+6h00nbQhSv7eS259XGSZC810/k2SNk9Pj8OcQZpJ5EmWlzS
         LlXzO62MF+cv9MbwhM4AP1yAVLmWh64jK+LawYtKG/62EIMnegmfXhyJcjXCRnT4r5Od
         /CCrnFFx1llxOQPehEHVIKT+zFrqNpGZSV1Uwa55TNhx1t5mFo/pibthtkpw4wz+KmIc
         PJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814826; x=1773419626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e8+NHmV9aIJTBlEGWlUzdypWZU3A1Zs5nOLXPSleeHM=;
        b=ZGt+fuHFR+Rfvg8E2bLCE/2vSv0/KEATl7k8rhbYhUrgLbbgOfayk/0ueLCUM+yOGn
         wgEoqNlhxXeHJ/oJhDC7hGQksZBtDQYLbHqbQFrKmQRLzWmICIjApfs8jjG38tB+M5za
         L9KhQ7KJCRJ+pRtfpRKvrz2SK42aq6i3OiekJrxJw8vr6gXejXCaHUdk50YEQpC/fOQ0
         aBONUK6Tf0ptl5WqiaCFVgp15GGSBT7IRtLrnRYxi9d5d9gF53ncQH3XKdrdPhI1GYVm
         DcC+iRKIN/Aa/RyonJA5Gih3XwokBAPABQq1M6d7dnyKLQhhjFI6rDG+7K9PObq5J0My
         6HZw==
X-Gm-Message-State: AOJu0Yx4ZPYSn0T9tFlrY9EFWxxALaEC43DHi50Byv0nGsNCUUpdMhQu
	DFy1cdTp8CUQC6grIdC9b5udf3JU8q0KD+jVapRyZdUtOTcFhKUM+yoeLJ/A1g==
X-Gm-Gg: ATEYQzyDsgB5HzUoLiK0HocmALJqndbGrQcUrZ7+mXrDI/7ZIt5g9GZTuyPWMgNxwX4
	0h/yw8IwnQTIfmZDMRW4mlIcFk2sl75picsSS8cmnkBoQbRPD8s56kaWZIICrolu8pG3Uo7Dnf4
	aa0LVebd+ASaZZgikXY83bCVWI05WgjDW8uApXwa2LAfgfvtkLpTAUuoxncRhU2T60oO3x2xaFl
	N2IYZdmT2G4eNRrGvby1biRLIvMn33iy0ukttB8pLIrLJfkU0liPWETMcALueSJbjlGmpA8rBp0
	U14fcrwXIpY8iyUnJpHi+dza7kucoTe9XxYTWG2EagDiUOu1olhDX42Ot5mPZX0BJS9m+8sVM2y
	vMXkb2zOJL7SSbdYRQ+uDe2i7e+krNjOBQNDwoX2iu+5xwqOkyI0pcEfAec5GPZpfAo/MU3tq1Y
	8CEMX0eqV3mIp5i1Q36eNiBX4rRiT5D8o6Ba4GiD2g8tETWdsCwSMZyi7JWPoclUH0AeYjqcS2M
	xTW
X-Received: by 2002:a05:600c:46c3:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48526959433mr47154465e9.21.1772814826016;
        Fri, 06 Mar 2026 08:33:46 -0800 (PST)
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
Subject: [PATCH v7 06/14] xen/riscv: introduce vcpu_kick() implementation
Date: Fri,  6 Mar 2026 17:33:23 +0100
Message-ID: <21e8e22cb62498236ebe094671d80676a46d8b76.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4CF66224F95
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

Add a RISC-V implementation of vcpu_kick(), which unblocks the target
vCPU and sends an event check IPI if the vCPU was running on another
processor. This mirrors the behavior of Arm and enables proper vCPU
wakeup handling on RISC-V.

Remove the stub implementation from stubs.c, as it is now provided by
arch/riscv/domain.c.

Since vcpu_kick() calls perfc_incr(vcpu_kick), add perfcounter for
vcpu_kick to handle the case when CONFIG_PERF_COUNTERS=y. Although
CONFIG_PERF_COUNTERS is not enabled by default, it can be enabled,
for example, by randconfig what will lead to CI build issues.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v7:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add asm/perfc_defn.h to provide vcpu_kick perfcoounter to cover
   the case when CONFIG_PERF_COUNTERS=y.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/domain.c                 | 14 ++++++++++++++
 xen/arch/riscv/include/asm/Makefile     |  1 -
 xen/arch/riscv/include/asm/perfc_defn.h |  3 +++
 xen/arch/riscv/stubs.c                  |  5 -----
 4 files changed, 17 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index b59e026a9635..c8ce1efa884d 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -1,9 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
 #include <xen/sched.h>
+#include <xen/smp.h>
 #include <xen/vmap.h>
 
 #include <asm/bitops.h>
@@ -264,6 +266,18 @@ void vcpu_flush_interrupts(struct vcpu *curr)
 #endif
 }
 
+void vcpu_kick(struct vcpu *v)
+{
+    bool running = v->is_running;
+
+    vcpu_unblock(v);
+    if ( running && v != current )
+    {
+        perfc_incr(vcpu_kick);
+        smp_send_event_check_mask(cpumask_of(v->processor));
+    }
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index 3824f31c395c..86c56251d5d7 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -7,7 +7,6 @@ generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += irq-dt.h
 generic-y += percpu.h
-generic-y += perfc_defn.h
 generic-y += random.h
 generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/riscv/include/asm/perfc_defn.h b/xen/arch/riscv/include/asm/perfc_defn.h
new file mode 100644
index 000000000000..8a4b945df662
--- /dev/null
+++ b/xen/arch/riscv/include/asm/perfc_defn.h
@@ -0,0 +1,3 @@
+/* This file is intended to be included multiple times. */
+
+PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index daadff0138e4..eedf8bf9350a 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -203,11 +203,6 @@ void vcpu_block_unless_event_pending(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-void vcpu_kick(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 unsigned long
 hypercall_create_continuation(unsigned int op, const char *format, ...)
 {
-- 
2.53.0


