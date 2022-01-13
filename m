Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C33848CFD9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 01:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256933.441209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oRx-0000cD-0u; Thu, 13 Jan 2022 00:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256933.441209; Thu, 13 Jan 2022 00:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oRw-0000Zs-U8; Thu, 13 Jan 2022 00:58:44 +0000
Received: by outflank-mailman (input) for mailman id 256933;
 Thu, 13 Jan 2022 00:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oRv-0000Zm-EG
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 00:58:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f337760e-740b-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:58:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25F1361BBB;
 Thu, 13 Jan 2022 00:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C13C36AE5;
 Thu, 13 Jan 2022 00:58:40 +0000 (UTC)
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
X-Inumbo-ID: f337760e-740b-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642035520;
	bh=1ZCAhpODL55VJsMiysZzfYn5rGmKuOXtY1UAh4b+QEc=;
	h=Date:From:To:cc:Subject:From;
	b=Pn9eEIKO+RNrInRl9FGm/6fk63PpKj7IbYbvPSUJ7lM60YG6gvf3OpBd7U3zomIC/
	 FyRBh3forWJY5dcU/2HotuvCdxYDDEqrp/IaSG2GLBcoWXzrO/I+RCbdw1T00npQYV
	 Dj/pHhVb2O+Ac8Px1tnwc8nTh+eOV4T7grjkOgw/UljIN/d4ZslL5W3Nj/86GT6Qpy
	 xpKcNsXqEr7COTqLXWF+Knm4Rq4+l7muOwZZoG0xZh86wU6CO144WhlIcU9yCCWJ43
	 ekBSIjBxEQwS3c7voQgjWqd6kh3Ozlfj3us9l4+Soe74pDXTavcl46IOTdKzAhh7GJ
	 s4nAdx8/tvN3w==
Date: Wed, 12 Jan 2022 16:58:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: [XEN PATCH v2 0/5] dom0less PV drivers
Message-ID: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
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


Luca Miccio (3):
      xen/arm: configure dom0less domain for enabling xenstore after boot
      xenstored: send an evtchn notification on introduce_domain
      tools: add example application to initialize dom0less PV drivers

Stefano Stabellini (2):
      xen: introduce xen,enhanced dom0less property
      xen: export get_free_port

 docs/misc/arm/device-tree/booting.txt |  18 +++
 tools/helpers/Makefile                |  13 ++
 tools/helpers/init-dom0less.c         | 266 ++++++++++++++++++++++++++++++++++
 tools/xenstore/xenstored_domain.c     |   3 +
 xen/arch/arm/domain_build.c           |  51 +++++++
 xen/arch/arm/include/asm/kernel.h     |   3 +
 xen/common/event_channel.c            |   2 +-
 xen/include/xen/event.h               |   3 +
 8 files changed, 358 insertions(+), 1 deletion(-)
 create mode 100644 tools/helpers/init-dom0less.c

