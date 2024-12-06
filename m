Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51489E665C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849407.1264005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9w-0004Ro-3Y; Fri, 06 Dec 2024 04:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849407.1264005; Fri, 06 Dec 2024 04:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9v-0004Ng-RX; Fri, 06 Dec 2024 04:41:43 +0000
Received: by outflank-mailman (input) for mailman id 849407;
 Fri, 06 Dec 2024 04:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9u-0004Ka-50
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 619fc92f-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6750BA43EEF;
 Fri,  6 Dec 2024 04:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8D96C4CED1;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D21F2E77173;
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
X-Inumbo-ID: 619fc92f-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=2WgWqZsNDflVD6JmnKTRAOPbRC5jJUlqppnLV6LXXy4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eFVU2m0MN1WdzL+1zbIbqDbDYwa9z1Mr9M1oPjJvCwWXkaXsAfzWiZQFuhrPbIcr2
	 nAvRMg5F3PJTqc6q153JNQkfmBacrI1Q4a9/ZMexcU7YmXwid8fTTZWdvPs8ZDkblq
	 IcvJp8HzxF2lUT0tmHE6uokd+ncoq83kQEXK0lSsRF3DxAi0tNsqQXxx7Uw42xixnS
	 gtiiQLpoNi6l7H/gPWv7j8rRyfZpzB+Hxo0gKKpxCQWFYnfb1TD6rfgytu5hGvkLx4
	 aA9DgEvxgSclbOxgr+uGf92wH0hC0TOvsyf/M8gC4XW1yUxs3R9m0dDTwgo0ZEPgtw
	 IHtSBGOlOfKsg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:39 -0800
Subject: [PATCH v2 09/35] x86/domain: print emulation_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=1263;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=732gIMLcaCgGTFTHv9vAjNIT6ES/ZZttjeIUCT3F6PI=;
 b=Y7HK/z6jmiAxr9LffbLx3VzuTnpvsJKN4W5zpRGYQrcHh7C1xfTaL3qBH1d/hc6odnj49z0ll
 kg3ON+vpt6nA9uN2Ik2YEXEG2SpMz1AzDdlcvsmncdiJ05m4eO9kdq9
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Print d->arch.emulation_flags on the console for better traceability while
debugging in-hypervisor hardware emulators.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/domain.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9120901d0a70fb3bc1bd6a8b6917d..c88d422a64544531c1e1058fa484364bb4277d1e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
 
     if ( !emulation_flags_ok(d, emflags) )
     {
-        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
+        printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "
                "with the current selection of emulators: %#x\n",
-               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
+               d->domain_id,
+               is_hvm_domain(d) ? "HVM" : "PV",
+               is_hardware_domain(d) ? "(hardware) " : "",
+               emflags);
         return -EOPNOTSUPP;
     }
+    printk(XENLOG_G_INFO "d%d: emulation_flags %#x\n", d->domain_id, emflags);
     d->arch.emulation_flags = emflags;
 
 #ifdef CONFIG_PV32

-- 
2.34.1



