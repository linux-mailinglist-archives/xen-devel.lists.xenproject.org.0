Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AB228F66A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7542.19776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5oQ-0000Wz-5n; Thu, 15 Oct 2020 16:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7542.19776; Thu, 15 Oct 2020 16:09:06 +0000
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
	id 1kT5oQ-0000Wa-2Y; Thu, 15 Oct 2020 16:09:06 +0000
Received: by outflank-mailman (input) for mailman id 7542;
 Thu, 15 Oct 2020 16:09:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5oO-0000WV-TC
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef44b822-9280-4aa4-b6a7-5da67909f9d1;
 Thu, 15 Oct 2020 16:08:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oI-0000fe-RS
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:08:58 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oI-0006Zr-Ps
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:08:58 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WO-0000oB-W5; Thu, 15 Oct 2020 16:50:29 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5oO-0000WV-TC
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:04 +0000
X-Inumbo-ID: ef44b822-9280-4aa4-b6a7-5da67909f9d1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ef44b822-9280-4aa4-b6a7-5da67909f9d1;
	Thu, 15 Oct 2020 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=t3Vg9e/VRpm4vV8Mm3UCVRG1em/CaV0bxhpLQJqI3XA=; b=Ryfx2r6NB3s0ZO7bDJi7fVXYpv
	Dv5FiWdwIwi3MbiRkYVpbJp/GTCabTK8pWmHnxKPPWJN2LYJt68ow2zmDFQxszBRyZ8HqjI5xNg6X
	880i8MmDNPaTF54b4r2VuZS0RBl4EbnqaH95twQfHXcGOmlgNxOwCpWkkxfT/u78mS1o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oI-0000fe-RS
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:08:58 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oI-0006Zr-Ps
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:08:58 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-0000oB-W5; Thu, 15 Oct 2020 16:50:29 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 10/17] sg-report-flight: Nicer output for --refer-to-flight option
Date: Thu, 15 Oct 2020 16:50:12 +0100
Message-Id: <20201015155019.20705-11-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the flight summary lines together, before the URLs.  This makes
it considerably easier to read.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index bcd896a8..cbd39599 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -796,12 +796,17 @@ sub includes ($) {
     }
 }    
 
-sub printout_flightheader ($) {
-    my ($r) = @_;
-    bodyprint <<END;
+sub printout_flightheaders {
+    foreach my $r (@_) {
+	bodyprint <<END;
 flight $r->{Flight} $branch $r->{FlightInfo}{blessing} [$r->{FlightInfo}{intended}]
+END
+    }
+    foreach my $r (@_) {
+	bodyprint <<END;
 $c{ReportHtmlPubBaseUrl}/$r->{Flight}/
 END
+    }
 }
 
 sub printout {
@@ -814,12 +819,7 @@ sub printout {
 $r->{Flight}: $r->{OutcomeSummary}
 END
     includes(\@includebeginfiles);
-
-    printout_flightheader($r);
-
-    foreach my $ref_r (@refer_to_flights) {
-	printout_flightheader($ref_r);
-    }
+    printout_flightheaders $r, @refer_to_flights;
 
     if (defined $r->{Overall}) {
         bodyprint "\n";
-- 
2.20.1


