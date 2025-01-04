Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9CA011A2
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864702.1275932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQi-0005DD-G0; Sat, 04 Jan 2025 01:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864702.1275932; Sat, 04 Jan 2025 01:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQi-0005BF-9e; Sat, 04 Jan 2025 01:58:20 +0000
Received: by outflank-mailman (input) for mailman id 864702;
 Sat, 04 Jan 2025 01:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQh-0005Ax-4U
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c87a119-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBEAA5C60DF;
 Sat,  4 Jan 2025 01:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8C30C4CEE1;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C0D91E77198;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
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
X-Inumbo-ID: 5c87a119-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955894;
	bh=tVS12C3USoReyjZxz4AVM9AHh6CImFwneSMxcZyOSa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t56hCG20y/WyCEIkZGqGRW9p2xOe7f+eCta5fx4HRyrE17LlXUl8aHToFHApOj7xW
	 GN0FmA2K7qJUVED7ztlLhErSloOzjSnXrMUiMu+sNIHlQQ79FBYYt7YwHaPWnUXd8h
	 Rx+dNAIljirHypcYcZ1g5yutC+/Ep+ccS7EWXPw8BDmdVwhwlU+oxnPuQyz70iDeYW
	 X54LoNVrGaQDWHTLX4PT1BG2wRbcLvhsUyRHaTYxIVPNrTClrp8SpMJILY7/k2vbsF
	 yp3gzSVIkzrViYCs5PJXz5wNOKz0TgWw0skhOGq++CsKqMASvHzP4NYSHTzYSAh4Ok
	 yMwikRbXEvwgw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:09 -0800
Subject: [PATCH v3 03/24] arm/vuart: add hwdom prefix to UART emulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-3-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=5463;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=40dwRBx75DrBuSFfvZFLHZmEe2vsPE5uifchSIh7mKk=;
 b=O03Oul5Yz2t/R10EGb36YwgTtsEtmTIUs7q1wxPKjY2LshZm6JN+BWIF22uZs0UHVoxm1LCD0
 6jxn7KWnS68CDKjU4ybD+6OapE+CUUrGstgWybDjSOqQT5C1IeLg9Zq
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Using "vuart" in UART emulator designed for hardware domain debugging
is confusing in generic Arm code (e.g. vpl011 is also "vuart").
Fix that by adding hwdom prefix to all symbols in arm/vuart.c.

Also, remove domain_has_vuart() from arm/vuart.c since it is not needed.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/domain.c |  4 ++--
 xen/arch/arm/vuart.c  | 35 +++++++++++++++--------------------
 xen/arch/arm/vuart.h  |  8 ++++----
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3ba959f866338d2e7f7dc0e301cd79c10fbc4549..7ef1a95c290752d5a0167806e298aacc834ea640 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -775,7 +775,7 @@ int arch_domain_create(struct domain *d,
      * Only use it for the hardware domain because the linux kernel may not
      * support multi-platform.
      */
-    if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
+    if ( is_hardware_domain(d) && (rc = hwdom_vuart_init(d)) )
         goto fail;
 
     if ( (rc = domain_vpci_init(d)) != 0 )
@@ -844,7 +844,7 @@ void arch_domain_destroy(struct domain *d)
     iommu_domain_destroy(d);
     p2m_final_teardown(d);
     domain_vgic_free(d);
-    domain_vuart_free(d);
+    hwdom_vuart_free(d);
     free_xenheap_page(d->shared_info);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index 98a65b99385a2a119725bab8634ed7cf9d926d68..23e05dba3a5617863f6c08f085c358f2cf32a292 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -31,19 +31,17 @@
 
 #include "vuart.h"
 
-#define domain_has_vuart(d) ((d)->arch.vuart.info != NULL)
+static int hwdom_vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
+                                 register_t *r, void *priv);
+static int hwdom_vuart_mmio_write(struct vcpu *v, mmio_info_t *info,
+                                  register_t r, void *priv);
 
