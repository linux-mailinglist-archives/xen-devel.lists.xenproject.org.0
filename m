Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAD7AmzF8GkqYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295924870BB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296342.1572816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVj-0007Db-2S; Tue, 28 Apr 2026 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296342.1572816; Tue, 28 Apr 2026 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVi-0007AP-QM; Tue, 28 Apr 2026 14:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1296342;
 Tue, 28 Apr 2026 14:34:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVh-0006r9-1d
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:34:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVg-008e9B-D6
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:34:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c556-e002-0a2a0a5209dd-0a2a4501afa6-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:00 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c558-c1f2-0a2a45010019-d1558031a9e5-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:00 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso117452585e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:34:00 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386839; x=1777991639; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flD7ZmhwssMnyYfAVHC55aOI9OknAA3VNVf0Nz/lr7I=;
        b=W9EP6m8Pb7I1AcLFBTDh2ygI0BxNL42SgPZNExoXcfbzBKSUHks4KqeudDPC0leUqb
         bT9TEg+gdloHJftHqTYZcxvi13JR+b4t97wXtlCJh9rL6pEIz0cjzhRANzF1W9k+p3qc
         zsTnJXNiD+fALNOTh1P2CGhU8AitwxbiU3zeWEg70nS+jGgmt7w2rpUsQRF30Q87ihaE
         XWeqKrURym6a34DDvt7vddR/08w7Vj/j2jkUJewCIf3mB+2dM8WIC6hAJ6qeJiSm3D5U
         V88mfHQdV1AJg1GdL9qOYAtHfEC6B1oEdc/9e+RyhTknxeBlMsH1aIHyvSzDsTg5zUUx
         FlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386839; x=1777991639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=flD7ZmhwssMnyYfAVHC55aOI9OknAA3VNVf0Nz/lr7I=;
        b=Qe3mAS5hhDYoG8PDgjj97bGU07PIsbYMi8IpuD9ZYFQW6VhMCBZ76kbqVO9zqTODAv
         5MVGdEXP5YfBZteQ3URleRe9sXmSJ6hcPBwIa9KgQR4u1n3iq66acw18HeRrE8K+Rgn0
         Jd/6FiMlt69UoMXcXRF5IeaScFbQpICNcKiRON62vxh/iSmTuPlcS4BpiZvmCKCrXEkW
         iLVuF/k/lajmumHD7Qh9GLdy3ui9APDVS/w8Z1giGBby7v03rmrIuavigVpnNfGwwkTh
         tyrsjS13BabSYt5tCpDSpvaGuQuEw0pZUw6fyGIXE9fpdxKyrFI0voFXVtforH5/GoWF
         +W6w==
X-Gm-Message-State: AOJu0YwbQLd+iLYoQaQxTW8vZXHjow7UZY7s53yIqdd6/RoZN8Al3D4U
	tWqsQslPRmtT1G6OafNaN3CtMzcYGxOPpc1TMOAzJGYYRkR7/9CsVK4H16Rtbw==
X-Gm-Gg: AeBDiev4X78MOldZMyTInHUkTt/U7mnTn1Ct+yYjKbxcLhGNbtC/KPzJyx4TlrM4CYy
	U9/HoJJPKwJaR+4c1ZS8MYbilPveuf4aZ5qpPLXEgvU4S8J8KQQ6xu41gFUqvkJ/gQIXlpcVxYc
	QEs0nkcCeqnRRVAfuPJi1a0l5XtmwoWMFXOgUYlyl9Y2wqpSQR9fy0Vqba7xhDFaYKYeXfGmWmX
	d5ggl5v3F3fk+vRV60NRefa4da54a3YSjzJ9hcJryriLipuQisgpVzcFdJyP2C0cbfEk5yIIXkt
	O3yakCeZeum8kPiZMTdUDOtvbxNfJByI85TRKfMCivi9kGOGwDYZeyPtvqAZzYG56oVKJ/1P+zP
	ana4wKJWcuJ2lVjD8RGzupGKn6tRDGhIaRyXgw4xr9ZFODXHOP8G8Sy8bIVtsU/X9YJLIyvrFn8
	/QFW82zFXdTOF9eYw9yiCTHvF7uGRSs8u/8TIdxmUcBlrMvVol2G6tAgW+qIiuPNH0kmDMmnK1z
	rno
