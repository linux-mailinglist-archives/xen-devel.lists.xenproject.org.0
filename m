Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C931EE4B6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:45:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpF8-0005W0-Ua; Thu, 04 Jun 2020 12:45:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcT=7R=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jgpF7-0005Vi-E5
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:45:09 +0000
X-Inumbo-ID: 36fed506-a661-11ea-81bc-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36fed506-a661-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 12:45:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jgpF2-0006vr-U6; Thu, 04 Jun 2020 13:45:05 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 2/4] cs-bisection-step: need_repro: Provision for
 $xinfo
Date: Thu,  4 Jun 2020 13:44:57 +0100
Message-Id: <20200604124459.18453-3-ian.jackson@eu.citrix.com>
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

This becomes part of the message but right now it is juse "".

So no functional change yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 35085e89..90e0601a 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -828,6 +828,7 @@ sub need_repro ($$$) {
     return 1 if conflicted_warning($n, $what);
 
     my $fl= $n->{Flights} || [];
+    my $xinfo='';
     foreach my $f (sort { $a->{Flight} <=> $b->{Flight} } @$fl) {
         next unless $f->{Flight} > $repro_lastflight;
 	if ($f->{Result} ne $st) {
@@ -837,7 +838,7 @@ sub need_repro ($$$) {
 	}
         print STDERR " ".
             ($repro_count ? "Repro" : "Result").
-            " found: flight $f->{Flight} ($st), for $what\n";
+            " found: flight $f->{Flight} ($st), for $what$xinfo\n";
         $repro_lastflight= $f->{Flight};
         $repro_firstflight ||= $f->{Flight};
         return 0;
-- 
2.20.1


