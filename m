Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB92866E2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3676.10689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9K-0000wZ-QS; Wed, 07 Oct 2020 18:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3676.10689; Wed, 07 Oct 2020 18:26:50 +0000
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
	id 1kQE9K-0000vs-MP; Wed, 07 Oct 2020 18:26:50 +0000
Received: by outflank-mailman (input) for mailman id 3676;
 Wed, 07 Oct 2020 18:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2v-00072Q-I7
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:13 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd8824be-dd5e-4d5c-867b-b0c62c0c400f;
 Wed, 07 Oct 2020 18:19:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjy-0007CF-Ob; Wed, 07 Oct 2020 19:00:38 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2v-00072Q-I7
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:13 +0000
X-Inumbo-ID: bd8824be-dd5e-4d5c-867b-b0c62c0c400f
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bd8824be-dd5e-4d5c-867b-b0c62c0c400f;
	Wed, 07 Oct 2020 18:19:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjy-0007CF-Ob; Wed, 07 Oct 2020 19:00:38 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 22/82] sg-run-job: Use +! in per-host-ts implementation
Date: Wed,  7 Oct 2020 18:59:24 +0100
Message-Id: <20201007180024.7932-23-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This makes this slightly clearer, even more so in a moment.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-run-job | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index 3ca725e7..3f44cae7 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -458,11 +458,10 @@ proc per-host-ts {iffail ident script args} {
     set awaitl {}
     foreach host $need_xen_hosts {
         set hostargs {}
-        if {![string compare $host host]} {
-            lappend hostargs + $host
-        } else {
-            lappend hostargs $host +
-        }
+	if {[string compare $host host]} {
+	    lappend hostargs +! $host
+	}
+	lappend hostargs + $host
         lappend awaitl [eval spawn-ts $iffail $ident $script $hostargs $args]
     }
 
-- 
2.20.1


