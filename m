Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R1RON8bQS2owawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:59:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81592712EF7
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:59:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=R96QsvSA;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355536.1610425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglie-0003uq-75; Mon, 06 Jul 2026 15:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355536.1610425; Mon, 06 Jul 2026 15:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglid-0003di-8i; Mon, 06 Jul 2026 15:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1355536;
 Mon, 06 Jul 2026 15:58:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliX-0002cM-By
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliW-00AcWu-Lk
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b2-bab6-0a2a0a5309dd-0a2a45029ce2-12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:44 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b4-5a27-0a2a45020019-d155802ac031-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:44 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493d3135f62so11376875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:44 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353524; x=1783958324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hkhMYTJKPM49ZEEfJBa6VK+y/dGsOiFIcDLfi+stU0=;
        b=R96QsvSAZOs9WHEYW2wjikor/ZoVVidqEoWaHjWBzWSFZeR5bIqBrAHn5albQsjvrW
         WTO7eKuARi3KBdWRUsaXvn/bPSajIhgiJE9PkS4a+cfjz/G+NxHxuT1vQvoGutLxixt1
         BkibH5mQ37KBZjZODnSQ0z7fcxXZnjK9W0yuP0iiTjEexUlPgF50vrbUB8pg+UDevyFY
         WYQuZ62yyiNb074Jo5FO/rVNs40gYRjtYtn9u85pHLrgrGpsiwDe61wZKuQeCG+V3lv8
         y4voyQFlnI1JKEnDH9A363uYJ3PTVc4SBC6b5Wi0QoFG+l5DTLWO3rgNzPE5YoR1Umk5
         X13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353524; x=1783958324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hkhMYTJKPM49ZEEfJBa6VK+y/dGsOiFIcDLfi+stU0=;
        b=G3peeIxPSk175/+SK6KowJglpHoLRIbhB7tDaTFD10qBQiQrU1KW/uNAOOFnWvsgzW
         FJxGHf8rKdwX9PScWR9WDM2Ezb0SyL0oSGlpUGyYBC70NfFarkerlQyxsOFgGBfTDkkF
         aFayab0uLnZANHYvg4TKMaJSIzuD5OC+zjMQQIg3yyKzHS+lnDbvOPq2lBvFjPvynvhj
         tKCjFPfgyP+o7xCD6LyhPIy/Ja3210Jj0zziWb1l4GT4U4g3RWZsAxAoOHSGaT7jBGud
         JnVKCtvA+ZoV8tWUAapzeWRSE1jv19XYtfQm3ee1NwJ1DSxe5Ol7io5gBKuR3ZBm7WOm
         O6Og==
X-Gm-Message-State: AOJu0YxZAj/OKavNi3Y+xwJkHf+zRcvgMue0N6bENY+s9c2fnsaOVb+Z
	uStsdyL9OQYbphFGLs100yXcJkig3q28icTSZFBGdjk7Gi2LN0tuo7GDcxaATw==
X-Gm-Gg: AfdE7cnu5m0E+pWdjIyHx2bk4yZnu1WPakat+owGC/YQCbdfPHH2CoD813PWwRS4Ujt
	GTApQ5fvTLDH4ENp/Z+ebr0jQtjnUmKvyb2aIFiDfZjtJv3dFOYbHFTii3pbqLvlsgRkXMQ+0Cf
	UK/jN/P9JEfJfmSUQ5u4tYPw1HNDOaBtlXwJPFXKuU2QckjTu0jodZXSHNTAlQlVSioWnnMUZ17
	Uv+7crd8nlZ3K72AsV3PTdKm6s0Zn5LZAu2Y3hUKQSUWHHgzmvim1JHDv9Yqx9t+E280Zy2pAwJ
	f34HPUyZPmqAPBzRhlqIU+OOB+PpvTAuEU6gH6G/JPZuaIAmsN3Ck5NqCXqAMzTpnzxvTqGauGQ
	7RVKPWD6UMNX83C4jXShPlhfxdwJR+Eg3HO5QsqHwe01MFLQC6qxOooaTQS3b8wQs6g+BzWa6Wt
	BDOyyoIz36wYarDZ7WVssjQ/3QcQrn4MebhCwRxVCLZjqATqWeQj7p0wl09g==
