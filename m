Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2628670E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3722.11154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAi-0004tW-3f; Wed, 07 Oct 2020 18:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3722.11154; Wed, 07 Oct 2020 18:28:15 +0000
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
	id 1kQEAh-0004pS-2x; Wed, 07 Oct 2020 18:28:15 +0000
Received: by outflank-mailman (input) for mailman id 3722;
 Wed, 07 Oct 2020 18:28:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE6d-00072Q-R8
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:03 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c9cc43c-0db9-422e-b8a7-5ebe7389db32;
 Wed, 07 Oct 2020 18:21:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk4-0007CF-J8; Wed, 07 Oct 2020 19:00:44 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE6d-00072Q-R8
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:03 +0000
X-Inumbo-ID: 7c9cc43c-0db9-422e-b8a7-5ebe7389db32
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7c9cc43c-0db9-422e-b8a7-5ebe7389db32;
	Wed, 07 Oct 2020 18:21:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk4-0007CF-J8; Wed, 07 Oct 2020 19:00:44 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 44/82] sg-run-job: New @ iffail tag for prep tasks
Date: Wed,  7 Oct 2020 18:59:46 +0100
Message-Id: <20201007180024.7932-45-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Currently no users sites, so no functional change.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 sg-run-job | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index 3f44cae7..a074cd42 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -223,12 +223,15 @@ proc recipe-flag {flagname {def 0}} {
 #
 #  IFFAIL can be
 #
-#           [-][!].
-#           [-][!]STATUS
+#           [@][-][!].
+#           [@][-][!]STATUS
 #
 #       where STATUS is the job/step status to be used if the step
 #       status is not as expected, and the special meanings are:
 #
+#           @      Only for per-host-ts: prefix each ident with @
+#                  to run this script only if the host is `prep'
+#                  and not if it is `ready'.
 #           -      for run-ts; suprresses exception on failure.
 #                  for per-host-ts; suppresses consequences of failure.
 #           !      Run this even if the job is being truncated.
@@ -452,8 +455,11 @@ proc reap-ts {reap {wantstatus pass}} {
 
 proc per-host-ts {iffail ident script args} {
     global ok truncate need_xen_hosts flight jobinfo
+
+    set isprep [lindex {{} @} [regsub {^\@} $iffail {} iffail]]
  
-    if {![iffail-check $iffail {$ok && !$truncate} iffail_status]} return
+    if {![iffail-check $iffail {$ok && !$truncate} iffail_status]} \
+	return
 
     set awaitl {}
     foreach host $need_xen_hosts {
@@ -461,7 +467,7 @@ proc per-host-ts {iffail ident script args} {
 	if {[string compare $host host]} {
 	    lappend hostargs +! $host
 	}
-	lappend hostargs + $host
+	lappend hostargs + $isprep$host
         lappend awaitl [eval spawn-ts $iffail $ident $script $hostargs $args]
     }
 
-- 
2.20.1


