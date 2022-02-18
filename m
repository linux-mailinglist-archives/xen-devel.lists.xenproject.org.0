Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BD4BC2E4
	for <lists+xen-devel@lfdr.de>; Sat, 19 Feb 2022 00:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275657.471620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLCiO-0001CI-B2; Fri, 18 Feb 2022 23:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275657.471620; Fri, 18 Feb 2022 23:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLCiO-00019K-7D; Fri, 18 Feb 2022 23:31:04 +0000
Received: by outflank-mailman (input) for mailman id 275657;
 Fri, 18 Feb 2022 23:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/tq=TB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nLCiM-00019E-ON
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 23:31:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d49be2b6-9112-11ec-8eb8-a37418f5ba1a;
 Sat, 19 Feb 2022 00:31:01 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF80BB826FE;
 Fri, 18 Feb 2022 23:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32074C340E9;
 Fri, 18 Feb 2022 23:30:58 +0000 (UTC)
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
X-Inumbo-ID: d49be2b6-9112-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645227058;
	bh=88AERh/QkWzUu4pRpqNxx4VC/sjCyonupm8mVWsqANU=;
	h=Date:From:To:cc:Subject:From;
	b=N/QZgOY2kQPQH+hQzqOuD6+Bg3tMcLQY6EaiC4Pyq+dDoQ9oDq0J+F5cSu97fo3H6
	 8nEqJ2nhiampaMbr9u3HqmT69COLhQCDPQRBeSo5TKH4luLMUwn7dh4/3DWXNKaSGj
	 MeuaiiMuAmmWl5OuTZ9AaJnybUdFLEuedmWjlMTAX/WApLogGjrhSVsAspt1fUEtcs
	 t3KzS0pMEG5X9c3i4g5QInvZQdnhswMtVUlLjfKu9bmZJQBC2yLiq5f5+IAV8cJKZf
	 jP6gzUt0D4OGRj0HliKS62Td+jFMqdLlLK3BpdzQcEyZID5eATH6jS9yBrmlUTfPDh
	 DFm9LfKHBG2yg==
Date: Fri, 18 Feb 2022 15:30:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: anthony.perard@citrix.com, wl@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    christopher.w.clark@gmail.com, jgross@suse.com, bertrand.marquis@arm.com
Subject: [PATCH] tools/hotplug: don't install init.d scripts if SYSTEMD
Message-ID: <alpine.DEB.2.22.394.2202181525440.239973@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

When Xen is configured with --with-systemd currently both the systemd
init scripts as well as the traditional init.d scripts (e.g. xencommons)
are installed.

This causes issues to distros where old style init scripts are still
supported even when systemd is enabled, e.g. Yocto. The consequence is
that xenconsoled (and other daemons) are executed twice resulting in
errors at boot.

If --with-systemd don't install xencommons and the other sysvinit
scripts.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>


diff --git a/tools/hotplug/Linux/Makefile b/tools/hotplug/Linux/Makefile
index 0b1d111d7e..03ed00ca70 100644
--- a/tools/hotplug/Linux/Makefile
+++ b/tools/hotplug/Linux/Makefile
@@ -47,10 +47,12 @@ install-initd:
 	$(INSTALL_DATA) init.d/sysconfig.xendomains $(DESTDIR)$(SYSCONFIG_DIR)/xendomains
 	$(INSTALL_DATA) init.d/sysconfig.xencommons $(DESTDIR)$(SYSCONFIG_DIR)/xencommons
 	$(INSTALL_PROG) xendomains $(DESTDIR)$(LIBEXEC_BIN)
+ifndef CONFIG_SYSTEMD
 	$(INSTALL_PROG) init.d/xendomains $(DESTDIR)$(INITD_DIR)
 	$(INSTALL_PROG) init.d/xencommons $(DESTDIR)$(INITD_DIR)
 	$(INSTALL_PROG) init.d/xendriverdomain $(DESTDIR)$(INITD_DIR)
 	$(INSTALL_PROG) init.d/xen-watchdog $(DESTDIR)$(INITD_DIR)
+endif
 
 .PHONY: uninstall-initd
 uninstall-initd:

