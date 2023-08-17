Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE1780015
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 23:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585635.916802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWkmo-0007yO-KW; Thu, 17 Aug 2023 21:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585635.916802; Thu, 17 Aug 2023 21:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWkmo-0007x3-GT; Thu, 17 Aug 2023 21:44:10 +0000
Received: by outflank-mailman (input) for mailman id 585635;
 Thu, 17 Aug 2023 21:44:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWkmm-0007i3-Bm
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 21:44:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWkmm-0001Ji-3m; Thu, 17 Aug 2023 21:44:08 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWkml-0002Ab-Py; Thu, 17 Aug 2023 21:44:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=I7zoXV1nPGurVpsLsqbHeCL12heA5HUJVOTneiY8xyg=; b=I8TCtvUc18bxbcOXepyZEsUMf6
	RBvc/Ya+AiTVoH5ExncbXUnBbdkYaKccjSf3Pg5qomedQFiwOeUSfo9wYbJUcJUB8xNuT96BfXfHk
	+yJexMafoe4MtnGypuF+r8GIW3qFBD3waSismQK/4/UsQApyJTlwcfS6a0iFILT6OujU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: vmmio: The number of entries cannot be negative
Date: Thu, 17 Aug 2023 22:43:54 +0100
Message-Id: <20230817214356.47174-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230817214356.47174-1-julien@xen.org>
References: <20230817214356.47174-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The number of virtual MMIO regions cannot be negative. So switch
the field 'num_entries' and 'max_num_entries' to 'unsigned int'.

The new type is then propagated to the caller and the vGIC
code.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/domain.c           | 3 ++-
 xen/arch/arm/include/asm/mmio.h | 6 +++---
 xen/arch/arm/include/asm/vgic.h | 6 +++---
 xen/arch/arm/io.c               | 2 +-
 xen/arch/arm/vgic-v2.c          | 2 +-
 xen/arch/arm/vgic-v3.c          | 2 +-
 xen/arch/arm/vgic.c             | 2 +-
 xen/arch/arm/vgic/vgic-init.c   | 2 +-
 8 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 6113ca785c78..28e3aaa5e482 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -694,7 +694,8 @@ int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
                        unsigned int flags)
 {
-    int rc, count = 0;
+    unsigned int count = 0;
+    int rc;
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
 
diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index 79e64d9af804..b22cfdac5be9 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -75,8 +75,8 @@ struct mmio_handler {
 };
 
 struct vmmio {
-    int num_entries;
-    int max_num_entries;
+    unsigned int num_entries;
+    unsigned int max_num_entries;
     rwlock_t lock;
     struct mmio_handler *handlers;
 };
@@ -86,7 +86,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 void register_mmio_handler(struct domain *d,
                            const struct mmio_handler_ops *ops,
                            paddr_t addr, paddr_t size, void *priv);
-int domain_io_init(struct domain *d, int max_count);
+int domain_io_init(struct domain *d, unsigned int max_count);
 void domain_io_free(struct domain *d);
 
 void try_decode_instruction(const struct cpu_user_regs *regs,
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index aa9f49409edc..6901a05c0669 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -304,8 +304,8 @@ extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
 extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
                                   unsigned int rank);
 extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
-int vgic_v2_init(struct domain *d, int *mmio_count);
-int vgic_v3_init(struct domain *d, int *mmio_count);
+int vgic_v2_init(struct domain *d, unsigned int *mmio_count);
+int vgic_v3_init(struct domain *d, unsigned int *mmio_count);
 
 extern bool vgic_to_sgi(struct vcpu *v, register_t sgir,
                         enum gic_sgi_mode irqmode, int virq,
@@ -352,7 +352,7 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
 
 bool vgic_evtchn_irq_pending(struct vcpu *v);
 
-int domain_vgic_register(struct domain *d, int *mmio_count);
+int domain_vgic_register(struct domain *d, unsigned int *mmio_count);
 int domain_vgic_init(struct domain *d, unsigned int nr_spis);
 void domain_vgic_free(struct domain *d);
 int vcpu_vgic_init(struct vcpu *v);
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 172583df047f..96c740d5636c 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -224,7 +224,7 @@ void register_mmio_handler(struct domain *d,
     write_unlock(&vmmio->lock);
 }
 
-int domain_io_init(struct domain *d, int max_count)
+int domain_io_init(struct domain *d, unsigned int max_count)
 {
     rwlock_init(&d->arch.vmmio.lock);
     d->arch.vmmio.num_entries = 0;
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 35363fee098c..2a2eda2e6f4c 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -731,7 +731,7 @@ static const struct vgic_ops vgic_v2_ops = {
     .lpi_get_priority = vgic_v2_lpi_get_priority,
 };
 
-int vgic_v2_init(struct domain *d, int *mmio_count)
+int vgic_v2_init(struct domain *d, unsigned int *mmio_count)
 {
     if ( !vgic_v2_hw.enabled )
     {
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 1b7173da1e30..05a009409ab8 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1812,7 +1812,7 @@ static const struct vgic_ops v3_ops = {
     .lpi_get_priority = vgic_v3_lpi_get_priority,
 };
 
-int vgic_v3_init(struct domain *d, int *mmio_count)
+int vgic_v3_init(struct domain *d, unsigned int *mmio_count)
 {
     if ( !vgic_v3_hw.enabled )
     {
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 97d6f6106638..afcac791fe4b 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -85,7 +85,7 @@ static void vgic_rank_init(struct vgic_irq_rank *rank, uint8_t index,
         write_atomic(&rank->vcpu[i], vcpu);
 }
 
-int domain_vgic_register(struct domain *d, int *mmio_count)
+int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
 {
     switch ( d->arch.vgic.version )
     {
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index 76b85ea8231b..f8d7d3a226d0 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -101,7 +101,7 @@ static void vgic_vcpu_early_init(struct vcpu *vcpu)
  *
  * was: kvm_vgic_create
  */
-int domain_vgic_register(struct domain *d, int *mmio_count)
+int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
 {
     switch ( d->arch.vgic.version )
     {
-- 
2.40.1


