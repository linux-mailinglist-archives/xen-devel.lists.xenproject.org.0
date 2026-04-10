Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NQ0A3kd2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868D3D9E4A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279424.1563903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECX-00008A-QR; Fri, 10 Apr 2026 15:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279424.1563903; Fri, 10 Apr 2026 15:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECX-0008VC-KN; Fri, 10 Apr 2026 15:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1279424;
 Fri, 10 Apr 2026 15:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECW-0008KK-Hl
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECV-00DRfX-Tj
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d67-5cb7-0a2a0a5109dd-0a2a450a9f28-6
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:19 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d67-ee98-0a2a450a0019-d155802cbde7-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:19 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488b0046078so22060005e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:19 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836519; x=1776441319; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djlyIF5R+CWEfFCif4JaIJrt1D+sAomgl/JLYjj3hDI=;
        b=MzwOTpZyxdQMxkyKRB+s4Eahz7Bn4RaUQupeQYnbX6nkmnGD89O6OU6vRGiHhXH15D
         bBGhMmkqZK/egAssnZQG77rOcT3ZiwQIrQewqVFH+XLQ5wVJlRPdXfB/tI07oc6pLv4r
         e9qzu4ZIUnVOvpHZ4unDMnjk0S5u9/NUrRLjkCsH638t8ZCqHs06iGdQO8CHKFmr2jXb
         93Uf6PFfCsia9/QG4WDpn9z/8GdwbUO01u6+x1+7Sl0SkiEpoiSBmpjzpXRlr/OyL5r3
         jCmDda2Df1AX81ODXZrilfuotLX5JYp4knFRTgcGOPL4AofM3ouGAS98sBVvATt6Ihz7
         5J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836519; x=1776441319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djlyIF5R+CWEfFCif4JaIJrt1D+sAomgl/JLYjj3hDI=;
        b=C+EXeYRisuZWf3T52xP2gYUFBX3VQH69SHLNTx0plWhaeJravBeJhH/+DabnQKPzjR
         TC/Rf2C5o7QXZoZu0fI8zpfC5pCaUFx1CrMND34n9tCvWJHQFHoDOlFiXmsuBaj6c565
         B6dbVuE0gZNjEYbi79k/HTR9yPL2JG9JItdK6DCXPvISUISYWKjRrFZ3AhFr0lPMHjoo
         bVnazuMZXpceHA7rJOaCIgQTRdlGtkUm3ul1ewcQZgcsarOrQ89BdOjbxPIzvWEdesia
         QKPZGHkA26VWcRnh+iiGArQQBFiTjfSiWXSik0bSwjllq7ER9JRYaEv5LNtT6fIypbRI
         BnUA==
X-Gm-Message-State: AOJu0YxA6QyatpT6dtLLgnoWXS+YK9nbSVa7RKgwg+5UcueEpzXBzrt4
	LxwQZK9dJEe6ICzix31f/noijo2SMVAavFNZAMNxKsshbqCaLKT/I7JyPg+YfQ==
X-Gm-Gg: AeBDies4hv6mAJLJSqsPXwr3srBWKP3aShax0XiwO4F+mbSEAZ0sYjm3S6vO0yZ8SjS
	Zj/uLDKl8BBDMRBMR83/48Qt9RKcf0LrSIXHlIZxOVs0NAftpMGzqjIx5V2Z8VZUyZ2AsPKbcHg
	JZ9LCq3q9RmIDBJ93k3QjfhyOSA7lMxRRebAfQWlkTB3P+hak7Xk5QeVRMS9ATbMOlZSiLMEwJw
	fbNQrOSau9Fks7UxYjE8h7tIe3rIWJAVYfXsZnBEIE5WEhL9FmyM9b1JxoBTDXWEIx9F+tG3s1/
	cjFfmECfFVMbIxPCx9rSL4dwr18CeeGcxlMgZjFeosJgNg5zbyAOyASfjZUAv0QROeZWzecckZz
	YwMnPrFnL9BHyzanIqZ4e3Oo8lS/Qy8JXWI29Gl2UxbalL2fVlgFUIGaEN0/uiFKbbPdI0eGUGz
	w3Hx6qAQzMEieUHHxqU4qJkLXqmf6L17VR+1u6ekGb+Fn0MrXZ0WYXC89jffFZ46IQVw==
