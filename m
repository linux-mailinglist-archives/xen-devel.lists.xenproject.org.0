Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F133F4F9E21
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 22:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301789.515099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncvAS-0005Un-Qe; Fri, 08 Apr 2022 20:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301789.515099; Fri, 08 Apr 2022 20:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncvAS-0005Sk-NZ; Fri, 08 Apr 2022 20:25:16 +0000
Received: by outflank-mailman (input) for mailman id 301789;
 Fri, 08 Apr 2022 20:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncvAQ-0005Se-Sg
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 20:25:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe66a0f2-b779-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 22:25:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8289861BFA;
 Fri,  8 Apr 2022 20:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBC5C385A1;
 Fri,  8 Apr 2022 20:25:11 +0000 (UTC)
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
X-Inumbo-ID: fe66a0f2-b779-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649449511;
	bh=UbNIF/ZuQqYIGCv0Q+ldkWlSsYlSMzNAGS6N7fOX2Iw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VOJ89EMv6LlA21dGFsjy18ZC+t22oVs9C+kYlpf2vpVqCOO09qiP0a4hfZ6d8DcPl
	 qQVw1KoDmnNOtKLH5tX7E9DRu1UZsIzICz0cb8Z4Oiv8W9SeUuvhGo55gGEwFZJT/Q
	 lEBce/6qfo3oR5X+KYcC3pQ/hI77f5WYn5qHeJYMLaop3SEpYG64PepxADNrkqSAQA
	 q0IC2ti/FMxB4fjfuDNbyj5yU5miywmQ9IpqyA9u+gL8QbPuIMGRKfmhF+7+RPgJKN
	 zLgC6xxo98NoDOaO1PNxnk1GYPe4I1f9ZssaHKM4ueLCfh3fbsENUxr8QoR7NezLWY
	 nby8VS98AyTYA==
Date: Fri, 8 Apr 2022 13:25:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
References: <20220408084517.33082-1-luca.fancellu@arm.com> <20220408084517.33082-5-luca.fancellu@arm.com> <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com> <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com> <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Apr 2022, Jan Beulich wrote:
> On 08.04.2022 13:37, Luca Fancellu wrote:
> > 
> > 
> >> On 8 Apr 2022, at 10:01, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 08.04.2022 10:45, Luca Fancellu wrote:
> >>> ---
> >>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
> >>> xen/arch/arm/include/asm/smp.h         |   3 +
> >>> xen/common/Kconfig                     |   7 +
> >>> xen/common/Makefile                    |   1 +
> >>> xen/common/boot_cpupools.c             | 207 +++++++++++++++++++++++++
> >>> xen/common/sched/cpupool.c             |  12 +-
> >>> xen/include/xen/sched.h                |  14 ++
> >>> 7 files changed, 383 insertions(+), 1 deletion(-)
> >>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
> >>> create mode 100644 xen/common/boot_cpupools.c
> >>
> >> Under whose maintainership is the new file to fall? Without an
> >> addition to ./MAINTAINERS and without the file being placed in
> >> xen/common/sched/, it'll be REST maintainers, which I think would
> >> better be avoided. Would it perhaps make sense to have this as
> >> xen/common/sched/boot.c, allowing other boot-only code to
> >> potentially be moved there over time? This would then also avoid
> >> me asking about the underscore in the file name: Underscores are
> >> a somewhat artificial thing for use in places where dashes can't
> >> be used. Yet in the file system dashes are fine, and dashes are
> >> (slightly) easier to type.
> >>
> > 
> > Ok I can put the new file under xen/common/sched/ as boot.c, should this new
> > file be under this section?
> > 
> > CPU POOLS
> > M:  Juergen Gross <jgross@suse.com>
> > M:  Dario Faggioli <dfaggioli@suse.com>
> > S:  Supported
> > F:  xen/common/sched/cpupool.c
> > + F:  xen/common/sched/boot.c
> 
> If it's to hold general scheduler code (which this shorter name would
> suggest), it shouldn't need any change to ./MAINTAINERS as the
> scheduler section would already cover it then. If it was to remain
> CPU-pools-specific, then you'd need to stick to the longer name and
> put it in the section you have reproduced above.

In my opinion it is best if the maintenance of boot_cpupools.c falls
under "CPU POOLS". Luca, you can retain my reviewed-by when you add
the change to MAINTAINERS or rename the file.

I don't have an opinion if it should be called
xen/common/boot_cpupools.c or xen/common/boot-cpupools.c

