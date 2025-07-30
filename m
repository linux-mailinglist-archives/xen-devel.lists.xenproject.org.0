Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231ACB157C1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 05:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063323.1429065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugxG7-0000Hz-PW; Wed, 30 Jul 2025 03:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063323.1429065; Wed, 30 Jul 2025 03:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugxG7-0000Er-MX; Wed, 30 Jul 2025 03:13:39 +0000
Received: by outflank-mailman (input) for mailman id 1063323;
 Wed, 30 Jul 2025 03:13:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugxG6-0008Cm-JJ
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 03:13:38 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f72f59f-6cf3-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 05:13:37 +0200 (CEST)
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
X-Inumbo-ID: 2f72f59f-6cf3-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=q2gtuxcuw5e25mjuj45p6zadby.protonmail; t=1753845217; x=1754104417;
	bh=usoDeS+4khp/MHc5DyBYZ0X/4qx5+hiYZzBcijQdvYM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TkIyV80MsJ1aKE53u+ERZeRnm21UZjFx8B/hDtycypaPL+gT9dT/OMwY26KOGXw4u
	 pYJEHKzy4AGyxUhkrkMHCCQS7M5iLCEBO4B7k5M+RWIK2iegzjcErWrz9r5fGrQ/tx
	 kmjIui0YDcfU3PQ+e8XOpP935Cn6ndpZlHvjeUKWN1UZg5z7bnVWAg2vkRp0IjPL6j
	 4P+ZPimwymej6u68R2l0YfPWZNUNyIL2At3J9C8lNbMq63UnQ5g1gAVnV8Wi2cWPiP
	 bGiwO7HvxRP7XKTnlUgyWuOmQWx7ecXbnZbvrBVPLQR6F7o1wWDEcB9avTnqZOwtXL
	 RnRfk7pal0x/g==
Date: Wed, 30 Jul 2025 03:13:31 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] ns16550: ensure polling timer is disarmed
Message-ID: <20250730031249.1613142-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8a6d0a48b4a7035ad2b2b74530c98117b42ea6e8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

As it stands, polling timer is kept in the list of timers even after the
interrupts have been enabled / polling disabled on ns16550-compatible UART.

Ensure polling timer is removed from the timer list once UART interrupts ar=
e
enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/ns16550.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index df7fff7f81df..299773d80065 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -191,6 +191,10 @@ static void cf_check ns16550_interrupt(int irq, void *=
dev_id)
     struct serial_port *port =3D dev_id;
     struct ns16550 *uart =3D port->uart;
=20
+    /* Ensure polling timer is disarmed and removed from the timer list. *=
/
+    if ( !uart->intr_works )
+        kill_timer(&uart->timer);
+
     uart->intr_works =3D 1;
=20
     while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
--=20
2.34.1



