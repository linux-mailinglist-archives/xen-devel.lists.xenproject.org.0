Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +WhlKqiCMmra1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2C698F80
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Sr7rbD5B;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340118.1601264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoIJ-0008JR-7R; Wed, 17 Jun 2026 11:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340118.1601264; Wed, 17 Jun 2026 11:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoIH-000800-I6; Wed, 17 Jun 2026 11:18:53 +0000
Received: by outflank-mailman (input) for mailman id 1340118;
 Wed, 17 Jun 2026 11:18:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHs-0004JY-Gk
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHr-000VRI-NL
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328270-e002-0a2a0a5209dd-0a2a4503b370-34
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:27 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328283-672d-0a2a45030019-d1558034dd73-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:27 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49222fb062bso46605175e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:27 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695107; x=1782299907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd109uo54h7Ht2m/jvWZ4if8ySED0SAOqrqE/7gjCJk=;
        b=Sr7rbD5BKLnI5zn+CvFCzD8u7GJAVIUadKPTMrRmSU1chjm8VSWtKPNwgre109ZCjs
         wBdTXpRXudiFJdt+sZZfdTdKfkmF+pXkkxRFF7+jHS341Q7lYyXn2bupN6b+xKNbuj3l
         gul8yepIB0g7BWIMJ2qp6nEbzKTVGQKFqcJpb0QxZ+YtfjPnSF8n0oF+x0A5VpqlvCBA
         IGOKFxO8i50CtnN9vnDjwF0CUMTthEb9Rs+L1/SuvXw0sTeBkh05kqK9cifXut+zNeGa
         i6ryKZUPSLp5Yk506wiaCybMHqnzxdeMc4KEU2uAsirStPDX42f/xIKJVWDdk8u0jZpH
         JAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695107; x=1782299907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wd109uo54h7Ht2m/jvWZ4if8ySED0SAOqrqE/7gjCJk=;
        b=dAGQ+mSBPRRASWEz89+3b49OGdD+wREgmt5QTP8AziiaS8sSlCCSsfdOMhn6PMYf/1
         vuxNzkBkNCFjwxK2SGcp8Nk8Xfkm2BpKXAt5UVgRWKCrN6h41mi0pSS9cRLjae9OPqE2
         0WJEmbLQDie69QbhZCeQHwfApA8DDXzz+4s3ONnpzDAqZagM0xNgnZswaewNUGmg9+PN
         +P3hzkLqGHrVS6HbDDhdfdREtXy+jrGtLOQ6DSgoTlkEhruz7orwGgqPci/HH3pn127n
         24+oGvBJ0PIlEujebh9bmZwvBL33dIMDcmxw4vtZAxl4dRQnrrtIg64/D9g7Xb8MQWob
         Q6Pg==
X-Gm-Message-State: AOJu0Yzuf5GzZ7N/z/svE9wrEwZStei5C05wigaNDtlUYfqvD5JVmO1v
	nV37O8mNJXzWTLs7PYMzrc9ujK7M7BQxdipVZGqT8PxC/DBHuoxeOs+JSzxzNw==
X-Gm-Gg: Acq92OHuzz7O3AcOrhdNVKS2/7wLwNwn2LbE9qjDSbenoH5DQsxCAZHHWZfCG3rXCSh
	WsFe4zBvyoBRbpmGi6kdwtdK8IKVtcx6xN2AP8jVvXz6w884AtrCU2mEzcw6KKv0LNsmC6SWLG4
	avL0dAb9dcyxGXa1HDhRpyticjJxk5h1NaulEoUUDjXRzBTH1+BQRuv49Fb7CJktKnfGWFpEN9w
	CeRt0J7+lTeI8b0fSLwDDi3pcVBxWk+vR39q3dMsdPlHraDSnOv5OCFj62QtVpsqGcP6j/Tfbvk
	5gko35ooneyESQnij90nvE3zaW/6XKxRDrFZx/cR/wG8LNdpit6VkP0AVtdgBX3AE7Z7bhnzNmy
	/6c/F+UqKvG1WX8Rb0PjRLrMkDYoeekFVr9pNtJim2v24jvkqGrxjhOKfm5OIMsU76D4Z/JysVf
	aaRYPF3hwOyfPW5D2tN5YLeOiF3mrIYmktr36X5udA+sTVhJ/7g3k24CnkHg==
X-Received: by 2002:a05:600c:608a:b0:490:b65f:8b1 with SMTP id 5b1f17b1804b1-492333ba1d1mr71065675e9.5.1781695106912;
        Wed, 17 Jun 2026 04:18:26 -0700 (PDT)
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
Subject: [PATCH v3 23/23] xen/riscv: add initial dom0less infrastructure support
Date: Wed, 17 Jun 2026 13:17:51 +0200
Message-ID: <781214e3cb87a0fe38e210e9b0cefed49d623d52.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781695107-39B7C938-C3D29834/10/73395122804
X-purgate-type: spam
X-purgate-size: 5246
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 23B2C698F80

Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
providing the minimal architecture hooks required by the common
dom0less infrastructure.

Add stub implementations for architecture-specific helpers used when
building domains from the device tree. These currently perform no
additional work but allow the generic dom0less code to build and run
on RISC-V.

Introduce max_init_domid as a runtime variable rather than a constant
so that it can be updated during dom0less domain creation.

Provide missing helpers and definitions required by the domain
construction code, including domain bitness helpers and the
p2m_set_allocation() prototype.

Additionally define the guest magic memory region in the public
RISC-V interface. GUEST_MAGIC_BASE is placed at 0x79000000 to avoid
overlapping with the QEMU RISC-V virt machine address space.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
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
 xen/arch/riscv/dom0less-build.c           |  7 +++++++
 xen/arch/riscv/domain-build.c             | 13 +++++++++++++
 xen/arch/riscv/include/asm/guest-layout.h |  3 +++
 xen/arch/riscv/include/asm/setup.h        |  4 +++-
 xen/arch/riscv/setup.c                    |  2 ++
 6 files changed, 30 insertions(+), 1 deletion(-)

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
index 4c21ef37a6e1..df4d90e1410a 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -156,9 +156,22 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
     return fdt_end_node(fdt);
 }
 
+int __init construct_hwdom(struct kernel_info *kinfo,
+                           const struct dt_device_node *node)
+{
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
+    return -EOPNOTSUPP;
+}
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 2e5762af863f..757285392d46 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -24,4 +24,7 @@
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
+#define GUEST_MAGIC_BASE  _ULL(0x79000000)
+#define GUEST_MAGIC_SIZE  _ULL(0x01000000)
+
 #endif /* ASM_RISCV_GUEST_LAYOUT_H */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 2215894cfbb1..678b65ac1e54 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,7 +5,9 @@
 
 #include <xen/types.h>
 
-#define max_init_domid (0)
+#include <public/xen.h>
+
+extern domid_t max_init_domid;
 
 void setup_mm(void);
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index c3e98733ebc3..b8fa004cbf25 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -33,6 +33,8 @@
 #include <asm/traps.h>
 #include <asm/vsbi.h>
 
+domid_t __initdata max_init_domid;
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
-- 
2.54.0


