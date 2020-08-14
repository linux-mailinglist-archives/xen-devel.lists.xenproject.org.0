Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA6244D8F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTQ-000463-D8; Fri, 14 Aug 2020 17:26:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dSF-00024H-4s
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:25:23 +0000
X-Inumbo-ID: d27ef01e-6d63-4b80-af4d-bcf3d76fcf90
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d27ef01e-6d63-4b80-af4d-bcf3d76fcf90;
 Fri, 14 Aug 2020 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=KK2C5LTSWHXRXWbqc/OKGwTBW3Gmuf54SK1hkOQC7AY=;
 b=g02raETMvwmVIvNu6KnE3XwfEM5ByaxhqKLkD8qB6XNXG5poitQVkhpv
 rLDV6pwGXMEr+BpEBvP+oLtEFkTHQlTb8NDArqwmKZirilmxmxh9pL/4R
 q8OTeHnlU3z7+c7g8G7/sMlrN6i5ByKoiBQQQqldBcvFmjaccx7HMsLuD A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yMkTEtTkwa6Z7Zl0aTNzX97qii72UIAqi31sn8bj30x1CXvyvZJyQnGo3ygB0kQm23ueBsl2Ao
 X/HU9lATQLMrkbqxH2bQI1fGbKW8cZIujYo5+J7eFXbFXOU7YiF7cBpCtj7rjJJGdWE5gKJ1Yc
 SlU47uDFYStfbpZKjx/EQIqbAiSOzlqPstrxQ5b9Nb4d6cK5VLu4rjr9/l7hftTAmHST1piljH
 L9o/VlEtXUQFNWzNjl0VFXg2ayMTdEDO6vuTyfikLahoYg1R7mPmqpnWsd8jEBpRdaSffPiAk6
 J3Y=
X-SBRS: 2.7
X-MesageID: 24576924
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576924"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 52/60] sg-report-job-history: Cache the per-flight
 revisions
Date: Fri, 14 Aug 2020 18:21:57 +0100
Message-ID: <20200814172205.9624-53-ian.jackson@eu.citrix.com>
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

This involves changing %revisions to %$revisions in the code which
uses the value.

No logical change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 9f1216a6..39ebe024 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -172,25 +172,29 @@ END
 	    \%hosts;
 	});
 
-        my %revisions;
-        add_revisions(\%revisions, $f->{flight}, $f->{job}, '');
+	my $revisions = cacheable_fn($f, 'r', sub {
+            my %revisions;
+	    add_revisions(\%revisions, $f->{flight}, $f->{job}, '');
         
-        $buildsq->execute($f->{flight}, $f->{job});
-        while (my $bld= $buildsq->fetchrow_hashref()) {
-            my $bn= $bld->{name};
-            $bn =~ s/buildjob$//;
-            my ($oflight,$ojob) = flight_otherjob($f->{flight}, $bld->{val});
-            add_revisions(\%revisions, $oflight, $ojob, " ($bn)");
-        }
+	    $buildsq->execute($f->{flight}, $f->{job});
+	    while (my $bld= $buildsq->fetchrow_hashref()) {
+		my $bn= $bld->{name};
+		$bn =~ s/buildjob$//;
+		my ($oflight,$ojob) =
+		  flight_otherjob($f->{flight}, $bld->{val});
+		add_revisions(\%revisions, $oflight, $ojob, " ($bn)");
+	    }
+	    \%revisions;
+	});
         my @rev_cols;
-        foreach my $revk (sort keys %revisions) {
+        foreach my $revk (sort keys %$revisions) {
             my $col= $rev_grid_col{$revk};
             if (!defined $col) {
                 $col= @rev_grid_cols;
                 push @rev_grid_cols, $revk;
                 $rev_grid_col{$revk}= $col;
             }
-            $rev_cols[$col]= $revisions{$revk};
+            $rev_cols[$col]= $$revisions{$revk};
         }
         $ri->{Revisions}= \@rev_cols;
         $ri->{Flight}= $f;
-- 
2.11.0


