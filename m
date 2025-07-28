Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873BB142E7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 22:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061940.1427562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUNY-0003uA-Jb; Mon, 28 Jul 2025 20:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061940.1427562; Mon, 28 Jul 2025 20:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUNY-0003rm-G8; Mon, 28 Jul 2025 20:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1061940;
 Mon, 28 Jul 2025 20:23:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLX+=2J=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugUNX-0003qZ-Lj
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 20:23:23 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b39a6579-6bf0-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 22:23:20 +0200 (CEST)
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
X-Inumbo-ID: b39a6579-6bf0-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753734199; x=1753993399;
	bh=+EKVNvHj2ysPSyqLt4ONvc2c/owLM+TnjlI1mI+lhRg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZY61srnT8yfyV2C5UcEIr3aefREcEc+oH/xT/1cG+l0f82HHBdj3dvXZ0cm/j/F6p
	 ns6W8aOmIJ+7W2AjWOxydZ4aIylyXAziRKxC8iNESua6Y8oKfBh9gWxj7hFulVcDux
	 n00FHTQlrNjQU+EtBoTgtjknATPOqtXVwFZpqhXB2CXbS7hNsZQtrW+7MTOcz7lKv3
	 VdSuld79jLPbND/wB/LS12IcUHKVUPB//1LAMhXh7ORF6h0mQdCKJ66Xw/P0B06vvj
	 UNLr+BUUBrGbRcHgZq9B2LBognpXfkTHdhHGT9HMatC9WBpmUX9pYbUDoazDGMF30x
	 uzwWzDoJC0GqQ==
Date: Mon, 28 Jul 2025 20:23:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 2/2] drivers/ns16550: remove use of run_in_exception_handler()
Message-ID: <20250728202300.1017904-3-dmukhin@ford.com>
In-Reply-To: <20250728202300.1017904-1-dmukhin@ford.com>
References: <20250728202300.1017904-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 052e8a7412d27932c2661177b6269b4756d2d684
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Polling is relevant for early boot only where facilities requiring
run_in_exception_handler() are not used (e.g. 'd' keyhandler).

Rework ns16550_poll() by droppping use of run_in_exception_handler().

The ground work for run_in_exception_handler() removal was done under XSA-4=
53:
https://xenbits.xen.org/xsa/advisory-453.html

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/ns16550.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 0bbbafb49f6d..c10bff596b3b 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -214,21 +214,14 @@ static void cf_check ns16550_interrupt(int irq, void =
*dev_id)
     }
 }
=20
-/* Safe: ns16550_poll() runs as softirq so not reentrant on a given CPU. *=
/
-static DEFINE_PER_CPU(struct serial_port *, poll_port);
-
-static void cf_check __ns16550_poll(const struct cpu_user_regs *regs)
+static void cf_check ns16550_poll(void *data)
 {
-    struct serial_port *port =3D this_cpu(poll_port);
+    struct serial_port *port =3D data;
     struct ns16550 *uart =3D port->uart;
-    const struct cpu_user_regs *old_regs;
=20
     if ( uart->intr_works )
         return; /* Interrupts work - no more polling */
=20
-    /* Mimic interrupt context. */
-    old_regs =3D set_irq_regs(regs);
-
     while ( ns_read_reg(uart, UART_LSR) & UART_LSR_DR )
     {
         if ( ns16550_ioport_invalid(uart) )
@@ -241,16 +234,9 @@ static void cf_check __ns16550_poll(const struct cpu_u=
ser_regs *regs)
         serial_tx_interrupt(port);
=20
 out:
-    set_irq_regs(old_regs);
     set_timer(&uart->timer, NOW() + MILLISECS(uart->timeout_ms));
 }
=20
-static void cf_check ns16550_poll(void *data)
-{
-    this_cpu(poll_port) =3D data;
-    run_in_exception_handler(__ns16550_poll);
-}
-
 static int cf_check ns16550_tx_ready(struct serial_port *port)
 {
     struct ns16550 *uart =3D port->uart;
--=20
2.34.1