X-Received: by 2002:a05:600c:46cb:b0:488:c51f:e04e with SMTP id 5b1f17b1804b1-488d67f3a0fmr50197155e9.13.1775836518875;
        Fri, 10 Apr 2026 08:55:18 -0700 (PDT)
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
Subject: [PATCH v3 08/12] xen/riscv: rework G-stage mode handling
Date: Fri, 10 Apr 2026 17:54:54 +0200
Message-ID: <94c914766171b732524d2d64c283e566595a4d22.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1775836519-BD3590B1-ACB91251/10/73395122804
X-purgate-type: spam
X-purgate-size: 12904
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,max_gstage_mode.name:url];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7868D3D9E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rework G-stage mode handling to make the selected mode descriptor
reusable outside of p2m initialization, both for filling CPU nodes in
the device tree passed to dom0less guests and for per-domain G-stage
mode selection at domain creation time.

Promote modes[] from a local __initconst variable inside
gstage_mode_detect() to a file-scope static const array, and convert
max_gstage_mode from an embedded struct (assigned by value) to a global
const pointer into modes[]. This allows referencing both the mode
identifier and the mode name after init without copying the descriptor.
Remove get_max_supported_mode(); its callers now dereference
max_gstage_mode->mode directly.

Change struct p2m_domain::mode from an embedded gstage_mode_desc to a
const pointer into modes[], so each domain shares the descriptor rather
than carrying its own copy.

Adjust the modes[] entries in three ways:
 - Use lowercase names without the "x4" suffix (e.g. "sv39" instead of
   "Sv39x4"). The DT mmu-type binding [1] does not include the suffix,
   so the name can now be passed directly to the guest without
   transformation. The suffix is appended only in the diagnostic
   printk, where it remains informative.
 - Use "none" for Bare mode (HGATP_MODE_OFF) to match the DT binding.
 - Change paging_levels to represent the root page-table level index
   (i.e. total paging levels minus one) rather than the total count.
   P2M_ROOT_LEVEL() now returns the correct VPN index directly, without
   requiring callers to subtract one or use hardcoded offsets.

Add gstage_mode[8] to xen_arch_domainconfig so the toolstack can
request a specific G-stage mode at domain creation time. Introduce
find_gstage_mode() to resolve a mode descriptor by name
(case-insensitive), capping the result at max_gstage_mode to prevent
requesting a mode the hardware does not support. Update p2m_init() to
accept a xen_domctl_createdomain pointer and call find_gstage_mode()
instead of hardcoding Sv39x4.

Add arch_parse_dom0less_node() in a new dom0less-build.c to read the
"mmu-type" DT property from a guest domain node and store it in
boot_domain::create_cfg.arch.gstage_mode, falling back to maximum
supported mode when the property is absent.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v6.19-rc3#n82

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - New patch. Was taken from another patch series:
   https://lore.kernel.org/xen-devel/cover.1773157782.git.oleksii.kurochko@gmail.com/T/#m6eb886bdf718b06b967d1688314b80e7374a8de5
---
 xen/arch/riscv/Makefile          |   1 +
 xen/arch/riscv/dom0less-build.c  |  30 ++++++++
 xen/arch/riscv/include/asm/p2m.h |  11 +--
 xen/arch/riscv/p2m.c             | 113 +++++++++++++++++++++----------
 xen/arch/riscv/vmid.c            |   2 +-
 xen/include/public/arch-riscv.h  |   5 ++
 6 files changed, 121 insertions(+), 41 deletions(-)
 create mode 100644 xen/arch/riscv/dom0less-build.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index eecdcbc76867..8f7fd625dddd 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
+obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += extable.o
diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
new file mode 100644
index 000000000000..11fa184d54be
--- /dev/null
+++ b/xen/arch/riscv/dom0less-build.c
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/init.h>
+
+#include <asm/p2m.h>
+
+int __init arch_parse_dom0less_node(struct dt_device_node *node,
+                                    struct boot_domain *bd)
+{
+    const char *mmu_type;
+
+    if ( dt_property_read_string(node, "mmu-type", &mmu_type) )
+    {
+        dprintk(XENLOG_WARNING, "mmu-type property is missing in guest domain "
+                "node. %s will be used as fallback\n", max_gstage_mode->name);
+
+        mmu_type = max_gstage_mode->name;
+    }
+
+    if ( safe_strcpy(bd->create_cfg.arch.gstage_mode, mmu_type) )
+    {
+        dprintk(XENLOG_ERR, "mmu-type value \"%s\" is too long\n", mmu_type);
+
+        return -EINVAL;
+    }
+
+    return 0;
+}
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 54ea67990f06..b5b6a996baeb 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -13,7 +13,7 @@
 
 #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
