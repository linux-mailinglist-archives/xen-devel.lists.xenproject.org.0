Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 35sqFar2/WlklQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28904F7F4C
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303736.1577014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQb-0005O3-Tn; Fri, 08 May 2026 14:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303736.1577014; Fri, 08 May 2026 14:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQb-0005Kr-PG; Fri, 08 May 2026 14:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1303736;
 Fri, 08 May 2026 14:43:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQa-00056i-0p
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQZ-007XVC-Dp
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf678-2eae-0a2a0a5409dd-0a2a4501d306-48
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:43 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf69f-c1f2-0a2a45010019-d155d029cc46-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:43 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-67bc6098640so3266330a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:43 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251423; x=1778856223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RC7DlCeUsaedUaIqwbZ2zmHNvDYUNbqCg+js/0qPP3o=;
        b=mfF2XvpucY+xl08w0ePFK5BXUnAbsPj/JWkT5HsZlY1wcBD54pMneCluW9Tj8aXVSc
         xbDTRy2lpPh28C8tg4BCjOnGmMrYpzuF4xIrtjXE7bTvY3VZidzHwi1S00L7uh/XZgQA
         h6zCZp8CixigTDeZ3LUbwc3U3WWRWeyRrgKZYXgpNibCG/YkTtq6l3l5vHl64bR2c7U2
         xOOSCCvRhypOFrAtl389OA2MS8A4+8tDKe2AJqmg0VO8r4A+mx4OJGybC0qdUrpSiJ3o
         YWvO4cXtwqxiwpparMwQ9fnV0+kRA2Tx0ScBSKPxkSc5c5++KO/MHYg2IghN9RS7WHub
         GcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251423; x=1778856223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RC7DlCeUsaedUaIqwbZ2zmHNvDYUNbqCg+js/0qPP3o=;
        b=RJvniETeJqArdBKEP/u7xDuYbxwv0RQM85la025UOw56aWsYaFgUvERcrgHQnhJMYL
         mQSGG048Ke1fwN0uRoVxTxNxhWP6uuqluzVZUUIo5wdQV7nBRbWY67AHObEg3+LsG1Rv
         9VS66D5Dh/5F1iCm8e3ESnh0qDzlgwCthkjXgALPmpqaS5Z1GuPHy6p5GJTRV9DkZu7t
         50r7mJFopEZikWTAHVbb/jlEYKm55M6jbCoVAUO2NZN/kYzTX5jCv32YS/d9SbOWX+mD
         dRucKKtcx1bum0CKxqPDsbf7Jbx8F8KE4T3dXWDNZzBT9vNj0SQ0lku4UPMepihS72Of
         agPg==
X-Gm-Message-State: AOJu0YxjyccXYUt/oipqxeXf+oPTFbw2s+98ok+BUl+LqY63yq58EpBk
	eUJdJYw+1WBo+kywZtj6963pgGBhQJeYP8SrD4R47iuxPB3F0GR5Rf4GKgfswg==
X-Gm-Gg: AeBDievV7eNUpnuMIfWTibDEr/W2M/gYbJFTsHLUPv8lKBdjjfZsn8d9/+pp6G8hGOi
	Hw97d2jg2j848XSDB1ZeEArh/D1Xk9JDlUY/afpjkwfFFwwJK0JV8GM4lRUUKs0cmXCrFi7hzs9
	veRgW33I87uFTzla9BYSgTc9vmpY7fJCQRyTfzu8kGISzFmiAPvuwOtB86fedgBAUmlYpZk386l
	bAQkl8/7Fdym0VFyRhFzmIZIKHoK7xTqVJLeKdmVlcTDs1Tw/JASMCVWY5qd7V91iwDKl/K2Zrk
	fzIK7Z+gfdMgqkKnT+9vJD8DFbKfLOpul2+qiRYjWoRvxIQhA+DuJsvxwt/2r+uOD5XbHbLqS2d
	9tougK+mqZcezVKI9DLSm40U2xnxF8Pz+iiQoozEdqMFA7FSS+k4LxZfxQFoN2LvZbtpa+nT66u
	X7M4Ylf48H5uPdSvcP7cJ/fpoSvlpC2AY5Y24WAKn04AJZrPi4NYhBaRHzumxeNlb3Qg==
X-Received: by 2002:a17:907:9303:b0:bc3:cb5c:5516 with SMTP id a640c23a62f3a-bc56b028ed9mr725917066b.11.1778251422368;
        Fri, 08 May 2026 07:43:42 -0700 (PDT)
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
Subject: [PATCH v2 03/26] xen/riscv: Implement construct_domain()
Date: Fri,  8 May 2026 16:43:05 +0200
Message-ID: <3b1c60095c8a963e7df3ca5025e637e678f5ee71.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778251423-AE55DFF4-140E611D/10/73395122804
X-purgate-type: spam
X-purgate-size: 2787
X-Rspamd-Queue-Id: F28904F7F4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Implement construct_domain() function for RISC-V, which performs initial setup
for the domain's first vCPU, loads the kernel, initrd, and device tree,
and sets up guest CPU registers for boot.

It also creates additional vCPUs up to max_vcpus and assigns the device tree
address and boot cpuid in registers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Rework construct_domain() to print that vCPU1...n are created using %pv.
 - Use true instead of 1 for initialization of v->is_initialised.
 - Drop unnessary BUG_ON() in construct_domain().
 - Add TODO comment above *_load() functions.
---
---
 xen/arch/riscv/Makefile       |  1 +
 xen/arch/riscv/domain-build.c | 52 +++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
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
index 000000000000..492327631e33
--- /dev/null
+++ b/xen/arch/riscv/domain-build.c
@@ -0,0 +1,52 @@
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
+            printk("Failed to allocate %pd v%d\n", d, i);
+            break;
+        }
+
+        dprintk(XENLOG_INFO, "Created vcpu %pv\n", tmp_v);
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


