Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B359E667C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849541.1264208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQIN-0008GS-NM; Fri, 06 Dec 2024 04:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849541.1264208; Fri, 06 Dec 2024 04:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQIN-0008Dj-KF; Fri, 06 Dec 2024 04:50:27 +0000
Received: by outflank-mailman (input) for mailman id 849541;
 Fri, 06 Dec 2024 04:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA5-0004Kb-0S
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 647d7eaa-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E48795C7334;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8338AC4CEDE;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 79E78E7717C;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 647d7eaa-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=5gdanZ5e9+ASbcswvlhUW99s0NYH3AklpGAHEKCJ1yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l7F4swuxWLy7qWUlFubA5ZMzqX3UhKLqkhKI2ES3SfsXA7oVuy7mPcpmlOZK+Xc3t
	 umwFJM4ukOQnfTR4JnynPnV9gDpo+kYhA76d7PnKd7Q9MOqDOFCjdu/R+hX/7scSWD
	 02cQ8Zx6irE4HWu+N4cq8Hsec+a9ICFctxj+iKhw7hFbLcQnQ8BC5TyUhj1gs2sSzX
	 DX/l80YRZ6bgzT/qBVI5BOrEitV3dCQapg8+TYOXk520IMr3zMx7U3+EUBh/O3NUJ4
	 LI5F+P3jqqdf9SIH2mcGp0NKjy0b7baB/Kei8fCoCWR47lmyMz9lKwk43B1KUwx8Fx
	 A14s8d/0EwjUA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:42:04 -0800
Subject: [PATCH v2 34/35] xen/console: enable console owners w/ emulated
 NS8250
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-34-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=1133;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=m+DZYhBfJNv2KVuFKRvMQy0kCP3iadnxj6rLAihix3M=;
 b=RacSKnwM5fBYuU8iskMZVZ/uehW76whDkeSjA2tP9mNGpXECzUNwGvJga6wsGA/b5LOBbFu5w
 EWu5DcHxADFDmrUml9OkGjTT4S3BA2zE90U1GzOO4ch9aJoZcj+SqBz
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Enable console focus for domains w/ virtual NS8250.

Code change allows to capture the output from the guest OS now and send it to
the physical console device.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a26daee9c4c4b1134d0ae3d105ffdb656340b6df..798dfdf3412a2feef35e72946d6c59bee59a9251 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -41,6 +41,9 @@
 #ifdef CONFIG_SBSA_VUART_CONSOLE
 #include <asm/vpl011.h>
 #endif
+#if defined(CONFIG_HAS_VUART_NS8250)
+#include <asm/hvm/vuart_ns8250.h>
+#endif
 
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] = OPT_CONSOLE_STR;
@@ -627,6 +630,8 @@ static void handle_keypress_in_domain(struct domain *d, char c)
     {
 #if defined(CONFIG_SBSA_VUART_CONSOLE)
         rc = vpl011_rx_char_xen(d, c);
+#elif defined(CONFIG_HAS_VUART_NS8250)
+        rc = vuart_putchar(&d->arch.hvm.vuart, c);
 #endif
     }
     /*

-- 
2.34.1