X-Received: by 2002:a05:600c:a403:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a78a391b9mr33404535e9.10.1777386839191;
        Tue, 28 Apr 2026 07:33:59 -0700 (PDT)
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
Subject: [PATCH v4 08/11] xen/riscv: rework G-stage mode handling
Date: Tue, 28 Apr 2026 16:33:37 +0200
Message-ID: <865ed71ece75e850cdcb47ce9157a668a46a4c4d.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777386840-BCC6CFF4-59E3781B/10/73395122804
X-purgate-type: spam
X-purgate-size: 15471
X-Rspamd-Queue-Id: 295924870BB
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.499];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Rework G-stage mode handling to make the selected mode descriptor
reusable outside of p2m initialization, both for filling CPU nodes in
the device tree passed to dom0less guests and for per-domain G-stage
mode selection at domain creation time.

Promote gstage_modes[] from a local __initconst variable inside
gstage_mode_detect() to a file-scope static const array, and convert
max_gstage_mode from an embedded struct (assigned by value) to a global
const pointer into gstage_modes[]. This allows referencing both the mode
identifier and the mode name after init without copying the descriptor.
Remove get_max_supported_mode(); its callers now dereference
max_gstage_mode->mode directly.

Change struct p2m_domain::mode from an embedded gstage_mode_desc to a
const pointer into gstage_modes[], so each domain shares the descriptor
rather than carrying its own copy.

Adjust the gstage_modes[] entries in three ways:
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

Add gstage_mode to xen_arch_domainconfig so the toolstack can
request a specific G-stage mode at domain creation time. Introduce
find_gstage_mode() to resolve a mode descriptor by HGATP_MODE_*,
capping the result at max_gstage_mode to prevent requesting a mode
the hardware does not support. Update p2m_init() to accept a
xen_domctl_createdomain pointer and call find_gstage_mode()
instead of hardcoding Sv39x4.

Add arch_parse_dom0less_node() in a new dom0less-build.c to read the
"mmu-type" DT property from a guest domain node and store it in
boot_domain::create_cfg.arch.gstage_mode, falling back to maximum
supported mode when the property is absent.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v6.19-rc3#n82

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Stray blank after * in declaration of find_gstage_mode().
 - Refactor find_gstage_mode(). Now it is find_gstage_mode_by_bits().
 - Add __ro_after_init for static local variable m in p2m_init.
 - s/ char gstage_mode[8];/unsigned char gstage_mode; in struct vcpu_guest_context.
 - s/modes/gstage_modes in p2m.c.
 - Introduce P2M_EXTRA_BITS_AT_LEVEL and re-use P2M_ROOT_EXTRA_BITS to encode magic constant 2.
---
Changes in v3:
 - New patch.