X-Received: by 2002:a05:600c:584c:b0:493:df11:eab4 with SMTP id 5b1f17b1804b1-493df11ebcdmr9153605e9.8.1783353523915;
        Mon, 06 Jul 2026 08:58:43 -0700 (PDT)
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
Subject: [PATCH v5 19/26] xen/riscv: generate IMSIC DT node for guest domains
Date: Mon,  6 Jul 2026 17:58:00 +0200
Message-ID: <7af5bcc9ef818926f02244f5d566541da06a0a16.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783353524-5491A7C5-89C5769C/10/73395122804
X-purgate-type: spam
X-purgate-size: 10372
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,microchip.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81592712EF7

Guests using the IMSIC interrupt controller require a corresponding
Device Tree description.

Add support for generating an IMSIC node when building the guest DT.
This allows guests to discover and use the IMSIC interrupt controller.

The value choosen for GUEST_IMSIC_S_BASE is an address which is typically
used for IMSIC and QEMU.

DT-building functions are marked __init because domain creation happens at
boot time, before the init sections are freed. In a typical deployment
libxl creates the interrupt controller node in userspace and hands the
complete FDT to Xen, so these functions are only called during early
domain construction.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - s/GUEST_IMSIC_NUM_MSIS/GUEST_IMSIC_MAX_MSIS throughout.
 - Changed __read_mostly → __ro_after_init on guest_num_msis, since the value
   is set once during __init and never again.
 - Made imsic_parse_node() __init.
 - Moved the min(GUEST_IMSIC_MAX_MSIS, ...) cap into imsic_parse_node() right
   after guest_num_msis is assigned, so the bound is applied once at init
   time rather than on every DT node construction call.
 - Removed the now-unnecessary num_msis local variable from
   vimsic_make_domu_dt_node(); guest_num_msis is used directly.
 - s/snprintf(buf, sizeof(buf), ...)/snprintf(buf, ARRAY_SIZE(buf), ...)
   in guest_imsic_set_interrupt_extended_prop().
 - Added decl. of vimsic_make_domu_dt_node() in this patch instead of next.
---
Changes in v4:
 - Add a comment for guest_num_msis explaining that it is host-dependent
   and therefore identical for every domain, which is why a single global
   is used instead of a per-domain value.
 - Reduce vimsic_name[] from 128 to 32 bytes, which is enough to hold
   "/soc/imsic@" plus a 64-bit hex address.
 - Add a comment before GUEST_IMSIC_S_BASE noting that the value is the
   address typically used for IMSIC by QEMU.
 - s/__ULL/_UL for defintion of GUEST_IMSIC_S_BASE.
---
Changes in v3:
 - s/__ro_after_init/__read_mostly for guest_num_msis.
 - Use IMSIC_MAX_ID as default for guest_num_msis instead of imsic_cfg.nr_ids.
 - Drop base_addr local variable in guest_imsic_make_reg_property(); use
   GUEST_IMSIC_S_BASE directly and introduce size to avoid spelling
   IMSIC_MMIO_PAGE_SZ * d->max_vcpus twice.
 - Change irq_ext type from uint32_t * to __be32 * in
   guest_imsic_set_interrupt_extended_prop().
 - Move phandle declaration into the loop body.
 - Extend commit message to explain why __init is used for DT-building
   functions: libxl creates the interrupt controller node before handing
   the FDT to Xen, so these functions are only invoked during boot-time
   domain construction.
 - Re-order patch before APLIC DT node creation patch.
 - Update commit message.
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
---
 xen/arch/riscv/imsic.c                    | 144 +++++++++++++++++++++-
 xen/arch/riscv/include/asm/guest-layout.h |   6 +
 xen/arch/riscv/include/asm/imsic.h        |   3 +
 3 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 5a5758e45dc2..8966362fb149 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -13,8 +13,12 @@
 #include <xen/const.h>
 #include <xen/cpumask.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
