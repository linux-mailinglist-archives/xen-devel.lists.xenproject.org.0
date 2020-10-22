Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3FB2962FC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10563.28153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiT-0007Ur-Iv; Thu, 22 Oct 2020 16:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10563.28153; Thu, 22 Oct 2020 16:45:29 +0000
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
	id 1kVdiT-0007TZ-Bx; Thu, 22 Oct 2020 16:45:29 +0000
Received: by outflank-mailman (input) for mailman id 10563;
 Thu, 22 Oct 2020 16:45:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdiR-0007J9-Uf
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa7c4406-f7f6-42b8-8760-d03d6f623f99;
 Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiH-0005Kl-LN
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiH-0007TI-Kb
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiF-00059e-TV; Thu, 22 Oct 2020 17:45:15 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdiR-0007J9-Uf
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:27 +0000
X-Inumbo-ID: fa7c4406-f7f6-42b8-8760-d03d6f623f99
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa7c4406-f7f6-42b8-8760-d03d6f623f99;
	Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=8uGskAcKrvh3idP+a9aM9+Bc0CPtEtIIFIHW822S8R4=; b=j31a3kr2aW1B4s4Ac5mX/Fkyco
	wY9Er0fLXxa2T9Hngjiek6YcNHKvO0x05IrTlPXmJWHLjwlGvEvpIrF5jKCGy0lKHsnCRZjx0tuP3
	iz9A1BhmFqYJqb3H9HK4yjgptZiY6S92SmjGFjGzM8yaXyw2p6zLn2AyrEJDzZ2XMGV8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-0005Kl-LN
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-0007TI-Kb
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-00059e-TV; Thu, 22 Oct 2020 17:45:15 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 09/16] PDU/MSU: Retransmit on/off until PDU has changed
Date: Thu, 22 Oct 2020 17:44:59 +0100
Message-Id: <20201022164506.1552-10-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main effect of this is that the transcript will actually show the
new PDU state.  Previously we would call show(), but APC PDUs would
normally not change immediately, so the transcript would show the old
state.

This also guards against an unresponsive PDU or a packet getting lost.
I don't think we have ever seen that.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-msw | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/pdu-msw b/pdu-msw
index 2d4ec967..c57f9f7c 100755
--- a/pdu-msw
+++ b/pdu-msw
@@ -41,6 +41,7 @@ while (@ARGV && $ARGV[0] =~ m/^-/) {
 
 if (@ARGV<2 || @ARGV>3 || $ARGV[0] =~ m/^-/) { die "bad usage\n$usagemsg"; }
 
+our ($max_retries) = 16; # timeout = 0.05 * max_retries^2
 our ($dnsname,$outlet,$action) = @ARGV;
 
 my ($session,$error) = Net::SNMP->session(
@@ -142,7 +143,21 @@ if (!defined $action) {
 } else {
     my $valset = action_value();
     print "was: "; show();
-    set($valset);
-    print "now: "; show();
-    print "^ note, PDUs often do not update returned info immediately\n";
+
+    my $retries = 0;
+    for (;;) {
+	set($valset);
+	sleep $retries * 0.1;
+	print "now: "; my $got = show();
+	if ($got eq $map[$valset]) { last; }
+	if ($map[$valset] !~ m{^(?:off|on)$}) {
+	    print
+ "^ note, PDUs often do not update returned info immediately\n";
+	    last;
+	}
+	if ($retries >= $max_retries) {
+	    die "PDU does not seem to be changing state!\n";
+	}
+	$retries++;
+    }
 }
-- 
2.20.1


