Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857274A02E0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 22:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262145.454282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYri-0001PF-2c; Fri, 28 Jan 2022 21:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262145.454282; Fri, 28 Jan 2022 21:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYrh-0001MF-Vr; Fri, 28 Jan 2022 21:33:05 +0000
Received: by outflank-mailman (input) for mailman id 262145;
 Fri, 28 Jan 2022 21:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDYrg-0001M8-TQ
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 21:33:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de4c123f-8081-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 22:33:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FC6F61E9A;
 Fri, 28 Jan 2022 21:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1245C340EC;
 Fri, 28 Jan 2022 21:32:59 +0000 (UTC)
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
X-Inumbo-ID: de4c123f-8081-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643405580;
	bh=DVSVQE2+B4BrH2Gb3Fiu+UcJh3jXsRSt4BAmn6YYQMc=;
	h=Date:From:To:cc:Subject:From;
	b=bt5ZjhrZL5AMzy1XGcXe0zYVbDMWZt+kqcn9jj+dGfpuPUsszANM5yHdx2+pXW/MC
	 ifsmoLv0xQQGxBBPVOtvd+WpqodBfyJFZomt9Zmj2b43327Aa7SEdfdJbig8wHKDdG
	 jv+bcg/OqIj72StE0tL7Hw0uho9eTw0aYBwFAvdtpXEB53Oyot4RWu/iI8GNe2Ydap
	 J9vfsu2VjQo0jGqPfYDFOXmGJmPv4UVeLUdzjfFIiMMyWnR1c7PLKaPUzRS5e2C9Ik
	 KbHDnaMfoTgATbzQ8h0VxqcW85zcT7tNPo4qNP8pSU8LOuCReLdUJRBavtfMu07TBl
	 MGMpNhjwr0MdQ==
Date: Fri, 28 Jan 2022 13:32:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: [PATCH v3 0/5] dom0less PV drivers
Message-ID: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
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

Cheers,

Stefano


Luca Miccio (4):
      xen: make evtchn_alloc_unbound public
      xen/arm: configure dom0less domain for enabling xenstore after boot
      xenstored: send an evtchn notification on introduce_domain
      tools: add example application to initialize dom0less PV drivers

Stefano Stabellini (1):
      xen: introduce xen,enhanced dom0less property

 docs/misc/arm/device-tree/booting.txt |  18 +++
 tools/helpers/Makefile                |  13 ++
 tools/helpers/init-dom0less.c         | 269 ++++++++++++++++++++++++++++++++++
 tools/xenstore/xenstored_domain.c     |   3 +
 xen/arch/arm/domain_build.c           |  49 +++++++
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/common/event_channel.c            |  13 +-
 xen/include/xen/event.h               |   3 +
 8 files changed, 366 insertions(+), 5 deletions(-)
 create mode 100644 tools/helpers/init-dom0less.c

