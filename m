Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB12517E3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXJu-00031u-Be; Tue, 25 Aug 2020 11:40:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXJs-00030H-H7
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:40:52 +0000
X-Inumbo-ID: 19ef2a7e-e253-44c5-86ed-a40e61b03976
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19ef2a7e-e253-44c5-86ed-a40e61b03976;
 Tue, 25 Aug 2020 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=UQrHws9+Gj61YGmU3rdj2iP+9quz3JW5H1z0XMLJwBM=;
 b=LcE0rbr2Fyj0KbfW9OOJK3r0zgyqcJdXgR3TPrFnAHDmbYppoTvfO5fh
 RhEOcQkkECTI5njZE8O2eIyz4w3bZ7RzLlKrsFbr+4DvdQZjZrA1R5CoX
 Q8q++SVoSZ0zP/VQPzbp4CVG7qGXbLxOv4A4uHV04skc1OSO3CgYXiXIW I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2RjV461DkSJwQDAAJMOlhPSc2qb1e9JxpnhDHi8Cm+slWLtPE8QMxQccG95aXn3WEw4REABaQF
 QJTnMXD76vUskGSTOZdoxMT5dUZvYQRAbO+yzv774S9ncKvwuNhjgD/mpfCfQWJe8G4ZxSRnDZ
 uNMBStyEXpPsdHabrQt1Q9f4WHziIP50HMllg0pTz6b7vkTTaE2mXu3xMqJ4ls5+k4b6rRmqmt
 56w7uq3rR31e+2LzhFB7xf55vzTR6Mut0Py2NTtmr/K+e8YXW3CQHEGgkrJ8WgcuvjoWw+U44t
 h2g=
X-SBRS: 2.7
X-MesageID: 25246373
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25246373"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 01/12] ms-queuedaemon: Update for newer Tcl's socket
 channel ids
Date: Tue, 25 Aug 2020 12:40:30 +0100
Message-ID: <20200825114041.16290-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
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

Now we have things like "sock55599edaf050" where previously we had
something like "sock142".  So the output is misaligned.

Bump the sizes.  And with these longer names, when showing the front
of the queue only print the full first entry and the start of the next
one.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ms-queuedaemon | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ms-queuedaemon b/ms-queuedaemon
index a3a009ca..dc858863 100755
--- a/ms-queuedaemon
+++ b/ms-queuedaemon
@@ -91,7 +91,7 @@ proc log-event {m} {
 proc log-state {m} {
     global need_queue_run queue
 
-    set lhs [format "N=%d Q=%d (%-15.15s) " \
+    set lhs [format "N=%d Q=%d (%-20.20s) " \
                  $need_queue_run [llength $queue] $queue]
 
     foreach-walker w {
@@ -99,13 +99,13 @@ proc log-state {m} {
 	if {[info exists queue_running]} {
 	    append lhs [format "R=%-3d " [llength $queue_running]]
 	    if {[info exists thinking]} {
-		append lhs [format "T=%-7s " $thinking]
+		append lhs [format "T=%-16s " $thinking]
 	    } else {
-		append lhs [format "          "]
+		append lhs [format "                   "]
 	    }
-	    append lhs [format "(%-15.15s) " $queue_running]
+	    append lhs [format "(%-20.20s) " $queue_running]
 	} else {
-	    append lhs "                                  "
+	    append lhs "                                                "
 	}
     }
 
-- 
2.20.1


