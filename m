Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9B2F3737
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 18:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65803.116569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzNZR-0007yV-HI; Tue, 12 Jan 2021 17:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65803.116569; Tue, 12 Jan 2021 17:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzNZR-0007y9-E8; Tue, 12 Jan 2021 17:35:05 +0000
Received: by outflank-mailman (input) for mailman id 65803;
 Tue, 12 Jan 2021 17:35:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzNZQ-0007y1-2p
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 17:35:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzNZQ-0001Ak-0K
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 17:35:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzNZP-0002Q4-VF
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 17:35:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kzNZO-0007AA-9u; Tue, 12 Jan 2021 17:35:02 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=zLLvbV3qeiq0QYmybZqOZk3taFVnrr2BvEaKpCgSJyk=; b=0YpVMyHkEf/zA3vNeZf7AD0c32
	NpKv4IW4MiA16NIIuMsMXkuLg/amXTIoV12OmMqDMSaBy5chdTxpcBKXImcX0/WR7K+su7HGDPyUP
	WcbIEh9Ls9xrZ9xcKOTQIdSGkv6lR5ns8ni0a6E2Ff8upkutXqPOeKd3n2euU1C42PJg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24573.56774.41487.933922@mariner.uk.xensource.com>
Date: Tue, 12 Jan 2021 17:35:02 +0000
To: xen-devel@lists.xenproject.org
CC: Andrew Cooper <amc96@cam.ac.uk>,
    Wei Liu <wl@xen.org>
Subject: Proposal - lightweight auto test binaries
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andy and I were discussing some new tests he's written which (will)
live in xen.git and which we would like to wire into osstest.

We came up with the following proposal (I have refined some of the
details beyond what we discussed on IRC):

 * Tests will live in tools/tests/ ideally, but they might
   live in other places in the xen.git source tree.

 * When appropriately configured, the xen.git build system
   will ship them into dist/install/usr/local/....

 * There will be a specific directory containing tests which
   are suitable for running automatically:
      dist/install/usr/local/lib/xen/autotests

 * The pass/success reporting API will be encoded into the
   filename.  For now we define only one API:
     dist/install/usr/local/lib/xen/autotests/simple/*

The "simple" test API is as follows:

 * Every executable file (or symlink to one) in
     dist/install/usr/local/lib/xen/autotests/simple/
   will be run with no arguments.

 * Only files whose names contain only [-0-9a-z] will be run.
   Others will be ignored.  NB _ is not allowed.

 * A test may exit with one of the XTF exit statuses:
          0 # XTF SUCCESS
          3 # XTF SKIP
          4 # XTF ERROR
          5 # XTF FAILURE
          6 # XTF CRASH
   (osstest will treat anything other than 0 and 3 as "fail")
   Any other termination should be treated as CRASH.

 * If a test exits nonzero it should print some information about
   the situation to stderr.

 * Tests may print other information to stderr, which will be captured
   and logged.

 * Tests *must not* print anything to stdout.  Test runners *must*
   ignore stdout (though they may log it, possibly mixed in with
   stderr).  stdout is reserved for future extension.

 * Tests should exit with XTF ERROR if they are passed any arguments.

 * Tests will be run sequentially on a Xen dom0.  If the environment
   (eg Xen configuration) or hardware is not suitable they should
   report SKIP.

 * If a test program reports SUCCESS or SKIP, it *must* leave the
   host in a good state suitable for running more tests.  It
   *must not* leak resources (domains, xenstore entries, files).
   (It may of course advance the domid counter.)

 * If a test reports any other status, the host may not been in a good
   state any more.

 * Tests should support being run from their installed location
       /usr/local/lib/xen/autotests/
   If they need any additional files or data or anything, that
   *must* be provided somewhere in dist/install/ for installation
   on the host.

 * Tests may also support being run from the build tree, or from
   dist/install/ without copying into /usr/local.  They may require
   an environment variable to be set to find ancillary files, or
   perhaps look at their argv[0], or something.

 * The protocol document (basically, derived from this email) will
   live in xen.git (and might be shipped as
     dist/install/usr/local/lib/xen/autotests/README.md
   or something)

Future directions:

We think we may invent a new multiple-test API where the test program
can report the outcome of multiple tests.  That will have its own
directory in dist/install/usr/local/lib/xen/autotests/.

We may invent extensions which involve passing environent variables,
or command line arguments, to "simple" test programs.  The former will
be ignored by older test programs and the latter rejected.  The
precise details are beyond the scope of this mail.

Extension may also involve defining a meaning for the test's stdout.

Ian.