@@ -34,6 +38,21 @@ static struct imsic_config imsic_cfg = {
     .lock = SPIN_LOCK_UNLOCKED,
 };
 
+/*
+ * Number of MSIs available to a guest. Determined by the host interrupt
+ * controller, so it is identical for every domain -- hence a single global
+ * rather than a per-domain value.
+ */
+static unsigned int __ro_after_init guest_num_msis;
+
+#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
+
+/*
+ * Value is inspired by what QEMU is using for riscv,num-ids property for IMSIC
+ * node.
+ */
+#define GUEST_IMSIC_MAX_MSIS 255
+
 #define IMSIC_DISABLE_EIDELIVERY    0
 #define IMSIC_ENABLE_EIDELIVERY     1
 #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -182,7 +201,7 @@ static int __init imsic_get_parent_hartid(const struct dt_device_node *node,
  * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
  * which should be ignored by the hypervisor.
  */
-static int imsic_parse_node(const struct dt_device_node *node,
+static int __init imsic_parse_node(const struct dt_device_node *node,
                             unsigned int *nr_parent_irqs,
                             unsigned int *nr_mmios)
 {
@@ -285,6 +304,13 @@ static int imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
+        guest_num_msis = tmp;
+    else
+        guest_num_msis = IMSIC_MAX_ID;
+
+    guest_num_msis = min(GUEST_IMSIC_MAX_MSIS + 0U, guest_num_msis);
+
     if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
          (imsic_cfg.nr_ids > IMSIC_MAX_ID) )
     {
@@ -522,3 +548,119 @@ int __init imsic_init(const struct dt_device_node *node)
 
     return rc;
 }
+
+static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
+{
+    paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
+    __be32 regs[4] = {
+        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
+        cpu_to_be32(GUEST_IMSIC_S_BASE),
+        cpu_to_be32(size >> 32),
+        cpu_to_be32(size),
+    };
+
+    return fdt_property(fdt, "reg", regs, sizeof(regs));
+}
+
+static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
+                                                          void *fdt)
+{
+    unsigned int cpu, pos = 0;
+    __be32 *irq_ext;
+    int res;
+
+    irq_ext = xvzalloc_array(__be32, d->max_vcpus * 2);
+    if ( !irq_ext )
+        return -ENOMEM;
+
+    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        char buf[64];
+        uint32_t phandle;
+
+        snprintf(buf, ARRAY_SIZE(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
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
+int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
+                                    unsigned int *phandle)
+{
+    int res;
+    void *fdt = kinfo->fdt;
+    char vimsic_name[32];
+    unsigned int vimsic_phandle;
+    res = snprintf(vimsic_name, sizeof(vimsic_name), "/soc/imsic@%lx",
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
+    res = fdt_property_u32(fdt, "riscv,num-ids", guest_num_msis);
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
+}
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 68d95a09394c..5e566450bdfa 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,12 @@
 
 #include <public/xen.h>
 
+/*
+ * Base address of the guest's supervisor-mode IMSIC. The value is the address
+ * typically used for IMSIC by QEMU.
+ */
+#define GUEST_IMSIC_S_BASE _UL(0x28000000)
+
 #define GUEST_RAM_BANKS   2
 
 /*
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index e2c413487d24..e1ec3d03c4e9 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -78,6 +78,7 @@ struct vimsic_state {
 };
 
 struct dt_device_node;
+struct kernel_info;
 struct vcpu;
 
 int imsic_init(const struct dt_device_node *node);
@@ -93,4 +94,6 @@ int vcpu_imsic_init(struct vcpu *v);
 void vcpu_imsic_deinit(struct vcpu *v);
 unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
+int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.54.0


