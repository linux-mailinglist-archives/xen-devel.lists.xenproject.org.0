Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06102286665
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3607.10335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDjz-0003sh-Ow; Wed, 07 Oct 2020 18:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3607.10335; Wed, 07 Oct 2020 18:00:39 +0000
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
	id 1kQDjz-0003sG-LI; Wed, 07 Oct 2020 18:00:39 +0000
Received: by outflank-mailman (input) for mailman id 3607;
 Wed, 07 Oct 2020 18:00:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDjx-0003r9-QR
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:37 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a773c96a-06a5-4cda-beea-6bc09cdd1efb;
 Wed, 07 Oct 2020 18:00:32 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjr-0007CF-ID; Wed, 07 Oct 2020 19:00:31 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDjx-0003r9-QR
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:37 +0000
X-Inumbo-ID: a773c96a-06a5-4cda-beea-6bc09cdd1efb
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a773c96a-06a5-4cda-beea-6bc09cdd1efb;
	Wed, 07 Oct 2020 18:00:32 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjr-0007CF-ID; Wed, 07 Oct 2020 19:00:31 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 01/82] ms-queuedaemon: Update for newer Tcl's socket channel ids
Date: Wed,  7 Oct 2020 18:59:03 +0100
Message-Id: <20201007180024.7932-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

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


