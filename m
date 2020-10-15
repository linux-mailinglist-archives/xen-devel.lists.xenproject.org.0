Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FBA28F62C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7520.19722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5Wf-0006aL-W1; Thu, 15 Oct 2020 15:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7520.19722; Thu, 15 Oct 2020 15:50:45 +0000
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
	id 1kT5Wf-0006Yy-QV; Thu, 15 Oct 2020 15:50:45 +0000
Received: by outflank-mailman (input) for mailman id 7520;
 Thu, 15 Oct 2020 15:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5We-0006GM-1H
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:44 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4208f03d-7c5c-4660-a429-de645d2d7303;
 Thu, 15 Oct 2020 15:50:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WQ-00088E-7q
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WQ-0005Gg-6t
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WO-0000oB-Gu; Thu, 15 Oct 2020 16:50:28 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5We-0006GM-1H
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:44 +0000
X-Inumbo-ID: 4208f03d-7c5c-4660-a429-de645d2d7303
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4208f03d-7c5c-4660-a429-de645d2d7303;
	Thu, 15 Oct 2020 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=gfMUQl6jqji00/zUqCTGBQAbnUbgIuHTcubMdohdrgs=; b=xwf0V06ExMj7gdaT7ohYraVscw
	Y6PoRK4crIguLGtGiO4j13aC03h3Pg/hckM43upCinIYFy/GXS6kK34FHpvdOL/85cNzzpt/ODbEl
	9Op/eRjF8ShNMQ1np7pq4VkhMf7vXxDMyPPEwL2XgFEOfo2r5ZFUUL9KpBNqzQ939HMY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WQ-00088E-7q
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WQ-0005Gg-6t
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:30 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-0000oB-Gu; Thu, 15 Oct 2020 16:50:28 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 08/17] sg-report-flight: Break out printout_flightheader
Date: Thu, 15 Oct 2020 16:50:10 +0100
Message-Id: <20201015155019.20705-9-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 15631001..2ab1637f 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -783,6 +783,14 @@ sub includes ($) {
     }
 }    
 
+sub printout_flightheader ($) {
+    my ($r) = @_;
+    bodyprint <<END;
+flight $r->{Flight} $branch $r->{FlightInfo}{blessing} [$r->{FlightInfo}{intended}]
+$c{ReportHtmlPubBaseUrl}/$r->{Flight}/
+END
+}
+
 sub printout {
     my ($r, @failures) = @_;
     $header_text = '';
@@ -793,10 +801,9 @@ sub printout {
 $r->{Flight}: $r->{OutcomeSummary}
 END
     includes(\@includebeginfiles);
-    bodyprint <<END;
-flight $r->{Flight} $branch $r->{FlightInfo}{blessing} [$r->{FlightInfo}{intended}]
-$c{ReportHtmlPubBaseUrl}/$r->{Flight}/
-END
+
+    printout_flightheader($r);
+
     if (defined $r->{Overall}) {
         bodyprint "\n";
         bodyprint $r->{Overall};
-- 
2.20.1


