Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96641280D71
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 08:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1690.5130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOEVr-0004kB-89; Fri, 02 Oct 2020 06:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1690.5130; Fri, 02 Oct 2020 06:25:51 +0000
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
	id 1kOEVr-0004jm-4m; Fri, 02 Oct 2020 06:25:51 +0000
Received: by outflank-mailman (input) for mailman id 1690;
 Fri, 02 Oct 2020 06:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G19b=DJ=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kOEVp-0004jh-D2
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:25:49 +0000
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f5ced9a-b3fa-4b38-b02a-69e256b06704;
 Fri, 02 Oct 2020 06:25:47 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 60so413860otw.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 23:25:47 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=G19b=DJ=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
	id 1kOEVp-0004jh-D2
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:25:49 +0000
X-Inumbo-ID: 3f5ced9a-b3fa-4b38-b02a-69e256b06704
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3f5ced9a-b3fa-4b38-b02a-69e256b06704;
	Fri, 02 Oct 2020 06:25:47 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 60so413860otw.3
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 23:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TgGLU5+vZtsKDgvmriYU+N6YNNe1OuuLxuc8yu///lw=;
        b=ZJCa28PmK9pfAQb1z/Fz5nQujMMj9GwOECW8lGHmILPMDdScECcutYS+9Mxuj/X5o7
         QjtfMVLXUHXXFk1t5i1TJShzT9a+YUlEPXN8yJ4A9p1dj8fUg6+n6TIC9QVlNy19K7QY
         JcUKsbgwPyTbvME8nmGR0fwh4gpbh9zB4gEg1hf/s+J64UxgUxpLBQd0KVDDfSuZU648
         p7HB5oEvdY9axpSx5bfJGc/JwyuMDMWHNZJxylUxjWPzc3oOivdXgbjXKRHVI26tHTYY
         VpEbpCFOawUgtIu9c2wSdibgFIE1KiuQV2KZkvoPmJd6GoUA1DreE3hxvnsCevo9ojxt
         J8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TgGLU5+vZtsKDgvmriYU+N6YNNe1OuuLxuc8yu///lw=;
        b=cgf3X22j7pYUxE03ITmjwVNrQX8XemxpQEahz5KiX3p5j23InRAgUbtqAQTJvAoDXH
         xEoE4wF+FljC/v26AjYSZXNmxKKeESiuoU2RoBI4Lpzmyy4RHw7gSWbj8JNMx/HJI39N
         0vfNuiJN9c21q0mEJsdY4roBFHH8oJw2Hb1D7QbNxnmc3kEE8kfv6SFPaOngFfnzc1fb
         /6dIzLG/GaRLu/5UgJ7ag76tX12F/hf4w65lVbOqwcWYiafQ31bl5LnZVmZT93D4v9xx
         3JRmiZw/6ooL9o5LGa8kCwr/sj8VT4VfWs0klEMt4/VL55y+OJgl0QHlO36YdolbLm8u
         69hA==
X-Gm-Message-State: AOAM5321q2FpOiA81ZzT3mu2kGJC0lDJHDjvJiKZN22DpU1iDu3CwSia
	Y5rF0QAWFCwALN64ECAKkKD04uSzJnV0Nlmx+b8=
X-Google-Smtp-Source: ABdhPJxmttwG977th61NKAuyvbxpggYMqZWaJhVHmnsWppEQt2W6DDhYGUBOAJgyTHNbsrXCylGzgFKHr6jp+OCRA4A=
X-Received: by 2002:a9d:20ca:: with SMTP id x68mr81402ota.80.1601619947380;
 Thu, 01 Oct 2020 23:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200930125736.95203-1-george.dunlap@citrix.com> <683E2686-1551-493B-A3AE-D0707C937155@arm.com>
