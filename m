Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD46E0284
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 01:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520409.807948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmjq2-0004r0-4A; Wed, 12 Apr 2023 23:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520409.807948; Wed, 12 Apr 2023 23:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmjq2-0004p2-0A; Wed, 12 Apr 2023 23:25:18 +0000
Received: by outflank-mailman (input) for mailman id 520409;
 Wed, 12 Apr 2023 23:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+hK=AD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pmjq0-0004ow-DM
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 23:25:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45f9ca5e-d989-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 01:25:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20EEB62E1D;
 Wed, 12 Apr 2023 23:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A99C433EF;
 Wed, 12 Apr 2023 23:25:09 +0000 (UTC)
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
X-Inumbo-ID: 45f9ca5e-d989-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681341911;
	bh=vPbyqvQQY1g9sdApUh+HKPuhZ4O391Xu9iswHov8S3E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SPWtHMDfw22R1+xyrL3WXUPwDIm73YYfsCPu7ALXE7hzQf66/Hs+UGgPZ36t0uBy6
	 PGPLEUpXAhNDPhpFwvcFSmO4jXj5j0+keYBkpSjlaFAV6Yz7HsBQPRsIKsUKxaMD4B
	 0OU+sRtst683UepYfjcBjGHxDubT1O9r+N7bhsElqIzQxL0iXo8TQfVx/WRttLL6b8
	 FPU8aMiQzPOWh1YbQT8+peLo7IwNQU1XDEyx9o1zB84Vt0NY9ln03oGlhsDb3CJAC+
	 jb+39oSJTZOIMqmi2NTDMrW9YcfAz15tgrcuicNSfLwrvLHoeYtvrR1n5ZYDcoBzPK
	 bdX5Zw5dvQGqQ==
Date: Wed, 12 Apr 2023 16:25:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Henry Wang <Henry.Wang@arm.com>, michal.orzel@amd.com, 
    anthony.perard@citrix.com, george.dunlap@cloud.com, julien@xen.org
Subject: Re: Gitlab status on older branches (Inc some 4.18 blockers)
In-Reply-To: <193206bf-76a0-818d-8fa8-1886a15ad5e5@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2304121522410.15580@ubuntu-linux-20-04-desktop>
References: <193206bf-76a0-818d-8fa8-1886a15ad5e5@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1692276256-1681338173=:15580"
Content-ID: <alpine.DEB.2.22.394.2304121522590.15580@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1692276256-1681338173=:15580
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304121522591.15580@ubuntu-linux-20-04-desktop>

On Wed, 12 Apr 2023, Andrew Cooper wrote:
> Hello,
> 
> I've done various backports to staging-4.14 and later trying to improve
> the state of Gitlab testing.
> 
> The good news is that 4.16 and 4.17 now pass.  The bad news is that
> there are still bugs which need fixing, but lets start with the older
> branches.
> 
> Also, I was forced to backport an update to SeaBIOS 1.16 to all branches
> in order to fix compile failures in build environments we supported at
> the time of each of these releases.  I honestly don't know what we were
> failing to do testing wise back then, but whatever we missed ought to
> have been release blockers.
> 
> 
> 4.15:
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/834460832
> 
> Individual failure instances:
> 
> 1) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232265
> 
> This is a -Werror=array-bounds failure in HVMLoader but the same
> job/container works in 4.16 and newer, and the underlying code is the
> same.  There must be some change in the build environment, but I haven't
> worked out what yet.

> 2) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232266
> 
> This is a -Werror=array-bounds in iPXE.  Probably needs an update like
> SeaBIOS too.
 

Also seeing your valid comments below about using stable releases for
tests, I think it would be reasonable to disable or allow_failure the
archlinux tests in stable trees, given that archlinux is a rolling
distro.

This would "solve" 1) and 2) and also 5) and probably 6) below

In the sense that maybe it doesn't make sense to backport fixes to 4.15
so that we can build 4.15 with versions of GCC released after 4.15 was
out. I am open to all options, and also OK if we prefer to fix it.

That leaves us with 3) and 4).


