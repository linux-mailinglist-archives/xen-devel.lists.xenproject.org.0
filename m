Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF30244D7B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPl-0002V7-QX; Fri, 14 Aug 2020 17:22:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPj-00024H-VH
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:47 +0000
X-Inumbo-ID: a388a4ba-f6fb-4c3f-9179-ae9344d34a0c
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a388a4ba-f6fb-4c3f-9179-ae9344d34a0c;
 Fri, 14 Aug 2020 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=umud+b+GQgjYN5JC86L2XalvXk3tOUTGHSJ1av/HKnc=;
 b=gN2g7q0J32HeAtxLfWL86sJyN2dHKm0dnf4E21lExwZq0AsjC0cw/b3v
 hQefyQ7dvLReKl9T9mTKP0AQ+Qiw+Lhl0aPA8yf0vMpaCGW3stkAKy9bb
 /efBVmVKGcOkOptZfshdJ4Ae6f0nkvfiQIsEnRx+KrhSDsSXoWRPJ8WLD E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DfLho/TOm7Qfkx+V8vqWXMYGyKeeFomewX29ayXdO5LBqKUZYxkpYuVP7/NQiMaEvQdDiKk0Qi
 gr4rrujOCQF5PqUaiqJISlPIFS6scS5B7nbgA9gRO4smqg3ygMgXJPzRuGy/cAOfey+0Id4suD
 NCtnA0Q2n6k/wBWVVtzO8YN6spdxGVRWy9or4wV/ulMhnoROiqYKx7CTkYcElrgjdDiOe9im90
 5tLilPOwmcKDYGRcEw+wiEDmtiZCere0HyzW+toZ8I6MGAEJMLnqZUKOExOdSNHSqIexfPLNox
 HtE=
X-SBRS: 2.7
X-MesageID: 24545453
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24545453"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 16/60] history reporting (nfc): Record more
 row-specific stats
Date: Fri, 14 Aug 2020 18:21:21 +0100
Message-ID: <20200814172205.9624-17-ian.jackson@eu.citrix.com>
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

Prep work.  Nothing uses these yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 07e549a0..32cc883d 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -83,6 +83,10 @@ our %cache;
 our %q_count;
 our %q_misses;
 
+our $rows_previous = 0;
+our $rows_today = 0;
+our $rows_hit = 0;
+
 sub cache_set_key_cols { @cache_row_key_cols = @_; }
 
 sub cache_row_key ($) {
@@ -128,6 +132,7 @@ sub cache_read_previous ($) {
     }
     %cache = ();
     for (;;) {
+	$rows_previous++;
         $_ = <H> // last;
         next unless m{^\<\!-- osstest-report-reuseable (.*)--\>$};
 	my $jr = {};
@@ -151,6 +156,7 @@ sub cache_read_previous ($) {
 sub cache_row_lookup_prep ($) {
     my ($jrr) = @_;
 
+    $rows_today++;
     my $cacherow = $cache{cache_row_key($$jrr)};
     if ($cacherow) {
 	$$jrr = $cacherow;
@@ -313,7 +319,6 @@ END
     # The contents of $jr for each job is cached across runs.
 
     my @rows;
-    my $rows_hit = 0;
     foreach my $jr (@$inrows) {
 	#print DEBUG "JOB $jr->{flight}.$jr->{job} ";
 
-- 
2.11.0


