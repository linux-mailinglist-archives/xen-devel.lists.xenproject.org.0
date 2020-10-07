Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2082286714
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3739.11218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAv-0005TP-9D; Wed, 07 Oct 2020 18:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3739.11218; Wed, 07 Oct 2020 18:28:29 +0000
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
	id 1kQEAu-0005R2-QA; Wed, 07 Oct 2020 18:28:28 +0000
Received: by outflank-mailman (input) for mailman id 3739;
 Wed, 07 Oct 2020 18:28:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3y-00072Q-KE
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:18 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 086ee261-506d-4c6b-b4bd-b2f9e49e314b;
 Wed, 07 Oct 2020 18:20:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk5-0007CF-LX; Wed, 07 Oct 2020 19:00:45 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3y-00072Q-KE
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:18 +0000
X-Inumbo-ID: 086ee261-506d-4c6b-b4bd-b2f9e49e314b
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 086ee261-506d-4c6b-b4bd-b2f9e49e314b;
	Wed, 07 Oct 2020 18:20:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk5-0007CF-LX; Wed, 07 Oct 2020 19:00:45 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 49/82] host reuse: sg-run-job: per-host prep: Use @ for per-host-ts
Date: Wed,  7 Oct 2020 18:59:51 +0100
Message-Id: <20201007180024.7932-50-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

These are the steps that will be skipped when we reuse a test host.

No functional change yet since we don't allocate the host shared yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-run-job | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index 0b2e20e7..af43008d 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -25,9 +25,9 @@ readconfig
 source-method JobDB
 
 proc per-host-prep {} {
-    per-host-ts .       host-ping-check-native/@ ts-host-ping-check
-    per-host-ts .       xen-install/@     ts-xen-install
-    per-host-ts .       xen-boot/@        ts-host-reboot
+    per-host-ts @.      host-ping-check-native/@ ts-host-ping-check
+    per-host-ts @.      xen-install/@     ts-xen-install
+    per-host-ts @.      xen-boot/@        ts-host-reboot
 
     per-host-ts .       host-ping-check-xen/@ ts-host-ping-check
     per-host-ts .       =(*)            { ts-leak-check basis }
-- 
2.20.1


