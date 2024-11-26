Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AAC9D9F93
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844048.1259612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tm-0000gj-WE; Tue, 26 Nov 2024 23:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844048.1259612; Tue, 26 Nov 2024 23:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tm-0000V3-PP; Tue, 26 Nov 2024 23:23:14 +0000
Received: by outflank-mailman (input) for mailman id 844048;
 Tue, 26 Nov 2024 23:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sc-0000At-CM
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aa2fa8b-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:21:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78BB95C5BEA;
 Tue, 26 Nov 2024 23:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B1C8C4CEDB;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 596E7D66B88;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
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
X-Inumbo-ID: 3aa2fa8b-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNhYTJmYThiLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzE3Ljg5MTk3MSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663315;
	bh=jP7Qo7rqdlhdDtQjECWtHV/Nhjgbh2HMa37UuR2ELXI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fa5bqt+h1xnsBmKLWN7RhsQfcSmOrhJvxsFWm7LcFlX4ah/uxa/fA2KRGR0PdI8Vf
	 DdppIqEwozhki1m1+mmysleQ1sjqM/oCYx15QRdFQZdp0BhMBqtU3XIGMsdnkgf9Nl
	 a6lgFHE4Nm9KAnpb4WvEji9B8K5Kx/nFjYu9iaEdkUmCNvid3n2rs/Hx3a4U1Hl9BA
	 e6qxS7fc11oYzkOTDo+DJjbKJU+H8v45MObr+DkF8HTuCzNknL8r+rtKNK0QSLZInB
	 3NzaBj0qmfyv5wZMl73GWH4fIiBML8YQgHe2Zqz8z9XuvUpVN5EVJUPtzcbg7bxp/f
	 jEw+zh0UEunPg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:21:54 -0800
Subject: [PATCH 04/36] xen/irq: introduce NO_IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-4-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=616;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=dP3fe+TbEoRyzDIKnwZpy2zc7XNhJoHUDN0gqSrT6Sc=;
 b=ZK/Egrhd1ftyBDG8fHCbgj99AZ9DcnZ5TxuavepL4iKCTofpCdmvmPQJY/yN3M2p29rTI4mg6
 v8M76j0gxtADkBiXTcySpLMh1uQQabkcw/KIGK4vj4s7sXp5Zfzx7iQ
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



