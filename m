Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01844244DA7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTt-00053q-Hi; Fri, 14 Aug 2020 17:27:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRR-00024H-36
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:33 +0000
X-Inumbo-ID: 1a689d73-2d84-4814-9b5c-03cf1c59b582
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a689d73-2d84-4814-9b5c-03cf1c59b582;
 Fri, 14 Aug 2020 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=vk1erg2EhIozZ671QuB2WFTSrxHDQXDO2TUsLVUzIrA=;
 b=VYkpXh6qyq/3nOnPnhqHd5XrTOxc09fxGuTuAbwZYbp05i40Vzu765Cf
 yv0MeqW0O1UZqw4oE80JcCsFwG97mkrNKAUjzmyFMnK63zDj2u2AHSP/E
 1QWF4ukj42v3HLQmiR/ZSV5qVoYs33TkDbIAgtS54ocL8p5Bew923soeU o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2GK7l3G/uOcKXbY4SjRQWQUlQEzoo5dZmdQlsaPFIRd6/Bs+9n55B0Vghq5A0xGQtUfKni4ICU
 +5qZt2lVKqGkOPDCXSNi1JSmSP74g64HGAmdZBJsyBSPgHzfpv+97ea9FKR6uNd3KPsY7qbpah
 YxR9GumtmQbVyhm4RVuTe1YGNXeU2YCtSQ5dR6efxtAteefE5L8ygiEcm8YAYPjijw9RGgi/s6
 38kto9Jv2O2LiOnVD2QR7G5cvLGQSd3pa5LvemQ4jabUThiukgOzTlOvbDAru1PCzlvnrecGKb
 Ma0=
X-SBRS: 2.7
X-MesageID: 24545479
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24545479"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 59/60] sg-report-job-history: Provide --time-limit
Date: Fri, 14 Aug 2020 18:22:04 +0100
Message-ID: <20200814172205.9624-60-ian.jackson@eu.citrix.com>
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

Calculate a minflight based on the time limit, and set the time limit
to a year ago by default.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sg-report-job-history b/sg-report-job-history
index 5d2a7e15..e09c694f 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -30,6 +30,7 @@ use Osstest::HistoryReport;
 
 our (@blessings,@branches);
 our $limit= 100;
+our $timelimit= 86400 * (366 + 14);
 our $htmlout = '.';
 our $flight;
 our $maxjobs=10;
@@ -44,6 +45,8 @@ while (@ARGV && $ARGV[0] =~ m/^-/) {
         $$1= $2;
     } elsif (m/^--(limit)\=([1-9]\d*)$/) {
         $$1= $2;
+    } elsif (m/^--time-limit\=([1-9]\d*)$/) {
+        $timelimit= $1;
     } elsif (restrictflight_arg($_)) {
 	# Handled by Executive
     } elsif (m/^--html-dir=(.*)$/) {
@@ -67,6 +70,9 @@ csreadconfig();
 
 our @jobs;
 
+our $minflight = minflight_by_time($timelimit);
+print DEBUG "MINFLIGHT $minflight\n";
+
 sub findflight () {
     my $branches= $dbh_tests->selectcol_arrayref(<<END, {}, $flight);
         SELECT branch FROM flights WHERE flight=?
@@ -144,6 +150,7 @@ END
         SELECT * 
           FROM jobs JOIN flights USING (flight)
          WHERE ($cond)
+           AND flight > $minflight
       ORDER BY flight DESC
          LIMIT $limit
 END
-- 
2.11.0


