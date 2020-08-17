Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C424714B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7jnU-0004Wh-S9; Mon, 17 Aug 2020 18:23:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ScJ9=B3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k7jnT-0004Wc-G0
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:23:51 +0000
X-Inumbo-ID: be42de41-a33f-49ad-9d68-deeef73929e6
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be42de41-a33f-49ad-9d68-deeef73929e6;
 Mon, 17 Aug 2020 18:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597688630;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=8bvHg9Ok0+Yy7eN9kWcIBBh5lZqJ38ZCXhVXq8vAo40=;
 b=Q+9AIXFHnYOTdj4dceRdrTdPluEkPeebCcvoBQ3rgt5iE4nXNSqQURCL
 V/z5/IL0a+wKsUqc/D1wmrEJ9/ZLaKQHndgDmjhFki2RQw//oPhS1Oueu
 X+BqjKa4YFELGUq87pRvrh/lkF3uqqO41mNjEkDolP/wawy+TdmQa125N Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AUb69I8jDrSlvUyViuMAlnt9+mmzox4n8b4GFxqxI7Ij49Yo6G3Ugza6xr47NgjsELoez4LQns
 K93E74q2DlvEZNuBlZpt5dS84QO3fYCCOBi+/KQ23ShEgbujLlp/ZGt/ve7EBCFqmhTMvOMNzs
 +XtXK+64WJLny6UXUpEZuUNoztkEtdNPMABX/sKA3Qu8tctzSnqtsqx7qNAVOk3mLoBpvKvnsK
 T7qBp79jzxDRVkTcroI/dnF6zX/ML6dzOVu1H/ZIETmhcVuiYoQRF44F0GT9Si5tpTbYS4/Zis
 7t0=
X-SBRS: 2.7
X-MesageID: 25044707
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="25044707"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Ian Jackson
 <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/2] Tcl: Use tclsh8.6
Date: Mon, 17 Aug 2020 19:23:36 +0100
Message-ID: <20200817182337.29144-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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

This is needed to run on buster.

I have checked that tclsh8.6 and TclX works on osstest.test-lab.  TclX
seems to be provided by tcl8.4 but work with tcl8.6 (at least on
buster).

Deployment note: hosts running earlier Debian (including
osstest.xs.citrite.net, the Citrix Cambridge instance), may need
OSSTEST_DAEMON_TCLSH=tclsh8.4 or similar in ~/.xen-osstest/settings.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 README            | 2 +-
 mg-transient-task | 2 +-
 ms-ownerdaemon    | 2 +-
 ms-queuedaemon    | 2 +-
 ms-reportuptime   | 2 +-
 sg-execute-flight | 2 +-
 sg-run-job        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/README b/README
index 91793795..2804ecf3 100644
--- a/README
+++ b/README
@@ -291,7 +291,7 @@ To run osstest in standalone mode:
 
  - You need to install
      sqlite3
-     tcl8.5 tclx8.4 libsqlite3-tcl
+     tcl8.6 tclx8.4 libsqlite3-tcl
      libdbi-perl libdbd-sqlite3-perl
      pax rsync
      curl
diff --git a/mg-transient-task b/mg-transient-task
index ce5180ff..d707ce76 100755
--- a/mg-transient-task
+++ b/mg-transient-task
@@ -1,4 +1,4 @@
-#!/usr/bin/tclsh8.5
+#!/usr/bin/tclsh8.6
 # -*- Tcl -*- 
 # usage: ./mg-transient-task PROGRAM [ARGS...]
 
diff --git a/ms-ownerdaemon b/ms-ownerdaemon
index bf0b5952..4c33e93a 100755
--- a/ms-ownerdaemon
+++ b/ms-ownerdaemon
@@ -1,4 +1,4 @@
-#!/usr/bin/tclsh8.5
+#!/usr/bin/tclsh8.6
 # -*- Tcl -*- 
 # usage: ./ms-ownerdaemon  ... | logger
 
diff --git a/ms-queuedaemon b/ms-queuedaemon
index f02abf37..a3a009ca 100755
--- a/ms-queuedaemon
+++ b/ms-queuedaemon
@@ -1,4 +1,4 @@
-#!/usr/bin/tclsh8.5
+#!/usr/bin/tclsh8.6
 # -*- Tcl -*- 
 # usage: ./ms-queuedaemon  ... | logger
 
diff --git a/ms-reportuptime b/ms-reportuptime
index 804e563d..bcf79054 100755
--- a/ms-reportuptime
+++ b/ms-reportuptime
@@ -1,4 +1,4 @@
-#!/usr/bin/tclsh8.5
+#!/usr/bin/tclsh8.6
 # -*- Tcl -*- 
 # usage: ./ms-reportuptime
 
diff --git a/sg-execute-flight b/sg-execute-flight
index 02f63316..1b002cdd 100755
--- a/sg-execute-flight
+++ b/sg-execute-flight
@@ -1,4 +1,4 @@
-#!/usr/bin/tclsh8.5
+#!/usr/bin/tclsh8.6
 # -*- Tcl -*- 
 # usage: ./sg-execute-flight FLIGHT BLESSING
 
diff --git a/sg-run-job b/sg-run-job
index aa7953ac..df3d08d0 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -1,4 +1,4 @@
-#!/usr/bin/tclsh8.5
+#!/usr/bin/tclsh8.6
 # -*- Tcl -*-
 
 # This is part of "osstest", an automated testing framework for Xen.
-- 
2.11.0


