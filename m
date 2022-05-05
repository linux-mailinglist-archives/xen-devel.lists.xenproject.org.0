Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB99951B491
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321169.542084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPAL-0007Ov-B6; Thu, 05 May 2022 00:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321169.542084; Thu, 05 May 2022 00:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPAL-0007LQ-7n; Thu, 05 May 2022 00:16:21 +0000
Received: by outflank-mailman (input) for mailman id 321169;
 Thu, 05 May 2022 00:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPAJ-0007LG-VR
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:16:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e9c763-cc08-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 02:16:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 982E061D4E;
 Thu,  5 May 2022 00:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E94C385B1;
 Thu,  5 May 2022 00:16:16 +0000 (UTC)
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
X-Inumbo-ID: 94e9c763-cc08-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651709776;
	bh=a/fnNJ/bKKOG4tmQuObcdJZXY4wSKSDloZeQB+YRC8w=;
	h=Date:From:To:cc:Subject:From;
	b=ZaU/YGT0s/VxMgSGatTuRI/ua6haMOlNBLbWwfKsxq8u/M4yqS/TorElYIhQz3JvD
	 1LISqvh2EShuY9GL7GDCYU4UZRPqoR7o1RZsxT26gnwoV9rboW2+OUHNBRTOjIpzSf
	 JRFW3HB753S+QqGkLNX5u7uFlXuiSGXBVzvrbPWmu4gEY+If1WKD29NpZ4aMiWfdqV
	 D7wf9vdwefqQiq+wWJgpZy9nqRUiz6MuFtI45Dq7L0zk1ezjF1y5u90g8NlBXNkl51
	 /7WTbplxRE834Ry6YVuooBdi21VU8e/1xljep8WJToZvOkpplYD8WSaieFjhnymcpX
	 6uzangn0phfYg==
Date: Wed, 4 May 2022 17:16:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: [PATCH v6 0/7] dom0less PV drivers
Message-ID: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
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

The patch series introduces a new dom0less device tree option
"xen,enhanced" (in the Xen device tree) to specify whether PV interfaces
should be enabled/disabled for the dom0less guest.

This patch series is based on Daniel P. Smith's "Adds starting the idle
domain privileged".

A important change in v5 is the usage of
XS_CONNECTION_STATE_RECONNECTING to signal that the xenstore interface
is not ready.

Cheers,

Stefano

Luca Miccio (3):
      xen/arm: configure dom0less domain for enabling xenstore after boot
      xenstored: send an evtchn notification on introduce_domain
      tools: add example application to initialize dom0less PV drivers

Stefano Stabellini (4):
      xen/dt: of_property_read_string return -ENODATA when !length
      xen/arm: implement domU extended regions
      xen: introduce xen,enhanced dom0less property
      docs: document dom0less + PV drivers

 docs/features/dom0less.pandoc         |  43 ++++-
 docs/misc/arm/device-tree/booting.txt |  18 ++
 docs/misc/xen-command-line.pandoc     |   9 +-
 tools/helpers/Makefile                |  13 ++
 tools/helpers/init-dom0less.c         | 340 ++++++++++++++++++++++++++++++++++
 tools/xenstore/xenstored_domain.c     |   4 +
 xen/arch/arm/domain_build.c           | 104 ++++++++++-
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/common/device_tree.c              |   2 +-
 xen/common/event_channel.c            |   2 +-
 xen/include/public/io/xs_wire.h       |   2 +-
 xen/include/xen/device_tree.h         |   3 +
 xen/include/xen/event.h               |   3 +
 13 files changed, 527 insertions(+), 19 deletions(-)
 create mode 100644 tools/helpers/init-dom0less.c

