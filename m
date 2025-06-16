Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B6AADBDCA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 01:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017567.1394540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJSo-0007vi-Pd; Mon, 16 Jun 2025 23:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017567.1394540; Mon, 16 Jun 2025 23:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJSo-0007te-Mw; Mon, 16 Jun 2025 23:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1017567;
 Mon, 16 Jun 2025 23:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0jr=Y7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRJSn-0007tT-1q
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 23:42:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80d2f218-4b0b-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 01:42:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AE645C1104;
 Mon, 16 Jun 2025 23:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19583C4CEEA;
 Mon, 16 Jun 2025 23:41:59 +0000 (UTC)
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
X-Inumbo-ID: 80d2f218-4b0b-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750117321;
	bh=xveEK3bSBxEPMMbaUq2f38hdtN983Wtdzbqu1rSdp2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H67XK6adOYyjdMGJ5dCNtg2Zhbn4pVACoeo0mq+AOWyOX2d7ZMIbDf81cKTl6nlX9
	 Z59dev91qsDdP5ehCbHtRb8AsYiLZY6Yr9ffgSTknNbhKEGg7nryIogrkActP4uL5I
	 AEN2udStmTBEnEs20o+i7CNZQ0gt2eDMm8J3smscl3Xg3o4j5G+cAmytd4qYHhUE3B
	 G7HKcAh+lIL/v2mRdeA7JZwEUDezDTLp7RtmfkoVZydVyIkUdGrwWvUWZOCu/tqULK
	 8ny57/gL0Z5nEdsdSMa+VS3ykJRspdNMycnSmpIdKE+85cctAWu9qNhDg67N5VSZDE
	 P7vAKZ7hMAmxg==
Date: Mon, 16 Jun 2025 16:41:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org, 
    Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v3 13/14] xen/dt: Allow CONFIG_DOM0LESS_BOOT to include
 device-tree/
In-Reply-To: <DAO0M5RC6G0Y.32PK3XMHXB623@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506161640220.1384757@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-14-agarciav@amd.com> <c6524b35-6454-450c-a521-bf2d617d9ab6@suse.com> <DAO0M5RC6G0Y.32PK3XMHXB623@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, Alejandro Vallejo wrote:
> On Mon Jun 16, 2025 at 8:55 AM CEST, Jan Beulich wrote:
> > On 13.06.2025 17:13, Alejandro Vallejo wrote:
> >> --- a/xen/common/Kconfig
> >> +++ b/xen/common/Kconfig
> >> @@ -14,6 +14,7 @@ config CORE_PARKING
> >>  
> >>  config DOM0LESS_BOOT
> >>  	bool "Dom0less boot support" if EXPERT
> >> +	select LIBFDT
> >>  	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
> >>  	default y
> >>  	help
> >
> > Nit: Imo it is good practice to have the select-s after the "depends on",
> > and perhaps also after any default(s).
> >
> >> --- a/xen/common/Makefile
> >> +++ b/xen/common/Makefile
> >> @@ -8,7 +8,7 @@ obj-y += cpu.o
> >>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> >>  obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
> >>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
> >> -obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
> >> +obj-$(firstword $(CONFIG_HAS_DEVICE_TREE) $(CONFIG_DOM0LESS_BOOT)) += device-tree/
> >
> > Why not
> >
> > obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
> > obj-$(CONFIG_DOM0LESS_BOOT) += device-tree/
> >
> > as we have it in a few similar situations?
> 
> Because I wasn't sure the build system would swallow it. If you claim it does, sure.
> I think the "firstword" version is clearer, but I don't mind.
> 
> >
> > And why would the duplication be needed in the first place? Shouldn't
> > DOM0LESS_BOOT imply HAS_DEVICE_TREE? Sadly the description once again
> > only says what is intended, but not why. And the dependency is actually
> > visible in patch context above, in the hunk altering xen/common/Kconfig.
> >
> > Jan
> 
> After this series the idea is that CONFIG_HAS_DEVICE_TREE means a platform
> in which platform resources (memory, devices, etc) are described on DTs.
> 
> While x86 ends up understanding DTs to the extent that it's able to parse
> and extract "xen,domain" nodes, it's not capable of much more than that. The
> distinction is important because making x86 understand general DT (devices, IRQs
> and memory) would be far too invasive and not very helpful.
> 
> I can rename it to CONFIG_HAS_PLATFORM_DT or CONFIG_HAS_DT_DEVICES, or anything
> else if you (or anyone else) have any ideas.
> 
> TL;DR: It's to still be able to compile-out the bits x86 cannot use in the DT
> machinery.

Yeah, as it looks like not introducing HAS_DEVICE_TREE on x86 is causing
confusion, maybe it is better to add HAS_DEVICE_TREE to all arches and
use a different kconfig to say "this architecture supports device
discovery via DT", such as CONFIG_HAS_DT_DEVICES or
CONFIG_DT_DEVICE_DISCOVERY.