---
---
 xen/arch/riscv/Makefile          |   1 +
 xen/arch/riscv/dom0less-build.c  |  70 ++++++++++++++++++
 xen/arch/riscv/include/asm/p2m.h |  18 +++--
 xen/arch/riscv/p2m.c             | 120 +++++++++++++++++++++----------
 xen/arch/riscv/vmid.c            |   2 +-
 xen/include/public/arch-riscv.h  |   5 ++
 6 files changed, 170 insertions(+), 46 deletions(-)
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
index 000000000000..02782d0f9998
--- /dev/null
+++ b/xen/arch/riscv/dom0less-build.c
@@ -0,0 +1,70 @@
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
+    unsigned long bits;
+    const char *end;
+
+    if ( dt_property_read_string(node, "mmu-type", &mmu_type) )
+    {
+        dprintk(XENLOG_WARNING, "mmu-type property is missing in guest domain "
+                "node. %s will be used as fallback\n", max_gstage_mode->name);
+
+        bits = P2M_GFN_LEVEL_SHIFT(max_gstage_mode->paging_levels + 1);
+
+        goto out;
+    }
+
+    if ( !strcasecmp(mmu_type, "riscv,none") )
+    {
+        dprintk(XENLOG_ERR, "Bare mode isn't supported by Xen\n");
+
+        return -EOPNOTSUPP;
+    }
+
+    if ( strncasecmp(mmu_type, "riscv,sv", 8) )
+    {
+        dprintk(XENLOG_ERR, "mmu-type value \"%s\" is incorrect\n", mmu_type);
+
+        return -EINVAL;
+    }
+
+    bits = simple_strtoul(mmu_type + 8, &end, 10);
+    if ( (*end != '\0') || (end == mmu_type + 8) )
+    {
+        dprintk(XENLOG_ERR, "mmu-type value \"%s\" is incorrect\n", mmu_type);
+
+        return -EINVAL;
+    }
+
+ out:
+    if ( bits > (UINT8_MAX - P2M_ROOT_EXTRA_BITS) )
+    {
+        dprintk(XENLOG_ERR, "gstage addr bits value overflows uint8\n");
+
+        return -EINVAL;
+    }
+    /*
+     * The correct value of bits will be checked in p2m_init() by call of
+     * find_gstage_mode_by_bits().
+     *
+     * As mmu-type property contains one of string:
+     *  - riscv,sv32
+     *  - riscv,sv39
+     *  - riscv,sv48
+     *  - riscv,sv57
+     * it is needed to add '+P2M_ROOT_EXTRA_BITS' as for G-stage mode GPAs
+     * are extended by P2M_ROOT_EXTRA_BITS.
+     */
+    bd->create_cfg.arch.gstage_addr_bits = bits + P2M_ROOT_EXTRA_BITS;
+
+    return 0;
+}
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 54ea67990f06..638c60ddc2f7 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -13,7 +13,7 @@
 
 #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
-#define P2M_ROOT_LEVEL(p2m) ((p2m)->mode.paging_levels)
+#define P2M_ROOT_LEVEL(p2m) ((p2m)->mode->paging_levels)
 
 /*
  * According to the RISC-V spec:
@@ -32,10 +32,13 @@
  */
 #define P2M_LEVEL_ORDER(lvl) XEN_PT_LEVEL_ORDER(lvl)
 
-#define P2M_ROOT_EXTRA_BITS(p2m, lvl) (2 * ((lvl) == P2M_ROOT_LEVEL(p2m)))
+#define P2M_ROOT_EXTRA_BITS 2
+
+#define P2M_LEVEL_EXTRA_BITS(p2m, lvl) \
+    (P2M_ROOT_EXTRA_BITS * ((lvl) == P2M_ROOT_LEVEL(p2m)))
 
 #define P2M_PAGETABLE_ENTRIES(p2m, lvl) \
-    (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(p2m, lvl), UL))
+    (BIT(PAGETABLE_ORDER + P2M_LEVEL_EXTRA_BITS(p2m, lvl), UL))
 
 #define P2M_TABLE_OFFSET(p2m, lvl) (P2M_PAGETABLE_ENTRIES(p2m, lvl) - 1UL)
 
@@ -55,6 +58,8 @@ struct gstage_mode_desc {
     char name[8];
 };
 
