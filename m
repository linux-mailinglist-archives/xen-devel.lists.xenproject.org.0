Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9oLSCwufPmoYJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAB6CEA4E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cJESfHsf;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346284.1604823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8li-00030x-PE; Fri, 26 Jun 2026 15:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346284.1604823; Fri, 26 Jun 2026 15:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8li-0002w9-5x; Fri, 26 Jun 2026 15:47:02 +0000
Received: by outflank-mailman (input) for mailman id 1346284;
 Fri, 26 Jun 2026 15:46:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lf-0002RQ-HT
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8le-004aSr-Uc
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef2-bab6-0a2a0a5309dd-0a2a450adae0-12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:58 +0200
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef2-e40e-0a2a450a0019-d155d0abe5e6-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:58 +0200
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3965adfd75fso9039471fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:58 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488818; x=1783093618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9apWbvB3Q7fbjd5yUWMyhIhyy9eFY+Tl+j7eQxlTNk=;
        b=cJESfHsfPsCCQAizqLl4+wEFgVkI+S//dHKrg7zK70cRiDh2dn9JmWd8QRr0fmSy1j
         iX9mvhwqx9MneU7pnnjvNc6/BgSK2yaFrddiU56FfXcjlHic1hywbRhdTehA/fa1D0fs
         DgOSqo0sxEU9HecLqHNIU7I31gfDNnBtp2fHHLX1Um0HaQFjZdKxK5C92+SFJ0+xKv0K
         GMoy9rj4uPmUVAwqSO0AnqFYMVbCCP3TeTiN6Dm1FzdkIOyXnLIHCdhCvqjiY0x1Mkho
         aus5n0tbEt06FhD+ma19Acu4TTAcCeULiYLBPcnl1S0I0s+Yml+y9CoZV0CZU4TuGNWd
         IyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488818; x=1783093618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9apWbvB3Q7fbjd5yUWMyhIhyy9eFY+Tl+j7eQxlTNk=;
        b=mScfDZDsPOWC6OhsoQMvDJ978fdXQ1sjTrvfyXSJKmjNUII6vlpeCPBvR6af6/OK+2
         /Dfg3ioMP8Odp+scMqiS1C4hxFWVVEXfUvlqHWMKEY/O2MqfUnU9a81EIXwFFDI+tAL/
         T0GJIedpOPFPY3mMeFHi+CFDqiZxxfe4D3CSqYMjcdOYPu8fyvm4kMu75muPWIbW8AQO
         pb9369Zd9SWvYH45bGz/SQv8PT9p3c8U61Q0wJ/gvyA5Y0SQhqJHocvoYvk261ivim9e
         LS56wggWwd8X6+7+Q8L88Tk8LMhydWUWztNAAteHqokEs5Q0r8LCkQ+rP1JRHxv0VqqI
         gMJw==
X-Gm-Message-State: AOJu0Yzjw1rUT2rhbpMDo1ciiqrpaUHYFz+TnTsGMh/w6MHoANgTeSi3
	Ty299vpSPF2oZASVPZrmSRBeC4fPNJXfR0ojVHWKU4k6jF8RimBykkWAYRaWyQ==
X-Gm-Gg: AfdE7clhferVHCuQudgPxygIfslKK+ynKKSpvOrqLKUUaW26I13/gFzqGcR9lj27Jl7
	mF3Sz+MRJPrmd7eDe0kL5foUQqdc9oPbIwS4Hd3RKZUIkUyWmjhkdRztUgS9lJIP2J11ZkaiTRD
	wKyg6ym9w9oW6xrcerw5g9yD8/gjRxE70Pooj4+SmuPWZIE/aVmwLzX5L94TCROoC8oRlltuFZs
	4a8Xh543O9BQw14vFSprggwtnQqsMCevzqy/xVpl++5gnrb9b9yxc/bhg5h+4HOV06jXG2ObLRe
	hOLEtw+ZRvAJUa9aUbesY/+UaiRdNoXrk+jg9FxLww7ZN0wwsLtml80HejK0g5ghau6YNnkXacF
	LrQ7zzcgVPxjY8qCU7ko4L9xB7x33mKv7IvTqUjrP3hMNwlgV51Sv9qxZ5mUXPuL4uLAUjh6lgn
	nsHTwhOIBgvesVKo/YoFe4En6Fgwrmy6HSibZG4hiYLFQoCLu0YCPei95GJw==
X-Received: by 2002:a05:6512:461a:b0:5aa:655b:ac29 with SMTP id 2adb3069b0e04-5aea1f2d5d2mr2181855e87.13.1782488817809;
        Fri, 26 Jun 2026 08:46:57 -0700 (PDT)
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
Subject: [PATCH v4 13/25] xen/riscv: implement make_intc_domU_node()
Date: Fri, 26 Jun 2026 17:46:22 +0200
Message-ID: <b5b8bd37af37ee8ea84c07612871ebfcd53b66d1.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782488818-D6F3ADDE-8808133E/10/73395122804
X-purgate-type: spam
X-purgate-size: 3543
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
X-Rspamd-Queue-Id: D0EAB6CEA4E

Introduce a RISC-V specific function to create an interrupt controller
Device Tree node for DomU domains during dom0less build.

Add make_intc_domU_node() to the dom0less build path and wire it to
a new generic helper, intc_make_domu_dt_node(), which delegates DT
node creation to the active interrupt controller implementation via
vintc_init_ops.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in v4:
 - Made local variable vintc pointer-to-const.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Use const struct vintc_init_ops *init_ops in struct vintc.
 - Drop redundant intc_hw_ops check in make_intc_domU_node().
 - Drop NULL pointer checks in make_intc_domU_node() as we can't start domU
   without properly created interrupt contoller node.
---
Changes in v2:
 - s/intc_make_domu_dt_node/make_intc_domU_node.
 - introduce separate intc_hw_init_ops structure for init operations.
 - Return -EOPNOTSUPP instead of -ENOSYS.
 - Drop const for kinfo argument as it could be changed by interrupt
   controller node creation code.
 - Refactor make_domu_dt_node().
 - Make make_domu_dt_node part of vintc structure as it looks more logical to be
   there.
---
---
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/intc.h   | 12 ++++++++++--
 xen/arch/riscv/intc.c               |  8 ++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 459896c04b41..8e597e231ee7 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -98,6 +98,8 @@ struct arch_domain {
 
     DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
     char *isa_str;
+
+    struct vintc *vintc;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 3d84fcc51d1a..9b701445179f 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,14 +8,13 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
-struct dt_device_node;
-
 enum intc_version {
     INTC_APLIC,
 };
 
 struct cpu_user_regs;
 struct irq_desc;
+struct kernel_info;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -47,6 +46,15 @@ struct intc_hw_init_ops {
     int (*init)(void);
 };
 
+struct vintc_init_ops {
+    /* Create interrupt controller node for domain */
+    int (*make_domu_dt_node)(struct kernel_info *kinfo);
+};
+
+struct vintc {
+    const struct vintc_init_ops *init_ops;
+};
+
 void intc_preinit(void);
 
 void register_intc_ops(const struct intc_hw_init_ops *init_ops);
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 3600d23bdb5b..e63da5e22efc 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -3,6 +3,7 @@
 #include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
@@ -72,3 +73,10 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_type(desc, desc->arch.type);
     intc_set_irq_priority(desc, priority);
 }
+
+int __init make_intc_domU_node(struct kernel_info *kinfo)
+{
+    const struct vintc *vintc = kinfo->bd.d->arch.vintc;
+
+    return vintc->init_ops->make_domu_dt_node(kinfo);
+}
-- 
2.54.0


