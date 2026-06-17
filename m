Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NiK5CH+CMmqx1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1068698F04
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AYk1hyJB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340086.1601121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHZ-0001gF-O6; Wed, 17 Jun 2026 11:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340086.1601121; Wed, 17 Jun 2026 11:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHZ-0001aO-Gb; Wed, 17 Jun 2026 11:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1340086;
 Wed, 17 Jun 2026 11:18:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHW-00019z-SU
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHV-008nON-8j
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328267-bab6-0a2a0a5309dd-0a2a450bd29e-12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:05 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826d-212f-0a2a450b0019-d1558035c590-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso48529665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:05 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695085; x=1782299885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlQi9+uo1dP1MsjK2ZrKEdiUrK2P4TAiiVcer4o8XZQ=;
        b=AYk1hyJBnP0l6skItus18xG0ykFh9fEH1bK1YeZW5rauQqobxg4/GLHmZUJfa8TapQ
         EOPtiQD8U1grJ1oYLeNEvC/BVZD2cfEXM1fAc1LzGyW5uuS7OZqgN/gJwe5SOAwBCcWO
         4NEGzg/VLntldaykUfBt6d6ZehMLtF26aWelZlRmIljXHN2XCQX5euOmtDLNY1uDLXDA
         WzqifMLlYgMKZYdUyMJZaoZO1N9P8XviUB7DTCBNDxfleKjCgyu0/h+fwGt4uMdxNvNx
         yiKW91bvCw6pwJgqnwNDKu2ye+l1ogHKUFfnbge0m7r6+5wfjwjupez/VfcGlzBlmOSn
         wTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695085; x=1782299885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FlQi9+uo1dP1MsjK2ZrKEdiUrK2P4TAiiVcer4o8XZQ=;
        b=REqaTDytu2pQR4krg1J9IgF/5DrXxSiKQgaZyNr8gzjtbZc0u3J8MnfxNVR0b6p2OB
         555uDnKp5hTxBjg/EdS0npPrMjxO3KaIikLX2jxheKQ1VJ+aqXZ53d+2Q+6JtaMfk9lq
         8UszqU90UPOFrJEvRQQVWyng2qNwUX30EdKCj0nM/obNLB3oFETllNsKgBuO+PPesiju
         8v62OkiIBhKaVDjzQhsdkuM6mtqIgtfIjJxEjToWx5eHEkZnpC2+2PybaPb8DNh93HZJ
         p/J6YJuMql9SN7IAVrVVzml5OgEQw8cd9eZrJsgCc4EBPL32QzrzT9umRnHH8fycRFTT
         6I+w==
X-Gm-Message-State: AOJu0YwhKAHO/ppmuJC+snmFg8F2wZE34Kj+pm1r6VFXAcm6rNmNWyjw
	Ty17NOIFGPUA+bpUAOfl6GJ7ALb719yxEq3vDrWkeiv8MhMtv129wwp4WgL8bw==
X-Gm-Gg: Acq92OEMaw6tol6faYNPZM2CdBbhkbOY/6b6V9lxKNBsk2xI2Nz0gvORe03cHO1iK/i
	bWHto+R6IEdeborH1QE250WRc2IP+Wi+7jQHL1O+mQiTS3ZnyvWKpEnvZCoxPhlC4rtzig+HPX0
	JDNItUnexEfdlHiO7eaix++0na/2Zhknu/tJRh8aP/dOZgjKNjGrynH3RGGh/Z/gXONU44bqmDJ
	TeKJqYEbCbOq5IoCZG2XCLzLua71t0Mk+Pu66ObH1tlX/fFmd9usvzpb421ik/zdKPEtaZoPHTg
	kGrZrOt9McE8FcRRbC/2EWxKgE36md0ccOureWrU85PY0xNcqUwR0e8g+TC1KM1wEIP9WdeBxde
	Uc/BC/H4pmWwSH+PvSkcNNgFs27hLdD44DZweZWFl/s7J61sw3rymC/nxI0m/hcnf5pNVO7QESh
	G4PGwuGRbRdsdQvi3hiPSm84bS7CtskZqpXNJpMB6umcWgbPb8ySpW9joQS5cKXlcaVHhH
X-Received: by 2002:a05:600c:818f:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-492333ba2d8mr66182685e9.5.1781695084208;
        Wed, 17 Jun 2026 04:18:04 -0700 (PDT)
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
Subject: [PATCH v3 04/23] xen/riscv: Implement construct_domain()
Date: Wed, 17 Jun 2026 13:17:32 +0200
Message-ID: <db630a8a003a1aa69e4edaf6d5f4994f18ac1354.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781695085-13F7EF3B-27D470C4/10/73395122804
X-purgate-type: spam
X-purgate-size: 2853
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
X-Rspamd-Queue-Id: C1068698F04

Implement construct_domain() function for RISC-V, which performs initial setup
for the domain's first vCPU, loads the kernel, initrd, and device tree,
and sets up guest CPU registers for boot.

It also creates additional vCPUs up to max_vcpus and assigns the device tree
address and boot cpuid in registers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/%d/%u for printing vCPU index in the failure message.
 - Drop dprintk() for successful vCPU creation.
---
Changes in v2:
 - Rework construct_domain() to print that vCPU1...n are created using %pv.
 - Use true instead of 1 for initialization of v->is_initialised.
 - Drop unnessary BUG_ON() in construct_domain().
 - Add TODO comment above *_load() functions.
---
---
 xen/arch/riscv/Makefile       |  1 +
 xen/arch/riscv/domain-build.c | 50 +++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 xen/arch/riscv/domain-build.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 8f7fd625dddd..fd5e499eb4b9 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
+obj-y += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
new file mode 100644
index 000000000000..72cccb2c5c22
--- /dev/null
+++ b/xen/arch/riscv/domain-build.c
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/fdt-domain-build.h>
+#include <xen/fdt-kernel.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+
+#include <asm/current.h>
+#include <asm/guest_access.h>
+
+int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
+{
+    struct vcpu *v = d->vcpu[0];
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
+
+    BUG_ON(v->is_initialised);
+
+    /*
+     * At the moment *_load() don't return value and will just panic()
+     * inside.
+     * TODO: it will be good to change that.
+     */
+    kernel_load(kinfo);
+    initrd_load(kinfo, copy_to_guest_phys);
+    dtb_load(kinfo, copy_to_guest_phys);
+
+    regs->sepc = kinfo->entry;
+
+    /* Guest boot cpuid = 0 */
+    regs->a0 = 0;
+    regs->a1 = kinfo->dtb_paddr;
+
+    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
+    {
+        const struct vcpu *tmp_v = vcpu_create(d, i);
+
+        if ( !tmp_v )
+        {
+            printk("Failed to allocate %pd v%u\n", d, i);
+            break;
+        }
+    }
+
+    domain_update_node_affinity(d);
+
+    v->is_initialised = true;
+    clear_bit(_VPF_down, &v->pause_flags);
+
+    return 0;
+}
-- 
2.54.0


