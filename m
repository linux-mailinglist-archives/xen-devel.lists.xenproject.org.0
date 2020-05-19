Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5D1DA056
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7Ve-0004Yk-7c; Tue, 19 May 2020 19:02:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7Vc-0004Yf-6a
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:02:36 +0000
X-Inumbo-ID: 4ccb2c46-9a03-11ea-b07b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ccb2c46-9a03-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 19:02:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Va-0001da-Qf; Tue, 19 May 2020 20:02:34 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 01/38] ts-logs-capture: Cope if xl shutdown leaves
 domain running for a bit
Date: Tue, 19 May 2020 20:01:53 +0100
Message-Id: <20200519190230.29519-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This seems mostly to affect buster but it could in principle affect
earlier releases too I think.

In principle it would be nice to fix this bug, and to have a proper
test for it, but a reliable test is hard and an unreliable one is not
useful.  So I guess we are going to have this workaround
indefinitely...

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-logs-capture b/ts-logs-capture
index 0320a5a5..d75a2fda 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -272,6 +272,7 @@ sub shutdown_guests () {
 		( xl shutdown -a -F -w ; echo y ) &
 	    ) | (
 		read x
+		sleep 10 # xl shutdown is a bit racy :-/
 		xl list | awk '!/^Domain-0 |^Name / {print $2}' \
 		| xargs -t -r -n1 xl destroy ||:
 	    )
-- 
2.20.1


