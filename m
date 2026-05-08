Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K8yGMT2/WlklQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38294F7FDE
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303779.1577132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQz-0001Xx-6u; Fri, 08 May 2026 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303779.1577132; Fri, 08 May 2026 14:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQx-0001CY-Td; Fri, 08 May 2026 14:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1303779;
 Fri, 08 May 2026 14:44:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQu-0000aQ-1v
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQr-00EpjT-SV
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a1-5cb7-0a2a0a5109dd-0a2a45099a12-26
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:03 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b3-2497-0a2a45090019-d155da30d93b-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:03 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ba922426c5cso360181966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:03 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251443; x=1778856243; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdHgAmxa9TAuJ8tlbnhJVK2QTauqFg/eA/dC2/C92Fo=;
        b=lUi4M03ai6Waz6bPwHVWmq8stMKR+OPiMosBxSRdahXXQvt7xvvFd2bfEYdktuosBd
         UV71BCT/w8MQ2IlxyP2tcMzmjJ0QpYUC8fdsET62psP5X/noNwd/g8Tulr9p1JKlLQb9
         20lOEktc4glKsI/9bgHcPigQtsHpLUv+Vn7z8Ic3WUq6ZF7K/z5ep9TaP755w+rFEAiX
         0z0tRmgjvzU99O+pw0y1hF8BUmfakFcsZ+jtU8ej2Sdml7KejoowqleXXytTu4lEjBEG
         6c1hKHfM0eZYASu9IGV3m7Gnhf6UdiBo0JfutzPdoAZOR8WSZi/3DXib6j1Mwzk1wSq0
         PS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251443; x=1778856243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kdHgAmxa9TAuJ8tlbnhJVK2QTauqFg/eA/dC2/C92Fo=;
        b=s7rzeNFiA0OtFiq0QJ6NbSjWb0TNmhRK2xYv+/9ScxfzICk3bZyX8ZRxaYpn+oUp8h
         2bg5gDErsm4hUwzxIOW+AWgvxp3HTe9xHLzxWyS1S3Opxpv2OhD92+Vo5EHINhJvn7n4
         lICDZwXLNG9akHhm2HImCLl/4A3wzpoC7sY/Iv7lkYe1DQNLD87dm/KqVAmTXTFUlb37
         Q5z4qVpWroVaAIdzDRNp2Jk106LmfLtVmd3AmPDnaoQ+0tqf5syTyjrVPzGVGfH1kXWT
         USD8m594+soKasaXvwat20r5Ay/s2FyJji/2Kl30IF//iqFUhgsrxqhQltaHJBGW1kHi
         Qn0g==
X-Gm-Message-State: AOJu0YzlJJv+qmeu5S+YSNRswsZrtXQnB2p1VDHRIt3cSVbdj2ZPAuFl
	xse6aU8Sdmc5CfQ8cdeRHOvibywek2QAEFalXS9HQWExTdwN5kW9tIegCAsLkQ==
X-Gm-Gg: AeBDieuALeSIIBPKv3ubOeINYN6mnr/saJ2qDPwLt267uATofhSh8IMgXJ+RnBSVx0v
	nu0J+4V+F1kN5O2jejMN12sDS80sGJHiVT4ZyL/FS/nsXB6ONu+RjYIRzgeJt0TwxtaRFaKspwe
	lVeBy13LaAdYl+Oeps8xrTltEvn+GLDIADrUvoVNnIkJjcpA40ajix4inelgzT2rCiYYZo1Yk+B
	PXBOMIkKheMF2VeLPB8WiW/U9uS6PR3obVNWiHWHdCPLAnwOPjS2UF7qqr+bjkLqa3V4IB83VIO
	L2E+qnHbsIvecAd9qbt3/fxDa8avjP3fh8WaqdXYSbdEb0R6pkuC4h+jXWxqTA3CuD1k7kZcjcg
	gauFevCsF52TDR/XFgNDejoNpWBuJv3uPeuaACRWpqQPRDkb6N+QwV3Y+/TiU//eYSWyqdgg/9U
	41eTda6Af59sWxfst1dZI4WC4L4DvsqERXHT9I6aEGYuj3OqjAlHBmH8vp44KH/bJ0Uw==
X-Received: by 2002:a17:906:2081:b0:bc6:1c2:ee46 with SMTP id a640c23a62f3a-bc601c30305mr502420866b.11.1778251442014;
        Fri, 08 May 2026 07:44:02 -0700 (PDT)
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
Subject: [PATCH v2 17/26] xen/riscv: generate IMSIC DT node for guest domains
Date: Fri,  8 May 2026 16:43:19 +0200
Message-ID: <19d30d3c34a6ac9aeb668e1fc56301620b177db0.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778251443-3757BA53-99CF7F8C/10/73395122804
X-purgate-type: spam
X-purgate-size: 6281
X-Rspamd-Queue-Id: F38294F7FDE
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
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Guests using the IMSIC interrupt controller require a corresponding
Device Tree description.

