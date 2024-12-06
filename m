Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30769E665B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849420.1264120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA6-0007S0-H3; Fri, 06 Dec 2024 04:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849420.1264120; Fri, 06 Dec 2024 04:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA6-0007DH-4u; Fri, 06 Dec 2024 04:41:54 +0000
Received: by outflank-mailman (input) for mailman id 849420;
 Fri, 06 Dec 2024 04:41:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9z-0004Ka-MQ
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63b0a2cb-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 118C75C731A;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5D68C4CEE1;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9D6E77179;
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
X-Inumbo-ID: 63b0a2cb-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=70k9tJWzxtakueDep8Z1r6BQFS566Fm/qs8rAVna/Is=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c3NdRxrqCvEV62tN4hsqcZTPtfE4RgPlSdoCGonfz9cV69ojSBT7UTIyUqG8hMLmd
	 bB8Uc1ysYXJ/7jzaDCATOfCzpx9ro8LPrB5HyMMFDbrdeI0Aw6sZETaWukcjpJfpIO
	 ZLBOiRdyT2bpKNpDgjsIWLnd2Nmoi0z4yR02dCqEFeuUbQ9HoDfOj4T48frmIAOiS5
	 2CChhNXhld9o1KwZMY8NEH3Mb0hpKUfF6HzIpeviE99HAO5kB8of9BL0dIV8XZHgpZ
	 oOLyCiOgwHWjB9SYKnvkagRo92j4V3nfzrX00ocJ4aetS2wwm36ebvUHy7sCv6YyVk
	 5CIGZwm0Goyfw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:50 -0800
Subject: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=1498;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=B93paIiJy8o1DGD2n2g3KcZoYn4UUAYMMgdZEki+Vh4=;
 b=Knkc/GPlePCDp77YoynQwfl3vAq4MXPN4bGfSacAecxhgdGewN2VzhLvq78O/rqeOAPhPSSP+
 d4gtAVUmJSEDCqv/TzQSACQbYlZC+3mE3ziOkjv6lNWXlNd0dODNmWy
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

console_owner_domid() is introduced to obtain the "console owner" domain ID.

The call is used in NS8250 emulator to identify the case when physical xen
console focus is owned by the domain w/ NS8250 emulator, in which case,
messages from guest OS are formatted w/o '(XEN)' prefix.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 5 +++++
 xen/include/xen/console.h  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 52cf64dbf6fd18d599cb88835d03501a23b3e3c4..a8ab5c2bcb98e4cadf9ad2c9ad28d297977d0557 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -498,6 +498,11 @@ struct domain *rcu_lock_domain_console_owner(void)
     return rcu_lock_domain_console_by_id(console_owner);
 }
 
+domid_t console_owner_domid(void)
+{
+    return console_owner;
+}
+
 static bool console_owner_possible(domid_t domid)
 {
     struct domain *d;
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 57c482cfbf2da15b011e64841ea086e779f4588d..83be5794aff6630beaad46f910fcc0fc6d833808 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -33,6 +33,7 @@ void console_end_log_everything(void);
 
 struct domain *rcu_lock_domain_console_owner(void);
 int console_set_owner(domid_t);
+domid_t console_owner_domid(void);
 
 /*
  * Steal output from the console. Returns +ve identifier, else -ve error.

-- 
2.34.1



