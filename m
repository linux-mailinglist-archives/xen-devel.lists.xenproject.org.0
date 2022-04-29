Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E275151562E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317701.537153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXg7-0006xy-2o; Fri, 29 Apr 2022 20:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317701.537153; Fri, 29 Apr 2022 20:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXg6-0006w6-WB; Fri, 29 Apr 2022 20:57:26 +0000
Received: by outflank-mailman (input) for mailman id 317701;
 Fri, 29 Apr 2022 20:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkXg4-0006w0-PK
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 20:57:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7a3d077-c7fe-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 22:57:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2511B837C2;
 Fri, 29 Apr 2022 20:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D33EC385A7;
 Fri, 29 Apr 2022 20:57:20 +0000 (UTC)
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
X-Inumbo-ID: f7a3d077-c7fe-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651265841;
	bh=PLq+6PDPp1BOsHws04vd9QA2FOt1CAQN/nNG1+129tM=;
	h=Date:From:To:cc:Subject:From;
	b=XOY/I975F0X0B/7jqfKnmPVe3eE0vk/+7B2oDI9+5TTO39sYy5LLf7qXOYuKvWiCG
	 Ai7eje6yDWHZ0BRwr/NhZv2twJISRHlbaCC5lHabN3FxI75ioBl0XRU41p4SMuiu6w
	 B6x52mlIz0z90oFxla0DC9UPMBRN2gezF1MAQYHAVrZ42zcggnbry9qXfwn22Nn/QD
	 hbPygArg7R62k15WBnz68EFeSNgU6UADRMk9fmspbVAieBen5sq7MKyfmWKqvWaMGB
	 2XChT1onzQWW2l00OzeVdMyyS6o1pdmMOZeFLAxyqZb9ehmTSYNIr+rHc5jVWEMrU0
	 GTiKjLF/E3WCQ==
Date: Fri, 29 Apr 2022 13:57:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: [PATCH v5 0/7] dom0less PV drivers
Message-ID: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
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
 tools/helpers/Makefile                |  13 ++
 tools/helpers/init-dom0less.c         | 341 ++++++++++++++++++++++++++++++++++
 tools/xenstore/xenstored_domain.c     |   4 +
 xen/arch/arm/domain_build.c           | 100 +++++++++-
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/common/device_tree.c              |   2 +-
 xen/common/event_channel.c            |   2 +-
 xen/include/xen/device_tree.h         |   3 +
 xen/include/xen/event.h               |   3 +
 11 files changed, 519 insertions(+), 13 deletions(-)
 create mode 100644 tools/helpers/init-dom0less.c

