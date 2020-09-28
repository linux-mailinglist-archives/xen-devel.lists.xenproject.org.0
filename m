Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1227AED6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:13:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsxi-0004Gi-LU; Mon, 28 Sep 2020 13:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkWq=DF=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kMsxg-0004DB-R5
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:13:00 +0000
X-Inumbo-ID: 625c183d-a0c0-400b-aced-525f919c6902
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 625c183d-a0c0-400b-aced-525f919c6902;
 Mon, 28 Sep 2020 13:12:46 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kMsxR-0007vv-PR; Mon, 28 Sep 2020 14:12:46 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/5] TCP fix: Do not wait for ownerdaemon to speak
Date: Mon, 28 Sep 2020 14:12:39 +0100
Message-Id: <20200928131241.30278-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928131241.30278-1-iwj@xenproject.org>
References: <20200928131241.30278-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 tcl/JobDB-Executive.tcl | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tcl/JobDB-Executive.tcl b/tcl/JobDB-Executive.tcl
index 29c82821..4fe85696 100644
--- a/tcl/JobDB-Executive.tcl
+++ b/tcl/JobDB-Executive.tcl
@@ -414,7 +414,20 @@ proc become-task {comment} {
 
     set ownerqueue [socket $c(OwnerDaemonHost) $c(OwnerDaemonPort)]
     fconfigure $ownerqueue -buffering line -translation lf
+
+    # TCP connections can get into a weird state where the client
+    # thinks the connection is open but the server has no record
+    # of it.  To avoid this, have the client speak without waiting
+    # for the server.  We tolerate "unknown command" errors so
+    # that it is not necessary to restart the ownerdaemon since
+    # that is very disruptive.
+    #
+    # See A TCP "stuck" connection mystery"
+    # https://www.evanjones.ca/tcp-stuck-connection-mystery.html
+    puts $ownerqueue noop
     must-gets $ownerqueue {^OK ms-ownerdaemon\M}
+    must-gets $ownerqueue {^OK noop|^ERROR unknown command}
+
     puts $ownerqueue create-task
     must-gets $ownerqueue {^OK created-task (\d+) (\w+ [\[\]:.0-9a-f]+)$} \
         taskid refinfo
-- 
2.20.1


