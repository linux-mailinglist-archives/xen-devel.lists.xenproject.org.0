Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50429D9FB9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844374.1259955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG59F-0005I4-An; Tue, 26 Nov 2024 23:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844374.1259955; Tue, 26 Nov 2024 23:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG59F-0005Ff-6j; Tue, 26 Nov 2024 23:39:13 +0000
Received: by outflank-mailman (input) for mailman id 844374;
 Tue, 26 Nov 2024 23:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4su-0000At-Eb
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 406a0290-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E3E45C5CD9;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C63EC4CEDA;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 519D6D66B94;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
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
X-Inumbo-ID: 406a0290-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjQwNmEwMjkwLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzI2Ljg4Mjk3Nywic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=5YTuUDaV5EVnrers6QrjQT6r8NErcJtABTvZxKp9ABI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OMUL/Ri32IOYBUiHifEGwvULrRHLBD3Ipk2Js5lMmkEv2Oa8ighcsJzz0tK4l8P/K
	 RoCI9/VXPg0SJ4e4pGvrPQ/ak0+BOV3LelpEkhklE3O9YQvPr3Se5uX1VW0JzgGYhm
	 lnUmkHu8Yx65dFVR7lanOYhoplKCQIdf/9eA+E91KCN18r3wL4kP6bJ2cABNbBkNaf
	 /gqkyrFnAtdWlqXLvTxU/bO+hrENISGN1bHyiwMhOtpA4Rv0HBtpQxq6bzAeCi2AXv
	 rRw3h9rFzL9Y+vm4HQmojIiZ8MN/Z0Jv02HFKYny/zLCxeMe+xGqkS41qkUnZcMyWM
	 TEcTQmvrWznEw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:05 -0800
Subject: [PATCH 15/36] xen/console: move vpl011-related code to vpl011
 emulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-15-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=3543;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=eSoRo4IQpqEF5DX3/57J0/HMwWVyveMZrxkTrUrQksc=;
 b=Ssyod9J853vaDvi8IVQuIiYqz+IJjFLP8x8AMQfyU0pyk/+zh3NLrbs1goiBjJDowTSWQc80I
 ughd7gBeOHeAkJxyo2dIQH83kva3uuUwVA3y9DNqEgntr4GNv0lVs5L
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Xen console driver has vpl011-related logic which shall belong vpl011 emulator
code. Move vpl011-related to vpl011.c.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/include/asm/vpl011.h |  2 +-
 xen/arch/arm/vpl011.c             | 15 ++++++++++++---
 xen/drivers/char/console.c        |  4 +---
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index c09abcd7a9b3356d0809743517934adae00087f5..cc838682815c0d049ba33d3bf9966a64b2e527dd 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -69,7 +69,7 @@ struct vpl011_init_info {
 int domain_vpl011_init(struct domain *d,
                        struct vpl011_init_info *info);
 void domain_vpl011_deinit(struct domain *d);
-void vpl011_rx_char_xen(struct domain *d, char c);
+int vpl011_rx_char_xen(struct domain *d, char c);
 #else
 static inline int domain_vpl011_init(struct domain *d,
                                      struct vpl011_init_info *info)
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 140dca48e0a3901cba289dbc6eb117358134d917..3e1487b101053891c9c0fb7fb50af1c547d4cbf3 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -569,14 +569,21 @@ static void vpl011_data_avail(struct domain *d,
  * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
  * It is only used when the vpl011 backend is in Xen.
  */
-void vpl011_rx_char_xen(struct domain *d, char c)
+int vpl011_rx_char_xen(struct domain *d, char c)
 {
     unsigned long flags;
     struct vpl011 *vpl011 = &d->arch.vpl011;
     struct vpl011_xen_backend *intf = vpl011->backend.xen;
     XENCONS_RING_IDX in_cons, in_prod, in_fifo_level;
 
-    ASSERT(!vpl011->backend_in_domain);
+    /*
+     * If we have a properly initialized vpl011 console for the
+     * domain, without a full PV ring to Dom0 (in that case input
+     * comes from the PV ring), then send the character to it.
+     */
+    if ( vpl011->backend_in_domain || intf == NULL )
+        return -ENODEV;
+
     VPL011_LOCK(d, flags);
 
     in_cons = intf->in_cons;
@@ -584,7 +591,7 @@ void vpl011_rx_char_xen(struct domain *d, char c)
     if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) == sizeof(intf->in) )
     {
         VPL011_UNLOCK(d, flags);
-        return;
+        return -ENOSPC;
     }
 
     intf->in[xencons_mask(in_prod, sizeof(intf->in))] = c;
@@ -596,6 +603,8 @@ void vpl011_rx_char_xen(struct domain *d, char c)
 
     vpl011_data_avail(d, in_fifo_level, sizeof(intf->in), 0, SBSA_UART_FIFO_SIZE);
     VPL011_UNLOCK(d, flags);
+
+    return 0;
 }
 
 static void vpl011_notification(struct vcpu *v, unsigned int port)
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index bb56953bab681a13da8d41431aba4632f1919df9..0af4b551801356f242f1770b3826608136d65653 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -559,9 +559,7 @@ static void __serial_rx(char c)
          * domain, without a full PV ring to Dom0 (in that case input
          * comes from the PV ring), then send the character to it.
          */
-        if ( d != NULL &&
-             !d->arch.vpl011.backend_in_domain &&
-             d->arch.vpl011.backend.xen != NULL )
+        if ( d != NULL )
             vpl011_rx_char_xen(d, c);
         else
             printk("Cannot send chars to Dom%d: no UART available\n",

-- 
2.34.1



