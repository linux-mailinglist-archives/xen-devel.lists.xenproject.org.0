Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4902F5087
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 18:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66632.118412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzjWq-0000UM-Gq; Wed, 13 Jan 2021 17:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66632.118412; Wed, 13 Jan 2021 17:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzjWq-0000Tx-DG; Wed, 13 Jan 2021 17:01:52 +0000
Received: by outflank-mailman (input) for mailman id 66632;
 Wed, 13 Jan 2021 17:01:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzjWo-0000Ts-Fu
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 17:01:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzjWo-0000O5-CN
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 17:01:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzjWo-0007Eu-B9
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 17:01:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kzjWl-0001dG-5r; Wed, 13 Jan 2021 17:01:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=TQjDqchBDnn36QFEZh9mCHYV++GG6C7+rhKXrHY8OnQ=; b=Ovs/nN5wNLwGHv2adgW/nu/hEm
	RI4hmzeWp7DHwrYYGT0XZouKSD2FFz1yoD0B1Bn7jdSITB7LD/RFqSW6iqbIwvQyFlKBd4PnvR2pS
	bXn2cdDjy4r6K3Tq1l4vbzJpnFM2QawhHghEZOCVO+x10o4CRS9GLOhS3D94rkwgDPSQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24575.10106.891084.891608@mariner.uk.xensource.com>
Date: Wed, 13 Jan 2021 17:01:46 +0000
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: Proposal - lightweight auto test binaries
In-Reply-To: <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
References: <24573.56774.41487.933922@mariner.uk.xensource.com>
	<1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: Proposal - lightweight auto test binaries"):
> I've submitted
> https://lore.kernel.org/xen-devel/20210113123455.23209-1-andrew.cooper3@citrix.com/T/#u
> to clean up the not-really-tests from the tests dir.

Yay.

> This leaves us with cpu-policy, depriv, mce-test, vhpet, vpci,
> x86_emulator and xenstore.
> 
> Of those, cpu-policy, vpci and x86_emulator are real unit tests,
> involving varying quantities of gymnastics to compile.  They can in
> principle be run on the build machine, but x86_emulator is sensitive to
> the CPU instructions available, and would definitely benefit from
> running on as wider set of hardware as possible.
> 
> vhpet is also a real unit test, but isn't even compiled by default and
> seems to need some manual code hacking to compile, and takes a
> complicated array command line arguments.
> 
> xenstore needs a running xenstored to talk to, so needs to run on the
> test system, but is otherwise self contained and easy to use.
> 
> depriv, I'm struggling to follow.  Its presumably doing things with the
> various ioctl restriction, therefore wants to be on the test system, but
> does take a complicated array of command line options.

This is already used by osstest in its qemu depriv tests.  It has a
complicated bespoke calling convention.  It think it should not be
disturbed as part of this current work.

> I reckon for a first stab, trying to convert xenstore and cpu-policy to
> the "simple" API would be a good start.  They both have trivial build
> requirements, and would be trivial to convert to an exit code based
> protocol, which would get us content to run for both x86 and ARM in OSSTest.

SGTM

Right, on to your review of my draft.  Thanks for the detailed
attention.