-#define P2M_ROOT_LEVEL(p2m) ((p2m)->mode.paging_levels)
+#define P2M_ROOT_LEVEL(p2m) ((p2m)->mode->paging_levels)
 
 /*
  * According to the RISC-V spec:
@@ -55,6 +55,8 @@ struct gstage_mode_desc {
     char name[8];
 };
 
+extern const struct gstage_mode_desc *max_gstage_mode;
+
 /* Per-p2m-table state */
 struct p2m_domain {
     /*
@@ -68,7 +70,7 @@ struct p2m_domain {
     /* The root of the p2m tree. May be concatenated */
     struct page_info *root;
 
-    struct gstage_mode_desc mode;
+    const struct gstage_mode_desc *mode;
 
     /* Back pointer to domain */
     struct domain *domain;
@@ -215,9 +217,10 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 }
 
 void guest_mm_init(void);
-unsigned char get_max_supported_mode(void);
 
-int p2m_init(struct domain *d);
+struct xen_domctl_createdomain;
+
+int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config);
 
 static inline void p2m_write_lock(struct p2m_domain *p2m)
 {
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index d63697c89a1a..b0773083ff53 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -45,12 +45,27 @@ struct p2m_pte_ctx {
     unsigned int level;          /* Paging level at which the PTE resides. */
 };
 
-static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
-    .mode = HGATP_MODE_OFF,
-    .paging_levels = 0,
-    .name = "Bare",
+/* Values should be sorted by ->mode in this array */
+static const struct gstage_mode_desc modes[] = {
+    /*
+     * Based on the RISC-V spec:
+     *   Bare mode is always supported, regardless of SXLEN.
+     *   When SXLEN=32, the only other valid setting for MODE is Sv32.
+     *   When SXLEN=64, three paged virtual-memory schemes are defined:
+     *   Sv39, Sv48, and Sv57.
+     */
+    { HGATP_MODE_OFF,    0, "none" },
+#ifdef CONFIG_RISCV_32
+    { HGATP_MODE_SV32X4, 1, "sv32" },
+#else
+    { HGATP_MODE_SV39X4, 2, "sv39" },
+    { HGATP_MODE_SV48X4, 3, "sv48" },
+    { HGATP_MODE_SV57X4, 4, "sv57" },
+#endif
 };
 
+const struct gstage_mode_desc * __ro_after_init max_gstage_mode = &modes[0];
+
 static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
 
 static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
@@ -63,11 +78,6 @@ static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
     }
 }
 
-unsigned char get_max_supported_mode(void)
-{
-    return max_gstage_mode.mode;
-}
-
 /*
  * If anything is changed here, it may also require updates to
  * p2m_{get,set}_type().
@@ -148,23 +158,6 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
 
 static void __init gstage_mode_detect(void)
 {
-    static const struct gstage_mode_desc modes[] __initconst = {
-        /*
-         * Based on the RISC-V spec:
-         *   Bare mode is always supported, regardless of SXLEN.
-         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
-         *   When SXLEN=64, three paged virtual-memory schemes are defined:
-         *   Sv39, Sv48, and Sv57.
-         */
-#ifdef CONFIG_RISCV_32
-        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
-#else
-        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
-        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
-        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
-#endif
-    };
-
     for ( unsigned int mode_idx = ARRAY_SIZE(modes); mode_idx-- > 0; )
     {
         unsigned long mode = modes[mode_idx].mode;
@@ -173,16 +166,16 @@ static void __init gstage_mode_detect(void)
 
         if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
         {
-            max_gstage_mode = modes[mode_idx];
+            max_gstage_mode = &modes[mode_idx];
 
             break;
         }
     }
 
-    if ( max_gstage_mode.mode == HGATP_MODE_OFF )
+    if ( max_gstage_mode->mode == HGATP_MODE_OFF )
         panic("Xen expects that G-stage won't be Bare mode\n");
 
