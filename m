Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D640291352
	for <lists+xen-devel@lfdr.de>; Sat, 17 Oct 2020 19:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8407.22480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTpsL-0007lr-PL; Sat, 17 Oct 2020 17:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8407.22480; Sat, 17 Oct 2020 17:20:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTpsL-0007lS-M3; Sat, 17 Oct 2020 17:20:13 +0000
Received: by outflank-mailman (input) for mailman id 8407;
 Sat, 17 Oct 2020 17:20:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o+87=DY=ska67.de=pub@srs-us1.protection.inumbo.net>)
 id 1kTpsJ-0007lL-8n
 for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 17:20:11 +0000
Received: from mxout4.routing.net (unknown [2a03:2900:1:a::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bed08450-710d-4620-90b9-c97e5b91f90d;
 Sat, 17 Oct 2020 17:20:09 +0000 (UTC)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout4.routing.net (Postfix) with ESMTP id 4AF88101494
 for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 17:20:08 +0000 (UTC)
Received: from naboo.starwars.lan
 (HSI-KBW-46-223-214-20.hsi.kabel-badenwuerttemberg.de [46.223.214.20])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 054DB1002F9
 for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 17:20:08 +0000 (UTC)
Received: from triton.localnet (triton.starwars.lan [192.168.152.150])
 by naboo.starwars.lan (Postfix) with ESMTP id 3DEC361953
 for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 19:20:26 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o+87=DY=ska67.de=pub@srs-us1.protection.inumbo.net>)
	id 1kTpsJ-0007lL-8n
	for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 17:20:11 +0000
X-Inumbo-ID: bed08450-710d-4620-90b9-c97e5b91f90d
Received: from mxout4.routing.net (unknown [2a03:2900:1:a::9])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bed08450-710d-4620-90b9-c97e5b91f90d;
	Sat, 17 Oct 2020 17:20:09 +0000 (UTC)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 4AF88101494
	for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1602955208; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=YUpM31dzrl9+Y0DIUsQLHnDeIM8pl08FeKFIyqIAsPc=;
	b=V4voTvnkmUSlvz7HRG5Mu/2x3u7ZoqiFxQfxhFpNNQLeasXo4vZxIvAiGg0t6z7gvTPX3z
	nTRRa6HWZoJRzWwHAECdPXbvaWiWbJ+4juo7I2tiAZd7WE8t+SmKIGNZVHlybLEIHJECjP
	7QcRhKN+2ANFovq6eaLDARa8h9vJHIo=
Received: from naboo.starwars.lan (HSI-KBW-46-223-214-20.hsi.kabel-badenwuerttemberg.de [46.223.214.20])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 054DB1002F9
	for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 17:20:08 +0000 (UTC)
Received: from triton.localnet (triton.starwars.lan [192.168.152.150])
	by naboo.starwars.lan (Postfix) with ESMTP id 3DEC361953
	for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 19:20:26 +0200 (CEST)
From: Stefan <pub@ska67.de>
To: xen-devel <xen-devel@lists.xenproject.org>
Reply-To: xen@ska67.de
Subject: QXL support broken
Date: Sat, 17 Oct 2020 19:20:06 +0200
Message-ID: <5982251.Trf6zQypKq@triton>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello xen project team,

I am using xen 4.14 from AUR on a laptop with arch linux.

I tried running a windows 10 domU with QXL graphics.
In my xl configuration file I set:
vga="qxl"

Within the domU itself I installed the latest qxldod driver from
fedora project.
Right after installation, the system becomes extremely laggy,
with response times of 30s and more.

I wrote to xen-users mailinglist:
https://lists.xenproject.org/archives/html/xen-users/2020-09/msg00006.html

And got an answer with the advice to report the bug
on the xen-devel mailing list:
https://lists.xenproject.org/archives/html/xen-users/2020-10/msg00000.html

-- 
THX
Stefan Kadow



