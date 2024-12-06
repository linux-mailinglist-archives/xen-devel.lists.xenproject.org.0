Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607E9E665A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849406.1263997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9v-0004Nj-Ml; Fri, 06 Dec 2024 04:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849406.1263997; Fri, 06 Dec 2024 04:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9v-0004L6-J4; Fri, 06 Dec 2024 04:41:43 +0000
Received: by outflank-mailman (input) for mailman id 849406;
 Fri, 06 Dec 2024 04:41:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9t-0004Ka-Rt
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 617d9a13-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 438EA5C7301;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96D5BC4CEE1;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 85447E7716F;
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
X-Inumbo-ID: 617d9a13-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=8N48N7tGzPRpnph3uUKQy0qYgM/g5Ojg1QgMgxF7sN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B7AKTba+ZCUl25/KVnwXJy8Hx4furWv40RdLJaBnWVuOeZFlL/5lXJCq2aX3vKNY0
	 FOPix4J8eUDtwg7EjiUI9azlKC5V7Ci32+o22yC5GcEML6yz2jSqzMyg9ZW6vutoIM
	 ZFTso8B0JdpV5SlGxqfc+o0tWdfJ4oeDBHAHJVm+WEwcrSxmZH6i5xaTkJY1josudm
	 ZGXCgRot0jLMbpwx3mN+hBvdUELrLXlCeiCVP5OA9c89lUik+igDLmmsrAE+5evPFH
	 RbJad18NKxmI4mCFErwyOwedH1ceSBgUOmilmdSsGu38B3PqTqJQw0wCP+BMf9v2GM
	 JanRKrjFnDcvA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:34 -0800
Subject: [PATCH v2 04/35] arm/vuart: use guest_printk()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-4-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=1513;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=6dwRL08Xk+9xlKPfi6ImA8lNmAhhTdKU8a+CgXv8hC0=;
 b=r5qb9yLpCd19QazESKUYeqUw7XPz66116TcHZEi5I9uE5J5SBT20R+uyqiC8flWJlNa2WIADE
 piEke0mFrzmBELwfn54JWQkHGG+Fa1aPdvjA0UdJOW55FV1zieIoAsz
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Use guest_printk() in all current in-hypervisor UART emulators.

That slightly improves the logging as guest_printk() already prints the
domain ID.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vpl011.c | 2 +-
 xen/arch/arm/vuart.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 1fc3114cce9ddb48cf199834c8e9abe8cfba92b5..8ade6f2588b8bbcc58fb0f9edc324502a1992ce7 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -107,7 +107,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
             if ( data != '\n' )
                 intf->out[intf->out_prod++] = '\n';
             intf->out[intf->out_prod++] = '\0';
-            printk("DOM%u: %s", d->domain_id, intf->out);
+            guest_printk(d, "%s", intf->out);
             intf->out_prod = 0;
         }
     }
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index ac76e2327bb84f05ea5716c6f5550f94812d2827..38ce8cc14fac4132578059b696be952b29fab809 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
         if ( c != '\n' )
             uart->buf[uart->idx++] = '\n';
         uart->buf[uart->idx] = '\0';
-        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
+        guest_printk(d, "%s", uart->buf);
         uart->idx = 0;
     }
     spin_unlock(&uart->lock);

-- 
2.34.1



