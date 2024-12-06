Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A29E6655
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849409.1264017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9w-0004jn-NP; Fri, 06 Dec 2024 04:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849409.1264017; Fri, 06 Dec 2024 04:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9w-0004a7-Hw; Fri, 06 Dec 2024 04:41:44 +0000
Received: by outflank-mailman (input) for mailman id 849409;
 Fri, 06 Dec 2024 04:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9u-0004Kb-J4
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 616f521f-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2B9EA43E3F;
 Fri,  6 Dec 2024 04:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BA55C4CEDE;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2F9E77175;
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
X-Inumbo-ID: 616f521f-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=jP7Qo7rqdlhdDtQjECWtHV/Nhjgbh2HMa37UuR2ELXI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VzrVaW2cbMrG9x7Jrj87s43TAWtqcTNd2+m1z1Gk4WL/MKJSE10/C/PJtmrx8QnIW
	 +yi2g+LLAwG4bFGgjXD7GdxPYQ5U3b+veIXKy1IR1p0WAi2YZIkpSJ2FawRLk0hfzz
	 G408ojxg/NkVFunFlw8x++pozBR4dUWcimMaPCQbpdPpchIBOG+AdUSrzUTFLZIVwP
	 ov2phTvjDnXcbeOgHXQZRaDgsXb1RftI6P9OwJiEMjGbQlicUsNet27BL/bhmbP0jo
	 hW5Lbvqd70+/vqHuWhMOW92goNFvuO+txaM+S7Q3bDox9ukGih6lwNBJcdOi8foRGd
	 pEfljzO0SwpgQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:32 -0800
Subject: [PATCH v2 02/35] xen/irq: introduce NO_IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-2-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=616;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=dP3fe+TbEoRyzDIKnwZpy2zc7XNhJoHUDN0gqSrT6Sc=;
 b=GKp4UmHhqYd4CVUECgv6TOG2tNjpaTsfFbUI/8w7Tg/1Iubs7IfYMbYiQH2BZuSCKukEeBIRd
 dw9amfh326NCUqU9lJxyOuAS13v+83XcJtUb9tN5Gt5oIKGchFjF22K
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce definition for IRQ resource checks.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/include/xen/irq.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6bb5f0aa7d5bb572aca59872508a438a..aee878293ecc0de6a938bcfea1140d36b4de745a 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -53,6 +53,7 @@ struct irqaction {
 #define AUTO_ASSIGN_IRQ         (-1)
 #define NEVER_ASSIGN_IRQ        (-2)
 #define FREE_TO_ASSIGN_IRQ      (-3)
+#define NO_IRQ                  (-4)
 
 struct irq_desc;
 

-- 
2.34.1



