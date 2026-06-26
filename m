Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CoyUMROfPmogJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6939D6CEA6E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=j8Tjne1L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346314.1604914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m4-0007bU-Sa; Fri, 26 Jun 2026 15:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346314.1604914; Fri, 26 Jun 2026 15:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m3-0007Df-TC; Fri, 26 Jun 2026 15:47:23 +0000
Received: by outflank-mailman (input) for mailman id 1346314;
 Fri, 26 Jun 2026 15:47:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8ls-0004vD-11
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lr-007b8F-5W
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:11 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eeb-5cb7-0a2a0a5109dd-0a2a4508b62c-32
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:11 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9efe-edec-0a2a45080019-d155d0afe02f-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:10 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-39ad9c80fa8so7349521fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:10 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488830; x=1783093630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DdSrh6NSU2s4GU9Tmsol8kJnh0oRP/iPMlkqVlxmWs=;
        b=j8Tjne1L93srtK5EsZnblNH1KAz1t2e0qDjfe5z4QGrEh5HotFOHFtOvuC1wOO3GOi
         aJBWQ3sVG47gPYG1r/E6ivQjdJHRtUYcJF1PwFH4B4V6ZYBU+AjpqN+zBedU7U19x87s
         +GEVHc4f+JlB6o3rKURJ3eNaiz8odo19Aq7+DPHBHp155O3bhaNHRObygWtbE+aVAa/6
         M9JU1e6LkK4Sen3ksKl2le/jbFlbug2e+2CElocXZWmFC0Di2QqXxolbYB/kNiqmPv2K
         HmVQQOzOZo89o1Yo3xdpdT/vLRkjW4V5VkWyMgAp+JAL9oXAgrwaCMV8WQStoBY494Ap
         pKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488830; x=1783093630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+DdSrh6NSU2s4GU9Tmsol8kJnh0oRP/iPMlkqVlxmWs=;
        b=cwHfoV9SsW4t361qqFVplEHfKy6aByct+AtQiiSrI8kPEvA9rw8OGQgffsO/v5nJko
         Tn44lW0aEMEoFSH6qZ7/nMiGuQSNFuNBo46QfcGZn1JleICQUnpz/FZdlhD9UeGtGAB4
         FT0YYOlWKNzvs84zSOW3/WHo7kDre85hl+KSrUrXsDoHEfjStpjuwr4v9tlNjcMZnjBP
         p/SM73ZOe8pPDzCX9KGNXp2WzifzGED+yx8puC5pz7p6u8lpFWAygq29w5B3zcBQbQPl
         JaH/E4yycuYUw6oSc7ZE1vdp+9eRgwFHZ9gDHCVe+0UTLgNFqpXZsZyw8d1n+7f57sHb
         NpxA==
X-Gm-Message-State: AOJu0Yy/WCxvQRJB8yMrg7wuURFqeYJ8SjxZQ1STKUCWyhQn2haigjEA
	gePYxTUJ/rXphN6uYnSzxHLcLe0aBeWG5pH4Tpc9WazfWhOikGb3fkDmg1nnsA==
X-Gm-Gg: AfdE7clQ+939/y0wbMDh4J6d0Mj4Twqa00QjPsaZgLRYJ5AQAn44Ry+SNb56ZoC2UoC
	TLjbJGNO+BVoVmlSJNE/HesivByzdh+fGfog8xcVIFYe8sYI5ht42nv4oFYDOO+tGb8E3dcqDqr
	anPGDe/Sx5IvboT+tv9Eglpr180DmV9pE7bD5C6pz4n/XOpeciCKieiD7Z/yiDl62RmsSfdRaM6
	T+KJNsvUixO1jhp4BzptTBsXXei02ymDdlshAwSolZW36LANtioMeqW8BCMrABl33RxhjcLucDm
	D4wT5KERKXJQ2sWre9n4RNMHxIXN3kVrGDiGUFLdDCFUp74ETUWxOy0pUw+fhJqIUvrQPqXF4kw
	D4nmIl6jKjEkSrqYy04PSyC+fsgq0Fc/uP3kcIeurtm0x8plaqyWgKbqdhq1TnO6Mvgu54Ks/Dl
	Rf8JYmBcguFRmk5Hp84iT+ThRtcj9pjJsZO5g3CpCdNUINMHv3r93CZfrKgg==
X-Received: by 2002:a05:6512:6285:b0:5ad:68c8:191b with SMTP id 2adb3069b0e04-5aea1f3d4c1mr2281084e87.2.1782488830038;
        Fri, 26 Jun 2026 08:47:10 -0700 (PDT)
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
Subject: [PATCH v4 25/25] xen/riscv: add initial dom0less infrastructure support
Date: Fri, 26 Jun 2026 17:46:34 +0200
Message-ID: <a6950e8dc2706c351fe6b0622602d34ecef133b7.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782488830-4092D3FC-F713A814/10/73395122804
X-purgate-type: spam
X-purgate-size: 6637
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
X-Rspamd-Queue-Id: 6939D6CEA6E

Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
providing the minimal architecture hooks required by the common
dom0less infrastructure.

Add stub implementations for architecture-specific helpers used when
building domains from the device tree. These allow the generic
dom0less code to build and let a basic DomU be constructed on RISC-V.
construct_hwdom() and make_hypervisor_node() are still stubs returning
an error: Dom0/hwdom construction isn't supported yet, and the
hypervisor node generation (needed by domains with
DOM0LESS_ENHANCED_NO_XS set) is not implemented. Both are marked with
a TODO and are not reached by the currently supported configurations.

