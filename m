Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6AA28085D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 22:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1588.4814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO53c-0006Ji-SM; Thu, 01 Oct 2020 20:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1588.4814; Thu, 01 Oct 2020 20:20:04 +0000
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
	id 1kO53c-0006JH-OK; Thu, 01 Oct 2020 20:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1588;
 Thu, 01 Oct 2020 20:20:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thWI=DI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kO53a-0006DV-R6
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 20:20:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1382da9b-f7bf-4fbc-a3a0-7ab9508ebe45;
 Thu, 01 Oct 2020 20:20:02 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5B632074B;
 Thu,  1 Oct 2020 20:20:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=thWI=DI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kO53a-0006DV-R6
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 20:20:02 +0000
X-Inumbo-ID: 1382da9b-f7bf-4fbc-a3a0-7ab9508ebe45
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1382da9b-f7bf-4fbc-a3a0-7ab9508ebe45;
	Thu, 01 Oct 2020 20:20:02 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B5B632074B;
	Thu,  1 Oct 2020 20:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601583601;
	bh=BCHPe3DSjUKxXWAheX0guF7GWZEJzxNcrQ928PIqqIs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uDdRvGbY7QOfkwYAYHYI55dLASN3oBHhnHyagbjT41G6uQNpe59kGPAd2rTjIhpp6
	 5wkP6EZwXQLTGGtbCiHvS3eVk1dtoNrOucUtwc3IquN0ygtiRwz+m/MeymUTlCsVAP
	 Z7kzmTgnUmYRq01hSSSJeQsY3Zeq9ioeE5ga/PkY=
Date: Thu, 1 Oct 2020 13:19:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <George.Dunlap@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "open list:X86" <xen-devel@lists.xenproject.org>, 
    Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Rich Persaud <persaur@gmail.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy
 document
In-Reply-To: <63FFD578-F249-404B-9829-687A42360A76@citrix.com>
Message-ID: <alpine.DEB.2.21.2010011319540.10908@sstabellini-ThinkPad-T480s>
References: <20200930125736.95203-1-george.dunlap@citrix.com> <alpine.DEB.2.21.2009301321431.10908@sstabellini-ThinkPad-T480s> <63FFD578-F249-404B-9829-687A42360A76@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1407231164-1601583600=:10908"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1407231164-1601583600=:10908
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 1 Oct 2020, George Dunlap wrote:
> > On Sep 30, 2020, at 9:23 PM, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 30 Sep 2020, George Dunlap wrote:
> >> Define a specific criteria for how we determine what tools and
> >> libraries to be compatible with.  This will clarify issues such as,
> >> "Should we continue to support Python 2.4" moving forward.
> >> 
> >> Note that CentOS 7 is set to stop receiving "normal" maintenance
> >> updates in "Q4 2020"; assuming that 4.15 is released after that, we
> >> only need to support CentOS / RHEL 8.
> >> 
> >> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> >> ---
> >> 
> >> CC: Ian Jackson <ian.jackson@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> >> CC: Jan Beulich <jbeulich@suse.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Julien Grall <julien@xen.org>
> >> CC: Rich Persaud <persaur@gmail.com>
> >> CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
> >> ---
> >> docs/index.rst                        |  2 +
> >> docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
> >> 2 files changed, 78 insertions(+)
> >> create mode 100644 docs/policies/dependency-versions.rst
> >> 
> >> diff --git a/docs/index.rst b/docs/index.rst
> >> index b75487a05d..ac175eacc8 100644
> >> --- a/docs/index.rst
> >> +++ b/docs/index.rst
> >> @@ -57,5 +57,7 @@ Miscellanea
> >> -----------
> >> 
> >> .. toctree::
> >> +   :maxdepth: 1
> >> 
> >> +   policies/dependency-versions
> >>    glossary
> >> diff --git a/docs/policies/dependency-versions.rst b/docs/policies/dependency-versions.rst
> >> new file mode 100644
> >> index 0000000000..d5eeb848d8
> >> --- /dev/null
> >> +++ b/docs/policies/dependency-versions.rst
> >> @@ -0,0 +1,76 @@
> >> +.. SPDX-License-Identifier: CC-BY-4.0
> >> +
> >> +Build and runtime dependencies
> >> +==============================
> >> +
> >> +Xen depends on other programs and libraries to build and to run.
> >> +Chosing a minimum version of these tools to support requires a careful
> >> +balance: Supporting older versions of these tools or libraries means
> >> +that Xen can compile on a wider variety of systems; but means that Xen
> >> +cannot take advantage of features available in newer versions.
> >> +Conversely, requiring newer versions means that Xen can take advantage
> >> +of newer features, but cannot work on as wide a variety of systems.
> >> +
> >> +Specific dependencies and versions for a given Xen release will be
> >> +listed in the toplevel README, and/or specified by the ``configure``
> >> +system.  This document lays out the principles by which those versions
> >> +should be chosen.
> >> +
> >> +The general principle is this:
> >> +
> >> +    Xen should build on currently-supported versions of major distros
> >> +    when released.
> >> +
> >> +"Currently-supported" means whatever that distro's version of "full
> >> +support".  For instance, at the time of writing, CentOS 7 and 8 are
> >> +listed as being given "Full Updates", but CentOS 6 is listed as
> >> +"Maintenance updates"; under this criterium, we would try to ensure
> >> +that Xen could build on CentOS 7 and 8, but not on CentOS 6.
> >> +
> >> +Exceptions for specific distros or tools may be made when appropriate.
> >> +
> >> +One exception to this is compiler versions for the hypervisor.
> >> +Support for new instructions, and in particular support for new safety
> >> +features, may require a newer compiler than many distros support.
> >> +These will be specified in the README.
> >> +
> >> +Distros we consider when deciding minimum versions
> >> +--------------------------------------------------
> >> +
> >> +We currently aim to support Xen building and running on the following distributions:
> >> +Debian_,
> >> +Ubuntu_,
> >> +OpenSUSE_,
> >> +Arch Linux,
> >> +SLES_,
> >> +Yocto_,
> >> +CentOS_,
> >> +and RHEL_.
> > 
> > Alpine Linux should be in the list (consider its usage in container
> > environment.)
> 
> Sure, we can add that one in.  Although, we might consider requiring that distros on this list be first be added to the Gitlab CI loop if possible.
> 
> > I am still on Alpine Linux 3.7, so I am sure that one works. Probably
> > other versions work too.
> 
> Right, but the question is, if someone posts a patch which causes it to no longer build on 3.7, would we reject it or accept it?
> 
> According to https://wiki.alpinelinux.org/wiki/Alpine_Linux:Releases, only 3.12 is currently receiving bug fixes; so by the criteria above, we would only reject a changeset if it caused a build regression for 3.12.
> 
> I would argue that this is the right approach: It doesn’t make sense for us to spend more effort keeping an old distro working than that community it self spends keeping it working.  The Ubuntu community spends effort keeping Ubuntu 16.04 in working shape, so it makes sense for us to spend effort making sure Xen 4.15 builds and runs on it.  The Alpine Linux community doesn’t promise to spend any effort to fix any more bugs in Alpine Linux 3.11, so it doesn’t make any sense for us to spend effort making sure Xen 4.15 runs on it.
> 
> Obviously if it builds on Ubuntu 16.04 there’s a pretty high probability that it will also build on Alpine Linux 3.4+ (released around the same time); we just don’t want to promise that.

OK
--8323329-1407231164-1601583600=:10908--

