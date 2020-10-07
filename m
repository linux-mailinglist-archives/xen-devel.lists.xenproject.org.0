Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4634A2866EA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3685.10794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9Y-0001V6-0i; Wed, 07 Oct 2020 18:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3685.10794; Wed, 07 Oct 2020 18:27:03 +0000
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
	id 1kQE9X-0001Se-6E; Wed, 07 Oct 2020 18:27:03 +0000
Received: by outflank-mailman (input) for mailman id 3685;
 Wed, 07 Oct 2020 18:26:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE6Y-00072Q-R6
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:58 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5464f8f2-40d0-4839-aaf7-929c5b0cc9f0;
 Wed, 07 Oct 2020 18:21:45 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjy-0007CF-Gd; Wed, 07 Oct 2020 19:00:38 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE6Y-00072Q-R6
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:58 +0000
X-Inumbo-ID: 5464f8f2-40d0-4839-aaf7-929c5b0cc9f0
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5464f8f2-40d0-4839-aaf7-929c5b0cc9f0;
	Wed, 07 Oct 2020 18:21:45 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjy-0007CF-Gd; Wed, 07 Oct 2020 19:00:38 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 21/82] sg-run-job: support +! for *only* adding things to TESTID
Date: Wed,  7 Oct 2020 18:59:23 +0100
Message-Id: <20201007180024.7932-22-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-run-job | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sg-run-job b/sg-run-job
index 702ed558..3ca725e7 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -277,6 +277,10 @@ proc recipe-flag {flagname {def 0}} {
 #       subsequent items in SCRIPT-ARGS are added to the expansion of
 #       /@ in TESTID.  (The "+" itself is not added to the arguments
 #       or the testid.)
+#
+#       An argument which is precisely "+!" specifies that the
+#       subsequent items in SCRIPT-ARGS are to be _only_ added to
+#       the expansion of /@ in TESTID, until the next "+".
 
 proc run-ts {iffail args} {
     set wantstatus pass
@@ -343,7 +347,11 @@ proc spawn-ts {iffail testid args} {
             set adding [expr {!$adding}]
             continue
         }
-        lappend real_args $arg
+	if {![string compare +! $arg]} {
+	    set adding -1
+	    continue
+	}
+        if {$adding>=0} { lappend real_args $arg }
         if {$adding} { lappend testid_args $arg }
     }
 
-- 
2.20.1


