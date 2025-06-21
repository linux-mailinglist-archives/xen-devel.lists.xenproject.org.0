Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFB8AE26A7
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 02:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021373.1397349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmJ2-0003n4-8U; Sat, 21 Jun 2025 00:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021373.1397349; Sat, 21 Jun 2025 00:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSmJ2-0003kU-5i; Sat, 21 Jun 2025 00:42:04 +0000
Received: by outflank-mailman (input) for mailman id 1021373;
 Sat, 21 Jun 2025 00:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSmJ1-0003kO-B1
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 00:42:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b06a486-4e38-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 02:42:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 40E586155F;
 Sat, 21 Jun 2025 00:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E64C4CEE3;
 Sat, 21 Jun 2025 00:41:58 +0000 (UTC)
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
X-Inumbo-ID: 8b06a486-4e38-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750466519;
	bh=57mlEAzT3c33HgDwikKJAIlCcWjSiKIow6H8UX7mSUE=;
	h=Date:From:To:cc:Subject:From;
	b=Zy+DgxhRlN6KsZBlwjBczuspMa/Mm/dC5YF5XdFoNokWTy4AD9lOFLy9z5bvOQaol
	 SUf2ayB4Qc+jPavSOLseckYsrVRp4sYpV+aoZsgs0FFEHv15dkKxQPvZJDtQ+wNxDC
	 U1uH7mYpsKgavKW4M2ndaEkVxKnddV2567Se/sY+NCHCDgBRjQR5EpGZx2TgLeEGcQ
	 gXhbd0kZl8fJ8eupAm6tKwlsM7AHEOWV20Hf+U3OJ4mI9dXJf1O+WGyvzuZKGhKxVV
	 SaTPzklTyujesIqnrBG0N4eX4/v1LHVJySh//HYXtGEKQOVVGrFlUP6UyIdYBbJ6fW
	 0MHzsCn3bAilg==
Date: Fri, 20 Jun 2025 17:41:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jason.andryuk@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, ayankuma@amd.com
Subject: hardware domain and control domain separation
Message-ID: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Regarding hardware domain and control domain separation, Ayan sent to
xen-devel an architecture specification (a design document) that I wrote
previously about the topic. This is written as safety document so it is
using a language and structure specific for that. However, it contains
much of the explanation needed on the topic:

https://lore.kernel.org/xen-devel/20250304183115.2509666-1-ayan.kumar.halder@amd.com/

If you take Virtio and PV drivers aside, the conceptual model is very
simple. I suggest we start from there, also because deployments without
Virtio/PV drivers are indeed possible. Often in mixed-criticality
environments device sharing is absent or very limited.

When we bring Virtio and PV drivers into the picture, things get more
complex. One simple mental model is that they are only allowed between
Unsafe VMs, because we cannot guarantee that neither the protocols nor
the widely adopted implementations are entirely free from interference.
So, Virtio (and PV drivers) between Unsafe VMs are OK, but Safe VMs
should be left alone.

There are lots of extra details in the document about the problems of
freedom from interference and Virtio. I wrote those details to explain why
Virtio between Safe and Unsafe VMs cannot be expected to work without
modifications today (people will ask for this, this way we'll have the
answers ready). I also wrote those details so that if someone wanted to
do an analysis on this topic and potentially deploy an entirely written
from scratch Virtio driver-protocol-backend implementation, they would
have a starting point for their investigation.

Cheers,

Stefano

