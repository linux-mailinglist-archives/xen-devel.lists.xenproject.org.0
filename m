Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u2H8JgufPmoZJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8B6CEA53
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lYWtz1rQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346297.1604875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lu-0005KI-U2; Fri, 26 Jun 2026 15:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346297.1604875; Fri, 26 Jun 2026 15:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lt-0004w8-Fq; Fri, 26 Jun 2026 15:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1346297;
 Fri, 26 Jun 2026 15:47:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lm-0003uT-OC
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lm-00D1eP-3W
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eeb-5cb7-0a2a0a5109dd-0a2a4508b62c-12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:06 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef9-edec-0a2a45080019-d155d0a9dce3-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:05 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3997a448ecbso12138071fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:05 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488825; x=1783093625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys49SiCuwqKT2WlVxYaggJAPMz33LKatvfN3jVmdVs4=;
        b=lYWtz1rQ/+MA3NKJJi6GZk8A1qQsITtXfPNrrDvQbHk9dQUqh5iMpUzOtsgFsJQL9u
         F/q/7Briv7jpKuPUEA4BQxwxPdd8XL1zf3bEkX4+QYvuFdKzGQP9ze4wpOG4afxixu9L
         QyyA4VoU+dCzXj7sMKm3o3XbK7YIBDm0tq8zwz0SfYls3FLm1CCPwRqLQU9SBq/A/tr3
         fnrWhUfKtjBdoT5zUiENQdxrYQ7ISurxvul3tVy4V8MiMyXGnFq36p1o+JGEnahxKlv+
         f7URirX0JM/URJgKoEyXuJ+eyUW9mdUQppYi4eFIyxpSYRACvg3XXm5sqje+2TEDZqm8
         QBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488825; x=1783093625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ys49SiCuwqKT2WlVxYaggJAPMz33LKatvfN3jVmdVs4=;
        b=fptCSNVquGQaHCJXbkw6vWAMV6wWA08av5g5kfO7WVkRLYpyTAIKabEVQ+Z0EkAcfJ
         owejmU+jdW1ywpZJ9y/bV+rgUQINc69pC8Ov6jyAxtoL4OBePmZyeTwD4mtOChfDxCF1
         rPh8sTdFpyM3AjYazN0YZ59vLsaSa64Qf5DcBNDwY7fiKFIB5biXI1J8QP5KzXts/3Kw
         j2/943Efc6cEdNPWRB34G6kUz9usaIBnDwiGYNq5cokkODAVONh+igOpIhcvjXd4MDqE
         1LzdR3KLebAclM/WSF3z/5+ebbAinejZVkgHgAVlUNodyOs4uNx7ef7vbRv9RZH1Sh/j
         RYww==
X-Gm-Message-State: AOJu0Yy7h2Rlc8Z6fRtnhGAb/KWotp6Tv99r1/NDcPSnXDCNaSOBr+Mo
	TmPtrV/O6Fr6r9TS1pbKpKjV71w6aZ+Kuhwcsqm36CNQ/pxRReFRRMJ7wAYYsw==
X-Gm-Gg: AfdE7cmUIRQZr/0z44kUgRTYAmdhPNRCN853uXnFIhzvWjADI3IGrG850S/VfV6OxuI
	9WDfz+U30Fq4Ycx7MxQ7z8x9Po27pbUgvimWP7ixnNPNnsdc9VdLOMIc9cOA+dKLqtSeYBMgn6o
	sgAvlXNFTJw5gwghFZRSKhYA5vqfhAafzodVFGrbBXATGr3q+z+OhAWH0BAOg1dEA3EQzv952Ab
	gewLQWicbXK5UW0IdguZEA72cMEgbJ6IMr/cJ0t72GOKNrmaxdjas9rY963JtTewsZpr4Pv4Z5L
	fSzxII1kp2kTShjQaw1ufrB5prnGie+6AnyxUjj3DRXzPTeg8J4zF7J7YjEu14cMxaEwvmESNPx
	u04sTOUolBXsSDah8s22+wLaQ14rZ3gVjzE1rOmkopVIKDapL92QZQn7V1mzRcCKF+szT9I6djR
	UIpUk4hT0eu4jP81R8ollfPXFgXObInbOz5PQWOU/2WY8a2W2tva+qoKyzazWue7jygVTm
X-Received: by 2002:ac2:5695:0:b0:5ae:a9ec:9fc2 with SMTP id 2adb3069b0e04-5aea9eca34bmr132674e87.61.1782488824963;
        Fri, 26 Jun 2026 08:47:04 -0700 (PDT)
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
Subject: [PATCH v4 20/25] xen/riscv: create APLIC DT node for guest domains
Date: Fri, 26 Jun 2026 17:46:29 +0200
Message-ID: <2bab716741ae436c7b92989d7613dac620166b89.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782488825-431393FC-1AC0C4EF/10/73395122804
X-purgate-type: spam
X-purgate-size: 7584
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email];
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
X-Rspamd-Queue-Id: 4DB8B6CEA53

