Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EDE296303
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10571.28205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdin-00080v-Ao; Thu, 22 Oct 2020 16:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10571.28205; Thu, 22 Oct 2020 16:45:49 +0000
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
	id 1kVdin-000808-4h; Thu, 22 Oct 2020 16:45:49 +0000
Received: by outflank-mailman (input) for mailman id 10571;
 Thu, 22 Oct 2020 16:45:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdil-0007J4-Gg
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:47 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3e2e9d0-401e-4da9-ab8f-1d6bb4e73d93;
 Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0005KR-RH
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0007SA-QQ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiF-00059e-47; Thu, 22 Oct 2020 17:45:15 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdil-0007J4-Gg
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:47 +0000
X-Inumbo-ID: a3e2e9d0-401e-4da9-ab8f-1d6bb4e73d93
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a3e2e9d0-401e-4da9-ab8f-1d6bb4e73d93;
	Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ntqiqHkBhbltgpOYvMT5RzXTVuOOnIgx7foXFuhot5c=; b=2iAOwRkuvPW0EZagl7nN9EmOth
	fYgb6YvbHkqltJgvB032wVCXk+SgeIcmILNyTSzp6sCwpCV7qZGG7BzlFHxHNq2p0/fQWCaa/D1E0
	Fr1hLOBwZ2ek6j0hsJE7X1HlC6Cb0ycgBO0dO7A+2gvlLuhm/APGHU9o7sDDnNEpkKg4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0005KR-RH
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0007SA-QQ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-00059e-47; Thu, 22 Oct 2020 17:45:15 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 06/16] PDU/MSW: Break out action_value()
Date: Thu, 22 Oct 2020 17:44:56 +0100
Message-Id: <20201022164506.1552-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is going to be useful in a moment.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-msw | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/pdu-msw b/pdu-msw
index 58c33952..03b0f342 100755
--- a/pdu-msw
+++ b/pdu-msw
@@ -121,13 +121,17 @@ sub show () {
     printf "pdu-msw $dnsname: #%s \"%s\" = %s\n", $useport, $usename, $mean;
 }
 
-sub set () {
+sub action_value () {
     my $delayadd= ($action =~ s/^delayed-// ? 3 : 0);
     my $valset= ($action =~ m/^(?:0|off)$/ ? 2 :
                  $action =~ m/^(?:1|on)$/ ? 1 :
                  $action =~ m/^(?:reboot)$/ ? 3 :
                  die "unknown action $action\n$usagemsg");
-        
+    return $valset;
+}
+
+sub set ($) {
+    my ($valset) = @_;
     my $res= $session->set_request(-varbindlist => [ $write_oid, INTEGER, $valset ]);
     die "SNMP set ".$session->error()." " unless $res;
 }
@@ -135,8 +139,9 @@ sub set () {
 if (!defined $action) {
     show();
 } else {
+    my $valset = action_value();
     print "was: "; show();
-    set();
+    set($valset);
     print "now: "; show();
     print "^ note, PDUs often do not update returned info immediately\n";
 }
-- 
2.20.1


