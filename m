Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA41EA42C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 14:45:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfjoC-0002fY-91; Mon, 01 Jun 2020 12:44:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Um2E=7O=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jfjoB-0002fM-4r
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 12:44:51 +0000
X-Inumbo-ID: a606e636-a405-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a606e636-a405-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 12:44:36 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jfjnv-0006zf-7q; Mon, 01 Jun 2020 13:44:35 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 4/4] cs-bisection-step: Do not insist on urls in main
 history search
Date: Mon,  1 Jun 2020 13:44:30 +0100
Message-Id: <20200601124430.29761-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601124430.29761-1-ian.jackson@eu.citrix.com>
References: <20200601124430.29761-1-ian.jackson@eu.citrix.com>
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

If a Xen build fails, but we are trying to bisect something involving
libvirt, the libvirt job does not really run.  It does not populate
the tree_<tree> values for its git submodules - that would involve
actually booking out a host and cloning it.

The effect is that xen build failures which occur somewhere in the
range of a libvirt bisection cause total failure (actually, looping
bisection) rather than treating the build failure as `blocked'.

Fix this by tolerating trees with missing urls - but only during the
main history search.  Most of the rest of the time we need the urls,
mainly because we are going to feed them to adhoc-revtuple-generator
and mention them in our output.

It could now happen that trees appear in the main bisection history
which weren't in our bases.  These end up being ignored by
flight_rtuple.  This is not ideal but it will do for now.  In any case
that aspect is no worse than before.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 2f75313e..478baa5b 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -179,9 +179,8 @@ sub relevant_hosts ($) {
 END
 }
 
-sub flight_rmap ($) {
-    my ($flight) = @_;
-    my $need_urls = 1;
+sub flight_rmap ($$) {
+    my ($flight, $need_urls) = @_;
 
     $dbh_tests->do(<<END, {});
           CREATE TEMP TABLE tmp_build_info (
@@ -322,7 +321,7 @@ END
 
 sub flight_rtuple ($) {
     my ($flight) = @_;
-    my $map= flight_rmap($flight);
+    my $map= flight_rmap($flight,0);
     return () if !defined $map;
     my @revisions= ();
     die unless @treeinfos;
@@ -396,12 +395,12 @@ END
 
         print STDERR " [$failhosts] ";
 
-	my $failrmap = flight_rmap($tryfail->{flight});
+	my $failrmap = flight_rmap($tryfail->{flight},1);
 	next unless $failrmap;
 
 	my $checkbasisvcs = sub {
 	    my ($trybasisflight) = @_;
-	    my $basisrmap = flight_rmap($trybasisflight);
+	    my $basisrmap = flight_rmap($trybasisflight,1);
 	    my @bad;
 #print STDERR Dumper($failrmap, $basisrmap);
 	    foreach my $tree (keys %$failrmap) {
@@ -480,8 +479,8 @@ END
 our (%nodes, @latest_rtuple, @basispass_rtuple);
 
 sub digraph_whole () {
-    my $latest_rmap= flight_rmap($latest_flight);
-    my $basispass_rmap= flight_rmap($basispass_flight);
+    my $latest_rmap= flight_rmap($latest_flight,1);
+    my $basispass_rmap= flight_rmap($basispass_flight,1);
     if (!defined $basispass_rmap) {
 	die "Basis pass $basispass_flight rmap indeterminate/wrong\n";
     }
-- 
2.20.1


