Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEAA2F4F08
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 16:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66588.118328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziKm-0008Ui-5p; Wed, 13 Jan 2021 15:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66588.118328; Wed, 13 Jan 2021 15:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziKm-0008UI-1f; Wed, 13 Jan 2021 15:45:20 +0000
Received: by outflank-mailman (input) for mailman id 66588;
 Wed, 13 Jan 2021 15:45:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdpw=GQ=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kziKi-0008UB-Jv
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 15:45:17 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01555e1d-98e4-420e-a3b8-cf0d104fe325;
 Wed, 13 Jan 2021 15:45:13 +0000 (UTC)
Received: from 88-111-100-194.dynamic.dsl.as9105.com ([88.111.100.194]:59568
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kziKc-0006aB-SW (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Wed, 13 Jan 2021 15:45:11 +0000
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
X-Inumbo-ID: 01555e1d-98e4-420e-a3b8-cf0d104fe325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TSGGpzqQf5qrf/vSHrAPaRQNTjCx/40YehpUsZepPBU=; b=cZrsTw7ZSeH8XN6MH5uM4aWqKi
	50CPzbzyaWAgwNAYUXVZpzU+v6gfSRlbV6RrndN0DVfX4P8jSeMrprqJT8ppZyPSIVgWtBa3UjaeU
	4f60tX3uZa2QPsi5L61uxqpqXbwIneWAjrq4zSjNaJJDmaBnLPjaRsnozKdEIX6Cd/V8=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: Proposal - lightweight auto test binaries
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <24573.56774.41487.933922@mariner.uk.xensource.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <1623bbc5-5258-30eb-2e1a-7c9b0f27fbd7@cam.ac.uk>
Date: Wed, 13 Jan 2021 15:45:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24573.56774.41487.933922@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 12/01/2021 17:35, Ian Jackson wrote:
> Andy and I were discussing some new tests he's written which (will)
> live in xen.git and which we would like to wire into osstest.
>
> We came up with the following proposal (I have refined some of the
> details beyond what we discussed on IRC):
>
>  * Tests will live in tools/tests/ ideally, but they might
>    live in other places in the xen.git source tree.

I've submitted
https://lore.kernel.org/xen-devel/20210113123455.23209-1-andrew.cooper3@citrix.com/T/#u
to clean up the not-really-tests from the tests dir.

This leaves us with cpu-policy, depriv, mce-test, vhpet, vpci,
x86_emulator and xenstore.

Of those, cpu-policy, vpci and x86_emulator are real unit tests,
involving varying quantities of gymnastics to compile.  They can in
principle be run on the build machine, but x86_emulator is sensitive to
the CPU instructions available, and would definitely benefit from
running on as wider set of hardware as possible.

vhpet is also a real unit test, but isn't even compiled by default and
seems to need some manual code hacking to compile, and takes a
complicated array command line arguments.

xenstore needs a running xenstored to talk to, so needs to run on the
test system, but is otherwise self contained and easy to use.

depriv, I'm struggling to follow.  Its presumably doing things with the
various ioctl restriction, therefore wants to be on the test system, but
does take a complicated array of command line options.

mce-test is a complicated mess of test case scripts, which look like
they might have been pulled out of a preexisting test framework
elsewhere.  The binary xen-mceinj uses the MCE interposer functionality
to try and inject real-looking errors into the system.  I haven't had
much luck with this in the past, and it has been bitrotting for most of
a decade.  I don't know if there is anything salvageable here or not.


I've had a quick look through the rest of the tree and I can't spot
anything else which is obviously test code.


I reckon for a first stab, trying to convert xenstore and cpu-policy to
the "simple" API would be a good start.  They both have trivial build
requirements, and would be trivial to convert to an exit code based
protocol, which would get us content to run for both x86 and ARM in OSSTest.

CC Juergen, who is the owner of the xenstore test.  Are you happy with
this being tweaked in the hope that it gets run automatically by OSSTest?

The rest of the tests are going to be varying quantities of complicated
to convert.

>  * When appropriately configured, the xen.git build system
>    will ship them into dist/install/usr/local/....
>
>  * There will be a specific directory containing tests which
>    are suitable for running automatically:
>       dist/install/usr/local/lib/xen/autotests
>
>  * The pass/success reporting API will be encoded into the
>    filename.  For now we define only one API:
>      dist/install/usr/local/lib/xen/autotests/simple/*

Whatever we go for, it ought to be an easy path, and honestly - that's a
mouthful to get to.  These tests need to be just as easy for developers
to use.

How about opt/xen-autotest/* ?  Much easier in a deb/rpm build to filter
the things which clearly shouldn't be in a production system.  It's also
invariant of libdir which is an advantage for downstreams who test on
more than one distro.

I certainly have plans to reuse this infrastructure in XenRT.  I expect
other downstreams would as well.

> The "simple" test API is as follows:
>
>  * Every executable file (or symlink to one) in
>      dist/install/usr/local/lib/xen/autotests/simple/
>    will be run with no arguments.
>
>  * Only files whose names contain only [-0-9a-z] will be run.
>    Others will be ignored.  NB _ is not allowed.

I'm happy not using _, but why the restriction?

>  * A test may exit with one of the XTF exit statuses:
>           0 # XTF SUCCESS
>           3 # XTF SKIP
>           4 # XTF ERROR
>           5 # XTF FAILURE
>           6 # XTF CRASH
>    (osstest will treat anything other than 0 and 3 as "fail")
>    Any other termination should be treated as CRASH.
>
>  * If a test exits nonzero it should print some information about
>    the situation to stderr.
>
>  * Tests may print other information to stderr, which will be captured
>    and logged.
>
>  * Tests *must not* print anything to stdout.  Test runners *must*
>    ignore stdout (though they may log it, possibly mixed in with
>    stderr).  stdout is reserved for future extension.

I disagree.  It is far more important that the tests are pleasant for
humans to use, both in terms of developing them to begin with, and
maintaining them if they go wrong.

In practice, this means human-useful stuff on stdout.  The test
automation does not need to care - all it should do is log
stdout/stderr, and act upon the exit code.  (Perhaps this is what you
meant, but its not clear IMO.)


>  * Tests should exit with XTF ERROR if they are passed any arguments.

./test-foo --debug-this-harder would be a perfectly reasonable thing for
a human to use to investigate problems, and it is what we use in the
fuzzing harnesses for investigating crashes.

The automation support shouldn't get in the way of humans, and in this
case it really doesn't need to.  Nothing on the automation side of
things ought to try passing parameters, and we absolutely aren't going
to put in an addition test to fuzz the command line and check that ERROR
is reported in all cases.

>  * Tests will be run sequentially on a Xen dom0.  If the environment
>    (eg Xen configuration) or hardware is not suitable they should
>    report SKIP.
>
>  * If a test program reports SUCCESS or SKIP, it *must* leave the
>    host in a good state suitable for running more tests.  It
>    *must not* leak resources (domains, xenstore entries, files).
>    (It may of course advance the domid counter.)

I'd relax this slightly (s/program reports/is/ ?), because one
possibility is a false SUCCESS/SKIP exit because of a bug in the test
binary itself.  This would in practice be a FAIL/ERROR and the host
might be in a bad state as a consequence.

>  * If a test reports any other status, the host may not been in a good
>    state any more.
>
>  * Tests should support being run from their installed location
>        /usr/local/lib/xen/autotests/
>    If they need any additional files or data or anything, that
>    *must* be provided somewhere in dist/install/ for installation
>    on the host.
>
>  * Tests may also support being run from the build tree, or from
>    dist/install/ without copying into /usr/local.  They may require
>    an environment variable to be set to find ancillary files, or
>    perhaps look at their argv[0], or something.

I'd perhaps strengthen this to "Wherever possible, tests SHOULD
support", because we want to actively encourage this.

>  * The protocol document (basically, derived from this email) will
>    live in xen.git (and might be shipped as
>      dist/install/usr/local/lib/xen/autotests/README.md
>    or something)
>
> Future directions:
>
> We think we may invent a new multiple-test API where the test program
> can report the outcome of multiple tests.  That will have its own
> directory in dist/install/usr/local/lib/xen/autotests/.
>
> We may invent extensions which involve passing environent variables,
> or command line arguments, to "simple" test programs.  The former will
> be ignored by older test programs and the latter rejected.  The
> precise details are beyond the scope of this mail.
>
> Extension may also involve defining a meaning for the test's stdout.

So I think the "simple" prototol will be fine for a lot of cases,
including one of the two concrete cases I had (the fault_tll test for
exercising error paths in the hypervisor).

The resource mapping test is more complicated, and this complexity
overlaps an area which is already a problem for XTF test selection (and
was encountered when OpenXT got XTF tests into a runnable state).

For resource mapping, I want to have a test which says "for these
configurations, create a domain, and poke the mapping API to check for
expected success/failure cases".

The problem is "for these configurations".  Even at the totally basic level,

* PV and Shadow are conditional on Xen's Kconfig.
* PV32 is further conditional on command line settings, and/or whether
the hardware supports CET-SS.
* HVM is dependent on Kconfig, hardware, firmware and command line
settings.  HAP similarly.

`xl create` doesn't handle missing CONFIG_SHADOW, or PV32 being disabled
cleanly, despite having suitable information available in `xl info`. 
While this can (and should) be fixed, its not helpful for the more
general testing case.

At the moment, some of this information can be obtained from Xen, but
the details are scattered through various stable and unstable
hypercalls, and in at least one case, in a stringly typed
datastructure.  None are pleasant to obtain at the shell level.

Instead, I was wondering if we should come up with some stable hypfs
layout to report Xen platform capabilities.  e.g.

platform/pv/ (dir)
platform/pv/abis = "xen-3.0-x86_64 xen-3.0-x86_32p" (string, but maybe
we drop this now as obsolete)
platform/pv/32 (bool or dir)
platform/hvm/ (dir)
platform/hvm/shadow (bool)
platform/hvm/hap (bool)

Fundamentally, we care about *what* xen can/cannot do in this
configuration on this hardware, far more than we care about specifically
*why* Xen can't do something[0].

These can be retrieved in a reasonably convenient manner on the shell
with $(xenhypfs cat /path) and we could definitely do something more
useful for scripting with exit codes, etc.

When it comes back to testing, we will have a binary which has a range
of configurations built in, and need some mechanism to reliably
calculate the subset of configurations applicable in the current situation.

However, again in the interest of making the tests useable for humans, I
might go as far as to suggest that we have two separate binaries, a
`$FOO-select` which prints out a list of suitable list of `$FOO
--config-$X` to run and treat as independent "simple" tests.

Thoughts?  I really am making some of this up as I go along, but it is
also an area which I've been trying to come up with a good solution for
ages.

~Andrew

[0] There is a further goal here in the longrun.  A test lab has an
inventory of hardware with a known/expected configuration.  One part of
testing should be "does the orchestration framework's idea of what Xen
ought to be capable of, match what Xen thinks it is capable of?".

Mismatches here could be a regression in Xen in boot/feature detection,
or an unexpected Kconfig for the test, or it could be a change in
firmware and/or settings.  Failures of this kind have a habit of causing
weird indirect failures, rather than clear cut failures.

These details are important when it comes to (usefully) testing a
feature, e.g. TSC handling across migrate.  There are hundreds of moving
parts, all of which overlap in complicated ways.  The sane to test this
is to first confirm that Xen thinks the TSCs are synchronised, then that
dom0 agrees, then that we can exercise the various vTSC= options for
domains (using an XTF test rather than a full kernel), as well as the
paravirt enlightenments, and then to test a full kernel, first on boot,
then on localhost live migrate (i.e. the underlying TSC frequency
definitely doesn't change), and then with a remote live migration.

At the moment, debugging "the kernel decided that time went wonky after
migrate" is utterly miserable.  The most recent time I played this game,
it really was a regression in a firmware update.

Frankly - I would love it if all areas of functionality had tests broken
down in a manor similar to ^, because life is far too short to reverse
engineer "what went wrong first" manually when a robot can answer that
question for me.

