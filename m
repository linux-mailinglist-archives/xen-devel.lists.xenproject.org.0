Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHhxGsD2/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AEA4F7FC2
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303771.1577125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQx-00017V-8f; Fri, 08 May 2026 14:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303771.1577125; Fri, 08 May 2026 14:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQw-0000rx-2s; Fri, 08 May 2026 14:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1303771;
 Fri, 08 May 2026 14:44:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQs-0000CP-8H
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQq-00EpjT-2x
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6ae-5cb7-0a2a0a5109dd-0a2a45048fc2-6
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:01 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b1-1dec-0a2a45040019-d155da2ca595-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:01 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bc23bebd345so31342266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:01 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251441; x=1778856241; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJgcbaZaXFB0dLYekd715MJ/zMchLKXDN0/D0Xu69Sc=;
        b=q8khQGGcXsdPCPAm5C3SRMtpdqUnoDAq10ucq+AJ4fL23SZ+NR7OwWb8W7XYk4tDlO
         xigIB0my7Lct5BkORRdrtDEgdTqR8/RlHIbTWP10E3M5ajtnlgvQMMkilwBtW/3s2Si5
         rePktaLcgOvX3wK2tISVwY3PfOxcgir25eyiwqn7X2AxKs3LQX/zRIrpv2zS3eDTPgOk
         J7Ilp0SEwes63C1VlTqcgFFu2/QjuLeNmz/BtGe4vtYg1W0MXCoOlnO0Nm24neQjcaNg
         8juiSXdkQNRJcYjFAQDOxvFyaM2ZmPFNgvP979iDoDRTv0ACLZuHZ4Ved/3tYEsGVJIA
         cQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251441; x=1778856241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJgcbaZaXFB0dLYekd715MJ/zMchLKXDN0/D0Xu69Sc=;
        b=V/imjLQNKMgSNXjKpBnk8ByS4E6Zb2vLGj3bi7g2lGrxd5oeIBQ2Add8ynwQVoMTMI
         L0u55ZLkx+IXJjaaz+ScG+rJt3Zd0axlnMHHnsEkyiY0/TX4aq9tYOxbfbFDzoCnDJJa
         KPrx+pzC4rvzv1cXXLQcQQHMU9LiO4mpr0St5XMcu/OWHhHdktu9oCF3WzT9en+wWo5s
         n7+6nnS7hleHCWwAootDpw+qoX9P19ZqGEPs4De8k1xSVr7uFfgDzAZQ8L+AacM7bCqI
         U6cRX7uThiacJkzhgoV9NCvLwOsjHAkPUxahmesPp06mbo9peJRoliERzhoZ1IA0u7DN
         Et9g==
X-Gm-Message-State: AOJu0YxSzyjOml+7uSIJpCjRuUZfX9CELTJLFSQTGyEyygwjBE3ACOnA
	RKhE2xkuNP1JOV9UJ+5uWv4X/Aem47jng2zxEbgAStND5yDe2aOJz9jjJt/CYw==
X-Gm-Gg: AeBDiesEtacOxV+dkcZasLpemFMMuMbLbh9g/fs1NjSILvPlWY+jS3cEj+R6SMdYnf6
	FECP4vA9KRMB0IDivb5kJhX2gdcIMyHWUpPZc5pUcVL0t9LSIskLX2XoIsKjFLaSgqintybLkMj
	SRgA7FgkdbfZtkmK25wdAyGYYz37iyiKcDKgmqRRawWWKXV4Eid4lxjJsboLJePg08AFL9uMUdX
	MvYtYmvrbMIIDVB0XkSnVYdGN8IdwVOaiz36EFUW60vM8fdmtcQOx6nd/ZJn1xbYaKZdre2TUCn
	E66Q7/5hIQlnHksYVr29LGcgv9qMZVCxWlRiOM/lIvgoUOyhZeVUVpfSTk/yfom45uD2vRMUqDZ
	vLmDc1yhJp27Ek3XYouV6f4zlJwDVEiIcDwxwquGlrpg9ovuhaLhcUm/OiZCic5QizgfnoMJ0UQ
	9yF0r/dgDgll85wGwLyNZ+mGYwVO7no3tekv/mX1O1olQozWnVTLsPt4ps5IyuSB9Ahg==
X-Received: by 2002:a17:907:26c4:b0:bc2:c99f:fb22 with SMTP id a640c23a62f3a-bc84cc7300emr434513366b.2.1778251440590;
        Fri, 08 May 2026 07:44:00 -0700 (PDT)
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
Subject: [PATCH v2 16/26] xen/riscv: create APLIC DT node for guest domains
Date: Fri,  8 May 2026 16:43:18 +0200
Message-ID: <d1377f3e2381a6428b558b54f47db342d0cd5503.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1778251441-2997A3FF-93BDCA80/10/73395122804
X-purgate-type: spam
X-purgate-size: 7708
X-Rspamd-Queue-Id: F0AEA4F7FC2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,microchip.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Guests require a Device Tree description of the interrupt controller
topology. Add support for creating an APLIC node when building the
guest DT.

Provide stub for imsic_make_dt_node() it will be introduced properly
in follow-up patch.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Avoid as max as possible of host properties inheritance. Only number of
   APLIC's irqs are checked what leads to an introduction of
   get_aplic_irqs_num().
 - Move this patch earlier what leads to an introduction of
   vimsic_make_domu_dt_node() stub.
 - s/vimsic_make_domu_dt_node/imsic_make_domu_dt_node.
 - Refactor vimsic_make_domu_dt_node() to avoid re-usage of APLIC host
   properties.
 - Drop next_phandle as it is now in common code.
 - Drop const for kinfo argument of vimsic_make_domu_dt_node() is is
   going to be updated inside vimsic_make_domu_dt_node().
 - Use introduced before vintc->num_irqs.
