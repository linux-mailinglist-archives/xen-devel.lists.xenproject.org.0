Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IL8J3FRj2nnPgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7DB138010
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231317.1536566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2l-0007Yf-Ve; Fri, 13 Feb 2026 16:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231317.1536566; Fri, 13 Feb 2026 16:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2l-0007VL-M7; Fri, 13 Feb 2026 16:29:23 +0000
Received: by outflank-mailman (input) for mailman id 1231317;
 Fri, 13 Feb 2026 16:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2j-0005Ws-Mw
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:21 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2662e47b-08f9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 17:29:21 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so9492955e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:21 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:19 -0800 (PST)
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
X-Inumbo-ID: 2662e47b-08f9-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000160; x=1771604960; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdt9zTgNaD55TiolqekfCQfWMrmcIrSemZ65SdGjqak=;
        b=dBQ0nRTCHweC5QwMTInlZ0sms8AD5jcJ69n07cxnCMyytWS4ZmJER85KBi+ExFYWui
         nReDV0yGAOeW9XL5PQUNbaWvFQB1h+XQG2s1hVen3nGYAO3ybEoF7X/k2F3rP+ACEny6
         8X1j2IP9sz/uF45xAqjL1RjCE3oMx1ZXZgufQnIbNsDZ+Fa329C6lOEGczJ3KeowUSyB
         tRgy6WYAsKWYL+XSerM/XivSc83qJkLF0RpB0JASjJ7VNwjssl9PVRyj29vOKrFwVBHg
         BZPakqr/+mUdlhbTAiQJid3/taSFf1/vlLVrdAgiaTzhha0ApWxMSY1x8e7I+bwBRVrA
         b5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000160; x=1771604960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kdt9zTgNaD55TiolqekfCQfWMrmcIrSemZ65SdGjqak=;
        b=iyHWnzHqj4DxphXK5hdldBMoMfN03W32ifyb0GoOlI/t4vZLgWs/L8rqx2kMLwsP6G
         j4tsJBr/bYe0zNyoB8XsQZl1dl/E9jckZiZq7OPCy1hybzmyYUy6dhls5kbXZMHTU6z1
         zkWnfqEYyvF6oa87opvXdDW+Rqyt4b/qwIcAOcS6zGBIrua6ulmHAaN5TilWVMkiwW+j
         sbpzsnserQ5v1/FFT4b1lV1oMlM8FuVksSOSG+MWTtR5bujn242Pci0yoaaOgKDqlJdJ
         2rEQnuG6A/bFGQSlfvTsOQW1xIdh/rlJidmPvm2U0d/j/ES2sXS6USoyM40rhfyRhB1N
         vCVg==
X-Gm-Message-State: AOJu0YwTRzJqBua2MjEKTdTuaKYPRlaoxVbXYZXnX2zoU++BMLWFrEOI
	wzROZtG00yg0e4v2fICe1OpGKlzTHDZLd9tbVSVoSYPBDA2zeGKnD4S+4Uf5JrbD
X-Gm-Gg: AZuq6aJUmXt0YRv4kJ/0d/cWWQpUdjM81j+V5eZ+ZMPthUV9Qo2/gu6FMYLj8a4dIJV
	obCB++sV7gnDQSXZcQldyW+t88hk5HPoWJ8IynFPIvxw9nzHH9YJhr0W7mb9PQVfKaix/9Ma43h
	qWqS6kkEZYX+77akmvrH59x2nC6iG2p6+Va6Ug8AffTAgrUfwYSDKAeckb8foxczhgMxyI9VmKr
	/Cs6M/tXgt/SPjb0f2lZNPK7FLPymcr/u7rZziTWU3CGmbZI9LNrJA1tqTgbXsZ8SPB0IatmVDE
	YjC4shtdQLME5KnX0zo4Xve9jdiC2+L4KZKmiGv/hlO6a1+OQ9S6wPGOqIXsqK7LkjVDVuzF0cW
	smNZiteQl26xsoMkaFIef+nj+MnjK8c5X3xYLNeyqwE7aGNfQnhEbCm+9l2ErX8nHchpQopybRH
	NP+17g8pJRpY5GA1yRvOvBIM1qKQZt7QoT/F/DIUDE5v2iBnPucUlvS3ggggJNbBr3Bw==
X-Received: by 2002:a05:600c:8411:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-48371051b20mr45916945e9.11.1771000160166;
        Fri, 13 Feb 2026 08:29:20 -0800 (PST)
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
Subject: [PATCH v4 09/16] xen/riscv: introduce vcpu_kick() implementation
Date: Fri, 13 Feb 2026 17:28:55 +0100
Message-ID: <478b18f4eff1e0149b3514ad17b45745295196d3.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: EA7DB138010
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
Changes in v4:
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
index 45a7f0d1da7e..307da467c72e 100644
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
@@ -235,3 +237,15 @@ void vcpu_flush_interrupts(struct vcpu *v)
 #   error "Update v->arch.hviph"
 #endif
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