-static int vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
-                           register_t *r, void *priv);
-static int vuart_mmio_write(struct vcpu *v, mmio_info_t *info,
-                            register_t r, void *priv);
-
-static const struct mmio_handler_ops vuart_mmio_handler = {
-    .read  = vuart_mmio_read,
-    .write = vuart_mmio_write,
+static const struct mmio_handler_ops hwdom_vuart_mmio_handler = {
+    .read  = hwdom_vuart_mmio_read,
+    .write = hwdom_vuart_mmio_write,
 };
 
-int domain_vuart_init(struct domain *d)
+int hwdom_vuart_init(struct domain *d)
 {
     ASSERT( is_hardware_domain(d) );
 
@@ -58,7 +56,7 @@ int domain_vuart_init(struct domain *d)
     if ( !d->arch.vuart.buf )
         return -ENOMEM;
 
-    register_mmio_handler(d, &vuart_mmio_handler,
+    register_mmio_handler(d, &hwdom_vuart_mmio_handler,
                           d->arch.vuart.info->base_addr,
                           d->arch.vuart.info->size,
                           NULL);
@@ -66,15 +64,12 @@ int domain_vuart_init(struct domain *d)
     return 0;
 }
 
-void domain_vuart_free(struct domain *d)
+void hwdom_vuart_free(struct domain *d)
 {
-    if ( !domain_has_vuart(d) )
-        return;
-
-    xfree(d->arch.vuart.buf);
+    XFREE(d->arch.vuart.buf);
 }
 
-static void vuart_print_char(struct vcpu *v, char c)
+static void hwdom_vuart_print_char(struct vcpu *v, char c)
 {
     struct domain *d = v->domain;
     struct vuart *uart = &d->arch.vuart;
@@ -95,7 +90,7 @@ static void vuart_print_char(struct vcpu *v, char c)
     spin_unlock(&uart->lock);
 }
 
-static int vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
+static int hwdom_vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
                            register_t *r, void *priv)
 {
     struct domain *d = v->domain;
@@ -113,7 +108,7 @@ static int vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
     return 1;
 }
 
-static int vuart_mmio_write(struct vcpu *v, mmio_info_t *info,
+static int hwdom_vuart_mmio_write(struct vcpu *v, mmio_info_t *info,
                             register_t r, void *priv)
 {
     struct domain *d = v->domain;
@@ -123,7 +118,7 @@ static int vuart_mmio_write(struct vcpu *v, mmio_info_t *info,
 
     if ( offset == d->arch.vuart.info->data_off )
         /* ignore any status bits */
-        vuart_print_char(v, r & 0xFF);
+        hwdom_vuart_print_char(v, r & 0xFF);
 
     return 1;
 }
diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
index e90d84c6eddbb9d9089845c80062940eab997339..e6ca5582726736668765f5928b5c75e821db8aac 100644
--- a/xen/arch/arm/vuart.h
+++ b/xen/arch/arm/vuart.h
@@ -24,12 +24,12 @@ struct domain;
 
 #ifdef CONFIG_HWDOM_VUART
 
-int domain_vuart_init(struct domain *d);
-void domain_vuart_free(struct domain *d);
+int hwdom_vuart_init(struct domain *d);
+void hwdom_vuart_free(struct domain *d);
 
 #else
 
-static inline int domain_vuart_init(struct domain *d)
+static inline int hwdom_vuart_init(struct domain *d)
 {
     /*
      * The vUART is unconditionally inialized for the hw domain. So we
@@ -38,7 +38,7 @@ static inline int domain_vuart_init(struct domain *d)
     return 0;
 }
 
-static inline void domain_vuart_free(struct domain *d) {};
+static inline void hwdom_vuart_free(struct domain *d) {};
 
 #endif /* CONFIG_HWDOM_VUART */
 

-- 
2.34.1



