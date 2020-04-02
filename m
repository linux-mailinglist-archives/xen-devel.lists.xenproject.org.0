Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A319C7C5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 19:18:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK3TW-0004WL-7V; Thu, 02 Apr 2020 17:17:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nIMA=5S=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jK3TU-0004WG-Gb
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 17:17:52 +0000
X-Inumbo-ID: e1d9d0f8-7505-11ea-b4f4-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1d9d0f8-7505-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 17:17:51 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jK3TS-0005Fa-TZ; Thu, 02 Apr 2020 18:17:50 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 1/2] ts-logs-capture: Cope better with unbootable host
Date: Thu,  2 Apr 2020 18:17:46 +0100
Message-Id: <20200402171747.4662-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
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

If we cannot ssh to the host to fish out its own logs, do not try to
do any of the other log captures which involve ssh'ing to the host.

This includes {fetch,extract}_logs_guest, which tolerated this
situation - so then it's an optimisation.

But it also includes shutdown_guests, which was introduced in
c5f8d41143ab "ts-logs-capture: Fish some logs out of guest filesystem"
and is not tolerant enough.  Since that commit, unbootable hosts have
caused ts-logs-capture to wrongly declare jobs broken.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/ts-logs-capture b/ts-logs-capture
index c67856cd..7940aece 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -190,7 +190,7 @@ sub fetch_logs_host () {
             1;
         }) {
             logm("host reboot failed, abandoning log fetches: $@");
-            return;
+            return 0;
         }
 	try_fetch_logs($ho, $logs);
     }
@@ -219,6 +219,8 @@ sub fetch_logs_host () {
          ) {
             try_cmd_output_save($cmd);
         }
+
+    return 1;
 }
 
 sub fetch_xenctx_guest ($) {
@@ -293,8 +295,9 @@ power_state($ho,1);
 find_guests();
 fetch_xenctx_guest($_) foreach @guests;
 serial_fetch_logs($ho);
-fetch_logs_host();
-fetch_logs_guest($_) foreach @guests;
-shutdown_guests();
-extract_logs_guest($_) foreach @allguests;
+if (fetch_logs_host()) {
+    fetch_logs_guest($_) foreach @guests;
+    shutdown_guests();
+    extract_logs_guest($_) foreach @allguests;
+}
 logm("logs captured to $stash");
-- 
2.11.0


