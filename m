Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C41E93B883
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 23:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764512.1174973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjRh-0002LR-Vf; Wed, 24 Jul 2024 21:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764512.1174973; Wed, 24 Jul 2024 21:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjRh-0002Id-Sb; Wed, 24 Jul 2024 21:22:49 +0000
Received: by outflank-mailman (input) for mailman id 764512;
 Wed, 24 Jul 2024 21:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ik8X=OY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWjRg-0002IX-GY
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 21:22:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dedc7263-4a02-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 23:22:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC37761278;
 Wed, 24 Jul 2024 21:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E878EC32781;
 Wed, 24 Jul 2024 21:22:43 +0000 (UTC)
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
X-Inumbo-ID: dedc7263-4a02-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721856165;
	bh=WxKDxsINjhQlHG2vWz8bmckY/HLh3IoQLmrxTw6AiLU=;
	h=Date:From:To:cc:Subject:From;
	b=MjqsT+INENhaLKgAdBkkMLvE7/6IWBtXVPHfZjeSqb4/6how4UeEYj9Y/ZCC48kRd
	 cph9UJ5ttVxb3btjds12xskfkBpvZ3kYu7iYMDzGg+r2G+vukWGjzxjjXBlfeS3YOu
	 Dl6HoQlvX47q01yhqP+qFP1hIlF233Az0hrhRhCWwi5UISwB7xipgvjL8Z4HEiPUxB
	 Av4FKrPt0YPzhWRoUERdBX/v9wfoUbbIwG1RYzcuvvOl3YTm6FJXxOTjBlBPfZk/+j
	 4eyVgCtcJCanBsg76o66ZVA8CLdNoTqBc7CSEwnQpvP4E0rupHcq+wkkwKiKih86pz
	 o1VvZUlueO46Q==
Date: Wed, 24 Jul 2024 14:22:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, kelly.choi@cloud.com, committers@xenproject.org, 
    roger.pau@cloud.com, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Anthony PERARD <anthony.perard@vates.tech>
Subject: Xen Project COLO, OSSTest and Gitlab CI
Message-ID: <alpine.DEB.2.22.394.2407241416130.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

As many in the community are aware, the Xen Project has been notified
that the facility hosting the physical hardware for OSSTest and some of
the GitLab runners will shut down by the end of October 2024. This
necessitates a shift in our operations.

Our community manager, Kelly, has diligently explored options to
relocate the Xen Project hardware to a new facility. However, the costs
and risks associated with such a move are significant. These include
potential damage during transit, reconfiguration challenges, and the
possibility of OSSTest not returning to a functional state, even if the
hardware is correctly installed.

OSSTest has been instrumental to the Xen Project for many years,
providing exceptional testing capabilities, particularly for a
micro-kernel that requires bare metal hardware testing. Its unique
features, such as automatic bisection on regressions and the ability to
test external projects like the Linux kernel, QEMU, and OVMF, are
noteworthy. However, maintaining such a complex system demands
significant resources.

Given the current circumstances, the leadership team proposes to
pivot our focus to GitLab CI. GitLab CI offers a more modern and
sustainable infrastructure, with the added advantage of being much
easier to extend. This transition will enable any community member to
contribute tests and hardware resources easily, fostering greater
community involvement and collaboration.

We extend our heartfelt gratitude to everyone who has contributed to
OSSTest over the years. It has been invaluable in identifying countless
regressions in Xen and third-party projects alike.

Regarding the GitLab runners currently hosted on physical hardware at
the soon-to-be-closed facility, we are exploring alternative locations.
As any Linux machine can be turned into a GitLab runner with a simple
package install, we have numerous options available, and we welcome
support from community members to ensure a smooth transition.

Stefano, on behalf of the Xen Hypervisor Leadership Team

