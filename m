Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD665CB8D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470882.730540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCshh-0001U7-7w; Wed, 04 Jan 2023 01:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470882.730540; Wed, 04 Jan 2023 01:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCshh-0001Sg-50; Wed, 04 Jan 2023 01:36:29 +0000
Received: by outflank-mailman (input) for mailman id 470882;
 Wed, 04 Jan 2023 01:36:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCshf-0001Sa-Sw
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:36:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 326c050d-8bd0-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 02:36:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 984716157D;
 Wed,  4 Jan 2023 01:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C409C433F1;
 Wed,  4 Jan 2023 01:36:22 +0000 (UTC)
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
X-Inumbo-ID: 326c050d-8bd0-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672796183;
	bh=GQAamOljZd55tkVcWUsHddK5hYE0gMhCzFuyOd9DZd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aIhtNsQ2iVKyJPgCqVS3G3Zz/1hW7XTt4tju1nwRPASAw13zF8OUqvrAJ3ih6B+Jw
	 oQ2Cg1ODHS7pXBYl3eeK3G/FWwLkX5CFLl17s2/si/tYwbif1GjCeuynMPYIKy16MW
	 jTTp1oRXuJQ407tjj3fmcIkBy7HbWWE6+TqXg08WWEmatXmtGUNHqfszNl9o4/bWI1
	 5zSRUprnfwkG3NBdXc9Q2wrkYanjl5b87r2lDNJbV4aOXDABRt4hdGlqPcIWIuD1tv
	 OkOJlWnNhE5WQzZ15ikTzw7qtEWl1WJMCyjdFUbSliupWQ4m4Vh+00qj1iP1MzwVtA
	 V7mNArNzZnBlw==
Date: Tue, 3 Jan 2023 17:36:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
In-Reply-To: <34e692e3-ef76-a43e-ec4f-a7c1ed2d094f@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031733410.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-5-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2301031713530.4079@ubuntu-linux-20-04-desktop> <34e692e3-ef76-a43e-ec4f-a7c1ed2d094f@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Jan 2023, Andrew Cooper wrote:
> On 04/01/2023 1:15 am, Stefano Stabellini wrote:
> > On Fri, 30 Dec 2022, Andrew Cooper wrote:
> >
> >> Whether to build only Xen, or everything, is a property of container,
> >> toolchain and/or testcase.  It is not a property of XEN_TARGET_ARCH.
> >>
> >> Capitalise HYPERVISOR_ONLY and have it set by the debian-unstable-gcc-arm32-*
> >> testcases at the point that arm32 get matched with a container that can only
> >> build Xen.
> >>
> >> For simplicity, retain the RANDCONFIG -> HYPERVISOR_ONLY implication.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Doug Goldstein <cardoe@cardoe.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Anthony PERARD <anthony.perard@citrix.com>
> >> CC: Michal Orzel <michal.orzel@amd.com>
> >> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >> ---
> >>  automation/gitlab-ci/build.yaml |  2 ++
> >>  automation/scripts/build        | 11 ++++-------
> >>  2 files changed, 6 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> >> index 93d9ff69a9f2..e6a9357de3ef 100644
> >> --- a/automation/gitlab-ci/build.yaml
> >> +++ b/automation/gitlab-ci/build.yaml
> >> @@ -516,11 +516,13 @@ debian-unstable-gcc-arm32:
> >>    extends: .gcc-arm32-cross-build
> >>    variables:
> >>      CONTAINER: debian:unstable-arm32-gcc
> >> +    HYPERVISOR_ONLY: y
> >>  
> >>  debian-unstable-gcc-arm32-debug:
> >>    extends: .gcc-arm32-cross-build-debug
> >>    variables:
> >>      CONTAINER: debian:unstable-arm32-gcc
> >> +    HYPERVISOR_ONLY: y
> > can you move the setting of HYPERVISOR_ONLY to .arm32-cross-build-tmpl ?
> 
> Not really - that's the point I'm trying to make in the commit message.
> 
> > I think that makes the most sense because .arm32-cross-build-tmpl is the
> > one setting XEN_TARGET_ARCH and also the x86_64 tag.
> 
> It's not about x86_64; its about the container.
> 
> Whether we can build just Xen, or everything, solely depends on the
> contents in debian:unstable-arm32-gcc
> 
> If we wanted to, we could update unstable-arm32-gcc's dockerfile to
> install the arm32 cross user libs, and drop this HYPERVISOR_ONLY
> restriction.

If it is a property of the container, shouldn't HYPERVISOR_ONLY be set
every time the debian:unstable-arm32-gcc container is used? Including
debian-unstable-gcc-arm32-randconfig and
debian-unstable-gcc-arm32-debug-randconfig?

I realize that the other 2 jobs are randconfigs so HYPERVISOR_ONLY gets
set anyway. But if HYPERVISOR_ONLY is a property of the specific
container, then I think it would be best to be consistent and set
HYPERVISOR_ONLY everywhere debian:unstable-arm32-gcc is used.

E.g. one day we could just randconfigs to build also the tools with a
simple change to the build script and otherwise we would need to
remember to also add the HYPERVISOR_ONLY tag for the other 2 jobs using
debian:unstable-arm32-gcc.

