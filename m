Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFB9E6656
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849408.1264009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9w-0004Z2-CO; Fri, 06 Dec 2024 04:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849408.1264009; Fri, 06 Dec 2024 04:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9w-0004RG-6b; Fri, 06 Dec 2024 04:41:44 +0000
Received: by outflank-mailman (input) for mailman id 849408;
 Fri, 06 Dec 2024 04:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9u-0004Kb-CC
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617b5f8d-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A085A438D2;
 Fri,  6 Dec 2024 04:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F72EC4CEE3;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 95DF9E77173;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
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
X-Inumbo-ID: 617b5f8d-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=bTKPqZAc34jvickLJXvP5NAA91sRqludt+wCep7eH1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X1Z+RCdC6743SeS1lGFzXjH+Rno1zVaTL+63bSmr73koOsdjSsSgmtnwSh1zP/6rK
	 f2XLz16uPLyy74nfOecLe3+f1fDKfG2p46fluY9dD7+3ziwzfupD96STPvqq9tbf0c
	 bUYwxgg9CwB7c7ToN34dqGeaD1yV2WoYYRWtgEszLCXU/QIH7WE7VI2tURwUHGXtdy
	 DSwjHzRuY7yqMqpCabccf6z8iDZpia+Fd/35Y6MjHKfXqyIoxDn5C9HwEp955fH0QR
	 WqXGsUCLhzduH2XwMN9m+6EcCwUjgQOJORy6RMqxFmv7AM7tAUSs39u/qwM6aCi451
	 0JkBPjww/Wf+A==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:35 -0800
Subject: [PATCH v2 05/35] arm/vuart: make domain_has_vuart() public
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-5-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=3833;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=SVfYvrMsNY/TLDndYHXbgUHVOFhA4YTrVOLvr92vE7k=;
 b=KMBAyLtbB0Ts4a079gWdldbMDGnLogOr8Cebv62MircIQWQpRoRbNbWS6+p88uFLYfP/pXyVi
 Gzrxs1rf9uNBhhLQq24G16NdpQXXlSEicpPnATBvCVuUGsFulswQ37a
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Move domain_has_vuart() to arch namespace as preparation code change for
architecture-agnostic way of forwarding physical console to the guest OS w/
in-hypervisor UART emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/dom0less-build.c     |  2 ++
 xen/arch/arm/domain.c             | 19 ++++++++++++-------
 xen/arch/arm/domctl.c             |  4 +++-
 xen/arch/arm/include/asm/domain.h |  9 +++++++++
 xen/arch/arm/vuart.c              |  2 --
 5 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f328a044e9d3bb5c9d358456c2ead5d2f125fbb1..de64ee930fdfe9a1c2842761275641485f69f675 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -831,6 +831,8 @@ static int __init construct_domU(struct domain *d,
         rc = domain_vpl011_init(d, NULL);
         if ( rc < 0 )
             return rc;
+
+        d->arch.emulation_flags |= ARM_EMU_VUART;
     }
 
     rc = prepare_dtb_domU(d, &kinfo);
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3ba959f866338d2e7f7dc0e301cd79c10fbc4549..02f9d59b38b4b7f6f73d97c421c9948c90e681d5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -769,14 +769,19 @@ int arch_domain_create(struct domain *d,
         if ( !vgic_reserve_virq(d, GUEST_EVTCHN_PPI) )
             BUG();
     }
+    else
+    {
+        /*
+         * Virtual UART is only used by linux early printk and decompress code.
+         * Only use it for the hardware domain because the linux kernel may not
+         * support multi-platform.
+         */
+        rc = domain_vuart_init(d);
+        if ( rc )
+            goto fail;
 
-    /*
-     * Virtual UART is only used by linux early printk and decompress code.
-     * Only use it for the hardware domain because the linux kernel may not
-     * support multi-platform.
-     */
-    if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
-        goto fail;
+        d->arch.emulation_flags |= ARM_EMU_VUART;
+    }
 
     if ( (rc = domain_vpci_init(d)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 9d047065ba13ffe003d2565879cd073e78f76893..f80d34bf5f3d323a15db7f032073be52ea1009ae 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -42,9 +42,11 @@ static int handle_vuart_init(struct domain *d,
         return -EOPNOTSUPP;
 
     rc = domain_vpl011_init(d, &info);
-
     if ( !rc )
+    {
         vuart_op->evtchn = info.evtchn;
+        d->arch.emulation_flags |= ARM_EMU_VUART;
+    }
 
     return rc;
 }
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f1d72c6e48dfeba347b4cd091ca33603c368b7c0..2bbd3f472176bdcfbc0f95f9d8809343d11965c8 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -119,8 +119,17 @@ struct arch_domain
     void *tee;
 #endif
 
+    /* Emulated devices enabled bitmap. */
+    uint32_t emulation_flags;
+
 }  __cacheline_aligned;
 
+enum {
+    ARM_EMU_VUART           = BIT(0, U),
+};
+
+#define domain_has_vuart(d)     (!!((d)->arch.emulation_flags & ARM_EMU_VUART))
+
 struct arch_vcpu
 {
     struct {
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index 38ce8cc14fac4132578059b696be952b29fab809..1fd980bd3a83820b382f875eb87ce4b8d83ccebe 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -31,8 +31,6 @@
 
 #include "vuart.h"
 
-#define domain_has_vuart(d) ((d)->arch.vuart.info != NULL)
-
 static int vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
                            register_t *r, void *priv);
 static int vuart_mmio_write(struct vcpu *v, mmio_info_t *info,

-- 
2.34.1



