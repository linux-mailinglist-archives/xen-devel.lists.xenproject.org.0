Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E92288BF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 21:07:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxbL-0004bd-CB; Tue, 21 Jul 2020 19:06:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxbK-0004aT-GG
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 19:06:54 +0000
X-Inumbo-ID: 55929932-cb85-11ea-85a6-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55929932-cb85-11ea-85a6-bc764e2007e4;
 Tue, 21 Jul 2020 19:06:51 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDa-0001u7-QU; Tue, 21 Jul 2020 19:42:22 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 13/14] duration_estimator: Move $uptincl_testid to
 separate @x_params
Date: Tue, 21 Jul 2020 19:42:04 +0100
Message-Id: <20200721184205.15232-14-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
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

This is going to be useful soon.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 8e8b3d33..621153ee 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1223,6 +1223,9 @@ END_ALWAYS
     return sub {
         my ($job, $hostidname, $onhost, $uptoincl_testid) = @_;
 
+	my @x_params;
+	push @x_params, $uptoincl_testid if $will_uptoincl_testid;
+
         my $dbg= $debug ? sub {
             $debug->("DUR $branch $blessing $job $hostidname $onhost @_");
         } : sub { };
@@ -1257,7 +1260,7 @@ END_ALWAYS
         my $duration_max= 0;
         foreach my $ref (@$refs) {
 	    my @d_d_args = ($ref->{flight}, $job);
-	    push @d_d_args, $uptoincl_testid if $will_uptoincl_testid;
+	    push @d_d_args, @x_params;
             $duration_duration_q->execute(@d_d_args);
             my ($duration) = $duration_duration_q->fetchrow_array();
             $duration_duration_q->finish();
-- 
2.20.1


