Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D52DA2A7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 22:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52695.92012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcm-0006Wo-30; Mon, 14 Dec 2020 21:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52695.92012; Mon, 14 Dec 2020 21:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kovcl-0006WB-UZ; Mon, 14 Dec 2020 21:43:19 +0000
Received: by outflank-mailman (input) for mailman id 52695;
 Mon, 14 Dec 2020 20:43:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1VlC=FS=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1kouh3-00012R-AX
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 20:43:41 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb657a85-d9a4-4d5e-8fb9-319b6080a827;
 Mon, 14 Dec 2020 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 5F65126E7D;
 Mon, 14 Dec 2020 15:25:48 -0500 (EST)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzwiUz0EGBcR; Mon, 14 Dec 2020 15:25:48 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 2294826E79; Mon, 14 Dec 2020 15:25:48 -0500 (EST)
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
X-Inumbo-ID: eb657a85-d9a4-4d5e-8fb9-319b6080a827
References: <87h7oudcbx.fsf@vps.thesusis.net> <CAHD1Q_zcruQ6KVHApvhb=0+mG0m80T+tmg1UzjQBki8j+aR51A@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: "Guilherme G. Piccoli" <guilherme.piccoli@canonical.com>
Cc: kexec mailing list <kexec@lists.infradead.org>, xen-devel@lists.xenproject.org
Subject: Re: kexec not working in xen domU?
Date: Mon, 14 Dec 2020 15:08:57 -0500
In-reply-to: <CAHD1Q_zcruQ6KVHApvhb=0+mG0m80T+tmg1UzjQBki8j+aR51A@mail.gmail.com>
Message-ID: <87czzcdtir.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Guilherme G. Piccoli writes:

> Can you capture the serial console in a pastebin? Maybe add something
> like "earlyprintk=ttySX", where ttySX is your known-to-work serial
> console output. This helps to determine if it's a shutdown issue or an
> early boot problem.

The regular xen cosole should work for this shouldn't it?  So
earlyprintk=hvc0 I guess?  I also threw in console=hvc0 and loglevel=7:

[  184.734810] systemd-shutdown[1]: Syncing filesystems and block
devices.
[  185.772511] systemd-shutdown[1]: Sending SIGTERM to remaining
processes...
[  185.896957] systemd-shutdown[1]: Sending SIGKILL to remaining
processes...
[  185.901111] systemd-shutdown[1]: Unmounting file systems.
[  185.902180] [1035]: Remounting '/' read-only in with options
'errors=remount-ro'.
[  185.990634] EXT4-fs (xvda1): re-mounted. Opts: errors=remount-ro
[  186.002373] systemd-shutdown[1]: All filesystems unmounted.
[  186.002411] systemd-shutdown[1]: Deactivating swaps.
[  186.002502] systemd-shutdown[1]: All swaps deactivated.
[  186.002529] systemd-shutdown[1]: Detaching loop devices.
[  186.002699] systemd-shutdown[1]: All loop devices detached.
[  186.002727] systemd-shutdown[1]: Stopping MD devices.
[  186.002814] systemd-shutdown[1]: All MD devices stopped.
[  186.002840] systemd-shutdown[1]: Detaching DM devices.
[  186.002974] systemd-shutdown[1]: All DM devices detached.
[  186.003017] systemd-shutdown[1]: All filesystems, swaps, loop
devices, MD devices and DM devices detached.
[  186.168475] systemd-shutdown[1]: Syncing filesystems and block
devices.
[  186.169150] systemd-shutdown[1]: Rebooting with kexec.
[  186.418653] xenbus_probe_frontend: xenbus_frontend_dev_shutdown:
device/vbd/5632: Initialising != Connected, skipping
[  186.427377] kexec_core: Starting new kernel


