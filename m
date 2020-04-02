Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC619C7C4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 19:18:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK3Ta-0004Wi-G7; Thu, 02 Apr 2020 17:17:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nIMA=5S=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jK3TZ-0004Wa-EY
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 17:17:57 +0000
X-Inumbo-ID: e1f9e8f2-7505-11ea-83d8-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1f9e8f2-7505-11ea-83d8-bc764e2007e4;
 Thu, 02 Apr 2020 17:17:51 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jK3TT-0005Fa-4i; Thu, 02 Apr 2020 18:17:51 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 2/2] ts-logs-capture: Cope better with unbootable host
 (2)
Date: Thu,  2 Apr 2020 18:17:47 +0100
Message-Id: <20200402171747.4662-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200402171747.4662-1-ian.jackson@eu.citrix.com>
References: <20200402171747.4662-1-ian.jackson@eu.citrix.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

shutdown_guests might conceivably fail due to a flaky host.  In that
case we want not to declare the job broken so ts-logs-capture most not
fail.  But in that case we should skip fishing in-guest logs out of
guest fs's.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/ts-logs-capture b/ts-logs-capture
index 7940aece..0320a5a5 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -264,17 +264,23 @@ sub fetch_logs_guest ($) {
 }
 
 sub shutdown_guests () {
-    target_cmd_root($ho, <<'END', 180);
-        set -x
-        (
-            ( exec 2>/dev/null; sleep 30 ; echo y ) &
-            ( xl shutdown -a -F -w ; echo y ) &
-        ) | (
-            read x
-            xl list | awk '!/^Domain-0 |^Name / {print $2}' \
-            | xargs -t -r -n1 xl destroy ||:
-        )
+    if (!eval {
+	target_cmd_root($ho, <<'END', 180);
+	    set -x
+	    (
+		( exec 2>/dev/null; sleep 30 ; echo y ) &
+		( xl shutdown -a -F -w ; echo y ) &
+	    ) | (
+		read x
+		xl list | awk '!/^Domain-0 |^Name / {print $2}' \
+		| xargs -t -r -n1 xl destroy ||:
+	    )
 END
+    }) {
+	logm("cannot ensure no guests running, cannot fish their logs");
+	return 0;
+    }
+    return 1;
 }
 
 sub extract_logs_guest ($) {
@@ -297,7 +303,8 @@ fetch_xenctx_guest($_) foreach @guests;
 serial_fetch_logs($ho);
 if (fetch_logs_host()) {
     fetch_logs_guest($_) foreach @guests;
-    shutdown_guests();
-    extract_logs_guest($_) foreach @allguests;
+    if (shutdown_guests()) {
+	extract_logs_guest($_) foreach @allguests;
+    }
 }
 logm("logs captured to $stash");
-- 
2.11.0


