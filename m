Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9614FEA44
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 01:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303840.518301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nePlG-0007hv-W8; Tue, 12 Apr 2022 23:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303840.518301; Tue, 12 Apr 2022 23:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nePlG-0007g2-Sh; Tue, 12 Apr 2022 23:17:26 +0000
Received: by outflank-mailman (input) for mailman id 303840;
 Tue, 12 Apr 2022 23:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URkf=UW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nePlF-0007fw-N9
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 23:17:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b505c1be-bab6-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 01:17:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E5C860B10;
 Tue, 12 Apr 2022 23:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639F2C385A1;
 Tue, 12 Apr 2022 23:17:21 +0000 (UTC)
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
X-Inumbo-ID: b505c1be-bab6-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649805442;
	bh=wOa3STNJePWnzwzX/tYwSD4/1l95Y8NsSHWGWS7eJsg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AvSUNdNULOCuqjhOZBXQjSuQsVzY9jCwTQcNXNNi0cCzUe02qWDBrCidwBpOGaKHp
	 +aILXfu3J598yw3uR+Pmtm29VMoyhGEE9tu0VenPqqFZmguy1/uP4WdZ7WDj+5pT7j
	 zM9DrjJcdHxlzSEWGZ/XwrFkRhJcMdgk479KCGFse4EJd2BHn//YjpJM9Dm95h2/M8
	 3yPEp4Qur0BqI204CSasLMgFRP8kGUewfMjSR458FIdzPbZKjV9UMtpME3MOPRTYGG
	 ao/QQnpOemB6L1pYLSd9lx/tpytwK+M9SHa0MMUDl7peLxOsOoMMagPlD3+LBnSGnv
	 pMH0aDFBPU5aw==
Date: Tue, 12 Apr 2022 16:17:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2204121616030.3066615@ubuntu-linux-20-04-desktop>
References: <20220411152101.17539-1-luca.fancellu@arm.com> <20220411152101.17539-5-luca.fancellu@arm.com> <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com> <86F93995-5CFD-4A43-A928-E9053B027722@arm.com> <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-560354341-1649805441=:3066615"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-560354341-1649805441=:3066615
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 12 Apr 2022, Jan Beulich wrote:
> On 12.04.2022 11:50, Luca Fancellu wrote:
> >>> ---
> >>> MAINTAINERS | 2 +-
> >>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
> >>> xen/arch/arm/domain_build.c | 5 +-
> >>> xen/arch/arm/include/asm/smp.h | 3 +
> >>> xen/common/Kconfig | 7 +
> >>
> >> For consistency, should the addition here - with ...
> >>
> >>> xen/common/sched/Makefile | 1 +
> >>> xen/common/sched/boot-cpupool.c | 207 +++++++++++++++++++++++++
> >>> xen/common/sched/cpupool.c | 12 +-
> >>
> >> ... the new file now under sched/, also be put in sched/Kconfig?
> > 
> > Hi Jan,
> > 
> > I was looking for this change, I see xen/common/Kconfig offers the menu “Common Features”
> > and the xen/common/sched/Kconfig offers the “Scheduler” menu (visible with EXPERT), so
> > I thought it was better to leave it in “Common Features”.
> > 
> > Are you suggesting another menu under “Common Features”? 
> 
> No, I'm not suggesting a new menu. I was merely wondering whether the
> Kconfig contents wouldn't location-wise better match where the
> respective source file lives.

It could be in xen/common/sched/Kconfig at the beginning of the file
before creating the new "Schedulers" menu, e.g.:

diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 3d9f9214b8..f6545f4e9b 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -1,3 +1,10 @@
+config BOOT_TIME_CPUPOOLS
+       bool "Create cpupools at boot time"
+       depends on HAS_DEVICE_TREE
+       help
+         Creates cpupools during boot time and assigns cpus to them. Cpupools
+         options can be specified in the device tree.
+
 menu "Schedulers"
 	visible if EXPERT
 

I think it is fine either way, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-560354341-1649805441=:3066615--

