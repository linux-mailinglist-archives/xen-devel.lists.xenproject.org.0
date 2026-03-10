Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNc7GE5QsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BCB255493
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250393.1547934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aC-0003iD-Nu; Tue, 10 Mar 2026 17:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250393.1547934; Tue, 10 Mar 2026 17:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aC-0003aq-Dr; Tue, 10 Mar 2026 17:09:24 +0000
Received: by outflank-mailman (input) for mailman id 1250393;
 Tue, 10 Mar 2026 17:09:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aA-0001Q4-OC
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:22 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d78722-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:22 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso1342825e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:22 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:20 -0700 (PDT)
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
X-Inumbo-ID: e1d78722-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162561; x=1773767361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/11lx8z8RjsX/40S39HnVeCzAcwg/3pYH5ySRoyED38=;
        b=IDEcmZtXox9yFNvqonGXK66GEwZ8hOgVJ9ldECm3HF4HnrcKAgCD9bQmbt3NkejLKz
         sdFTs8eZiSibYdmsemV+yd3LbUtbquVV0uhXKNNr5IzLy96CiONXz0RhV1mwz9vX2AIF
         DhAlhQRlKXlxBCX3L5BZxIUZuRKor3XEdBcdluvtcCMMQZRUKRirgzBX0WyXogatKA6d
         O7bl9YlQnGHvDSfQk9QPAyJzHi42BjFUZyUodtQjDhGDftXTMRr4zer/tM3cizD6Ic3B
         EAvnKxaWS9KD5L5E9/7556H+gqzMUraDv7bxFDeI4EIffLzLJHEvKYowo/j/MiTe41LC
         UT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162561; x=1773767361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/11lx8z8RjsX/40S39HnVeCzAcwg/3pYH5ySRoyED38=;
        b=CRWfW/Tcqf/4O5n2z+vdGd1EkJFoj8ETzqQbFzza6bwNM3aqLmviiGzY2RYWqfZkkf
         GLWGV9trwy0j8leNeGBog4UN9k40FWxssMLCPbQmcmW+5Q3TLuVIxTgvYwJGlgHylpPZ
         QZZEE7qUEFiX0qpZ+G7PgsADv5brc5deqM0N8dpS6TUU1QQnkCuDhsLDei36/9z9aibr
         /FgH0hpGtMaBGsL+GwAz8EQNJ89NzCodqSuDq48zM4dmvjZLXm/NeOFZ2r+T4lnOAtXy
         n91DNHgaYVrlH+hjlJA/+pPgIQgfcm8Nr74a40LH60XJr2pCh9c6rpcRF1mH3q62MCE3
         29FA==
X-Gm-Message-State: AOJu0YxUvUYQEm0bOtzuO/LFtNmbjerprvL+cciWT2P8z/7gH9UcvFuE
	TUa8Qi85CIKk7wEZmux4iQlyB+ZdYRuwzCjJn+i+qeWEDIKi4LQ2bu/N6qd9kSJ6
X-Gm-Gg: ATEYQzywI2CmxGHr/bRg7Gg9HwC2JEqO8WXqrWQxtdbq+5iJNW69pAd9Cnwh8XShtxj
	3tXTXLtiBaDYNLDIbepkJUirpMOnL8DRhb+c21uGU8Syed0l+hDnIcrFoMAq9HlADFSa+umo7/B
	E2XozrkjJb+cMLIbAV4WS1f39b4+T+n4JdJ8EY1a2Tq4LtYi2PFvRpy948/gmI03DJFirkzTXW3
	A+biSlWWcxlUcgdtOZQva7QIhZAZyQDziR2M5wXRJfDFlvEp+/5tTB0UPUA57GDNsSRQUYeqFW0
	nPAW9inxFGfgJT1YwOLyrSJg04TwrUSAgACVu2lX/15j+tgkvVNGOcpClbE+Ot525Ttbo+qt+l4
	o0sPn01xr9j6IrgCbSt/RgSur75MY8L4qadCvenwoEH6vDWJeYhW6cIFIbj5gtv6CfzF5Tno4YB
	W563V8QHfqyO4eEYGe/oTXnw4TILIoiJs5ZPkRW0uX6piMjZ91ewfdmlD3lr58OpNPvC46qQ==
X-Received: by 2002:a05:600c:468b:b0:47e:e981:78b4 with SMTP id 5b1f17b1804b1-48541a00b6fmr69385575e9.12.1773162561036;
        Tue, 10 Mar 2026 10:09:21 -0700 (PDT)
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
Subject: [PATCH v1 10/27] xen/riscv: generate IMSIC DT node for guest domains
Date: Tue, 10 Mar 2026 18:08:43 +0100
Message-ID: <8154eae081d14da89f27bad581270cc5bba6ccfc.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D2BCB255493
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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

