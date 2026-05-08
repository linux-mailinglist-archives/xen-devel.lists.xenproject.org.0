Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMAALbP2/WlklQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF04F7F90
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303749.1577076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQl-0007J7-Rn; Fri, 08 May 2026 14:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303749.1577076; Fri, 08 May 2026 14:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQl-0007Ds-Lu; Fri, 08 May 2026 14:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1303749;
 Fri, 08 May 2026 14:43:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQj-0006sB-JQ
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQj-00A90j-02
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a1-bab6-0a2a0a5309dd-0a2a450ad498-16
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:52 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a8-56b3-0a2a450a0019-d155da32b892-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:52 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-bc2a455fd55so299695866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:52 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251432; x=1778856232; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYs7BzMQgQ9bDQPKwO/Q6FA4+pq3em84Cw3U2UYtHu8=;
        b=JPP3VrCJyPqGTPCGipwY/V8+1CR0NfXe7vIZh1DAvZg00vVwaya4JlspAfwKZxRbTy
         XgosHDB69zEMwrUobrJvm0KvhVOrPJDkIw58gR/uzRNLnpFmih50WnLvUWQgWklmrmP1
         jTnCLiUHxPitJcxverdYj5HBT2UhCi5uaiKNvTOyzOiEF4Zo1T+mXCywn711Ng61QmTt
         zW5ctsktSxFwYw4U69USWnIETRSKTsx9ioUYBsM58IH3nRTd0evp3rgrul5KzIeHX/sZ
         w1fGNPf/299WSxzFbRSJ3+GI+OinxwjXfFug/xJJY1WjFLxF6MrKIQ0vtE78Nn+ZaF8I
         DZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251432; x=1778856232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYs7BzMQgQ9bDQPKwO/Q6FA4+pq3em84Cw3U2UYtHu8=;
        b=r/QMKuXZYbSuFSiT3DerUhiAS1iRtYf4GHNKsxOIAyHiQS+72TTsZINvs9v7A1Kv2D
         hJohHTUJ/an8TmSZRCtzM5kA/qHf6AGls9cXSbVTdYF/hfBJ8jxF5C6x/OjrfVK0pV6N
         4ozBvLhc8gax2o6yaZMnO0gxOsvfibwiHHE3IQi67lAt+8BfqLzsvGrptPQqdOfAK6qy
         WjCkxC4T6au8lXt744GmcxG0YhQlmZkpeVNlsRkkyWxm+uNdc01QMzXrr6f1BSQEcG9h
         JEjnxfHVWhbhteYeBbpBu4IYeyaWz+ket7hN/1fw4yyQWtINf0jz392b5w8RnkCdTqJP
         UaPQ==
X-Gm-Message-State: AOJu0YzQRKTN43jTeTqfLXairpfMWxiHg5ma4uP0QpH8OaAgUOMKkTYj
	Y8CwHxN1mZek5drK7smWz5Z+FEfek6iXSAuelw1AVa7J1fnoUlQ8npYNSWkCYw==
X-Gm-Gg: AeBDiesLt1JUoItMy0UyO0mj0F7ICGJomy/UxcshMndep+cThA62riU92hBo7LMnckV
	hudSFh9+Sz8MMQcXkMcssR6aAKV4uMBiBlqKdd4bVGXgLid2cP0AwMT62aLDXtjqRpqbIktnzM2
	P/YHKcfhtka6yc0JIfEyqFI/qr22tnmgNPOI/iUhVXYH2CUlrvfNLnu0Ra1eVvpszRS1C8mzZ0G
	8J7ojjM0BXb/6u+nWz7JXvDmXTGaMKAYi8HmZ1jnZjmNMJsFMXtNlL05F4+XUJUpWP20g9Zt+/4
	eenDjAgcQXXQQjQ05hgBhtzZ8akFkr0egMEQvJusBMzNeWCCabp/vVnwNQO7+QmaOS2m23Hy4Fe
	Llko7PmdF8tp7l1Kb8IakxcxWNPXeycrMTu4t1IELbSDLl5klEdqbt3P88i4DKN9Q50J4eHTpiH
	i4O9+3gUUSFyWgM2m5jBX5l1iUeqHqx83szB7IjpQj53eQqStGeJmbp9jnF1Km9mmwkw==
X-Received: by 2002:a17:907:a80f:b0:bc6:a223:85fc with SMTP id a640c23a62f3a-bc6a2238a97mr551923466b.36.1778251432116;
        Fri, 08 May 2026 07:43:52 -0700 (PDT)
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
Subject: [PATCH v2 10/26] xen/riscv: implement make_intc_domU_node()
Date: Fri,  8 May 2026 16:43:12 +0200
Message-ID: <425157c3414ca95665288fa3788430e96a99e3cd.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778251432-7CA798B7-CC3832A0/10/73395122804
X-purgate-type: spam
X-purgate-size: 3236
X-Rspamd-Queue-Id: 39FF04F7F90
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Introduce a RISC-V specific function to create an interrupt controller
Device Tree node for DomU domains during dom0less build.

Add make_intc_domU_node() to the dom0less build path and wire it to
a new generic helper, intc_make_domu_dt_node(), which delegates DT
node creation to the active interrupt controller implementation via
vintc_init_ops.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/intc_make_domu_dt_node/make_intc_domU_node.
 - introduce separate intc_hw_init_ops structure for init operations.
 - Return -EOPNOTSUPP instead of -ENOSYS.
 - Drop const for kinfo argument as it could be changed by interrupt
   controller node creation code.
 - Refactor make_domu_dt_node().
 - Make make_domu_dt_node part of vintc structure as it looks more logical to be
   there.
---
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/intc.h   | 12 ++++++++++--
 xen/arch/riscv/intc.c               | 11 +++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 664b0b9f9129..136d9e816a44 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -98,6 +98,8 @@ struct arch_domain {
 
     DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
     char guest_isa_str[RISCV_GUEST_ISA_STR_MAX];
+
+    struct vintc *vintc;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 8b498e43b33f..70df461a2a51 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,14 +8,13 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
-struct dt_device_node;
-
 enum intc_version {
     INTC_APLIC,
 };
 
 struct cpu_user_regs;
 struct irq_desc;
+struct kernel_info;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -46,6 +45,15 @@ struct intc_hw_init_ops {
     int (*init)(void);
 };
 
+struct vintc_init_ops {
+    /* Create interrupt controller node for domain */
+    int (*make_domu_dt_node)(struct kernel_info *kinfo);
+};
+
+struct vintc {
+    struct vintc_init_ops *init_ops;
+};
+
 void intc_preinit(void);
 
 void register_intc_ops(const struct intc_hw_operations *ops,
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 8649160403f7..0994deddcb2c 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -3,6 +3,7 @@
 #include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
@@ -73,3 +74,13 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_type(desc, desc->arch.type);
     intc_set_irq_priority(desc, priority);
 }
+
+int __init make_intc_domU_node(struct kernel_info *kinfo)
+{
+    struct vintc *vintc = kinfo->bd.d->arch.vintc;
+
+    if ( intc_hw_ops && vintc->init_ops && vintc->init_ops->make_domu_dt_node )
+        return vintc->init_ops->make_domu_dt_node(kinfo);
+
+    return -EOPNOTSUPP;
+}
-- 
2.54.0


