Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533D9D9FAF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844281.1259875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG53L-0000Is-S1; Tue, 26 Nov 2024 23:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844281.1259875; Tue, 26 Nov 2024 23:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG53L-0000G9-OU; Tue, 26 Nov 2024 23:33:07 +0000
Received: by outflank-mailman (input) for mailman id 844281;
 Tue, 26 Nov 2024 23:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sm-0000At-Dq
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dc3ccbf-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D25375C5D3C;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08ACFC4CED2;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F3EF3D66B9A;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
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
X-Inumbo-ID: 3dc3ccbf-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNkYzNjY2JmLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzIzLjI1NDg4OSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663317;
	bh=70k9tJWzxtakueDep8Z1r6BQFS566Fm/qs8rAVna/Is=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jJCZv7my8H/3lS+3bdlfiB83uaPSOwCH3+jJeeXZZTOAPn2xwqA6s9B26wCFmxouc
	 dJAeEomRCDXxgvwx+zpUOevdODJ/mohAivCKU9vxU+QiTLq9ppACjw6n8z/UA+dpfK
	 gRYAK4fFaGGlqQs9+31gxr2xaXplzaQQGIgEkP6ZawoZJH0sR3/dUTJBXUGxep1S6t
	 1MCs8hCEeBSIhCMHpzrqZlMl2lf+gFok8tyChn/d/baw4rzCZXeWHndR0BiaFdBOKL
	 lQ1o5TU/hdA3uyoDv9FIgouVQTn8whv/LlRl9i+ukJfUpia2TmnrF89dT8EOzJyPga
	 eRmRO2+OXDyHg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:13 -0800
Subject: [PATCH 23/36] xen/console: introduce console_owner_domid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-23-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1498;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=B93paIiJy8o1DGD2n2g3KcZoYn4UUAYMMgdZEki+Vh4=;
 b=a1KLhgIP/wkGHh4LRPTxOwbLhltFvdmll2s4Flx4yZG+kptxLNfIi4RPcJXe1hUfAR75LCSDK
 CPqJbPQrUXiBdavoxzNDPIXzGTnXA1tR5jPRZbungeACqaHpREZ+6Ui
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