> 3) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232290
> 
> This is a Qemu upstream failure which I do vaguely recall.  Bit it also
> means that Xen 4.15 had a dead-on-arrival version of qemu which call
> into question a number of our normal release activities.  Probably the
> least-bad option is to backport the one fix relevant to this, because
> changing the version of qemu in the security-only trees is far riskier
> than changing one of the in-guest ROMs.

This seems to be an header inclusion problem: /usr/include/linux/swab.h
is picking up the BITS_PER_LONG implementation from QEMU
(include/qemu/bitops.h) instead of the one from somewhere else under
/usr/include.

/usr/include/linux/swab.h:137:5: error: token is not a valid binary operator in a preprocessor subexpression
#if BITS_PER_LONG == 64
    ^~~~~~~~~~~~~
/builds/xen-project/people/andyhhp/xen/tools/qemu-xen-dir/include/qemu/bitops.h:20:41: note: expanded from macro 'BITS_PER_LONG'
#define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
                                 ~~~~~~ ^
  CC      block/commit.o
1 error generated.
/builds/xen-project/people/andyhhp/xen/tools/qemu-xen-dir/rules.mak:69: recipe for target 'block/file-posix.o' failed
make: *** [block/file-posix.o] Error 1

I don't know which specific QEMU commit would solve this. Or whether we
can get away with remove/install one or more Debian Stretch packages to
make it work.



There is a one more different failure here:
https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232292

This one is:

qemu-xen-dir/include/qemu/bitops.h:20:34: error: "sizeof" is not defined [-Werror=undef]
 #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)

And it seems to match from qemu.git:

commit b5d621ff4a7d86e82a58104d5706bda2b4238626
Author: Thomas Huth <thuth@redhat.com>
Date:   Wed May 20 10:38:37 2020 +0200

    gitlab-ci: Do not use the standard container images from gitlab

which points to a problem with the base container image.


> 4) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232334
> 
> I have no idea what's going on here.  If nothing else, we're failing to
> collect all the relevant log files from a build and that probably wants

https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg01103.html

From the thread, the same error before happened when the QEMU configure
invocation didn't have:

  -I$(XEN_ROOT)/tools/libs/devicemodel/include 
  -L$(XEN_ROOT)/tools/libs/devicemodel 

in --extra-cflags

However, there are no changes in tools/Makefile between 4.15 and 4.16
which makes me think this issue was fixed on the QEMU side instead.


> 5) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097232324
> 
> This isn't so much about the failure, as the fact that the OpenSUSE Leap
> tests (which were replaced with tumbleweed in newer versions of Xen)
> probably want the same doing to them.  And being marked as
> non-blocking.  This is a failure somewhere in the middle of qemu.
> 
> But, on top of all of ^, I discovered that we have a majority of tests
> being debian/unstable which, when we refreshed to fix the HTTPS issue,
> ended up retrofitting a newer-than-at-release-time build environment to
> the old trees.
> 
> This has come up previously, and not addressed, so I'm now declaring it
> a blocker for 4.18.  Only tests against a fixed disto version can be
> blocking; those against an unstable distro must be non-blocking, and
> most of the currently unstable things should be transformed into their
> stable alternative.  For backports, we want to retrofit what
> debian/unstable was at the time of release, rather than what it
> currently is.

Yes this is a good idea, +1


> Furthermore, the fixed distros we currently test in staging are old
> bordering on obsolete.  Which is not a healthy position to be in as far
> as the 4.18 release goes.
> 
> 
> 4.14:
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/834461234
> 
> 6) https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4097236330
> 
> This is the only 4.14 failure I can see which isn't a duplicate of a
> 4.15 failure, but it is an OpenSUSE leap failure in qemu so perhaps
> related to #5
> 
> 
> As a general note, we still have too much testing (and/or insufficient
> testing resource).  It's very painful waiting 2h for each branch to
> complete.  I'm very tempted to trim things down further on staging and
> backport the results.

On the ARM side we should still be OK.

On the x86 side, I was hoping to get more HW resources very soon. I
wonder if any of the people in this thread have any updates?

Otherwise, anyone that can temporarily contribute a workstation/server
to run a gitlab-runner?
--8323329-1692276256-1681338173=:15580--