Guests require a Device Tree description of the interrupt controller
topology. Add support for creating an APLIC node when building the
guest DT.

Provide stub for imsic_make_dt_node() it will be introduced properly
in follow-up patch.

The value chosen for GUEST_APLIC_S_BASE is based on QEMU one.

DT-building functions are marked __init because domain creation happens at
boot time, before the init sections are freed. In a typical deployment
libxl creates the interrupt controller node in userspace and hands the
complete FDT to Xen, so these functions are only called during early
domain construction.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Drop spurious <xen/fdt-kernel.h> and <xen/libfdt/libfdt.h> includes from
   aplic.c (mistakenly added, they belong to vaplic.c).
 - Reduce vaplic_name[] from 128 to 32 bytes in vaplic_make_domu_dt_node().
 - Use __initconstrel (with const) for init_ops instead of __initdata.
 - s/__ULL/_UL for defintion of GUEST_APLIC_S_BASE.
---
Changes in v3:
 - Fix rebase conflicts becuase of this patch is reordered after IMSIC DT
   node creation is intoduced.
 - Update the commit message.
 - Move initialization of domaincfg with APLIC_DOMAINCFG_RO80 from this
   patch to earlier.
 - Change paddr_t aplic_size to unsigned int in vaplic_make_domu_dt_node()
   and replace the UB (after it started to be uint) aplic_size >> 32 with
   an explicit 0 in the DT reg property.
 - Add BUILD_BUG_ON() to be sure that aplic size isn't bigger then
   UINT32_MAX.
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
---
 xen/arch/riscv/include/asm/aplic.h        |  8 +++
 xen/arch/riscv/include/asm/guest-layout.h |  6 ++
 xen/arch/riscv/include/asm/imsic.h        |  3 +
 xen/arch/riscv/vaplic.c                   | 76 +++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 2e606b8cd947..3d870fbfb387 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -30,6 +30,14 @@
 
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
index 5e566450bdfa..90603f06bb91 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,12 @@
 
 #include <public/xen.h>
 
+/*
+ * Base address of the guest's supervisor-mode APLIC. The value is the address
+ * typically used for APLIC by QEMU.
+ */
+#define GUEST_APLIC_S_BASE _UL(0xd000000)
+
 /*
  * Base address of the guest's supervisor-mode IMSIC. The value is the address
  * typically used for IMSIC by QEMU.
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
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 6562b25f0abb..6e409d9b732b 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -9,6 +9,8 @@
  */
 
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
@@ -19,6 +21,11 @@
 
 #include "aplic-priv.h"
 
+#define VAPLIC_COMPATIBLE "riscv,aplic"
+#define VAPLIC_NUM_SOURCES 96
+
+#define FDT_VAPLIC_INT_CELLS 2
+
 static int cf_check vaplic_init(struct vcpu *v)
 {
     return vcpu_imsic_init(v);
@@ -29,6 +36,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
     return vcpu_imsic_deinit(v);
 }
 
+static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
+{
+    struct domain *d = kinfo->bd.d;
+    int res = 0;
+    void *fdt = kinfo->fdt;
+    unsigned int msi_parent_phandle;
+    char vaplic_name[32];
+    unsigned int aplic_size = APLIC_SIZE(d->max_vcpus);
+    const __be32 reg[] = {
+        cpu_to_be32(GUEST_APLIC_S_BASE >> 32),
+        cpu_to_be32(GUEST_APLIC_S_BASE),
+        cpu_to_be32(0),
+        cpu_to_be32(aplic_size),
+    };
+
+    BUILD_BUG_ON(APLIC_SIZE(MAX_VIRT_CPUS) > UINT_MAX);
+
+    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%lx",
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
+    res = fdt_property_cell(fdt, "riscv,num-sources", VAPLIC_NUM_SOURCES);
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
+static const struct vintc_init_ops __initconstrel init_ops = {
+    .make_domu_dt_node = vaplic_make_domu_dt_node,
+};
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vaplic_init,
     .vcpu_deinit = vaplic_deinit,
@@ -43,6 +118,7 @@ int domain_vaplic_init(struct domain *d)
 
     d->arch.vintc = &vaplic->vintc;
     d->arch.vintc->ops = &vintc_ops;
+    d->arch.vintc->init_ops = &init_ops;
 
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
                              APLIC_DOMAINCFG_RO;
-- 
2.54.0


