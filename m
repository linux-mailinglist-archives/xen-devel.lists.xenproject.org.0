Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF29E6662
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849414.1264071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA0-00060i-Om; Fri, 06 Dec 2024 04:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849414.1264071; Fri, 06 Dec 2024 04:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA0-0005u6-EB; Fri, 06 Dec 2024 04:41:48 +0000
Received: by outflank-mailman (input) for mailman id 849414;
 Fri, 06 Dec 2024 04:41:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9w-0004Ka-Lc
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62c9fd31-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6BEB75C7306;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBE87C4CEEA;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C0A58E77178;
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
X-Inumbo-ID: 62c9fd31-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=uX6eDC7J8gnEJzkAK+vFayV4YOh384qGm0SB3/a+eoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=avrLbYKG1EF7oiTpLzSi+p6WiQ4UauuUO4vJI1wxBJfqP0HTep/fmdpbossvNA2co
	 X20WpEpvBT3BOf005Ojs+fbuF7F0OjbqeNz+G3mag/JaxhthJYt2uDfK+TpLzUO7t+
	 Q99tKINVNihcqmQmoZ8ImR0pfr8Z/PVUbCas9rTHpEFTPPsCEv4EDUGpBKr0DTeD0N
	 dMWZkTjIlI9pfmYIfsmOLE4CvrEvENBGrMZTrNw1brkmVFouX3W56rKC8mgFck5Pz5
	 R+NLN41O1RfOi56obCLFefiqr3kwGd0WSz9ifMw45arh6ghob7nChf5WANLv+Ln1f1
	 rmWq4AL3jL9ew==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:38 -0800
Subject: [PATCH v2 08/35] x86/domain: introduce domain_has_vuart()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-8-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=889;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=d8+eK1EX7G4dAD9MTJCuZscRKOX31WZGg59AsNpMxsU=;
 b=cG7SkKjK5QUHyRM3m5wrGnS1pgFt0n85Fs1Xe2pmZs5Vlb0KOvwBf5tETIrxKlEyd7jpRII9O
 toWVU7GmrsPCS+fsxc/qQNc08AGwg1KYEmN2hQEgOOrZFF13XuOGfCc
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce domain_has_vuart() for x86 port to be used in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/domain.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd71c4d96279555df62fad75fe817a2b6..c1d0d1f47324e8cc678a4c76c43f86820a89e7b3 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -506,6 +506,9 @@ struct arch_domain
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
 #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
+/* NB: same symbol as in Arm port */
+#define domain_has_vuart(d) false
+
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
 #define pv_gdt_ptes(v) \

-- 
2.34.1



