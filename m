Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMHdAND2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7E4F801B
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303824.1577191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMRD-0004Nr-3p; Fri, 08 May 2026 14:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303824.1577191; Fri, 08 May 2026 14:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMRB-000427-RT; Fri, 08 May 2026 14:44:21 +0000
Received: by outflank-mailman (input) for mailman id 1303824;
 Fri, 08 May 2026 14:44:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMR4-0002gH-As
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMR3-007XaD-M5
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a5-2eae-0a2a0a5409dd-0a2a4502de26-42
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:13 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6bd-af86-0a2a45020019-d155da35e4fd-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:13 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-bb91b426e40so355083466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:13 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251453; x=1778856253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7g7YWRnnxNXf98txapITWcoUSeH2RyR+2XFUir70YQ=;
        b=h12DAhvTQDbofpF74lUVsmxOZwe9wnVk77ILIeESh7Qji9eKhUtMcy4H/BWJ/eh0nn
         aol6Q0ybCqepbbQLwVp1BTByU3U9zIlWj02xdzH9BtB+cEuLe9koYvq3j+xy6hlFn0AJ
         oJKDdvhsMO9klaYTAUhEDhEp8VQqbOo/uS2GHZty4pai0Igx8ndERFWPdyoMCy/6Ie4C
         8ZXq/Gd/N1tNJk2CVwtT49UkCScshfRIcDgaMDRduTKY9KdEoFebTCX1gcN4VGgcHKjc
         fmeqT01m6dBlqQdMcNhfuAdcCQswShidbNFl/YcxF5kM+c1QLfDVGGRD6gSpZIQc1UOP
         sFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251453; x=1778856253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7g7YWRnnxNXf98txapITWcoUSeH2RyR+2XFUir70YQ=;
        b=RzobHA92PvPXQ672gQYcGmeEFwWw/jM9inPQdm+8Ptxx+57HGF9RVQqFekTwAwJR0G
         C7P2SqvtuR0Rb8fGZvMyWxol4W6EY5FNkUGgq9rc0fahSfQ0TVf1XoC5vQzGidHTcnE2
         bLrJrNmsK11GF2PVqjp7bkhQAREuG6Q3WmsmVvVhqf+iJYpLJ3DePzcy1IHbJ3sKaq6E
         Vk+imVJ1YeUH6xrBcgK05QRPDxL+zRxQc6BUqBzGsw06cxnplT3kp2BIG2jvXCw1CZSX
         uMHvN8isD1Sik58MQpL+fhblCPoPOnv3EVPHr2IWlYl2zmJamSGdZ4bK+cicwdkpLLlO
         9skQ==
X-Gm-Message-State: AOJu0YxkzTcrI7QKtNAYDcnrR4WAEIonfXKDy4Bgh5vJA3QBtKG0Z5yZ
	i2WiBGN7RcADIrxdlFViuUszEAuHE3yWsoKXanMVmTkkhM50LY8X6UnTJfYV3A==
X-Gm-Gg: AeBDievQt6hgFRSWWxBdWu4IjDKoApVuGUEzd7Sy0/1/Z3nbjQSnywIUL78Qchl8OdF
	UXNyHw/GK9KuBaYePscyKG7UFAK07WbFnl7SgnL31euIuYmszDQCKgLFUsFkGDZ1kMJyo/twxBe
	vnq7WSuCUpN1ixM+jagQBjw0Ej75l4jz5HsGj1VxwToLzckjpzgKnyF5D0FV7GkQeT19QbDNF8r
	u/WR5GQxvSFkbirl9l634DeElO/EUAJiUkDVFkHXO6Nk/zCzXWm9wEKFKI80w/QAtP6lN3jwrg7
	LAaw6KfF4OACqQP2ltclrjgJBOAG9CGTmshvsqnhiq6yzzPRSJdgc4AyDBfz4KhFFBdL+zG21Oa
	BMEo7PDcpPr/B6Y+8H8f1YuGQ2Htfc/BJE+hWAXKL7PLrnkPU3i0ELwpL7X0kLJrydJh8cSU0nz
	U3vhfazLz4BMZfQJgfiA4DmtEgePOKWZ/5ujMfaHcJVL5F0pD3JGoJUm5DfjdmJFT0gw==
X-Received: by 2002:a17:907:9689:b0:bc3:782c:da7a with SMTP id a640c23a62f3a-bc56a6470ddmr787193566b.5.1778251452799;
        Fri, 08 May 2026 07:44:12 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 25/26] xen/riscv: add initial dom0less infrastructure support
Date: Fri,  8 May 2026 16:43:27 +0200
Message-ID: <0b52530fe7287ed8600b1877b573b5cd0168634a.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778251453-8276A161-AB215660/10/73395122804
X-purgate-type: spam
X-purgate-size: 5370
X-Rspamd-Queue-Id: AAC7E4F801B
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,cardoe.com,kernel.org,wdc.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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
RISC-V interface.

As HAS_DOM0LESS is selected for RISC-V now it could be a compilation
issue if CONFIG_STATIC_MEMORY=y as guest_physmap_add_pages() isn't
yet provided.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Move declaration of p2m_set_allocation() to p2m-common.h.
 - Add __initdata for max_init_domid and drop initalizer for it.
 - Add CONFIG_STATIC_MEMORY=n to CI's randconfig to avoid
   compilation error because of guest_physmap_add_pages()
   isn't provided.
 - Select HAS_DOMAIN_TYPE for RISC-V and drop things which were
   introduced when HAS_DOMAIN_TYPE doesn't exist.
---
 automation/gitlab-ci/build.yaml           |  1 +
 xen/arch/riscv/Kconfig                    |  2 ++
 xen/arch/riscv/dom0less-build.c           |  6 ++++++
 xen/arch/riscv/domain-build.c             | 13 +++++++++++++
 xen/arch/riscv/include/asm/guest-layout.h |  3 +++
 xen/arch/riscv/include/asm/setup.h        |  4 +++-
 xen/arch/riscv/setup.c                    |  2 ++
 7 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f05895729147..3c3e7cb356a4 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -805,6 +805,7 @@ debian-13-riscv64-gcc:
       CONFIG_GRANT_TABLE=n
       CONFIG_LIVEPATCH=n
       CONFIG_QEMU_PLATFORM=y
+      CONFIG_STATIC_MEMORY=n
       CONFIG_VM_EVENT=n
       CONFIG_XSM=n
 
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
index d1a51b92936a..b5390175538a 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -102,3 +102,9 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
 
     return 0;
 }
+
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    return 0;
+}
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 02b293239142..a70306434fc9 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -158,9 +158,22 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
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
index b16ec79c3786..81cc87545054 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -24,4 +24,7 @@
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
+#define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
+#define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
+
 #endif /* ASM_RISCV_GUEST_LAYOUT_H */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 9dbd3a8cbef7..416d2301dcde 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,11 +5,13 @@
 
 #include <xen/types.h>
 
+#include <public/xen.h>
+
 struct domain;
 struct dt_device_node;
 struct rangeset;
 
-#define max_init_domid (0)
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


