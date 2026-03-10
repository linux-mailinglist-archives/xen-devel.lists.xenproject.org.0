Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO1/KjRSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:17:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EADD2555C5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250499.1547992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00i0-0001uP-2e; Tue, 10 Mar 2026 17:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250499.1547992; Tue, 10 Mar 2026 17:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00hz-0001sf-VO; Tue, 10 Mar 2026 17:17:27 +0000
Received: by outflank-mailman (input) for mailman id 1250499;
 Tue, 10 Mar 2026 17:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aJ-0001QA-9q
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:31 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e635720d-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:29 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48539d21b76so20305135e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:29 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:28 -0700 (PDT)
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
X-Inumbo-ID: e635720d-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162569; x=1773767369; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QzhisNeEOl5GG/axHTaY1VrOGJ87S7KPahT63K4FL0=;
        b=QRnE/YbuQxS5aJsCV1+VHm3IC/UsB81S8opwqaYiMnl3i672gr5xq3uwdlCOzBOaHR
         HzEAe7scP69C2TpkeCRcpAwSZkj2qlea0fdUReJARKMwivOnu1QPubvlHIws9SBO7A6m
         ll1TAX5d7wHh7VA+ihPtpsJOoO7ud3BQmaBlobhUeC41cKAYhltGByFIqS0kanz0VDTM
         vW9Dbwg5JO3mhYWWenjb1bbRdCy4euHUot+8tzidopxZ0388Q9GwK0i0Hw6qhcRiKUTN
         yvp/9CK063/uTOaxKU4+FA550XTu7mHht1eVgRN552Ck+k45H+jx3WNOLEy1CzagNCdr
         kyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162569; x=1773767369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1QzhisNeEOl5GG/axHTaY1VrOGJ87S7KPahT63K4FL0=;
        b=uHhY1BSJcVMoHtrsi6XEY0VoUuRNenbTaAz593RRwsg+H3Znb8gj8Qlw1uGQJV5yU6
         mPvpcA1DWm0OamktGw99yTDsWtx5yyk6HUyfLBJtNlZZONmyAmD29hEktzpXJIBrsERi
         ARAoxDF24ZvQBVBrhd6ofWQ+NA5Qz087di6RS/QuFJhVg8frSkk9W2F/0Mq0PJo0Sm1f
         K5BnYBie7IofBFf6BlEliWGhAwfQeujqss7KmgeGr0vye6ebT5Y5d9xSKCFcR7jI54Vh
         OOOJyCTUaYbEOmSZGsS3dLqnmS3MJrXd59g+gsk+K/BUYqhytwNs+/H5Vh1JNdORSkTc
         r6kQ==
X-Gm-Message-State: AOJu0YwUjtVCh53HhmnBe9NzB1H9p2gVx2NwP+o51D3ElOjTAINqB1c5
	IpAInqJZFqLx2WdPOaDTqEgBEXotpNTs81gxm8t1Z3WbgIYXh/atgEVKv2nOOgou
X-Gm-Gg: ATEYQzybt1JojwHVHE5NESSNSDv6kr2dKw59Ge+Lq6sbMAIzu4k5URkk1oNlt/TZ+gs
	D1Bl4RW/qAEs4d+sb1PHA7rnh4NC9rRRhmYafay0oYuUrNZlQ+7pBB9VATgUSM5N5EOkN9Yy9J8
	VWwVzH4EnbDexnUj8gvkhlA2GNw0L3kfSgIoZET5VDPnmCIx0EAIpp4JozMClpXdmk6IRK89abc
	3FpiJppI5shIkgUpwW+KcJ/SFa1Ci60UJS+lcv9GeWCHtT2LIkD/hdzgKZ752qYUr74xgTrPsaq
	JLYHVNuF+7PuDoRpaidzhj00mqEyM0o8/KsZZ76+KxnpMVPz9hlzHrPWWNYXRGxs5HzDazY+YbJ
	7ZbHdfpGRu7aBJN8zfzPEMKZ05JwmSf3NtVKTiS1cGSvZ79n2o4RRXaPF0zUhRnm4qXiJf+FP6r
	xg/0E8AmWEBX8oSYH/HeprzQwBKVJsZ+KGCuzz/LcgteOiZIstg6sfEEEsgf5EcSmSPA==
