Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510F75D7D2
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 01:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567741.887198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMzJ9-0007bp-Is; Fri, 21 Jul 2023 23:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567741.887198; Fri, 21 Jul 2023 23:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMzJ9-0007Z9-GE; Fri, 21 Jul 2023 23:13:11 +0000
Received: by outflank-mailman (input) for mailman id 567741;
 Fri, 21 Jul 2023 23:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMzJ7-0007Z3-M2
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 23:13:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26728197-281c-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 01:13:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56B5561DA6;
 Fri, 21 Jul 2023 23:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12038C433C7;
 Fri, 21 Jul 2023 23:13:04 +0000 (UTC)
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
X-Inumbo-ID: 26728197-281c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689981185;
	bh=CQjnTZRieSPJBy5tqH0/lc09aY1+gJmSqr/VPaOnrlY=;
	h=Date:From:To:cc:Subject:From;
	b=oXrwpICt7Kx2mTe9TBiZFnq8H7+GEP3RV0g/Cspqa4gIXWY5xsrmYYDlxwHnmijZm
	 zAbNY16m0wDnOS8TzE4KV4wrEbPCo/8XauKQ6agweVaTXPhFOQubISG7+5GHur6+cg
	 LuPCLClT9+SLC0Lau2aB7+ORomYm0AyvluGo/lxLaZDYGdCOE4vdhYqT6uEzfq+1Go
	 VFCG3WKYCrQkOh06KmhDrTJVVh25rPvmucJ3Ab/hy+lkk3yDjDsUtx+tNbHBuqPv+o
	 WJW2sVQp+EXN81FbPhw8nULubiob2RvJxhoLLtUH0pmDv29BNccTcVehMARfpKjoGV
	 auX/pxaR9wveg==
Date: Fri, 21 Jul 2023 16:13:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jgross@suse.com
cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    xen-devel@lists.xenproject.org, pmladek@suse.com
Subject: [PATCH] xenbus: check xen_domain in xenbus_probe_initcall
Message-ID: <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The same way we already do in xenbus_init.
Fixes the following warning:

[  352.175563] Trying to free already-free IRQ 0
[  352.177355] WARNING: CPU: 1 PID: 88 at kernel/irq/manage.c:1893 free_irq+0xbf/0x350
[...]
[  352.213951] Call Trace:
[  352.214390]  <TASK>
[  352.214717]  ? __warn+0x81/0x170
[  352.215436]  ? free_irq+0xbf/0x350
[  352.215906]  ? report_bug+0x10b/0x200
[  352.216408]  ? prb_read_valid+0x17/0x20
[  352.216926]  ? handle_bug+0x44/0x80
[  352.217409]  ? exc_invalid_op+0x13/0x60
[  352.217932]  ? asm_exc_invalid_op+0x16/0x20
[  352.218497]  ? free_irq+0xbf/0x350
[  352.218979]  ? __pfx_xenbus_probe_thread+0x10/0x10
[  352.219600]  xenbus_probe+0x7a/0x80
[  352.221030]  xenbus_probe_thread+0x76/0xc0

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Tested-by: Petr Mladek <pmladek@suse.com>

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 58b732dcbfb8..e9bd3ed70108 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -811,6 +812,9 @@ static int xenbus_probe_thread(void *unused)
 
 static int __init xenbus_probe_initcall(void)
 {
+	if (!xen_domain())
+		return -ENODEV;
+
 	/*
 	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
 	 * need to wait for the platform PCI device to come up or

