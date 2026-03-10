Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKaXMHRSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E7F255624
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250565.1548059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j7-0005QY-5P; Tue, 10 Mar 2026 17:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250565.1548059; Tue, 10 Mar 2026 17:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j6-0005Nm-RC; Tue, 10 Mar 2026 17:18:36 +0000
Received: by outflank-mailman (input) for mailman id 1250565;
 Tue, 10 Mar 2026 17:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aW-0001Q4-J5
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:44 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ede70159-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:42 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4853510b4f3so41192225e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:42 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:41 -0700 (PDT)
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
X-Inumbo-ID: ede70159-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162581; x=1773767381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS5sSCMJ+IJ1M5ORzLuoNMwjp7zPxai25z8WoDewGMs=;
        b=V6yZRalt6hfTpxVuBCuArsS79iZpCjhdoZ/pdpi3ir4s30PmTg4uVDZIb3Bdz0SKmK
         zQ0bPZCAb5S0UnZ8riWtkO6Lm9rEB5jzFI5R3L5EJxuvWaEvlUmsBpJmragGPpyKU8WZ
         m2MXTahbvFKhSeT6OOhkFaJAtz7LYuEmLN+61st8nbeXKI8iItQ/7ndN9EO3q/qf5Ysn
         jzl9f/jNc0MuRdtaU5NpIvYK8ypE93OIgz0Lg7hAhQn+gPFhO78t2qyzIvfWUFaejzWx
         sY0/LpZeASF9UO56c3tnMlZFp83qnk7TZlQjz8w0cuwyxjFUYDBx7v15c0MrveGUDRR+
         JSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162581; x=1773767381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eS5sSCMJ+IJ1M5ORzLuoNMwjp7zPxai25z8WoDewGMs=;
        b=s6ypZ+rYGTliRaIJQywBJCpnFK1NaBmTpRN3jwRVuTbaO8E2dhJMPOMxA+QDNPljMy
         5wiNpISxtQrshket458J3WwBbzqONP7IGIN6i1yTAut+sHL5DkVGwaHqm3nxc59e+ndc
         zCTlN1OS5PyvTaVuCGjCWDTvjmjeTXJ3C6gRFphjg0QdMOieyr6b2c7+UWNp+ubFHn8r
         7du7pu7r7vRFgXyZygmOftWn7Bf5RvQ7SckGeXBCOaBegr85+SwuwxnyzWzKQJb5r54h
         /B3N/mDavKdPiATAwMAfeYAtkxgVoq4Mo6JrignLvM9YXsSyKBDdSW8MdgAI7amEykM2
         DNGw==
X-Gm-Message-State: AOJu0YwjVfrb6rnYvzki2Rw1pSfSmYKOoKdGoP6AEg4DpaqFvJPszUfQ
	WgP+mZ4sdnX3J2r1BkkwNv/wzDfDbSYDVlT3R7EvTwLRzKwdSj08+/u9rStKeqE/
X-Gm-Gg: ATEYQzwMo8kkiGOq1YIoWwv1Qi7XhNmu6sDVSpr8Gb6B32rV56VJu3g590ObJcWkaJ7
	QPpDowvUT9eDPdrzP5Yd3G/X0qnQ/F1noZ6dCZ1Zb6BY0gIKdKO0LfHKIXvMhAU11yHmYjZ8y0W
	HWD4uUf4RMWVwsQG6FljNBqpcJeVnuu4pR0wGXSy5Z/oJ2nBxNroqL37NocBKpp9IR0cz7lwf/T
	eX5baAMOxQXu+SUHFez9ioEUA1RbCr2JD7HIavV8krBRoM1bCajfSgfPqWFErvl/vM+pFOkuzu2
	ToN65cMA1fcnmWMjQgjgGY7TkEzMGQ9L6maBQiD7yjZ32tjPiKcKhGQ+vTuN8KwCl6L4aK9d4KC
	nrKO+2ct272+G5PMidGPGGRVQDQs1t1F1uGBMwcaHu/eUuqLTVZqXO6UhRihcgi0dI3Q0GlEgHf
	bmdMm3vB2AeB4tdXS3TSM8w5QuCeAGvLEfRcTrZFT0tlOFL+oFumzgHhFAEVS67ANtwbcvag==
