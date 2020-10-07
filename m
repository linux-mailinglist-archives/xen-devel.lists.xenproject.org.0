Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A82866F3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3691.10871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9l-00028T-4m; Wed, 07 Oct 2020 18:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3691.10871; Wed, 07 Oct 2020 18:27:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9k-00025O-Pk; Wed, 07 Oct 2020 18:27:16 +0000
Received: by outflank-mailman (input) for mailman id 3691;
 Wed, 07 Oct 2020 18:27:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2q-00072Q-Iy
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:08 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b6a0a65-23e5-4aea-a941-1dd37c7d206f;
 Wed, 07 Oct 2020 18:19:32 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkE-0007CF-6h; Wed, 07 Oct 2020 19:00:54 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2q-00072Q-Iy
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:08 +0000
X-Inumbo-ID: 1b6a0a65-23e5-4aea-a941-1dd37c7d206f
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1b6a0a65-23e5-4aea-a941-1dd37c7d206f;
	Wed, 07 Oct 2020 18:19:32 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkE-0007CF-6h; Wed, 07 Oct 2020 19:00:54 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 82/82] sg-report-flight: Word-wrapping improvements to job and step names
Date: Wed,  7 Oct 2020 19:00:24 +0100
Message-Id: <20201007180024.7932-83-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use <wbr>.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 33f953ca..a07e03cb 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1185,6 +1185,15 @@ sub nullcols {
     join ", ", map { m/::/ ? "NULL::$' as $`" : "NULL as $_" } @_;
 }
 
+sub encode_with_wbrs ($) {
+    my ($s) = @_;
+    my $re = qr{[-/]};
+    join '', map {
+	my $b = s{^$re}{} ? ('<wbr>'. $& . '&#8288;') : '';
+	$b.encode_entities($_);
+    } split m{(?=$re)}, $s;
+}
+
 sub htmloutjob ($$) {
     my ($fi,$job) = @_;
     return unless defined $htmldir;
@@ -1666,11 +1675,9 @@ END
     print H "</th>\n";
 
     foreach my $col (@cols) {
-        my $th= $col;
-        $th =~ s/\-/ $&/g;
         print H "<th>";
         print H "<a href=\"".encode_entities($col)."/$htmlleaf\">";
-        print H encode_entities($th);
+        print H encode_with_wbrs($col);
         print H "</a>";
         print H "</th>";
     }
@@ -1726,7 +1733,8 @@ END
 	    next if $this[1] == $worst[1] && $ei->{Step}{status} ne 'pass';
 	    @worst=@this;
 	    push @worst,
-	        encode_entities("$ei->{Step}{stepno}. $ei->{Step}{testid}");
+	      encode_entities("$ei->{Step}{stepno}. ").
+	      encode_with_wbrs($ei->{Step}{testid});
 	}
 	push @worstrow1, "<td ",$worst[2],">",$worst[3],"</td>";
 	push @worstrow2, "<td ",$worst[2],">",$worst[0],"</td>";
-- 
2.20.1


