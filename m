Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B153C488009
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254709.436498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zuw-0006bz-F2; Sat, 08 Jan 2022 00:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254709.436498; Sat, 08 Jan 2022 00:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zuw-0006ZJ-C6; Sat, 08 Jan 2022 00:49:10 +0000
Received: by outflank-mailman (input) for mailman id 254709;
 Sat, 08 Jan 2022 00:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zuu-0006ZD-QO
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c74e7795-701c-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 01:49:05 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4947262035;
 Sat,  8 Jan 2022 00:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76011C36AEB;
 Sat,  8 Jan 2022 00:49:03 +0000 (UTC)
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
X-Inumbo-ID: c74e7795-701c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602943;
	bh=0nfcP9rd1+zo3Qm1EBIRLkwJFG/pMOtOzXskbseM/IQ=;
	h=Date:From:To:cc:Subject:From;
	b=Uxh6yvKmwvdKAeT/a0LyLFlZpHWgpQG6x+t1L54AcxiToXCzaBg4RRahHqqfX6DXj
	 zKtEvVXlth1YJZkYz/n4YpS/qpZBYGp3ILiV6SuZi46KHcFAVMQgW9bwz82UpQyUV7
	 0mTpU/ESUeA/VqbDXFEZlcPbiVzQ+E+l5Qg4l9ZRW3tcKNSrF7RpA/r5pzhKEFKpk/
	 G3cuWKe8ugZDqOxC0O/53gF7FIpxO8j+2VNwM4SzsK+6Uw8VopsOje6Jxrrt2h5fVj
	 E32vaw1EhKPp5w8hShE/RgpT1J6S7t1ANEIP+gdoFX2dAmpkKJWb5VVTPg5uA98a6m
	 +4+RvA7M+61Lw==
Date: Fri, 7 Jan 2022 16:49:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: [XEN PATCH 0/7] dom0less PV drivers
Message-ID: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Currently dom0less guests cannot use PV drivers because they don't have
access to xenstore. Also, the hypervisor node in device tree is missing
so they don't detect that they are running on Xen (thus, they don't try
to enable PV interfaces.)

This patch series enables dom0less guests (on ARM) to use PV drivers.

Instead of initializing xenstore immediately at boot, dom0less guests
get access to xenstore later. They delay the initialization until they
receive a notification via the xenstore event channel (which is
available at boot.)

An example workflow is as follows:
- all domains start in parallel, dom0less guests are immediately running
- when dom0 is up and running, the init-dom0less application is called
- dom0less guests receive the notification and initialize xenstore
- now xl network-attach/disk-attach works as expected for dom0less domUs

In terms of interfaces, the patch series introduces:
- a new feature flag XENFEAT_xenstore_late_init to signal that xenstore
  is going to be available later
- a new dom0less device tree option "xen,enhanced" (in the Xen device
  tree) to specify whether PV interfaces should be enabled/disabled for
  the dom0less guest

Cheers,

Stefano

Luca Miccio (6):
      xen: introduce XENFEAT_xenstore_late_init
      xen: introduce _evtchn_alloc_unbound
      tools: add a late_init argument to xs_introduce_domain
      xen/arm: configure dom0less domain for enabling xenstore after boot
      xenstored: do_introduce: handle the late_init case
      tools: add example application to initialize dom0less PV drivers

Stefano Stabellini (1):
      xen: introduce xen,enhanced dom0less property

 docs/misc/arm/device-tree/booting.txt |  18 +++
 tools/helpers/Makefile                |  13 ++
 tools/helpers/init-dom0less.c         | 263 ++++++++++++++++++++++++++++++++++
 tools/include/xenstore.h              |   3 +-
 tools/libs/light/libxl_dom.c          |   3 +-
 tools/libs/store/xs.c                 |   8 +-
 tools/python/xen/lowlevel/xs/xs.c     |   2 +-
 tools/xenstore/xenstored_domain.c     |  15 +-
 xen/arch/arm/domain_build.c           |  39 +++++
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/common/event_channel.c            |  49 ++++---
 xen/common/kernel.c                   |   2 +
 xen/include/public/features.h         |   6 +
 xen/include/xen/event.h               |   3 +
 15 files changed, 403 insertions(+), 26 deletions(-)
 create mode 100644 tools/helpers/init-dom0less.c