X-Received: by 2002:a05:600c:19ca:b0:485:3d43:7c9a with SMTP id 5b1f17b1804b1-4853d437d40mr110653125e9.25.1773162581377;
        Tue, 10 Mar 2026 10:09:41 -0700 (PDT)
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
Subject: [PATCH v1 27/27] xen/riscv: add initial dom0less infrastructure support
Date: Tue, 10 Mar 2026 18:09:00 +0100
Message-ID: <a66c727d0b99b9de41f516e1304b1a70192c9392.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 78E7F255624
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Open questions:
 - Move declaration of p2m_set_allocation() to xen/fdt-domain-build.h or
   xen/dom0less-build.h as it is used in common code of Dom0less and
   there is not too much sense in declaration of it for each arch which
   supports Dom0less. It could be ifdef-ed in common header as, at the
   momemnt, it is used only for Dom0less.
 - Shouldn't declaration/defintion of max_init_domid move to common code
   instead of having it for each architecture separately? If yes, then what
   would be the best place.
---
---
 xen/arch/riscv/Kconfig              |  1 +
 xen/arch/riscv/dom0less-build.c     | 18 ++++++++++++++++++
 xen/arch/riscv/domain-build.c       | 13 +++++++++++++
 xen/arch/riscv/include/asm/domain.h |  8 ++++++++
 xen/arch/riscv/include/asm/p2m.h    |  2 ++
 xen/arch/riscv/include/asm/setup.h  |  4 +++-
 xen/arch/riscv/setup.c              |  2 ++
 xen/include/public/arch-riscv.h     |  3 +++
 8 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 091510380949..abd579aa6a54 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -6,6 +6,7 @@ config RISCV
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
 	select HAS_DEVICE_TREE_DISCOVERY
+	select HAS_DOM0LESS
 	select HAS_PMAP
 	select HAS_UBSAN
 	select HAS_VMAP
diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index 43c8bdc52300..865311ec7037 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -43,3 +43,21 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
 
     return 0;
 }
+
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+    /* Nothing to do */
+}
+
+int __init arch_parse_dom0less_node(struct dt_device_node *node,
+                                    struct boot_domain *bd)
+{
+    /* Nothing to do */
+    return 0;
+}
+
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    return 0;
+}
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index ae26faed09ed..20735f41d646 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -154,9 +154,22 @@ int __init make_cpus_node(const struct domain *d, void *fdt)
     return res;
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
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 21a3e6876f36..a8342ca7c5bf 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -20,6 +20,14 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
+#ifdef CONFIG_RISCV_64
+#define is_32bit_domain(d) (0)
+#define is_64bit_domain(d) (1)
+#else
+#define is_32bit_domain(d) (1)
+#define is_64bit_domain(d) (0)
+#endif
+
 struct arch_vcpu_io {
 };
 
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 4441c0400b83..d97c8d13ef6b 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -259,6 +259,8 @@ void p2m_ctxt_switch_from(struct vcpu *p);
 void p2m_ctxt_switch_to(struct vcpu *n);
 void p2m_handle_vmenter(void);
 
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 1c23043f409f..2e3f8931d01b 100644
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
index 5bc34e41fe55..513f94777f38 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -32,6 +32,8 @@
 #include <asm/traps.h>
 #include <asm/vsbi.h>
 
+domid_t max_init_domid = 0;
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 91cee3096041..3c0c786c57ac 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -58,6 +58,9 @@ typedef uint64_t xen_ulong_t;
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
 
+#define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
+#define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
+
 struct vcpu_guest_context {
 };
 typedef struct vcpu_guest_context vcpu_guest_context_t;
-- 
2.53.0


