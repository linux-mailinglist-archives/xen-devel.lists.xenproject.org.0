Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j/m0MJqJmGlvJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C20169410
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237339.1539751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE2-00027Y-2Y; Fri, 20 Feb 2026 16:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237339.1539751; Fri, 20 Feb 2026 16:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE1-00025G-UY; Fri, 20 Feb 2026 16:19:29 +0000
Received: by outflank-mailman (input) for mailman id 1237339;
 Fri, 20 Feb 2026 16:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTE0-0000Q4-7e
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecf522b8-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:26 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-483487335c2so21410585e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:26 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:25 -0800 (PST)
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
X-Inumbo-ID: ecf522b8-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604366; x=1772209166; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L59NZMHr94doMxHYbooYqU+b+678IT1cbuVKqM3ukd0=;
        b=S3q7A04RZNKuGVC2lv5LmiXS+HfLUSjRnlEYQSFSd+kY1/djYWxWGOCcCdzZAdC0vf
         krFp6ARERyCLLJe6K7Wh/wQa1mvJvgZvY89qfqWItbrYRqW27lK4dwN7kUq2Rx0BxNjh
         Txjd3VtTEmAHVd10ucZASWcLu3YIZwvshGmzlCgE1e5UOzAr6heQcs0oAMbIKQOdtbGw
         iZRRj4Z0t28xLDnFQEL60NDGD5Tu+JvXnOo0mNi0UGMojlE7AdidHCwBl4Chh7rJjoS7
         asb7XttRLkAbhTN2xh9V/KMZE73GHp20+7LWgB/ievKBCT1uRccjeQbcF9Safwili0C6
         Z9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604366; x=1772209166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L59NZMHr94doMxHYbooYqU+b+678IT1cbuVKqM3ukd0=;
        b=g30bC4tiGA6TiYCq0AxN7aDpEZDXb1q8biQpzhVqGUMLqI46Hq3YAvMZX72lg1Ozpi
         fq07J7nPRaxj3353/x3AMbctK5b6ULHtE4BUShaJ63HOpqlAXLvJYE56gIOOqwGbUiDY
         B1kKSlUretAoa+6cbtt+PVCoxrjZNCnyp4HXQTwJZZ8SwyXqPA2D9zdSo6v63S8usAqc
         Lb5MB2SzbVglZN6dNKU0AUXDtYpvWRycNwR+IZ1sdgV6QO9jorl0yiLTjJ3mipTjuY70
         QiB/XceMmcFbtLThDnUq591Gn+os/iOs79GZaB5uyTkIu9EHSneuoiTuaW0toT1VTjX2
         8SMg==
X-Gm-Message-State: AOJu0Yy7jQW82Fm2OtdmwhnxG77jsXjdAVkRDJfErR0ykEAmkP4Zm4tD
	yRCcC3dr+3QF8U5Zc1VPGgHJ9QSmn9HfTCttGwXFPAZXjDrlrM6/C5Gb2EUbDQ==
X-Gm-Gg: AZuq6aL04xf1LJdyNmv3B8TQtsKxLQ0IgFJC5Zst/YgHJSDUcFvL1nPCNZrkI+VfLeM
	yxywsRO7HOVj+HiuCDksuEVSwYXdso2u73vrIEIDp4Hl5P6KddhPD1azGVQ6yc2ppY0f63wrPcM
	VlD95Nhpoz2stXWWSinOVIy03qFf9BBvqgmcG0svyA2mO9RbArKtI/Jnq5I2PgjvrT0EzHpA6Sr
	2gAzglBXfkFoLq+MLd5Ai0vP5EB/2o8FodcXpsYMpu/t4EshPXH7XQayfyBJnxL/5fud/eZ/pj7
	acrlVDWrm6ujIyL3vMmiLPO7gM97s3d78bRvH3WotuRC1VJg4XwsmvW0uDQVK00a4itBM0AxX7x
	jZFiREkFFZl43RO4age6jJoq1+qo1spug/lQ/IPy8JL+kbICmpHldkRt3Th3rlo8Ok1m8pO5lKK
	gn31U6JBMC7AMgW341ZXJhMOLi2kqROIW//SSjavlhyps4iob+SDdf7kV8cEN6O8JVbw==
X-Received: by 2002:a05:600c:3e8d:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-483a95f89b5mr1012965e9.30.1771604365821;
        Fri, 20 Feb 2026 08:19:25 -0800 (PST)
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
Subject: [PATCH v5 07/14] xen/riscv: introduce vcpu_kick() implementation
Date: Fri, 20 Feb 2026 17:19:02 +0100
Message-ID: <0d0c9a359699240cd812e1ba68385a864666d102.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 55C20169410
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
Changes in v4-v5:
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
index 7027b5e9aa20..fb5c21078172 100644
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
@@ -251,6 +253,18 @@ void vcpu_flush_interrupts(struct vcpu *v)
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


