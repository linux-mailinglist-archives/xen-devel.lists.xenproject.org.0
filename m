Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7829E6654
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849416.1264085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA2-0006ME-8g; Fri, 06 Dec 2024 04:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849416.1264085; Fri, 06 Dec 2024 04:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA1-0006Bs-S1; Fri, 06 Dec 2024 04:41:49 +0000
Received: by outflank-mailman (input) for mailman id 849416;
 Fri, 06 Dec 2024 04:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9x-0004Ka-Ly
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63086e56-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DE2C5C730C;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11DC6C4CEDE;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0B848E77173;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
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
X-Inumbo-ID: 63086e56-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=+LyhLMcPTctK8lq8DYz5tUJcWDqBCiRHMGxFmxItyZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HBz+lNxRiLiqkCAG1Sbj8epCgg/Cp6fOqh1OfYZMGXzeLm7CsM/uW+4eYuDwjeZ+u
	 ntKEVy2vfBbN6qjG2zrmR6GM33QU91X8oz5uPJRiikGJXNR5AasNHw5k2s0x4zicuq
	 IiJpAbnv0oGEg5G6EP7+7RajPRXWFcQLPRbi/o+xSST7a1QZZrI4GTp9/oLUIpXBfs
	 cXGfBfvnz8bXfzejW4Bv30qLL9A+2bLEvlzW6pmcoETpfVr2X0rPE3yvanWbarC0+0
	 3uQZKhDRvXJjLrGsW8ytGUUQ+FzF1vHqBJWBNyXyumxGxqXgD9+r4t+xN9c4pjgot0
	 8/mX2URhGIHnA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:42 -0800
Subject: [PATCH v2 12/35] xen/console: move vpl011-related code to vpl011
 emulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-12-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=3432;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=4e0NUECCqgXdJR10Lb5Vlh9vQMFlpd/8G3QTPhFXMng=;
 b=KocrOyWBiCRdnAEiMCLW1htC7QinL+Mg1NhUgbiDAge7ljxpdEUkZHKjGaPRBPpqIuYyd94qh
 VtPCr7iMtAuCevzRbRS6SKJouJY7MRd2FPh0+9iI/OWzujWexOb2SBA
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
 xen/arch/arm/vpl011.c             | 15 +++++++++++----
 xen/drivers/char/console.c        |  4 +---
 3 files changed, 13 insertions(+), 8 deletions(-)

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
index 8ade6f2588b8bbcc58fb0f9edc324502a1992ce7..fe36fe2bd1529a4114884580ded6d6fa55a22f0e 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -567,16 +567,21 @@ static void vpl011_data_avail(struct domain *d,
 
 /*
  * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
- * It is only used when the vpl011 backend is in Xen.
  */
-void vpl011_rx_char_xen(struct domain *d, char c)
+int vpl011_rx_char_xen(struct domain *d, char c)
 {
     unsigned long flags;
     struct vpl011 *vpl011 = &d->arch.vpl011;
     struct vpl011_xen_backend *intf = vpl011->backend.xen;
     XENCONS_RING_IDX in_cons, in_prod, in_fifo_level;
 
-    ASSERT(!vpl011->backend_in_domain);
+    /* Forward input iff the vpl011 backend is in Xen. */
+    if ( vpl011->backend_in_domain )
+        return -ENODEV;
+
+    if ( intf == NULL )
+        return -ENODEV;
+
     VPL011_LOCK(d, flags);
 
     in_cons = intf->in_cons;
@@ -584,7 +589,7 @@ void vpl011_rx_char_xen(struct domain *d, char c)
     if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) == sizeof(intf->in) )
     {
         VPL011_UNLOCK(d, flags);
-        return;
+        return -ENOSPC;
     }
 
     intf->in[xencons_mask(in_prod, sizeof(intf->in))] = c;
@@ -596,6 +601,8 @@ void vpl011_rx_char_xen(struct domain *d, char c)
 
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



