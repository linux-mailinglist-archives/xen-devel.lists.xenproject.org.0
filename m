Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C34EE56D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297153.506090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JN-0007qo-Gh; Fri, 01 Apr 2022 00:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297153.506090; Fri, 01 Apr 2022 00:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JN-0007oz-DL; Fri, 01 Apr 2022 00:38:45 +0000
Received: by outflank-mailman (input) for mailman id 297153;
 Fri, 01 Apr 2022 00:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JM-0007ot-IX
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 155129bd-b154-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:38:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3BCFCB822B4;
 Fri,  1 Apr 2022 00:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2372C340EE;
 Fri,  1 Apr 2022 00:38:41 +0000 (UTC)
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
X-Inumbo-ID: 155129bd-b154-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773522;
	bh=gD62MWAs68ym0DrdkBwu/7pHjmZ6s8wQ6W/cJ2XWfnY=;
	h=Date:From:To:cc:Subject:From;
	b=uNhelSy9DrEG93gfTjadm1VWBqYNdF/owDTro7EPqXZ6R4GxRsKC1bfShzu0CpKhP
	 9Z8QYK6Sw+fArxVlSpzrSnsUk/q8l5CB1pj/qMBA5aSBMOGeC26z36QqP+/+xjymx6
	 +0nHFhxDEyJEDxvyoUGqbYAvwjOoeEvAt7oQUIMkRED1MnMGSSdUdanZhhXtIN4Rqi
	 yaU4XK4GVTPK2bbWay1hqTtBCGbDqt7YxEOFyoghS7n+dAdtB+WHNTVvLd84/RrA/h
	 7OmtvHO36mHm2LOYI9aeGTSNxVwtsM3oFhLZWiKuJSJ+aG284n/JJFN7QSUzBytKzp
	 2ZgoQjmbAE+Ug==
Date: Thu, 31 Mar 2022 17:38:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: [PATCH v4 0/9] dom0less PV drivers
Message-ID: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
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

This patch series is based on Daniel P. Smith's "Introduce XSM ability
for domain privilege escalation".

Cheers,

Stefano


Luca Miccio (3):
      xen/arm: configure dom0less domain for enabling xenstore after boot
      xenstored: send an evtchn notification on introduce_domain
      tools: add example application to initialize dom0less PV drivers

Stefano Stabellini (6):
      xen/dt: dt_property_read_string should return -ENODATA on !length
      xen/arm: implement domU extended regions
      xen/arm: temporarily elevate idle_domain privileged during create_domUs
      xen: export evtchn_alloc_unbound
      xen: introduce xen,enhanced dom0less property
      docs: document dom0less + PV drivers

 docs/features/dom0less.pandoc         |  43 ++++-
 docs/misc/arm/device-tree/booting.txt |  18 ++
 tools/helpers/Makefile                |  13 ++
 tools/helpers/init-dom0less.c         | 323 ++++++++++++++++++++++++++++++++++
 tools/xenstore/xenstored_domain.c     |   3 +
 xen/arch/arm/domain_build.c           |  91 +++++++++-
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/common/device_tree.c              |   2 +-
 xen/common/event_channel.c            |   2 +-
 xen/include/xen/event.h               |   3 +
 10 files changed, 493 insertions(+), 8 deletions(-)
 create mode 100644 tools/helpers/init-dom0less.c