-    printk("Max supported G-stage mode is %s\n", max_gstage_mode.name);
+    printk("Max supported G-stage mode is %sx4\n", max_gstage_mode->name);
 
     csr_write(CSR_HGATP, 0);
 
@@ -283,7 +276,7 @@ static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
 unsigned long construct_hgatp(const struct p2m_domain *p2m, uint16_t vmid)
 {
     return MASK_INSR(mfn_x(page_to_mfn(p2m->root)), HGATP_PPN_MASK) |
-           MASK_INSR(p2m->mode.mode, HGATP_MODE_MASK) |
+           MASK_INSR(p2m->mode->mode, HGATP_MODE_MASK) |
            MASK_INSR(vmid, HGATP_VMID_MASK);
 }
 
@@ -331,8 +324,40 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
     return 0;
 }
 
-int p2m_init(struct domain *d)
+static const struct gstage_mode_desc * find_gstage_mode(const char *mmu_type)
 {
+    for ( unsigned int mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )
+    {
+        if ( !strcasecmp(mmu_type, modes[mode_idx].name) )
+        {
+            if ( modes[mode_idx].mode == HGATP_MODE_OFF ||
+                 modes[mode_idx].mode > max_gstage_mode->mode )
+                break;
+
+            return &modes[mode_idx];
+        }
+    }
+
+    ASSERT(modes[0].mode == HGATP_MODE_OFF);
+
+    dprintk(XENLOG_ERR, "Requested G-stage mode (%s) isn't supported\n",
+            mmu_type);
+
+    /*
+     * Return the Bare-mode sentinel. p2m_init() will reject it with
+     * -EINVAL, producing the appropriate domain-creation failure.
+     */
+    return &modes[0];
+}
+
+int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
+{
+    /*
+     * TODO: This static is a temporary constraint: all guests must use the
+     * same MMU mode because p2m_gpa_bits is not yet per-domain.
+     * Drop this once per-domain p2m_gpa_bits is introduced.
+     */
+    static const struct gstage_mode_desc *m = &modes[0];
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     /*
@@ -341,6 +366,27 @@ int p2m_init(struct domain *d)
      */
     p2m->domain = d;
 
+    if ( !config )
+    {
+        dprintk(XENLOG_ERR, "NULL config is passed\n");
+        return -EINVAL;
+    }
+
+    p2m->mode = find_gstage_mode(config->arch.gstage_mode);
+
+    if ( p2m->mode->mode == HGATP_MODE_OFF )
+        return -EINVAL;
+
+    if ( m->mode == HGATP_MODE_OFF )
+        m = p2m->mode;
+
+    if ( m->mode != p2m->mode->mode )
+    {
+        dprintk(XENLOG_ERR,
+                "Mode should be the same for all guests at the moment\n");
+        return -EINVAL;
+    }
+
     paging_domain_init(d);
 
     rwlock_init(&p2m->lock);
@@ -362,11 +408,6 @@ int p2m_init(struct domain *d)
 #   error "Add init of p2m->clean_dcache"
 #endif
 
-    /* TODO: don't hardcode used for a domain g-stage mode. */
-    p2m->mode.mode = HGATP_MODE_SV39X4;
-    p2m->mode.paging_levels = 2;
-    safe_strcpy(p2m->mode.name, "Sv39x4");
-
     return 0;
 }
 
diff --git a/xen/arch/riscv/vmid.c b/xen/arch/riscv/vmid.c
index 8fbcd500f24d..11c7e9d6d6c8 100644
--- a/xen/arch/riscv/vmid.c
+++ b/xen/arch/riscv/vmid.c
@@ -52,7 +52,7 @@ static DEFINE_PER_CPU(struct vmid_data, vmid_data);
 static unsigned int vmidlen_detect(void)
 {
     unsigned int vmid_bits;
-    unsigned char gstage_mode = get_max_supported_mode();
+    unsigned char gstage_mode = max_gstage_mode->mode;
 
     /*
      * According to the RISC-V Privileged Architecture Spec:
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 360d8e6871ba..5faf8924d926 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -56,6 +56,11 @@ typedef struct vcpu_guest_context vcpu_guest_context_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
 struct xen_arch_domainconfig {
+    /*
+     * G-stage MMU mode for the guest (e.g. "sv39", "sv48", "sv57").
+     * Must be set; an empty string is invalid.
+     */
+    char gstage_mode[8];
 };
 
 #endif
-- 
2.53.0


