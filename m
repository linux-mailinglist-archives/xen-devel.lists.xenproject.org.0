Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18D27F350
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 22:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.922.3149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNidW-0003M9-3v; Wed, 30 Sep 2020 20:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922.3149; Wed, 30 Sep 2020 20:23:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNidW-0003Lk-0p; Wed, 30 Sep 2020 20:23:38 +0000
Received: by outflank-mailman (input) for mailman id 922;
 Wed, 30 Sep 2020 20:23:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kNidU-0003Lf-Nf
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 20:23:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6250157-7263-42a7-9710-4f9a2df3f69c;
 Wed, 30 Sep 2020 20:23:35 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74B432076A;
 Wed, 30 Sep 2020 20:23:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BzSz=DH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kNidU-0003Lf-Nf
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 20:23:36 +0000
X-Inumbo-ID: b6250157-7263-42a7-9710-4f9a2df3f69c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b6250157-7263-42a7-9710-4f9a2df3f69c;
	Wed, 30 Sep 2020 20:23:35 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 74B432076A;
	Wed, 30 Sep 2020 20:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601497414;
	bh=D8C+uh3doVWpCrpBhbQ7xu5QuCH9wjPpS2s8TayBSxY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WImI9kIJmgzz7P/QVscS7ReH93+jwiGaUfXotZFuwDjy2holQWz3NLD9wlx//HrYQ
	 iEOtCDTJwv3HL98KtKDZFHOAy3Y19wmBEoYutbpgJaW2WesczGE2TfT9Iq8GjUCIma
	 jk3poyMJcvHU44obTOdiwriJAzjJd5XKYoKh66sY=
Date: Wed, 30 Sep 2020 13:23:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <george.dunlap@citrix.com>
cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Rich Persaud <persaur@gmail.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy
 document
In-Reply-To: <20200930125736.95203-1-george.dunlap@citrix.com>
Message-ID: <alpine.DEB.2.21.2009301321431.10908@sstabellini-ThinkPad-T480s>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Sep 2020, George Dunlap wrote:
> Define a specific criteria for how we determine what tools and
> libraries to be compatible with.  This will clarify issues such as,
> "Should we continue to support Python 2.4" moving forward.
> 
> Note that CentOS 7 is set to stop receiving "normal" maintenance
> updates in "Q4 2020"; assuming that 4.15 is released after that, we
> only need to support CentOS / RHEL 8.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> 
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Rich Persaud <persaur@gmail.com>
> CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
> ---
>  docs/index.rst                        |  2 +
>  docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 docs/policies/dependency-versions.rst
> 
> diff --git a/docs/index.rst b/docs/index.rst
> index b75487a05d..ac175eacc8 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -57,5 +57,7 @@ Miscellanea
>  -----------
>  
>  .. toctree::
> +   :maxdepth: 1
>  
> +   policies/dependency-versions
>     glossary
> diff --git a/docs/policies/dependency-versions.rst b/docs/policies/dependency-versions.rst
> new file mode 100644
> index 0000000000..d5eeb848d8
> --- /dev/null
> +++ b/docs/policies/dependency-versions.rst
> @@ -0,0 +1,76 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Build and runtime dependencies
> +==============================
> +
> +Xen depends on other programs and libraries to build and to run.
> +Chosing a minimum version of these tools to support requires a careful
> +balance: Supporting older versions of these tools or libraries means
> +that Xen can compile on a wider variety of systems; but means that Xen
> +cannot take advantage of features available in newer versions.
> +Conversely, requiring newer versions means that Xen can take advantage
> +of newer features, but cannot work on as wide a variety of systems.
> +
> +Specific dependencies and versions for a given Xen release will be
> +listed in the toplevel README, and/or specified by the ``configure``
> +system.  This document lays out the principles by which those versions
> +should be chosen.
> +
> +The general principle is this:
> +
> +    Xen should build on currently-supported versions of major distros
> +    when released.
> +
> +"Currently-supported" means whatever that distro's version of "full
> +support".  For instance, at the time of writing, CentOS 7 and 8 are
> +listed as being given "Full Updates", but CentOS 6 is listed as
> +"Maintenance updates"; under this criterium, we would try to ensure
> +that Xen could build on CentOS 7 and 8, but not on CentOS 6.
> +
> +Exceptions for specific distros or tools may be made when appropriate.
> +
> +One exception to this is compiler versions for the hypervisor.
> +Support for new instructions, and in particular support for new safety
> +features, may require a newer compiler than many distros support.
> +These will be specified in the README.
> +
> +Distros we consider when deciding minimum versions
> +--------------------------------------------------
> +
> +We currently aim to support Xen building and running on the following distributions:
> +Debian_,
> +Ubuntu_,
> +OpenSUSE_,
> +Arch Linux,
> +SLES_,
> +Yocto_,
> +CentOS_,
> +and RHEL_.

Alpine Linux should be in the list (consider its usage in container
environment.)


> +
> +.. _Debian: https://www.debian.org/releases/
> +.. _Ubuntu: https://wiki.ubuntu.com/Releases
> +.. _OpenSUSE: https://en.opensuse.org/Lifetime
> +.. _SLES: https://www.suse.com/lifecycle/
> +.. _Yocto: https://wiki.yoctoproject.org/wiki/Releases
> +.. _CentOS: https://wiki.centos.org/About/Product
> +.. _RHEL: https://access.redhat.com/support/policy/updates/errata
> +
> +Specific distro versions supported in this release
> +--------------------------------------------------
> +
> +======== ==================
> +Distro   Supported releases
> +======== ==================
> +Debian   10 (Buster)
> +Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Beaver), 16.04 (Xenial Xerus)
> +OpenSUSE Leap 15.2
> +SLES     SLES 11, 12, 15
> +Yocto    3.1 (Dunfell)
> +CentOS   8
> +RHEL     8
> +======== ==================
>
I am still on Alpine Linux 3.7, so I am sure that one works. Probably
other versions work too.