Add support for generating an IMSIC node when building the guest DT.
This allows guests to discover and use the IMSIC interrupt controller.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/imsic_make_reg_property/guest_imsic_make_reg_property.
 - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
 - Use initalizer for regs[] array in imsic_make_reg_property().
 - Move buf[] insde the for() loop.
 - Correct check of returned phandle.
 - Drop local variable len.
 - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
 - Drop initializer for local variable data.
 - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
 - Drop next_phandle as it is now in common code.
 - Introduce vcpu_imsic_deinit.
 - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
---
 xen/arch/riscv/imsic.c                    | 127 +++++++++++++++++++++-
 xen/arch/riscv/include/asm/guest-layout.h |   2 +
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index ceea6778d9dc..19cbacdf96e1 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -13,9 +13,12 @@
 #include <xen/const.h>
 #include <xen/cpumask.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
@@ -35,6 +38,11 @@ static struct imsic_config imsic_cfg = {
     .lock = SPIN_LOCK_UNLOCKED,
 };
 
+static unsigned int __ro_after_init guest_num_msis;
+
+#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
+#define GUEST_IMSIC_NUM_MSIS 255
+
 #define IMSIC_DISABLE_EIDELIVERY    0
 #define IMSIC_ENABLE_EIDELIVERY     1
 #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -291,6 +299,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
+        guest_num_msis = tmp;
+    else
+        guest_num_msis = imsic_cfg.nr_ids;
+
     if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
          (imsic_cfg.nr_ids > IMSIC_MAX_ID) )
     {
@@ -524,8 +537,120 @@ int __init imsic_init(const struct dt_device_node *node)
     return rc;
 }
 
+static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
+{
+    paddr_t base_addr = GUEST_IMSIC_S_BASE;
+    __be32 regs[4] = {
+        cpu_to_be32(base_addr >> 32),
+        cpu_to_be32(base_addr),
+        cpu_to_be32((IMSIC_MMIO_PAGE_SZ * d->max_vcpus) >> 32),
+        cpu_to_be32(IMSIC_MMIO_PAGE_SZ * d->max_vcpus),
+    };
+
+    return fdt_property(fdt, "reg", regs, sizeof(regs));
+}
+
+static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
+                                                          void *fdt)
+{
+    unsigned int cpu, pos = 0;
+    uint32_t phandle;
+    uint32_t *irq_ext;
+    int res;
+
+    irq_ext = xvzalloc_array(uint32_t, d->max_vcpus * 2);
+    if ( !irq_ext )
+        return -ENOMEM;
+
+    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        char buf[64];
+
+        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
+        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
+
+        if ( !phandle )
+        {
+            res = -ENODEV;
+            goto out;
+        }
+
+        irq_ext[pos++] = cpu_to_be32(phandle);
+        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
+    }
+
+    res = fdt_property(fdt, "interrupts-extended", irq_ext,
+                       d->max_vcpus * 2 * sizeof(*irq_ext));
+
+ out:
+    xvfree(irq_ext);
+
+    return res;
+}
+
 int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
                                     unsigned int *phandle)
 {
-    return -EOPNOTSUPP;
+    int res;
+    void *fdt = kinfo->fdt;
+    char vimsic_name[128];
+    unsigned int vimsic_phandle;
+    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
+
+    res = snprintf(vimsic_name, sizeof(vimsic_name), "/soc/imsic@%x",
+                   GUEST_IMSIC_S_BASE);
+    if ( res >= sizeof(vimsic_name) )
+    {
+        dprintk(XENLOG_DEBUG, "vimsic name is truncated\n");
+        return -ENOBUFS;
+    }
+
+    res = fdt_begin_node(fdt, vimsic_name);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", GUEST_IMSIC_COMPATIBLE);
+    if ( res )
+        return res;
+
+    res = guest_imsic_make_reg_property(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = guest_imsic_set_interrupt_extended_prop(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "riscv,num-ids", num_msis);
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
+    vimsic_phandle = alloc_phandle(kinfo);
+    if ( !vimsic_phandle )
+        return -EOVERFLOW;
+
+    res = fdt_property_cell(fdt, "phandle", vimsic_phandle);
+    if ( res )
+        return res;
+
+    if ( phandle )
+        *phandle = vimsic_phandle;
+
+    return fdt_end_node(fdt);
 }
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 9fc990c057f2..b16ec79c3786 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -5,6 +5,8 @@
 
 #define GUEST_APLIC_S_BASE 0xd000000
 
+#define GUEST_IMSIC_S_BASE 0x28000000
+
 #define GUEST_RAM_BANKS   2
 
 /*
-- 
2.54.0


