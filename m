Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49171EE4B5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:45:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpFD-0005XU-6y; Thu, 04 Jun 2020 12:45:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcT=7R=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jgpFC-0005XL-C0
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:45:14 +0000
X-Inumbo-ID: 371a3fa8-a661-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 371a3fa8-a661-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 12:45:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jgpF3-0006vr-5i; Thu, 04 Jun 2020 13:45:05 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 3/4] cs-bisection-step: need_repro: Support
 $consider_parents
Date: Thu,  4 Jun 2020 13:44:58 +0100
Message-Id: <20200604124459.18453-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
References: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
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

This flag tells need_repro to look at parent commits of the indicated
rtuple node, as well as the node itself.  We walk up the tree.  If
there are multiple parents, we stop; likewise if we find any rtuple
which doesn't have the expected results.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 90e0601a..bc6fb794 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -822,13 +822,31 @@ sub need_repro_sequence ($$) {
     }
 }
 
-sub need_repro ($$$) {
-    my ($st, $n, $what) = @_;
+sub need_repro ($$$;$) {
+    my ($st, $n, $what, $consider_parents) = @_;
 
     return 1 if conflicted_warning($n, $what);
 
     my $fl= $n->{Flights} || [];
     my $xinfo='';
+    if ($consider_parents) {
+        $fl = [ @$fl ];
+	my $nloop = $n;
+	my $iters = 0;
+	for (;;) {
+	    last unless @{ $nloop->{Parents} } == 1;
+	    $nloop = $nloop->{Parents}[0];
+	    $iters++;
+	    $xinfo = " (at ancestor ~$iters)";
+	    my @others = grep { $_->{Result} ne $st } @{ $nloop->{Flights} };
+	    if (@others) {
+	        print STDERR
+ " For $what, parent search stopping at $nloop->{Rtuple}, results @others";
+	    }
+	    push @$fl, @{ $nloop->{Flights} };
+	}
+    }
+
     foreach my $f (sort { $a->{Flight} <=> $b->{Flight} } @$fl) {
         next unless $f->{Flight} > $repro_lastflight;
 	if ($f->{Result} ne $st) {
-- 
2.20.1


