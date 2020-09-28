Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17727AED3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:13:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsxY-0004Do-4D; Mon, 28 Sep 2020 13:12:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkWq=DF=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kMsxW-0004DB-Qg
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:12:50 +0000
X-Inumbo-ID: 33c67fd4-73db-49e3-9666-bab5991a82f1
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33c67fd4-73db-49e3-9666-bab5991a82f1;
 Mon, 28 Sep 2020 13:12:45 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kMsxQ-0007vv-JG; Mon, 28 Sep 2020 14:12:44 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/5] daemonlib: Provide a "noop" command
Date: Mon, 28 Sep 2020 14:12:37 +0100
Message-Id: <20200928131241.30278-2-iwj@xenproject.org>
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

We are going to want clients to speak before waiting for the server
banner.  A noop command is useful for that.

Putting this here makes it apply to both ownerdaemon and queuedaemon.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 tcl/daemonlib.tcl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tcl/daemonlib.tcl b/tcl/daemonlib.tcl
index 1e86d5f4..747deab1 100644
--- a/tcl/daemonlib.tcl
+++ b/tcl/daemonlib.tcl
@@ -124,6 +124,10 @@ proc puts-chan {chan m} {
     puts $chan $m
 }
 
+proc cmd/noop {chan desc} {
+    puts-chan $chan "OK noop"
+}
+
 #---------- data ----------
 
 proc puts-chan-data {chan m data} {
-- 
2.20.1