In-Reply-To: <683E2686-1551-493B-A3AE-D0707C937155@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 1 Oct 2020 23:25:35 -0700
Message-ID: <CACMJ4Gac-rtoWqV=A-LT8VLU=SZQogSR009FjJiH3fF6rju5PQ@mail.gmail.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>, 
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Rich Persaud <persaur@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 1, 2020 at 7:38 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi George,
>
> + Christopher Clark to have his view on what to put for Yocto.
>
> > On 30 Sep 2020, at 13:57, George Dunlap <george.dunlap@citrix.com> wrote:
> >
> > Define a specific criteria for how we determine what tools and
> > libraries to be compatible with.  This will clarify issues such as,
> > "Should we continue to support Python 2.4" moving forward.
> >
> > Note that CentOS 7 is set to stop receiving "normal" maintenance
> > updates in "Q4 2020"; assuming that 4.15 is released after that, we
> > only need to support CentOS / RHEL 8.
> >
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> > ---
> >
> > CC: Ian Jackson <ian.jackson@citrix.com>
> > CC: Wei Liu <wl@xen.org>
> > CC: Andrew Cooper <andrew.cooper3@citrix.com>
> > CC: Jan Beulich <jbeulich@suse.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Julien Grall <julien@xen.org>
> > CC: Rich Persaud <persaur@gmail.com>
> > CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > ---
> > docs/index.rst                        |  2 +
> > docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
> > 2 files changed, 78 insertions(+)
> > create mode 100644 docs/policies/dependency-versions.rst
> >
> > diff --git a/docs/index.rst b/docs/index.rst
> > index b75487a05d..ac175eacc8 100644
> > --- a/docs/index.rst
> > +++ b/docs/index.rst
> > @@ -57,5 +57,7 @@ Miscellanea
> > -----------
> >
> > .. toctree::
> > +   :maxdepth: 1
> >
> > +   policies/dependency-versions
> >    glossary
> > diff --git a/docs/policies/dependency-versions.rst b/docs/policies/dependency-versions.rst
> > new file mode 100644
> > index 0000000000..d5eeb848d8
> > --- /dev/null
> > +++ b/docs/policies/dependency-versions.rst
> > @@ -0,0 +1,76 @@
> > +.. SPDX-License-Identifier: CC-BY-4.0
> > +
> > +Build and runtime dependencies
> > +==============================
> > +
> > +Xen depends on other programs and libraries to build and to run.
> > +Chosing a minimum version of these tools to support requires a careful
> > +balance: Supporting older versions of these tools or libraries means
> > +that Xen can compile on a wider variety of systems; but means that Xen
> > +cannot take advantage of features available in newer versions.
> > +Conversely, requiring newer versions means that Xen can take advantage
> > +of newer features, but cannot work on as wide a variety of systems.
> > +
> > +Specific dependencies and versions for a given Xen release will be
> > +listed in the toplevel README, and/or specified by the ``configure``
> > +system.  This document lays out the principles by which those versions
> > +should be chosen.
> > +
> > +The general principle is this:
> > +
> > +    Xen should build on currently-supported versions of major distros
> > +    when released.
> > +
> > +"Currently-supported" means whatever that distro's version of "full
> > +support".  For instance, at the time of writing, CentOS 7 and 8 are
> > +listed as being given "Full Updates", but CentOS 6 is listed as
> > +"Maintenance updates"; under this criterium, we would try to ensure
> > +that Xen could build on CentOS 7 and 8, but not on CentOS 6.
> > +
> > +Exceptions for specific distros or tools may be made when appropriate.
> > +
> > +One exception to this is compiler versions for the hypervisor.
> > +Support for new instructions, and in particular support for new safety
> > +features, may require a newer compiler than many distros support.
> > +These will be specified in the README.
> > +
> > +Distros we consider when deciding minimum versions
> > +--------------------------------------------------
> > +
> > +We currently aim to support Xen building and running on the following distributions:
> > +Debian_,
> > +Ubuntu_,
> > +OpenSUSE_,
> > +Arch Linux,
> > +SLES_,
> > +Yocto_,
> > +CentOS_,
> > +and RHEL_.
> > +
> > +.. _Debian: https://www.debian.org/releases/
> > +.. _Ubuntu: https://wiki.ubuntu.com/Releases
> > +.. _OpenSUSE: https://en.opensuse.org/Lifetime
> > +.. _SLES: https://www.suse.com/lifecycle/
> > +.. _Yocto: https://wiki.yoctoproject.org/wiki/Releases
> > +.. _CentOS: https://wiki.centos.org/About/Product
> > +.. _RHEL: https://access.redhat.com/support/policy/updates/errata
> > +
> > +Specific distro versions supported in this release
> > +--------------------------------------------------
> > +
> > +======== ==================
> > +Distro   Supported releases
> > +======== ==================
> > +Debian   10 (Buster)
> > +Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Beaver), 16.04 (Xenial Xerus)
> > +OpenSUSE Leap 15.2
> > +SLES     SLES 11, 12, 15
> > +Yocto    3.1 (Dunfell)
>
> Yocto only supports one version of Xen (as there is usually only one xen recipe per yocto version)

I'm not sure that's totally accurate: the Yocto Xen recipes are
written to support backwards compatibility with older versions of Xen.
In general, care and effort has been expended to support building with
multiple versions of Xen with the same recipes, via variable override
or bbappend, and it is expected to work.

> which can make the version here a bit tricky:
> Yocto 3.1 (Dunfell) supports only Xen 4.12
> Yocto 3.2 (Gategarth) support only Xen 4.14 but has a Yocto master recipe which should actually be used
> by someone who would want to try Xen master.
>
> So I would suggest to put Yocto 3.2 here only.
>
> @Christopher: what is your view here ?

Thanks for asking. I don't quite agree with that recommendation: I
think Dunfell does belong, with an indication that it requires
Gatesgarth meta-virtualization. Dunfell is the LTS release, so a
compatibility statement about it is important. ie:

Yocto 3.1 (Dunfell + Gatesgarth meta-virtualization)

Effort has already been made within Yocto to make the Gatesgarth
meta-virtualization layer compatible with Dunfell open-embedded core,
specifically to allow newer Xen to be used with the LTS Dunfell
software from the core layers. I would hope that any issues that are
found with that configuration will be posted so they can be fixed.

thanks,

Christopher

>
> Cheers
> Bertrand
>
> > +CentOS   8
> > +RHEL     8
> > +======== ==================
> > +
> > +.. note::
> > +
> > +   We also support Arch Linux, but as it's a rolling distribution, the
> > +   concept of "security supported releases" doesn't really apply.
> > --
> > 2.25.1
> >
> >
>

