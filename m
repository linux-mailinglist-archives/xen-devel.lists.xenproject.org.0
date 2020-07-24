Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A522CBFC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 19:22:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1P4-0005il-Gj; Fri, 24 Jul 2020 17:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulAu=BD=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jz1P3-0005eH-0m
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:22:37 +0000
X-Inumbo-ID: 3b8d8494-cdd2-11ea-8862-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b8d8494-cdd2-11ea-8862-bc764e2007e4;
 Fri, 24 Jul 2020 17:22:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jz1Om-00021j-W9; Fri, 24 Jul 2020 18:22:21 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 03/11] sg-report-host-history: Drop per-job debug etc.
Date: Fri, 24 Jul 2020 18:22:08 +0100
Message-Id: <20200724172216.28204-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
References: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This printing has a significant effect on the performance of this
program, at least after we optimise various other things.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 5dd875c1..8b409fc7 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -102,9 +102,9 @@ sub read_existing_logs ($) {
 	    my $k = $1;
 	    s{\%([0-9a-f]{2})}{ chr hex $1 }ge;
 	    $ch->{$k} = $_;
-	    print DEBUG "GOTCACHE $hostname $k\n";
+#	    print DEBUG "GOTCACHE $hostname $k\n";
 	}
-	print DEBUG "GOTCACHE $hostname \@ $jr->{flight} $jr->{job} $jr->{status},$jr->{name}\n";
+#	print DEBUG "GOTCACHE $hostname \@ $jr->{flight} $jr->{job} $jr->{status},$jr->{name}\n";
 	$tcache->{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}} = $jr;
     }
     close H;
@@ -272,7 +272,7 @@ END
     my @rows;
     my $cachehits = 0;
     foreach my $jr (@$inrows) {
-	print DEBUG "JOB $jr->{flight}.$jr->{job} ";
+	#print DEBUG "JOB $jr->{flight}.$jr->{job} ";
 
 	my $cacherow =
 	    $tcache->{$jr->{flight},$jr->{job},$jr->{status},$jr->{name}};
@@ -283,11 +283,11 @@ END
 
 	my $endedrow = jobquery($endedq, $jr, 'e');
 	if (!$endedrow) {
-	    print DEBUG "no-finished\n";
+	    #print DEBUG "no-finished\n";
 	    next;
 	}
-	print DEBUG join " ", map { $endedrow->{$_} } sort keys %$endedrow;
-	print DEBUG ".\n";
+	#print DEBUG join " ", map { $endedrow->{$_} } sort keys %$endedrow;
+	#print DEBUG ".\n";
 
 	push @rows, { %$jr, %$endedrow };
     }
@@ -329,7 +329,7 @@ END
 	    next;
 	}
 
-        print DEBUG "JR $jr->{flight}.$jr->{job}\n";
+        #print DEBUG "JR $jr->{flight}.$jr->{job}\n";
 	my $ir = jobquery($infoq, $jr, 'i');
 	my $ar = jobquery($allocdq, $jr, 'a');
 	my $ident = $jr->{name};
-- 
2.20.1


