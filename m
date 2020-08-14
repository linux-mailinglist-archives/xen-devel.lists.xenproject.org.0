Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB0244D79
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPd-0002KT-0M; Fri, 14 Aug 2020 17:22:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPb-00024Q-FV
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:39 +0000
X-Inumbo-ID: 9ad93cbc-9ce4-49b5-8aee-e6cf3bc17b08
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ad93cbc-9ce4-49b5-8aee-e6cf3bc17b08;
 Fri, 14 Aug 2020 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ss5D/qaRmFTGSDiYRg9YFPjsfIqGXfS+GnKQIZiycbg=;
 b=NT7a8dJ62rE3kVYNyhByNSckCSwfoQNMxwZqyc0I6BrJ4C2n9i0dGRm6
 6dbMl/AYiDnii4dYt7LAwlv+evGFqQ3ZV684s6teR/9s/JE1nGU7WlfUl
 GFpz7FzK0tIEh6nk74Fupci2aWfe78not4hYj/3Ikm6GFDe7w8WenbZY/ Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YROxpqmpJnw+hqp3Viw9ketkdbRBZUlJk2QHsBCtgt++Wq0+86m8LUPrRx6JoHJoDcXgaVZcV3
 yRR24GZIeL6spqBiCIh86SY80w+orkcRLa2RsmPYNNAjaVoLJc50qx5VSBrEHMeOKhyU1yWA+I
 lNJVQUeCcdX4YvIK43+iTLu1oQkH32yrElpH+ZC4JPI0zr+vKp3enUwrMbi3xanjd6Z54HcJG+
 UUmqtlT8DoyNysOTvgsk1j9wzMx5MtznEIr4lw1JqwDg9mZ+9KsZ3HtDdLZlf4oUVl0lEXW7Qi
 Hyc=
X-SBRS: 2.7
X-MesageID: 24879737
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879737"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 33/60] sg-report-job-history: Use fork-based
 parallelism
Date: Fri, 14 Aug 2020 18:21:38 +0100
Message-ID: <20200814172205.9624-34-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For now, one child per job (for all branches).  This is already a
speedup.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 424053f1..384a7670 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -26,11 +26,13 @@ use IO::Handle;
 use HTML::Entities;
 
 use Osstest::Executive;
+use Osstest::HistoryReport;
 
 our (@blessings,@branches);
 our $limit= 100;
 our $htmlout;
 our $flight;
+our $maxjobs=10;
 our $job;
 
 open DEBUG, ">/dev/null";
@@ -38,7 +40,7 @@ open DEBUG, ">/dev/null";
 while (@ARGV && $ARGV[0] =~ m/^-/) {
     $_= shift @ARGV;
     last if m/^--?$/;
-    if (m/^--(job|flight)\=(.*)$/) {
+    if (m/^--(job|flight|maxjobs)\=(.*)$/) {
         $$1= $2;
     } elsif (m/^--(limit)\=([1-9]\d*)$/) {
         $$1= $2;
@@ -300,6 +302,9 @@ sub processjob ($) {
     processjobbranch($j,$_) foreach @branches;
 }
 
-db_begin_work($dbh_tests, []);
-db_readonly_report();
-foreach my $j (@jobs) { processjob($j); }
+parallel_by_fork('sg-report-job-history', $maxjobs, \@jobs, sub {
+    my ($j) = @_;
+    db_retry($dbh_tests, [], sub {
+        processjob($j);
+    });
+});
-- 
2.11.0


