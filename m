Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1596B142E6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 22:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061939.1427547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUNU-0003V3-CB; Mon, 28 Jul 2025 20:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061939.1427547; Mon, 28 Jul 2025 20:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUNU-0003QT-8F; Mon, 28 Jul 2025 20:23:20 +0000
Received: by outflank-mailman (input) for mailman id 1061939;
 Mon, 28 Jul 2025 20:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLX+=2J=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugUNS-0003OM-Px
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 20:23:18 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b20ea8cd-6bf0-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 22:23:17 +0200 (CEST)
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
X-Inumbo-ID: b20ea8cd-6bf0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=64xcyqxwaza7ngpdanrd3symj4.protonmail; t=1753734196; x=1753993396;
	bh=h4BAq8grM3hYAwhb4xrTFfZA6bDeJUFUE61E25P93G4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Om3QtH8qM/wSaQR0fpnyl8o6Fme/hKsmzLUgtNjMNNn7PgqodcCt6VoEp77d8GG9w
	 h3NT1MBllJ9ALi/ER9xw2W7d/QTygCRfUhq4IlHb2xlqRWvwdSI5TQjWl8QBUEoBtF
	 4LQL0SBkRhR0IXm3lBnUn5X+xlZLgXmqkEASRzkyFU2yJD1x/++YOyY0v+9oi7fOYG
	 Z/7b/nM/U8xWABuehXxCpcu3OBKJoyaQmGVXrrtj+y4MExfNDrdWUM13wjYWo2xZnS
	 wjzuCAlzS/cgBJJQxYtmE6pupjbhmCca1VM2gjNP8KwQXbQ+i8s2Bbw++yP83BIdPt
	 iH/BuBi70ar5Q==
Date: Mon, 28 Jul 2025 20:23:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 1/2] drivers/ehci-dbgp: remove use of run_in_exception_handle()
Message-ID: <20250728202300.1017904-2-dmukhin@ford.com>
In-Reply-To: <20250728202300.1017904-1-dmukhin@ford.com>
References: <20250728202300.1017904-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dc1d3f18566347ad6fb7bfb23c52d294c917711f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Polling is relevant for early boot only where facilities requiring
run_in_exception_handler() are not used (e.g. 'd' keyhandler).

Rework ehci_dbgp_poll() by droppping use of run_in_exception_handler().

The ground work for run_in_exception_handler() removal was done under XSA-4=
53:
https://xenbits.xen.org/xsa/advisory-453.html

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/ehci-dbgp.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index a5c79f56fcf4..ab70e53195eb 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1245,17 +1245,13 @@ static int cf_check ehci_dbgp_getc(struct serial_po=
rt *port, char *pc)
     return 1;
 }
=20
-/* Safe: ehci_dbgp_poll() runs as timer handler, so not reentrant. */
-static struct serial_port *poll_port;
-
-static void cf_check _ehci_dbgp_poll(const struct cpu_user_regs *regs)
+static void cf_check ehci_dbgp_poll(void *data)
 {
-    struct serial_port *port =3D poll_port;
+    struct serial_port *port =3D data;
     struct ehci_dbgp *dbgp =3D port->uart;
     unsigned long flags;
     unsigned int timeout =3D MICROSECS(DBGP_CHECK_INTERVAL);
     bool empty =3D false;
-    const struct cpu_user_regs *old_regs;
=20
     if ( !dbgp->ehci_debug )
         return;
@@ -1271,17 +1267,12 @@ static void cf_check _ehci_dbgp_poll(const struct c=
pu_user_regs *regs)
         spin_unlock_irqrestore(&port->tx_lock, flags);
     }
=20
-    /* Mimic interrupt context. */
-    old_regs =3D set_irq_regs(regs);
-
     if ( dbgp->in.chunk )
         serial_rx_interrupt(port);
=20
     if ( empty )
         serial_tx_interrupt(port);
=20
-    set_irq_regs(old_regs);
-
     if ( spin_trylock_irqsave(&port->tx_lock, flags) )
     {
         if ( dbgp->state =3D=3D dbgp_idle && !dbgp->in.chunk &&
@@ -1298,12 +1289,6 @@ static void cf_check _ehci_dbgp_poll(const struct cp=
u_user_regs *regs)
     set_timer(&dbgp->timer, NOW() + timeout);
 }
=20
-static void cf_check ehci_dbgp_poll(void *data)
-{
-    poll_port =3D data;
-    run_in_exception_handler(_ehci_dbgp_poll);
-}
-
 static bool ehci_dbgp_setup_preirq(struct ehci_dbgp *dbgp)
 {
     if ( !ehci_dbgp_setup(dbgp) )
--=20
2.34.1