> >  * When appropriately configured, the xen.git build system
> >    will ship them into dist/install/usr/local/....
> >
> >  * There will be a specific directory containing tests which
> >    are suitable for running automatically:
> >       dist/install/usr/local/lib/xen/autotests
> >
> >  * The pass/success reporting API will be encoded into the
> >    filename.  For now we define only one API:
> >      dist/install/usr/local/lib/xen/autotests/simple/*
> 
> Whatever we go for, it ought to be an easy path, and honestly - that's a
> mouthful to get to.  These tests need to be just as easy for developers
> to use.
> 
> How about opt/xen-autotest/* ?  Much easier in a deb/rpm build to filter
> the things which clearly shouldn't be in a production system.  It's also
> invariant of libdir which is an advantage for downstreams who test on
> more than one distro.

I don't have a strong opinion about the path in dist/.  I was
imagining that we would not build these by default, so there wasn't a
problem with clutter in distro packages.

I think that for future extensibility we will want to think about how
tests will find any pieces of data, helper executables, or thatever.
I would prefer to re-use the existing mechanisms for finding pieces of
the installation, even though that makes the result depend on libdir.

Also, that means these tests could be easily plumbed into things like
Debian's autopkgtest system.  That is a mechanism for testing
as-installed packages and a test support .deb is an easy thing to
instroduce there.

In summary, I would prefer to use our existing mechanisms for
controlling the location and installation of binaries, rather than
invent a new ad-hoc arrangement which will turn out to be
insufficient, get extended ad-hoc, and maybe eventually replaced by
the standard approach.

For human developers, I think it's fine to encourage them to run the
programs directly out of the build tree (copied to a target test host
if necessary) rather than an installed copy somewhere in /usr.  I do
that with xl stuff and similar all the time - rsyncing the tree to my
test box from the build box if they're not the same environent.

> I certainly have plans to reuse this infrastructure in XenRT.  I expect
> other downstreams would as well.
> 
> > The "simple" test API is as follows:
> >
> >  * Every executable file (or symlink to one) in
> >      dist/install/usr/local/lib/xen/autotests/simple/
> >    will be run with no arguments.
> >
> >  * Only files whose names contain only [-0-9a-z] will be run.
> >    Others will be ignored.  NB _ is not allowed.
> 
> I'm happy not using _, but why the restriction?

That leaves it possible to use _ for delimiters when test case names
are embedded in other strings within in a calling test case framework,
etc.  Cf the same restriction on Debian package names, which means
that a conventional .deb filename can be reliably broken into its
component parts.

Also making a rule for _ vs - makes the result more aesthetically
pleasing and also easier for humans who do not have to guess (or
remember) whether a particular test has _ or - (or even both!).  So we
should forbid exactly one of the two.

> >  * Tests *must not* print anything to stdout.  Test runners *must*
> >    ignore stdout (though they may log it, possibly mixed in with
> >    stderr).  stdout is reserved for future extension.
> 
> I disagree.  It is far more important that the tests are pleasant for
> humans to use, both in terms of developing them to begin with, and
> maintaining them if they go wrong.
> 
> In practice, this means human-useful stuff on stdout.  The test
> automation does not need to care - all it should do is log
> stdout/stderr, and act upon the exit code.  (Perhaps this is what you
> meant, but its not clear IMO.)

I don't know why this human-useful stuff cannot be printed to stderr ?

The reason I want to reserve stdout is that it provides a test
behaviour that allows a test runner to distinguish tests conforming to
this test protocol, from ones which conform to a more recent version.

So I'm imagining stdout containing machine-readable but
human-tolerable output.

> >  * Tests should exit with XTF ERROR if they are passed any arguments.
> 
> ./test-foo --debug-this-harder would be a perfectly reasonable thing for
> a human to use to investigate problems, and it is what we use in the
> fuzzing harnesses for investigating crashes.

You make a good point.

How about this:

   Tests must have a command line parser which rejects unknown options
   (arguments starting with `--') at the start of the command line.
   (In the case of a very simple test, it is acceptable to reject all
   command line arguments.)  "Reject" means exit with XTF_ERROR.

However having thought about this I think we need a different error
code meaning "I don't support the protocol you are trying to use".
None of the existing XTF ones seem suitable.  Can we assign
7 to mean XTF_BADUSAGE ?

The only practical burden on test authors is that they have to make
their option parser exit 7 on bad options rather than whatever it
would normally do.  And that they have to actually do *something* with
argv even if it's only to insist there's nothing there and bail if
there is.

> The automation support shouldn't get in the way of humans, and in this
> case it really doesn't need to.  Nothing on the automation side of
> things ought to try passing parameters, and we absolutely aren't going
> to put in an addition test to fuzz the command line and check that ERROR
> is reported in all cases.

Passing parameters might be part of a future extension of the API.

> >  * Tests will be run sequentially on a Xen dom0.  If the environment
> >    (eg Xen configuration) or hardware is not suitable they should
> >    report SKIP.
> >
> >  * If a test program reports SUCCESS or SKIP, it *must* leave the
> >    host in a good state suitable for running more tests.  It
> >    *must not* leak resources (domains, xenstore entries, files).
> >    (It may of course advance the domid counter.)
> 
> I'd relax this slightly (s/program reports/is/ ?), because one
> possibility is a false SUCCESS/SKIP exit because of a bug in the test
> binary itself.  This would in practice be a FAIL/ERROR and the host
> might be in a bad state as a consequence.

I don't understand what you mean.  I think a test which falsely
reports SUCCESS/SKIP and leaves the host in a bad state is impossible
for a test runner to cope with in any reasonable way.  So that has to
be regarded as a violation of the spec, and the spec must forbid it.

> >  * Tests may also support being run from the build tree, or from
> >    dist/install/ without copying into /usr/local.  They may require
> >    an environment variable to be set to find ancillary files, or
> >    perhaps look at their argv[0], or something.
> 
> I'd perhaps strengthen this to "Wherever possible, tests SHOULD
> support", because we want to actively encourage this.

Good point.  +1.

> [ discussion of "for these configurations". ]
...
> Instead, I was wondering if we should come up with some stable hypfs
> layout to report Xen platform capabilities.  e.g.

IMO that would be a good way to address this problem.

> However, again in the interest of making the tests useable for humans, I
> might go as far as to suggest that we have two separate binaries, a
> `$FOO-select` which prints out a list of suitable list of `$FOO
> --config-$X` to run and treat as independent "simple" tests.

Surely we can do this by having the test runner pass a command line
argument (or set an env var) rather than making two binaries.  Making
two binaries is quite annoying as it means two command line parsers
and complicated Makefiles for sharing the right object files etc.

> [0] There is a further goal here in the longrun.  A test lab has an
> inventory of hardware with a known/expected configuration.  One part of
> testing should be "does the orchestration framework's idea of what Xen
> ought to be capable of, match what Xen thinks it is capable of?".

Yes.  I think this shouldn't be too difficult, at least to get to the
point of detecting when Xen changes its mind about what is available.

Ian.

