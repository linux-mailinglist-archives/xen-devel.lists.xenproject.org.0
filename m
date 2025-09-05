Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22416B4671F
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112633.1460876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq3-0002SH-91; Fri, 05 Sep 2025 23:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112633.1460876; Fri, 05 Sep 2025 23:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq3-0002OF-4B; Fri, 05 Sep 2025 23:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1112633;
 Fri, 05 Sep 2025 23:27:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufq0-00020R-Ld
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufpz-008AB8-3C;
 Fri, 05 Sep 2025 23:27:24 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufpz-0005D6-39;
 Fri, 05 Sep 2025 23:27:24 +0000
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
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=UmQzHfQSoeUK3EyjGre7Frz+a/7pj0V41RdQZawNalI=; b=R2Ldlmao5TsX5jjH26E1hrRT+N
	fMqbNTrmUfZ9T+vahssMVk1I9wk0stagNbzZ6DCviCCfeZb4u0t6FBRdOt+tKqkYsqbbru/Llh7DP
	Fythg9UWdSIP0tz8R34kAsVn6P5yLMoP8nXHDHYMcs+NeC3A5HE/lCra8LrjRjR6T8EA=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v6 05/15] emul/ns16x50: implement SCR register
Date: Fri,  5 Sep 2025 16:27:04 -0700
Message-ID: <20250905232715.440758-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add SCR register emulation to the I/O port handler.
Firmware (e.g. OVMF) may use SCR during the guest OS boot.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- moved earlier in the series to simplify I/O handler population in
  the follow on patches
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-11-dmukhin@ford.com/
---
 xen/common/emul/vuart/ns16x50.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 7f479a5be4a2..51ec85e57627 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -103,6 +103,20 @@ static int ns16x50_io_write8(
 
     if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
         regs[NS16X50_REGS_NUM + reg] = val;
+    else
+    {
+        switch ( reg )
+        {
+        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
+        case UART_SCR:
+            regs[UART_SCR] = val;
+            break;
+
+        default:
+            rc = -EINVAL;
+            break;
+        }
+    }
 
     return rc;
 }
@@ -165,6 +179,19 @@ static int ns16x50_io_read8(
 
     if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
         val = regs[NS16X50_REGS_NUM + reg];
+    else
+    {
+        switch ( reg )
+        {
+        case UART_SCR:
+            val = regs[UART_SCR];
+            break;
+
+        default:
+            rc = -EINVAL;
+            break;
+        }
+    }
 
     *data = val;
 
-- 
2.51.0