X-Received: by 2002:a05:600c:8719:b0:485:39d1:b4ca with SMTP id 5b1f17b1804b1-48539d1bb25mr151543855e9.9.1773162568498;
        Tue, 10 Mar 2026 10:09:28 -0700 (PDT)
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
Subject: [PATCH v1 16/27] xen/riscv: implement IRQ mapping for device passthrough
Date: Tue, 10 Mar 2026 18:08:49 +0100
Message-ID: <10654a6c38fa929b5fdf6f214badfe4f60fe78d4.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1EADD2555C5
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
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

Add initial support for assigning device interrupts to domains in
dom0less configurations.

IRQs described in the device tree are retrieved and authorized for
the target domain. Interrupts that are not connected to the primary
interrupt controller (at the momemnt, I haven't seen the platform
with secondary interrupt controller) are ignored, and IRQs already
assigned to another domain are rejected to prevent sharing.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
For better undesrstanding how   auth_irq_bmp[] is going to be used
it is also introduced two extra patches which are going after this.

They aren't really needed now as this code will be used when guest
will be ran, but it improves understanding and it in general can
go with this patch series.
---
---
 xen/arch/riscv/include/asm/aplic.h |   2 +
 xen/arch/riscv/include/asm/intc.h  |  12 +++
 xen/arch/riscv/include/asm/setup.h |  17 ++++
 xen/arch/riscv/intc.c              |   8 ++
 xen/arch/riscv/vaplic.c            | 124 ++++++++++++++++++++++++++++-
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index b0724fe6f360..55cd4a128de7 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,8 @@
 
 #include <asm/imsic.h>
 
+#define APLIC_NUM_REGS 32
+
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index c5a869db8bc5..76d2fd09cb8b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -16,6 +16,7 @@ struct cpu_user_regs;
 struct dt_device_node;
 struct irq_desc;
 struct kernel_info;