Provide missing helpers and definitions required by the domain
construction code, including domain bitness helpers and the
p2m_set_allocation() prototype.

Additionally define the guest magic memory region (GUEST_MAGIC_BASE /
GUEST_MAGIC_SIZE) in asm/guest-layout.h. The base is arbitrary; the
only constraint is that the region must not overlap guest RAM or the
emulated device regions. It is placed in the unused gap below
GUEST_RAM0_BASE (0x80000000); the constraints are documented next to
the #define-s.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
  - Reword the description: the stubs do not let dom0less fully "run"
    since construct_hwdom() and make_hypervisor_node() return an error;
    spell out these limitations instead.
  - Add a TODO comment to construct_hwdom() explaining that Dom0/hwdom
    construction isn't supported yet.
  - Add a TODO comment to make_hypervisor_node() explaining that
    returning an error breaks building of domains with
    DOM0LESS_ENHANCED_NO_XS set, and why that is harmless for now.
  - Document the constraints on GUEST_MAGIC_BASE/GUEST_MAGIC_SIZE next
    to the #define-s and drop the QEMU-based justification (QEMU is not
    involved); the base is simply an arbitrary non-overlapping address.
Changes in v3:
  - Add /* Nothing specific to do for now */ comment to
    arch_handle_passthrough_prop().
  - Use _ULL() instead of xen_mk_ullong() for GUEST_MAGIC_BASE and
    GUEST_MAGIC_SIZE (xen_mk_ullong() is intended for public headers only).
  - Fix GUEST_MAGIC_BASE from 0x39000000 to 0x79000000 to avoid the
    QEMU RISC-V virt machine PCIE_ECAM range.
  - Drop CONFIG_STATIC_MEMORY=n from the CI randconfig; now redundant
    since STATIC_MEMORY depends on HAS_STATIC_MEMORY which RISC-V does
    not select.
Changes in v2:
  - Move declaration of p2m_set_allocation() to p2m-common.h.
  - Add __initdata for max_init_domid and drop initalizer for it.
  - Add CONFIG_STATIC_MEMORY=n to CI's randconfig to avoid
    compilation error because of guest_physmap_add_pages()
    isn't provided.
---
 xen/arch/riscv/Kconfig                    |  2 ++
 xen/arch/riscv/dom0less-build.c           |  7 ++++++
 xen/arch/riscv/domain-build.c             | 28 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest-layout.h | 12 ++++++++++
 4 files changed, 49 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 48520588fe40..d8a348c0cf07 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -6,6 +6,8 @@ config RISCV
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
 	select HAS_DEVICE_TREE_DISCOVERY
+	select HAS_DOM0LESS
+	select HAS_DOMAIN_TYPE
 	select HAS_EX_TABLE
 	select HAS_PMAP
 	select HAS_UBSAN
diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index d1a51b92936a..0801d7e25059 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -102,3 +102,10 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
 
     return 0;
 }
+
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    /* Nothing specific to do for now */
+    return 0;
+}
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 54ecd301c49c..84923b8f7b10 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -156,9 +156,37 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
     return fdt_end_node(fdt);
 }
 
+int __init construct_hwdom(struct kernel_info *kinfo,
+                           const struct dt_device_node *node)
+{
+    /*
+     * TODO: Dom0/hwdom construction isn't supported on RISC-V yet, so this
+     * is a stub returning an error. It must be implemented before a hardware
+     * domain can be built from the device tree.
+     */
+
+    return -EOPNOTSUPP;
+}
+
 int __init make_timer_node(const struct kernel_info *kinfo)
 {
     /* There is no need for timer node for RISC-V. */
 
     return 0;
 }
+
+int __init make_hypervisor_node(struct domain *d,
+                                const struct kernel_info *kinfo,
+                                int addrcells, int sizecells)
+{
+    /*
+     * TODO: Generating the hypervisor node isn't implemented yet. Returning
+     * an error here breaks building of any domain (DomU included) whose
+     * dom0less_feature has DOM0LESS_ENHANCED_NO_XS set. This is harmless for
+     * now because Dom0/hwdom construction isn't supported on RISC-V yet
+     * either, and no RISC-V DomU sets that flag, so this path is never taken.
+     * It must be implemented before DOM0LESS_ENHANCED_NO_XS is used.
+     */
+
+    return -EOPNOTSUPP;
+}
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 90603f06bb91..add42d566597 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -32,4 +32,16 @@
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
+/*
+ * The guest magic region holds Xen-reserved pages mapped into the guest's
+ * physical address space (shared info, grant table, etc.). The only real
+ * constraint is that the GUEST_MAGIC_SIZE-byte region must not overlap
+ * guest RAM (the GUEST_RAMx banks) or the emulated device regions defined
+ * above; the exact base is otherwise arbitrary. Here it is placed in the
+ * unused gap below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM
+ * bank would work equally well.
+ */
+#define GUEST_MAGIC_BASE  _UL(0x79000000)
+#define GUEST_MAGIC_SIZE  _UL(0x01000000)
+
 #endif /* ASM_RISCV_GUEST_LAYOUT_H */
-- 
2.54.0


