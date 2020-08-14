Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A66244D80
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPw-0002jW-Jc; Fri, 14 Aug 2020 17:23:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPv-00024Q-GG
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:59 +0000
X-Inumbo-ID: 252a8173-d90c-4431-960b-bc72e22bcc23
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 252a8173-d90c-4431-960b-bc72e22bcc23;
 Fri, 14 Aug 2020 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rk4K15u28Nj+M4CrVc/t4g31Ehc9MfDdyP/m7plabjo=;
 b=gOZomQpBfGEYLR6lsBvIHwsVTKup4AH5osxza0ZDgV6AWqKqu/3J3IX1
 Dn8PEn+gYrzDjSMy83US7WrqtcTK4CUrSddKpS4Nt5PjLezJ2zSYLocJQ
 EwsV3a6xq0ZSZ1s7iqz14P+r4HM8OrR7OdfSU9/rNQYktREBqvnfnfKFI 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 57fGnd9QyUDalP3QxlumkonaepdRwz5uQcg/r75btipjpiouLVGxOdsUJRVO7f75Ub7Se1bMlf
 2pY4pQRgnBIn8X8DMydzXZYxaNF826KG2gVX7nJiGvO5K4oN1d/phLmrG5VCgF7sNjjUeoD+4i
 OhtYmFOuvawtIO+PU09jl4Itj1YuSVQlbNH/rfZ8lHOD2qsQhiEAxLO0dFJCty3Larnog28fYY
 xXw/DY8yDJmQo4xAFsKGspP89Zke4SESow4M9lYz5njnauhZB2l8eyRuy27udDrfa4HaVySD9z
 Prg=
X-SBRS: 2.7
X-MesageID: 24879740
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879740"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 40/60] sg-report-job-history: Refactor "ALL" handling
Date: Fri, 14 Aug 2020 18:21:45 +0100
Message-ID: <20200814172205.9624-41-ian.jackson@eu.citrix.com>
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

* Make an explicit entry ALL in @branches, rather than implicitly
  processing ALL as well.

* Consequently, put explicit ALL entries in @tasks too, rather than
  putting in entries without a branch name.

* Pass ALL to processjobbranch rather than undef, and turn it into
  the internally-used undef at the start.

When used with --flight (findflight), this has no functional change.
When used with --job, ALL must now be included in the branch
list passed to --branches.  The only in-tree call is with --flight.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 3b45992f..8932458e 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -72,7 +72,7 @@ sub findflight () {
         SELECT branch FROM flights WHERE flight=?
 END
     die "$flight ? @$branches ?" if @$branches!=1;
-    @branches= @$branches;
+    @branches= ('ALL', @$branches);
 
     my $selectq= db_prepare(<<END);
         SELECT job FROM jobs WHERE flight=? ORDER BY JOB
@@ -110,7 +110,10 @@ END
 }
 
 sub processjobbranch ($$$) {
-    my ($j,$bra,$html_file) = @_;
+    my ($j,$branch_or_all,$html_file) = @_;
+
+    my $bra = $branch_or_all;
+    undef $bra if $bra eq 'ALL';
 
     my $buildsq= db_prepare(<<END);
         SELECT * FROM runvars
@@ -294,14 +297,13 @@ END
 
 my @tasks;
 foreach my $j (@jobs) {
-    push @tasks, $j;
     push @tasks, "$j $_" foreach @branches;
 }
 
 parallel_by_fork('sg-report-job-history', $maxjobs, \@tasks, sub {
     my ($task) = @_;
     my ($job, $branch) = split / /, $task; # $branch might be undef
-    my $html_file = sprintf "history/%s/%s.html", $job, ($branch // 'ALL');
+    my $html_file = sprintf "history/%s/%s.html", $job, $branch;
     db_retry($dbh_tests, [], sub {
         processjobbranch($job, $branch, $html_file);
     });
-- 
2.11.0


