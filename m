Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75249D9F98
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844056.1259647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4to-0001LS-Qf; Tue, 26 Nov 2024 23:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844056.1259647; Tue, 26 Nov 2024 23:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4to-00019f-CV; Tue, 26 Nov 2024 23:23:16 +0000
Received: by outflank-mailman (input) for mailman id 844056;
 Tue, 26 Nov 2024 23:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sf-0000At-Ch
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b1d5cd9-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:21:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE78C5C5C99;
 Tue, 26 Nov 2024 23:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC458C4CEDA;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E4272D66B8E;
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
X-Inumbo-ID: 3b1d5cd9-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNiMWQ1Y2Q5LWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzE4LjY1OTU0MSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=W3lsM6sLlkNO6zjU1lHZ+u6ONjEFm+ba+WSVSjVypa4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DWG5xl3PA9EWYt6A1foAYmpaGYGMDxUuqrePoRwb34UBxkzHa5bijAvMJaKswoYGE
	 mGxMhoSwcGciCHgvN7fPLDgFcdZltrZ9IrstLF6xp0Q7Lh4VGnuFKQTjTJ9JxOy2sv
	 kgNn3LK4TBCfKcYlUS482xV5IlxiuafjKkZz9vEBPqAp3xsbXvN537pzwk9xWdkJKC
	 L0qrNyy38R/bxl8vWq4c0OjN29o73zGBrd88pM/A1T9p7MVzirlRw5TAY4NHCzjbkj
	 mzzc6d876TccV6N2sJVcgikRV1N7dapXeam0YqCjLLLER6S8Qk6+TQoIqCE2WDHeig
	 4/ZGBjHRZKwjA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:00 -0800
Subject: [PATCH 10/36] ppc/domain: introduce domain_has_vuart()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-10-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=728;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=t3QJZEOM8PRrx5tFAM37Q5lrsCWx/ouiwIRJrERCogM=;
 b=f8wXFvd3jIkFIxNMBQ/Axu1bbqXBT0SUKFv83mK3ibYkFiQYPB/1CIit84amN75UuJ8kKxZhP
 qoa3sZDsWsYBHULljtv9I1Vynu51trtpjkriYMTMTyEbSz/qdAX7tC/
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce domain_has_vuart() for PPC port to be used in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/ppc/include/asm/domain.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/domain.h
index 3a447272c6f28586bf0d610929adbf228579e13f..764978e6a61b9d7220ec10fe0763e3424d07d27a 100644
--- a/xen/arch/ppc/include/asm/domain.h
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -10,6 +10,8 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
+#define domain_has_vuart(d)         false
+
 /* TODO: Implement */
 #define guest_mode(r) ({ (void)(r); BUG_ON("unimplemented"); 0; })
 

-- 
2.34.1



