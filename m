Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0DB9E6657
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849427.1264162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQAE-0000Xu-H2; Fri, 06 Dec 2024 04:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849427.1264162; Fri, 06 Dec 2024 04:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQAD-0000FC-Cx; Fri, 06 Dec 2024 04:42:01 +0000
Received: by outflank-mailman (input) for mailman id 849427;
 Fri, 06 Dec 2024 04:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA2-0004Kb-0D
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 631bd654-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A45025C730F;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29627C4CED2;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1D715E77171;
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
X-Inumbo-ID: 631bd654-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=ta4eTkD9D4OUBDs5UKjXmM1SaNyKboC1ozVSiJGJ9fk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BDbPVXF39OLBkCaf44ChkLhfEnQh5AA+aAdEPGz42TrorphDQ5B9IysAgtboJ8JpO
	 LarM+rfzESVampW03fvqLyj2Q7M81cs7XOohi+JDio2oKLKApsINaz/ymZOjFR2D9h
	 NHF/6csdv/BH73wIOyXxxkQglBOdBJY+UekbpuouGyNilrPqmDk003hjOAciPjm1sq
	 jKKfbPdpjsg8m1r+fl1MXQQglbTfw4GVB7rWEpj5AZ4HFAyUU2WdJYULjiynVXgInB
	 0oNwIyaC8YV2YHIqvnHs7V+xoFmIUG/zdGmoNyZkAp1LBxnP58CVJsT5+RByVr3bCe
	 AKGQGvCv5u1NA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:43 -0800
Subject: [PATCH v2 13/35] xen/console: rename console_input_domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-13-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=2162;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=TjvkwSY30h8BpopVytXRbdfBD9IC9WbY4nf7jp2MPFs=;
 b=zeaE1xdzcz1rmGEWkbbULiMYNpdF8vIKM2kxIXRGbDkvs9GB3XLoGOpOKjhPDnOFynaL6G94y
 BDNF2sVTre6A39d5KuhX2puYeT9E2Bn+u1uXzBcSjf+s9GgIpAmb6ZQ
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

console_input_domain() takes an RCU lock to protect domain structure.
That implies call to rcu_unlock_domain() after use.

Rename console_input_domain() to rcu_lock_domain_console_owner() to
highlight the need of calling rcu_unlock_domain().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vpl011.c      | 2 +-
 xen/drivers/char/console.c | 2 +-
 xen/include/xen/console.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index fe36fe2bd1529a4114884580ded6d6fa55a22f0e..4d682e98553303b4a12f5cd7e5e67ab096cd7cc2 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -78,7 +78,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
     unsigned long flags;
     struct vpl011 *vpl011 = &d->arch.vpl011;
     struct vpl011_xen_backend *intf = vpl011->backend.xen;
-    struct domain *input = console_input_domain();
+    struct domain *input = rcu_lock_domain_console_owner();
 
     VPL011_LOCK(d, flags);
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0af4b551801356f242f1770b3826608136d65653..01fcbd5581d11f8f4f2b23592255b5c744430a3e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -477,7 +477,7 @@ static unsigned int __read_mostly console_rx = 0;
 
 #ifdef CONFIG_SBSA_VUART_CONSOLE
 /* Make sure to rcu_unlock_domain after use */
-struct domain *console_input_domain(void)
+struct domain *rcu_lock_domain_console_owner(void)
 {
     if ( console_rx == 0 )
             return NULL;
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 6dfbade3ece36352c74f1124305da945b210f2a7..0e211e44d9703c804e18f52c9743916f8d2a9d4e 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -31,7 +31,7 @@ void console_end_sync(void);
 void console_start_log_everything(void);
 void console_end_log_everything(void);
 
-struct domain *console_input_domain(void);
+struct domain *rcu_lock_domain_console_owner(void);
 
 /*
  * Steal output from the console. Returns +ve identifier, else -ve error.

-- 
2.34.1