+struct rangeset;
 struct vcpu;
 
 struct intc_info {
@@ -54,11 +55,22 @@ struct vintc_ops {
 
     /* Check if a register is virtual interrupt controller MMIO */
     int (*is_access)(const struct vcpu *vcpu, const unsigned long addr);
+
+    /*
+     * Retrieves the interrupts configuration from a device tree node and maps
+     * those interrupts to the target domain.
+     */
+    int (*map_device_irqs_to_domain)(struct domain *d,
+                                     struct dt_device_node *dev,
+                                     bool need_mapping,
+                                     struct rangeset *irq_ranges);
 };
 
 struct vintc {
     const struct intc_info *info;
     const struct vintc_ops *ops;
+
+    void *private;
 };
 
 void intc_preinit(void);
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 2215894cfbb1..1c23043f409f 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,6 +5,10 @@
 
 #include <xen/types.h>
 
+struct domain;
+struct dt_device_node;
+struct rangeset;
+
 #define max_init_domid (0)
 
 void setup_mm(void);
@@ -13,6 +17,19 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 void init_csr_masks(void);
 
+/* TODO: move somewhere to common header? */
+/*
+ * Retrieves the interrupts configuration from a device tree node and maps
+ * those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
+                              bool need_mapping,
+                              struct rangeset *irq_ranges);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index ff7a76accaca..a91dbc5e997c 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -79,3 +79,11 @@ int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
 
     return -ENOSYS;
 }
+
+int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
+                              bool need_mapping,
+                              struct rangeset *irq_ranges)
+{
+    return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
+                                                         irq_ranges);
+}
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 9b105de7ed7d..0c69f087cf4d 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/errno.h>
+#include <xen/iocap.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
@@ -19,6 +20,113 @@
 
 #include "aplic-priv.h"
 
+struct vaplic_priv {
+    /* Contains a legal interrupts for a domain */
+    uint32_t auth_irq_bmp[APLIC_NUM_REGS];
+};
+
+static bool is_irq_shared_among_domains(const struct domain *d,
+                                        const unsigned int irq_num)
+{
+    struct domain *tmp;
+    unsigned int reg_num = irq_num / APLIC_NUM_REGS;
+    unsigned int bit_pos = irq_num % APLIC_NUM_REGS;
+
+    for_each_domain ( tmp )
+    {
+        uint32_t *auth_irq_bmp;
+
+        if ( tmp == d )
+            continue;
+
+        auth_irq_bmp = tmp->arch.vintc->private;
+
+        if ( auth_irq_bmp[reg_num] & BIT(bit_pos, U) )
+        {
+            printk("%s: irq%d is shared between %pd and %pd\n", __func__,
+                   irq_num, tmp, d);
+
+            return true;
+        }
+    }
+
+    return false;
+}
+
+int vaplic_map_device_irqs_to_domain(struct domain *d,
+                                     struct dt_device_node *dev,
+                                     bool need_mapping,
+                                     struct rangeset *irq_ranges)
+{
+    unsigned int i, nirq;
+    int res, irq;
+    struct dt_raw_irq rirq;
+    uint32_t *auth_irq_bmp = d->arch.vintc->private;
+    unsigned int reg_num;
+
+    nirq = dt_number_of_irq(dev);
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
+        res = dt_device_get_raw_irq(dev, i, &rirq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        /*
+         * Don't map IRQ that have no physical meaning
+         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
+         */
+        if ( rirq.controller != dt_interrupt_controller )
+        {
+            dt_dprintk("irq %u not connected to primary controller."
+                       "Connected to %s\n", i,
+                       dt_node_full_name(rirq.controller));
+            continue;
+        }
+
+        irq = platform_get_irq(dev, i);
+        if ( irq < 0 )
+        {
+            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
+            return irq;
+        }
+
+        res = irq_permit_access(d, irq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
+                   irq);
+            return res;
+        }
+
+        reg_num = irq / APLIC_NUM_REGS;
+
+        if ( is_irq_shared_among_domains(d, irq) )
+        {
+            printk("%s: Shared IRQ isn't supported\n", __func__);
+            return -EINVAL;
+        }
+
+        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
+
+        dt_dprintk("  - IRQ: %u\n", irq);
+
+        if ( irq_ranges )
+        {
+            res = rangeset_add_singleton(irq_ranges, irq);
+            if ( res )
+                return res;
+        }
+    }
+
+    return 0;
+}
+
 static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
 {
     int rc = 0;
@@ -34,6 +142,7 @@ static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
 
 static const struct vintc_ops vaplic_ops = {
     .vcpu_init = vcpu_vaplic_init,
+    .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
 };
 
 static struct vintc * __init vaplic_alloc(void)
@@ -62,13 +171,26 @@ int __init domain_vaplic_init(struct domain *d)
     to_vaplic(d->arch.vintc)->regs.domaincfg =
         APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
 
+    d->arch.vintc->private = xvzalloc(struct vaplic_priv);
+    if ( !d->arch.vintc->private )
+    {
+        ret = -ENOMEM;
+        goto fail;
+    }
+
+    return ret;
+
  fail:
+    domain_vaplic_deinit(d);
+
     return ret;
 }
 
 void __init domain_vaplic_deinit(struct domain *d)
 {
-    struct vaplic *vaplic = to_vaplic(d->arch.vintc);
+    struct vintc *vintc = d->arch.vintc;
+    struct vaplic *vaplic = to_vaplic(vintc);
 
+    XVFREE(vintc->private);
     XVFREE(vaplic);
 }
-- 
2.53.0