+extern const struct gstage_mode_desc *max_gstage_mode;
+
 /* Per-p2m-table state */
 struct p2m_domain {
     /*
@@ -68,7 +73,7 @@ struct p2m_domain {
     /* The root of the p2m tree. May be concatenated */
     struct page_info *root;
 
-    struct gstage_mode_desc mode;
+    const struct gstage_mode_desc *mode;
 
     /* Back pointer to domain */
     struct domain *domain;
@@ -215,9 +220,10 @@ static inline bool arch_acquire_resource_check(struct domain *d)
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
index adcf292a7092..13846bee6a4f 100644
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
+static const struct gstage_mode_desc gstage_modes[] = {
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
 
+const struct gstage_mode_desc * __ro_after_init max_gstage_mode = &gstage_modes[0];
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
@@ -148,41 +158,24 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
 
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
-    for ( unsigned int mode_idx = ARRAY_SIZE(modes); mode_idx-- > 0; )
+    for ( unsigned int mode_idx = ARRAY_SIZE(gstage_modes); mode_idx-- > 0; )
     {
-        unsigned long mode = modes[mode_idx].mode;
+        unsigned long mode = gstage_modes[mode_idx].mode;
 
         csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
 
         if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
         {
-            max_gstage_mode = modes[mode_idx];
+            max_gstage_mode = &gstage_modes[mode_idx];
 
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
 
@@ -331,8 +324,35 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
     return 0;
 }
 
-int p2m_init(struct domain *d)
+static const struct gstage_mode_desc *find_gstage_mode_by_bits(
+    unsigned char gpa_bits)
+{
+    ASSERT(gstage_modes[0].mode == HGATP_MODE_OFF);
+
+    for ( unsigned int i = 1; i < ARRAY_SIZE(gstage_modes); i++ )
+    {
+        unsigned int lvl = gstage_modes[i].paging_levels + 1;
+        unsigned int bits = P2M_GFN_LEVEL_SHIFT(lvl) + P2M_ROOT_EXTRA_BITS;
+
+        if ( gpa_bits == bits )
+        {
+            if ( gstage_modes[i].mode > max_gstage_mode->mode )
+                return NULL;
+            return &gstage_modes[i];
+        }
+    }
+
+    return NULL;
+}
+
+int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
 {
+    /*
+     * TODO: This static is a temporary constraint: all guests must use the
+     * same MMU mode because p2m_gpa_bits is not yet per-domain.
+     * Drop this once per-domain p2m_gpa_bits is introduced.
+     */
+    static const struct gstage_mode_desc __ro_after_init *m = &gstage_modes[0];
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     /*
@@ -341,6 +361,33 @@ int p2m_init(struct domain *d)
      */
     p2m->domain = d;
 
+    if ( !config )
+    {
+        dprintk(XENLOG_ERR, "NULL config is passed\n");
+        return -EINVAL;
+    }
+
+    p2m->mode = find_gstage_mode_by_bits(config->arch.gstage_addr_bits);
+
+    if ( !p2m->mode )
+    {
+        dprintk(XENLOG_ERR,
+                "Unsupported or unavailable gstage addr bits: %u\n",
+                config->arch.gstage_addr_bits);
+
+        return -EINVAL;
+    }
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
@@ -362,11 +409,6 @@ int p2m_init(struct domain *d)
 #   error "Add init of p2m->clean_dcache"
 #endif
 
-    /* TODO: don't hardcode used for a domain g-stage mode. */
-    p2m->mode.mode = HGATP_MODE_SV39X4;
-    p2m->mode.paging_levels = 2;
-    safe_strcpy(p2m->mode.name, "Sv39x4");
-
     return 0;
 }
 
@@ -1304,7 +1346,7 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
 {
     unsigned int level = P2M_ROOT_LEVEL(p2m);
     unsigned int gfn_limit_bits =
-        P2M_LEVEL_ORDER(level + 1) + P2M_ROOT_EXTRA_BITS(p2m, level);
+        P2M_LEVEL_ORDER(level + 1) + P2M_LEVEL_EXTRA_BITS(p2m, level);
     pte_t entry, *table;
     int rc;
     mfn_t mfn = INVALID_MFN;
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
index 360d8e6871ba..da4cc0cbfcfb 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -56,6 +56,11 @@ typedef struct vcpu_guest_context vcpu_guest_context_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
 struct xen_arch_domainconfig {
+    /*
+     * G-stage GPA address width in bits.
+     * Valid values: 34 (sv32x4), 41 (sv39x4), 50 (sv48x4), 59 (sv57x4).
+     */
+    unsigned char gstage_addr_bits;
 };
 
 #endif
-- 
2.53.0


