Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F083827AED4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:13:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsxd-0004Eh-C3; Mon, 28 Sep 2020 13:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkWq=DF=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kMsxb-0004DB-Qt
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:12:55 +0000
X-Inumbo-ID: 71dbab40-fd75-45a1-9145-7c6ffc6a0c87
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71dbab40-fd75-45a1-9145-7c6ffc6a0c87;
 Mon, 28 Sep 2020 13:12:46 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kMsxQ-0007vv-QS; Mon, 28 Sep 2020 14:12:44 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/5] TCP fix: Do not wait for queuedaemon to speak
Date: Mon, 28 Sep 2020 14:12:38 +0100
Message-Id: <20200928131241.30278-3-iwj@xenproject.org>
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

This depends on the preceding daemonlib patch and an ms-queuedaemon
restart.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 61a99bc3..80e70070 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -643,7 +643,16 @@ sub tcpconnect_queuedaemon () {
     my $qserv= tcpconnect($c{QueueDaemonHost}, $c{QueueDaemonPort});
     $qserv->autoflush(1);
 
+    # TCP connections can get into a weird state where the client
+    # thinks the connection is open but the server has no record
+    # of it.  To avoid this, have the client speak without waiting
+    # for the server.
+    #
+    # See A TCP "stuck" connection mystery"
+    # https://www.evanjones.ca/tcp-stuck-connection-mystery.html
+    print $qserv "noop\n";
     $_= <$qserv>;  defined && m/^OK ms-queuedaemon\s/ or die "$_?";
+    $_= <$qserv>;  defined && m/^OK noop\s/ or die "$_?";
 
     return $qserv;
 }
-- 
2.20.1