---
 xen/arch/riscv/aplic.c                    |  2 +
 xen/arch/riscv/imsic.c                    |  7 +++
 xen/arch/riscv/include/asm/aplic.h        |  9 +++
 xen/arch/riscv/include/asm/guest-layout.h |  2 +
 xen/arch/riscv/include/asm/imsic.h        |  3 +
 xen/arch/riscv/vaplic.c                   | 77 ++++++++++++++++++++++-
 6 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index aba9f3945236..6ed9118485f3 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -12,8 +12,10 @@
 #include <xen/const.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
 #include <xen/spinlock.h>
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 8b46419ca23b..ceea6778d9dc 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -14,6 +14,7 @@
 #include <xen/cpumask.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/macros.h>
 #include <xen/sched.h>
@@ -522,3 +523,9 @@ int __init imsic_init(const struct dt_device_node *node)
 
     return rc;
 }
+
+int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
+                                    unsigned int *phandle)
+{
+    return -EOPNOTSUPP;
+}
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index b0724fe6f360..b42b159496b8 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,7 @@
 
 #include <asm/imsic.h>
 
+#define APLIC_DOMAINCFG_RO80    (0x80U << 24)
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
@@ -27,6 +28,14 @@
 
 #define APLIC_TARGET_HART_IDX_SHIFT 18
 
+#define APLIC_IDC_SIZE          32
+
+#define APLIC_MIN_SIZE          0x4000
+#define APLIC_SIZE_ALIGN(x)     ROUNDUP(x, APLIC_MIN_SIZE)
+
+#define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
+                                 APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 68d95a09394c..9fc990c057f2 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,8 @@
 
 #include <public/xen.h>
 
+#define GUEST_APLIC_S_BASE 0xd000000
+
 #define GUEST_RAM_BANKS   2
 
 /*
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 2b84824cd377..604f88db9322 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -78,6 +78,7 @@ struct vimsic_state {
 };
 
 struct dt_device_node;
+struct kernel_info;
 struct vcpu;
 
 int imsic_init(const struct dt_device_node *node);
@@ -94,4 +95,6 @@ void vcpu_imsic_deinit(const struct vcpu *v);
 unsigned int vcpu_guest_file_id(const struct vcpu *v);
 void imsic_set_guest_file_id(const struct vcpu *v, unsigned int guest_file_id);
 
+int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
+
 #endif /* ASM_RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index d2ec196668bc..3f967464335a 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -9,6 +9,8 @@
  */
 
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
@@ -19,8 +21,11 @@
 
 #include "aplic-priv.h"
 
+#define VAPLIC_COMPATIBLE "riscv,aplic"
 #define VAPLIC_NUM_SOURCES 96
 
+#define FDT_VAPLIC_INT_CELLS 2
+
 static int cf_check vcpu_vaplic_init(struct vcpu *v)
 {
     int rc = 0;
@@ -47,6 +52,73 @@ static int cf_check vcpu_vaplic_init(struct vcpu *v)
     return rc;
 }
 
+static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
+{
+    int res = 0;
+    void *fdt = kinfo->fdt;
+    unsigned int msi_parent_phandle;
+    char vaplic_name[128];
+    paddr_t aplic_addr = GUEST_APLIC_S_BASE;
+    paddr_t aplic_size = APLIC_SIZE(kinfo->bd.d->max_vcpus);
+    const __be32 reg[] = {
+        cpu_to_be32(aplic_addr >> 32),
+        cpu_to_be32(aplic_addr),
+        cpu_to_be32(aplic_size >> 32),
+        cpu_to_be32(aplic_size),
+    };
+    struct vintc *vintc = kinfo->bd.d->arch.vintc;
+
+    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%x",
+                   GUEST_APLIC_S_BASE);
+    if ( res >= sizeof(vaplic_name) )
+    {
+        dprintk(XENLOG_DEBUG, "vaplic name is truncated\n");
+        return -ENOBUFS;
+    }
+
+    res = vimsic_make_domu_dt_node(kinfo, &msi_parent_phandle);
+    if ( res )
+        return res;
+
+    res = fdt_begin_node(fdt, vaplic_name);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", FDT_VAPLIC_INT_CELLS);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "riscv,num-sources", vintc->irq_nums);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", VAPLIC_COMPATIBLE);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "msi-parent", msi_parent_phandle);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
+    if ( res )
+        return res;
+
+    return fdt_end_node(fdt);
+}
+
+static const struct vintc_init_ops __initdata init_ops = {
+    .make_domu_dt_node = vaplic_make_domu_dt_node,
+};
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_vaplic_init,
 };
@@ -60,13 +132,14 @@ int __init domain_vaplic_init(struct domain *d)
 
     d->arch.vintc = &vaplic->vintc;
     d->arch.vintc->ops = &vintc_ops;
+    d->arch.vintc->init_ops = &init_ops;
 
-    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
+    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
+                             APLIC_DOMAINCFG_RO80;
 
     d->arch.vintc->irq_nums = min(intc_irq_nums(),
                                   VAPLIC_NUM_SOURCES + 0U);
 
-
     return 0;
 }
 
-- 
2.54.0


