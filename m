Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A42437AB4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 18:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215161.374177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBG-0007O4-Mt; Fri, 22 Oct 2021 16:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215161.374177; Fri, 22 Oct 2021 16:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBG-0007MG-J5; Fri, 22 Oct 2021 16:14:06 +0000
Received: by outflank-mailman (input) for mailman id 215161;
 Fri, 22 Oct 2021 16:14:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0007Lg-Fl
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0008IX-DA
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0005pI-By
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mdxBB-00021I-JM; Fri, 22 Oct 2021 17:14:01 +0100
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=MpBM4NNo27O2JFBnUtVOspBYEzKTZIT0qgH+kItMoMo=; b=eT3AP6DivVo5De7p3T7Lkq/2+X
	qd/FfqnGtckDzYL9qUZ2BkB3GJURJcwudRZCS236XaLjz0f30iKysR2vfaU7DdXI0oV0irJOE9yYF
	O4NIiJuyQ50maGZ1PbvA3Rj+BcqXhOeucKYAs8MjcfCEhszLCkmVyqP9lXaPMZGbUH74=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [OSSTEST PATCH 0/5] Only run ts-memdisk-try-append on BIOS hosts
Date: Fri, 22 Oct 2021 17:13:46 +0100
Message-Id: <20211022161351.23091-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is an infelicity in handling of FreeBSD's "memdisk" test.

The use of this step is as part of host examination.  There, it may
fail on hosts which cannot cope with the FreeBSD version in use.  That
is OK (from a general osstest/CI POV) because each host has its own
job name and therefore its own regression tracking.  So this test
failing on those hosts is not troublesome.

But as part of the tests for osstest itself, and Xen and Linux, we
also check that host examination still works.  This is appropriate
because host examination also checks that we can retrieve accurate
serial logs, etc.

To this end many general flights have test-*-examine jobs.

Like any job, these are peripatetic.  The x86 ones might run on BIOS
hosts, or UEFI hosts.  But our support for FreeBSD does not cope with
UEFI yet.  The result is that whether this test passes or fails
depends on the host, but this is not a heisenbug which should be fixed
right away.

Sort this out as follows:

* Have the examine test only run the FreeBSD step when the host
  firmware is BIOS.  On non-FreeBSD hosts the test step will go from
  "fail" to "skip", which is appropriate.

* To make sure we catch actual regressions in this step, make a copy
  of the examine job which is always run on a BIOS host.

* While we are here, explicitly check that the examine job works on
  x86 UEFI too.


4.16 release implications:

There are two sets of changes here:

I. flight composition:

The runvar dump shows that this only adds new jobs.  I think these new
tests are good, but of course they might be broken somehow.  If they
are broken, they are new jobs which won't count as regressions, and if
they flap we can force push while we disable them again.

II. behavioural change to ts-memdisk-try-append

This change is *intended* to make the test "skip" in cases where it is
currently "fail".  I have done an ad-hoc check that this seems to DTRT
but it might be bad somehow.

However, this test is currently actually-failing on the xen-unstable
branch.  And it could be force pushed if necessary.

III. Benefits

The benefit of all this is to improve the testing for 4.16.  In
particular, the examine test ought now to run properly, and no longer
cause blockages.

I think at this stage of the release this change to osstest ought to
have a release-ack but I think I have convinced myself it's OK, so:
Release-Acked-By: Ian Jackson <iwj@xenproject.org>


Ian Jackson (5):
  make-flight: do_examine_one: add firmware argument
  ts-memdisk-try-append: Reindent (nfc)
  ts-memdisk-try-append: Enable perl warnings
  ts-memdisk-try-append: More defensive case test
  examination: skip memdisk on non-BIOS hosts, run on some BIOS hosts

 make-flight           | 23 ++++++++++++++++++++--
 mfi-common            |  1 +
 ts-memdisk-try-append | 45 +++++++++++++++++++++++++++++--------------
 3 files changed, 53 insertions(+), 16 deletions(-)

-- 
2.20.1


