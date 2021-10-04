Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B74214CE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 19:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201613.356223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQg-0003Ki-LY; Mon, 04 Oct 2021 17:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201613.356223; Mon, 04 Oct 2021 17:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQg-0003F4-Fe; Mon, 04 Oct 2021 17:07:06 +0000
Received: by outflank-mailman (input) for mailman id 201613;
 Mon, 04 Oct 2021 17:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0002ou-Bk
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0000LJ-B0
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0005gu-9K
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mXRQc-0006NI-Im; Mon, 04 Oct 2021 18:07:02 +0100
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=geBFP+eayjby41kJSRPRW6i6OwZW9KlE+w5lSJk+b68=; b=twBiiETLQhqLhZ4ZUz/WVoojVP
	H1BM9XhLmhZEVRjSvzqXgJGEHEwEry12d5bAQybZcEsMXNNaHqDI+DQFcZCRlc+u/6kNEwnJPmj7g
	OtAlMKN7/Z3AokUs2GCoHEmZCVEQskJ6tIZDYajHmVi+5k2qZQk6Ws4iICMqR4cya8gw=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/6] mg-allocate: Add --dry-run mode
Date: Mon,  4 Oct 2021 18:06:52 +0100
Message-Id: <20211004170654.21864-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211004170654.21864-1-iwj@xenproject.org>
References: <20211004170654.21864-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-allocate | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mg-allocate b/mg-allocate
index 8eca59e2c..7dc2c7650 100755
--- a/mg-allocate
+++ b/mg-allocate
@@ -26,6 +26,8 @@
 #   -U             allocate with high priority (makes sense with
 #                  specified duration only)
 #
+#   --dry-run      Do not actually allocate, just check feasibility.
+#
 #   --as <task-spec>
 #                  Run as the task <task-spec> (rather than looking
 #                  at OSSTEST_TASK).  Allocation will allocate
@@ -93,6 +95,7 @@ $|=1;
 
 our $tid;
 our %magictask;
+our $dry_run;
 our $list_only;
 our $donate_spec;
 our $donate_taskid;
@@ -536,6 +539,8 @@ while (@ARGV && $ARGV[0] =~ m/^[-0-9]/) {
         } elsif (s/^\-l/-/ || s/^--list$/--/) {
 	    $list_only++;
 	    die "-l may be repeated only thrice\n" if $list_only > 3;
+        } elsif (s/^--dry-run$/-/) {
+	    $dry_run= 1;
         } elsif (s/^--as$/-/) {
 	    die "--as needs task\n" unless @ARGV;
 	    $ENV{OSSTEST_TASK} = shift @ARGV;
@@ -653,7 +658,9 @@ sub precheck () {
     execute(1);
 }
 
-if ($duration) {
+if ($dry_run) {
+    precheck();
+} elsif ($duration) {
     die "--donate and --steal are incompatible with the planning system\n"
         if @steal_specs || defined $donate_spec;
     precheck();
-- 
2.20.1


