Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890473007E7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72903.131454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynJ-0004j2-GT; Fri, 22 Jan 2021 15:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72903.131454; Fri, 22 Jan 2021 15:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynI-0004gS-Vj; Fri, 22 Jan 2021 15:56:16 +0000
Received: by outflank-mailman (input) for mailman id 72903;
 Fri, 22 Jan 2021 15:56:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynG-0004br-2j
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynG-0002Ob-1s
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynG-0000SN-0s
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynE-0004Ar-A8; Fri, 22 Jan 2021 15:56:12 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Osxwv6TTrw4qA6JUSNzB0731pq0mWQGw3JpKLz3zbug=; b=DcTO6ijwTkiRFjISONoV7QY3MZ
	xVwFLntgb+X7NXlokxqGtM3h1aBy0cH1UjhxDEsMWIkI/b/Pk4FjTpmSzNZtuJmXJIrnLWmj6VOv7
	tM116srHK6Su/Hla5r2vH6Aj/u4M6TXb/pPRgR/wM77fn2AoT0zlk3H9W3Qw5AiiwZwo=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
Date: Fri, 22 Jan 2021 15:56:03 +0000
Message-Id: <20210122155603.23402-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously, we let the Xen build system and startup scripts choose
which xenstored to use.  Before we upgraded to Debian buster, that
gave us C xentored tests on ARM.  Since then, armhf and arm64 have
both had enough ocaml support and we haven't been testing C xenstored
at all !

Change this, by selecting between C xenstored and Ocaml xenstored
"at random".  Actually, this is based on the job name.  So the same
job in different branches will use the same xenstored - which helps
avoid confusion.

I have diffed the output of standalone-generate-dump-flight-runvars.
As expected, this addes a variable all_host_xenstored to every job.

To make sure we have enough diversity, I eyeballed the results.  In
particular:
  * The smoke tests now have 2 C and 2 Ocaml, one of each on
    ARM and x86.
  * XTF tests have 2 oxenstored and 3 C xenstored.
  * The ovmf flight has one of each
  * The seabios and libvirt flights look reasonably mixed.

Most other flights have enough jobs that I think things are diverse
enough without looking at them all in detail.

I think this lack of testing needs fixing for the Xen 4.15 release.
So after review I intend to push this to osstest pretest, and may
force push it even if shows regressions.

CC: Edwin Török <edvin.torok@citrix.com>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Jürgen Groß <jgross@suse.com>
CC: Wei Liu <wl@xen.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 mfi-common | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mfi-common b/mfi-common
index 35efd233..2834411f 100644
--- a/mfi-common
+++ b/mfi-common
@@ -509,6 +509,13 @@ job_create_test () {
   xenbuildjob="${bfi}build-$xenarch$xsm_suffix"
   buildjob="${bfi}build-$dom0arch$xsm_suffix"
 
+  local xenstored="$xenstored"
+  if [ "$xenstored" = "" ]; then
+    stripy_rand "$job 2" xenstored  xenstored oxenstored
+    # Without " <n>", all XTF jobs use oxenstored
+    # With " 1", All OVMF tests use xenstored
+  fi
+
   job_create_test_filter_callback \
     "$job" "$recipe" "$toolstack" "$xenarch" "$dom0arch" "$@" || return 0
 
@@ -529,7 +536,8 @@ job_create_test () {
 
   ./cs-job-create $flight $job $recipe toolstack=$toolstack       \
     $RUNVARS $TEST_RUNVARS $global_runvars $most_runvars          \
-    xenbuildjob=$xenbuildjob buildjob=$buildjob $tsbuildjob "$@"
+    xenbuildjob=$xenbuildjob buildjob=$buildjob                   \
+    all_host_xenstored=$xenstored $tsbuildjob "$@"
 }
 
 usual_debianhvm_image () {
-- 
2.20.1


