Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB09D9FA4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844207.1259806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG51k-0004Tg-0W; Tue, 26 Nov 2024 23:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844207.1259806; Tue, 26 Nov 2024 23:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG51j-0004Ra-R8; Tue, 26 Nov 2024 23:31:27 +0000
Received: by outflank-mailman (input) for mailman id 844207;
 Tue, 26 Nov 2024 23:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4ss-0000At-EW
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4052cc30-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 424AC5C5CDF;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 720A2C4CED0;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 68E9ED66B97;
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
X-Inumbo-ID: 4052cc30-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjQwNTJjYzMwLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzI2Ljc2MzYwMywic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=Bn46VxfAkAcMhv6DUkrTdMnTNfB+okMDoUD+Om5BMyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m6JM8GCJGhtrmxVQvqrmhKB9kFFTklfeOAlWO5/+UU2fq0kgrPSgUXV6ImmQXliNa
	 TfqmqY4ZmR/6s4p2kAyF3HNG0ut8Z0gsysqmZWF470Wo/ILXdRF3ezJCHsPdh2Mvuw
	 Tk6zBz9+FTdtUMwHsSZgOMn8BREHv9vNoS0fZSD8f6/pg2pf5QRxkbeGBjOeq3BTjD
	 sF7MdJ9TbqgNWk92LP7fd8QPrv/eIJ6QRXFDlpXs1zGpBEdaL1F8GwrjFE0dVR9Y/U
	 x0zD9U98I/Es1TkqFRukmmZtmfM0Eg2O9WikFnfJm8sNmqKEg1LIx8966xPMTllta0
	 I9bwC9b578QoQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:06 -0800
Subject: [PATCH 16/36] xen/console: rename console_input_domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-16-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=2162;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=//8B6RWBIW7SNgnF2T6+HEA2/O3wgsD0ciOR+76PaLM=;
 b=F6KU38cCC+uW7VC+/FDMuTylh4u51qK5IZuAVjuLIRIwoAHjJEwX1ZcwPeWYsBp7Jcz2UZs+H
 m3VQ/gQTRhgDEAbVrKlIKpMw6P5C7JIWDqUAjxReSCvMICF7iavKNUM
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
index 3e1487b101053891c9c0fb7fb50af1c547d4cbf3..07ef872d72b7881a70f4a938dcd6bea4c30198d9 100644
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



