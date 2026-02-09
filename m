Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLhjDfoQimnXGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B9112B61
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225793.1532441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVG-000151-SO; Mon, 09 Feb 2026 16:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225793.1532441; Mon, 09 Feb 2026 16:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVG-00011Z-LD; Mon, 09 Feb 2026 16:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1225793;
 Mon, 09 Feb 2026 16:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVF-0007Zo-1S
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3a33c6d-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:48 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b8838339fc6so424017066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:48 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:47 -0800 (PST)
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
X-Inumbo-ID: c3a33c6d-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655967; x=1771260767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im3bd0BlqxTSOv1iNEV5B1CvJvcf5KKLgXBheRE/42Y=;
        b=PJHtPXX6qJ0eRTAIywvaJmnSR1WAmdxWgRkeZAidTE2UVxnqNU3YWxn+qoO7gjTBIG
         xUwpcix/UqYkCnW1SmViUQK4L6Zf6gvcfuK3xgd+Kh9r97hjVPD24wOVLc/7SxXTqyhV
         /brfbiSUd/gjt7JVEif9JoTpulJ7fpjrccvoCpauMsNue4eDb3sb5BlHBzP1FHw4w4zn
         ZkM7cQ+pZZldcU9h446reJlKsjeGw68lMpadQfwVdQvvFpKW7tOQ467rfC5rXpEQIWyV
         /uM1+M2Y6rL7vNqTyeuQNJnl4Lxl/52jo01QD4sBMuq+/PbyAvt8dKQ8In1h0fIkGsjm
         U/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655967; x=1771260767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=im3bd0BlqxTSOv1iNEV5B1CvJvcf5KKLgXBheRE/42Y=;
        b=tvykNYZ05s1R4+Jegw9mOyed7jH+QmUYAnxo2ifrKsOJBapOvv5nC7lcm9cvbj7/ja
         cXIrReifSraYoGXt1P3M25YU/rj9HUxOP5yJSevk4XJsb6R7JNtqYxyQvSRw4H1tOfDV
         Cc8afVFctW+2Xt2QFrL7FzmoeGF6HX3bHCzt4CK/Xh7M/W7LD3MIW6KyhdYt92+/3Lb6
         gpqVpxXIkRP/ky/Y9q0wZleoY4sOLeE6sJXlDF42AR1LfL7MdX+Zfw2sdWRK96IflG57
         db6hevWIWUJb7gAMVY/EnFTLTtCq+o7a35HLuolzceSr0YZ0o1PAE7wVQJ8fth39sore
         //oQ==
X-Gm-Message-State: AOJu0YxbLSo5mQraKakH+am87n2eBtf9JeAy3KbCT0pWpUXrnEh+VORM
	4AL/HwTkoZHd7YPqGr5rG2DsfJn1a0H3uVZrh0G7+50ZxlnxXFlDsrCJpypi94Q2
X-Gm-Gg: AZuq6aIhDjNe+hO17dhYVdQ6oievestFi/dXgKFZpCdxcA8SrIcDuEioC88OeDXX6wQ
	IyDfdtUpGHLzHItOJXmp9NAQwV2KX+mZ0liy4+H/k1Dl91t19ed3bf43Cg2cXylXXBNSNx8brav
	zcFVGFIg72Whnzc/UItxpmCBMJUahcjsdiPCXiVrAg0id4cW8ojhC2DVaQV6kCiVwSo7DjDVmwb
	WKriYlNfa5ql30VnS2Kgd0t3t1ZSJ3YlIbKNtVjrMpOfHKfep1356/uSB7w0My/pMWmXMG4KgUv
	s7jlXjIIUpaS6VZcmMoHPBwIVtm9k3byjxT9r9VtcKfBr8ofHgEahvjrzeRJDd8AvaiOxPpBWU1
	wKWToFz7hmqoemu5U2mDTq6bKFqAlV7DyeX7g6cTbjMfjHDFKgqXuF1TWcoFMastW7XmoJtj8Cb
	rsEDP/GGU67AXHDqE5Z02XjhQ5/yg2o2icCbxfrx74LwgV8KVMbLoDcxcOkqlu0jOp
X-Received: by 2002:a17:907:94d3:b0:b88:4224:8168 with SMTP id a640c23a62f3a-b8f4d57e4aemr4055766b.22.1770655967365;
        Mon, 09 Feb 2026 08:52:47 -0800 (PST)
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
Subject: [PATCH v3 09/16] xen/riscv: introduce vcpu_kick() implementation
Date: Mon,  9 Feb 2026 17:52:22 +0100
Message-ID: <f59a082c4ab600358db23e9f4cd12e89b5b2cef7.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DD1B9112B61
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
index 3f4b062b6ce8..30a966f53c1d 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -1,8 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
+#include <xen/smp.h>
 #include <xen/vmap.h>
 
 #include <asm/bitops.h>
@@ -231,3 +233,15 @@ void vcpu_flush_interrupts(struct vcpu *v)
         vcpu_update_hvip(v);
     }
 }
+
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
index c5784a436574..1f0add97b361 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -208,11 +208,6 @@ void vcpu_block_unless_event_pending(struct vcpu *v)
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
2.52.0