Guests using the IMSIC interrupt controller require a corresponding
Device Tree description. Add support for generating an IMSIC node when
building the guest DT.

Keep a reference to the host IMSIC DT node and reuse its compatible
property while constructing the guest-visible node. The generated node
contains guest-specific information such as the MMIO region sized for
the number of vCPUs and the interrupts-extended property referencing
per-vCPU interrupt controllers.

This allows guests to discover and use the IMSIC interrupt controller.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/imsic.c             | 113 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |   7 ++
 2 files changed, 120 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index a4460576f620..0956b187705f 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -13,8 +13,11 @@
 #include <xen/const.h>
 #include <xen/cpumask.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
@@ -329,6 +332,8 @@ int __init imsic_init(const struct dt_device_node *node)
     struct imsic_mmios *mmios;
     struct imsic_msi *msi = NULL;
 
+    imsic_cfg.host_node = node;
+
     /* Parse IMSIC node */
     rc = imsic_parse_node(node, &nr_parent_irqs, &nr_mmios);
     /*
@@ -487,3 +492,111 @@ int __init imsic_init(const struct dt_device_node *node)
 
     return rc;
 }
+
+static int __init imsic_make_reg_property(struct domain *d, void *fdt)
+{
+    __be32 regs[4];
+
+    regs[0] = cpu_to_be32(imsic_cfg.base_addr >> 32);
+    regs[1] = cpu_to_be32(imsic_cfg.base_addr);
+    regs[2] = cpu_to_be32((IMSIC_MMIO_PAGE_SZ * d->max_vcpus) >> 32);
+    regs[3] = cpu_to_be32(IMSIC_MMIO_PAGE_SZ * d->max_vcpus);
+
+    return fdt_property(fdt, "reg", regs, sizeof(regs));
+}
+
+static int __init imsic_set_interrupt_extended_prop(struct domain *d,
+                                                    void *fdt)
+{
+    uint32_t len = 0, pos = 0, cpu, phandle;
+    uint32_t *irq_ext;
+    char buf[64];
+    int res;
+
+    irq_ext = xvzalloc_array(uint32_t, d->max_vcpus * 2);
+    if ( !irq_ext )
+        return -ENOMEM;
+
+    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
+        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
+
+        if ( phandle <= 0 )
+            return phandle;
+
+        irq_ext[pos++] = cpu_to_be32(phandle);
+        len += sizeof(uint32_t);
+        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
+        len += sizeof(uint32_t);
+    }
+
+    res = fdt_property(fdt, "interrupts-extended", irq_ext, len);
+
+    XVFREE(irq_ext);
+
+    return res;
+}
+
+int __init imsic_make_dt_node(const struct kernel_info *kinfo)
+{
+    uint32_t len;
+    const void *data = NULL;
+    int res = 0;
+    void *fdt = kinfo->fdt;
+    const struct dt_device_node *host_imsic_node = imsic_cfg.host_node;
+    uint32_t *next_phandle = &kinfo->bd.d->arch.next_phandle;
+
+    res = fdt_begin_node(fdt, host_imsic_node->full_name);
+    if ( res )
+        return res;
+
+    data = dt_get_property(host_imsic_node, "compatible", &len);
+    if ( !data )
+    {
+        printk(XENLOG_ERR "%s: Can't find 'compatible' property\n",
+               host_imsic_node->full_name);
+
+        return -ENOENT;
+    }
+
+    res = fdt_property(fdt, "compatible", data, len);
+    if ( res )
+        return res;
+
+    res = imsic_make_reg_property(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = imsic_set_interrupt_extended_prop(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "riscv,num-ids", imsic_cfg.nr_ids);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "msi-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "#msi-cells", 0);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "#interrupt-cells", 0);
+    if ( res )
+        return res;
+
+    imsic_cfg.phandle = (*next_phandle)++;
+
+    res = fdt_property_cell(fdt, "phandle", imsic_cfg.phandle);
+    if ( res )
+        return res;
+
+    return fdt_end_node(fdt);
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index c6c59215df20..a63d56fbd5d9 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -57,11 +57,16 @@ struct imsic_config {
     /* MSI */
     const struct imsic_msi *msi;
 
+    /* DT node of IMSIC */
+    const struct dt_device_node *host_node;
+
     /* Lock to protect access to IMSIC's stuff */
     spinlock_t lock;
 };
 
 struct dt_device_node;
+struct kernel_info;
+
 int imsic_init(const struct dt_device_node *node);
 
 const struct imsic_config *imsic_get_config(void);
@@ -71,4 +76,6 @@ void imsic_irq_disable(unsigned int hwirq);
 
 void imsic_ids_local_delivery(bool enable);
 
+int imsic_make_dt_node(const struct kernel_info *kinfo);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.53.0


