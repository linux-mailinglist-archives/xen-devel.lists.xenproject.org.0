Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EF2E281C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 17:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58759.103539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksTon-0004eY-Vr; Thu, 24 Dec 2020 16:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58759.103539; Thu, 24 Dec 2020 16:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksTon-0004e8-S7; Thu, 24 Dec 2020 16:50:25 +0000
Received: by outflank-mailman (input) for mailman id 58759;
 Thu, 24 Dec 2020 16:50:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ksTom-0004e0-UI
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 16:50:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksTom-0001Wf-Ic; Thu, 24 Dec 2020 16:50:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksTom-00016r-9j; Thu, 24 Dec 2020 16:50:24 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=T5b8OXlmfA5c+LhCQAD6AHBhLsAIyHkQ9Ac1BK65xNI=; b=TiV7G3Jl0V1eQ1WKDcJEnubYDB
	cb+jjyRJOxssl1pmdki/otdmJDBL3jzXPeDLqVrkGGaeu3N3RTWFxXZ47guTCgQoWxgaZQmJJuqqZ
	l9RiyyCdZCtFxFpoVL36MhvpAC9o/2aOcNNKNzWzRJQgXe4LdrtDmGa/FW+k8WZ8g/s8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/serial: scif: Rework how the parameters are found
Date: Thu, 24 Dec 2020 16:50:21 +0000
Message-Id: <20201224165021.449-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

clang 11 will throw the following error while build Xen:

scif-uart.c:333:33: error: cast to smaller integer type 'enum port_types' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
    uart->params = &port_params[(enum port_types)match->data];
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

The error can be prevented by directly storing a pointer to the port
parameters rather than the a cast of the port type.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Only build tested as I don't have the HW.
---
 xen/drivers/char/scif-uart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 9d3f66b55b67..ee204a11a471 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -286,8 +286,8 @@ static struct uart_driver __read_mostly scif_uart_driver = {
 
 static const struct dt_device_match scif_uart_dt_match[] __initconst =
 {
-    { .compatible = "renesas,scif",  .data = (void *)SCIF_PORT },
-    { .compatible = "renesas,scifa", .data = (void *)SCIFA_PORT },
+    { .compatible = "renesas,scif",  .data = &port_params[SCIF_PORT] },
+    { .compatible = "renesas,scifa", .data = &port_params[SCIFA_PORT] },
     { /* sentinel */ },
 };
 
@@ -330,7 +330,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
 
     match = dt_match_node(scif_uart_dt_match, dev);
     ASSERT( match );
-    uart->params = &port_params[(enum port_types)match->data];
+    uart->params = match->data;
 
     uart->vuart.base_addr  = addr;
     uart->vuart.size       = size;
-- 
2.17.1


